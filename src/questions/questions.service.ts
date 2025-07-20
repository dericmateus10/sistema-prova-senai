import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { CreateQuestionDto } from './dto/create-question.dto';
import { UpdateQuestionDto } from './dto/update-question.dto';
import { QuestionItem } from '@prisma/client';

@Injectable()
export class QuestionsService {
  constructor(private prisma: PrismaService) {}

  async create(createQuestionDto: CreateQuestionDto): Promise<QuestionItem> {
    const { knowledgeIds, alternatives, attachments, ...questionData } =
      createQuestionDto;

    return this.prisma.$transaction(async (prisma) => {
      // Criar a pergunta principal
      const question = await prisma.questionItem.create({
        data: {
          ...questionData,
          alternatives: {
            create: alternatives.map((alt) => ({
              textMd: alt.textMd,
              isCorrect: alt.isCorrect,
              attachments: alt.attachments
                ? {
                    create: alt.attachments.map((att) => ({
                      type: att.type,
                      url: att.url,
                      captionMd: att.captionMd,
                      order: att.order || 0,
                    })),
                  }
                : undefined,
            })),
          },
          attachments: attachments
            ? {
                create: attachments.map((att) => ({
                  type: att.type,
                  url: att.url,
                  captionMd: att.captionMd,
                  order: att.order || 0,
                })),
              }
            : undefined,
        },
        include: {
          alternatives: {
            include: {
              attachments: true,
            },
          },
          attachments: true,
          knowledgeLinks: {
            include: {
              knowledge: true,
            },
          },
          capabilitySaep: true,
          capability: true,
          function: true,
          subFunction: true,
          performanceStandard: true,
        },
      });

      // Criar relações com conhecimentos se fornecidos
      if (knowledgeIds && knowledgeIds.length > 0) {
        await prisma.questionKnowledge.createMany({
          data: knowledgeIds.map((knowledgeId) => ({
            questionItemId: question.id,
            knowledgeId,
          })),
        });
      }

      return question;
    });
  }

  async findAll(): Promise<QuestionItem[]> {
    return this.prisma.questionItem.findMany({
      include: {
        alternatives: {
          include: {
            attachments: true,
          },
        },
        attachments: true,
        knowledgeLinks: {
          include: {
            knowledge: true,
          },
        },
        capabilitySaep: true,
        capability: true,
        function: true,
        subFunction: true,
        performanceStandard: true,
      },
    });
  }

  async findOne(id: number): Promise<QuestionItem> {
    const question = await this.prisma.questionItem.findUnique({
      where: { id },
      include: {
        alternatives: {
          include: {
            attachments: true,
          },
        },
        attachments: true,
        knowledgeLinks: {
          include: {
            knowledge: true,
          },
        },
        capabilitySaep: true,
        capability: true,
        function: true,
        subFunction: true,
        performanceStandard: true,
      },
    });

    if (!question) {
      throw new NotFoundException(`Pergunta com ID ${id} não encontrada`);
    }

    return question;
  }

  async update(
    id: number,
    updateQuestionDto: UpdateQuestionDto,
  ): Promise<QuestionItem> {
    await this.findOne(id); // Validate question exists

    const { knowledgeIds, alternatives, attachments, ...questionData } =
      updateQuestionDto;

    return this.prisma.$transaction(async (prisma) => {
      // Atualizar a pergunta principal
      const updatedQuestion = await prisma.questionItem.update({
        where: { id },
        data: {
          ...questionData,
          alternatives: alternatives
            ? {
                deleteMany: {},
                create: alternatives.map((alt) => ({
                  textMd: alt.textMd,
                  isCorrect: alt.isCorrect,
                  attachments: alt.attachments
                    ? {
                        create: alt.attachments.map((att) => ({
                          type: att.type,
                          url: att.url,
                          captionMd: att.captionMd,
                          order: att.order || 0,
                        })),
                      }
                    : undefined,
                })),
              }
            : undefined,
          attachments: attachments
            ? {
                deleteMany: {},
                create: attachments.map((att) => ({
                  type: att.type,
                  url: att.url,
                  captionMd: att.captionMd,
                  order: att.order || 0,
                })),
              }
            : undefined,
        },
        include: {
          alternatives: {
            include: {
              attachments: true,
            },
          },
          attachments: true,
          knowledgeLinks: {
            include: {
              knowledge: true,
            },
          },
          capabilitySaep: true,
          capability: true,
          function: true,
          subFunction: true,
          performanceStandard: true,
        },
      });

      // Atualizar relações com conhecimentos se fornecidos
      if (knowledgeIds !== undefined) {
        await prisma.questionKnowledge.deleteMany({
          where: { questionItemId: id },
        });

        if (knowledgeIds.length > 0) {
          await prisma.questionKnowledge.createMany({
            data: knowledgeIds.map((knowledgeId) => ({
              questionItemId: id,
              knowledgeId,
            })),
          });
        }
      }

      return updatedQuestion;
    });
  }

  async remove(id: number): Promise<void> {
    await this.findOne(id); // Validate question exists

    await this.prisma.questionItem.delete({
      where: { id },
    });
  }

  async findByCapability(capabilityId: number): Promise<QuestionItem[]> {
    return this.prisma.questionItem.findMany({
      where: { capabilityId },
      include: {
        alternatives: {
          include: {
            attachments: true,
          },
        },
        attachments: true,
        knowledgeLinks: {
          include: {
            knowledge: true,
          },
        },
        capabilitySaep: true,
        capability: true,
        function: true,
        subFunction: true,
        performanceStandard: true,
      },
    });
  }

  async findByDifficulty(
    difficulty: 'FACIL' | 'MEDIO' | 'DIFICIL',
  ): Promise<QuestionItem[]> {
    return this.prisma.questionItem.findMany({
      where: { difficulty },
      include: {
        alternatives: {
          include: {
            attachments: true,
          },
        },
        attachments: true,
        knowledgeLinks: {
          include: {
            knowledge: true,
          },
        },
        capabilitySaep: true,
        capability: true,
        function: true,
        subFunction: true,
        performanceStandard: true,
      },
    });
  }
}
