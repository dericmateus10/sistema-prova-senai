-- CreateEnum
CREATE TYPE "Dificuldade" AS ENUM ('FACIL', 'MEDIO', 'DIFICIL');

-- CreateTable
CREATE TABLE "question_items" (
    "id" SERIAL NOT NULL,
    "textMd" TEXT NOT NULL,
    "contextMd" TEXT NOT NULL,
    "commandMd" TEXT NOT NULL,
    "difficulty" "Dificuldade" NOT NULL DEFAULT 'MEDIO',
    "capabilitySaepId" INTEGER NOT NULL,
    "functionId" INTEGER NOT NULL,
    "subFunctionId" INTEGER NOT NULL,
    "performanceStandardId" INTEGER NOT NULL,

    CONSTRAINT "question_items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "question_knowledge" (
    "questionItemId" INTEGER NOT NULL,
    "knowledgeId" INTEGER NOT NULL,

    CONSTRAINT "question_knowledge_pkey" PRIMARY KEY ("questionItemId","knowledgeId")
);

-- CreateTable
CREATE TABLE "alternatives" (
    "id" SERIAL NOT NULL,
    "questionItemId" INTEGER NOT NULL,
    "textMd" TEXT NOT NULL,
    "isCorrect" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "alternatives_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attachments" (
    "id" SERIAL NOT NULL,
    "questionItemId" INTEGER,
    "alternativeId" INTEGER,
    "type" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "captionMd" TEXT,
    "order" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "attachments_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "question_items_capabilitySaepId_idx" ON "question_items"("capabilitySaepId");

-- CreateIndex
CREATE INDEX "question_items_functionId_idx" ON "question_items"("functionId");

-- CreateIndex
CREATE INDEX "question_items_subFunctionId_idx" ON "question_items"("subFunctionId");

-- CreateIndex
CREATE INDEX "question_items_performanceStandardId_idx" ON "question_items"("performanceStandardId");

-- CreateIndex
CREATE INDEX "question_knowledge_knowledgeId_idx" ON "question_knowledge"("knowledgeId");

-- CreateIndex
CREATE INDEX "alternatives_questionItemId_idx" ON "alternatives"("questionItemId");

-- CreateIndex
CREATE INDEX "attachments_questionItemId_idx" ON "attachments"("questionItemId");

-- CreateIndex
CREATE INDEX "attachments_alternativeId_idx" ON "attachments"("alternativeId");

-- AddForeignKey
ALTER TABLE "question_items" ADD CONSTRAINT "question_items_capabilitySaepId_fkey" FOREIGN KEY ("capabilitySaepId") REFERENCES "capabilities_saep"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "question_items" ADD CONSTRAINT "question_items_functionId_fkey" FOREIGN KEY ("functionId") REFERENCES "functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "question_items" ADD CONSTRAINT "question_items_subFunctionId_fkey" FOREIGN KEY ("subFunctionId") REFERENCES "sub_functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "question_items" ADD CONSTRAINT "question_items_performanceStandardId_fkey" FOREIGN KEY ("performanceStandardId") REFERENCES "performance_standards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "question_knowledge" ADD CONSTRAINT "question_knowledge_questionItemId_fkey" FOREIGN KEY ("questionItemId") REFERENCES "question_items"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "question_knowledge" ADD CONSTRAINT "question_knowledge_knowledgeId_fkey" FOREIGN KEY ("knowledgeId") REFERENCES "knowledge"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alternatives" ADD CONSTRAINT "alternatives_questionItemId_fkey" FOREIGN KEY ("questionItemId") REFERENCES "question_items"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attachments" ADD CONSTRAINT "attachments_questionItemId_fkey" FOREIGN KEY ("questionItemId") REFERENCES "question_items"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attachments" ADD CONSTRAINT "attachments_alternativeId_fkey" FOREIGN KEY ("alternativeId") REFERENCES "alternatives"("id") ON DELETE CASCADE ON UPDATE CASCADE;
