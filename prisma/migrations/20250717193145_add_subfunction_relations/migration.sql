/*
  Warnings:

  - Added the required column `subFunctionId` to the `capabilities` table without a default value. This is not possible if the table is not empty.
  - Added the required column `subFunctionId` to the `capabilities_saep` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "capabilities" ADD COLUMN     "subFunctionId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "capabilities_saep" ADD COLUMN     "subFunctionId" INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX "capabilities_subFunctionId_idx" ON "capabilities"("subFunctionId");

-- CreateIndex
CREATE INDEX "capabilities_saep_subFunctionId_idx" ON "capabilities_saep"("subFunctionId");

-- AddForeignKey
ALTER TABLE "capabilities_saep" ADD CONSTRAINT "capabilities_saep_subFunctionId_fkey" FOREIGN KEY ("subFunctionId") REFERENCES "sub_functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capabilities" ADD CONSTRAINT "capabilities_subFunctionId_fkey" FOREIGN KEY ("subFunctionId") REFERENCES "sub_functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;
