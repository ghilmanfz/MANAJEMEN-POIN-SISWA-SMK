-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2024 at 03:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ghilman_pembinaan_karakter`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `nis` varchar(9) NOT NULL,
  `nama_alumni` varchar(30) NOT NULL,
  `th_lulus` year(4) NOT NULL,
  `id_jurusan` tinyint(2) NOT NULL,
  `sub_kelas` char(1) NOT NULL,
  `id_ortu` int(5) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_poin`
--

CREATE TABLE `detail_poin` (
  `id_detail_poin` int(10) NOT NULL,
  `tanggal` date NOT NULL,
  `tahun_ajaran` char(9) NOT NULL,
  `nis` varchar(9) NOT NULL,
  `id_pelanggaran` tinyint(3) DEFAULT NULL,
  `id_prestasi` tinyint(3) DEFAULT NULL,
  `id_perbaikan` tinyint(3) DEFAULT NULL,
  `ket` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nip` char(18) NOT NULL,
  `nama_guru` varchar(30) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `jabatan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` tinyint(2) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kat_pelanggaran`
--

CREATE TABLE `kat_pelanggaran` (
  `id_kat_pelanggaran` tinyint(2) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` tinyint(3) NOT NULL,
  `id_jurusan` tinyint(2) NOT NULL,
  `tingkat_kelas` varchar(4) NOT NULL,
  `sub_kelas` char(1) NOT NULL,
  `nip` char(18) DEFAULT NULL,
  `jml_siswa` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orang_tua`
--

CREATE TABLE `orang_tua` (
  `id_ortu` int(5) NOT NULL,
  `nama_ortu` varchar(30) NOT NULL,
  `alamat_ortu` text NOT NULL,
  `no_hp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id_pelanggaran` tinyint(3) NOT NULL,
  `nama_pelanggaran` varchar(150) NOT NULL,
  `id_sub_kategori` tinyint(2) NOT NULL,
  `poin` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perbaikan`
--

CREATE TABLE `perbaikan` (
  `id_perbaikan` tinyint(3) NOT NULL,
  `nama_perbaikan` varchar(100) NOT NULL,
  `poin` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi`
--

CREATE TABLE `prestasi` (
  `id_prestasi` tinyint(3) NOT NULL,
  `nama_prestasi` varchar(100) NOT NULL,
  `poin` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(9) NOT NULL,
  `nama_siswa` varchar(30) NOT NULL,
  `th_angkatan` year(4) NOT NULL,
  `alamat` text NOT NULL,
  `id_kelas` tinyint(3) NOT NULL,
  `id_ortu` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa_do`
--

CREATE TABLE `siswa_do` (
  `nis` varchar(9) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `th_keluar` year(4) NOT NULL,
  `id_jurusan` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_kat_pelanggaran`
--

CREATE TABLE `sub_kat_pelanggaran` (
  `id_sub_kategori` tinyint(2) NOT NULL,
  `nama_sub_kategori` varchar(100) NOT NULL,
  `id_kat_pelanggaran` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_rapat`
--

CREATE TABLE `temp_rapat` (
  `id_temp_rapat` int(12) NOT NULL,
  `nis` varchar(9) NOT NULL,
  `jml_poin_pelanggaran` smallint(3) NOT NULL,
  `lihat` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_sp_1`
--

CREATE TABLE `temp_sp_1` (
  `id_temp_sp_1` int(12) NOT NULL,
  `nis` varchar(9) NOT NULL,
  `jml_poin_pelanggaran` smallint(3) NOT NULL,
  `lihat` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_sp_2`
--

CREATE TABLE `temp_sp_2` (
  `id_temp_sp_2` int(12) NOT NULL,
  `nis` varchar(9) NOT NULL,
  `jml_poin_pelanggaran` smallint(3) NOT NULL,
  `lihat` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_sp_3`
--

CREATE TABLE `temp_sp_3` (
  `id_temp_sp_3` int(12) NOT NULL,
  `nis` varchar(9) NOT NULL,
  `jml_poin_pelanggaran` smallint(3) NOT NULL,
  `lihat` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `th_ajaran`
--

CREATE TABLE `th_ajaran` (
  `id_th_ajaran` mediumint(5) NOT NULL,
  `tahun_ajaran` char(9) NOT NULL,
  `sekarang` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `th_ajaran`
--

INSERT INTO `th_ajaran` (`id_th_ajaran`, `tahun_ajaran`, `sekarang`) VALUES
(3, '2024/2025', 'Y'),
(4, '', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tindakan`
--

CREATE TABLE `tindakan` (
  `id_tindakan` tinyint(3) NOT NULL,
  `nama_tindakan` varchar(30) NOT NULL,
  `ketentuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_login` int(5) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `nip` char(18) DEFAULT NULL,
  `nis` varchar(9) DEFAULT NULL,
  `id_ortu` int(5) DEFAULT NULL,
  `hak_akses` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_login`, `username`, `password`, `nip`, `nis`, `id_ortu`, `hak_akses`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', '', '', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_ortu` (`id_ortu`);

--
-- Indexes for table `detail_poin`
--
ALTER TABLE `detail_poin`
  ADD PRIMARY KEY (`id_detail_poin`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_pelanggaran` (`id_pelanggaran`),
  ADD KEY `id_prestasi` (`id_prestasi`),
  ADD KEY `id_perbaikan` (`id_perbaikan`),
  ADD KEY `tahun_ajaran` (`tahun_ajaran`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `kat_pelanggaran`
--
ALTER TABLE `kat_pelanggaran`
  ADD PRIMARY KEY (`id_kat_pelanggaran`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `orang_tua`
--
ALTER TABLE `orang_tua`
  ADD PRIMARY KEY (`id_ortu`);

--
-- Indexes for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id_pelanggaran`),
  ADD KEY `id_kat_pelanggaran` (`id_sub_kategori`);

--
-- Indexes for table `perbaikan`
--
ALTER TABLE `perbaikan`
  ADD PRIMARY KEY (`id_perbaikan`);

--
-- Indexes for table `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`id_prestasi`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_ortu` (`id_ortu`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `siswa_do`
--
ALTER TABLE `siswa_do`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `sub_kat_pelanggaran`
--
ALTER TABLE `sub_kat_pelanggaran`
  ADD PRIMARY KEY (`id_sub_kategori`),
  ADD KEY `id_kat_pelanggaran` (`id_kat_pelanggaran`);

--
-- Indexes for table `temp_rapat`
--
ALTER TABLE `temp_rapat`
  ADD PRIMARY KEY (`id_temp_rapat`);

--
-- Indexes for table `temp_sp_1`
--
ALTER TABLE `temp_sp_1`
  ADD PRIMARY KEY (`id_temp_sp_1`);

--
-- Indexes for table `temp_sp_2`
--
ALTER TABLE `temp_sp_2`
  ADD PRIMARY KEY (`id_temp_sp_2`);

--
-- Indexes for table `temp_sp_3`
--
ALTER TABLE `temp_sp_3`
  ADD PRIMARY KEY (`id_temp_sp_3`);

--
-- Indexes for table `th_ajaran`
--
ALTER TABLE `th_ajaran`
  ADD PRIMARY KEY (`id_th_ajaran`),
  ADD UNIQUE KEY `tahun_ajaran` (`tahun_ajaran`);

--
-- Indexes for table `tindakan`
--
ALTER TABLE `tindakan`
  ADD PRIMARY KEY (`id_tindakan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `nip` (`nip`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_ortu` (`id_ortu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_poin`
--
ALTER TABLE `detail_poin`
  MODIFY `id_detail_poin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kat_pelanggaran`
--
ALTER TABLE `kat_pelanggaran`
  MODIFY `id_kat_pelanggaran` tinyint(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `orang_tua`
--
ALTER TABLE `orang_tua`
  MODIFY `id_ortu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id_pelanggaran` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perbaikan`
--
ALTER TABLE `perbaikan`
  MODIFY `id_perbaikan` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `id_prestasi` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_kat_pelanggaran`
--
ALTER TABLE `sub_kat_pelanggaran`
  MODIFY `id_sub_kategori` tinyint(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_rapat`
--
ALTER TABLE `temp_rapat`
  MODIFY `id_temp_rapat` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_sp_1`
--
ALTER TABLE `temp_sp_1`
  MODIFY `id_temp_sp_1` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_sp_2`
--
ALTER TABLE `temp_sp_2`
  MODIFY `id_temp_sp_2` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_sp_3`
--
ALTER TABLE `temp_sp_3`
  MODIFY `id_temp_sp_3` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `th_ajaran`
--
ALTER TABLE `th_ajaran`
  MODIFY `id_th_ajaran` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tindakan`
--
ALTER TABLE `tindakan`
  MODIFY `id_tindakan` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_login` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `alumni_ibfk_2` FOREIGN KEY (`id_ortu`) REFERENCES `orang_tua` (`id_ortu`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `guru` (`nip`);

--
-- Constraints for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD CONSTRAINT `pelanggaran_ibfk_1` FOREIGN KEY (`id_sub_kategori`) REFERENCES `sub_kat_pelanggaran` (`id_sub_kategori`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id_ortu`) REFERENCES `orang_tua` (`id_ortu`);

--
-- Constraints for table `sub_kat_pelanggaran`
--
ALTER TABLE `sub_kat_pelanggaran`
  ADD CONSTRAINT `sub_kat_pelanggaran_ibfk_1` FOREIGN KEY (`id_kat_pelanggaran`) REFERENCES `kat_pelanggaran` (`id_kat_pelanggaran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
