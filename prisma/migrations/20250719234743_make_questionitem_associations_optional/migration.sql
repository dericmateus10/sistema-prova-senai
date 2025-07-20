-- AlterTable
ALTER TABLE "question_items" ADD COLUMN     "capabilityId" INTEGER,
ALTER COLUMN "capabilitySaepId" DROP NOT NULL,
ALTER COLUMN "functionId" DROP NOT NULL,
ALTER COLUMN "subFunctionId" DROP NOT NULL,
ALTER COLUMN "performanceStandardId" DROP NOT NULL;

-- CreateIndex
CREATE INDEX "question_items_capabilityId_idx" ON "question_items"("capabilityId");

-- AddForeignKey
ALTER TABLE "question_items" ADD CONSTRAINT "question_items_capabilityId_fkey" FOREIGN KEY ("capabilityId") REFERENCES "capabilities"("id") ON DELETE CASCADE ON UPDATE CASCADE;
