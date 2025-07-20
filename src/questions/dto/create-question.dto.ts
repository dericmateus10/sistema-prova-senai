import { Dificuldade } from '@prisma/client';

export class CreateAlternativeDto {
  textMd: string;
  isCorrect: boolean;
  attachments?: CreateAttachmentDto[];
}

export class CreateAttachmentDto {
  type: string;
  url: string;
  captionMd?: string;
  order?: number;
}

export class CreateQuestionDto {
  textMd: string;
  contextMd: string;
  commandMd: string;
  difficulty?: Dificuldade = Dificuldade.MEDIO;

  // Relações opcionais
  capabilitySaepId?: number;
  capabilityId?: number;
  functionId?: number;
  subFunctionId?: number;
  performanceStandardId?: number;

  // Arrays relacionados
  knowledgeIds?: number[];
  alternatives: CreateAlternativeDto[];
  attachments?: CreateAttachmentDto[];
}
