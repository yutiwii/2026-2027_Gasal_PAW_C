-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2026 at 02:15 PM
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
  `stok` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `harga`, `stok`, `supplier_id`) VALUES
(1, 'ITM101', 'Tablet Samsung', 3200000, 18, 1),
(2, 'ITM102', 'Mouse Wireless', 125000, 45, 2),
(3, 'ITM103', 'Keyboard Logitech', 280000, 32, 3),
(4, 'ITM104', 'Monitor LG 24 Inch', 1950000, 14, 4),
(5, 'ITM105', 'Kabel HDMI 2 Meter', 65000, 80, 5),
(6, 'ITM106', 'SSD 512GB', 780000, 27, 6),
(7, 'ITM107', 'Printer Canon', 1850000, 10, 7),
(8, 'ITM108', 'Mikrofon USB', 425000, 22, 8),
(9, 'ITM109', 'Router WiFi', 350000, 36, 9),
(10, 'ITM110', 'Power Bank 20000mAh', 275000, 40, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `telp` varchar(12) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `jenis_kelamin`, `telp`, `alamat`) VALUES
(1, 'Dimas Saputra', 'L', '085712340101', 'Jember'),
(2, 'Laila Safitri', 'P', '085712340102', 'Kediri'),
(3, 'Yoga Prakoso', 'L', '085712340103', 'Bojonegoro'),
(4, 'Nadia Permata', 'P', '085712340104', 'Tuban'),
(5, 'Ilham Maulana', 'L', '085712340105', 'Blitar'),
(6, 'Fitri Handayani', 'P', '085712340106', 'Pasuruan'),
(7, 'Reza Firmansyah', 'L', '085712340107', 'Madiun'),
(8, 'Maya Anggraini', 'P', '085712340108', 'Jombang'),
(9, 'Galih Wicaksono', 'L', '085712340109', 'Lumajang'),
(10, 'Intan Puspitasari', 'P', '085712340110', 'Probolinggo');

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
(1, '2026-10-11 08:15:00', 6400000, 'TRANSFER', 1),
(2, '2026-10-12 09:20:00', 375000, 'TUNAI', 2),
(3, '2026-10-13 10:30:00', 560000, 'TUNAI', 3),
(4, '2026-10-14 11:45:00', 3900000, 'EDC', 4),
(5, '2026-10-15 12:10:00', 195000, 'TUNAI', 5),
(6, '2026-10-16 13:25:00', 1560000, 'TRANSFER', 6),
(7, '2026-10-17 14:40:00', 3700000, 'TRANSFER', 7),
(8, '2026-10-18 15:05:00', 850000, 'EDC', 8),
(9, '2026-10-19 16:20:00', 700000, 'TRANSFER', 9),
(10, '2026-10-20 17:35:00', 825000, 'TUNAI', 10);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telp` varchar(12) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `telp`, `alamat`) VALUES
(1, 'CV Tekno Nusantara', '087811220101', 'Jember'),
(2, 'PT Digital Perkasa', '087811220102', 'Kediri'),
(3, 'CV Sukses Komputer', '087811220103', 'Malang'),
(4, 'PT Aneka Teknologi', '087811220104', 'Tuban'),
(5, 'CV Indo Peralatan', '087811220105', 'Blitar'),
(6, 'PT Cipta Elektronik', '087811220106', 'Pasuruan'),
(7, 'CV Prima Hardware', '087811220107', 'Madiun'),
(8, 'PT Global Komputindo', '087811220108', 'Jombang'),
(9, 'CV Mitra Digital', '087811220109', 'Lumajang'),
(10, 'PT Solusi Teknologi', '087811220110', 'Probolinggo');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `waktu_transaksi` date NOT NULL,
  `keterangan` text NOT NULL,
  `total` int(11) NOT NULL,
  `pelanggan_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `waktu_transaksi`, `keterangan`, `total`, `pelanggan_id`) VALUES
(1, '2026-10-11', 'Pembelian tablet', 6400000, 1),
(2, '2026-10-12', 'Pembelian mouse wireless', 375000, 2),
(3, '2026-10-13', 'Pembelian keyboard', 560000, 3),
(4, '2026-10-14', 'Pembelian monitor', 3900000, 4),
(5, '2026-10-15', 'Pembelian kabel HDMI', 195000, 5),
(6, '2026-10-16', 'Pembelian SSD', 1560000, 6),
(7, '2026-10-17', 'Pembelian printer', 3700000, 7),
(8, '2026-10-18', 'Pembelian mikrofon', 850000, 8),
(9, '2026-10-19', 'Pembelian router WiFi', 700000, 9),
(10, '2026-10-20', 'Pembelian power bank', 825000, 10);

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
(1, 1, 3200000, 2),
(2, 2, 125000, 3),
(3, 3, 280000, 2),
(4, 4, 1950000, 2),
(5, 5, 65000, 3),
(6, 6, 780000, 2),
(7, 7, 1850000, 2),
(8, 8, 425000, 2),
(9, 9, 350000, 2),
(10, 10, 275000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` tinyint(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `hp` varchar(20) NOT NULL,
  `level` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `alamat`, `hp`, `level`) VALUES
(1, 'superadmin', 'super123', 'Rangga Kurniawan', 'Jember', '089612340101', 1),
(2, 'kasir04', 'kasir456', 'Dinda Maharani', 'Kediri', '089612340102', 2),
(3, 'kasir05', 'kasir456', 'Arif Setiawan', 'Bojonegoro', '089612340103', 2),
(4, 'kasir06', 'kasir456', 'Vina Oktaviani', 'Tuban', '089612340104', 2),
(5, 'operator03', 'oper456', 'Bagas Ramadhan', 'Blitar', '089612340105', 3),
(6, 'operator04', 'oper456', 'Nisa Aprilia', 'Pasuruan', '089612340106', 3),
(7, 'staff05', 'staff456', 'Fikri Hidayat', 'Madiun', '089612340107', 3),
(8, 'staff06', 'staff456', 'Citra Wulandari', 'Jombang', '089612340108', 3),
(9, 'staff07', 'staff456', 'Rafi Alamsyah', 'Lumajang', '089612340109', 3),
(10, 'staff08', 'staff456', 'Salsa Amelia', 'Probolinggo', '089612340110', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supplier_id` (`supplier_id`);

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
  ADD UNIQUE KEY `transaksi_id` (`transaksi_id`);

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
  ADD UNIQUE KEY `pelanggan_id` (`pelanggan_id`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD UNIQUE KEY `barang_id` (`barang_id`),
  ADD UNIQUE KEY `transaksi_id` (`transaksi_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`);

--
-- Constraints for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `transaksi_detail_ibfk_2` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
