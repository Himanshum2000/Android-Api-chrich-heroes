-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 14, 2022 at 08:23 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.6

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
  `id` int NOT NULL,
  `role` int NOT NULL,
  `module` int NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assign_module`
--

INSERT INTO `assign_module` (`id`, `role`, `module`, `status`, `date`) VALUES
(21, 5, 1, 'Y', '2022-10-11 09:47:21'),
(22, 5, 2, 'Y', '2022-10-11 09:47:21'),
(23, 5, 5, 'Y', '2022-10-11 09:47:21'),
(24, 5, 6, 'Y', '2022-10-11 09:47:21'),
(25, 5, 7, 'Y', '2022-10-11 09:47:21'),
(26, 5, 9, 'Y', '2022-10-11 09:47:21'),
(27, 5, 11, 'Y', '2022-10-11 09:47:21'),
(28, 5, 12, 'Y', '2022-10-11 09:47:21'),
(29, 5, 20, 'Y', '2022-10-11 09:47:21'),
(41, 6, 1, 'Y', '2022-12-06 10:44:55'),
(42, 6, 2, 'Y', '2022-12-06 10:44:55'),
(43, 6, 5, 'Y', '2022-12-06 10:44:55'),
(44, 6, 6, 'Y', '2022-12-06 10:44:55'),
(45, 6, 7, 'Y', '2022-12-06 10:44:55'),
(46, 6, 9, 'Y', '2022-12-06 10:44:55'),
(47, 6, 8, 'Y', '2022-12-06 10:44:55'),
(48, 6, 12, 'Y', '2022-12-06 10:44:55'),
(49, 6, 11, 'Y', '2022-12-06 10:44:55'),
(50, 6, 13, 'Y', '2022-12-06 10:44:55'),
(51, 6, 20, 'Y', '2022-12-06 10:44:55'),
(52, 6, 18, 'Y', '2022-12-06 10:44:55'),
(53, 6, 21, 'Y', '2022-12-06 10:44:55'),
(54, 6, 22, 'Y', '2022-12-06 10:44:55'),
(64, 7, 1, 'Y', '2022-12-10 12:54:01'),
(65, 7, 5, 'Y', '2022-12-10 12:54:01'),
(66, 7, 2, 'Y', '2022-12-10 12:54:01'),
(67, 7, 6, 'Y', '2022-12-10 12:54:01'),
(68, 7, 7, 'Y', '2022-12-10 12:54:01'),
(69, 7, 8, 'Y', '2022-12-10 12:54:01'),
(70, 7, 18, 'Y', '2022-12-10 12:54:01'),
(71, 7, 21, 'Y', '2022-12-10 12:54:01'),
(72, 3, 13, 'Y', '2022-12-13 09:17:41'),
(73, 3, 1, 'Y', '2022-12-13 09:17:41'),
(74, 3, 2, 'Y', '2022-12-13 09:17:41'),
(75, 3, 18, 'Y', '2022-12-13 09:17:41'),
(76, 3, 5, 'Y', '2022-12-13 09:17:41'),
(77, 3, 6, 'Y', '2022-12-13 09:17:41'),
(78, 3, 7, 'Y', '2022-12-13 09:17:41'),
(79, 3, 20, 'Y', '2022-12-13 09:17:41'),
(80, 3, 11, 'Y', '2022-12-13 09:17:41'),
(81, 3, 23, 'Y', '2022-12-13 09:17:41'),
(82, 3, 9, 'Y', '2022-12-13 09:17:41'),
(83, 3, 12, 'Y', '2022-12-13 09:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `name`, `type`, `image`, `status`, `date`) VALUES
(9, 'Admin', 'TB', 'add_banner-1670666531630-500147628.png', 'Y', '2022-10-08 09:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `brand_mail`
--

CREATE TABLE `brand_mail` (
  `id` int NOT NULL,
  `image` varchar(200) NOT NULL,
  `text` varchar(200) NOT NULL,
  `ruppy` varchar(200) NOT NULL,
  `actual_ruppy` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand_mail`
--

INSERT INTO `brand_mail` (`id`, `image`, `text`, `ruppy`, `actual_ruppy`, `date`) VALUES
(1, 'brand_mail-1664792055300.jpg', 'ajskajaknjah', '253', '253698', '2022-10-03 10:14:15'),
(2, 'brand_mail-1664792780849-985329391.png', 'ajskajaknjahabjbajs', '253654', '2532536', '2022-10-03 10:26:20'),
(3, 'brand_mail-1664800625780-394160040.png', 'dkajdbajb', '253688', '2536', '2022-10-03 12:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `buisness_category`
--

CREATE TABLE `buisness_category` (
  `id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buisness_category`
--

INSERT INTO `buisness_category` (`id`, `title`, `description`, `image`, `status`, `date`) VALUES
(1, 'buisness', 'describe', 'image-1663657429402-125451590.png', 'Y', '2022-09-20 07:03:49'),
(2, 'kuch  bhi', 'kuch nhi', 'image-1663662096390-850514840.png', 'Y', '2022-09-20 08:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `catagory`
--

CREATE TABLE `catagory` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catagory`
--

INSERT INTO `catagory` (`id`, `name`, `image`, `status`, `date`) VALUES
(43, 'Festivals', 'update_cat-1670655029393-583207658.png', 'Y', '2022-09-04 09:24:46'),
(44, 'International Programmer', 'update_cat-1670655040394-690203501.png', 'Y', '2022-09-13 06:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `how to use`
--

CREATE TABLE `how to use` (
  `id` int NOT NULL,
  `text` varchar(500) NOT NULL,
  `image_video` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `how to use`
--

INSERT INTO `how to use` (`id`, `text`, `image_video`, `date`) VALUES
(3, 'ashu', 'HTU-1670837826842-536813257.jpg', '2022-12-12 04:07:06'),
(4, 'ashu', 'HTU-1670837902577-57179791.mp4', '2022-12-12 04:08:22'),
(5, 'dfsdf', 'HTU-1670837826842-536813257.jpg', '2022-12-13 09:38:28'),
(6, 'Hello', 'HTU-1670926524126-32862098.jpg', '2022-12-13 10:15:24');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_assign` varchar(1) NOT NULL DEFAULT 'N',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `role_assign`, `date`) VALUES
(14, 'xyz', '$2b$10$BVMot5Sk7pEPKDIGINvS7e0KM6lK1DgdZD87lR2zfTusatwFBbxHu', 'Y', '2022-07-29 05:32:44'),
(15, 'abc', '$2b$10$7EXv188pmWwFXIpILKD4FeZF1k40LZOQ4Lj.aD.rqOGcCrI3ECJUO', 'Y', '2022-10-11 09:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `module_name`, `url`, `status`, `date`) VALUES
(1, 'dashboard', '/home/dashboard', 'Y', '2022-07-26 11:25:10'),
(2, 'sub cat mapping', '/home/sub-cat-mapping', 'Y', '2022-07-26 11:26:37'),
(5, 'catagory', '/home/catagory', 'Y', '2022-07-26 11:25:42'),
(6, 'plans', '/home/plans', 'Y', '2022-07-26 11:26:03'),
(7, 'slug', '/home/slug', 'Y', '2022-07-26 11:26:37'),
(8, 'sub catagory', '/home/sub-catagory', 'Y', '2022-07-26 11:25:10'),
(9, 'slug mapping', '/home/slug-mapping', 'Y', '2022-07-26 11:26:37'),
(11, 'user', '/home/user', 'Y', '2022-07-26 11:25:10'),
(12, 'Banner', '/home/banner', 'Y', '2022-07-26 11:25:10'),
(13, 'module', '/home/module', 'Y', '2022-07-26 11:25:10'),
(18, 'role', '/home/role', 'Y', '2022-08-03 06:14:23'),
(20, 'activity mapping', '/home/activity-mapping', 'Y', '2022-08-05 06:05:20'),
(21, 'Business Category', 'business-category', 'Y', '2022-10-11 06:51:52'),
(22, 'service', '/home/service', 'Y', '2022-12-06 09:40:12'),
(23, 'HOW To USE', '/home/how-to-use', 'Y', '2022-12-13 09:16:51');

-- --------------------------------------------------------

--
-- Table structure for table `offer_plan`
--

CREATE TABLE `offer_plan` (
  `id` int NOT NULL,
  `plan_name` varchar(250) NOT NULL,
  `month` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int NOT NULL,
  `otp` varchar(200) NOT NULL,
  `number` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `otp`, `number`, `date`) VALUES
(1, '$2b$12$TglLt6z92f96hdA9GIyLjek8Qbj40NBSrh0ddm3WIVH07kodGEXxO', '763048935345', '2022-09-03 09:45:02'),
(2, '$2b$12$ckXI902TvWih/CapMTjfFOXu0jRFP.U3YdnKzIXatM5UnzKOCNHC2', '855485896365', '2022-09-20 05:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `from` varchar(200) NOT NULL,
  `to` varchar(200) NOT NULL,
  `real_price` varchar(200) NOT NULL,
  `offer_price` varchar(200) NOT NULL,
  `total_download` int NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `name`, `from`, `to`, `real_price`, `offer_price`, `total_download`, `image`, `status`, `date`) VALUES
(10, 'basic', '2022-08-07', '2022-08-10', '500', '399', 200, 'Add_plan_img-1659336538718-378647567.png', 'Y', '2022-08-01 06:48:58'),
(11, 'premium', '2022-10-11', '2023-10-10', '899', '699', 100, 'Add_plan_img-1665219895297-983055850.png', 'Y', '2022-10-08 09:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `role_assign` varchar(1) NOT NULL DEFAULT 'Y',
  `status` varchar(1) NOT NULL DEFAULT 'N',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `display_name`, `role_assign`, `status`, `date`) VALUES
(3, 'Super Admin', 'Super Administration', 'Y', 'Y', '2022-07-23 06:13:22'),
(5, 'Admin', 'Admin', 'Y', 'Y', '2022-10-08 07:47:08'),
(6, 'Master Admin', 'Master Admin', 'Y', 'Y', '2022-10-08 07:48:44'),
(7, 'Dubai Admin', 'Dubai Admin', 'Y', 'Y', '2022-12-06 11:25:09'),
(10, 'New Role For Admin', 'XYZ Admin', 'N', 'N', '2022-12-10 11:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `role_assign`
--

CREATE TABLE `role_assign` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'Y',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_assign`
--

INSERT INTO `role_assign` (`id`, `user_id`, `role_id`, `status`, `date`) VALUES
(1, 14, 5, 'Y', '2022-10-11 09:35:10'),
(2, 15, 3, 'Y', '2022-10-11 09:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `select_your_business`
--

CREATE TABLE `select_your_business` (
  `id` int NOT NULL,
  `business_catagory` varchar(500) NOT NULL,
  `catagory` varchar(500) NOT NULL,
  `sub_catagory` varchar(500) NOT NULL,
  `image` varchar(500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `select_your_business`
--

INSERT INTO `select_your_business` (`id`, `business_catagory`, `catagory`, `sub_catagory`, `image`, `date`) VALUES
(2, 'ashu', 'jkhjkjhn', 'bjh', 'sbi-1670838133034-329351115.png', '2022-12-12 04:12:13');

-- --------------------------------------------------------

--
-- Table structure for table `slug`
--

CREATE TABLE `slug` (
  `id` int NOT NULL,
  `slug` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slug`
--

INSERT INTO `slug` (`id`, `slug`, `image`, `status`, `date`) VALUES
(16, 'Businessman ', 'add_slug-1663051353073-877731686.png', 'Y', '2022-09-13 06:42:33'),
(17, 'Freshers celebration', 'add_slug-1670657297997-448842447.png', 'Y', '2022-09-13 06:47:03'),
(18, ' 5 years experience developer\'s', 'add_slug-1670657315754-23778219.png', 'Y', '2022-09-13 06:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `slug_mapping`
--

CREATE TABLE `slug_mapping` (
  `id` int NOT NULL,
  `sugId` varchar(100) NOT NULL,
  `catId` int NOT NULL,
  `subcatId` int NOT NULL,
  `status` varchar(1) NOT NULL,
  `createOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifyOn` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slug_mapping`
--

INSERT INTO `slug_mapping` (`id`, `sugId`, `catId`, `subcatId`, `status`, `createOn`, `modifyOn`) VALUES
(1, '14', 43, 17, 'Y', '2022-09-22 09:28:58', 0),
(2, '16', 43, 17, 'Y', '2022-09-22 09:28:58', 0),
(3, '18', 43, 17, 'Y', '2022-09-22 09:28:58', 0),
(4, '17', 43, 17, 'Y', '2022-09-22 09:28:58', 0),
(5, '15', 43, 17, 'Y', '2022-09-22 09:28:58', 0),
(6, '16', 44, 19, 'Y', '2022-09-22 09:29:17', 0),
(7, '17', 44, 19, 'Y', '2022-09-22 09:29:17', 0),
(8, '16', 43, 18, 'Y', '2022-09-22 09:29:37', 0),
(9, '14', 0, 17, 'Y', '2022-09-22 09:29:46', 0),
(10, '15', 0, 17, 'Y', '2022-09-22 09:29:46', 0),
(11, '14', 43, 19, 'Y', '2022-09-22 09:44:04', 0),
(12, '15', 43, 19, 'Y', '2022-09-22 09:44:04', 0),
(13, '16', 43, 19, 'Y', '2022-09-22 09:44:04', 0),
(14, '14', 43, 20, 'Y', '2022-09-22 09:44:34', 0),
(15, '17', 43, 20, 'Y', '2022-09-22 09:44:34', 0),
(16, '16', 43, 20, 'Y', '2022-09-22 09:44:34', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub-cat-mapping`
--

CREATE TABLE `sub-cat-mapping` (
  `id` int NOT NULL,
  `cat_name` varchar(200) NOT NULL,
  `sub_cat_name` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub-cat-mapping`
--

INSERT INTO `sub-cat-mapping` (`id`, `cat_name`, `sub_cat_name`, `status`, `date`) VALUES
(11, 'Festivals', 'Holi', 'Y', '2022-12-10 12:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `sub_catagory`
--

CREATE TABLE `sub_catagory` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_catagory`
--

INSERT INTO `sub_catagory` (`id`, `name`, `image`, `status`, `date`) VALUES
(17, 'Holi', 'add_sub_cat-1662283535813-230624577.png', 'Y', '2022-09-04 09:25:35'),
(18, 'Businessman ', 'add_sub_cat-1663050461884-351806552.png', 'Y', '2022-09-13 06:27:41'),
(19, 'Programmers celibration', 'add_sub_cat-1663050763025-692632444.png', 'Y', '2022-09-13 06:32:43'),
(20, 'Developer celebration ', 'add_sub_cat-1663051456339-307987347.png', 'Y', '2022-09-13 06:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
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
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
-- Indexes for table `brand_mail`
--
ALTER TABLE `brand_mail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buisness_category`
--
ALTER TABLE `buisness_category`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `catagory`
--
ALTER TABLE `catagory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `how to use`
--
ALTER TABLE `how to use`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`username`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `offer_plan`
--
ALTER TABLE `offer_plan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_name` (`plan_name`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

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
-- Indexes for table `select_your_business`
--
ALTER TABLE `select_your_business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slug`
--
ALTER TABLE `slug`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `slug_mapping`
--
ALTER TABLE `slug_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub-cat-mapping`
--
ALTER TABLE `sub-cat-mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_catagory`
--
ALTER TABLE `sub_catagory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Add_Catagory_name` (`name`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brand_mail`
--
ALTER TABLE `brand_mail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buisness_category`
--
ALTER TABLE `buisness_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `how to use`
--
ALTER TABLE `how to use`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `offer_plan`
--
ALTER TABLE `offer_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role_assign`
--
ALTER TABLE `role_assign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `select_your_business`
--
ALTER TABLE `select_your_business`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slug`
--
ALTER TABLE `slug`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `slug_mapping`
--
ALTER TABLE `slug_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sub-cat-mapping`
--
ALTER TABLE `sub-cat-mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_catagory`
--
ALTER TABLE `sub_catagory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
