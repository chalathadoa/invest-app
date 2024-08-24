/*
  Warnings:

  - You are about to alter the column `perokok` on the `invest` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `TinyInt`.
  - Added the required column `hasil_investasi` to the `Invest` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `invest` ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `hasil_investasi` JSON NOT NULL,
    MODIFY `perokok` BOOLEAN NOT NULL;
