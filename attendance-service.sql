-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2025 at 08:59 AM
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
-- Database: `attendance-service`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `clock_in_time` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL,
  `photo_url` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `clock_in_time`, `created_at`, `updated_at`, `photo_url`, `user_id`) VALUES
(14, '2025-07-17 09:19:24.988', '2025-07-17 09:19:24.988', '2025-07-17 09:19:24.988', '/uploads/1752743964982-attendance-1752743963804.jpg', 6),
(15, '2025-07-17 09:51:50.551', '2025-07-17 09:51:50.551', '2025-07-17 09:51:50.551', '/uploads/1752745910548-attendance-1752745909634.jpg', 4),
(16, '2025-07-17 10:53:59.182', '2025-07-17 10:53:59.182', '2025-07-17 10:53:59.182', '/uploads/1752749639172-attendance-1752749638394.jpg', 9),
(19, '2025-07-18 04:01:51.760', '2025-07-18 04:01:51.760', '2025-07-18 04:01:51.760', '/uploads/1752811311749-Frame 1.png', 6),
(20, '2025-07-18 04:01:54.724', '2025-07-18 04:01:54.724', '2025-07-18 04:01:54.724', '/uploads/1752811314714-Frame 1.png', 6),
(21, '2025-07-18 04:01:55.699', '2025-07-18 04:01:55.699', '2025-07-18 04:01:55.699', '/uploads/1752811315688-Frame 1.png', 6),
(22, '2025-07-18 04:01:56.750', '2025-07-18 04:01:56.750', '2025-07-18 04:01:56.750', '/uploads/1752811316739-Frame 1.png', 6),
(23, '2025-07-18 04:01:59.613', '2025-07-18 04:01:59.613', '2025-07-18 04:01:59.613', '/uploads/1752811319602-Frame 1.png', 6),
(24, '2025-07-18 04:02:00.785', '2025-07-18 04:02:00.785', '2025-07-18 04:02:00.785', '/uploads/1752811320775-Frame 1.png', 6),
(25, '2025-07-18 04:02:01.746', '2025-07-18 04:02:01.746', '2025-07-18 04:02:01.746', '/uploads/1752811321736-Frame 1.png', 6),
(26, '2025-07-18 04:02:02.665', '2025-07-18 04:02:02.665', '2025-07-18 04:02:02.665', '/uploads/1752811322655-Frame 1.png', 6),
(27, '2025-07-18 04:02:03.694', '2025-07-18 04:02:03.694', '2025-07-18 04:02:03.694', '/uploads/1752811323684-Frame 1.png', 6),
(28, '2025-07-18 04:02:04.706', '2025-07-18 04:02:04.706', '2025-07-18 04:02:04.706', '/uploads/1752811324696-Frame 1.png', 6),
(30, '2025-07-18 05:48:02.371', '2025-07-18 05:48:02.371', '2025-07-18 05:48:02.371', '/uploads/1752817682366-attendance-1752817673216.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('9299f5e1-9f16-49af-ad05-5f211ec89824', 'df782af86277ce68257f7a5f472650b7261a659b7ca61ff408b578f03f33aa12', '2025-07-16 12:40:51.596', '20250716124051_init', NULL, NULL, '2025-07-16 12:40:51.585', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
