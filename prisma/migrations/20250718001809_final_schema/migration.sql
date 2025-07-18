/*
  Warnings:

  - You are about to drop the column `subFunctionId` on the `capabilities` table. All the data in the column will be lost.
  - You are about to drop the column `ucId` on the `capabilities_saep` table. All the data in the column will be lost.
  - You are about to drop the `capabilitySaep_functions_subFunctions` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "capabilities" DROP CONSTRAINT "capabilities_subFunctionId_fkey";

-- DropForeignKey
ALTER TABLE "capabilities_saep" DROP CONSTRAINT "capabilities_saep_ucId_fkey";

-- DropForeignKey
ALTER TABLE "capabilitySaep_functions_subFunctions" DROP CONSTRAINT "capabilitySaep_functions_subFunctions_capabilitySaepId_fkey";

-- DropForeignKey
ALTER TABLE "capabilitySaep_functions_subFunctions" DROP CONSTRAINT "capabilitySaep_functions_subFunctions_functionId_fkey";

-- DropForeignKey
ALTER TABLE "capabilitySaep_functions_subFunctions" DROP CONSTRAINT "capabilitySaep_functions_subFunctions_subFunctionId_fkey";

-- DropIndex
DROP INDEX "capabilities_saep_ucId_idx";

-- AlterTable
ALTER TABLE "capabilities" DROP COLUMN "subFunctionId";

-- AlterTable
ALTER TABLE "capabilities_saep" DROP COLUMN "ucId";

-- DropTable
DROP TABLE "capabilitySaep_functions_subFunctions";

-- CreateTable
CREATE TABLE "capability_saep_uc" (
    "capabilitySaepId" INTEGER NOT NULL,
    "ucId" INTEGER NOT NULL,

    CONSTRAINT "capability_saep_uc_pkey" PRIMARY KEY ("capabilitySaepId","ucId")
);

-- CreateTable
CREATE TABLE "capability_saep_functions_sub_functions" (
    "capabilitySaepId" INTEGER NOT NULL,
    "functionId" INTEGER NOT NULL,
    "subFunctionId" INTEGER NOT NULL,

    CONSTRAINT "capability_saep_functions_sub_functions_pkey" PRIMARY KEY ("capabilitySaepId","functionId","subFunctionId")
);

-- CreateIndex
CREATE INDEX "capability_saep_uc_ucId_idx" ON "capability_saep_uc"("ucId");

-- CreateIndex
CREATE INDEX "capability_saep_functions_sub_functions_functionId_subFunct_idx" ON "capability_saep_functions_sub_functions"("functionId", "subFunctionId");

-- AddForeignKey
ALTER TABLE "capability_saep_uc" ADD CONSTRAINT "capability_saep_uc_capabilitySaepId_fkey" FOREIGN KEY ("capabilitySaepId") REFERENCES "capabilities_saep"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capability_saep_uc" ADD CONSTRAINT "capability_saep_uc_ucId_fkey" FOREIGN KEY ("ucId") REFERENCES "ucs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capability_saep_functions_sub_functions" ADD CONSTRAINT "capability_saep_functions_sub_functions_capabilitySaepId_fkey" FOREIGN KEY ("capabilitySaepId") REFERENCES "capabilities_saep"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capability_saep_functions_sub_functions" ADD CONSTRAINT "capability_saep_functions_sub_functions_functionId_fkey" FOREIGN KEY ("functionId") REFERENCES "functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capability_saep_functions_sub_functions" ADD CONSTRAINT "capability_saep_functions_sub_functions_subFunctionId_fkey" FOREIGN KEY ("subFunctionId") REFERENCES "sub_functions"("id") ON DELETE CASCADE ON UPDATE CASCADE;
