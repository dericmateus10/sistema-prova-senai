/*
  Warnings:

  - The primary key for the `capabilities_sub_functions_performance_standard` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `capability_knowledge` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `capability_saep_functions_sub_functions` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `capability_saep_uc` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `question_knowledge` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "capabilities_sub_functions_performance_standard" DROP CONSTRAINT "capabilities_sub_functions_performance_standard_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "capabilities_sub_functions_performance_standard_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "capability_knowledge" DROP CONSTRAINT "capability_knowledge_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "capability_knowledge_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "capability_saep_functions_sub_functions" DROP CONSTRAINT "capability_saep_functions_sub_functions_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "capability_saep_functions_sub_functions_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "capability_saep_uc" DROP CONSTRAINT "capability_saep_uc_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "capability_saep_uc_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "question_knowledge" DROP CONSTRAINT "question_knowledge_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "question_knowledge_pkey" PRIMARY KEY ("id");
