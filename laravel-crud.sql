-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2021 at 06:14 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id`, `nama`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Paijo', '0897878', 'Kedungwuni', '2020-11-09 14:26:27', '0000-00-00 00:00:00'),
(2, 'Sutarjo', '098765', 'karangdadap', '2020-11-09 14:26:27', '0000-00-00 00:00:00'),
(3, 'Chandra', '098765433', 'Pemalang', '2020-11-13 14:02:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `semester` varchar(64) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id`, `kode`, `nama`, `semester`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 'm.001', 'Matematika Dasar', 'Ganjil', 1, '2020-11-08 12:59:39', '0000-00-00 00:00:00'),
(2, 'b.001', 'Bahasa Indonesia', 'Ganjil', 1, '2020-11-08 12:59:39', '0000-00-00 00:00:00'),
(3, 'm.003', 'Agama Islam', 'Ganjil', 2, '2020-11-08 16:59:16', '0000-00-00 00:00:00'),
(4, 'm.004', 'Programming', 'Ganjil', 3, '2020-11-13 14:03:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mapel_siswa`
--

CREATE TABLE `mapel_siswa` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mapel_siswa`
--

INSERT INTO `mapel_siswa` (`id`, `siswa_id`, `mapel_id`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 11, 1, 75, '2020-11-08 13:06:52', '0000-00-00 00:00:00'),
(2, 11, 2, 60, '2020-11-08 13:06:52', '0000-00-00 00:00:00'),
(3, 1, 1, 70, '2020-11-08 13:25:05', '2020-11-14 09:58:01'),
(4, 11, 1, 80, '2020-11-08 09:07:58', '2020-11-08 16:07:58'),
(5, 9, 1, 85, '2020-11-08 09:08:31', '2020-11-08 16:08:31'),
(6, 9, 2, 90, '2020-11-08 09:08:43', '2020-11-08 16:08:43'),
(7, 9, 1, 90, '2020-11-08 09:14:44', '2020-11-08 16:14:44'),
(8, 1, 2, 90, '2020-11-08 09:18:36', '2020-11-08 16:18:36'),
(10, 10, 1, 80, '2020-11-08 10:17:42', '2020-11-08 17:17:42'),
(12, 15, 3, 85, '2020-11-10 06:08:32', '2020-11-10 13:08:32'),
(13, 1, 3, 80, '2020-11-13 01:18:58', '2020-11-13 08:18:58'),
(14, 21, 1, 80, '2020-11-13 01:20:00', '2020-11-13 08:20:00'),
(15, 23, 1, 80, '2020-11-13 06:30:32', '2020-11-13 13:30:32'),
(16, 23, 2, 90, '2020-11-13 06:32:27', '2020-11-13 13:32:27'),
(17, 23, 3, 100, '2020-11-13 06:33:07', '2020-11-13 13:33:07'),
(18, 1, 4, 93, '2020-11-13 07:05:15', '2020-11-13 14:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_11_07_040034_create_siswa_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `slug`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ini berita pertama', '<p>Ini isi berita pertama yang di input secara manual</p>', 'ini-berita-pertama', '', '2020-11-14 14:15:38', '0000-00-00 00:00:00'),
(2, 1, 'Ini berita ke dua', '<p>ini adalah contoh berita kedua,ini hanyalah untuk testing</p>', 'Ini-berita-kedua', '', '2020-11-16 15:58:14', '0000-00-00 00:00:00'),
(3, 1, 'mamang', '<p>nksdncsnddjcnsjdncnsdcnjncd <strong>cdasdcadcdc</strong></p>', 'mamang', 'http://localhost:8000/storage/photos/1/com-code (1).png', '2020-11-21 09:39:02', '2020-11-21 16:39:02'),
(4, 1, 'mamang', '<p>nksdncsnddjcnsjdncnsdcnjncd <strong>cdasdcadcdc</strong></p>', 'mamang-1', 'http://localhost:8000/storage/photos/1/com-code (1).png', '2020-11-21 09:42:35', '2020-11-21 16:42:35'),
(5, 1, 'mamang', '<p>nksdncsnddjcnsjdncnsdcnjncd <strong>cdasdcadcdc</strong></p>', 'mamang-2', 'http://localhost:8000/storage/photos/1/com-code (1).png', '2020-11-21 09:45:20', '2020-11-21 16:45:20'),
(6, 1, 'coba coba artikel', '<p>hay ini artikel <strong>percobaan</strong></p>', 'coba-coba-artikel', 'http://localhost:8000/storage/photos/1/cctv-camera-images-png-download-1899.png', '2020-11-21 09:48:43', '2020-11-21 16:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(64) NOT NULL,
  `nama_depan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `alamat`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 0, 'mamang', 'cilok', 'L', 'islam', 'gemek', 'orang.jpg', NULL, '2020-11-13 06:49:27'),
(21, 13, 'hasem', 'mah', 'L', 'islam', 'fgdgd', 'orang.jpg', '2020-11-10 10:50:46', '2020-11-13 06:41:19'),
(22, 14, 'kemin', 'min', 'L', 'islam', 'kajen', NULL, '2020-11-12 10:39:09', '2020-11-12 10:39:09'),
(23, 15, 'rusdianto', 'saputro', 'L', 'islam', 'Kajen', 'orang.jpg', '2020-11-13 06:29:27', '2020-11-13 06:56:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'fajar', 'fajar@gmail.com', NULL, '$2y$10$QiT5B7r3MWMNqkB.rzt7rOich7pYxC1/HTxthesumrPeQMo2JGg8K', 'XrMme0JueOJfBNEiL4VqeZZbah6D8f2qzw3kaEljpIP2csn8U2gkFVlvzOoJ', '2020-11-07 20:47:30', '2020-11-07 20:47:30'),
(3, 'siswa', 'dika', 'dika@gmail.com', NULL, '$2y$10$6kUyCSHwmKj.STdiAxHXwuQK9biILM9Eh/SJjeCMDnZNi8X523RoW', 'OqEt1wjG4NKJeWAuBfSLJVtzPYCtKEmiAJsYNdulTe8fOl8Fc3aX5ac0XQqy', '2020-11-08 00:27:22', '2020-11-08 00:27:22'),
(4, 'siswa', 'mahmus', 'ikhsansatwika@gmail.com', NULL, '$2y$10$UU7E7yTVVXpX6s6lzLusOuy1Zji0dVMzjA7z5XFhypWkbCda4DPaG', '5fa804a61afe7', '2020-11-08 07:45:58', '2020-11-08 07:45:58'),
(5, 'siswa', 'ikhsan', 'ikhsansatwikas@gmail.com', NULL, '$2y$10$ulVt41J0n5kBc.qeg0ZH0ObT4NDC72YYRtnWKkPSRFT/N05Si6TmK', '5fa8073f41fbb', '2020-11-08 07:57:03', '2020-11-08 07:57:03'),
(6, 'siswa', 'azassd', 'aza@gmail.com', NULL, '$2y$10$m07fuxGGRipC7sY9VKLC8u3D/S8aHj4s2WESSL.Ysz5ZB9/Dirvfq', '5fa80b7b7928c', '2020-11-08 08:15:07', '2020-11-08 08:15:07'),
(7, 'siswa', 'herman', 'herman@gmail.com', NULL, '$2y$10$n.IVru3WDia0gLttLZyBoOkuLqW9c7BLVJteih3zDY./rf1ocrihq', '5faa9039798cf', '2020-11-10 06:06:01', '2020-11-10 06:06:01'),
(8, 'siswa', 'dikas', 'dikaa@gmail.com', NULL, '$2y$10$kFW8tPPQudjc7E8p0ayY4.U9PMwVskW.KyP4b/fyz1f4QIz5RgMLi', '5faac77bdd0cf', '2020-11-10 10:01:47', '2020-11-10 10:01:47'),
(9, 'siswa', 'dikas', 'dikaas@gmail.com', NULL, '$2y$10$KaL8g.I6.eXULQGBQrKV2.n14r9C30rvSn1K0Zbt7DplmFrZ63nRq', '5faac7cf3a1a0', '2020-11-10 10:03:11', '2020-11-10 10:03:11'),
(10, 'siswa', 'ilmia', 'il@n.com', NULL, '$2y$10$stxcAIO2LCt7RdK3BzIbBuELyZi5Oj4MxCLNQlJWjQDRqamF79aeq', '5faac96be28ae', '2020-11-10 10:10:03', '2020-11-10 10:10:03'),
(11, 'siswa', 'junaidi', 'junaidi@mm.co', NULL, '$2y$10$E2F4Ab7WfK.3p6DWQW/xmerb.ECqYN631cjQ0R5cgExU/k.yUqVJ.', '5faacff5653b9', '2020-11-10 10:37:57', '2020-11-10 10:37:57'),
(12, 'siswa', 'sajori', 'sa@h.com', NULL, '$2y$10$WwqgzviJuw.9gwlHcM6GW.vzMNE0aLpmgmwM/befXNBGuxmmP6eAa', '5faad09d85d52', '2020-11-10 10:40:45', '2020-11-10 10:40:45'),
(13, 'siswa', 'hasem', 'hasem@m.nm', NULL, '$2y$10$G/0xhW8Ky55fZVTf65wnJOqcxYQsLyuWCYhsz4drdkz4kG5feXRZm', '5faad2f62cd64', '2020-11-10 10:50:46', '2020-11-10 10:50:46'),
(14, 'siswa', 'kemin', 'kemin@ex.com', NULL, '$2y$10$2efLCRnLy4ZdxuamgeWVa.Pfg32G1WO2ctsVYp.KDYh8LCEF3DPkq', '5fad7339a39f5', '2020-11-12 10:39:06', '2020-11-12 10:39:06'),
(15, 'siswa', 'rusdianto', 'rusdi@ex.com', NULL, '$2y$10$1ZxqQjLt1Q6RjQh7eLcY6eWKI.ak9UcTXQ0pREN8Z0.iRkWzBeW9u', '5fae8a378c31a', '2020-11-13 06:29:27', '2020-11-13 06:29:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
