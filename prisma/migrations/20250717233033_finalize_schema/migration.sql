/*
  Warnings:

  - You are about to drop the column `subFunctionId` on the `capabilities_saep` table. All the data in the column will be lost.
  - Added the required column `tipo` to the `capabilities` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "capabilities" DROP CONSTRAINT "capabilities_subFunctionId_fkey";

-- DropForeignKey
ALTER TABLE "capabilities_saep" DROP CONSTRAINT "capabilities_saep_subFunctionId_fkey";

-- DropIndex
DROP INDEX "capabilities_subFunctionId_idx";

-- DropIndex
DROP INDEX "capabilities_saep_subFunctionId_idx";

-- AlterTable
ALTER TABLE "capabilities" ADD COLUMN     "tipo" "Tipo" NOT NULL,
ALTER COLUMN "subFunctionId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "capabilities_saep" DROP COLUMN "subFunctionId";

-- CreateTable
CREATE TABLE "capabilitySaep_functions_subFunctions" (
    "capabilitySaepId" INTEGER NOT NULL,
    "functionId" INTEGER NOT NULL,
    "subFunctionId" INTEGER NOT NULL,

    CONSTRAINT "capabilitySaep_functions_subFunctions_pkey" PRIMARY KEY ("capabilitySaepId","functionId","subFunctionId")
);

-- CreateTable
CREATE TABLE "capabilities_sub_functions_performance_standard" (
    "capabilityId" INTEGER NOT NULL,
    "performanceStandardId" INTEGER NOT NULL,
    "subFunctionId" INTEGER NOT NULL,

    CONSTRAINT "capabilities_sub_functions_performance_standard_pkey" PRIMARY KEY ("capabilityId","performanceStandardId","subFunctionId")
);

-- CreateIndex
CREATE INDEX "capabilitySaep_functions_subFunctions_functionId_subFunctio_idx" ON "capabilitySaep_functions_subFunctions"("functionId", "subFunctionId");

-- CreateIndex
CREATE INDEX "capabilities_sub_functions_performance_standard_performance_idx" ON "capabilities_sub_functions_performance_standard"("performanceStandardId", "subFunctionId");

-- AddForeignKey
ALTER TABLE "capabilities" ADD CONSTRAINT "capabilities_subFunctionId_fkey" FOREIGN KEY ("subFunctionId") REFERENCES "sub_functions"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilitySaep_functions_subFunctions" ADD CONSTRAINT "capabilitySaep_functions_subFunctions_capabilitySaepId_fkey" FOREIGN KEY ("capabilitySaepId") REFERENCES "capabilities_saep"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilitySaep_functions_subFunctions" ADD CONSTRAINT "capabilitySaep_functions_subFunctions_functionId_fkey" FOREIGN KEY ("functionId") REFERENCES "functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilitySaep_functions_subFunctions" ADD CONSTRAINT "capabilitySaep_functions_subFunctions_subFunctionId_fkey" FOREIGN KEY ("subFunctionId") REFERENCES "sub_functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilities_sub_functions_performance_standard" ADD CONSTRAINT "capabilities_sub_functions_performance_standard_capability_fkey" FOREIGN KEY ("capabilityId") REFERENCES "capabilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilities_sub_functions_performance_standard" ADD CONSTRAINT "capabilities_sub_functions_performance_standard_performanc_fkey" FOREIGN KEY ("performanceStandardId") REFERENCES "performance_standards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilities_sub_functions_performance_standard" ADD CONSTRAINT "capabilities_sub_functions_performance_standard_subFunctio_fkey" FOREIGN KEY ("subFunctionId") REFERENCES "sub_functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;
