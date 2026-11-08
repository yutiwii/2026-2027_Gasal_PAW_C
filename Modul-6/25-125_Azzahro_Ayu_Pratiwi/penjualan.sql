-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2026 at 03:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `harga`, `stok`, `supplier_id`) VALUES
(1, 'BRG0001', 'Beras 5 kg', 75000, 100, 1),
(2, 'BRG0002', 'Minyak Goreng 2 L', 36000, 80, 2),
(3, 'BRG0003', 'Gula Pasir 1 kg', 17000, 120, 3),
(4, 'BRG0004', 'Tepung Terigu 1 kg', 13000, 90, 4),
(5, 'BRG0005', 'Kopi Bubuk', 22000, 70, 5),
(6, 'BRG0006', 'Teh Celup', 12000, 65, 2),
(7, 'BRG0007', 'Susu UHT 1 L', 19000, 55, 1),
(8, 'BRG0008', 'Mi Instan (pak)', 35000, 150, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `jenis_kelamin`, `telp`, `alamat`) VALUES
(1, 'Andi Pratama', 'L', '082100000001', 'Surabaya'),
(2, 'Siti Aminah', 'P', '082100000002', 'Sidoarjo'),
(3, 'Budi Santoso', 'L', '082100000003', 'Gresik'),
(4, 'Dewi Lestari', 'P', '082100000004', 'Bangkalan'),
(5, 'Rina Oktavia', 'P', '082100000005', 'Malang');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `waktu_bayar` datetime NOT NULL,
  `total` int(11) NOT NULL,
  `metode` enum('TUNAI','TRANSFER','EDC') NOT NULL,
  `transaksi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `waktu_bayar`, `total`, `metode`, `transaksi_id`) VALUES
(1, '2026-10-20 09:15:00', 117000, 'TUNAI', 1),
(2, '2026-10-21 10:20:00', 89000, 'TRANSFER', 2),
(3, '2026-10-22 11:05:00', 163000, 'EDC', 3),
(4, '2026-10-23 13:30:00', 56000, 'TUNAI', 4),
(5, '2026-10-24 14:10:00', 73000, 'TRANSFER', 5),
(6, '2026-10-25 09:45:00', 145000, 'EDC', 6),
(7, '2026-10-26 12:00:00', 83000, 'TUNAI', 7),
(8, '2026-10-27 15:25:00', 117000, 'TRANSFER', 8),
(9, '2026-10-28 16:40:00', 172000, 'EDC', 9),
(10, '2026-10-29 17:15:00', 95000, 'TUNAI', 10);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `telp`, `alamat`) VALUES
(1, 'CV Sumber Makmur', '081234567801', 'Jl. Melati No. 10, Surabaya'),
(2, 'PT Berkah Niaga', '081234567802', 'Jl. Mawar No. 12, Sidoarjo'),
(3, 'UD Jaya Abadi', '081234567803', 'Jl. Kenanga No. 5, Gresik'),
(4, 'CV Mitra Sejahtera', '081234567804', 'Jl. Anggrek No. 8, Bangkalan'),
(5, 'PT Sentosa Mandiri', '081234567805', 'Jl. Diponegoro No. 20, Malang');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `waktu_transaksi` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `pelanggan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `waktu_transaksi`, `keterangan`, `total`, `pelanggan_id`) VALUES
(1, '2026-10-20', 'Pembelian kebutuhan pokok', 117000, 1),
(2, '2026-10-21', 'Pembelian minyak dan gula', 89000, 2),
(3, '2026-10-22', 'Pembelian beras dan tepung', 180000, 3),
(4, '2026-10-23', 'Pembelian kopi dan teh', 56000, 4),
(5, '2026-10-24', 'Pembelian susu dan mi instan', 73000, 5),
(6, '2026-10-25', 'Belanja bulanan', 145000, 1),
(7, '2026-10-26', 'Pembelian beberapa barang', 121000, 2),
(8, '2026-10-27', 'Pembelian kebutuhan dapur', 117000, 3),
(9, '2026-10-28', 'Pembelian beras dan kopi', 172000, 4),
(10, '2026-10-29', 'Pembelian campuran', 82000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `transaksi_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`transaksi_id`, `barang_id`, `harga`, `qty`) VALUES
(1, 1, 75000, 1),
(1, 3, 17000, 1),
(1, 4, 13000, 1),
(1, 6, 12000, 1),
(2, 2, 36000, 2),
(2, 3, 17000, 1),
(3, 1, 75000, 2),
(3, 3, 17000, 1),
(3, 4, 13000, 1),
(4, 5, 22000, 2),
(4, 6, 12000, 1),
(5, 7, 19000, 2),
(5, 8, 35000, 1),
(6, 1, 75000, 1),
(6, 2, 36000, 1),
(6, 3, 17000, 2),
(7, 2, 36000, 1),
(7, 4, 13000, 1),
(7, 5, 22000, 1),
(7, 6, 12000, 1),
(7, 7, 19000, 2),
(8, 1, 75000, 1),
(8, 3, 17000, 1),
(8, 4, 13000, 1),
(8, 6, 12000, 1),
(9, 1, 75000, 2),
(9, 5, 22000, 1),
(10, 2, 36000, 1),
(10, 3, 17000, 2),
(10, 6, 12000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` tinyint(3) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `alamat`, `hp`, `level`) VALUES
(1, 'admin', 'admin123', 'Administrator', 'Surabaya', '081300000001', 1),
(2, 'kasir01', 'kasir123', 'Rudi Hartono', 'Sidoarjo', '081300000002', 2),
(3, 'kasir02', 'kasir123', 'Maya Putri', 'Gresik', '081300000003', 2),
(4, 'gudang01', 'gudang123', 'Doni Saputra', 'Bangkalan', '081300000004', 3),
(5, 'manager', 'manager123', 'Lina Marlina', 'Malang', '081300000005', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_barang_kode` (`kode_barang`),
  ADD KEY `fk_barang_supplier` (`supplier_id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pembayaran_transaksi` (`transaksi_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transaksi_pelanggan` (`pelanggan_id`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`transaksi_id`,`barang_id`),
  ADD KEY `fk_detail_barang` (`barang_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `uq_user_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_barang_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran_transaksi` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_pelanggan` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `fk_detail_barang` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detail_transaksi` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
