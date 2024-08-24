/*
  Warnings:

  - Added the required column `jenis_kelamin` to the `Transaction` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `transaction` ADD COLUMN `jenis_kelamin` VARCHAR(191) NOT NULL;
