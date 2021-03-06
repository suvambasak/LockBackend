-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 19, 2018 at 08:44 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lockdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `enable` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`email`, `username`, `enable`) VALUES
('suvambasak1@gmail.com', 'basak', 'Y'),
('suvambasak2008@gmail.com', 'basak', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `lock_mac` varchar(255) NOT NULL,
  `owner_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `username`, `lock_mac`, `owner_email`) VALUES
(1, 'basak', 'MAC', 'suvambasak2008@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `imagebackup`
--

CREATE TABLE `imagebackup` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `membercode`
--

CREATE TABLE `membercode` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membercode`
--

INSERT INTO `membercode` (`id`, `username`, `code`) VALUES
(3, 'basak', 'FQBDqG3GTg3KbBgB5LaqaoD0TZhBqYrXS');

-- --------------------------------------------------------

--
-- Table structure for table `memberdetails`
--

CREATE TABLE `memberdetails` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `androidId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notifyText` varchar(255) NOT NULL,
  `imageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `onlinelist`
--

CREATE TABLE `onlinelist` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `android_id` text NOT NULL,
  `admin` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id`, `password`, `name`, `address`, `email`, `phone`, `android_id`, `admin`) VALUES
(1, '1a1dc91c907325c69271ddf0c944bc72', 'Suvam Basak', 'kolkata', 'suvambasak2008@gmail.com', '9051446080', 'cf7586113ca53f2153e1ffac50755710', 'Y'),
(2, '1a1dc91c907325c69271ddf0c944bc72', 'Aritra', 'kalyani', 'suvambasak1@gmail.com', '9051446088', '46d550fd4216a595dead885eec8ec34', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tokenlist`
--

CREATE TABLE `tokenlist` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokenlist`
--

INSERT INTO `tokenlist` (`username`, `email`, `token`) VALUES
('basak', 'suvambasak1@gmail.com', 'cdtjRpZ0HkY:APA91bHjpS3BVnQGQjF1Pe4a2vZXZtPFJ5oIsJMSwwQh1aEDgljYRNY9on6_aywmhahRg9XOym7fqrwNQuJQrhXcMhRP0TCMttTCgUo_BoFFgb1jBpRXrMwgmCDhAim0GkoyXINAVCqZ'),
('basak', 'suvambasak2008@gmail.com', 'fHeX9o-aIg8:APA91bH5m_ExNWu-udqGIEdgyyoD9xReGqjab0qO85mXhfZNP7AeiUExrjCOE_-r6e9But-LaXnhzOob_bmlvVQA9KvnIrSoa8bLYZ5yb6z1dyzXmLSu3ILUOPmdUayb8v5Mrf7XlccR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD UNIQUE KEY `owner_id` (`email`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `imagebackup`
--
ALTER TABLE `imagebackup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membercode`
--
ALTER TABLE `membercode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `memberdetails`
--
ALTER TABLE `memberdetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `onlinelist`
--
ALTER TABLE `onlinelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tokenlist`
--
ALTER TABLE `tokenlist`
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `imagebackup`
--
ALTER TABLE `imagebackup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membercode`
--
ALTER TABLE `membercode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `memberdetails`
--
ALTER TABLE `memberdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlinelist`
--
ALTER TABLE `onlinelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
