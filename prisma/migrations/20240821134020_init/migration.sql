-- CreateTable
CREATE TABLE `Invest` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `jenis_kelamin` VARCHAR(191) NOT NULL,
    `usia` INTEGER NOT NULL,
    `perokok` VARCHAR(191) NOT NULL,
    `nominal` INTEGER NOT NULL,
    `lama_investasi` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
