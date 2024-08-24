/*
  Warnings:

  - A unique constraint covering the columns `[no_transaction]` on the table `Transaction` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `no_transaction` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tgl_transaksi` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `total_bayar` to the `Transaction` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `transaction` ADD COLUMN `no_transaction` VARCHAR(191) NOT NULL,
    ADD COLUMN `tgl_transaksi` DATETIME(3) NOT NULL,
    ADD COLUMN `total_bayar` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Transaction_no_transaction_key` ON `Transaction`(`no_transaction`);
