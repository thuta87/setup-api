-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2020 at 04:47 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_code` varchar(30) NOT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `description` varchar(1000) DEFAULT NULL,
  `category_image` varchar(200) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_code`, `category_name`, `parent_id`, `description`, `category_image`, `created`) VALUES
(1, '001', 'Men Fashion', 0, NULL, NULL, '2020-01-16 09:53:29'),
(2, '002', 'Women Fashion', 0, NULL, NULL, '2020-01-16 09:53:29'),
(3, '001001', 'Clothing', 1, NULL, NULL, '2020-01-16 09:53:29'),
(4, '001002', 'Men\'s Bag', 1, NULL, NULL, '2020-01-16 09:53:29'),
(5, '001003', 'Shoes', 1, NULL, NULL, '2020-01-16 09:53:29'),
(6, '001004', 'Accessories', 1, NULL, NULL, '2020-01-31 03:24:43'),
(7, '001005', 'Boy\'s Fashion', 1, NULL, NULL, '2020-01-31 03:24:43'),
(8, '001006', 'Travel & Luggage', 1, NULL, NULL, '2020-01-31 03:24:43'),
(9, '001001001', 'Casual Tops', 3, NULL, NULL, '2020-01-31 03:28:30'),
(10, '001001002', 'Hoodies & Sweatshirts', 3, NULL, NULL, '2020-01-31 03:28:30'),
(11, '001001003', 'Jackets & Coats', 3, NULL, NULL, '2020-01-31 03:28:30'),
(12, '001001004', 'Polo Shirts', 3, NULL, NULL, '2020-01-31 03:28:30'),
(13, '001001005', 'Shirts', 3, NULL, NULL, '2020-01-31 03:28:30'),
(14, '001001006', 'Jeans', 3, NULL, NULL, '2020-01-31 03:28:30'),
(15, '001001007', 'Pants', 3, NULL, NULL, '2020-01-31 03:28:30'),
(16, '001001008', 'Sweaters & Cardigans', 3, NULL, NULL, '2020-01-31 03:28:30'),
(17, '001002001', 'Backpacks', 4, NULL, NULL, '2020-01-31 03:30:07'),
(18, '001002002', 'Wallets & Accessories', 4, NULL, NULL, '2020-01-31 03:30:07'),
(19, '001007', 'Boy\'s Fashion', 1, NULL, NULL, '2020-02-10 03:06:53'),
(20, '001003001', 'Boots', 5, NULL, NULL, '2020-02-10 03:06:53'),
(21, '001003002', 'Flip Flops & Sandals', 5, NULL, NULL, '2020-02-10 03:06:53'),
(22, '001003003', 'Formal Shoes', 5, NULL, NULL, '2020-02-10 03:06:53'),
(23, '001007001', 'Boy\'s Clothing', 19, NULL, NULL, '2020-02-10 03:06:53'),
(24, '001007002', 'Boy\'s Shoes', 19, NULL, NULL, '2020-02-10 03:06:53'),
(25, '001007003', 'Boy\'s Accessories', 19, NULL, NULL, '2020-02-10 03:06:53');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) DEFAULT NULL,
  `is_physical` tinyint(4) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `township` varchar(100) DEFAULT NULL,
  `post_code` varchar(5) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `channel_inventory`
--

CREATE TABLE `channel_inventory` (
  `rec_id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `collection_id` int(11) NOT NULL,
  `collection_code` varchar(30) NOT NULL,
  `collection_name` varchar(200) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `description` varchar(1000) DEFAULT NULL,
  `IsManual` tinyint(4) DEFAULT NULL,
  `IsAuto` tinyint(4) DEFAULT NULL,
  `collection_image` varchar(200) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`collection_id`, `collection_code`, `collection_name`, `parent_id`, `description`, `IsManual`, `IsAuto`, `collection_image`, `created`) VALUES
(1, '001', 'Test Parent 1', 0, 'This is the parent 1 ', 0, 1, NULL, '2020-01-02 09:52:58'),
(2, '001002', 'Test child 1', 1, 'This is test 2', 1, 1, NULL, '2020-01-02 09:53:30'),
(3, '001001', 'Test child 2', 1, 'This is test 3', 1, 0, NULL, '2020-01-02 09:53:51'),
(4, '002', 'Test Parent 2', 0, 'This is the parent 2', 0, 1, NULL, '2020-02-11 03:21:03'),
(5, '001002001', 'Test grandchild 1', 2, 'This is the grandchild 1', 1, 1, NULL, '2020-02-11 03:21:03'),
(6, '001002002', 'Test grandchild 2', 2, 'This is the grandchild 2', 1, 1, NULL, '2020-02-11 03:21:03'),
(7, '002001', 'Test child 3', 4, 'This is child 3', 1, 0, NULL, '2020-02-11 03:22:39'),
(8, '002002', 'Test child 4', 4, 'This is child 4', 1, 0, NULL, '2020-02-11 03:22:39'),
(9, '001002001001', 'Test great granchild 1', 5, 'This is the great grandchild 1', 1, 1, NULL, '2020-02-11 03:22:39'),
(10, '001002001002', 'Test great granchild 2', 5, 'This is the great grandchild 2', 1, 0, NULL, '2020-02-11 03:23:57'),
(11, '001002001003', 'Test great granchild 3', 5, 'This is the great grandchild 3', 1, 0, NULL, '2020-02-11 03:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `collections_formula`
--

CREATE TABLE `collections_formula` (
  `formula_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `param_1` varchar(100) DEFAULT NULL,
  `condition` varchar(100) DEFAULT NULL,
  `param_2` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `tags` varchar(1000) DEFAULT NULL,
  `original_price` int(11) DEFAULT NULL,
  `retail_price` int(11) DEFAULT NULL,
  `sku` varchar(45) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `negative_qty` tinyint(4) DEFAULT NULL,
  `is_physical` tinyint(4) DEFAULT NULL,
  `weight` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `image`, `category_id`, `collection_id`, `tags`, `original_price`, `retail_price`, `sku`, `barcode`, `negative_qty`, `is_physical`, `weight`) VALUES
(2, 'CRSL WALLET LONG', 'Morbi iaculis, mi quis porta congue, ligula enim ornare justo, ut sollicitudin neque odio ut turpis. Interdum et malesuada fames.', 'http://192.168.0.50/Y_1/Y1B_21948.jpg', 4, 2, 'CR', 78000, 78000, 'pcs', '0103-61511', 0, 1, '2'),
(3, 'GIO MEN SPORT-SHIRT', 'Ut tempus neque quam, non luctus turpis facilisis a. Sed quis pellentesque nulla, et pretium enim. Integer vel lacus id.', 'http://192.168.0.50/Y_1/Y1B_22117%e6%9b%b4%e6%96%b0.jpg', 4, 3, 'GIO', 29990, 29990, 'pcs', '01016322', 0, 1, '3'),
(4, 'TRI S/S SP-014001', 'Mauris gravida facilisis tortor vel aliquam. Phasellus eleifend iaculis elementum. Maecenas ac odio ac nunc iaculis scelerisque. Nam efficitur dui.', 'http://192.168.0.50/Y_1/Y1B_22172.jpg', 4, 1, 'TRI', 14900, 21900, 'pcs', '01014001', 0, 1, '4'),
(5, 'TRI T/S  MST-024207', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed commodo et lacus dapibus vestibulum. Fusce.', 'http://192.168.0.50/Y_1/Y1B_22228.jpg', 4, 1, 'TRI', 13900, 19900, 'pcs', '01014002', 0, 1, '5'),
(6, 'TRI Lady Hoody JH-035303', 'Praesent neque lorem, luctus non leo eget, blandit gravida orci. Maecenas vitae elit ac est commodo aliquet vitae vel ante.', 'http://192.168.0.50/Y_1/Y1B_22317.jpg', 4, 4, 'TRI', 16900, 16900, 'pcs', '01035303', 0, 1, '6'),
(7, 'TRI Lady Hoody JH-035303', 'Donec et tortor sed eros blandit porttitor. Vestibulum vel erat pulvinar, dictum risus posuere, eleifend urna. Curabitur facilisis aliquet tincidunt.', 'http://192.168.0.50/Y_1/Y1B_22412.jpg', 4, 4, 'TRI', 16900, 16900, 'pcs', '01035303', 0, 1, '2'),
(8, 'CRSL WALLET LONG', 'Duis bibendum nunc sit amet eleifend tempor. Donec dignissim lectus sem, fermentum sagittis neque sollicitudin a. Curabitur risus erat, rhoncus.', 'http://192.168.0.50/Y_1/Y1B_22484.jpg', 4, 1, 'CR', 78000, 78000, 'pcs', '0103-61511', 0, 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `townships`
--

CREATE TABLE `townships` (
  `township_id` int(11) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `township` varchar(45) DEFAULT NULL,
  `post_code` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `townships`
--

INSERT INTO `townships` (`township_id`, `state`, `name`, `township`, `post_code`) VALUES
(1, 'Yangon', 'Ahlone', 'Ahlone', '11121'),
(2, 'Yangon', 'Aung San', 'Insein', '11012'),
(3, 'Yangon', 'Bahan', 'Bahan', '11201'),
(4, 'Yangon', 'Bayintnaung Market (Thamine)', 'Mayangone', '11062'),
(5, 'Yangon', 'Bogyoke Market	', 'Pabedan', '11143'),
(6, 'Yangon', 'Botahtaung', 'Botahtaung', '11162'),
(7, 'Yangon', 'Botahtaung', 'Botahtaung', '11161'),
(8, 'Yangon', 'Dagon', 'Dagon', '11191'),
(9, 'Yangon', 'Dagon Myothit (North)', 'Dagon Myothit (North)', '11421'),
(10, 'Yangon', 'Dagon Myothit (South)', 'Dagon Myothit (South)', '11431'),
(11, 'Yangon', 'Dawbon', 'Dawbon', '11241'),
(12, 'Yangon', 'Hlaing', 'Hlaing', '11051'),
(13, 'Yangon', 'Hlaing Thar Yar', 'Hlaing Thar Yar', '11401'),
(14, 'Yangon', 'Insein', 'Insein', '11011'),
(15, 'Yangon', 'Kaba Aye	', 'Mayangone', '11061'),
(16, 'Yangon', 'Kamayut', 'Kamayut', '11041'),
(17, 'Yangon', 'Kyauk Tan', 'Kyauk Tan', '11301'),
(18, 'Yangon', 'Kyauktada', 'Kyauktada', '11182'),
(19, 'Yangon', 'Kyeemyindaing', 'Kyimyindaing', '11101'),
(20, 'Yangon', 'Lanmadaw', 'Lanmadaw', '11131'),
(21, 'Yangon', 'Mingalar Taung Nyunt', 'Mingalar Taung Nyunt', '11221'),
(22, 'Yangon', 'Mingalardon', 'Mingalardon', '11021'),
(23, 'Yangon', 'Okkalapa (North)	', 'Okkalapa (North)	', '11031'),
(24, 'Yangon', 'Okkalapa (South)', 'Okkalapa (South)', '11091'),
(25, 'Yangon', 'Pabedan', 'Pabedan', '11141'),
(26, 'Yangon', 'Pazundaung', 'Pazundaung', '11171'),
(27, 'Yangon', 'Pyi Thar Yar', 'Yankin', '11082'),
(28, 'Yangon', 'Sanchaung', 'Sanchaung', '11111'),
(29, 'Yangon', 'Shwe Pyi Thar', 'Shwe Pyi Thar', '11411'),
(30, 'Yangon', 'Shwepaukan', 'Okkalapa (North)', '11032'),
(31, 'Yangon', 'Tamwe', 'Tamwe', '11211'),
(32, 'Yangon', 'Tanyin', 'Tanyin', '11291'),
(33, 'Yangon', 'Thamine College	', 'Hlaing', '11052'),
(34, 'Yangon', 'Tharkayta', 'Tharkayta', '11231'),
(35, 'Yangon', 'Theingyi Market', 'Pabedan', '11142'),
(36, 'Yangon', 'Thingangyun', 'Thingangyun', '11071'),
(37, 'Yangon', 'Thuwunna', 'Thingangyun', '11072'),
(38, 'Yangon', 'Yangon (Main Post Office)	', 'Yangon', '11181'),
(39, 'Yangon', 'Yangon Station', 'Mingalar Taung Nyunt', '11222'),
(40, 'Yangon', 'Yankin', 'Yankin', '11081');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`channel_id`);

--
-- Indexes for table `channel_inventory`
--
ALTER TABLE `channel_inventory`
  ADD PRIMARY KEY (`rec_id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`collection_id`);

--
-- Indexes for table `collections_formula`
--
ALTER TABLE `collections_formula`
  ADD PRIMARY KEY (`formula_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `townships`
--
ALTER TABLE `townships`
  ADD PRIMARY KEY (`township_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `channel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channel_inventory`
--
ALTER TABLE `channel_inventory`
  MODIFY `rec_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `collection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `collections_formula`
--
ALTER TABLE `collections_formula`
  MODIFY `formula_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `townships`
--
ALTER TABLE `townships`
  MODIFY `township_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
