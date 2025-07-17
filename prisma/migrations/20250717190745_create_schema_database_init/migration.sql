-- CreateEnum
CREATE TYPE "Tipo" AS ENUM ('BASICA', 'TECNICA');

-- CreateTable
CREATE TABLE "courses" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "courses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "modules" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "modules_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ucs" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "courseId" INTEGER NOT NULL,
    "moduleId" INTEGER NOT NULL,

    CONSTRAINT "ucs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bloom_taxonomies" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "examples" TEXT,

    CONSTRAINT "bloom_taxonomies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "capabilities_saep" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "bloomTaxonomyId" INTEGER NOT NULL,
    "ucId" INTEGER NOT NULL,
    "tipo" "Tipo" NOT NULL,

    CONSTRAINT "capabilities_saep_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "functions" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "functions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sub_functions" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "functionId" INTEGER NOT NULL,

    CONSTRAINT "sub_functions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "performance_standards" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "subFunctionId" INTEGER NOT NULL,

    CONSTRAINT "performance_standards_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "knowledge" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "examples" TEXT,

    CONSTRAINT "knowledge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "capabilities" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "bloomTaxonomyId" INTEGER NOT NULL,
    "ucId" INTEGER NOT NULL,
    "capabilitySaepId" INTEGER,

    CONSTRAINT "capabilities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "capability_knowledge" (
    "capabilityId" INTEGER NOT NULL,
    "knowledgeId" INTEGER NOT NULL,

    CONSTRAINT "capability_knowledge_pkey" PRIMARY KEY ("capabilityId","knowledgeId")
);

-- CreateIndex
CREATE INDEX "ucs_courseId_idx" ON "ucs"("courseId");

-- CreateIndex
CREATE INDEX "ucs_moduleId_idx" ON "ucs"("moduleId");

-- CreateIndex
CREATE INDEX "capabilities_saep_bloomTaxonomyId_idx" ON "capabilities_saep"("bloomTaxonomyId");

-- CreateIndex
CREATE INDEX "capabilities_saep_ucId_idx" ON "capabilities_saep"("ucId");

-- CreateIndex
CREATE INDEX "sub_functions_functionId_idx" ON "sub_functions"("functionId");

-- CreateIndex
CREATE INDEX "performance_standards_subFunctionId_idx" ON "performance_standards"("subFunctionId");

-- CreateIndex
CREATE INDEX "capabilities_bloomTaxonomyId_idx" ON "capabilities"("bloomTaxonomyId");

-- CreateIndex
CREATE INDEX "capabilities_ucId_idx" ON "capabilities"("ucId");

-- CreateIndex
CREATE INDEX "capabilities_capabilitySaepId_idx" ON "capabilities"("capabilitySaepId");

-- CreateIndex
CREATE INDEX "capability_knowledge_knowledgeId_idx" ON "capability_knowledge"("knowledgeId");

-- AddForeignKey
ALTER TABLE "ucs" ADD CONSTRAINT "ucs_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ucs" ADD CONSTRAINT "ucs_moduleId_fkey" FOREIGN KEY ("moduleId") REFERENCES "modules"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilities_saep" ADD CONSTRAINT "capabilities_saep_bloomTaxonomyId_fkey" FOREIGN KEY ("bloomTaxonomyId") REFERENCES "bloom_taxonomies"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilities_saep" ADD CONSTRAINT "capabilities_saep_ucId_fkey" FOREIGN KEY ("ucId") REFERENCES "ucs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sub_functions" ADD CONSTRAINT "sub_functions_functionId_fkey" FOREIGN KEY ("functionId") REFERENCES "functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "performance_standards" ADD CONSTRAINT "performance_standards_subFunctionId_fkey" FOREIGN KEY ("subFunctionId") REFERENCES "sub_functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilities" ADD CONSTRAINT "capabilities_bloomTaxonomyId_fkey" FOREIGN KEY ("bloomTaxonomyId") REFERENCES "bloom_taxonomies"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilities" ADD CONSTRAINT "capabilities_ucId_fkey" FOREIGN KEY ("ucId") REFERENCES "ucs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilities" ADD CONSTRAINT "capabilities_capabilitySaepId_fkey" FOREIGN KEY ("capabilitySaepId") REFERENCES "capabilities_saep"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capability_knowledge" ADD CONSTRAINT "capability_knowledge_capabilityId_fkey" FOREIGN KEY ("capabilityId") REFERENCES "capabilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capability_knowledge" ADD CONSTRAINT "capability_knowledge_knowledgeId_fkey" FOREIGN KEY ("knowledgeId") REFERENCES "knowledge"("id") ON DELETE CASCADE ON UPDATE CASCADE;
