-- --------------------------------------------------------
-- Database: `toko_online`
-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `toko_online` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `toko_online`;

CREATE TABLE `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`nama`, `email`, `password`) VALUES
('Admin', 'admin@example.com', '$2y$10$abcdefghijklmnopqrstuv123456789012345678901234567890'),
('Budi', 'budi@example.com', '$2y$10$abcdefghijklmnopqrstuv123456789012345678901234567890');

CREATE TABLE `produk` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_produk` VARCHAR(100) NOT NULL,
  `harga` DECIMAL(10,2) NOT NULL,
  `stok` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `produk` (`nama_produk`, `harga`, `stok`) VALUES
('Kaos Polos', 75000.00, 20),
('Sepatu Sneakers', 250000.00, 10),
('Topi Trucker', 50000.00, 15);

CREATE TABLE `pesanan` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `produk_id` INT(11) NOT NULL,
  `jumlah` INT(11) NOT NULL,
  `tanggal_pesan` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`produk_id`) REFERENCES `produk`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pesanan` (`user_id`, `produk_id`, `jumlah`) VALUES
(1, 2, 1),
(2, 1, 3);
