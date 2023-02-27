-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2023 at 09:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cricheros`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign_module`
--

CREATE TABLE `assign_module` (
  `id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assign_module`
--

INSERT INTO `assign_module` (`id`, `role`, `module`, `status`, `date`) VALUES
(21, 5, 1, 'Y', '2022-10-11 09:47:21'),
(28, 5, 12, 'Y', '2022-10-11 09:47:21'),
(29, 5, 20, 'Y', '2022-10-11 09:47:21'),
(41, 6, 1, 'Y', '2022-12-06 10:44:55'),
(48, 6, 12, 'Y', '2022-12-06 10:44:55'),
(50, 6, 13, 'Y', '2022-12-06 10:44:55'),
(51, 6, 20, 'Y', '2022-12-06 10:44:55'),
(52, 6, 18, 'Y', '2022-12-06 10:44:55'),
(64, 7, 1, 'Y', '2022-12-10 12:54:01'),
(70, 7, 18, 'Y', '2022-12-10 12:54:01'),
(91, 10, 13, 'Y', '2022-12-30 10:32:41'),
(103, 3, 27, 'Y', '2023-01-03 06:43:45'),
(104, 3, 24, 'Y', '2023-01-03 06:43:45'),
(105, 3, 1, 'Y', '2023-01-03 06:43:45'),
(106, 3, 12, 'Y', '2023-01-03 06:43:45'),
(108, 3, 13, 'Y', '2023-01-03 06:43:45'),
(109, 3, 18, 'Y', '2023-01-03 06:43:45'),
(110, 3, 20, 'Y', '2023-01-03 06:43:45'),
(111, 3, 26, 'Y', '2023-01-03 06:43:45'),
(112, 3, 28, 'Y', '2023-01-03 06:43:45'),
(113, 3, 29, 'Y', '2023-01-03 06:43:45'),
(114, 3, 30, 'Y', '2023-01-03 06:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `name`, `type`, `image`, `status`, `date`) VALUES
(9, 'Admin', 'TB', 'add_banner-1670666531630-500147628.png', 'Y', '2022-10-08 09:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `highest`
--

CREATE TABLE `highest` (
  `id` int(11) NOT NULL,
  `player-name` varchar(500) NOT NULL,
  `Team-name` varchar(200) NOT NULL,
  `total-run` mediumtext NOT NULL,
  `total-wicket` mediumtext NOT NULL,
  `total-match` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `highest`
--

INSERT INTO `highest` (`id`, `player-name`, `Team-name`, `total-run`, `total-wicket`, `total-match`, `status`, `date`) VALUES
(1, 'dhoni', 'india', '8956', '10', '458', 'Y', '2022-12-29 06:57:04'),
(2, 'Raina', 'india', '9253', '250', '356', 'Y', '2022-12-29 06:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `live_match`
--

CREATE TABLE `live_match` (
  `id` int(11) NOT NULL,
  `Team-name` varchar(200) NOT NULL,
  `player-name` varchar(200) NOT NULL,
  `series-name` varchar(200) NOT NULL,
  `time` varchar(200) NOT NULL,
  `toss` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `live_match`
--

INSERT INTO `live_match` (`id`, `Team-name`, `player-name`, `series-name`, `time`, `toss`, `date`) VALUES
(2, 'Mi', 'Rohit', 'ipl', '7:30', 'mi', '2022-12-29 07:00:45'),
(3, 'Rcb', 'virat', 'ipl', '3:30', 'rcb', '2022-12-29 07:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_assign` varchar(1) NOT NULL DEFAULT 'N',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `role_assign`, `date`) VALUES
(14, 'xyz', '$2b$10$BVMot5Sk7pEPKDIGINvS7e0KM6lK1DgdZD87lR2zfTusatwFBbxHu', 'Y', '2022-07-29 05:32:44'),
(15, 'abc', '$2b$10$7EXv188pmWwFXIpILKD4FeZF1k40LZOQ4Lj.aD.rqOGcCrI3ECJUO', 'Y', '2022-10-11 09:35:46'),
(17, 'himanshu', '$2b$10$5p6VFEsGY0/IxSZJ9ckMju5YnB6QU4jrAfuwFwn4sT8JyHogRJthO', 'N', '2023-01-13 09:26:20'),
(18, ' word', '$2b$10$Zsg3Iwy52DQ2FJuhBYuTzupUDAf4ALCXQSCQiC0F4RgXMHvy1dCRi', 'N', '2023-02-24 06:54:13'),
(19, 'alok', '$2b$10$GRmnd5XNXlVNox1o0/LtfuyidHZCK3GApJKhYBy2hRwyixHwMWdFe', 'N', '2023-02-24 07:01:07'),
(20, 'ashu', '$2b$10$JBkhZf/vIQPNlaX6eRPJBe9WfRFpqj.L946EXCThhF2hP.zjOyIBu', 'N', '2023-02-24 07:01:34'),
(21, 'subham', '$2b$10$uG7fsEYFcBStf2FhE/Ebu.Lp7ImMChY09bVzi1y8ACD8cHFwLmYMi', 'N', '2023-02-24 08:52:16'),
(22, 'simran', '$2b$10$udYGuNpIgbTwi8ElBAN6juVFUSu8Ah6jlMK7ZQ41GXTCnq.84cgFy', 'N', '2023-02-24 09:32:00'),
(23, 'aaaaaaaaa', '$2b$10$KGWuC30usbb0sLS4lDFrJO0IBSdzJ3.m6bJS/nGZgXyb3H3WRbp/W', 'N', '2023-02-24 10:12:52'),
(24, 'ssaa', '$2b$10$Wo4Mj9BmLQcpCsDtd3nvhu.i3pzUDIVgLtlgPSy5SGMiH916KJV12', 'N', '2023-02-24 10:13:38'),
(25, 'sudha', '$2b$10$3USHBzrgxyJagCCeV9FaJuSTEWYlMO39EJ5Wo/9.Q1ldNWq7BAF8S', 'N', '2023-02-24 10:14:06'),
(26, 'hilokjk', '$2b$10$hk4Uj0dQcEukYPwNm7t3nORtav2FdrVHDAHg4DjsrAPIYoJHc.AjC', 'N', '2023-02-24 10:14:40'),
(27, 'sdsdsd', '$2b$10$82R/P8lsaY2sZ1yjUNRo.eDDeTxuV4gyFRPTTcuIR7332mlFLeq.G', 'N', '2023-02-24 10:17:39'),
(28, 'aass', '$2b$10$b0llxhq/Fpe5u6QBRhxX9u24kP8.zYLAsybRWnp4NAjp2DX7.UsO.', 'N', '2023-02-24 10:20:36'),
(29, 'surbhiss', '$2b$10$.Mx3abuupjzdxMqqA.L4guRmibM/Ja70zw2Lr1eeH6KP7Iim.YRqa', 'N', '2023-02-24 10:28:04'),
(30, 'sdsdsdsdsdsd', '$2b$10$7TBD9xpit44vcKxOUF465u1zEDmKiMYYPyhwcfb392Yo0dalKNp4m', 'N', '2023-02-24 10:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `team_1` varchar(200) NOT NULL,
  `team_2` varchar(200) NOT NULL,
  `series_name` varchar(200) NOT NULL,
  `win_toss` varchar(200) NOT NULL,
  `match_no` varchar(200) NOT NULL,
  `result` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date_time` date DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `team_1`, `team_2`, `series_name`, `win_toss`, `match_no`, `result`, `status`, `date_time`, `date`) VALUES
(56, 'lklklk', 'plp', 'kkk', 'team_2', '45', 'Upcomig', 'Y', NULL, '2023-02-14 10:34:11'),
(58, 'klklkllk', 'kllk', 'koplolik', 'team_2', '2322', 'Upcomig', 'Y', NULL, '2023-02-14 10:35:59'),
(59, 'klklklklkl', 'lpplplp', 'lplppllp', 'team_1', '78', 'Upcomig', 'Y', NULL, '2023-02-14 10:36:19'),
(60, 'njmkias', 'asasa', 'asasasa', 'team_2', '45454', 'Upcomig', 'Y', NULL, '2023-02-15 04:48:10'),
(64, 'gggg', 'ghgh', 'ghkjhgf', 'team_2', '8963256', 'Upcomig', 'Y', NULL, '2023-02-16 04:57:51'),
(65, 'asd', 'asdas', 'asdas', 'team_1', '45', 'Ongoing', 'Y', '2023-02-09', '2023-02-16 05:57:58');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `module_name`, `url`, `status`, `date`) VALUES
(1, 'dashboard', '/home/dashboard', 'N', '2022-07-26 11:25:10'),
(12, 'Banner', '/home/banner', 'Y', '2022-07-26 11:25:10'),
(13, 'module', '/home/module', 'N', '2022-07-26 11:25:10'),
(18, 'role', '/home/role', 'Y', '2022-08-03 06:14:23'),
(20, 'activity mapping', '/home/activity-mapping', 'Y', '2022-08-05 06:05:20'),
(24, 'Role Assign ', '/home/role-assign', 'Y', '2022-12-28 11:55:38'),
(26, 'Team', '/home/team', 'Y', '2022-12-30 10:30:13'),
(27, 'Series', '/home/series', 'Y', '2022-12-30 10:30:38'),
(28, 'Player', '/home/player', 'Y', '2022-12-30 10:31:01'),
(29, 'Matches', '/home/matches', 'Y', '2022-12-30 10:32:11'),
(30, 'Admin Creator', '/home/admin-creator', 'Y', '2023-01-03 06:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `otp` varchar(200) NOT NULL,
  `number` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `otp`, `number`, `date`) VALUES
(1, '$2b$12$TglLt6z92f96hdA9GIyLjek8Qbj40NBSrh0ddm3WIVH07kodGEXxO', '763048935345', '2022-09-03 09:45:02'),
(2, '$2b$12$ckXI902TvWih/CapMTjfFOXu0jRFP.U3YdnKzIXatM5UnzKOCNHC2', '855485896365', '2022-09-20 05:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `player_name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `age` varchar(200) NOT NULL,
  `player_type` varchar(50) DEFAULT NULL,
  `place` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `player_name`, `image`, `age`, `player_type`, `place`, `status`, `date`) VALUES
(6, 'himanshu', 'img-1672730713867-334191565.png', '22', 'Batsman', '', 'Y', '2023-01-03 07:25:13'),
(7, 'dsa', 'img-1672730790493-902984201.png', '25', 'Bowler', 'adsad', 'Y', '2023-01-03 07:26:30'),
(9, 'asa', 'img-1672734350446-952728955.png', '15', 'Batsman', 'jaipur', 'Y', '2023-01-03 08:25:50'),
(10, 'asa', 'img-1672734468863-337496049.png', '22', 'Batsman', 'jaipur', 'Y', '2023-01-03 08:27:48'),
(14, 'surbhi', 'img-1672738374109-37855367.png', '25', 'Batsman/Wicket keeper', 'jaipur', 'Y', '2023-01-03 09:32:54'),
(15, 'adfsa', 'img-1672741563921-644831163.png', '12', 'Bowler', 'sfd', 'Y', '2023-01-03 10:26:03'),
(16, 'dfsf', 'img-1672824196838-787709256.png', '25', 'Bowler', 'bareilly', 'Y', '2023-01-04 09:23:16'),
(17, 'rfd', 'img-1672824242377-914056357.png', '256', 'Batsman/Wicket keeper', 'jaipur', 'Y', '2023-01-04 09:24:02'),
(18, 'rahul', 'img-1672824750440-235494268.png', '26', 'Batsman', 'karnatak', 'Y', '2023-01-04 09:32:30'),
(20, 'asdas', 'img-1672910258747-239666753.png', '5', 'Bowler', 'dsfg', 'Y', '2023-01-05 09:17:38'),
(21, 'sudhanshu', 'img-1673241520917-374950504.png', '21', 'Batsman/Wicket keeper', 'spn', 'Y', '2023-01-09 05:18:40'),
(22, 'arpit', 'img-1673244277196-390372313.png', '19', 'All-Rounder', 'bareilly', 'Y', '2023-01-09 06:04:37'),
(23, 'hiamnshu', 'img-1674636115784-581666459.png', '21', 'Bowler', 'dfd', 'Y', '2023-01-25 08:41:55'),
(26, 'sdsd', 'img-1676369169885-211503442.png', '454554', 'Batsman/Wicket keeper', 'lolololo', 'Y', '2023-02-14 10:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `practice`
--

CREATE TABLE `practice` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `confirmpassword` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `practice`
--

INSERT INTO `practice` (`id`, `title`, `firstname`, `lastname`, `email`, `dob`, `password`, `confirmpassword`, `date`) VALUES
(18, 'Mrs', 'simran', 'mam', 'himanshu@gmail.com', '2023-02-02', '123456asd', 'asdasdfasdf', '2023-02-06 07:21:06'),
(19, 'Mr', 'nitin', 'nitin', 'him@gmail.com', '2023-02-06', '123456fg', 'sdfdsfd', '2023-02-06 08:45:21'),
(20, 'Mr', 'sudhanshu', 'mourya', 'himanshusd@gmail.com', '2023-02-06', '123456asa', 'asasasas', '2023-02-06 08:45:55'),
(23, 'Mr', 'subham', 'kumar', 'himanshusdf@sdr.sdfg', '2023-02-07', '123456', 'ads', '2023-02-06 12:26:23'),
(24, 'Mrs', 'Gourav', 'bittu', 'himanshu@srjdjjd.xcin', '2023-02-03', '123456', 'rt', '2023-02-06 12:26:58'),
(25, 'Miss', 'simran', 'mam', 'himanshu200@gmail.com', '2023-02-02', '123456asd', 'asdasdfasdf', '2023-02-06 12:43:45'),
(29, 'Mr', 'himanhsu', 'sdsdsds', 'himanshu@df.cxvvcx', '2023-02-10', '123456vxc', 'sdfsdf', '2023-02-10 09:34:41'),
(30, 'Mr', 'aditya', 'kumar', 'sads@cx.xzczx', '2023-02-11', '123456xzc', 'xczxczxczx', '2023-02-10 09:41:45'),
(31, 'Mr', 'shivam', 'kumar', 'himanshusd@df.zxfd', '2023-02-11', '123456', 'sdfsdf', '2023-02-10 09:57:48'),
(32, 'Ms', 'arpit', 'arpit', 'himanshu@gs.sssdsd', '2023-02-11', '123456', '45568978', '2023-02-10 12:31:33'),
(33, 'Mr', 'subham', 'bhusand', 'asds@hs.com', '2023-02-11', 'zxzxzx', 'zxzxzx', '2023-02-11 05:07:37'),
(34, 'Mrs', 'Himanshu', 'mishra', 'sd@gmai.cpom', '2023-02-11', 'sdfsdsd', 'sdafsdfsdaf', '2023-02-11 08:11:47'),
(35, 'Mr', 'hiamnshu', 'sdsdsda', 'as@gau.cmc', '2023-02-11', 'dfdfdf', 'dfdfdfdf', '2023-02-11 08:36:38'),
(36, 'Mr', 'Alok', 'mishra', 'zxcz@gmai.com', '2023-02-16', 'zxxczczxcx', 'zxcczxxcz', '2023-02-11 08:49:22'),
(37, 'Mr', 'surbhi', 'mam', 'asd@gmaio.com', '2023-02-11', 'asdasd', 'asdasddas', '2023-02-11 09:19:08'),
(38, 'Mr', 'nitin', 'chawala', 'nitin1232@gmail.com', '2023-02-13', 'qwertyuiop', 'qwertyuiop', '2023-02-13 05:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `role_assign` varchar(1) NOT NULL DEFAULT 'Y',
  `status` varchar(1) NOT NULL DEFAULT 'N',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `display_name`, `role_assign`, `status`, `date`) VALUES
(3, 'Super Admin', 'Super Administration', 'Y', 'Y', '2022-07-23 06:13:22'),
(5, 'Admin', 'Admin', 'Y', 'Y', '2022-10-08 07:47:08'),
(6, 'Master Admin', 'Master Admin', 'Y', 'Y', '2022-10-08 07:48:44'),
(7, 'Dubai Admin', 'Dubai Admin', 'Y', 'Y', '2022-12-06 11:25:09'),
(10, 'New Role For Admin', 'XYZ Admin', 'Y', 'Y', '2022-12-10 11:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `role_assign`
--

CREATE TABLE `role_assign` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_assign`
--

INSERT INTO `role_assign` (`id`, `user_id`, `role_id`, `status`, `date`) VALUES
(1, 14, 5, 'Y', '2022-10-11 09:35:10'),
(2, 15, 3, 'Y', '2022-10-11 09:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `id` int(11) NOT NULL,
  `Tournament_name` varchar(200) NOT NULL,
  `Match_type` varchar(200) NOT NULL,
  `series_type` int(200) NOT NULL,
  `ground_name` varchar(200) NOT NULL,
  `Bowl_type` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `Tournament_name`, `Match_type`, `series_type`, `ground_name`, `Bowl_type`, `status`, `date`) VALUES
(5, 'asd', '1', 0, 'asd', 'Three', 'Y', '2023-01-04 05:41:03'),
(6, 'sds', '2', 0, 'sdsd', 'Two', 'Y', '2023-01-04 05:45:51'),
(7, 'asa', '1', 0, 'asa', 'Two', 'Y', '2023-01-04 06:03:02'),
(8, 'asa', '2', 0, 'sda', 'Three', 'Y', '2023-01-04 06:05:15'),
(11, 'sdsds', '3', 1, 'dsds', 'One', 'Y', '2023-01-06 06:26:54'),
(12, 'sad', '1', 2, 'sad', 'One', 'Y', '2023-01-06 06:27:11'),
(13, 'sadasd', '1', 0, 'sdfsd', 'Two', 'Y', '2023-01-06 06:28:14'),
(14, 'asaa', '1', 0, 'sdfa', 'One', 'Y', '2023-01-06 06:28:25'),
(15, 'sdfs', '1', 3, 'sdf', '2', 'Y', '2023-01-06 06:28:34'),
(16, 'ipl', '2', 1, 'dfdfd', '1', 'Y', '2023-01-09 05:19:14'),
(17, 'india', '2', 2, 'dsf', '2', 'Y', '2023-01-09 05:35:06'),
(18, 's', '2', 2, 's', '3', 'Y', '2023-01-25 08:43:01'),
(19, 'ghh', '2', 1, 'ghg', '2', 'Y', '2023-01-25 08:43:31'),
(20, 'asd', 'T-20', 0, 'sd', 'two', 'Y', '2023-02-14 10:58:06'),
(21, 'dfsd', 'One Day', 0, 'dsf', 'two', 'Y', '2023-02-14 10:58:20'),
(22, 'lklolplk', 'One Day', 0, 'lpojyh', 'two', 'Y', '2023-02-23 09:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `Team_name` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `modify_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modify_by` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `Team_name`, `status`, `modify_date`, `modify_by`) VALUES
(1, 'miASA', 'Y', '2022-12-29 06:49:31', '2022-12-30 09:57:09'),
(8, 'jaipur', 'Y', '2022-12-29 09:08:11', '2022-12-30 09:57:09'),
(11, 'mi', 'Y', '2023-01-04 09:31:32', '2023-01-04 09:31:32'),
(12, 'csk', 'Y', '2023-01-04 09:31:38', '2023-01-04 09:31:38'),
(13, 'kkr', 'Y', '2023-01-04 09:31:44', '2023-01-04 09:31:44'),
(14, 'kxp', 'Y', '2023-01-04 09:31:51', '2023-01-04 09:31:51'),
(15, 'csk', 'Y', '2023-01-06 06:29:09', '2023-01-06 06:29:09'),
(16, 'jaipur', 'Y', '2023-01-06 06:29:16', '2023-01-06 06:29:16'),
(17, 'KXIP', 'Y', '2023-01-06 06:29:25', '2023-01-06 06:29:25'),
(18, 'RRR', 'Y', '2023-01-06 06:29:28', '2023-01-06 06:29:28'),
(19, 'sads', 'Y', '2023-01-07 10:11:40', '2023-01-07 10:11:40'),
(25, 'sdfasdf', 'Y', '2023-02-14 10:49:57', '2023-02-14 10:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `DOB` varchar(200) NOT NULL,
  `mobile_no` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `plan` varchar(200) NOT NULL,
  `buisness_catagory` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `business_name` varchar(200) NOT NULL,
  `slogan` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `upload_image` varchar(200) NOT NULL,
  `extra_element` varchar(200) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `DOB`, `mobile_no`, `gender`, `plan`, `buisness_catagory`, `password`, `business_name`, `slogan`, `address`, `email`, `upload_image`, `extra_element`, `register_date`, `status`) VALUES
(12, 'shivam ', '19-10-2001', '9354554564', 'male', 'launching rocket', 'airlines', '$2b$10$eMT1KkL/GTFEYywKZn7V6eP/YLZ3084V7w52ZsHSOsvJeKaqQqmFm', 'pppp', 'sajhj', 'mmmmm', '', 'upload_logo-1664443601761.jpg', 'extra_element-1664443601995.jpg', '2022-08-02 09:42:31', 'Y'),
(13, 'shivam ', '19-10-2001', '935455456', 'male', 'launching rocket', 'airlines', '$2b$10$HjyOAW9bZ6FkIqnTOXeDweb2hnjy8XeRFIv/GJrfVG6gWU5tjN9Pu', 'kdj', 'dfs', 'admm', 'ndka@gmail.com', 'upload_logo-1664783043216-574874419.png', 'extra_element-1664783043219-181236693.png', '2022-08-02 09:45:28', 'Y'),
(14, 'sudhanshu', '18-10-1999', '797625678', 'male', 'launching rocket', 'airlines', '$2b$10$Q5s0Ywrnf5O26AhhyfklNOk2.fAvktXh1BxWAEMTb7sR/EP.fwKBG', 'himanshu', 'pagal', 'jaipur', 'sdnak@gmail.com', 'upload_logo-1664800294359-404119217.png', 'extra_element-1664800294400-77986236.png', '2022-08-03 06:18:38', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_module`
--
ALTER TABLE `assign_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`),
  ADD KEY `role_x` (`role`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `highest`
--
ALTER TABLE `highest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_match`
--
ALTER TABLE `live_match`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`username`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `practice`
--
ALTER TABLE `practice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `display_name` (`display_name`);

--
-- Indexes for table `role_assign`
--
ALTER TABLE `role_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role` (`role_id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile no` (`mobile_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assign_module`
--
ALTER TABLE `assign_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `highest`
--
ALTER TABLE `highest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `live_match`
--
ALTER TABLE `live_match`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `practice`
--
ALTER TABLE `practice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `role_assign`
--
ALTER TABLE `role_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assign_module`
--
ALTER TABLE `assign_module`
  ADD CONSTRAINT `module` FOREIGN KEY (`module`) REFERENCES `module` (`id`),
  ADD CONSTRAINT `role_x` FOREIGN KEY (`role`) REFERENCES `role` (`id`);

--
-- Constraints for table `role_assign`
--
ALTER TABLE `role_assign`
  ADD CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
