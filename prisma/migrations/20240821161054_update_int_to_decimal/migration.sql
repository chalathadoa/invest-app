/*
  Warnings:

  - You are about to alter the column `nominal` on the `invest` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Decimal(15,2)`.
  - You are about to alter the column `nominal` on the `transaction` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Decimal(15,2)`.
  - You are about to alter the column `total_bayar` on the `transaction` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Decimal(15,2)`.

*/
-- AlterTable
ALTER TABLE `invest` MODIFY `nominal` DECIMAL(15, 2) NOT NULL;

-- AlterTable
ALTER TABLE `transaction` MODIFY `nominal` DECIMAL(15, 2) NOT NULL,
    MODIFY `total_bayar` DECIMAL(15, 2) NOT NULL;
