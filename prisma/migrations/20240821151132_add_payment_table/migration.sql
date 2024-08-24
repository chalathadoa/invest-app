-- CreateTable
CREATE TABLE `Payment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL,
    `usia` INTEGER NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `perokok` BOOLEAN NOT NULL,
    `nominal` INTEGER NOT NULL,
    `lama_investasi` INTEGER NOT NULL,
    `periode_pembayaran` VARCHAR(191) NOT NULL,
    `metode_bayar` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
