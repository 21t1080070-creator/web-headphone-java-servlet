-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 13, 2026 lúc 10:31 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tainghe`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(4, 'Cables'),
(3, 'Ear Pad'),
(2, 'EarPhone'),
(1, 'HeadPhone');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `ImageID` int(11) NOT NULL,
  `VariantID` int(11) NOT NULL,
  `Image_url` varchar(500) NOT NULL,
  `Sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`ImageID`, `VariantID`, `Image_url`, `Sort_order`) VALUES
(1, 1, 'MW75 Grey Leather 1.png', 1),
(2, 1, 'MW75 Grey Leather 2.png', 2),
(3, 1, 'MW75 Grey Leather 3.png', 3),
(4, 2, 'MW75 Navy Leather 1.png', 1),
(5, 2, 'MW75 Navy Leather 2.png', 2),
(6, 2, 'MW75 Navy Leather 3.png', 3),
(7, 3, 'MW75 Black Leather 1.png', 1),
(8, 3, 'MW75 Black Leather 2.png', 2),
(9, 3, 'MW75 Black Leather 3.png', 3),
(10, 4, 'MG20 Galactic White 1.png', 1),
(11, 4, 'MG20 Galactic White 2.png', 2),
(12, 4, 'MG20 Galactic White 3.png', 3),
(13, 5, 'MG20 Sand Dune 1.png', 1),
(14, 5, 'MG20 Sand Dune 2.png', 2),
(15, 5, 'MG20 Sand Dune 3.png', 3),
(16, 6, 'MG20 Black Onyx 1.png', 1),
(17, 6, 'MG20 Black Onyx 2.png', 2),
(18, 6, 'MG20 Black Onyx 3.png', 3),
(19, 7, 'MW50+ Brown Leather 1.png', 1),
(20, 7, 'MW50+ Brown Leather 2.png', 2),
(21, 7, 'MW50+ Brown Leather 3.png', 3),
(22, 8, 'MW50+ Black Leather 1.png', 1),
(23, 8, 'MW50+ Black Leather 2.png', 2),
(24, 8, 'MW50+ Black Leather 3.png', 3),
(25, 9, 'MH40 Wireless Tan Leather 1.png', 1),
(26, 9, 'MH40 Wireless Tan Leather 2.png', 2),
(27, 9, 'MH40 Wireless Tan Leather 3.png', 3),
(28, 10, 'MH40 Wireless White Leather 1.png', 1),
(29, 10, 'MH40 Wireless White Leather 2.png', 2),
(30, 10, 'MH40 Wireless White Leather 3.png', 3),
(31, 11, 'MH40 Wireless Navy Leather 1.png', 1),
(32, 11, 'MH40 Wireless Navy Leather 2.png', 2),
(33, 11, 'MH40 Wireless Navy Leather 3.png', 3),
(34, 12, 'MH40 Wired Black Leather 1.png', 1),
(35, 12, 'MH40 Wired Black Leather 2.png', 2),
(36, 12, 'MH40 Wired Black Leather 3.png', 3),
(37, 13, 'MH40 Wired Camo Leather 1.png', 1),
(38, 13, 'MH40 Wired Camo Leather 2.png', 2),
(39, 13, 'MH40 Wired Camo Leather 3.png', 3),
(40, 14, 'MH40 APPLIED ART FORMS Orange 1.png', 1),
(41, 14, 'MH40 APPLIED ART FORMS Orange 2.png', 2),
(42, 14, 'MH40 APPLIED ART FORMS Orange 3.png', 3),
(43, 15, 'MW75 TUMI Black 1.png', 1),
(44, 15, 'MW75 TUMI Black 2.png', 2),
(45, 15, 'MW75 TUMI Black 3.png', 3),
(46, 16, 'MW75 TUMI Silver 1.png', 1),
(47, 16, 'MW75 TUMI Silver 2.png', 2),
(48, 16, 'MW75 TUMI Silver 3.png', 3),
(49, 17, 'MW75_Automobili_Lamborghini_Black_and_White_1.png', 1),
(50, 17, 'MW75_Automobili_Lamborghini_Black_and_White_2.png', 2),
(51, 17, 'MW75_Automobili_Lamborghini_Black_and_White_3.png', 3),
(52, 18, 'MG20 Automobili Lamborghini Green 1.png', 1),
(53, 18, 'MG20 Automobili Lamborghini Green 2.png', 2),
(54, 18, 'MG20 Automobili Lamborghini Green 3.png', 3),
(55, 19, 'MG20 BUGATTI Lake Blue 1.png', 1),
(56, 19, 'MG20 BUGATTI Lake Blue 2.png', 2),
(57, 19, 'MG20 BUGATTI Lake Blue 3.png', 3),
(58, 20, 'MG20 BUGATTI Jet Orange 1.png', 1),
(59, 20, 'MG20 BUGATTI Jet Orange 2.png', 2),
(60, 20, 'MG20 BUGATTI Jet Orange 3.png', 3),
(61, 21, 'MG20 BUGATTI Deep Blue 1.png', 1),
(62, 21, 'MG20 BUGATTI Deep Blue 2.png', 2),
(63, 21, 'MG20 BUGATTI Deep Blue 3.png', 3),
(64, 22, 'MG20 BAPE Pink Camo 1.png', 1),
(65, 22, 'MG20 BAPE Pink Camo 2.png', 2),
(66, 22, 'MG20 BAPE Pink Camo 3.png', 3),
(67, 23, 'MG20 BAPE Blue Camo 1.png', 1),
(68, 23, 'MG20 BAPE Blue Camo 2.png', 2),
(69, 23, 'MG20 BAPE Blue Camo 3.png', 3),
(70, 24, 'MW09 TUMI Silver 1.png', 1),
(71, 24, 'MW09 TUMI Silver 2.png', 2),
(72, 24, 'MW09 TUMI Silver 3.png', 3),
(73, 25, 'MW09 TUMI Black 1.png', 1),
(74, 25, 'MW09 TUMI Black 2.png', 2),
(75, 25, 'MW09 TUMI Black 3.png', 3),
(76, 26, 'MW09 Blue 1.png', 1),
(77, 26, 'MW09 Blue 2.png', 2),
(78, 26, 'MW09 Blue 3.png', 3),
(79, 27, 'MW09 Gunmetal 1.png', 1),
(80, 27, 'MW09 Gunmetal 2.png', 2),
(81, 27, 'MW09 Gunmetal 3.png', 3),
(82, 28, 'MW09 Black 1.png', 1),
(83, 28, 'MW09 Black 2.png', 2),
(84, 28, 'MW09 Black 3.png', 3),
(85, 29, 'ME05 Black 1.png', 1),
(86, 29, 'ME05 Black 2.png', 2),
(87, 29, 'ME05 Black 3.png', 3),
(88, 30, 'ME05 White 1.png', 1),
(89, 30, 'ME05 White 2.png', 2),
(90, 30, 'ME05 White 3.png', 3),
(91, 31, 'ME05 Gold 1.png', 1),
(92, 31, 'ME05 Gold 2.png', 2),
(93, 31, 'ME05 Gold 3.png', 3),
(94, 32, 'MW08 Sport Blue 1.png', 1),
(95, 32, 'MW08 Sport Blue 2.png', 2),
(96, 32, 'MW08 Sport Blue 3.png', 3),
(97, 33, 'MW08 Sport Automobili Lamborghini Black 1.png', 1),
(98, 33, 'MW08 Sport Automobili Lamborghini Black 2.png', 2),
(99, 33, 'MW08 Sport Automobili Lamborghini Black 3.png', 3),
(100, 34, 'MW08 Sport Mercedes-AMG Black 1.png', 1),
(101, 34, 'MW08 Sport Mercedes-AMG Black 2.png', 2),
(102, 34, 'MW08 Sport Mercedes-AMG Black 3.png', 3),
(103, 35, 'MW08 BUGATTI Orange 1.png', 1),
(104, 35, 'MW08 BUGATTI Orange 2.png', 2),
(105, 35, 'MW08 BUGATTI Orange 3.png', 3),
(106, 36, 'MW08 BUGATTI Deep Blue 1.png', 1),
(107, 36, 'MW08 BUGATTI Deep Blue 2.png', 2),
(108, 36, 'MW08 BUGATTI Deep Blue 3.png', 3),
(109, 37, 'MW08 BUGATTI Steel 1.png', 1),
(110, 37, 'MW08 BUGATTI Steel 2.png', 2),
(111, 37, 'MW08 BUGATTI Steel 3.png', 3),
(112, 38, 'MW75 Ear Pads Brown 1.png', 1),
(113, 39, 'MW75 Ear Pads Black 1.png', 1),
(114, 40, 'MW75 Ear Pads Grey 1.png', 1),
(115, 41, 'MG20 Ear Pads Black 1.png', 1),
(116, 42, 'MW65 Ear Pads Brown 1.png', 1),
(117, 43, 'MW65 Ear Pads Black 1.png', 1),
(118, 44, 'MW60 Ear Pads Royal 1.png', 1),
(119, 45, 'MW60 Ear Pads Grey 1.png', 1),
(120, 46, 'MW60 Ear Pads Burgundy 1.png', 1),
(121, 47, 'MW50+ Over-Ear Ear Pads Black 1.png', 1),
(122, 48, 'MW50+ Over-Ear Ear Pads Brown 1.png', 1),
(123, 49, 'MW50+ On-Ear Ear Pads Black 1.png', 1),
(124, 50, 'MW50+ On-Ear Ear Pads Brown 1.png', 1),
(125, 51, 'MH40_Wireless_Ear_Pads_Grey_1.png', 1),
(126, 52, 'MH40_Wireless_Ear_Pads_Navy_1.png', 1),
(127, 53, 'MH40_Wireless_Ear_Pads_Black_1.png', 1),
(128, 54, 'MH30 Ear Pads Navy 1.png', 1),
(129, 55, 'MH30 Ear Pads Black 1.png', 1),
(130, 56, 'MH30 Ear Pads Grey 1.png', 1),
(131, 57, 'USB-C to 3.5mm Audio Cable Silver 1.png', 1),
(132, 58, 'USB-C to 3.5mm Audio Cable Black 1.png', 1),
(133, 59, 'USB-C to USB-C Braided Charging Cable Black 1.png', 1),
(134, 60, 'USB-C to 3.5mm Braided Audio Cable Black 1.png', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import`
--

CREATE TABLE `import` (
  `ImportID` int(11) NOT NULL,
  `DateImport` date NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Pending',
  `TotalAmount` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `import`
--

INSERT INTO `import` (`ImportID`, `DateImport`, `SupplierID`, `Status`, `TotalAmount`) VALUES
(1, '2025-12-20', 2, 'Pending', 0),
(2, '2025-12-20', 3, 'Completed', 6000),
(3, '2025-12-20', 4, 'Completed', 4800),
(4, '2025-12-20', 4, 'Completed', 4000),
(5, '2025-12-20', 1, 'Completed', 1650),
(6, '2025-12-21', 3, 'Pending', 0),
(7, '2025-12-21', 1, 'Completed', 2000),
(8, '2026-02-06', 3, 'Completed', 2300);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import_detail`
--

CREATE TABLE `import_detail` (
  `ImportID` int(11) NOT NULL,
  `VariantID` int(11) NOT NULL,
  `Quantity_Import` int(11) NOT NULL,
  `PriceImport` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `import_detail`
--

INSERT INTO `import_detail` (`ImportID`, `VariantID`, `Quantity_Import`, `PriceImport`) VALUES
(2, 53, 30, '200.00'),
(3, 19, 12, '400.00'),
(4, 18, 20, '200.00'),
(5, 5, 3, '350.00'),
(5, 48, 3, '200.00'),
(7, 28, 10, '200.00'),
(8, 41, 2, '400.00'),
(8, 51, 5, '300.00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `DateOrder` datetime NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`OrderID`, `DateOrder`, `UserID`, `Status`) VALUES
(1, '2025-12-19 08:56:55', 3, 'Success'),
(2, '2025-12-19 08:57:32', 3, 'Success'),
(3, '2025-12-19 09:02:20', 3, 'Success'),
(4, '2025-12-20 01:58:22', 2, 'Success'),
(6, '2025-12-20 02:51:07', 3, 'Success'),
(8, '2025-12-20 02:51:29', 3, 'Success'),
(9, '2025-12-20 06:21:16', 3, 'Success'),
(10, '2025-12-20 06:29:38', 3, 'Pending'),
(11, '2025-12-20 06:36:10', 3, 'Pending'),
(12, '2025-12-20 06:41:59', 3, 'Pending'),
(13, '2025-12-20 06:44:23', 3, 'Confirmed'),
(14, '2025-12-20 07:17:40', 3, 'Confirmed'),
(16, '2025-12-20 08:56:45', 3, 'Pending'),
(17, '2025-12-20 09:10:51', 3, 'Confirmed'),
(18, '2025-12-21 05:34:07', 12, 'Pending'),
(19, '2025-12-21 05:42:20', 12, 'Pending'),
(21, '2025-12-21 08:40:53', 3, 'Pending'),
(22, '2025-12-21 08:42:34', 2, 'Success'),
(23, '2025-12-21 08:59:36', 3, 'Pending'),
(24, '2025-12-21 09:05:33', 12, 'Pending'),
(25, '2025-12-21 09:05:47', 12, 'Pending'),
(26, '2025-12-21 09:08:07', 3, 'Pending'),
(27, '2025-12-21 09:08:38', 12, 'Pending'),
(28, '2025-12-21 09:08:50', 12, 'Pending'),
(29, '2025-12-21 09:11:56', 3, 'Pending'),
(30, '2025-12-21 09:19:06', 11, 'Success'),
(31, '2025-12-21 09:47:17', 3, 'Pending'),
(32, '2025-12-21 10:02:32', 3, 'Cancelled'),
(33, '2025-12-21 10:04:41', 3, 'Confirmed'),
(34, '2025-12-23 06:55:48', 3, 'Success'),
(35, '2026-01-10 00:13:05', 3, 'Pending'),
(36, '2026-01-10 01:35:21', 3, 'Pending'),
(37, '2026-01-10 02:29:18', 3, 'Pending'),
(38, '2026-01-10 03:23:20', 3, 'Pending'),
(39, '2026-01-10 03:32:13', 13, 'Cancelled'),
(40, '2026-01-10 16:04:59', 3, 'Pending'),
(41, '2026-02-06 14:43:38', 3, 'Confirmed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `OrderID` int(11) NOT NULL,
  `VariantID` int(11) NOT NULL,
  `Quantity_Order` int(11) NOT NULL,
  `Price_Order` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`OrderID`, `VariantID`, `Quantity_Order`, `Price_Order`) VALUES
(1, 4, 1, '449.00'),
(1, 5, 1, '499.00'),
(2, 26, 3, '399.00'),
(2, 28, 2, '399.00'),
(3, 59, 1, '29.00'),
(4, 1, 1, '599.00'),
(6, 41, 1, '49.00'),
(8, 21, 1, '629.00'),
(9, 1, 1, '599.00'),
(10, 29, 2, '199.00'),
(11, 24, 9, '450.00'),
(12, 1, 1, '599.00'),
(12, 33, 1, '399.00'),
(12, 42, 1, '49.00'),
(12, 60, 1, '29.00'),
(13, 42, 1, '49.00'),
(14, 1, 1, '599.00'),
(16, 41, 1, '49.00'),
(17, 41, 2, '49.00'),
(18, 26, 3, '399.00'),
(18, 28, 5, '399.00'),
(18, 33, 3, '399.00'),
(18, 36, 6, '399.00'),
(19, 24, 16, '450.00'),
(19, 33, 2, '399.00'),
(21, 1, 1, '599.00'),
(22, 26, 1, '399.00'),
(23, 29, 1, '199.00'),
(24, 26, 1, '399.00'),
(24, 27, 6, '429.00'),
(24, 28, 4, '399.00'),
(25, 26, 1, '399.00'),
(25, 27, 6, '429.00'),
(25, 28, 4, '399.00'),
(26, 18, 1, '499.00'),
(27, 32, 1, '349.00'),
(28, 51, 1, '49.00'),
(29, 4, 1, '449.00'),
(30, 2, 3, '549.00'),
(30, 3, 4, '599.00'),
(31, 2, 4, '549.00'),
(31, 3, 8, '599.00'),
(32, 26, 1, '399.00'),
(33, 1, 1, '599.00'),
(34, 17, 1, '649.00'),
(34, 20, 2, '629.00'),
(35, 4, 3, '449.00'),
(36, 4, 2, '449.00'),
(36, 6, 2, '499.00'),
(37, 26, 1, '399.00'),
(38, 41, 1, '49.00'),
(39, 4, 3, '449.00'),
(40, 3, 2, '599.00'),
(41, 2, 1, '549.00'),
(41, 3, 3, '599.00'),
(41, 33, 2, '399.00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `Description`, `CategoryID`) VALUES
(1, 'MW75', 'Active Noise-Cancelling Wireless Headphones', 1),
(2, 'MG20', 'Wireless Gaming Headphones', 1),
(3, 'MW50+', '2-in-1 Wireless On-Ear + Over-Ear Headphones', 1),
(4, 'MH40 Wireless', 'Wireless Over-Ear Headphones', 1),
(5, 'MH40 Wired', 'Over-Ear Headphones', 1),
(6, 'MH40 APPLIED ART FORMS', 'Wireless Over-Ear Headphones', 1),
(7, 'MW75 TUMI', 'Noise-Cancelling Wireless Headphones', 1),
(8, 'MW75_Automobili_Lamborghini', 'Active Noise-Cancelling Wireless Headphones', 1),
(9, 'MG20 Automobili Lamborghini', 'Wireless Gaming Headphones', 1),
(10, 'MG20 BUGATTI', 'Wireless Gaming Headphones', 1),
(11, 'MG20 BAPE', 'Wireless Gaming Headphones', 1),
(12, 'MW09 TUMI', 'Active Noise-Cancelling True Wireless Earphones', 2),
(13, 'MW09', 'Active Noise-Cancelling True Wireless Earphones', 2),
(14, 'ME05', 'Wired Earphones', 2),
(15, 'MW08 Sport', 'Active Noise-Cancelling True Wireless Earphones', 2),
(16, 'MW08 Sport Automobili Lamborghini', 'Active Noise-Cancelling True Wireless Earphones', 2),
(17, 'MW08 Sport Mercedes-AMG', 'Active Noise-Cancelling True Wireless Earphones', 2),
(18, 'MW08 BUGATTI', 'Active Noise-Cancelling True Wireless Earphones', 2),
(19, 'MW75 Ear Pads', 'Personalize Your Headphones', 3),
(20, 'MG20 Ear Pads', 'Personalize Your Headphones', 3),
(21, 'MW65 Ear Pads', 'Ear Pad Replacements', 3),
(22, 'MW60 Ear Pads', 'Personalize Your Headphones', 3),
(23, 'MW50+ Over-Ear Ear Pads', 'Personalize Your Headphones', 3),
(24, 'MW50+ On-Ear Ear Pads', 'Personalize Your Headphones', 3),
(25, 'MH40_Wireless_Ear_Pads', 'Personalize Your Headphones', 3),
(26, 'MH30 Ear Pads', 'Personalize Your Headphones', 3),
(27, 'USB-C to 3.5mm Audio Cable', 'MW65 ANC Wireless Headphones, MW50+ Wireless Headphones, MH40 Headphones (Wired), MH30 Headphones', 4),
(28, 'USB-C to USB-C Braided Charging Cable', 'MW75 ANC Wireless Headphones, MG20 Wireless Gaming Headphones, MH40 Wireless Headphones, MW08 Sport True Wireless Earphones, MW08 ANC True Wireless Earphones, MW65 ANC Wireless Headphones, MW50+ Wireless Headphones, MW07 Plus True Wireless Earphones, MW07 Go True Wireless Earphones, MW07 True Wireless Earphones', 4),
(29, 'USB-C to 3.5mm Braided Audio Cable', 'MW75 ANC Wireless Headphones, MH40 Wireless Headphones (2nd Generation)', 4),
(32, 'MW65 Automobili Lamborghini', 'Active Noise-Cancelling Wireless Headphones', 1),
(33, 'MW65 Mercedes-Benz', 'Active Noise-Cancelling Wireless Headphones\r\n', 1),
(34, '1', '1', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(255) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `Phone`, `Address`) VALUES
(1, 'NCC Tai Nghe Cao Cấp', '0281234567', 'Kho số 1, KCN Tân Bình, TP. HCM'),
(2, 'NCC Phụ Kiện Giá Rẻ', '0249876543', 'Tầng 5, Tòa nhà Accessory, Hà Nội'),
(3, 'Đại Lý Phân Phối Độc Quyền', '0236112233', '99 Nguyễn Văn Linh, Đà Nẵng'),
(4, 'Công Ty Vận Chuyển Toàn Cầu', '0258778899', '150 Lê Văn Việt, Khánh Hòa'),
(5, 'Cung Cấp Linh Kiện Thay Thế2', '02924455662', '45 Nguyễn Huệ, Cần Thơ2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Role` enum('Admin','Customer') NOT NULL DEFAULT 'Customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `Phone`, `Address`, `Role`) VALUES
(1, 'minh', '202cb962ac59075b964b07152d234b70', 'minh@admin.com', '0901112222', '123 Đường Quản Trị, Hà Nội', 'Admin'),
(2, 'thanh_kh', 'e10adc3949ba59abbe56e057f20f883e', 'thanh.kh@mail.com', '0902334455', '45 Trần Hưng Đạo, TP. HCM', 'Customer'),
(3, 'hung_kh', 'e10adc3949ba59abbe56e057f20f883e', 'hung.kh@mail.com', '0903556677', '10 Phan Bội Châu, Đà Nẵng', 'Customer'),
(4, 'tram_kh', 'e10adc3949ba59abbe56e057f20f883e', 'tram.kh@mail.com', '0904778899', '20 Lê Lợi, Cần Thơ', 'Customer'),
(5, 'tuan_kh', 'e10adc3949ba59abbe56e057f20f883e', 'tuan.kh@mail.com', '0905990011', '30 Nguyễn Huệ, Hải Phòng', 'Customer'),
(6, 'ngoc_kh', 'e10adc3949ba59abbe56e057f20f883e', 'ngoc.kh@mail.com', '0906112233', '40 Bà Triệu, Huế', 'Customer'),
(10, 'Nguyễn Quang Tiến', 'e10adc3949ba59abbe56e057f20f883e', 'quangtien@gmail.com', '0348519697', 'vinh hiền, phú lộc, thừa thiên huế', 'Customer'),
(11, 'Bùi Quang Huy', 'e10adc3949ba59abbe56e057f20f883e', 'huy@gmail.com', '0369912508', 'ton quyen nguyen trai', 'Customer'),
(12, 'Trần thị Phương', 'e10adc3949ba59abbe56e057f20f883e', 'phuong@gmail.com', '1131131134', '10 Phan Bội Châu, Đà Nẵng', 'Customer'),
(13, 'huynh van a', '202cb962ac59075b964b07152d234b70', 'a@gmail.com', '1231231231', '10 Phan Bội Châu, Đà Nẵng', 'Customer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant`
--

CREATE TABLE `variant` (
  `VariantID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock_quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `variant`
--

INSERT INTO `variant` (`VariantID`, `ProductID`, `Color`, `Price`, `Stock_quantity`) VALUES
(1, 1, 'Grey Leather', '599.00', 5),
(2, 1, 'Navy Leather', '549.00', 2),
(3, 1, 'Black Leather', '599.00', -7),
(4, 2, 'Galactic White', '449.00', 3),
(5, 2, 'Sand Dune', '499.00', 12),
(6, 2, 'Black Onyx', '499.00', 8),
(7, 3, 'Brown Leather', '299.00', 10),
(8, 3, 'Black Leather', '299.00', 10),
(9, 4, 'Tan Leather', '399.00', 10),
(10, 4, 'White Leather', '419.00', 10),
(11, 4, 'Navy Leather', '399.00', 10),
(12, 5, 'Black Leather', '299.00', 10),
(13, 5, 'Camo Leather', '329.00', 10),
(14, 6, 'Orange', '399.00', 10),
(15, 7, 'Black', '750.00', 10),
(16, 7, 'Silver', '700.00', 10),
(17, 8, 'Black and White', '649.00', 9),
(18, 9, 'Green', '499.00', 29),
(19, 10, 'Lake Blue', '599.00', 22),
(20, 10, 'Jet Orange', '629.00', 8),
(21, 10, 'Deep Blue', '629.00', 9),
(22, 11, 'Pink Camo', '349.00', 10),
(23, 11, 'Blue Camo', '349.00', 10),
(24, 12, 'Silver', '450.00', -15),
(25, 12, 'Black', '450.00', 10),
(26, 13, 'Blue', '399.00', 0),
(27, 13, 'Gunmetal', '429.00', -2),
(28, 13, 'Black', '399.00', 5),
(29, 14, 'Black', '199.00', 7),
(30, 14, 'White', '209.00', 10),
(31, 14, 'Gold', '219.00', 10),
(32, 15, 'Blue', '349.00', 9),
(33, 16, 'Black', '399.00', 2),
(34, 17, 'Black', '399.00', 10),
(35, 18, 'Orange', '399.00', 10),
(36, 18, 'Deep Blue', '399.00', 4),
(37, 18, 'Steel', '369.00', 10),
(38, 19, 'Brown', '49.00', 10),
(39, 19, 'Black', '49.00', 10),
(40, 19, 'Grey', '49.00', 10),
(41, 20, 'Black', '49.00', 7),
(42, 21, 'Brown', '49.00', 8),
(43, 21, 'Black', '49.00', 10),
(44, 22, 'Royal', '49.00', 10),
(45, 22, 'Grey', '49.00', 10),
(46, 22, 'Burgundy', '49.00', 10),
(47, 23, 'Black', '49.00', 10),
(48, 23, 'Brown', '49.00', 13),
(49, 24, 'Black', '49.00', 10),
(50, 24, 'Brown', '49.00', 10),
(51, 25, 'Grey', '49.00', 14),
(52, 25, 'Navy', '49.00', 10),
(53, 25, 'Black', '49.00', 40),
(54, 26, 'Navy', '49.00', 10),
(55, 26, 'Black', '49.00', 10),
(56, 26, 'Grey', '49.00', 10),
(57, 27, 'Silver', '49.00', 10),
(58, 27, 'Black', '49.00', 10),
(59, 28, 'Black', '29.00', 9),
(60, 29, 'Black', '29.00', 9),
(63, 32, 'Silver', '499.00', 10);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `CategoryName` (`CategoryName`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ImageID`),
  ADD KEY `VariantID` (`VariantID`);

--
-- Chỉ mục cho bảng `import`
--
ALTER TABLE `import`
  ADD PRIMARY KEY (`ImportID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Chỉ mục cho bảng `import_detail`
--
ALTER TABLE `import_detail`
  ADD PRIMARY KEY (`ImportID`,`VariantID`),
  ADD KEY `VariantID` (`VariantID`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`OrderID`,`VariantID`),
  ADD KEY `VariantID` (`VariantID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Chỉ mục cho bảng `variant`
--
ALTER TABLE `variant`
  ADD PRIMARY KEY (`VariantID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `ImageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT cho bảng `import`
--
ALTER TABLE `import`
  MODIFY `ImportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `variant`
--
ALTER TABLE `variant`
  MODIFY `VariantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`VariantID`) REFERENCES `variant` (`VariantID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `import`
--
ALTER TABLE `import`
  ADD CONSTRAINT `import_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `import_detail`
--
ALTER TABLE `import_detail`
  ADD CONSTRAINT `import_detail_ibfk_1` FOREIGN KEY (`ImportID`) REFERENCES `import` (`ImportID`) ON DELETE CASCADE,
  ADD CONSTRAINT `import_detail_ibfk_2` FOREIGN KEY (`VariantID`) REFERENCES `variant` (`VariantID`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`VariantID`) REFERENCES `variant` (`VariantID`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `variant`
--
ALTER TABLE `variant`
  ADD CONSTRAINT `variant_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
