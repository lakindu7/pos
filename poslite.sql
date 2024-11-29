-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 07:40 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poslite`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `code`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'No Brand', NULL, NULL, 1, '2024-11-13 09:18:34', '2024-11-13 09:18:34'),
(2, 'Maliban', NULL, NULL, 1, '2024-11-13 09:18:41', '2024-11-13 09:18:41'),
(3, 'Munchee', NULL, NULL, 1, '2024-11-13 09:18:49', '2024-11-13 09:18:49'),
(4, 'Vijaya', NULL, NULL, 1, '2024-11-13 09:18:56', '2024-11-13 09:18:56'),
(5, 'Vijaya', NULL, NULL, 0, '2024-11-13 09:19:04', '2024-11-13 09:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0->disabled,1->active,2->deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `code`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Vegitables', NULL, NULL, 'c0ff1aa5-1ae5-447b-9902-ab2909433f09.jpg', 1, '2024-11-08 09:30:06', '2024-11-13 09:15:21'),
(2, 'Fruits', NULL, NULL, 'c0cf4c82-0bbe-433c-8f9f-0449d3b112ae.jpg', 1, '2024-11-08 09:55:55', '2024-11-13 09:15:38'),
(3, 'Bevarages', NULL, NULL, NULL, 1, '2024-11-13 09:15:48', '2024-11-13 09:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0->disabled,1->active,2->deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `name`, `code`, `description`, `image`, `category_id`, `subcategory_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '19L', NULL, NULL, 'da1ce08b-9306-4928-ba03-5f0b40cf3d48.webp', 3, 1, 1, '2024-11-12 08:09:44', '2024-11-13 11:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `points` double NOT NULL DEFAULT 0,
  `creditlimit` double NOT NULL DEFAULT 0,
  `outstandingbalance` varchar(10) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0->disabled,1->active,2->deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `telephone`, `address`, `dob`, `points`, `creditlimit`, `outstandingbalance`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lakindu Wickaramasinghe', 'wadlakindu@gmail.com', '0723417788', NULL, '1993-11-01', 0, 0, '5', 1, 1, '2024-11-15 13:21:39', '2024-11-15 13:28:33'),
(6, 'Lakindu Upeksha', 'lakinduupeksha93@gmail.com', '0770687287', NULL, '2024-10-30', 0, 0, '0', 1, 1, '2024-11-19 21:21:48', '2024-11-19 21:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expenseid` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `expensenote` text DEFAULT NULL,
  `deletenote` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0->deleted,1->active',
  `user_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expenseid`, `reference`, `amount`, `expensenote`, `deletenote`, `status`, `user_id`, `expense_category_id`, `created_at`, `updated_at`) VALUES
(1, 'EXP24I110001', 'MY001534', 5000545, 'gdfgfdg', NULL, 1, 1, 4, '2024-11-21 14:16:01', '2024-11-21 15:20:27'),
(2, 'EXP24I110002', 'fsdf', 5000, 'dgdfg', NULL, 1, 1, 2, '2024-11-23 18:56:46', '2024-11-23 18:56:46'),
(3, 'EXP24I110003', 'fsdfsd', 43223, '345345', NULL, 1, 1, 2, '2024-11-23 19:00:20', '2024-11-23 19:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0->disabled,1->active,2->deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Retailly POS Payment', 1, '2024-11-21 13:18:50', '2024-11-21 13:18:50'),
(2, 'Personal', 1, '2024-11-21 13:19:01', '2024-11-21 13:27:10'),
(3, 'Telephone', 1, '2024-11-21 13:19:26', '2024-11-21 13:19:26'),
(4, 'Water', 1, '2024-11-21 13:19:35', '2024-11-21 13:30:24'),
(5, 'Electricity', 1, '2024-11-21 13:36:23', '2024-11-21 13:36:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoiceid` varchar(255) DEFAULT NULL,
  `invoicetype` varchar(255) DEFAULT NULL,
  `amount` varchar(255) NOT NULL,
  `payment` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL,
  `discounttype` varchar(15) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `payable` double DEFAULT NULL,
  `discountamount` double DEFAULT NULL,
  `markettotal` varchar(255) DEFAULT NULL,
  `buyingtotal` double DEFAULT NULL,
  `points` varchar(255) DEFAULT '0',
  `customer_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoiceid`, `invoicetype`, `amount`, `payment`, `balance`, `discounttype`, `discount`, `payable`, `discountamount`, `markettotal`, `buyingtotal`, `points`, `customer_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(15, 'INV-2024-11-001', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, '0.5', '1', '1', 1, '2024-11-18 14:25:45', '2024-11-19 14:25:46'),
(16, 'INV-2024-11-001', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, NULL, '1', '1', 1, '2024-11-17 14:26:29', '2024-11-19 14:26:29'),
(17, 'INV-2024-11-001', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, '0', '1', '1', 1, '2024-11-16 14:28:00', '2024-11-19 14:28:00'),
(18, 'INV-2024-11-001', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, '0', '1', '1', 1, '2024-11-17 14:33:16', '2024-11-19 14:33:16'),
(19, 'INV-2024-11-001', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, '0', '1', '1', 1, '2024-11-19 14:35:04', '2024-11-19 14:35:04'),
(20, 'INV-2024-11-001', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, '0', '1', '1', 1, '2024-11-19 14:45:41', '2024-11-19 14:45:41'),
(21, 'INV-2024-11-001', 'Cash', '337.50', '500', '162.50', NULL, NULL, NULL, NULL, '465.00', 300, '0', NULL, '1', 1, '2024-11-19 14:59:20', '2024-11-19 14:59:20'),
(22, 'INV-2024-11-001', 'Cash', '337.50', '500', '162.50', NULL, NULL, NULL, NULL, '465.00', 300, '0', NULL, '1', 1, '2024-11-19 15:00:00', '2024-11-19 15:00:00'),
(23, 'INV-2024-11-001', 'Cash', '425.00', '500', '75.00', NULL, NULL, NULL, NULL, '555.00', 375, '0', NULL, '1', 1, '2024-11-19 15:01:02', '2024-11-19 15:01:02'),
(25, 'INV-2024-11-002', 'Cash', '2587.50', '5000', '2412.50', NULL, NULL, NULL, NULL, '3840.00', 2325, '0', '1', '1', 1, '2024-11-19 15:24:54', '2024-11-19 15:24:55'),
(26, 'INV-2024-11-003', 'Cash', '237.50', '500', '262.50', NULL, NULL, NULL, NULL, '315.00', 210, '0', NULL, '1', 1, '2024-11-19 20:56:40', '2024-11-19 20:56:40'),
(27, 'INV-2024-11-004', 'Cash', '50.00', '50', '0.00', NULL, NULL, NULL, NULL, '75.00', 45, '0', 'new', '1', 1, '2024-11-19 21:08:15', '2024-11-19 21:08:15'),
(28, 'INV-2024-11-005', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, '0', '1', '1', 0, '2024-11-19 21:19:59', '2024-11-24 14:14:43'),
(29, 'INV-2024-11-006', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, '0', '1', '1', 1, '2024-11-19 21:20:52', '2024-11-19 21:20:52'),
(30, 'INV-2024-11-007', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, '0', '1', '1', 1, '2024-11-19 21:21:21', '2024-11-19 21:21:21'),
(31, 'INV-2024-11-008', 'Cash', '50.00', '100', '50.00', NULL, NULL, NULL, NULL, '75.00', 45, '0', '6', '1', 1, '2024-11-19 21:21:48', '2024-11-19 21:21:48'),
(32, 'INV-2024-11-009', 'Cash', '3000.00', '4000', '1000.00', NULL, NULL, NULL, NULL, '4500.00', 2700, '0', NULL, '1', 0, '2024-11-20 12:08:29', '2024-11-24 11:51:56'),
(33, 'INV-2024-11-010', 'Cash', '30.00', '40', '10.00', NULL, NULL, NULL, NULL, '32.00', 26, '0', NULL, '1', 1, '2024-11-20 12:08:49', '2024-11-20 12:08:49'),
(34, 'INV-2024-11-011', 'Cash', '175.00', '2000', '1825.00', NULL, NULL, NULL, NULL, '180.00', 150, '0', NULL, '1', 1, '2024-11-20 15:21:14', '2024-11-20 15:21:14'),
(35, 'INV-2024-11-012', 'Cash', '50.00', '100', '60.00', 'amount', 10, 10, 40, '75.00', 45, '0', NULL, '1', 1, '2024-11-23 18:22:13', '2024-11-20 18:22:13'),
(36, 'INV-2024-11-013', 'Cash', '400.00', '500', '400.00', 'percentage', 75, 100, 300, '435.00', 345, '0', NULL, '1', 1, '2024-11-20 18:27:17', '2024-11-20 18:27:17'),
(37, 'INV-2024-11-014', 'Cash', '50.00', '50', '0.00', NULL, NULL, 0, 0, '75.00', 45, '0', NULL, '1', 1, '2024-11-20 18:35:34', '2024-11-20 18:35:34'),
(38, 'INV-2024-11-015', 'Cash', '87.50', '234', '225.25', NULL, NULL, 0, 0, '90.00', 75, '0', NULL, '1', 1, '2024-11-22 19:06:30', '2024-11-20 19:06:30'),
(39, 'INV-2024-11-016', 'Cash', '1850.00', '2000', '150.00', NULL, NULL, 0, 0, '1935.00', 1345, '0', NULL, '1', 1, '2024-11-22 19:13:28', '2024-11-20 19:13:28'),
(44, 'INV2024-11017', 'Cash', '15.00', '20', '5.00', NULL, NULL, 0, 0, '16.00', 13, '0', NULL, '1', 0, '2024-11-24 12:32:00', '2024-11-24 12:34:19'),
(45, 'INV-2024-11-013', 'Cash', '87.50', '100', '12.50', NULL, NULL, 0, 0, '90.00', 75, '0', '1', '1', 1, '2024-11-24 17:47:29', '2024-11-24 17:47:29'),
(46, 'INV-2024-11-014', 'Cash', '50.00', '50', '0.00', NULL, NULL, 0, 0, '75.00', 45, '0', NULL, '1', 1, '2024-11-24 17:47:55', '2024-11-24 17:47:55'),
(47, 'INV-2024-11-015', 'Cash', '50.00', '50', '0.00', NULL, NULL, 0, 0, '75.00', 45, '0', NULL, '1', 1, '2024-11-24 17:48:41', '2024-11-24 17:48:41'),
(48, 'INV-2024-11-016', 'Cash', '350.00', '000500', '150.00', NULL, NULL, 0, 0, '360.00', 300, '0', NULL, '1', 1, '2024-11-24 17:49:04', '2024-11-24 17:49:04'),
(49, 'INV-2024-11-017', 'Cash', '50.00', '100', '50.00', NULL, NULL, 0, 0, '75.00', 45, '0', NULL, '1', 1, '2024-11-24 17:49:19', '2024-11-24 17:49:19'),
(50, 'INV-2024-11-018', 'Cash', '50.00', '150', '100.00', NULL, NULL, 0, 0, '75.00', 45, '0', NULL, '1', 1, '2024-11-24 17:49:30', '2024-11-24 17:49:30'),
(51, 'INV-2024-11-019', 'Cash', '125.00', '130', '5.00', NULL, NULL, 0, 0, '175.00', 87.5, '0', NULL, '1', 1, '2024-11-25 18:29:11', '2024-11-25 18:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `itemtotal` varchar(255) NOT NULL,
  `unitprice` varchar(255) NOT NULL,
  `buyingtotal` varchar(255) NOT NULL,
  `markettotal` varchar(255) NOT NULL,
  `marketprice` double DEFAULT NULL,
  `buyingprice` double DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `quantity`, `itemtotal`, `unitprice`, `buyingtotal`, `markettotal`, `marketprice`, `buyingprice`, `product_id`, `invoice_id`, `stock_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '50', '50', '45', '75', NULL, NULL, 256, 19, 38, 1, '2024-11-19 14:35:04', '2024-11-19 14:35:04'),
(2, '1', '50', '50', '45', '75', NULL, NULL, 256, 20, 38, 1, '2024-11-19 14:45:41', '2024-11-19 14:45:41'),
(3, '5', '250', '50', '225', '375', 75, 45, 256, 21, 38, 1, '2024-11-19 14:59:20', '2024-11-19 14:59:20'),
(4, '5', '250', '50', '225', '375', 75, 45, 256, 24, 38, 1, '2024-11-19 15:01:18', '2024-11-19 15:01:18'),
(5, '500', '175', '350', '150', '180', 360, 300, 1, 24, 37, 1, '2024-11-19 15:01:18', '2024-11-19 15:01:18'),
(6, '250', '87.5', '350', '75', '90', 360, 300, 1, 25, 37, 1, '2024-11-19 15:24:55', '2024-11-19 15:24:55'),
(7, '50', '2500', '50', '2250', '3750', 75, 45, 256, 25, 38, 1, '2024-11-19 15:24:55', '2024-11-19 15:24:55'),
(8, '250', '87.5', '350', '75', '90', 360, 300, 1, 26, 37, 1, '2024-11-19 20:56:40', '2024-11-19 20:56:40'),
(9, '3', '150', '50', '135', '225', 75, 45, 256, 26, 38, 1, '2024-11-19 20:56:40', '2024-11-19 20:56:40'),
(10, '1', '50', '50', '45', '75', 75, 45, 256, 27, 38, 1, '2024-11-19 21:08:15', '2024-11-19 21:08:15'),
(11, '1', '50', '50', '45', '75', 75, 45, 256, 28, 38, 0, '2024-11-19 21:19:59', '2024-11-24 14:14:43'),
(12, '1', '50', '50', '45', '75', 75, 45, 256, 29, 38, 1, '2024-11-19 21:20:52', '2024-11-19 21:20:52'),
(13, '1', '50', '50', '45', '75', 75, 45, 256, 30, 38, 1, '2024-11-19 21:21:21', '2024-11-19 21:21:21'),
(14, '1', '50', '50', '45', '75', 75, 45, 256, 31, 38, 1, '2024-11-19 21:21:48', '2024-11-19 21:21:48'),
(15, '60', '3000', '50', '2700', '4500', 75, 45, 256, 32, 38, 0, '2024-11-20 12:08:29', '2024-11-24 12:30:59'),
(16, '100', '30', '300', '26', '32', 320, 260, 1, 33, 36, 1, '2024-11-20 12:08:49', '2024-11-20 12:08:49'),
(17, '500', '175', '350', '150', '180', 360, 300, 1, 34, 37, 1, '2024-11-20 15:21:14', '2024-11-20 15:21:14'),
(18, '1', '50', '50', '45', '75', 75, 45, 256, 35, 38, 1, '2024-11-20 18:22:13', '2024-11-20 18:22:13'),
(19, '1', '50', '50', '45', '75', 75, 45, 256, 36, 38, 1, '2024-11-20 18:27:17', '2024-11-20 18:27:17'),
(20, '1000', '350', '350', '300', '360', 360, 300, 1, 36, 37, 1, '2024-11-20 18:27:17', '2024-11-20 18:27:17'),
(21, '1', '50', '50', '45', '75', 75, 45, 256, 37, 38, 1, '2024-11-20 18:35:34', '2024-11-20 18:35:34'),
(22, '250', '87.5', '350', '75', '90', 360, 300, 1, 38, 37, 1, '2024-11-20 19:06:30', '2024-11-20 19:06:30'),
(23, '1', '350', '350', '300', '360', 360, 300, 1, 39, 37, 1, '2024-11-20 19:13:28', '2024-11-20 19:13:28'),
(24, '1', '50', '50', '45', '75', 75, 45, 256, 39, 38, 1, '2024-11-20 19:13:28', '2024-11-20 19:13:28'),
(25, '10', '1450', '145', '1000', '1500', 150, 100, 656, 39, 39, 1, '2024-11-20 19:13:28', '2024-11-20 19:13:28'),
(26, '1', '350', '350', '300', '360', 360, 300, 1, 40, 37, 1, '2024-11-20 19:13:57', '2024-11-20 19:13:57'),
(27, '1', '50', '50', '45', '75', 75, 45, 256, 40, 38, 1, '2024-11-20 19:13:57', '2024-11-20 19:13:57'),
(28, '10', '1450', '145', '1000', '1500', 150, 100, 656, 40, 39, 1, '2024-11-20 19:13:57', '2024-11-20 19:13:57'),
(29, '500', '175', '350', '150', '180', 360, 300, 1, 41, 37, 1, '2024-11-20 19:15:28', '2024-11-20 19:15:28'),
(30, '20', '1000', '50', '900', '1500', 75, 45, 256, 41, 38, 1, '2024-11-20 19:15:28', '2024-11-20 19:15:28'),
(31, '700', '245', '350', '210', '252', 360, 300, 1, 42, 37, 1, '2024-11-20 19:16:03', '2024-11-20 19:16:03'),
(32, '1', '50', '50', '45', '75', 75, 45, 256, 43, 38, 1, '2024-11-20 19:51:13', '2024-11-20 19:51:13'),
(33, '50', '15', '300', '13', '16', 320, 260, 1, 44, 36, 0, '2024-11-24 12:32:00', '2024-11-24 12:34:19'),
(34, '250', '87.5', '350', '75', '90', 360, 300, 1, 45, 37, 1, '2024-11-24 17:47:29', '2024-11-24 17:47:29'),
(35, '1', '50', '50', '45', '75', 75, 45, 256, 46, 38, 1, '2024-11-24 17:47:55', '2024-11-24 17:47:55'),
(36, '1', '50', '50', '45', '75', 75, 45, 256, 47, 38, 1, '2024-11-24 17:48:41', '2024-11-24 17:48:41'),
(37, '1000', '350', '350', '300', '360', 360, 300, 1, 48, 37, 1, '2024-11-24 17:49:04', '2024-11-24 17:49:04'),
(38, '1', '50', '50', '45', '75', 75, 45, 256, 49, 38, 1, '2024-11-24 17:49:19', '2024-11-24 17:49:19'),
(39, '1', '50', '50', '45', '75', 75, 45, 256, 50, 38, 1, '2024-11-24 17:49:30', '2024-11-24 17:49:30'),
(40, '250', '62.5', '250', '50', '75', 300, 200, 1, 51, 1, 1, '2024-11-25 18:29:11', '2024-11-25 18:29:11'),
(41, '250', '62.5', '250', '37.5', '100', 400, 150, 2, 51, 2, 1, '2024-11-25 18:29:11', '2024-11-25 18:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_06_142023_create_categories_table', 1),
(5, '2024_11_06_142034_create_subcategories_table', 1),
(6, '2024_11_06_142041_create_childcategories_table', 1),
(7, '2024_11_06_142542_create_permission_tables', 1),
(8, '2024_11_12_140726_create_brands_table', 2),
(9, '2024_11_13_132626_create_sections_table', 3),
(10, '2024_11_13_145405_create_products_table', 4),
(13, '2024_11_13_152013_create_stocks_table', 5),
(14, '2024_11_15_181130_create_customers_table', 6),
(15, '2024_11_15_185918_create_invoices_table', 7),
(16, '2024_11_15_191313_create_invoice_details_table', 7),
(17, '2024_11_16_180656_create_settings_table', 7),
(18, '2024_11_16_195955_create_reward_settings_table', 8),
(20, '2024_11_18_110308_create_suppliers_table', 9),
(21, '2024_11_21_174807_create_expense_categories_table', 10),
(22, '2024_11_21_174940_create_expenses_table', 10),
(23, '2024_11_24_231056_create_purchases_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_si` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `barcode` text DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `expiredate` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `alertlimit` int(11) DEFAULT NULL,
  `youtubelink` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `sellingtype` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0->disabled,1->active,2->deleted',
  `salescount` int(11) NOT NULL DEFAULT 0,
  `isFeatured` int(11) NOT NULL DEFAULT 0 COMMENT '0->no,1->yes',
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `childcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `name_si`, `slug`, `description`, `barcode`, `sku`, `expiredate`, `image`, `alertlimit`, `youtubelink`, `tags`, `sellingtype`, `status`, `salescount`, `isFeatured`, `category_id`, `subcategory_id`, `childcategory_id`, `brand_id`, `section_id`, `supplier_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'carrot', 'කැරට්', 'carrot', NULL, NULL, 'IMP-CAR-1685', NULL, '680b5fbb-eca8-4fda-ab02-bd93ee7073d5.jpg', 0, NULL, NULL, 'Grams', 1, 1, 0, 1, NULL, NULL, 1, 2, 2, 1, '2024-11-19 04:07:34', '2024-11-19 04:49:09'),
(2, 'boonchi', 'බෝංචි ', 'boonchi', NULL, NULL, 'IMP-BOO-5098', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 1, 0, 1, NULL, NULL, NULL, 1, 2, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(3, 'leeks ', 'ලීක්ස්', 'leeks', NULL, NULL, 'IMP-LEE-3197', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 1, 0, 1, NULL, NULL, NULL, 1, 2, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(4, 'vambatu', 'වම්බටු', 'vambatu', NULL, NULL, 'IMP-VAM-4914', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, 2, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(5, 'lanka b looonu', 'ලංකා බී ළූණු', 'lanka-b-looonu', NULL, NULL, 'IMP-LAN-7577', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, 2, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(6, 'rata loonu 1', 'රට ළූණු  NO1', 'rata-loonu-1', NULL, NULL, 'IMP-RAT-2797', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(7, 'iguru', 'ඉඟුරු', 'iguru', NULL, NULL, 'IMP-IGU-7197', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(8, 'lanka ala', ' ලංකා  අල', 'lanka-ala', NULL, NULL, 'IMP-LAN-9375', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(9, 'rata ala ', 'රට අල', 'rata-ala', NULL, NULL, 'IMP-RAT-1562', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(10, 'thakkali', 'තක්කාලි', 'thakkali', NULL, NULL, 'IMP-THA-9691', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(11, 'bandakka', 'බණ්ඩක්කා', 'bandakka', NULL, NULL, 'IMP-BAN-7968', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(12, 'karavila', 'කරවිල', 'karavila', NULL, NULL, 'IMP-KAR-6327', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(13, 'ma karal', 'මෑ කරල්', 'ma-karal', NULL, NULL, 'IMP-MAK-7966', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(14, 'p p', 'පිපිඤ්ඤා', 'p-p', NULL, NULL, 'IMP-PP-3089', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(15, 'vattakka', 'වට්ටක්කා ', 'vattakka', NULL, NULL, 'IMP-VAT-8966', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(16, 'kakiri', 'කැකිරි ', 'kakiri', NULL, NULL, 'IMP-KAK-8876', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(17, 'pathola', 'පතෝල', 'pathola', NULL, NULL, 'IMP-PAT-9349', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(18, 'rabu cut', 'රාබු', 'rabu-cut', NULL, NULL, 'IMP-RAB-8999', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(19, 'dehi', 'දෙහි ', 'dehi', NULL, NULL, 'IMP-DEH-8611', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(20, 'gova', 'ගෝවා', 'gova', NULL, NULL, 'IMP-GOV-7484', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(21, 'malu miris', 'මාළු මිරිස්', 'malu-miris', NULL, NULL, 'IMP-MAL-7075', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(22, 'beet', 'බීට්', 'beet', NULL, NULL, 'IMP-BEE-5946', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(23, 'kaha bathala ', 'කහ බතල', 'kaha-bathala', NULL, NULL, 'IMP-KAH-5720', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(24, 'rathu bathala', 'රතු බතල', 'rathu-bathala', NULL, NULL, 'IMP-RAT-3843', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(25, 'murunga', 'මුරුංගා ', 'murunga', NULL, NULL, 'IMP-MUR-2366', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(26, 'lunu gas', 'ළූණු ගස්', 'lunu-gas', NULL, NULL, 'IMP-LUN-2716', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(27, 'sudu loonu', 'සුදුළූණු ', 'sudu-loonu', NULL, NULL, 'IMP-SUD-2692', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(28, 'rathu lunu', 'රතු ළූණු ', 'rathu-lunu', NULL, NULL, 'IMP-RAT-1664', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(29, 'mi', ' අමු මිරිස් ', 'mi', NULL, NULL, 'IMP-MI-2574', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(30, 'bola miris', 'බෝල මිරිස් ', 'bola-miris', NULL, NULL, 'IMP-BOL-8877', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(31, 'vatakolu', 'වැටකොළු ', 'vatakolu', NULL, NULL, 'IMP-VAT-7758', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(32, 'dabala', 'දඹල', 'dabala', NULL, NULL, 'IMP-DAB-2760', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(33, 'ela batu', 'එල බටු', 'ela-batu', NULL, NULL, 'IMP-ELA-9563', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(34, 'alu kesel', 'අළු කෙසෙල් ', 'alu-kesel', NULL, NULL, 'IMP-ALU-4509', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(35, 'nivithi', 'නිවිති', 'nivithi', NULL, NULL, 'IMP-NIV-2304', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(36, 'salada  kola', 'සලාද කොළ', 'salada-kola', NULL, NULL, 'IMP-SAL-2462', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(37, 'mukunuvanna', 'මුකුනුවැන්න ', 'mukunuvanna', NULL, NULL, 'IMP-MUK-6509', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(38, 'gotukola', 'ගොටුකොළ ', 'gotukola', NULL, NULL, 'IMP-GOT-9213', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(39, 'kan kun', 'කංකුං', 'kan-kun', NULL, NULL, 'IMP-KAN-8588', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(40, 'aguna kola', 'අගුනකොළ', 'aguna-kola', NULL, NULL, 'IMP-AGU-4722', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(41, 'maiyokka', 'මඤ්ඤොක්කා', 'maiyokka', NULL, NULL, 'IMP-MAI-8793', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(42, 'nocol', ' නෝකෝල් ', 'nocol', NULL, NULL, 'IMP-NOC-5114', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(43, 'gova kola', 'ගෝවා කොළ ', 'gova-kola', NULL, NULL, 'IMP-GOV-7059', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(44, 'hathu', 'හතු', 'hathu', NULL, NULL, 'IMP-HAT-2741', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(45, 'amu kaha', 'අමු කහ', 'amu-kaha', NULL, NULL, 'IMP-AMU-3124', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(46, 'lunu kudu 100/=', 'ලුණු කුඩු', 'lunu-kudu-100', NULL, NULL, 'IMP-LUN-2025', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(47, 'lunu kata 140/=', ' ලුණු කැට', 'lunu-kata-140', NULL, NULL, 'IMP-LUN-9198', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(48, 'pol2 100/=', 'පොල්', 'pol2-100', NULL, NULL, 'IMP-POL-7446', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(49, 'rathu biththara  L', 'රතු බිත්තර ', 'rathu-biththara-l', NULL, NULL, 'IMP-RAT-1372', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(50, 'umbalakada 50g', 'උම්බලකඩ 50g', 'umbalakada-50g', NULL, NULL, 'IMP-UMB-8813', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(51, 'kunisso 50g 150/=', 'කූනිස්සන් 100g', 'kunisso-50g-150', NULL, NULL, 'IMP-KUN-9486', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(52, 'hal massan loos', 'හාල්මැස්සන් ', 'hal-massan-loos', NULL, NULL, 'IMP-HAL-5183', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(53, 'salayan 100g 170/=', 'සාලයන් 100g', 'salayan-100g-170', NULL, NULL, 'IMP-SAL-2338', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(54, 'kelawalla 100g', 'කෙලවල්ලන් 100g', 'kelawalla-100g', NULL, NULL, 'IMP-KEL-5364', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(55, 'moran 100g 280/=', 'මෝරන් 100g', 'moran-100g-280', NULL, NULL, 'IMP-MOR-3192', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(56, 'maduvan 100g 220/=', 'මඩුවන් 100g', 'maduvan-100g-220', NULL, NULL, 'IMP-MAD-1986', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(57, 'kaha kudu 10g 40/=', 'කහ කුඩු 10g', 'kaha-kudu-10g-40', NULL, NULL, 'IMP-KAH-9355', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(58, 'kalu kudu 15g', 'කළු කුඩු 15g', 'kalu-kudu-15g', NULL, NULL, 'IMP-KAL-5970', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(59, 'enasal 15g', 'එනසාල්  15g', 'enasal-15g', NULL, NULL, 'IMP-ENA-8539', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(60, 'rasa paha 15g', 'රස පහ', 'rasa-paha-15g', NULL, NULL, 'IMP-RAS-8786', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(61, 'siyabala 80/=', 'සියබලා ', 'siyabala-80', NULL, NULL, 'IMP-SIY-3892', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(62, 'gam miris 50g 180/=', 'ගම් මිරිස් කුඩු 50g', 'gam-miris-50g-180', NULL, NULL, 'IMP-GAM-8541', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(63, 'miris kudu 50g 80/=', 'මිරිස් කුඩු 50g', 'miris-kudu-50g-80', NULL, NULL, 'IMP-MIR-7227', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(64, 'miris kudu 100g', 'මිරිස් කුඩු 100g', 'miris-kudu-100g', NULL, NULL, 'IMP-MIR-6807', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(65, 'badapu miris kudu 100g', 'බැදපු මිරිස් කුඩු 100g', 'badapu-miris-kudu-100g', NULL, NULL, 'IMP-BAD-5807', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(66, 'badapu miris kudu 50g 80/=', 'බැදපු මිරිස් කුඩු 50g', 'badapu-miris-kudu-50g-80', NULL, NULL, 'IMP-BAD-3321', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(67, 'kalu kudu 50g 100/=', 'කළු කුඩු 50g', 'kalu-kudu-50g-100', NULL, NULL, 'IMP-KAL-5141', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(68, 'kali miris 50g 70/=', 'කෑලි මිරිස් 50g', 'kali-miris-50g-70', NULL, NULL, 'IMP-KAL-4875', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(69, 'kali miris 100g 250/=', 'කෑලි මිරිස් 100g', 'kali-miris-100g-250', NULL, NULL, 'IMP-KAL-6095', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(70, 'thuna paha 40g 90/=', 'තුන පහ 50g', 'thuna-paha-40g-90', NULL, NULL, 'IMP-THU-5702', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(71, 'sweet 5', 'ටොෆි 5', 'sweet-5', NULL, NULL, 'IMP-SWE-9740', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(72, 'sweet 10', 'ටොෆි 10', 'sweet-10', NULL, NULL, 'IMP-SWE-3251', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(73, 'card 50', 'කාර්ඩ් ', 'card-50', NULL, NULL, 'IMP-CAR-1427', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(74, 'card 100', 'කාර්ඩ් ', 'card-100', NULL, NULL, 'IMP-CAR-3595', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(75, 'lanka soy curry  50g 85/=', 'සෝයා මීට් 50g', 'lanka-soy-curry-50g-85', NULL, NULL, 'IMP-LAN-3396', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(76, 'LANKA SOY  90G 150/=', 'සෝයා මීට් ', 'lanka-soy-90g-150', NULL, NULL, 'IMP-LAN-8121', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(77, 'lanka soy  chicken 160/=', 'සෝයා මීට්  කුකුල් මස් 90g', 'lanka-soy-chicken-160', NULL, NULL, 'IMP-LAN-4891', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(78, 'liptan 50g 180/=', 'ලිප්ටන්  50g', 'liptan-50g-180', NULL, NULL, 'IMP-LIP-7529', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(79, 'liptan 100g', 'ලිප්ටන් 100g', 'liptan-100g', NULL, NULL, 'IMP-LIP-9455', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(80, 'aluva ', 'අලුවා', 'aluva', NULL, NULL, 'IMP-ALU-2184', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(81, 'bothalaya pol thel', 'පොල් තෙල් බෝතලය', 'bothalaya-pol-thel', NULL, NULL, 'IMP-BOT-1379', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(82, 'bage pol thel', 'පොල් තෙල් බාගය', 'bage-pol-thel', NULL, NULL, 'IMP-BAG-6841', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(83, 'kala pol thel', 'පොල් තෙල් කාල', 'kala-pol-thel', NULL, NULL, 'IMP-KAL-1018', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(84, 'kos mula 50', 'කොස් මුල', 'kos-mula-50', NULL, NULL, 'IMP-KOS-3445', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(85, 'kalawam ', 'කලවම් එලවළු', 'kalawam', NULL, NULL, 'IMP-KAL-5486', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(86, 'kalawam boonchi', 'කලවම් එලවළු ', 'kalawam-boonchi', NULL, NULL, 'IMP-KAL-1140', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(87, 'batar boonchi', 'බටර් බෝංචි', 'batar-boonchi', NULL, NULL, 'IMP-BAT-8275', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(88, 'kohila ala', 'කොහිල අල', 'kohila-ala', NULL, NULL, 'IMP-KOH-5714', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(89, 'avara', 'අවර', 'avara', NULL, NULL, 'IMP-AVA-8261', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(90, 'vanna', 'වන්නා 100g', 'vanna', NULL, NULL, 'IMP-VAN-5128', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(91, 'katta 170', 'කට්ටා 100g', 'katta-170', NULL, NULL, 'IMP-KAT-9165', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(92, 'goraka 50g 60/=', 'ගොරකා 50g', 'goraka-50g-60', NULL, NULL, 'IMP-GOR-8749', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(93, 'achcharu 100g', 'අච්චරු ', 'achcharu-100g', NULL, NULL, 'IMP-ACH-9209', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(94, 'puna miris', 'පූනා මිරිස්', 'puna-miris', NULL, NULL, 'IMP-PUN-7392', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(95, 'lunu dehi 50/=', 'ලුණු දෙහි ', 'lunu-dehi-50', NULL, NULL, 'IMP-LUN-9204', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(96, 'lena paraw', 'ලේන පරා 100', 'lena-paraw', NULL, NULL, 'IMP-LEN-9716', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(97, 'kenda 200/=', 'කෙන්දා 100g', 'kenda-200', NULL, NULL, 'IMP-KEN-3963', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(98, 'dalu kohila', 'කොහිල දළු', 'dalu-kohila', NULL, NULL, 'IMP-DAL-9833', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(99, 'koththamalli 50g 70/=', 'කොත්තමල්ලි 40g', 'koththamalli-50g-70', NULL, NULL, 'IMP-KOT-5429', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(100, 'aba ata 65/=', 'අබ ඇට 50g', 'aba-ata-65', NULL, NULL, 'IMP-ABA-4913', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(101, 'ulu hal 60/=', 'උළුහාල්  50g', 'ulu-hal-60', NULL, NULL, 'IMP-ULU-9226', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(102, 'aba kudu 50/=', 'අබ කුඩු 50g', 'aba-kudu-50', NULL, NULL, 'IMP-ABA-9873', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(103, 'kochchi', 'කොච්චි', 'kochchi', NULL, NULL, 'IMP-KOC-7463', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(104, 'mahaduru 140/=', 'මහදුරු', 'mahaduru-140', NULL, NULL, 'IMP-MAH-2814', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(105, 'annasi 80', 'අන්නාසි ', 'annasi-80', NULL, NULL, 'IMP-ANN-5021', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(106, 'gaslabu', 'ගස්ලබු', 'gaslabu', NULL, NULL, 'IMP-GAS-1244', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(107, 'karapincha', 'කරපිංචා', 'karapincha', NULL, NULL, 'IMP-KAR-5012', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(108, 'thambu issan 50g', 'තැම්බූ ඉස්සන් 100g', 'thambu-issan-50g', NULL, NULL, 'IMP-THA-5900', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(109, 'keeramin 190/=', 'කීරමින් 100g', 'keeramin-190', NULL, NULL, 'IMP-KEE-7112', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(110, 'boollu  malu', 'බෝල්ලු ', 'boollu-malu', NULL, NULL, 'IMP-BOO-9137', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(111, 'aguluva 260/=-', 'අඟුලුවන් 100g', 'aguluva-260', NULL, NULL, 'IMP-AGU-1181', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(112, 'sup rasa musu maggi 6g 30/=', 'MAGGI රස මුසු 6g', 'sup-rasa-musu-maggi-6g-30', NULL, NULL, 'IMP-SUP-7144', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(113, 'sup chicken cubes 20g', 'KNORR CHICKEN20g', 'sup-chicken-cubes-20g', NULL, NULL, 'IMP-SUP-7474', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(114, 'sup chicken cubes 10g', 'KNORR CHICKEN CUBES 10g', 'sup-chicken-cubes-10g', NULL, NULL, 'IMP-SUP-5144', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(115, 'sarana', 'සාරණ', 'sarana', NULL, NULL, 'IMP-SAR-2829', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(116, 'kathurumurunga', 'කතුරුමුරුංගා', 'kathurumurunga', NULL, NULL, 'IMP-KAT-7032', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(117, 'rata loonu 2', 'රට ළූණු ', 'rata-loonu-2', NULL, NULL, 'IMP-RAT-9758', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(118, 'siyabala 95/=', 'සියබලා 80g', 'siyabala-95', NULL, NULL, 'IMP-SIY-4891', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(119, 'parippu ', 'පරිප්පු no 1', 'parippu', NULL, NULL, 'IMP-PAR-7355', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(120, 'seera', 'සේර', 'seera', NULL, NULL, 'IMP-SEE-9384', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(121, 'sambola umbalakada 40/=', 'උම්බලකඩ සම්බෝල 20g', 'sambola-umbalakada-40', NULL, NULL, 'IMP-SAM-9470', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(122, '20 biscuits', 'බිස්කට් ', '20-biscuits', NULL, NULL, 'IMP-20B-5166', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(123, 'tipitip 80/=', 'ටිපිටිප් ', 'tipitip-80', NULL, NULL, 'IMP-TIP-1304', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(124, 'tip tip tikka 12g', 'ටික්කා ටිපිටිප් 12g', 'tip-tip-tikka-12g', NULL, NULL, 'IMP-TIP-7958', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(125, 'tip tip tikka 27g', 'ටික්කා ටිපිටිප් 27g', 'tip-tip-tikka-27g', NULL, NULL, 'IMP-TIP-6026', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(126, 'thuba karavila', 'තුබ කරවිල', 'thuba-karavila', NULL, NULL, 'IMP-THU-1418', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(127, 'kaha kudu 50g 235/=', 'කහ කුඩු 50g', 'kaha-kudu-50g-235', NULL, NULL, 'IMP-KAH-3186', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(128, ' olu halmasso 100 ', 'ඔලු කැඩූ හාල්මැස්සන් 100g', 'olu-halmasso-100', NULL, NULL, 'IMP-OLU-7965', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(129, 'shop boonchi', 'බෝංචි shop', 'shop-boonchi', NULL, NULL, 'IMP-SHO-7438', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(130, 'shop mi', 'shop අමු මිරිස් ', 'shop-mi', NULL, NULL, 'IMP-SHO-3640', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(131, 'cup parippu', 'cup පරිප්පු', 'cup-parippu', NULL, NULL, 'IMP-CUP-8053', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(132, 'shop bothalaya polthel', 'shop පොල් තෙල් බෝතලය', 'shop-bothalaya-polthel', NULL, NULL, 'IMP-SHO-6228', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(133, 'shop leeks', 'ලීක්ස්', 'shop-leeks', NULL, NULL, 'IMP-SHO-1884', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(134, 'shop carrot', 'කැරට් II', 'shop-carrot', NULL, NULL, 'IMP-SHO-3736', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(135, 'kos mula 60', 'කොස් මුල', 'kos-mula-60', NULL, NULL, 'IMP-KOS-3220', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(136, 'katta 280/=', 'කට්ටා 100g', 'katta-280', NULL, NULL, 'IMP-KAT-4249', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(137, 'muhudu kukula', 'පොතුබරි 100g', 'muhudu-kukula', NULL, NULL, 'IMP-MUH-3936', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(138, ' mora miris 60/=', 'මෝර මිරිස්', 'mora-miris-60', NULL, NULL, 'IMP-MOR-2536', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(139, 'super cream cracker 120g * 120/=', 'සුපර් ක්‍රීම් ක්‍රැකර් 125g', 'super-cream-cracker-120g-120', NULL, NULL, 'IMP-SUP-8512', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(140, 'super cream cracker 190g * 200/=', 'සුපර් ක්‍රීම් ක්‍රැකර් 190g', 'super-cream-cracker-190g-200', NULL, NULL, 'IMP-SUP-4660', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(141, 'super cream cracker 230g * 230/=', 'සුපර් ක්‍රීම් ක්‍රැකර් 230g', 'super-cream-cracker-230g-230', NULL, NULL, 'IMP-SUP-4300', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(142, 'lemon puff 150g 220/=', 'ලෙමන් පෆ් 150G', 'lemon-puff-150g-220', NULL, NULL, 'IMP-LEM-8931', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(143, 'lemon puff MUNCHEE 100G 130/=', 'ලෙමන් පෆ් 100G', 'lemon-puff-munchee-100g-130', NULL, NULL, 'IMP-LEM-1534', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(144, 'chocolate puff 200g 250/=', 'චොකලට් පෆ් 200g', 'chocolate-puff-200g-250', NULL, NULL, 'IMP-CHO-9848', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(145, 'munchee chocolate puff 100G 130/=', 'චොකලට් පෆ් 100G', 'munchee-chocolate-puff-100g-130', NULL, NULL, 'IMP-MUN-6659', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(146, 'tikiri mari 80g *', 'ටිකිරි මාරි 80g', 'tikiri-mari-80g', NULL, NULL, 'IMP-TIK-9639', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(147, 'chocolate cream 100g *', 'චොකලට් ක්‍රීම් 100g', 'chocolate-cream-100g', NULL, NULL, 'IMP-CHO-9047', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(148, 'milk short cake 200g * munchee 230/=', 'මිල්ක් ෂෝර්ට් කේක් 200g', 'milk-short-cake-200g-munchee-230', NULL, NULL, 'IMP-MIL-5691', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(149, 'milk short cake 85g 150/=', 'මිල්ක් ෂෝර්ට් කේක් 85g', 'milk-short-cake-85g-150', NULL, NULL, 'IMP-MIL-7527', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(150, 'chili paste 25/=', 'චිලි පීස්ට් ', 'chili-paste-25', NULL, NULL, 'IMP-CHI-8571', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(151, 'puhul', 'පුහුල්', 'puhul', NULL, NULL, 'IMP-PUH-5364', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(152, 'beli', 'බෙලි', 'beli', NULL, NULL, 'IMP-BEL-6488', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(153, 'vita 70/=', 'විට', 'vita-70', NULL, NULL, 'IMP-VIT-5687', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(154, 'shop vambatu', 'shop වම්බටු', 'shop-vambatu', NULL, NULL, 'IMP-SHO-9895', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(155, 'chik bits', 'චික් බිට්ස් 30g', 'chik-bits', NULL, NULL, 'IMP-CHI-8979', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(156, 'maliban  smart cream cracker 125g 150/=', 'මැලිබන් ක්‍රීම් ක්‍රැකර් 125g', 'maliban-smart-cream-cracker-125g-150', NULL, NULL, 'IMP-MAL-6551', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(157, 'maliban gold marie 80g* 90/=', ' මැලිබන් ගෝල්ඩ් මාරි 80g', 'maliban-gold-marie-80g-90', NULL, NULL, 'IMP-MAL-4153', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(158, ' maliban chocolate cream 100g * 130/=', 'මැලිබන් චොකලට් ක්‍රීම් 100g', 'maliban-chocolate-cream-100g-130', NULL, NULL, 'IMP-MAL-5411', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(159, 'seeni murukku', 'සීනි මුරුක්කු', 'seeni-murukku', NULL, NULL, 'IMP-SEE-8796', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(160, 'saw bara', 'සව් බර', 'saw-bara', NULL, NULL, 'IMP-SAW-7822', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(161, 'vathura 500ml 95/=', 'වතුර 500ml', 'vathura-500ml-95', NULL, NULL, 'IMP-VAT-4193', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(162, 'murukku 50/=', 'මුරුක්කු', 'murukku-50', NULL, NULL, 'IMP-MUR-8499', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(163, 'dallan 100g', 'දැල්ලන් 100g', 'dallan-100g', NULL, NULL, 'IMP-DAL-3754', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(164, 'raththi 3in 1 25g 60/=', 'රත්ති 3in 1/ 25g ', 'raththi-3in-1-25g-60', NULL, NULL, 'IMP-RAT-7016', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(165, 'raththi 75g', 'රත්ති 75g', 'raththi-75g', NULL, NULL, 'IMP-RAT-6919', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(166, 'raththi 200g ', 'රත්ති 200 g', 'raththi-200g', NULL, NULL, 'IMP-RAT-2971', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(167, 'gini petti', 'ගිනි පෙට්ටි', 'gini-petti', NULL, NULL, 'IMP-GIN-2354', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(168, 'murukku 60', 'මුරුක්කු 25g', 'murukku-60', NULL, NULL, 'IMP-MUR-3695', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(169, 'nestomalt 400g * 990/=', 'නෙස්ටමෝල්ට් 400g', 'nestomalt-400g-990', NULL, NULL, 'IMP-NES-5153', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(170, 'nestomalt 28g', 'නෙස්ටමෝල්ට් 28g', 'nestomalt-28g', NULL, NULL, 'IMP-NES-8206', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(171, 'nespray 18g 60/=', 'නෙස්ප්‍රේ 18g', 'nespray-18g-60', NULL, NULL, 'IMP-NES-8731', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(172, 'milo UHT182ml 130/=', 'මයිලෝ UHT 180ml', 'milo-uht182ml-130', NULL, NULL, 'IMP-MIL-8709', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(173, 'nescafe UHT 180', 'නෙස්කැෆේ UHT 180ml', 'nescafe-uht-180', NULL, NULL, 'IMP-NES-7023', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(174, 'nespray UHT 180ml', 'නෙස්ප්‍රේ UHT 180ml', 'nespray-uht-180ml', NULL, NULL, 'IMP-NES-7063', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(175, 'maggi sup chicken 25/=', 'මැගී සුප් කැට 4g', 'maggi-sup-chicken-25', NULL, NULL, 'IMP-MAG-5488', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(176, 'nana katha', 'සූකිරි බනිස්', 'nana-katha', NULL, NULL, 'IMP-NAN-4021', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(177, 'noodles 260/=', 'නූඩ්ල්ස් 500g', 'noodles-260', NULL, NULL, 'IMP-NOO-3474', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(178, 'seeni', 'සීනි', 'seeni', NULL, NULL, 'IMP-SEE-7426', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(179, 'gam miris ata 10g  50/=', 'ගම්මිරිස් ඇට 10g', 'gam-miris-ata-10g-50', NULL, NULL, 'IMP-GAM-9066', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(180, 'mal lunu', 'ළූණු මල්', 'mal-lunu', NULL, NULL, 'IMP-MAL-6417', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(181, 'laoji 40g * 130/=', 'ලාඕජී තේ 40g', 'laoji-40g-130', NULL, NULL, 'IMP-LAO-1712', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(182, 'laoji 100g * 310/=', 'ලාඕජී තේ 100g', 'laoji-100g-310', NULL, NULL, 'IMP-LAO-5235', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(183, 'papadam test 100g* 180/=', 'පපඩම් 100g', 'papadam-test-100g-180', NULL, NULL, 'IMP-PAP-7650', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(184, 'kaaralla 100g', 'කාරල්ලා 100g', 'kaaralla-100g', NULL, NULL, 'IMP-KAA-1363', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(185, 'red harischandra noodles 400g *', 'හරිස්චන්ද්‍ර නූඩ්ල්ස් RED 400g', 'red-harischandra-noodles-400g', NULL, NULL, 'IMP-RED-1205', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(186, 'harischandra noodles 400g  330/=', 'හරිස්චන්ද්‍ර නූඩ්ල්ස් 400g', 'harischandra-noodles-400g-330', NULL, NULL, 'IMP-HAR-6474', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(187, 'vinakiri md 750ml 370/=', 'විනාකිරි 750ml', 'vinakiri-md-750ml-370', NULL, NULL, 'IMP-VIN-9806', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(188, 'soos 15g 20/=', 'සෝස් 15g', 'soos-15g-20', NULL, NULL, 'IMP-SOO-8670', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(189, 'mortein  spree', 'mortein fast kill', 'mortein-spree', NULL, NULL, 'IMP-MOR-1714', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(190, 'ninja maduru dagara yugala 50/=', 'නින්ජා මදුරු දඟර යුගල', 'ninja-maduru-dagara-yugala-50', NULL, NULL, 'IMP-NIN-2351', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(191, 'pas panguva 100/=', 'පස්පංගුව80', 'pas-panguva-100', NULL, NULL, 'IMP-PAS-8066', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(192, 'nadu araliya 5kg puck', 'වෙනත්', 'nadu-araliya-5kg-puck', NULL, NULL, 'IMP-NAD-9869', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(193, 'kiri samba nipuna 5k', 'වෙනත්', 'kiri-samba-nipuna-5k', NULL, NULL, 'IMP-KIR-2700', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(194, 'raththi 400g *', 'රත්ති 400g', 'raththi-400g', NULL, NULL, 'IMP-RAT-7119', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(195, 'anc UHT van', 'Anchor UHT van', 'anc-uht-van', NULL, NULL, 'IMP-ANC-9796', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(196, 'anc UHT choc', 'Anchor UHT CHOC', 'anc-uht-choc', NULL, NULL, 'IMP-ANC-5792', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(197, 'soya chicken raigam 50g 110/=', 'රයිගම් චිකන් සෝයා 50g', 'soya-chicken-raigam-50g-110', NULL, NULL, 'IMP-SOY-5495', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(198, 'soya roast chicken raigam * 80/=', 'රයිගම් රෝස් චිකන් සෝයා 90g', 'soya-roast-chicken-raigam-80', NULL, NULL, 'IMP-SOY-4488', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(199, 'soya devilled raigam chicken/prown/cuttlefish', 'රයිගම් ඩෙවල්  සෝයා 90g', 'soya-devilled-raigam-chickenprowncuttlefish', NULL, NULL, 'IMP-SOY-6543', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(200, ' lunu kudu  1kg', ' ලුණු කුඩු 1kg	', 'lunu-kudu-1kg', NULL, NULL, 'IMP-LUN-5981', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(201, 'vinakiri  md350ml *  260/=', ' විනාකිරි MD350ml', 'vinakiri-md350ml-260', NULL, NULL, 'IMP-VIN-6439', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(202, 'ponni nadu loos', 'වෙනත්', 'ponni-nadu-loos', NULL, NULL, 'IMP-PON-8752', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(203, 'maggi noodls chiken 125/=', 'මැගී චිකන් නූඩ්ල්ස් 73g', 'maggi-noodls-chiken-125', NULL, NULL, 'IMP-MAG-7819', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(204, 'nestomalt welfare 400g * 980/=', 'නෙස්ටමෝල්ට්  welfare 400g', 'nestomalt-welfare-400g-980', NULL, NULL, 'IMP-NES-2579', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(205, 'maggi noodls kothtu 80/=', 'මැගී කොත්තු 73g', 'maggi-noodls-kothtu-80', NULL, NULL, 'IMP-MAG-6952', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(206, 'prima  noodls 345g 390/=', 'ප්‍රීමා නූඩ්ල්ස්  345g', 'prima-noodls-345g-390', NULL, NULL, 'IMP-PRI-3136', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(207, 'jambo pinut 60/=', 'ජම්බෝ පීනට් ', 'jambo-pinut-60', NULL, NULL, 'IMP-JAM-8278', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(208, 'ponni samba loos', 'වෙනත්', 'ponni-samba-loos', NULL, NULL, 'IMP-PON-3358', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(209, 'milo 15g 50', 'මයිලෝ 15g', 'milo-15g-50', NULL, NULL, 'IMP-MIL-6848', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(210, 'saw hal ', 'සව් හාල් ', 'saw-hal', NULL, NULL, 'IMP-SAW-7098', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(211, 'tishu 280', 'පේපර් සර්වියට්', 'tishu-280', NULL, NULL, 'IMP-TIS-9935', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(212, 'karallo', 'කාරල්ලා 100g', 'karallo', NULL, NULL, 'IMP-KAR-3110', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(213, 'maliban kiri 400g *', 'මැලිබන් කිරි 400g', 'maliban-kiri-400g', NULL, NULL, 'IMP-MAL-8970', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(214, 'yahaposha 200*', 'යහපෝෂ 200g', 'yahaposha-200', NULL, NULL, 'IMP-YAH-9041', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(215, 'maliban the 50g* 130/=', 'මැලිබන් තේ 50g ', 'maliban-the-50g-130', NULL, NULL, 'IMP-MAL-1176', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(216, 'maliban the gold 150/=', 'මැලිබන් තේ ', 'maliban-the-gold-150', NULL, NULL, 'IMP-MAL-6736', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(217, 'suduru 50g 175/=', 'සූදුරු 50g', 'suduru-50g-175', NULL, NULL, 'IMP-SUD-3601', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(218, 'gam miris kudu 50/=', 'ගම් මිරිස් කුඩු ', 'gam-miris-kudu-50', NULL, NULL, 'IMP-GAM-7454', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(219, 'raththi 1k', 'රත්ති 1k', 'raththi-1k', NULL, NULL, 'IMP-RAT-1114', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(220, 'papadam 130/=', 'පපඩම්  50g', 'papadam-130', NULL, NULL, 'IMP-PAP-3686', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(221, 'mun guli', 'මුං ගුලි', 'mun-guli', NULL, NULL, 'IMP-MUN-5612', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(222, 'labu', 'ලබු', 'labu', NULL, NULL, 'IMP-LAB-5100', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(223, 'thibbatu', 'තිබ්බටු', 'thibbatu', NULL, NULL, 'IMP-THI-2713', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(224, 'saman 425g 550/=', 'සැමන් 425g', 'saman-425g-550', NULL, NULL, 'IMP-SAM-6160', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(225, 'vathura 1500ml  160/=', 'වතුර 1500ml', 'vathura-1500ml-160', NULL, NULL, 'IMP-VAT-9511', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(226, 'mask', 'මාස්ක්', 'mask', NULL, NULL, 'IMP-MAS-9157', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(227, 'lanka soy chicken 180/=', 'සෝයා මීට්  90g', 'lanka-soy-chicken-180', NULL, NULL, 'IMP-LAN-6968', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(228, ' milk short 85g*120/=', 'මිල්ක් ෂෝර්ට් කේක් 85g', 'milk-short-85g120', NULL, NULL, 'IMP-MIL-7046', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(229, 'iguru maliban biscut 80g * 120/=', 'මැලිබන් ඉඟුරු බිස්කට් 80g', 'iguru-maliban-biscut-80g-120', NULL, NULL, 'IMP-IGU-1893', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(230, 'kurudu pothu 40/=', 'කුරුදු ', 'kurudu-pothu-40', NULL, NULL, 'IMP-KUR-7677', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34');
INSERT INTO `products` (`id`, `name`, `name_si`, `slug`, `description`, `barcode`, `sku`, `expiredate`, `image`, `alertlimit`, `youtubelink`, `tags`, `sellingtype`, `status`, `salescount`, `isFeatured`, `category_id`, `subcategory_id`, `childcategory_id`, `brand_id`, `section_id`, `supplier_id`, `user_id`, `created_at`, `updated_at`) VALUES
(231, 'milo UHT 100/=', 'මයිලෝ ', 'milo-uht-100', NULL, NULL, 'IMP-MIL-8358', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(232, 'smak dhal', 'SMAK dhal', 'smak-dhal', NULL, NULL, 'IMP-SMA-9044', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(233, 'smak onian', 'SMAK onian', 'smak-onian', NULL, NULL, 'IMP-SMA-3708', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(234, 'smak hot & spicy 130/=', 'SMAK hot & spicy', 'smak-hot-spicy-130', NULL, NULL, 'IMP-SMA-7763', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:34', '2024-11-19 04:07:34'),
(235, 'smak cassava', 'SMAK cassava', 'smak-cassava', NULL, NULL, 'IMP-SMA-3189', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(236, 'umbalakada 20g 50/=', 'උම්බලකඩ 20g', 'umbalakada-20g-50', NULL, NULL, 'IMP-UMB-4077', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(237, 'hacks ', 'Hacks', 'hacks', NULL, NULL, 'IMP-HAC-6097', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(238, 'batana', 'බටානා', 'batana', NULL, NULL, 'IMP-BAT-3588', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(239, 'maliban lemon paf 200g  250/=', 'මැලිබන් ලෙමන් පෆ් 200g', 'maliban-lemon-paf-200g-250', NULL, NULL, 'IMP-MAL-3349', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(240, 'saban sunlight lemon * 150/=', 'සන්ලයිට්  ලෙමන් ', 'saban-sunlight-lemon-150', NULL, NULL, 'IMP-SAB-5673', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(241, 'shashe shampoo 8', 'ෂැෂේ ෂම්පූ ', 'shashe-shampoo-8', NULL, NULL, 'IMP-SHA-4950', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(242, 'hair jel', 'හෙයා ජේල්', 'hair-jel', NULL, NULL, 'IMP-HAI-2917', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(243, 'kumarika shampoo  145/=', 'කුමාරිකා ෂම්පූ', 'kumarika-shampoo-145', NULL, NULL, 'IMP-KUM-6564', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(244, 'san silk 125', 'සන්සිල්ක්ෂම්පූ ', 'san-silk-125', NULL, NULL, 'IMP-SAN-6076', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(245, 'Lemon sunlight powder 1k *480/=', 'LEMON සන්ලයිට්  පව්ඩර් 1k', 'lemon-sunlight-powder-1k-480', NULL, NULL, 'IMP-LEM-3382', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(246, 'vim 100g ', 'විම් 100g', 'vim-100g', NULL, NULL, 'IMP-VIM-9208', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(247, ' comfart 90ml 150/=', ' කොම්ෆර්ට් 90ml ', 'comfart-90ml-150', NULL, NULL, 'IMP-COM-9710', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(248, 'sarf excel 30g', 'සර්ෆ් එක්සෙල් 30g', 'sarf-excel-30g', NULL, NULL, 'IMP-SAR-4796', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(249, 'sarf excel 60g', 'සර්ෆ් එක්සෙල් 60g', 'sarf-excel-60g', NULL, NULL, 'IMP-SAR-7864', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(250, 'sarf excel 120g', 'සර්ෆ් එක්සෙල් 120g', 'sarf-excel-120g', NULL, NULL, 'IMP-SAR-9864', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(251, 'sarf excel 250g*', 'සර්ෆ් එක්සෙල් 250g', 'sarf-excel-250g', NULL, NULL, 'IMP-SAR-2644', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(252, 'sarf excel 500g *', 'සර්ෆ් එක්සෙල් 500g', 'sarf-excel-500g', NULL, NULL, 'IMP-SAR-6139', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(253, 'rin powder 500g*', 'රින් 500g', 'rin-powder-500g', NULL, NULL, 'IMP-RIN-2729', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(254, 'saban sunlight 65g 100/=', 'සන්ලයිට්  65g', 'saban-sunlight-65g-100', NULL, NULL, 'IMP-SAB-3652', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(255, 'saban sunlight rosa *', 'සන්ලයිට්  රෝස', 'saban-sunlight-rosa', NULL, NULL, 'IMP-SAB-7289', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(256, ' sunlight rose 25/=', 'සන්ලයිට්  පව්ඩර් ', 'sunlight-rose-25', NULL, NULL, 'IMP-SUN-1555', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(257, 'sakura powder 25/=', 'sakuraසන්ලිට් පව්ඩර් 60g', 'sakura-powder-25', NULL, NULL, 'IMP-SAK-1798', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(258, 'rose sunlight powder 400g 190/=', 'ROSE සන්ලයිට් පව්ඩර් 500g', 'rose-sunlight-powder-400g-190', NULL, NULL, 'IMP-ROS-1778', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(259, 'vim 200*', 'විම් 200g', 'vim-200', NULL, NULL, 'IMP-VIM-3776', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(260, 'vim 100g x 3', 'විම් 100g x 3', 'vim-100g-x-3', NULL, NULL, 'IMP-VIM-4364', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(261, 'vim liquid 250ml* 285/=', 'විම් Liquid 250ml', 'vim-liquid-250ml-285', NULL, NULL, 'IMP-VIM-4281', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(262, 'vim liquid 500ml*', 'විම් Liquid 500ml', 'vim-liquid-500ml', NULL, NULL, 'IMP-VIM-7463', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(263, 'closeup 120g*', 'closeup 120g', 'closeup-120g', NULL, NULL, 'IMP-CLO-8698', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(264, 'clogard 70g 250/=', 'clogard 70g', 'clogard-70g-250', NULL, NULL, 'IMP-CLO-1266', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(265, 'saban lifebuoy herbel 56*', 'ල්යිෆ්බෝයි HERBAL 100g', 'saban-lifebuoy-herbel-56', NULL, NULL, 'IMP-SAB-8163', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(266, 'saban lemon lifebuoy 53*', 'ල්යිෆ්බෝයි lemon 100g', 'saban-lemon-lifebuoy-53', NULL, NULL, 'IMP-SAB-1172', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(267, 'saban lifebuoy 50g 85/=', 'ල්යිෆ්බෝයි 50g', 'saban-lifebuoy-50g-85', NULL, NULL, 'IMP-SAB-8509', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(268, 'saban pears * 160/=', 'පෙයාස් සබන්', 'saban-pears-160', NULL, NULL, 'IMP-SAB-5212', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(269, 'saban lux *125/=', 'ලක්ස් සබන්', 'saban-lux-125', NULL, NULL, 'IMP-SAB-8438', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(270, 'brash clogard 130/=', 'Clogard බ්‍රශ්', 'brash-clogard-130', NULL, NULL, 'IMP-BRA-4367', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(271, 'tuth pest signal 40g * 125/=', 'සිග්නල් 40g', 'tuth-pest-signal-40g-125', NULL, NULL, 'IMP-TUT-1455', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(272, 'tuth pest signal 120g * 250/=', 'සිග්නල් 120g', 'tuth-pest-signal-120g-250', NULL, NULL, 'IMP-TUT-1955', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(273, 'tuth pest signal 70g  200/=', 'සිග්නල් 70g', 'tuth-pest-signal-70g-200', NULL, NULL, 'IMP-TUT-5300', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(274, 'tuth pest signal 160g * 310/=', 'සිග්නල් 160g', 'tuth-pest-signal-160g-310', NULL, NULL, 'IMP-TUT-6092', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(275, 'silonta 50g', 'සිලෝන්ටා 50g', 'silonta-50g', NULL, NULL, 'IMP-SIL-1560', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(276, 'prima koththu me 130/=', 'කොත්තු මී', 'prima-koththu-me-130', NULL, NULL, 'IMP-PRI-3988', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(277, 'prima loku*380/=', 'ප්‍රීමා නූඩ්ල්ස් 345g', 'prima-loku380', NULL, NULL, 'IMP-PRI-9984', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(278, 'pol1 150/=', 'පොල්', 'pol1-150', NULL, NULL, 'IMP-POL-4711', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(279, 'bala ', 'බල 100g', 'bala', NULL, NULL, 'IMP-BAL-8583', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(280, 'soya freeland', 'සෝයා මීට් 70g', 'soya-freeland', NULL, NULL, 'IMP-SOY-2405', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(281, 'kambi brash ', 'කම්බි බ්‍රශ් ', 'kambi-brash', NULL, NULL, 'IMP-KAM-2705', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(282, 'spoch', 'ස්පොන්ච්', 'spoch', NULL, NULL, 'IMP-SPO-5199', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(283, 'MAS mas curry * 120/=', 'MAS මස් කරි 35g', 'mas-mas-curry-120', NULL, NULL, 'IMP-MAS-9861', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(284, 'anchor 400g', 'ඇන්කර් 400g', 'anchor-400g', NULL, NULL, 'IMP-ANC-9640', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(285, 'freeland thunapaha *', 'ෆ්‍රීලන්ඩ් තුනපහ 50g', 'freeland-thunapaha', NULL, NULL, 'IMP-FRE-5769', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(286, 'idiappa piti rathu 1k*', 'රතු ඉදිආප්ප පිටි1k', 'idiappa-piti-rathu-1k', NULL, NULL, 'IMP-IDI-7810', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(287, 'idiappa piti sudu 1k*', 'සුදු ඉදිආප්ප පිටි1k', 'idiappa-piti-sudu-1k', NULL, NULL, 'IMP-IDI-3598', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(288, 'goraka cream  80/=', 'ගොරක ක්‍රීම්', 'goraka-cream-80', NULL, NULL, 'IMP-GOR-5938', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(289, 'rasam 90g 140', 'රසම් 90g', 'rasam-90g-140', NULL, NULL, 'IMP-RAS-6523', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(290, 'kurakkan biscuit 350/=', 'කුරක්කන් biscuit', 'kurakkan-biscuit-350', NULL, NULL, 'IMP-KUR-6306', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(291, 'kopi vijaya 50*', 'විජය කෝපි 50', 'kopi-vijaya-50', NULL, NULL, 'IMP-KOP-6264', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(292, 'kopi nikado 20g 80/=', ' කෝපි 20g', 'kopi-nikado-20g-80', NULL, NULL, 'IMP-KOP-3355', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(293, 'aniyan manchi 50/=', 'අනියන් බිස්කට් 30g', 'aniyan-manchi-50', NULL, NULL, 'IMP-ANI-1656', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(294, 'vepas manchi 85g *', 'වේෆස් 85g', 'vepas-manchi-85g', NULL, NULL, 'IMP-VEP-6431', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(295, 'vepas manchi 170g *', 'වේෆස් 85g', 'vepas-manchi-170g', NULL, NULL, 'IMP-VEP-2815', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(296, 'samaposha 200g *', 'සමපෝෂ 200g', 'samaposha-200g', NULL, NULL, 'IMP-SAM-2542', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(297, 'panadol  2 ', 'පැනඩෝල්  ', 'panadol-2', NULL, NULL, 'IMP-PAN-9800', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(298, 'panadol card 1', 'පැනඩෝල් කාර්ඩ් 1', 'panadol-card-1', NULL, NULL, 'IMP-PAN-6147', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(299, 'bic reser thala 3', 'බික් රේසර්', 'bic-reser-thala-3', NULL, NULL, 'IMP-BIC-7401', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(300, 'aba', 'අඹ', 'aba', NULL, NULL, 'IMP-ABA-9975', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(301, 'lanch seet', 'ලන්ච් සීට් කට්ටෙ', 'lanch-seet', NULL, NULL, 'IMP-LAN-9843', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(302, 'hadunkuru 100/=', 'හදුන් කූරු', 'hadunkuru-100', NULL, NULL, 'IMP-HAD-5930', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(303, 'nil bothal', 'නිල් බෝතල්', 'nil-bothal', NULL, NULL, 'IMP-NIL-7890', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(304, 'barli', 'බර්ලි', 'barli', NULL, NULL, 'IMP-BAR-8630', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(305, 'pol kiri', 'පොල් කිරි', 'pol-kiri', NULL, NULL, 'IMP-POL-6723', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(306, 'danhil', 'ඩන්හිල්', 'danhil', NULL, NULL, 'IMP-DAN-2382', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(307, 'gold leaf', 'ගොල්ඩ් ලීෆ්', 'gold-leaf', NULL, NULL, 'IMP-GOL-7253', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(308, 'coca cola ', 'කොකා කෝලා 250ml', 'coca-cola', NULL, NULL, 'IMP-COC-2819', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(309, 'coca cola 100/=', 'කොකා කෝලා ', 'coca-cola-100', NULL, NULL, 'IMP-COC-8992', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(310, 'coca cola 300/=', 'කොකා කෝලා 1050ml', 'coca-cola-300', NULL, NULL, 'IMP-COC-2224', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(311, 'coca cola 380/=', 'කොකා කෝලා1.5ml', 'coca-cola-380', NULL, NULL, 'IMP-COC-2904', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(312, 'coca cola 170/=', 'කොකා කෝලා 400ml', 'coca-cola-170', NULL, NULL, 'IMP-COC-6153', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(313, 'coca cola ', 'කොකා කෝලා', 'coca-cola-1', NULL, NULL, 'IMP-COC-4230', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(314, 'ce1 kola 300/=', 'ඊවා දම්', 'ce1-kola-300', NULL, NULL, 'IMP-CE1-7024', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(315, 'cf1* rosa 65/= thani pad', 'ෆෙම්ස් රෝස', 'cf1-rosa-65-thani-pad', NULL, NULL, 'IMP-CF1-9353', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(316, 'pan piti', 'පන් පිටි', 'pan-piti', NULL, NULL, 'IMP-PAN-5661', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(317, 'sudu kakulu', 'සුදු කැකුළු', 'sudu-kakulu', NULL, NULL, 'IMP-SUD-6643', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(318, 'jayathilaka hal piti 1k *', 'ජයතිලක හාල් පිටි 1k', 'jayathilaka-hal-piti-1k', NULL, NULL, 'IMP-JAY-4384', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(319, 'pasta 1k *', 'පාස්තා 1k', 'pasta-1k', NULL, NULL, 'IMP-PAS-7029', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(320, 'hakuru packet 150/=', 'හකුරු', 'hakuru-packet-150', NULL, NULL, 'IMP-HAK-4962', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(321, 'potato crem creaker 110g', 'පොටැටෝ ක්‍රීම් ක්‍රැකර් 110g', 'potato-crem-creaker-110g', NULL, NULL, 'IMP-POT-9981', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(322, 'vepas stik ', 'වේෆස් ස්ටික් ', 'vepas-stik', NULL, NULL, 'IMP-VEP-9753', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(323, 'super cream cracker 85g * 90/=', 'සුපර් ක්‍රීම් ක්‍රැකර් 85g', 'super-cream-cracker-85g-90', NULL, NULL, 'IMP-SUP-8201', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(324, 'samba araliya 5kg ', 'වෙනත්', 'samba-araliya-5kg', NULL, NULL, 'IMP-SAM-8326', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(325, 'nescafe 80', 'නෙස්කැෆේ 18g', 'nescafe-80', NULL, NULL, 'IMP-NES-1576', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(326, 'smak kadala', 'SMAK spicy chik', 'smak-kadala', NULL, NULL, 'IMP-SMA-6891', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(327, 'smak mixed fruit 500ml 140', 'මිශ්‍ර පලතුරු නෙක්ටා 500ml', 'smak-mixed-fruit-500ml-140', NULL, NULL, 'IMP-SMA-8470', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(328, 'smak mixed fruit 200ml 150/=', 'මිශ්‍ර පලතුරු නෙක්ටා 200ml', 'smak-mixed-fruit-200ml-150', NULL, NULL, 'IMP-SMA-7252', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(329, 'komarika pane 140/=', 'කෝමාරිකා පානේ 200ml', 'komarika-pane-140', NULL, NULL, 'IMP-KOM-8134', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(330, 'sakura sunlight powder 200g 120/=', 'SAKURA සන්ලයිට් පව්ඩර් 200g', 'sakura-sunlight-powder-200g-120', NULL, NULL, 'IMP-SAK-2773', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(331, 'thalapath', 'තලපත් 100g', 'thalapath', NULL, NULL, 'IMP-THA-4254', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(332, 'samahan', 'සමහන්', 'samahan', NULL, NULL, 'IMP-SAM-4188', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(333, 'youget chello 80/=', 'යෝගට්', 'youget-chello-80', NULL, NULL, 'IMP-YOU-7489', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(334, 'gova mal', 'ගෝවා මල්', 'gova-mal', NULL, NULL, 'IMP-GOV-5472', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(335, 'sambrani 150', 'සාම්බ්‍රානි', 'sambrani-150', NULL, NULL, 'IMP-SAM-1381', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(336, 'gold budy', 'ගොල්ඩ් බඩී', 'gold-budy', NULL, NULL, 'IMP-GOL-3557', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(337, 'saban kohoba beby 220/=', 'කොහොඹ බේබි ', 'saban-kohoba-beby-220', NULL, NULL, 'IMP-SAB-8327', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(338, 'saban kohoba herbel 125', 'කොහොඹ Herbal', 'saban-kohoba-herbel-125', NULL, NULL, 'IMP-SAB-2256', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(339, 'saban rani 135/=', 'රානී සබන් ', 'saban-rani-135', NULL, NULL, 'IMP-SAB-4582', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(340, 'safe guard 100/=', 'Safe gurd 100/=', 'safe-guard-100', NULL, NULL, 'IMP-SAF-4895', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(341, 'kawm 70/=', 'කැව්ම්', 'kawm-70', NULL, NULL, 'IMP-KAW-5268', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(342, 'ada', 'අඩ', 'ada', NULL, NULL, 'IMP-ADA-4377', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(343, 'cap', 'ප්ලස්ටික් කොප්ප', 'cap', NULL, NULL, 'IMP-CAP-9897', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(344, 'plet', 'පේපර් ප්ලේට්', 'plet', NULL, NULL, 'IMP-PLE-5699', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(345, 'vathura 1000ml 110/=', 'වතුර 1000ml', 'vathura-1000ml-110', NULL, NULL, 'IMP-VAT-2876', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(346, 'vathura 5l 400/=', 'වතුර 5L', 'vathura-5l-400', NULL, NULL, 'IMP-VAT-2757', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(347, 'youget pane 160/=', 'යෝගට් පානේ', 'youget-pane-160', NULL, NULL, 'IMP-YOU-2544', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(348, 'viva 400g', 'වීවා 400g', 'viva-400g', NULL, NULL, 'IMP-VIV-9789', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(349, 'viva 26g', 'වීවා 26g', 'viva-26g', NULL, NULL, 'IMP-VIV-7023', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(350, 'vim 400g 265/=', 'විම් 400g', 'vim-400g-265', NULL, NULL, 'IMP-VIM-4085', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(351, 'rin 40g 20/=', 'රින් 40g', 'rin-40g-20', NULL, NULL, 'IMP-RIN-4674', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(352, 'hiru kiri samba', 'හිරු කීරි සම්බා', 'hiru-kiri-samba', NULL, NULL, 'IMP-HIR-5525', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(353, 'coca cola 420/=', 'කොකා කෝලා 2L', 'coca-cola-420', NULL, NULL, 'IMP-COC-6964', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(354, 'horlis biscat', 'හොර්ලිස් බිස්කට්', 'horlis-biscat', NULL, NULL, 'IMP-HOR-6921', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(355, 'soda 100/=', 'සෝඩා', 'soda-100', NULL, NULL, 'IMP-SOD-9238', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(356, 'soda 50/=', 'සෝඩා', 'soda-50', NULL, NULL, 'IMP-SOD-7930', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(357, 'hurullo', 'හුරුල්ලන් 100g', 'hurullo', NULL, NULL, 'IMP-HUR-5837', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(358, 'nice munchee 100g 110/=', 'නයිස් බිස්කට් 100g', 'nice-munchee-100g-110', NULL, NULL, 'IMP-NIC-6452', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(359, 'chok shok', 'චොක් ශොක් ', 'chok-shok', NULL, NULL, 'IMP-CHO-2783', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(360, 'brash denta', 'ඩෙන්ටා බ්‍රශ්', 'brash-denta', NULL, NULL, 'IMP-BRA-1171', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(361, 'ist dcl', ' DCL ඊස්ට් 11g', 'ist-dcl', NULL, NULL, 'IMP-IST-5221', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(362, 'tipitip  60/=', 'tipitip', 'tipitip-60', NULL, NULL, 'IMP-TIP-2732', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(363, 'samaposha 500g *', 'සමපෝෂ 500g', 'samaposha-500g', NULL, NULL, 'IMP-SAM-5059', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(364, 'keeri loos', 'කීරි ලූස්', 'keeri-loos', NULL, NULL, 'IMP-KEE-4960', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(365, 'laitar 100/=', 'ලයිටර්', 'laitar-100', NULL, NULL, 'IMP-LAI-6801', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(366, 'pahan thira iti 50/=', 'පහන් තිර', 'pahan-thira-iti-50', NULL, NULL, 'IMP-PAH-8577', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(367, 'pahan thira 50/=', 'පහන් තිර', 'pahan-thira-50', NULL, NULL, 'IMP-PAH-3894', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(368, 'black and white 80g', 'black and white 80g', 'black-and-white-80g', NULL, NULL, 'IMP-BLA-6895', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(369, 'ninja vepar raisar', 'නින්ජා', 'ninja-vepar-raisar', NULL, NULL, 'IMP-NIN-4529', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(370, 'aa batari  125/=', 'AA බැටරි ', 'aa-batari-125', NULL, NULL, 'IMP-AAB-6696', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(371, 'papadam loos', 'පපඩම් ලූස්', 'papadam-loos', NULL, NULL, 'IMP-PAP-7225', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(372, 'catlet', 'කට්ලට්', 'catlet', NULL, NULL, 'IMP-CAT-8336', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(373, 'viva welfare 400g', 'වීවා welfare 400g', 'viva-welfare-400g', NULL, NULL, 'IMP-VIV-1014', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(374, 'laoji 20g 60/=', 'ලාඕජී තේ  20g', 'laoji-20g-60', NULL, NULL, 'IMP-LAO-5090', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(375, 'horlis biscat 250g', 'හොර්ලිස් බිස්කට් 250g', 'horlis-biscat-250g', NULL, NULL, 'IMP-HOR-6795', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(376, 'kadala', 'කඩල ', 'kadala', NULL, NULL, 'IMP-KAD-4467', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(377, 'sweet 26/=', 'strepsils', 'sweet-26', NULL, NULL, 'IMP-SWE-1241', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(378, 'nestea 25g 80/=', 'nestea25g', 'nestea-25g-80', NULL, NULL, 'IMP-NES-5757', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(379, 'hen vattakka', '	වට්ටක්කා', 'hen-vattakka', NULL, NULL, 'IMP-HEN-6056', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(380, 'coca cola 120/=', 'කොකා කෝලා 250ml', 'coca-cola-120', NULL, NULL, 'IMP-COC-9570', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(381, 'pen', 'pen', 'pen', NULL, NULL, 'IMP-PEN-6890', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(382, 'detol 210ml', 'ඩෙටෝල් 210ml', 'detol-210ml', NULL, NULL, 'IMP-DET-1498', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(383, 'detol  60ml   200/=', 'ඩෙටෝල් 60ml', 'detol-60ml-200', NULL, NULL, 'IMP-DET-4509', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(384, 'silonta 100g', 'සිලෝන්ටා 100g', 'silonta-100g', NULL, NULL, 'IMP-SIL-1809', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(385, 'deveni batha rathu 350g', 'රයිගම් දෙවෙනි බත රතු 350g', 'deveni-batha-rathu-350g', NULL, NULL, 'IMP-DEV-7182', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(386, 'thakkali sos', 'තක්කලි සෝස් ', 'thakkali-sos', NULL, NULL, 'IMP-THA-6570', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(387, 'rathu nadu', 'රතු නාඩු', 'rathu-nadu', NULL, NULL, 'IMP-RAT-3315', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(388, 'rathu nadu', 'රතු නාඩු', 'rathu-nadu-1', NULL, NULL, 'IMP-RAT-8768', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(389, 'umbalakada pawdar 8g', 'නෝ උම්බලකඩ පව්ඩර් 8g', 'umbalakada-pawdar-8g', NULL, NULL, 'IMP-UMB-4416', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(390, 'deveni batha 350g', 'රයිගම් දෙවෙනි බත 350g', 'deveni-batha-350g', NULL, NULL, 'IMP-DEV-7989', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(391, 'super cream cracker 490g * 480/=', 'සුපර් ක්‍රීම් ක්‍රැකර් 490g*', 'super-cream-cracker-490g-480', NULL, NULL, 'IMP-SUP-4906', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(392, 'annasi ', 'අන්නාසි', 'annasi', NULL, NULL, 'IMP-ANN-5481', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(393, 'paan 200/=', 'පාන් ', 'paan-200', NULL, NULL, 'IMP-PAA-2283', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(394, 'cake ', 'කේක් ', 'cake', NULL, NULL, 'IMP-CAK-8165', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:35'),
(395, 'kiri pani', 'කිරි පැනි ', 'kiri-pani', NULL, NULL, 'IMP-KIR-7603', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:35', '2024-11-19 04:07:36'),
(396, ' fresh milk abewela 500/=', 'Fresh Milk 1L', 'fresh-milk-abewela-500', NULL, NULL, 'IMP-FRE-8467', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(397, 'chees kothmale 450/=', 'චීස්', 'chees-kothmale-450', NULL, NULL, 'IMP-CHE-7664', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(398, 'mudavapu kiri 450g', 'මුදවපු කිරි 450g', 'mudavapu-kiri-450g', NULL, NULL, 'IMP-MUD-5016', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(399, 'hiland kiri 400g', 'හයිලන්ඩ් කිරි පිටි 400g', 'hiland-kiri-400g', NULL, NULL, 'IMP-HIL-9081', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(400, 'hiland batar 65031', 'හයිලන්ඩ් බටර්', 'hiland-batar-65031', NULL, NULL, 'IMP-HIL-7358', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(401, 'pera', 'පේර', 'pera', NULL, NULL, 'IMP-PER-5516', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(402, 'komadu', 'කොමඩු', 'komadu', NULL, NULL, 'IMP-KOM-6183', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(403, 'abaralla', 'ඇබරැල්ලා', 'abaralla', NULL, NULL, 'IMP-ABA-3806', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(404, 'tikiri mari 360g 330/=', 'ටිකිරි මාරි 360g', 'tikiri-mari-360g-330', NULL, NULL, 'IMP-TIK-3603', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(405, 'hal massan 160/=', 'හාල්මැස්සන් 100', 'hal-massan-160', NULL, NULL, 'IMP-HAL-5554', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(406, 'hal massan 170/=', 'හාල්මැස්සන් 100g', 'hal-massan-170', NULL, NULL, 'IMP-HAL-3432', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(407, 'kali miris 90/=', 'කෑලි මිරිස් ', 'kali-miris-90', NULL, NULL, 'IMP-KAL-5868', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(408, 'malu kama 50/=', 'මාළු කෑම', 'malu-kama-50', NULL, NULL, 'IMP-MAL-2963', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(409, 'iodex head fast 9g 190/=', 'head fast 9g', 'iodex-head-fast-9g-190', NULL, NULL, 'IMP-IOD-8831', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(410, 'iodex 9g 155/=', 'iodex', 'iodex-9g-155', NULL, NULL, 'IMP-IOD-9617', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(411, 'eno', 'Eno', 'eno', NULL, NULL, 'IMP-ENO-2349', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(412, 'sensodyne', 'sensodyne', 'sensodyne', NULL, NULL, 'IMP-SEN-7583', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(413, 'sup umbalakada knorr', 'KNORR UMBALAKADA', 'sup-umbalakada-knorr', NULL, NULL, 'IMP-SUP-9323', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(414, 'maliban cream cracke 500g', 'මැලිබන් ක්‍රීම් ක්‍රැකර් 500g', 'maliban-cream-cracke-500g', NULL, NULL, 'IMP-MAL-6682', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(415, 'maliban  smart cream cracke190g 220/=', 'මැලිබන් ක්‍රීම් ක්‍රැකර් 190g', 'maliban-smart-cream-cracke190g-220', NULL, NULL, 'IMP-MAL-7821', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(416, 'maliban smart cream cracker 230g  240/=', 'SMART ක්‍රීම් ක්‍රැකර් 230g', 'maliban-smart-cream-cracker-230g-240', NULL, NULL, 'IMP-MAL-3056', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(417, 'maliban vepas chocolate  90g', 'චොකලට් වේෆස්  90g', 'maliban-vepas-chocolate-90g', NULL, NULL, 'IMP-MAL-9902', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(418, 'maliban vepas vanila 90g', 'වැනිලා වේෆස්', 'maliban-vepas-vanila-90g', NULL, NULL, 'IMP-MAL-4704', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(419, 'milk short c maliban 200g 260/=', 'මිල්ක් ෂෝර්ට් කේක් 200g', 'milk-short-c-maliban-200g-260', NULL, NULL, 'IMP-MIL-8281', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(420, 'maliban chocolate cream400g 450/=', 'මැලිබන් චොකලට් ක්‍රීම් 400g', 'maliban-chocolate-cream400g-450', NULL, NULL, 'IMP-MAL-4067', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(421, 'maliban gold marie 350g 360/=', 'මැලිබන් ගෝල්ඩ් මාරි 350g', 'maliban-gold-marie-350g-360', NULL, NULL, 'IMP-MAL-3957', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(422, 'maliban vepas 225', 'වැනිලා වේෆස් 225g', 'maliban-vepas-225', NULL, NULL, 'IMP-MAL-5200', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(423, 'lait mari 50g 50/=', 'ලයිට් මාරි 50g', 'lait-mari-50g-50', NULL, NULL, 'IMP-LAI-4750', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(424, 'maliban smart cream cracker 500g 590/=', 'SMART ක්‍රීම් ක්‍රැකර් 500g', 'maliban-smart-cream-cracker-500g-590', NULL, NULL, 'IMP-MAL-1092', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(425, ' kesel ', ' කෙසෙල්', 'kesel', NULL, NULL, 'IMP-KES-1419', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(426, '469 -479', '480', '469-479', NULL, NULL, 'IMP-469-7880', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(427, 'maliban chocolate cream200g 240/=', 'මැලිබන් චොකලට් ක්‍රීම් 200g', 'maliban-chocolate-cream200g-240', NULL, NULL, 'IMP-MAL-8092', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(428, 'maliban castad cream 100g 130/=', 'මැලිබන් කස්ටඩ් ක්‍රීම් 100g', 'maliban-castad-cream-100g-130', NULL, NULL, 'IMP-MAL-7069', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(429, 'maliban oreng cream 100g', 'මැලිබන් ඔරෙන්ජ් ක්‍රීම් 100', 'maliban-oreng-cream-100g', NULL, NULL, 'IMP-MAL-1695', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(430, 'iguru maliban biscut 240g 280 /=', 'මැලිබන් ඉඟුරු බිස්කට් 240g', 'iguru-maliban-biscut-240g-280', NULL, NULL, 'IMP-IGU-2783', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(431, 'chocolate mari 75g 100/=', 'චොකලට් මාරි 75g', 'chocolate-mari-75g-100', NULL, NULL, 'IMP-CHO-8229', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(432, 'lath samba 5k', 'වෙනත් ', 'lath-samba-5k', NULL, NULL, 'IMP-LAT-8799', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(433, 'lath nadu 5k', 'වෙනත්', 'lath-nadu-5k', NULL, NULL, 'IMP-LAT-6695', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(434, 'lath keeri 5k', 'වෙනත්', 'lath-keeri-5k', NULL, NULL, 'IMP-LAT-6349', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(435, 'chocolate fingers 45g', 'chocolate fingers 45g', 'chocolate-fingers-45g', NULL, NULL, 'IMP-CHO-8138', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(436, 'chocolate fingers 110g', 'chocolate fingers 110g', 'chocolate-fingers-110g', NULL, NULL, 'IMP-CHO-3494', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(437, 'chanki chocalate 60', 'CHUNKY CHOC 60g', 'chanki-chocalate-60', NULL, NULL, 'IMP-CHA-3837', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(438, 'chanki chocalate 120', 'CHUNKY CHOC 120g', 'chanki-chocalate-120', NULL, NULL, 'IMP-CHA-5885', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(439, 'chanki chocalate 200', 'CHUNKY CHOC 200g', 'chanki-chocalate-200', NULL, NULL, 'IMP-CHA-3903', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(440, 'chocalate 20', 'චොකලට්', 'chocalate-20', NULL, NULL, 'IMP-CHO-8870', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(441, 'chocalate 100', 'චොකලට්', 'chocalate-100', NULL, NULL, 'IMP-CHO-3941', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(442, 'chocalate 15', 'චොකලට්', 'chocalate-15', NULL, NULL, 'IMP-CHO-7940', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(443, 'asamodagam siddalepa 200/=', ' අසමෝදගම් 350ml', 'asamodagam-siddalepa-200', NULL, NULL, 'IMP-ASA-3509', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(444, 'baam siddalepa 10g 110/=', 'සිඬාලේප බාම් 10g', 'baam-siddalepa-10g-110', NULL, NULL, 'IMP-BAA-9821', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(445, 'baam siddalepa 5g', 'සිඬාලේප බාම් 5g', 'baam-siddalepa-5g', NULL, NULL, 'IMP-BAA-9404', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(446, 'baam siddalepa 2.5g', 'සිඬාලේප බාම් 2.5g', 'baam-siddalepa-25g', NULL, NULL, 'IMP-BAA-6014', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(447, 'saban kakulu siddalepa ', 'සිඬාලේප කැකුලු සබන්', 'saban-kakulu-siddalepa', NULL, NULL, 'IMP-SAB-3002', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(448, 'supiri viki 70g 100/=', 'සිඬාලේප සුපිරිවිකි 70g', 'supiri-viki-70g-100', NULL, NULL, 'IMP-SUP-8333', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(449, 'lak peyava', 'පේයාව ', 'lak-peyava', NULL, NULL, 'IMP-LAK-3381', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(450, 'ninja spray', 'නින්ජා ස්ප්‍රේ', 'ninja-spray', NULL, NULL, 'IMP-NIN-6126', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(451, 'loku plastik kosu 400/=', 'ප්ලස්ටික් කොසු', 'loku-plastik-kosu-400', NULL, NULL, 'IMP-LOK-6681', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(452, 'podi plastik kosu 350/=', 'ප්ලස්ටික් කොසු', 'podi-plastik-kosu-350', NULL, NULL, 'IMP-POD-9927', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(453, 'rekka plastik 450/=', 'ප්ලස්ටික් රේක්ක', 'rekka-plastik-450', NULL, NULL, 'IMP-REK-2677', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(454, 'idal', 'ඉදල්', 'idal', NULL, NULL, 'IMP-IDA-4737', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(455, 'brash kohu', 'කොහු බ්‍රෂ්', 'brash-kohu', NULL, NULL, 'IMP-BRA-1605', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36');
INSERT INTO `products` (`id`, `name`, `name_si`, `slug`, `description`, `barcode`, `sku`, `expiredate`, `image`, `alertlimit`, `youtubelink`, `tags`, `sellingtype`, `status`, `salescount`, `isFeatured`, `category_id`, `subcategory_id`, `childcategory_id`, `brand_id`, `section_id`, `supplier_id`, `user_id`, `created_at`, `updated_at`) VALUES
(456, 'vaipar400/=', 'වයිපර්', 'vaipar400', NULL, NULL, 'IMP-VAI-3343', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(457, 'mop 380/=', 'මොප්', 'mop-380', NULL, NULL, 'IMP-MOP-2698', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(458, 'lanu bola', 'ලණු බෝල', 'lanu-bola', NULL, NULL, 'IMP-LAN-6433', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(459, 'lanu karali 25/=', 'ලණු කැරලි', 'lanu-karali-25', NULL, NULL, 'IMP-LAN-3744', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(460, 'iti lanu 30/=', 'ඉටි ලණු ', 'iti-lanu-30', NULL, NULL, 'IMP-ITI-4795', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(461, 'chees cracker 100g', 'චීස් කැරකර් 100g', 'chees-cracker-100g', NULL, NULL, 'IMP-CHE-8814', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(462, 'chees cracker 200g', 'චීස් කැරකර් 200g', 'chees-cracker-200g', NULL, NULL, 'IMP-CHE-9139', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(463, 'milk shorties 50/=', 'මිල්ක් ෂෝටීට්ස් ', 'milk-shorties-50', NULL, NULL, 'IMP-MIL-9960', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(464, 'milk shorties choco 310g', 'මිල්ක් ෂෝටීට්ස් චොකෝ 310g', 'milk-shorties-choco-310g', NULL, NULL, 'IMP-MIL-1817', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(465, 'bourbon 100g', 'Bourbon 100g', 'bourbon-100g', NULL, NULL, 'IMP-BOU-3805', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(466, 'aguluvan 250g', 'අඟුලුවන් 250g', 'aguluvan-250g', NULL, NULL, 'IMP-AGU-9551', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(467, 'katta 250g', 'කට්ටා 250g', 'katta-250g', NULL, NULL, 'IMP-KAT-1136', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(468, 'kiri mora 250g', 'කිරි මෝරා 250g', 'kiri-mora-250g', NULL, NULL, 'IMP-KIR-6378', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(469, 'black and white 330g', 'black and white 330g', 'black-and-white-330g', NULL, NULL, 'IMP-BLA-3035', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(470, 'nice munchee 500g', 'නයිස් බිස්කට් 500g', 'nice-munchee-500g', NULL, NULL, 'IMP-NIC-7207', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(471, 'duplex custard sandwich 400g', 'duplex custard sandwich 400g', 'duplex-custard-sandwich-400g', NULL, NULL, 'IMP-DUP-2063', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(472, 'strawberry Jam Cup 105/=', 'strawberry Jam Cup ', 'strawberry-jam-cup-105', NULL, NULL, 'IMP-STR-5096', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(473, 'harischandra kurakkan 400g', 'හරිස්චන්ද්‍ර කුරක්කන් පිටි 400g', 'harischandra-kurakkan-400g', NULL, NULL, 'IMP-HAR-4648', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(474, 'harischandra hal piti 400g', 'හරිස්චන්ද්‍ර හාල් පිටි 400g', 'harischandra-hal-piti-400g', NULL, NULL, 'IMP-HAR-4650', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(475, 'Alli  papadam 50g 85/=', 'පපඩම් 50g', 'alli-papadam-50g-85', NULL, NULL, 'IMP-ALL-3539', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(476, 'kopi harischandra 20g 80/=', 'හරිස්චන්ද්‍ර කෝපි 20g', 'kopi-harischandra-20g-80', NULL, NULL, 'IMP-KOP-9500', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(477, 'kopi harischandra 50g 200/=', 'හරිස්චන්ද්‍ර කෝපි 50g', 'kopi-harischandra-50g-200', NULL, NULL, 'IMP-KOP-6009', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(478, 'kopi harischandra 100g', 'හරිස්චන්ද්‍ර කෝපි 100g', 'kopi-harischandra-100g', NULL, NULL, 'IMP-KOP-5506', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(479, 'harischandra appa piti 400g', 'ආප්ප මිශ්‍රණය 400g', 'harischandra-appa-piti-400g', NULL, NULL, 'IMP-HAR-9220', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(480, 'harischrandra thosa piti 400g', 'තෝස පිටි 400g', 'harischrandra-thosa-piti-400g', NULL, NULL, 'IMP-HAR-8048', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(481, 'harischandra idiappa piti 700g', 'සුදු ඉදිආප්ප පිටි 700g', 'harischandra-idiappa-piti-700g', NULL, NULL, 'IMP-HAR-3098', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(482, 'soya soos 190ml 280/=', 'සොයා සෝස් 190ml', 'soya-soos-190ml-280', NULL, NULL, 'IMP-SOY-5003', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(483, 'colmans vinakiri 750ml 240/=', ' විනාකිරි 750ml', 'colmans-vinakiri-750ml-240', NULL, NULL, 'IMP-COL-9343', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(484, 'saban harischandra ', 'සබන්', 'saban-harischandra', NULL, NULL, 'IMP-SAB-4249', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(485, 'soda 140/=', 'සෝඩා', 'soda-140', NULL, NULL, 'IMP-SOD-5220', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(486, 'rabu kola', 'රාබු', 'rabu-kola', NULL, NULL, 'IMP-RAB-1844', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(487, 'soos MD 200g 290/=', 'සෝස් 200g', 'soos-md-200g-290', NULL, NULL, 'IMP-SOO-4477', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(488, 'rose sunlight powder 1k', 'ROSE සන්ලයිට් පව්ඩර් 1k', 'rose-sunlight-powder-1k', NULL, NULL, 'IMP-ROS-2878', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(489, 'sakura sunlight powder  1k 430/=', 'SAKURA සන්ලයිට් පව්ඩර් 1k', 'sakura-sunlight-powder-1k-430', NULL, NULL, 'IMP-SAK-8491', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(490, 'sakura sunlight powder 500g 200/=', 'SAKURA සන්ලයිට් පව්ඩර් 500g', 'sakura-sunlight-powder-500g-200', NULL, NULL, 'IMP-SAK-9113', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(491, 'bubble powder 120g', 'bubble පව්ඩර් 120g', 'bubble-powder-120g', NULL, NULL, 'IMP-BUB-9630', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(492, 'rose sunlight powder 60g', 'ROSE සන්ලිට් පව්ඩර් 60g', 'rose-sunlight-powder-60g', NULL, NULL, 'IMP-ROS-4279', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(493, 'diva powder 200g 99/=', 'Diva පව්ඩර් 200g', 'diva-powder-200g-99', NULL, NULL, 'IMP-DIV-8678', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(494, 'aaa  batari', 'AAA බැටරි ලක්ශපාන', 'aaa-batari', NULL, NULL, 'IMP-AAA-7567', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(495, 'bubbles chocolate 40g', 'bubbles chocolate 40g', 'bubbles-chocolate-40g', NULL, NULL, 'IMP-BUB-9033', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(496, 'peanut choco 45g', 'PEANUT CHOCO 45g', 'peanut-choco-45g', NULL, NULL, 'IMP-PEA-5567', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(497, 'maggi noodls 335g', 'මැගී නූඩ්ල්ස් 335g', 'maggi-noodls-335g', NULL, NULL, 'IMP-MAG-3155', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(498, 'maliban vepas chocolate 225g', 'චොකලට් වේෆස් 225g', 'maliban-vepas-chocolate-225g', NULL, NULL, 'IMP-MAL-3399', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(499, 'maliban lemon puff 250/=', 'මැලිබන් ලෙමන් පෆ් 200g', 'maliban-lemon-puff-250', NULL, NULL, 'IMP-MAL-5078', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(500, 'sun cracar 95g', 'සන් ක්‍රැකර් 95g', 'sun-cracar-95g', NULL, NULL, 'IMP-SUN-3920', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(501, 'hawaian cookies 100g 130/=', 'හවායන් කුකීස් 100g', 'hawaian-cookies-100g-130', NULL, NULL, 'IMP-HAW-6953', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(502, 'hawaian cookies 200g 240 /=', 'හවායන් කුකීස් 200g', 'hawaian-cookies-200g-240', NULL, NULL, 'IMP-HAW-8621', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(503, 'saban lifebuoy milk 115/=', 'ල්යිෆ්බෝයි 75g', 'saban-lifebuoy-milk-115', NULL, NULL, 'IMP-SAB-2574', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(504, 'saban lifebuoy 53', 'ල්යිෆ්බෝය cool 100g', 'saban-lifebuoy-53', NULL, NULL, 'IMP-SAB-6536', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(505, 'saban lifebuoy 150/=', 'ල්යිෆ්බෝයි ', 'saban-lifebuoy-150', NULL, NULL, 'IMP-SAB-6947', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(506, 'saban detol proskin 110/=', 'ඩෙටෝල් සබන් proskin', 'saban-detol-proskin-110', NULL, NULL, 'IMP-SAB-6902', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(507, 'saban detol profresh 135/=', 'ඩෙටෝල් සබන් profresh', 'saban-detol-profresh-135', NULL, NULL, 'IMP-SAB-6585', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(508, 'saban detol orange 70/=', 'ඩෙටෝල් සබන් orange', 'saban-detol-orange-70', NULL, NULL, 'IMP-SAB-9960', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(509, 'chees bits', 'චීස්  බිට්ස් 30g', 'chees-bits', NULL, NULL, 'IMP-CHE-6562', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(510, 'mixed Jam Cup 105/=', 'mixed Jam Cup', 'mixed-jam-cup-105', NULL, NULL, 'IMP-MIX-2203', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(511, 'chocolate cream 100g', 'මන්චි චොකලට් ක්‍රීම් 100g', 'chocolate-cream-100g-1', NULL, NULL, 'IMP-CHO-6804', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(512, 'del', 'දෙල්', 'del', NULL, NULL, 'IMP-DEL-6873', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(513, 't banis  100/=', 'බනිස්', 't-banis-100', NULL, NULL, 'IMP-TBA-4722', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(514, '459-547', '550', '459-547', NULL, NULL, 'IMP-459-3401', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(515, 'ulu hal 100g', 'උළුහාල් 100g', 'ulu-hal-100g', NULL, NULL, 'IMP-ULU-9370', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(516, 'pani bothalaya 650/=', 'පැනි බෝතලය', 'pani-bothalaya-650', NULL, NULL, 'IMP-PAN-4096', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(517, 'vanila 28ml', 'වැනිලා 28ml', 'vanila-28ml', NULL, NULL, 'IMP-VAN-2665', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(518, 'nelum ala', 'නෙලුම් අල', 'nelum-ala', NULL, NULL, 'IMP-NEL-9235', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(519, 'gam miris ata 50g 140/=', 'ගම්මිරිස් ඇට 50g', 'gam-miris-ata-50g-140', NULL, NULL, 'IMP-GAM-5371', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(520, '138 = 217', '217', '138-217', NULL, NULL, 'IMP-138-8258', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(521, 'kadunu araliya samba 5k', 'වෙනත්', 'kadunu-araliya-samba-5k', NULL, NULL, 'IMP-KAD-7352', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(522, 'crem banis 130/=', 'ක්‍රීම් බනිස්', 'crem-banis-130', NULL, NULL, 'IMP-CRE-5914', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(523, 'saman 395/=', 'සැමන් ', 'saman-395', NULL, NULL, 'IMP-SAM-7915', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(524, 'maliban gold marie 50g 60/=', 'මැලිබන් ගෝල්ඩ් මාරි 50g', 'maliban-gold-marie-50g-60', NULL, NULL, 'IMP-MAL-4604', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(525, 'glucosse 100g 150/=', 'glucosse 100g', 'glucosse-100g-150', NULL, NULL, 'IMP-GLU-7799', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(526, '495', '495', '495', NULL, NULL, 'IMP-495-9047', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(527, 'chocolate fingers 18g', 'chocolate fingers 18g', 'chocolate-fingers-18g', NULL, NULL, 'IMP-CHO-5586', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(528, 'papadam test 50g 100/=', 'පපඩම් 50g', 'papadam-test-50g-100', NULL, NULL, 'IMP-PAP-9648', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(529, 'sudu biththara podi (M)', 'සුදු බිත්තර ', 'sudu-biththara-podi-m', NULL, NULL, 'IMP-SUD-9239', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(530, 'chocolate fingers 80g', 'chocolate fingers 80g', 'chocolate-fingers-80g', NULL, NULL, 'IMP-CHO-7028', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(531, 'rathu seeni 395/=', 'රතු සීනි', 'rathu-seeni-395', NULL, NULL, 'IMP-RAT-1961', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(532, 'astra 40g 70/=', 'ඇස්ට්‍රා මාගරින් 40g', 'astra-40g-70', NULL, NULL, 'IMP-AST-5214', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(533, 'astra 250g 495/=', 'ඇස්ට්‍රා මාගරින් 250g', 'astra-250g-495', NULL, NULL, 'IMP-AST-1454', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(534, 'harischandra vinakiri 210/=', 'විනාකිරි 350ml', 'harischandra-vinakiri-210', NULL, NULL, 'IMP-HAR-2426', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(535, 'biscat kudu  200g 185/=', 'බිස්කට් කුඩු ', 'biscat-kudu-200g-185', NULL, NULL, 'IMP-BIS-5385', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(536, 'viyali miris karal ', 'වියලි මිරිස් කරල්', 'viyali-miris-karal', NULL, NULL, 'IMP-VIY-1132', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(537, 'Renuka pol kiri 25g 75/=', 'පොල් කිරි 25g', 'renuka-pol-kiri-25g-75', NULL, NULL, 'IMP-REN-6023', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(538, 'jambo pinut 70/=', 'ජම්බෝ පීනට් ', 'jambo-pinut-70', NULL, NULL, 'IMP-JAM-8009', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(539, 'jambo pinut 100', 'ජම්බෝ පීනට් 100/=', 'jambo-pinut-100', NULL, NULL, 'IMP-JAM-1298', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(540, 'led 3.5w orange ', 'Orange LED Light  3.5W', 'led-35w-orange', NULL, NULL, 'IMP-LED-8296', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(541, 'led 5w orange', 'Orange LED Light 5W', 'led-5w-orange', NULL, NULL, 'IMP-LED-7214', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(542, 'led 7w orange', 'Orange LED Light 7W', 'led-7w-orange', NULL, NULL, 'IMP-LED-3559', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(543, 'led 9w orange', 'Orange LED Light 9W', 'led-9w-orange', NULL, NULL, 'IMP-LED-8564', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(544, 'ayoush 70g', 'Ayush 70g', 'ayoush-70g', NULL, NULL, 'IMP-AYO-5337', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(545, 'sweet 15', 'ටොෆි 15', 'sweet-15', NULL, NULL, 'IMP-SWE-2299', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(546, 'ravana badapu miris kudu 50g', 'රාවණා බැදපු මිරිස් කුඩු 50g', 'ravana-badapu-miris-kudu-50g', NULL, NULL, 'IMP-RAV-2771', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(547, 'ravana mas kari mix 20g', 'රාවණා මස් කරි මිශ්‍රණය 20g', 'ravana-mas-kari-mix-20g', NULL, NULL, 'IMP-RAV-3123', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(548, 'viyali midi 50g 150/=', 'වියලි මිදි', 'viyali-midi-50g-150', NULL, NULL, 'IMP-VIY-5317', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(549, 'salaya loos', 'සාලයන් ', 'salaya-loos', NULL, NULL, 'IMP-SAL-4371', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(550, 'kaha loos', 'කහ', 'kaha-loos', NULL, NULL, 'IMP-KAH-6341', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(551, 'vatavala 100g', 'වටවල 100g', 'vatavala-100g', NULL, NULL, 'IMP-VAT-2932', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(552, 'mari chocolate munchee 90g', 'Munchee චොකලට් මාරි 90g', 'mari-chocolate-munchee-90g', NULL, NULL, 'IMP-MAR-6433', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(553, 'chocolate cream manchi  400g', 'මන්චි චොකලට් ක්‍රීම් 400g', 'chocolate-cream-manchi-400g', NULL, NULL, 'IMP-CHO-7950', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(554, 'popit tube 20g', 'popit tube 20g', 'popit-tube-20g', NULL, NULL, 'IMP-POP-8231', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(555, 'choco mo', 'choco Mo 40g', 'choco-mo', NULL, NULL, 'IMP-CHO-8519', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(556, 'ritzbury bubbles 30g', ' ritzbury bubbles 30g', 'ritzbury-bubbles-30g', NULL, NULL, 'IMP-RIT-7748', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(557, 'champ btl 13g', 'champ BTL 13g', 'champ-btl-13g', NULL, NULL, 'IMP-CHA-9747', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(558, ' strawberry puff 200g 250/=', ' strawberry  puff 200g', 'strawberry-puff-200g-250', NULL, NULL, 'IMP-STR-5352', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(559, 'o kay vanilla 15g', 'O kay vanilla 15g', 'o-kay-vanilla-15g', NULL, NULL, 'IMP-OKA-6055', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(560, 'rolo 30g', ' Rollo 30g', 'rolo-30g', NULL, NULL, 'IMP-ROL-9650', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(561, 'swiss roll chocolate 200g', 'Swiss Roll Chocolate 200g', 'swiss-roll-chocolate-200g', NULL, NULL, 'IMP-SWI-7813', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(562, 'vatavala 50g 150/=', 'වටවල 50g', 'vatavala-50g-150', NULL, NULL, 'IMP-VAT-9369', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(563, 'zesta 100g 175', 'Zesta100g', 'zesta-100g-175', NULL, NULL, 'IMP-ZES-8601', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(564, 'zesta 50g 180/=', 'Zesta 50g', 'zesta-50g-180', NULL, NULL, 'IMP-ZES-3627', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(565, 'Zesta 195g 640/=', 'Zesta 195g', 'zesta-195g-640', NULL, NULL, 'IMP-ZES-2554', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(566, 'ran kahata 25g 40/=', 'රන් කහට 25g', 'ran-kahata-25g-40', NULL, NULL, 'IMP-RAN-8163', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(567, 'ran kahata 100g', 'රන් කහට 100g', 'ran-kahata-100g', NULL, NULL, 'IMP-RAN-8920', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(568, 'plaster 20/=', 'plaster', 'plaster-20', NULL, NULL, 'IMP-PLA-5247', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(569, 'panda baby', 'panda Baby', 'panda-baby', NULL, NULL, 'IMP-PAN-9108', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(570, 'seeni pathuru', 'සීනි පතුරු', 'seeni-pathuru', NULL, NULL, 'IMP-SEE-8789', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(571, 'gam biththara', 'ගම් බිත්තර', 'gam-biththara', NULL, NULL, 'IMP-GAM-5129', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(572, 'sweet 20', 'චොකලට් 20', 'sweet-20', NULL, NULL, 'IMP-SWE-5318', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(573, 'chees kalla 100/=', 'චීස් කෑල්ල', 'chees-kalla-100', NULL, NULL, 'IMP-CHE-7606', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(574, 'chees box happy cow 736/=', 'හැපි කව් චීස් 120g', 'chees-box-happy-cow-736', NULL, NULL, 'IMP-CHE-4179', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(575, 'red bul 250ml', 'Red Bull 250ml', 'red-bul-250ml', NULL, NULL, 'IMP-RED-1519', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(576, 'popcorn', 'පොරි', 'popcorn', NULL, NULL, 'IMP-POP-8045', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(577, 'clogard 40g 125/=', 'ක්ලෝගාඩ් 40g', 'clogard-40g-125', NULL, NULL, 'IMP-CLO-3111', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(578, 'sweet 30', 'චොකලට්', 'sweet-30', NULL, NULL, 'IMP-SWE-9041', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(579, 'maliban  smart cream cracker 85g 90/=', 'SMART  ක්‍රීම් ක්‍රැකර් 85g', 'maliban-smart-cream-cracker-85g-90', NULL, NULL, 'IMP-MAL-9947', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(580, 'maliban chocolate mari 300g', 'චොකලට් මාරි 300g', 'maliban-chocolate-mari-300g', NULL, NULL, 'IMP-MAL-3276', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(581, 'munchee  nice 200g 220/=', 'නයිස් බිස්කට් 200g', 'munchee-nice-200g-220', NULL, NULL, 'IMP-MUN-7535', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(582, 'maliban chocolate puff 100g ', 'මැලිබන් චොකලට් පෆ් 100g', 'maliban-chocolate-puff-100g', NULL, NULL, 'IMP-MAL-7199', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(583, 'maliban chocolate puff 200g', 'මැලිබන් චොකලට් පෆ් 200g', 'maliban-chocolate-puff-200g', NULL, NULL, 'IMP-MAL-5744', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(584, 'koli kuttu kesel', 'කෝලිකුට්ටු කෙසෙල්', 'koli-kuttu-kesel', NULL, NULL, 'IMP-KOL-5940', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(585, 'kurudu mitiya 85/=', 'කුරුදු මිටිය', 'kurudu-mitiya-85', NULL, NULL, 'IMP-KUR-6095', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(586, 'youget Anchor/ Raththi/ abewela 80/=', 'යෝගට්', 'youget-anchor-raththi-abewela-80', NULL, NULL, 'IMP-YOU-1225', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(587, 'pebals', 'pebbles tube', 'pebals', NULL, NULL, 'IMP-PEB-1250', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(588, 'super cream cracker 125g 140/=', 'සුපර් ක්‍රීම් ක්‍රැකර් 500g', 'super-cream-cracker-125g-140', NULL, NULL, 'IMP-SUP-3232', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(589, 'lemon powder 400', 'lemon සන්ලයිට් පව්ඩර් 400', 'lemon-powder-400', NULL, NULL, 'IMP-LEM-1337', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(590, 'maggi noodls 80/=', 'මැගී චිකන් නූඩ්ල්ස් 73g', 'maggi-noodls-80', NULL, NULL, 'IMP-MAG-8964', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(591, 'tikiri mari 145g 150/=', 'ටිකිරි මාරි 145g', 'tikiri-mari-145g-150', NULL, NULL, 'IMP-TIK-1137', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(592, 'gammiris ata 100g', 'ගම්මිරිස් ඇට 100g', 'gammiris-ata-100g', NULL, NULL, 'IMP-GAM-1303', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(593, '165', '165', '165', NULL, NULL, 'IMP-165-7651', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(594, 'sarf excel 1k', 'සර්ෆ් එක්සෙල් 1k', 'sarf-excel-1k', NULL, NULL, 'IMP-SAR-9296', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(595, 'sarf excel  new 500g ', 'සර්ෆ් එක්සෙල් new 500g', 'sarf-excel-new-500g', NULL, NULL, 'IMP-SAR-9045', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(596, 'gls 40w/60w/100w orange 200/=', 'Orange GLS', 'gls-40w60w100w-orange-200', NULL, NULL, 'IMP-GLS-9632', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(597, 'lanka soy curry 90g 135/=', 'සෝයා මීට්  කරි  90g', 'lanka-soy-curry-90g-135', NULL, NULL, 'IMP-LAN-5712', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(598, 'baking powder 50g 220/=', 'බේකින් පව්ඩර් 50g', 'baking-powder-50g-220', NULL, NULL, 'IMP-BAK-7407', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(599, 'comfort 220ml 300/=', ' කොම්ෆර්ට් 220ml', 'comfort-220ml-300', NULL, NULL, 'IMP-COM-4632', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(600, 'saban pears  family pack 725/=', 'පෙයාස් සබන් family pack', 'saban-pears-family-pack-725', NULL, NULL, 'IMP-SAB-3634', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(601, 'comfort 220ml 285/=', 'කොම්ෆර්ට් 220ml', 'comfort-220ml-285', NULL, NULL, 'IMP-COM-9534', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(602, 'odi colon  pears', ' Baby කොලොන්', 'odi-colon-pears', NULL, NULL, 'IMP-ODI-9353', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(603, 'lifeboy shampoo 99', 'lifebuoy Shampoo', 'lifeboy-shampoo-99', NULL, NULL, 'IMP-LIF-1704', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(604, 'appa soda 30/=', 'ආප්ප සෝඩා ', 'appa-soda-30', NULL, NULL, 'IMP-APP-8746', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(605, 'seppali ', 'සෙප්පලි', 'seppali', NULL, NULL, 'IMP-SEP-3441', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(606, 'diwl', 'දිබුල්', 'diwl', NULL, NULL, 'IMP-DIW-5909', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(607, 'saban lifebuoy 110/=', 'ල්යිෆ්බෝයි 75g', 'saban-lifebuoy-110', NULL, NULL, 'IMP-SAB-8324', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(608, 'ninja maduru dagara paya 12 180/=', 'නින්ජා මදුරු දඟර 12', 'ninja-maduru-dagara-paya-12-180', NULL, NULL, 'IMP-NIN-4824', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(609, 'tiwlip', 'tiwlip', 'tiwlip', NULL, NULL, 'IMP-TIW-3435', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(610, 'horliks 25g', 'හෝර්ලිස් 25g', 'horliks-25g', NULL, NULL, 'IMP-HOR-8567', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(611, 'umbalakada kali ', 'උම්බලකඩ', 'umbalakada-kali', NULL, NULL, 'IMP-UMB-4589', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(612, 'vanna 220/=', 'වන්නා 100g', 'vanna-220', NULL, NULL, 'IMP-VAN-8046', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(613, 'keeramin loos', 'කීරමින් 100g', 'keeramin-loos', NULL, NULL, 'IMP-KEE-2628', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(614, 'iodex head fast 4g', 'head fast 4g', 'iodex-head-fast-4g', NULL, NULL, 'IMP-IOD-2966', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(615, 'iodex 5g 120/=', 'Iodex 5g', 'iodex-5g-120', NULL, NULL, 'IMP-IOD-8821', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(616, 'iodex head fast 9g ', 'head fast 9g', 'iodex-head-fast-9g', NULL, NULL, 'IMP-IOD-7771', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(617, 'sudantha 200/=', 'සුදන්ත', 'sudantha-200', NULL, NULL, 'IMP-SUD-5815', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(618, 'lanka soy jambo 195/=', 'සෝයා Jumbo 120g', 'lanka-soy-jambo-195', NULL, NULL, 'IMP-LAN-2422', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(619, 'lanka soy  50g 90/=', 'සෝයා මීට් 50g', 'lanka-soy-50g-90', NULL, NULL, 'IMP-LAN-7139', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(620, 'lanka soy 100/=', 'සෝයා මීට් 50g', 'lanka-soy-100', NULL, NULL, 'IMP-LAN-2636', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(621, 'kohu kossa ', 'කොහු කොස්ස', 'kohu-kossa', NULL, NULL, 'IMP-KOH-7056', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(622, 'thedaa', 'තේඩා', 'thedaa', NULL, NULL, 'IMP-THE-5260', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(623, 'kaba pota 6', 'පොට 6 කඹ', 'kaba-pota-6', NULL, NULL, 'IMP-KAB-2956', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(624, 'kaba pota 8', 'පොට 8 කඹ', 'kaba-pota-8', NULL, NULL, 'IMP-KAB-7034', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(625, 'kaba pota 10', 'පොට 10 කඹ', 'kaba-pota-10', NULL, NULL, 'IMP-KAB-3227', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(626, 'mas kari 105/=', 'Arpico  මස් කරි මිශ්‍රණය 50g', 'mas-kari-105', NULL, NULL, 'IMP-MAS-9199', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(627, 'vathura 19l 170/=', 'වතුර 19L', 'vathura-19l-170', NULL, NULL, 'IMP-VAT-1773', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(628, 'komarika pane 500ml', 'කෝමාරිකා පානේ 500ml', 'komarika-pane-500ml', NULL, NULL, 'IMP-KOM-2773', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(629, 'laoji 140/=', 'ලාඕජී තේ 140/=', 'laoji-140', NULL, NULL, 'IMP-LAO-8603', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(630, 'chokalat 70/=', 'chocolate ', 'chokalat-70', NULL, NULL, 'IMP-CHO-1518', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(631, 'beema cup', 'බීම කප්', 'beema-cup', NULL, NULL, 'IMP-BEE-7641', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(632, 'soos MD 400g 490/=', 'සෝස් 400g', 'soos-md-400g-490', NULL, NULL, 'IMP-SOO-4376', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(633, 'hadun kuru 125/=', 'හදුන් කූරු', 'hadun-kuru-125', NULL, NULL, 'IMP-HAD-5559', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(634, 'harischandra rathu idi appa 400g', 'හරිස්චන්ද්‍ර රතු ඉදිආප්ප පිටි  400g', 'harischandra-rathu-idi-appa-400g', NULL, NULL, 'IMP-HAR-8988', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(635, 'vatalappan podi', 'වටලප්පන්', 'vatalappan-podi', NULL, NULL, 'IMP-VAT-2798', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(636, 'kasakasaa ata 50/=', 'කස කසා  ', 'kasakasaa-ata-50', NULL, NULL, 'IMP-KAS-1139', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(637, 'anchor 18g', 'ඇන්කර්  18g', 'anchor-18g', NULL, NULL, 'IMP-ANC-5301', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(638, 'brash  podi 160/=', ' බ්‍රශ්  (kid)', 'brash-podi-160', NULL, NULL, 'IMP-BRA-3137', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(639, 'rani pawder 175/=', 'රානී (පව්ඩර්)', 'rani-pawder-175', NULL, NULL, 'IMP-RAN-7969', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(640, 'karabu nati 50/=', 'කරාබු නැටි', 'karabu-nati-50', NULL, NULL, 'IMP-KAR-2837', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(641, 'mun ata', 'මුං ඇට', 'mun-ata', NULL, NULL, 'IMP-MUN-4324', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(642, 'jeli 230/=', 'jeli', 'jeli-230', NULL, NULL, 'IMP-JEL-7560', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(643, 'elavalu thel  200ml 280/=', 'fortune oil 200ml', 'elavalu-thel-200ml-280', NULL, NULL, 'IMP-ELA-1819', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(644, 'vatavala ayur tea', 'වටවල 40g', 'vatavala-ayur-tea', NULL, NULL, 'IMP-VAT-6198', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(645, 'jam MD 150g 230/=', 'ජෑම් 150g', 'jam-md-150g-230', NULL, NULL, 'IMP-JAM-9246', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(646, 'jambo pinut 185', 'ජම්බෝ පීනට් 185', 'jambo-pinut-185', NULL, NULL, 'IMP-JAM-9984', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(647, 'melko', 'මෙල්කො කිරි තේ', 'melko', NULL, NULL, 'IMP-MEL-1388', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(648, 'pas panguva suva darani', 'සුව දරනී ', 'pas-panguva-suva-darani', NULL, NULL, 'IMP-PAS-3869', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(649, 'elagi thel', 'එලගි තෙල්', 'elagi-thel', NULL, NULL, 'IMP-ELA-5672', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(650, 'eradu thel', 'එරඩු තෙල්', 'eradu-thel', NULL, NULL, 'IMP-ERA-7486', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(651, 'pagiri thel', 'පෑගිරි තෙල්', 'pagiri-thel', NULL, NULL, 'IMP-PAG-3275', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(652, 'pas thel', 'පස් තෙල්', 'pas-thel', NULL, NULL, 'IMP-PAS-5004', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(653, 'thala thel', 'තල තෙල්', 'thala-thel', NULL, NULL, 'IMP-THA-4242', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(654, 'mee thel', 'මී තෙල්', 'mee-thel', NULL, NULL, 'IMP-MEE-2705', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(655, 'kohoba thel', 'කොහොඹ තෙල්', 'kohoba-thel', NULL, NULL, 'IMP-KOH-5182', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(656, 'baby sherami saban 145/=', 'බේබි ශෙරමි සබන්', 'baby-sherami-saban-145', NULL, '4791111100302', 'IMP-BAB-9786', NULL, NULL, 0, NULL, NULL, 'Pieces', 1, 0, 0, 1, NULL, NULL, 1, 1, 1, 1, '2024-11-19 04:07:36', '2024-11-20 11:15:03'),
(657, 'coton buds 200/=', 'කොටන් බඩ්ස්', 'coton-buds-200', NULL, NULL, 'IMP-COT-5634', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(658, 'clogard chooti 170/=', 'ක්ලෝගාඩ්චූටි', 'clogard-chooti-170', NULL, NULL, 'IMP-CLO-4600', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(659, 'velvat 75/=', 'වෙල්වට් ', 'velvat-75', NULL, NULL, 'IMP-VEL-5607', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(660, 'velvat 130/=', 'වෙල්වට් 70g', 'velvat-130', NULL, NULL, 'IMP-VEL-6824', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(661, 'pampas S 200/=', 'ශෙරමි ඩයපර් S', 'pampas-s-200', NULL, NULL, 'IMP-PAM-7489', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(662, 'pampas M 125/=', 'ශෙරමි ඩයපර් M', 'pampas-m-125', NULL, NULL, 'IMP-PAM-3609', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(663, 'pampas L 470/=', 'ශෙරමි ඩයපර් L', 'pampas-l-470', NULL, NULL, 'IMP-PAM-1455', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(664, 'pampas XL', 'ශෙරමි ඩයපර් XL', 'pampas-xl', NULL, NULL, 'IMP-PAM-7473', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(665, 'rathna nadu 5k', 'රත්න නාඩු', 'rathna-nadu-5k', NULL, NULL, 'IMP-RAT-5347', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(666, 'aba thel', 'අබ තෙල්', 'aba-thel', NULL, NULL, 'IMP-ABA-7632', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(667, 'vepas little lion 120 /=', 'වේෆස්', 'vepas-little-lion-120', NULL, NULL, 'IMP-VEP-5973', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(668, 'medoli  100g 215/=', 'මෙඩෝලී 100g', 'medoli-100g-215', NULL, NULL, 'IMP-MED-6023', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(669, 'medoli 250g', 'මෙඩෝලී 250g', 'medoli-250g', NULL, NULL, 'IMP-MED-6397', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(670, 'medoli 500g', 'මෙඩෝලී  500g', 'medoli-500g', NULL, NULL, 'IMP-MED-1313', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(671, 'ata piti', 'ආටා පිටි 400g', 'ata-piti', NULL, NULL, 'IMP-ATA-6124', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(672, 'kn 95', 'kn 95', 'kn-95', NULL, NULL, 'IMP-KN9-3654', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(673, 'nestamolt 175g 490/=', 'නෙස්ටමෝල්ට් 175g', 'nestamolt-175g-490', NULL, NULL, 'IMP-NES-7405', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(674, 'astra 100g 200/=', 'ඇස්ට්‍රා මාගරින් 100g', 'astra-100g-200', NULL, NULL, 'IMP-AST-4593', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(675, 'sunlight 3x1', 'සන්ලයිට් ලෙමන් කෑට 3', 'sunlight-3x1', NULL, NULL, 'IMP-SUN-8755', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(676, 'sanitazer', 'සැනිටයිසර්', 'sanitazer', NULL, NULL, 'IMP-SAN-7914', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(677, 'thala karali1', 'තල කැරලි', 'thala-karali1', NULL, NULL, 'IMP-THA-7876', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(678, 'thala karali pack', 'තල කැරලි', 'thala-karali-pack', NULL, NULL, 'IMP-THA-8298', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36');
INSERT INTO `products` (`id`, `name`, `name_si`, `slug`, `description`, `barcode`, `sku`, `expiredate`, `image`, `alertlimit`, `youtubelink`, `tags`, `sellingtype`, `status`, `salescount`, `isFeatured`, `category_id`, `subcategory_id`, `childcategory_id`, `brand_id`, `section_id`, `supplier_id`, `user_id`, `created_at`, `updated_at`) VALUES
(679, 'gam miris kudu 100g 275/=', 'ගම් මිරිස් කුඩු 100g', 'gam-miris-kudu-100g-275', NULL, NULL, 'IMP-GAM-7473', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(680, 'goraka 100g 100/=', 'ගොරකා 100g', 'goraka-100g-100', NULL, NULL, 'IMP-GOR-1391', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(681, 'fresh milk kothmale 490/=', 'Fresh Milk 1L', 'fresh-milk-kothmale-490', NULL, NULL, 'IMP-FRE-4027', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(682, 'sudu biththara  (L)', 'සුදු බිත්තර (L)', 'sudu-biththara-l', NULL, NULL, 'IMP-SUD-2123', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(683, 'viskirinna 150/=', 'විස්කිරිඤ්ඤා', 'viskirinna-150', NULL, NULL, 'IMP-VIS-6539', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(684, 'moda malu', 'මොද ', 'moda-malu', NULL, NULL, 'IMP-MOD-7155', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(685, 'pepsi', 'පෙප්සි', 'pepsi', NULL, NULL, 'IMP-PEP-9231', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(686, 'miranda', 'මිරෙන්ඩා', 'miranda', NULL, NULL, 'IMP-MIR-9226', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(687, '7up', '7up', '7up', NULL, NULL, 'IMP-7UP-3208', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(688, 'mauntan dew ', 'මවුන්ටන් ඩිව්', 'mauntan-dew', NULL, NULL, 'IMP-MAU-8838', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(689, 'maliban custard 100g110/=', 'කස්ටඩ් බිස්කට් 100g', 'maliban-custard-100g110', NULL, NULL, 'IMP-MAL-3708', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(690, 'loku iti pandan', 'ලොකු ඉටිපන්දන්', 'loku-iti-pandan', NULL, NULL, 'IMP-LOK-6571', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(691, 'rata idi 250g', 'රට ඉඳි 200g', 'rata-idi-250g', NULL, NULL, 'IMP-RAT-8539', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(692, 'sudu paththara', 'සුදු පත්තර', 'sudu-paththara', NULL, NULL, 'IMP-SUD-1595', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(693, 'kadala parippu', 'කඩල පරිප්පු', 'kadala-parippu', NULL, NULL, 'IMP-KAD-4665', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(694, 'rathu kawpi', 'රතු කව්පි', 'rathu-kawpi', NULL, NULL, 'IMP-RAT-1429', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(695, 'hadunkuru 50/=', 'හදුන් කූරු', 'hadunkuru-50', NULL, NULL, 'IMP-HAD-9401', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(696, 'nikado noodles 265/=', 'නූඩ්ල්ස් 400g', 'nikado-noodles-265', NULL, NULL, 'IMP-NIK-7233', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(697, 'koththamalli ', 'කොත්තමල්ලි ', 'koththamalli', NULL, NULL, 'IMP-KOT-2507', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(698, 'spoch 80/=', 'ස්පොන්ච්', 'spoch-80', NULL, NULL, 'IMP-SPO-1362', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(699, 'lunu kudu pakat 3', 'ලුණු කුඩු පැකට් 3', 'lunu-kudu-pakat-3', NULL, NULL, 'IMP-LUN-5424', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(700, 'super glu', 'සුපර් ග්ලූ', 'super-glu', NULL, NULL, 'IMP-SUP-9799', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(701, 'nipuna keeri samba 1300/=', 'වෙනත්', 'nipuna-keeri-samba-1300', NULL, NULL, 'IMP-NIP-2442', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(702, 'milo 400g', 'milo 400g', 'milo-400g', NULL, NULL, 'IMP-MIL-6353', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(703, 'dali', 'Daily 180ml', 'dali', NULL, NULL, 'IMP-DAL-2002', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(704, 'sweet 2', 'ටොෆි 2', 'sweet-2', NULL, NULL, 'IMP-SWE-7458', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(705, 'sweet 3', 'ටොෆි 3', 'sweet-3', NULL, NULL, 'IMP-SWE-6306', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(706, 'vaslin 100', 'වෑස්ලින්', 'vaslin-100', NULL, NULL, 'IMP-VAS-5592', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(707, 'vaslin 110', 'වෑස්ලින් 110', 'vaslin-110', NULL, NULL, 'IMP-VAS-1154', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(708, 'lifeboy shampoo 130/=', 'ල්යිෆ්බෝයි 75g', 'lifeboy-shampoo-130', NULL, NULL, 'IMP-LIF-6823', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(709, 'saban lux 225/=', 'ලක්ස් සබන්', 'saban-lux-225', NULL, NULL, 'IMP-SAB-2159', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(710, 'super cream cracker 230g 300/=', 'සුපර් ක්‍රීම් ක්‍රැකර් 230g', 'super-cream-cracker-230g-300', NULL, NULL, 'IMP-SUP-1782', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(711, 'nice munchee 400g 480/=', 'නයිස් බිස්කට් 400g', 'nice-munchee-400g-480', NULL, NULL, 'IMP-NIC-4489', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(712, 'tifin 125g', 'ටිෆින් 125g', 'tifin-125g', NULL, NULL, 'IMP-TIF-6360', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(713, 'cocoa powder 50g', 'කොකෝවා පව්ඩර් 50g', 'cocoa-powder-50g', NULL, NULL, 'IMP-COC-6136', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(714, 'gelatin 30g', 'ජෙලටින් 30g', 'gelatin-30g', NULL, NULL, 'IMP-GEL-1579', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(715, 'faluda mix 100g', 'ෆලුඩා මික්ස්', 'faluda-mix-100g', NULL, NULL, 'IMP-FAL-5631', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(716, 'icing sugar 250g 170/=', 'අයිසින් සීනි 250g', 'icing-sugar-250g-170', NULL, NULL, 'IMP-ICI-2573', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(717, 'md orange ', 'MD දොඩම් යුශ', 'md-orange', NULL, NULL, 'IMP-MDO-2245', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(718, 'aba paste 170g ', 'අබ පේස්ට් 170g', 'aba-paste-170g', NULL, NULL, 'IMP-ABA-6016', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(719, 'head and sholder', 'head and shoulders shampoo', 'head-and-sholder', NULL, NULL, 'IMP-HEA-9294', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(720, 'pantene shampoo', 'Pantene shampoo', 'pantene-shampoo', NULL, NULL, 'IMP-PAN-5384', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(721, 'pantene conditioner', 'Pantene conditioner', 'pantene-conditioner', NULL, NULL, 'IMP-PAN-5625', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(722, 'blade box', 'බ්ලේඩ් ', 'blade-box', NULL, NULL, 'IMP-BLA-8437', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(723, 'pepsi 120/=', 'පෙප්සි ', 'pepsi-120', NULL, NULL, 'IMP-PEP-3472', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(724, 'pepsi 380/=', 'පෙප්සි 200ml', 'pepsi-380', NULL, NULL, 'IMP-PEP-7248', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(725, 'md mix fruit 850ml', 'MD මිශ්‍ර පලතුරු 850ml', 'md-mix-fruit-850ml', NULL, NULL, 'IMP-MDM-4213', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(726, 'diva  190/=', 'ඩීවා සබන්', 'diva-190', NULL, NULL, 'IMP-DIV-5075', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(727, 'cf dam 270/=', 'ෆෙම්ස්', 'cf-dam-270', NULL, NULL, 'IMP-CFD-1890', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(728, 'deli', 'ඩීලි', 'deli', NULL, NULL, 'IMP-DEL-6257', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(729, 'velvat 215/=', 'වෙල්වට් ', 'velvat-215', NULL, NULL, 'IMP-VEL-6088', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(730, 'lunu dehi', 'ලුණු දෙහි', 'lunu-dehi', NULL, NULL, 'IMP-LUN-3050', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(731, 'chili paste 140/=', 'චිලි පීස්ට්', 'chili-paste-140', NULL, NULL, 'IMP-CHI-8864', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(732, 'brash bathroom 380/=', 'බාත් රූම් බ්‍රෂ්', 'brash-bathroom-380', NULL, NULL, 'IMP-BRA-5191', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(733, 'brash toilat ', 'ටොයිලට් බ්‍රෂ්', 'brash-toilat', NULL, NULL, 'IMP-BRA-8806', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(734, 'pinsal kosu', 'කොසු පින්සල්', 'pinsal-kosu', NULL, NULL, 'IMP-PIN-1211', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(735, 'blade 1', 'බ්ලේඩ්', 'blade-1', NULL, NULL, 'IMP-BLA-3224', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(736, 'anlene ', 'ඇන්ලීන් 400g', 'anlene', NULL, NULL, 'IMP-ANL-9996', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(737, 'pediapro', 'ඇන්කර් පීඩියාප්‍රෝ 350g', 'pediapro', NULL, NULL, 'IMP-PED-2045', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(738, 'nestem', 'නෙස්ලේ සෙරිග්‍රෝ 250g', 'nestem', NULL, NULL, 'IMP-NES-5038', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(739, 'tinkiri', 'රසකල උකුකිරි 390', 'tinkiri', NULL, NULL, 'IMP-TIN-1626', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(740, 'detol 110ml 195/=', 'ඩෙටෝල් 110ml', 'detol-110ml-195', NULL, NULL, 'IMP-DET-1276', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(741, 'kaha kudu 25g 70/=', 'කහ කුඩු 25g', 'kaha-kudu-25g-70', NULL, NULL, 'IMP-KAH-4105', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(742, 'smak mixed fruit 1 l', 'මිශ්‍ර පලතුරු නෙක්ටා 1l', 'smak-mixed-fruit-1-l', NULL, NULL, 'IMP-SMA-5739', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(743, 'hakuru iguru', 'හකුරු', 'hakuru-iguru', NULL, NULL, 'IMP-HAK-9876', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(744, 'anchor 75g', 'ඇන්කර් 75g', 'anchor-75g', NULL, NULL, 'IMP-ANC-7509', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(745, 'kothmale kiri vanila UHT 140/=', 'කොත්මලේ කිරි වැනිලා', 'kothmale-kiri-vanila-uht-140', NULL, NULL, 'IMP-KOT-9640', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(746, 'kothmale kiri chocolate UHT 140/=', 'කොත්මලේ කිරි චොකලට්', 'kothmale-kiri-chocolate-uht-140', NULL, NULL, 'IMP-KOT-2915', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(747, 'arik kala', 'අරික් කාල', 'arik-kala', NULL, NULL, 'IMP-ARI-7220', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(748, 'zesta geen tea', 'zesta ග්‍රීන් ටී', 'zesta-geen-tea', NULL, NULL, 'IMP-ZES-8165', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:36', '2024-11-19 04:07:36'),
(749, 'pol kiri 125g', 'පොල් කිරි 125g', 'pol-kiri-125g', NULL, NULL, 'IMP-POL-1865', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(750, 'maliban custard 200g', 'කස්ටඩ් බිස්කට් 200g', 'maliban-custard-200g', NULL, NULL, 'IMP-MAL-7766', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(751, 'maliban vepas lemon 90g', 'ලෙමන් වේෆස් 90g', 'maliban-vepas-lemon-90g', NULL, NULL, 'IMP-MAL-4603', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(752, 'samagi idi appa piti 290/=', 'සමගි සුදු  ඉදිආප්ප පිටි ', 'samagi-idi-appa-piti-290', NULL, NULL, 'IMP-SAM-3193', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(753, 'hadun kuru amritha 100/=', 'හදුන් කූරු', 'hadun-kuru-amritha-100', NULL, NULL, 'IMP-HAD-3088', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(754, 'saban kohoba herbel 160/=', 'කොහොඹ Herbal', 'saban-kohoba-herbel-160', NULL, NULL, 'IMP-SAB-8890', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(755, 'sweet 35', 'චොකලට්', 'sweet-35', NULL, NULL, 'IMP-SWE-7884', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(756, 'maamaite 100g', 'මාමයිට් 100g', 'maamaite-100g', NULL, NULL, 'IMP-MAA-5863', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(757, 'maamaite 50g', 'මාමයිට් 50g', 'maamaite-50g', NULL, NULL, 'IMP-MAA-3209', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(758, 'diva powder 700g 285/=', 'diva powder 700g', 'diva-powder-700g-285', NULL, NULL, 'IMP-DIV-8664', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(759, 'kunisso 50g 120/=', 'කූනිස්සන් 50g', 'kunisso-50g-120', NULL, NULL, 'IMP-KUN-6035', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(760, 'pawder baby cheramy 330/=', 'Cheramy  (පව්ඩර්)', 'pawder-baby-cheramy-330', NULL, NULL, 'IMP-PAW-4844', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(761, 'sweet 25', 'චොකලට්', 'sweet-25', NULL, NULL, 'IMP-SWE-1100', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(762, 'graip  water', 'ග්‍රයිප් වෝටර්', 'graip-water', NULL, NULL, 'IMP-GRA-6012', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(763, 'baby sherami family pac 790/=', 'බේබි ශෙරමි සබන් Family pack', 'baby-sherami-family-pac-790', NULL, NULL, 'IMP-BAB-4309', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(764, 'pampas 36 pack XL', 'ශෙරමි ඩයපර් XL ( 36pack)', 'pampas-36-pack-xl', NULL, NULL, 'IMP-PAM-1544', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(765, 'vim pawder', 'vim පවුඩර් 650g', 'vim-pawder', NULL, NULL, 'IMP-VIM-2647', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(766, 'deodrante', 'Rexona ඩියෝඩ්‍රන්ට් 25ml', 'deodrante', NULL, NULL, 'IMP-DEO-3825', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(767, 'narayanaya thel', 'නාරායනය තෙල්', 'narayanaya-thel', NULL, NULL, 'IMP-NAR-8115', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(768, 'sarwavishadi thel', 'සර්වවිශාදී තෙල්', 'sarwavishadi-thel', NULL, NULL, 'IMP-SAR-3711', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(769, 'mee pani siddalepa', 'මී පැණි', 'mee-pani-siddalepa', NULL, NULL, 'IMP-MEE-1507', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(770, 'imorre choco', 'Imorre Choco', 'imorre-choco', NULL, NULL, 'IMP-IMO-6536', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(771, 'real bran cracker 210g', 'Real Bran Cracker 210g', 'real-bran-cracker-210g', NULL, NULL, 'IMP-REA-6370', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(772, 'spicy craker 85g', 'Spicy Cracker 85g', 'spicy-craker-85g', NULL, NULL, 'IMP-SPI-6945', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(773, 'dai Amins 250/=', 'ඩයි Amins', 'dai-amins-250', NULL, NULL, 'IMP-DAI-7979', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(774, 'dai shampoo 25ml 180/=', 'ඩයි ෂම්පූ 25ml', 'dai-shampoo-25ml-180', NULL, NULL, 'IMP-DAI-8535', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(775, 'dai godrej expert 3g 100/=', 'ඩයි ගොඩ්රිජ් එක්ස්පර්ට් 3g', 'dai-godrej-expert-3g-100', NULL, NULL, 'IMP-DAI-3258', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(776, 'pensil 40/=', 'පැන්සල', 'pensil-40', NULL, NULL, 'IMP-PEN-9380', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(777, 'vatavala green tea', 'වටවල ග්‍රීන් ටී 15g', 'vatavala-green-tea', NULL, NULL, 'IMP-VAT-5017', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(778, 'vatavala green tea 30g', 'වටවල ග්‍රීන් ටී 30g', 'vatavala-green-tea-30g', NULL, NULL, 'IMP-VAT-3810', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(779, 'lanka samba loos 235/=', 'වෙනත්', 'lanka-samba-loos-235', NULL, NULL, 'IMP-LAN-2939', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(780, '249', '249', '249', NULL, NULL, 'IMP-249-8492', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(781, 'batta vala', 'බට්ටා වැල', 'batta-vala', NULL, NULL, 'IMP-BAT-4125', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(782, 'nila', 'නිලා', 'nila', NULL, NULL, 'IMP-NIL-8476', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(783, 'babara chakra', 'බඹර චක්‍ර', 'babara-chakra', NULL, NULL, 'IMP-BAB-8566', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(784, 'ahas kuru', 'අහස් කූරු', 'ahas-kuru', NULL, NULL, 'IMP-AHA-7708', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(785, 'rathinna packet', 'රතිඤ්ඤා වැල් පැකට්', 'rathinna-packet', NULL, NULL, 'IMP-RAT-1410', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(786, 'sweet 180', 'චොකලට්', 'sweet-180', NULL, NULL, 'IMP-SWE-9069', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(787, 'enasal  100/=', 'එනසාල්', 'enasal-100', NULL, NULL, 'IMP-ENA-5666', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(788, 'astra 18g 40/=', 'ඇස්ට්‍රා මාගරින් 18g', 'astra-18g-40', NULL, NULL, 'IMP-AST-4657', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(789, 'kapuru pethi 1', 'කපුරු පෙති', 'kapuru-pethi-1', NULL, NULL, 'IMP-KAP-8974', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(790, 'kapuru bola packet', 'කපුරු බෝල', 'kapuru-bola-packet', NULL, NULL, 'IMP-KAP-4435', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(791, 'swiss roll vanilla  200g', 'ස්විස් රෝල් 200g', 'swiss-roll-vanilla-200g', NULL, NULL, 'IMP-SWI-4249', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(792, 'kopi maliban 50g', 'Maliban කෝපි 50g', 'kopi-maliban-50g', NULL, NULL, 'IMP-KOP-6118', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(793, 'aththora', 'Aththora', 'aththora', NULL, NULL, 'IMP-ATH-8857', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(794, 'egb aliya 1.5l', 'EGB 1.5L', 'egb-aliya-15l', NULL, NULL, 'IMP-EGB-9416', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(795, 'rathu biththara M', 'රතු බිත්තර ( M )', 'rathu-biththara-m', NULL, NULL, 'IMP-RAT-7713', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(796, 'podi iti pandam', 'පොඩි ඉටිපන්දන්', 'podi-iti-pandam', NULL, NULL, 'IMP-POD-6384', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(797, 'rani saban 160/=', 'රානී සබන් ', 'rani-saban-160', NULL, NULL, 'IMP-RAN-4067', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(798, 'kohoba 5 in 1', 'කොහොඹ Herbal 5 in 1', 'kohoba-5-in-1', NULL, NULL, 'IMP-KOH-8276', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(799, 'fresh milk  eliphant house', 'Fresh Milk 1L', 'fresh-milk-eliphant-house', NULL, NULL, 'IMP-FRE-1612', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(800, 'ala pethi 100g', 'මිස්ටර් පොටේටෝ ක්‍රිස්ප්ස් 100g', 'ala-pethi-100g', NULL, NULL, 'IMP-ALA-2967', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(801, 'tipitip 100/=', 'ටිපිටිප් 50g', 'tipitip-100', NULL, NULL, 'IMP-TIP-3398', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(802, 'batter carol little lion 360g', 'බට කැරොල් 360g', 'batter-carol-little-lion-360g', NULL, NULL, 'IMP-BAT-7693', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(803, 'gini petti 240/= bandal ', 'ගිනි පෙට්ටි', 'gini-petti-240-bandal', NULL, NULL, 'IMP-GIN-7359', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(804, 'nila loku', 'ලොකු නිලා', 'nila-loku', NULL, NULL, 'IMP-NIL-7215', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(805, 'visil ahas kuru', 'විසිල් අහස් කූරු', 'visil-ahas-kuru', NULL, NULL, 'IMP-VIS-5588', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(806, 'viks 5ml', 'වික්ස් 5ml', 'viks-5ml', NULL, NULL, 'IMP-VIK-6828', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(807, 'viks 10ml', 'වික්ස් 10ml', 'viks-10ml', NULL, NULL, 'IMP-VIK-4729', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(808, 'fito orange/mix fruit ', 'Fito ', 'fito-orangemix-fruit', NULL, NULL, 'IMP-FIT-4751', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(809, 'fito mango 60/=', ' Fito ', 'fito-mango-60', NULL, NULL, 'IMP-FIT-9953', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(810, 'apple eliphant house', 'twistee apple', 'apple-eliphant-house', NULL, NULL, 'IMP-APP-2898', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(811, 'Uht eliphant house', 'Eliphant house කිරි පානය', 'uht-eliphant-house', NULL, NULL, 'IMP-UHT-8009', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(812, 'badapu thuna paha kudu', 'බැදපු තුන පහ', 'badapu-thuna-paha-kudu', NULL, NULL, 'IMP-BAD-4724', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(813, 'lysol 500ml 260/=', 'lysol  500ml', 'lysol-500ml-260', NULL, NULL, 'IMP-LYS-3965', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(814, 'mister potato ', 'මිස්ටර් පොටැටෝ', 'mister-potato', NULL, NULL, 'IMP-MIS-7616', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(815, 'baby rusks', 'බේබි රස්ක් 110g', 'baby-rusks', NULL, NULL, 'IMP-BAB-3977', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(816, 'batter carol little lion 270g', 'බට කැරොල් 270g', 'batter-carol-little-lion-270g', NULL, NULL, 'IMP-BAT-7995', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(817, 'batter carol little lion 110g', 'බට කැරොල් 110g', 'batter-carol-little-lion-110g', NULL, NULL, 'IMP-BAT-1038', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(818, 'Baby Cheramy odi colon 360/=', 'Baby Cheramy කොලොන්', 'baby-cheramy-odi-colon-360', NULL, NULL, 'IMP-BAB-4327', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(819, 'kalen saban', 'කැලීන් සබන්', 'kalen-saban', NULL, NULL, 'IMP-KAL-8933', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(820, 'bubbles chocolate 90g', 'bubbles chocolate 90g', 'bubbles-chocolate-90g', NULL, NULL, 'IMP-BUB-1621', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(821, 'cup cake', 'කප් කේක්', 'cup-cake', NULL, NULL, 'IMP-CUP-7143', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(822, 'thunapaha 90/=', 'තුන පහ 50g', 'thunapaha-90', NULL, NULL, 'IMP-THU-7686', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(823, 'umbalakada bothalaya 100g', 'උම්බලකඩ බෝතලය 100g', 'umbalakada-bothalaya-100g', NULL, NULL, 'IMP-UMB-7917', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(824, 'elephant house 250/=', 'අලියා බීම ', 'elephant-house-250', NULL, NULL, 'IMP-ELE-5383', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(825, 'elephant house 270/=', 'අලියා බීම 1.5L', 'elephant-house-270', NULL, NULL, 'IMP-ELE-8507', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(826, 'elephant house 250/=', 'අලියා බීම 1L', 'elephant-house-250-1', NULL, NULL, 'IMP-ELE-1568', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(827, 'elephant house 350/=', 'අලියා බීම 500ml', 'elephant-house-350', NULL, NULL, 'IMP-ELE-2920', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(828, 'elephant house 100/=', 'අලියා බීම 500ml', 'elephant-house-100', NULL, NULL, 'IMP-ELE-5202', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(829, 'elephant house 150/=', 'අලියා බීම 500ml', 'elephant-house-150', NULL, NULL, 'IMP-ELE-5287', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(830, 'diva 1k 380/=', 'ඩීවා 1k', 'diva-1k-380', NULL, NULL, 'IMP-DIV-1861', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(831, 'rampe', 'රම්පේ', 'rampe', NULL, NULL, 'IMP-RAM-7236', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(832, 'tiyara vanila cake 310g', 'tiara වැනිලා ලේයර් කේක් 310g', 'tiyara-vanila-cake-310g', NULL, NULL, 'IMP-TIY-7566', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(833, 'tiyara chocolate cake 480g ', 'Tiara චොකලට් ලේයර් කේක් 480g', 'tiyara-chocolate-cake-480g', NULL, NULL, 'IMP-TIY-1089', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(834, 'Eliphant soda 160/= 1.5L', 'සෝඩා 1.5L', 'eliphant-soda-160-15l', NULL, NULL, 'IMP-ELI-4691', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(835, 'calin 150/=', 'CALIN ', 'calin-150', NULL, NULL, 'IMP-CAL-1295', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(836, 'orange biscuit  maliban 100g130/=', 'ඔරේන්ජ් බිස්කට් 100g', 'orange-biscuit-maliban-100g130', NULL, NULL, 'IMP-ORA-7837', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(837, 'astra 500g', 'ඇස්ට්‍රා මාගරින් 500g', 'astra-500g', NULL, NULL, 'IMP-AST-3703', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(838, 'rata idi loos', 'රට ඉඳි ', 'rata-idi-loos', NULL, NULL, 'IMP-RAT-2233', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(839, 'viyali midi 100g 250/=', 'වියලි මිදි 100g', 'viyali-midi-100g-250', NULL, NULL, 'IMP-VIY-3223', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(840, 'kist soos 400g', 'KIST සෝස් 400g', 'kist-soos-400g', NULL, NULL, 'IMP-KIS-6896', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(841, 'cornflour 100g 100/=', 'කෝන්ෆ්ලවර් 100g', 'cornflour-100g-100', NULL, NULL, 'IMP-COR-1082', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(842, 'rathna gam', 'ගම්', 'rathna-gam', NULL, NULL, 'IMP-RAT-4192', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(843, 'lama panadol', 'ළමා පැනඩෝල්', 'lama-panadol', NULL, NULL, 'IMP-LAM-4679', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(844, 'harpic 200g 265/=', 'HARPIC 200g', 'harpic-200g-265', NULL, NULL, 'IMP-HAR-3545', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(845, 'aba ata 100g', 'අබ ඇට 100g', 'aba-ata-100g', NULL, NULL, 'IMP-ABA-4836', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(846, 'sudu kawpi', 'සුදු කව්පි', 'sudu-kawpi', NULL, NULL, 'IMP-SUD-8122', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(847, 'jam  MD 300g 250/=', 'ජෑම් 300g', 'jam-md-300g-250', NULL, NULL, 'IMP-JAM-6567', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(848, 'jam  MD 500g 320/=', 'ජෑම් 500g', 'jam-md-500g-320', NULL, NULL, 'IMP-JAM-3749', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(849, 'katu', 'කටු', 'katu', NULL, NULL, 'IMP-KAT-3619', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(850, 'pears cream 100ml 300/=', 'pears cream 100ml', 'pears-cream-100ml-300', NULL, NULL, 'IMP-PEA-8271', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(851, 'tiara cake 200g', 'tiara cake 200g', 'tiara-cake-200g', NULL, NULL, 'IMP-TIA-1146', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(852, 'umbalakada 25/=', 'උම්බලකඩ', 'umbalakada-25', NULL, NULL, 'IMP-UMB-2242', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(853, 'sunsilk shampo 80ml 385/=', 'sunsilk shampo 80ml', 'sunsilk-shampo-80ml-385', NULL, NULL, 'IMP-SUN-5120', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(854, 'youget highland', 'Highland Youget', 'youget-highland', NULL, NULL, 'IMP-YOU-8571', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(855, 'kukul mas', 'Maxies කුකුල් මස්', 'kukul-mas', NULL, NULL, 'IMP-KUK-8872', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(856, 'nai miris ', 'නයි මිරිස්', 'nai-miris', NULL, NULL, 'IMP-NAI-2680', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(857, 'sweet 60', 'sweet ', 'sweet-60', NULL, NULL, 'IMP-SWE-1790', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(858, 'nipuna nadu 5k', 'වෙනත්', 'nipuna-nadu-5k', NULL, NULL, 'IMP-NIP-6745', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(859, 'neeroga', 'නීරෝගා', 'neeroga', NULL, NULL, 'IMP-NEE-3310', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(860, 'itipandam 20/=', 'ඉටිපන්දම්', 'itipandam-20', NULL, NULL, 'IMP-ITI-2624', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(861, 'itipandam 100/=', 'ඉටිපන්දම්', 'itipandam-100', NULL, NULL, 'IMP-ITI-7604', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(862, 'sunlight powder 20/=', 'සන්ලයිට්  පව්ඩර් ', 'sunlight-powder-20', NULL, NULL, 'IMP-SUN-1872', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(863, 'kopi raigam 20g 105/=', 'Raigam කෝපි', 'kopi-raigam-20g-105', NULL, NULL, 'IMP-KOP-1338', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(864, 'pasta 400g', 'පාස්තා 400g', 'pasta-400g', NULL, NULL, 'IMP-PAS-6500', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(865, 'clorex ', 'ක්ලෝරෙක්ස් 250ml', 'clorex', NULL, NULL, 'IMP-CLO-7510', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(866, 'niroga', 'niroga', 'niroga', NULL, NULL, 'IMP-NIR-7498', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(867, 'kothmale kiri uht 60/=', 'කොත්මලේ කිරි ', 'kothmale-kiri-uht-60', NULL, NULL, 'IMP-KOT-5824', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(868, 'sweet 100', 'චොකලට්', 'sweet-100', NULL, NULL, 'IMP-SWE-7615', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(869, 'sweet 70=', 'චොකලට්', 'sweet-70', NULL, NULL, 'IMP-SWE-1097', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(870, 'sweet 80/=', 'චොකලට්', 'sweet-80', NULL, NULL, 'IMP-SWE-3938', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(871, 'sweet 50/=', 'චොකලට්', 'sweet-50', NULL, NULL, 'IMP-SWE-3529', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(872, 'sweet 130/=', 'චොකලට්', 'sweet-130', NULL, NULL, 'IMP-SWE-9160', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(873, 'sweet 120/=', 'චොකලට්', 'sweet-120', NULL, NULL, 'IMP-SWE-1824', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(874, 'sweet 180/=', 'චොකලට්', 'sweet-180-1', NULL, NULL, 'IMP-SWE-2826', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(875, 'nestomalt 300g', 'නෙස්ටමෝල්ට් 300g', 'nestomalt-300g', NULL, NULL, 'IMP-NES-6772', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(876, 'tulip', 'ටියුලිප් බෑග්', 'tulip', NULL, NULL, 'IMP-TUL-9388', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(877, 'peyawa', 'පේයාව', 'peyawa', NULL, NULL, 'IMP-PEY-3695', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(878, '1 pampas  S/M', ' ඩයපර් S/M', '1-pampas-sm', NULL, NULL, 'IMP-1PA-1362', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(879, '2 pampas L 275/=', 'ඩයපර් L', '2-pampas-l-275', NULL, NULL, 'IMP-2PA-9266', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(880, '1 pampas cutee 140/=', 'ඩයපර් ', '1-pampas-cutee-140', NULL, NULL, 'IMP-1PA-1729', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(881, 'fresh milk anchor ', 'Fresh Milk 1L', 'fresh-milk-anchor', NULL, NULL, 'IMP-FRE-8469', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(882, 'batter ', 'ඇන්කර් බටර් ', 'batter', NULL, NULL, 'IMP-BAT-3294', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(883, '577-593', '595', '577-593', NULL, NULL, 'IMP-577-5468', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(884, 'kiri ala', 'කිරි අල', 'kiri-ala', NULL, NULL, 'IMP-KIR-6638', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(885, 'lysol 200ml  250/=', 'lysol 200ml', 'lysol-200ml-250', NULL, NULL, 'IMP-LYS-8449', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(886, 'kukul mas famli pack', 'කුකුල් මස් Family pack', 'kukul-mas-famli-pack', NULL, NULL, 'IMP-KUK-5045', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(887, 'kohoba බේබි 70g 140/=', 'කොහොඹ  බේබි 70g', 'kohoba-70g-140', NULL, NULL, 'IMP-KOH-4041', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(888, 'fresh milk podi kothmale', 'Fresh Milk 180ml', 'fresh-milk-podi-kothmale', NULL, NULL, 'IMP-FRE-9486', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(889, 'coca cola 2L', 'කොකා කෝලා 2L', 'coca-cola-2l', NULL, NULL, 'IMP-COC-6783', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(890, 'vathura 1.5 ml 130/=', 'වතුර  1.5ml', 'vathura-15-ml-130', NULL, NULL, 'IMP-VAT-4363', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(891, 'raththi the musuwa 400g', 'රත්ති තේ මුසුව 400g', 'raththi-the-musuwa-400g', NULL, NULL, 'IMP-RAT-1270', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(892, 'little lion cake ', 'little lion චොකලට්කේක්', 'little-lion-cake', NULL, NULL, 'IMP-LIT-8844', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(893, 'Diva comfort 35ml', 'කොම්ෆර්ට් 35ml', 'diva-comfort-35ml', NULL, NULL, 'IMP-DIV-4035', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(894, 'clear shampoo', 'clear shampoo', 'clear-shampoo', NULL, NULL, 'IMP-CLE-9621', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(895, 'sunsilk shampo 145/=', 'sunsilk shampo ', 'sunsilk-shampo-145', NULL, NULL, 'IMP-SUN-6806', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(896, 'kukul mas tops', 'කුකුල් මස්', 'kukul-mas-tops', NULL, NULL, 'IMP-KUK-9312', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(897, 'fresh milk highland', 'fresh milk 450ml', 'fresh-milk-highland', NULL, NULL, 'IMP-FRE-9702', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(898, 'dandex shampoo 150/=', 'Dandex ෂම්පූ 40ml', 'dandex-shampoo-150', NULL, NULL, 'IMP-DAN-3637', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(899, 'highland 100/=', 'highland 45ml', 'highland-100', NULL, NULL, 'IMP-HIG-9654', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(900, 'yahaposha 500g', 'යහපෝෂ 500g', 'yahaposha-500g', NULL, NULL, 'IMP-YAH-2879', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(901, 'denta brash 125/=', 'ඩෙන්ටා බ්‍රශ් ', 'denta-brash-125', NULL, NULL, 'IMP-DEN-5068', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(902, 'noodles alli 500g', 'නූඩ්ල්ස් 500g ', 'noodles-alli-500g', NULL, NULL, 'IMP-NOO-1380', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(903, 'bic reser thala 2', 'බික් රේසර්', 'bic-reser-thala-2', NULL, NULL, 'IMP-BIC-5654', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(904, ' beema kudu 35/=', 'බීම කුඩු 20g', 'beema-kudu-35', NULL, NULL, 'IMP-BEE-9176', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(905, 'elavalu thel 500ml 650/=', 'fortune  oil 500ml', 'elavalu-thel-500ml-650', NULL, NULL, 'IMP-ELA-4968', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37');
INSERT INTO `products` (`id`, `name`, `name_si`, `slug`, `description`, `barcode`, `sku`, `expiredate`, `image`, `alertlimit`, `youtubelink`, `tags`, `sellingtype`, `status`, `salescount`, `isFeatured`, `category_id`, `subcategory_id`, `childcategory_id`, `brand_id`, `section_id`, `supplier_id`, `user_id`, `created_at`, `updated_at`) VALUES
(906, 'elavalu thel 1L', 'fortune oil 1L', 'elavalu-thel-1l', NULL, NULL, 'IMP-ELA-3864', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(907, 'pawder kohoba 300/=', 'කොහොඹ බේබි  (පව්ඩර්)', 'pawder-kohoba-300', NULL, NULL, 'IMP-PAW-7928', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(908, 'odi colon kohoba', 'කොහොඹ බේබි කොලොන්', 'odi-colon-kohoba', NULL, NULL, 'IMP-ODI-2515', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(909, 'little lion cake 380/=', 'little lion කේක්', 'little-lion-cake-380', NULL, NULL, 'IMP-LIT-2841', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(910, 'rose sunlight powder 400g 220/=', 'ROSE සන්ලයිට් පව්ඩර් 400g', 'rose-sunlight-powder-400g-220', NULL, NULL, 'IMP-ROS-8527', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(911, 'saban lifebuoy kaha 185/=', 'ල්යිෆ්බෝයි turmeric 100g', 'saban-lifebuoy-kaha-185', NULL, NULL, 'IMP-SAB-8170', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(912, 'shopping 4/=', 'shopping', 'shopping-4', NULL, NULL, 'IMP-SHO-1586', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(913, 'mayonis', 'mayonis 170g', 'mayonis', NULL, NULL, 'IMP-MAY-6398', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(914, 'soos MD 100G 190/=', 'සෝස් 100G', 'soos-md-100g-190', NULL, NULL, 'IMP-SOO-5337', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(915, 'gammiris  ata  loose', 'ගම්මිරිස් ඇට', 'gammiris-ata-loose', NULL, NULL, 'IMP-GAM-2486', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(916, 'lunu dehi 10/=', 'ලුණු දෙහි', 'lunu-dehi-10', NULL, NULL, 'IMP-LUN-3556', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(917, 'sweet 140/=', 'චොකලට්', 'sweet-140', NULL, NULL, 'IMP-SWE-3051', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(918, 'sweet 40/=', 'චොකලට්', 'sweet-40', NULL, NULL, 'IMP-SWE-4381', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(919, 'choco chips 30/=', 'choco chips', 'choco-chips-30', NULL, NULL, 'IMP-CHO-3836', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(920, 'choco chips 35/=', 'choco chips', 'choco-chips-35', NULL, NULL, 'IMP-CHO-3053', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(921, 'big laitar', 'BIG ලයිටර්', 'big-laitar', NULL, NULL, 'IMP-BIG-7169', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(922, 'md beema kudu 150g', 'MD දොඩම් 150g', 'md-beema-kudu-150g', NULL, NULL, 'IMP-MDB-6638', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(923, 'lifebuoy Shampoo 160', 'lifebuoy Shampoo 80ml', 'lifebuoy-shampoo-160', NULL, NULL, 'IMP-LIF-7338', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(924, 'itipandam 125/=', 'ඉටිපන්දම්', 'itipandam-125', NULL, NULL, 'IMP-ITI-3675', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(925, 'Baby Cheramy cream 185/=', ' Baby Cheramy', 'baby-cheramy-cream-185', NULL, NULL, 'IMP-BAB-5600', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(926, 'maggi noodls 130/=', 'මැගී චිකන් නූඩ්ල්ස් 73g', 'maggi-noodls-130', NULL, NULL, 'IMP-MAG-3496', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(927, 'pani bage 370/=', 'පැනි බාගය', 'pani-bage-370', NULL, NULL, 'IMP-PAN-6480', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(928, 'thunapaha 50g 85/=', 'තුන පහ 50g', 'thunapaha-50g-85', NULL, NULL, 'IMP-THU-6159', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(929, 'iguru maliban biscut 370g 460/=', 'මැලිබන් ඉඟුරු බිස්කට් 370g', 'iguru-maliban-biscut-370g-460', NULL, NULL, 'IMP-IGU-7569', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(930, 'batter carol little lion 95g 130/=', 'බට කැරොල්  95g', 'batter-carol-little-lion-95g-130', NULL, NULL, 'IMP-BAT-9481', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(931, 'shoping 2/=', 'shoping ', 'shoping-2', NULL, NULL, 'IMP-SHO-9529', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(932, 'shoping 5/=', 'shoping', 'shoping-5', NULL, NULL, 'IMP-SHO-1258', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(933, 'shoping 8/=', 'shoping', 'shoping-8', NULL, NULL, 'IMP-SHO-5660', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(934, 'shoping 15/=', 'shoping', 'shoping-15', NULL, NULL, 'IMP-SHO-5587', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(935, 'anchor 250g	', 'රත්ති 250g', 'anchor-250g', NULL, NULL, 'IMP-ANC-9441', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(936, 'anchor 125g 395/=', 'ඇන්කර් 125g', 'anchor-125g-395', NULL, NULL, 'IMP-ANC-9529', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(937, 'maduru dagara  paya12 ', ' මදුරු දඟර 12', 'maduru-dagara-paya12', NULL, NULL, 'IMP-MAD-7239', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(938, 'marudu dagara yuvala', 'මදුරු දඟර යුගල', 'marudu-dagara-yuvala', NULL, NULL, 'IMP-MAR-8444', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(939, 'pani kala 210/=', 'පැනි කාල', 'pani-kala-210', NULL, NULL, 'IMP-PAN-6629', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(940, 'chik bits 50/=', 'චික් බිට්ස් 30g', 'chik-bits-50', NULL, NULL, 'IMP-CHI-3322', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(941, 'sudantha 120g', 'සුදන්ත 120g', 'sudantha-120g', NULL, NULL, 'IMP-SUD-7652', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(942, 'orange biscuit maliban 200g', 'ඔරේන්ජ් බිස්කට් 200g', 'orange-biscuit-maliban-200g', NULL, NULL, 'IMP-ORA-1686', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(943, 'Iodex 18g', 'Iodex 18g', 'iodex-18g', NULL, NULL, 'IMP-IOD-8902', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(944, 'harpic 500g', 'harpic 500g', 'harpic-500g', NULL, NULL, 'IMP-HAR-7699', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(945, 'loos noodls', 'නූඩ්ල්ස්  ලූස්', 'loos-noodls', NULL, NULL, 'IMP-LOO-5794', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(946, 'ambewela UHT', 'ambewela UHT', 'ambewela-uht', NULL, NULL, 'IMP-AMB-4649', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(947, 'choco chips 50/=', 'choco chips', 'choco-chips-50', NULL, NULL, 'IMP-CHO-4602', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(948, 'kesha oil 100ml', 'kesha oil 100ml', 'kesha-oil-100ml', NULL, NULL, 'IMP-KES-9717', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(949, 'signal brash', 'signal  බ්‍රශ්', 'signal-brash', NULL, NULL, 'IMP-SIG-1085', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(950, 'Eraser', 'Eraser', 'eraser', NULL, NULL, 'IMP-ERA-8735', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(951, 'sweet 65/=', 'චොකලට් 65/=', 'sweet-65', NULL, NULL, 'IMP-SWE-3014', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(952, 'piyamassa', 'piyamassa', 'piyamassa', NULL, NULL, 'IMP-PIY-7132', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(953, 'sweet 85/=', 'චොකලට් 85/=', 'sweet-85', NULL, NULL, 'IMP-SWE-2629', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(954, 'ravan dai 260/=', 'ravan', 'ravan-dai-260', NULL, NULL, 'IMP-RAV-3563', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(955, 'maliban kiri 18g 60/=', 'මැලිබන් කිරි  18g', 'maliban-kiri-18g-60', NULL, NULL, 'IMP-MAL-8559', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(956, 'maliban kiri 60g', 'මැලිබන් කිරි 60g', 'maliban-kiri-60g', NULL, NULL, 'IMP-MAL-1137', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(957, 'maliban kiri 150g', 'මැලිබන් කිරි  150g', 'maliban-kiri-150g', NULL, NULL, 'IMP-MAL-5637', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(958, 'dai godrej  200/=', 'ඩයි ගොඩ්රිජ් එක්ස්පර්ට්', 'dai-godrej-200', NULL, NULL, 'IMP-DAI-9952', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(959, 'soos edimbaro 405g', 'සෝස් 405g', 'soos-edimbaro-405g', NULL, NULL, 'IMP-SOO-6787', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(960, 'maggi sup cup', 'maggi sup cup', 'maggi-sup-cup', NULL, NULL, 'IMP-MAG-9473', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(961, 'sweet 625', 'චොකලට් ', 'sweet-625', NULL, NULL, 'IMP-SWE-7235', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(962, 'sweet 500', 'චොකලට්', 'sweet-500', NULL, NULL, 'IMP-SWE-7741', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(963, 'kenda 150/=', 'කෙන්දා 100g', 'kenda-150', NULL, NULL, 'IMP-KEN-6110', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(964, 'dai aba 230/=', 'Abha', 'dai-aba-230', NULL, NULL, 'IMP-DAI-9018', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(965, 'dai black hena 150/=', 'Black hena', 'dai-black-hena-150', NULL, NULL, 'IMP-DAI-7645', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(966, 'sweet 4', 'sweet ', 'sweet-4', NULL, NULL, 'IMP-SWE-4386', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(967, 'kaba pota 5 saththu', 'පොට 5 කඹ', 'kaba-pota-5-saththu', NULL, NULL, 'IMP-KAB-1242', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(968, 'Richlife UHT', 'Richlife UHT', 'richlife-uht', NULL, NULL, 'IMP-RIC-8947', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(969, 'iodex 2.5g', 'iodex 2.5g', 'iodex-25g', NULL, NULL, 'IMP-IOD-7821', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(970, 'MD beema 45/=', 'MD බීම', 'md-beema-45', NULL, NULL, 'IMP-MDB-9033', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(971, 'saban pears 145/=', 'පෙයාස් සබන්', 'saban-pears-145', NULL, NULL, 'IMP-SAB-1455', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(972, 'goraka loos', 'ගොරකා', 'goraka-loos', NULL, NULL, 'IMP-GOR-8990', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(973, 'thalawa kele kahata', 'thalawa kelle kahata', 'thalawa-kele-kahata', NULL, NULL, 'IMP-THA-1190', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(974, 'bic reser thala 2 lady', '(Lady) බික් රේසර්', 'bic-reser-thala-2-lady', NULL, NULL, 'IMP-BIC-4060', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(975, '136', '136', '136', NULL, NULL, 'IMP-136-1231', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(976, 'gam miris kudu 100/= 20g', 'ගම් මිරිස් කුඩු ', 'gam-miris-kudu-100-20g', NULL, NULL, 'IMP-GAM-3380', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(977, 'koththu me nai miris 130/=', 'කොත්තු මී', 'koththu-me-nai-miris-130', NULL, NULL, 'IMP-KOT-7556', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(978, 'prima stella 100/=', 'ප්‍රීමා stella නූඩ්ල්ස්', 'prima-stella-100', NULL, NULL, 'IMP-PRI-9840', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(979, 'rata ala 2', 'රට අල ', 'rata-ala-2', NULL, NULL, 'IMP-RAT-9310', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(980, ' pol kiri  colo 90/=', ' පොල් කිරි ', 'pol-kiri-colo-90', NULL, NULL, 'IMP-POL-7368', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(981, 'lanka soy mutton 90g 115/=', 'සෝයා මීට් 90g', 'lanka-soy-mutton-90g-115', NULL, NULL, 'IMP-LAN-9296', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(982, 'biriyani powder', 'MAS biriyani powder ', 'biriyani-powder', NULL, NULL, 'IMP-BIR-5878', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(983, 'sambrani sapumal 100/=', 'Sapumal සාම්බ්‍රානි', 'sambrani-sapumal-100', NULL, NULL, 'IMP-SAM-4631', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(984, 'pahan thira sudu 20/=', 'පහන් තිර', 'pahan-thira-sudu-20', NULL, NULL, 'IMP-PAH-6074', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(985, 'umbalakada 60/=', 'උම්බලකඩ', 'umbalakada-60', NULL, NULL, 'IMP-UMB-3860', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(986, 'kali miris loos', 'කෑලි මිරිස් ලූස්', 'kali-miris-loos', NULL, NULL, 'IMP-KAL-9702', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(987, 'bothalaya pol thel 2', 'පොල් තෙල් බෝතලය', 'bothalaya-pol-thel-2', NULL, NULL, 'IMP-BOT-7494', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(988, 'ce1 rosa 270/=', 'ඊවා රෝස', 'ce1-rosa-270', NULL, NULL, 'IMP-CE1-5197', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(989, 'rebecaalee', 'Rebecaa Lee බේබි සබන්', 'rebecaalee', NULL, NULL, 'IMP-REB-9211', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(990, 'nivaran', 'Nivaran 90', 'nivaran', NULL, NULL, 'IMP-NIV-2785', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(991, 'soos 15g 13/=', 'සෝස් 15g', 'soos-15g-13', NULL, NULL, 'IMP-SOO-7719', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(992, 'miris kudu loos', 'මිරිස් කුඩු ලූස්', 'miris-kudu-loos', NULL, NULL, 'IMP-MIR-6438', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(993, 'lanka soy devel 170/=', 'සෝයා ඩෙවල් චිකන් 90g', 'lanka-soy-devel-170', NULL, NULL, 'IMP-LAN-2837', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(994, 'kassa paniya 350/=', 'Suvaosu කැස්ස පැනිය', 'kassa-paniya-350', NULL, NULL, 'IMP-KAS-3707', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(995, 'valmee syrap 350/=', 'වැල්මී සිරප් 350/=', 'valmee-syrap-350', NULL, NULL, 'IMP-VAL-5589', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(996, 'dragon fruits', 'dragon fruits', 'dragon-fruits', NULL, NULL, 'IMP-DRA-4329', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(997, 'veralu', 'Veralu', 'veralu', NULL, NULL, 'IMP-VER-5154', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(998, 'thunapaha loos', 'තුන පහ ලූස්', 'thunapaha-loos', NULL, NULL, 'IMP-THU-5122', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(999, 'munchee chocolate pufff 150g 220/=', 'චොකලට් පෆ් 150g', 'munchee-chocolate-pufff-150g-220', NULL, NULL, 'IMP-MUN-8319', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1000, 'sunquick 330ml 600/=', 'sunquick 330ml', 'sunquick-330ml-600', NULL, NULL, 'IMP-SUN-4856', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1001, 'sosej 70g 140/=', 'සොසේජ් 70g', 'sosej-70g-140', NULL, NULL, 'IMP-SOS-3662', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1002, 'sosej keels  180/=', 'සොසේජ් 100g', 'sosej-keels-180', NULL, NULL, 'IMP-SOS-2394', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1003, 'meet balls 100g 200/=', 'Meat balls 100g', 'meet-balls-100g-200', NULL, NULL, 'IMP-MEE-1935', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1004, 'sosej 190/=', 'සොසේජ් ', 'sosej-190', NULL, NULL, 'IMP-SOS-7148', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1005, 'vim podda 50g', 'විම් පොඩ්ඩා 50g', 'vim-podda-50g', NULL, NULL, 'IMP-VIM-4648', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1006, 'vepas little lion 390\\=', 'වේෆස්', 'vepas-little-lion-390', NULL, NULL, 'IMP-VEP-9591', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1007, 'jadi ', 'jadi', 'jadi', NULL, NULL, 'IMP-JAD-3845', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1008, 'baking powder 100g 325/=', 'බේකින් පව්ඩර්  100g', 'baking-powder-100g-325', NULL, NULL, 'IMP-BAK-1288', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1009, 'caramel pudding 100g', 'caramel pudding 100g', 'caramel-pudding-100g', NULL, NULL, 'IMP-CAR-4328', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1010, 'card 119', 'කාර්ඩ්', 'card-119', NULL, NULL, 'IMP-CAR-8062', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1011, 'fortune soya 90g 160/=', 'fortune සෝයා මීට් 90g', 'fortune-soya-90g-160', NULL, NULL, 'IMP-FOR-1727', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1012, 'fortune soya 50g 85/=', 'fortune සෝයා මීට් 50g', 'fortune-soya-50g-85', NULL, NULL, 'IMP-FOR-8924', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1013, '59', '60', '59', NULL, NULL, 'IMP-59-7812', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1014, 'teepol', 'teepol', 'teepol', NULL, NULL, 'IMP-TEE-3558', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1015, 'lanka nadu loos', 'වෙනත්', 'lanka-nadu-loos', NULL, NULL, 'IMP-LAN-6222', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1016, 'piyo del kiri  the 400g', 'pure dale kirithe 400g', 'piyo-del-kiri-the-400g', NULL, NULL, 'IMP-PIY-1366', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1017, 'piyo del full crem 400g', 'pure dale full crem 400g', 'piyo-del-full-crem-400g', NULL, NULL, 'IMP-PIY-2169', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1018, 'piyo del kiri the 200g', 'pure dale kirithe 200g', 'piyo-del-kiri-the-200g', NULL, NULL, 'IMP-PIY-8425', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1019, 'kopi freshco 20g 80/=', 'Freshko කෝපි', 'kopi-freshco-20g-80', NULL, NULL, 'IMP-KOP-6568', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1020, 'pampas L 150/=', 'ඩයපර් L', 'pampas-l-150', NULL, NULL, 'IMP-PAM-9089', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1021, 'kesel muva', 'කෙසෙල්මුව', 'kesel-muva', NULL, NULL, 'IMP-KES-4286', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1022, 'rat kill 100g', 'Rat Kill 100g', 'rat-kill-100g', NULL, NULL, 'IMP-RAT-3902', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1023, 'piyo del kiri the 25g', 'pure dale kirithe 25g', 'piyo-del-kiri-the-25g', NULL, NULL, 'IMP-PIY-3276', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1024, 'thal sukiri', 'තල් සූකිරි', 'thal-sukiri', NULL, NULL, 'IMP-THA-9819', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1025, 'sukiri', 'සූකිරි', 'sukiri', NULL, NULL, 'IMP-SUK-9734', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1026, 'pashan frut', 'පැෂන් ෆෘට්', 'pashan-frut', NULL, NULL, 'IMP-PAS-8346', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1027, 'vondar light 40g', 'wonderlight 40g', 'vondar-light-40g', NULL, NULL, 'IMP-VON-2938', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1028, 'makulu bola 420/=', 'makulu bola', 'makulu-bola-420', NULL, NULL, 'IMP-MAK-1168', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1029, 'diva  pow 40g 25/=', 'diva  pow 40g', 'diva-pow-40g-25', NULL, NULL, 'IMP-DIV-2144', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1030, 'bandage 45/=', 'Bandage', 'bandage-45', NULL, NULL, 'IMP-BAN-7278', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1031, '163-168', '170', '163-168', NULL, NULL, 'IMP-163-2257', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1032, 'jam kist  200g 290/=', 'ජෑම් 200g', 'jam-kist-200g-290', NULL, NULL, 'IMP-JAM-3035', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1033, 'gift item munchee 800/=', 'gift Assortment Munchee', 'gift-item-munchee-800', NULL, NULL, 'IMP-GIF-9772', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1034, 'linna malu', 'ලින්න මාළු', 'linna-malu', NULL, NULL, 'IMP-LIN-5381', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1035, 'hal massan malu', 'හාල් මැස්සන් මාළු', 'hal-massan-malu', NULL, NULL, 'IMP-HAL-2671', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1036, 'salayan malu', 'සලයන් මාළු', 'salayan-malu', NULL, NULL, 'IMP-SAL-7598', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1037, 'vella sudaya malu', 'වෙල්ලසූඩය', 'vella-sudaya-malu', NULL, NULL, 'IMP-VEL-4554', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1038, 'del gediya', 'del gediya', 'del-gediya', NULL, NULL, 'IMP-DEL-1314', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1039, 'kalawam malu', 'කලවම්	මාළු', 'kalawam-malu', NULL, NULL, 'IMP-KAL-7531', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1040, 'balaya', 'balaya', 'balaya', NULL, NULL, 'IMP-BAL-7609', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1041, 'paraw malu', 'පරව්', 'paraw-malu', NULL, NULL, 'IMP-PAR-3489', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1042, 'sudaya malu', 'සූඩය', 'sudaya-malu', NULL, NULL, 'IMP-SUD-6190', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1043, 'thith batu', 'තිත් බටු', 'thith-batu', NULL, NULL, 'IMP-THI-1681', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1044, 'anjila pataw malu', 'අන්ජිලා පැටව්', 'anjila-pataw-malu', NULL, NULL, 'IMP-ANJ-1525', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:37', '2024-11-19 04:07:37'),
(1045, 'paraw pataw malu', 'පරව් පැටව්', 'paraw-pataw-malu', NULL, NULL, 'IMP-PAR-4039', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1046, 'hurullo malu', 'හුරුල්ලන්', 'hurullo-malu', NULL, NULL, 'IMP-HUR-1784', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1047, 'isso malu', 'ඉස්සන්', 'isso-malu', NULL, NULL, 'IMP-ISS-3423', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1048, 'thirali malu', 'තිරලි', 'thirali-malu', NULL, NULL, 'IMP-THI-4625', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1049, 'sweet 150/=', 'චොකලට්', 'sweet-150', NULL, NULL, 'IMP-SWE-8822', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1050, 'delmeg soya 60/=', 'සෝයා මීට් 50g', 'delmeg-soya-60', NULL, NULL, 'IMP-DEL-9562', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1051, 'seelava malu', 'සීලාවන්', 'seelava-malu', NULL, NULL, 'IMP-SEE-4406', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1052, 'sosej keels 150/=', 'සොසේජ් 70g', 'sosej-keels-150', NULL, NULL, 'IMP-SOS-6917', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1053, 'murallu malu', 'මුරල්ලු', 'murallu-malu', NULL, NULL, 'IMP-MUR-7842', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1054, 'lanka soy chicken 165/=', 'සෝයා මීට් 90g', 'lanka-soy-chicken-165', NULL, NULL, 'IMP-LAN-9164', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1055, 'sura paraw malu', 'සුරා පරව්', 'sura-paraw-malu', NULL, NULL, 'IMP-SUR-3246', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1056, 'kumbala malu', 'කුම්බලා', 'kumbala-malu', NULL, NULL, 'IMP-KUM-3674', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1057, 'savalaya malu', 'සාවාලයන්', 'savalaya-malu', NULL, NULL, 'IMP-SAV-4370', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1058, 'diva powder 15/=', 'diva powder', 'diva-powder-15', NULL, NULL, 'IMP-DIV-4270', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1059, 'meevati malu', 'මීවැටි', 'meevati-malu', NULL, NULL, 'IMP-MEE-1199', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1060, 'kalinga malu', 'කලින්ගා', 'kalinga-malu', NULL, NULL, 'IMP-KAL-1660', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1061, 'hadallo', 'හැදැල්ලො', 'hadallo', NULL, NULL, 'IMP-HAD-2006', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1062, 'madu malu', 'මඩු මාළු', 'madu-malu', NULL, NULL, 'IMP-MAD-3194', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1063, 'colmans 240/=', 'Colman\'\'s', 'colmans-240', NULL, NULL, 'IMP-COL-3444', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1064, 'colmans 215/=', 'Colman\'\'s', 'colmans-215', NULL, NULL, 'IMP-COL-5670', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1065, 'kelawalla malu ', 'කෙලවල්ලා', 'kelawalla-malu', NULL, NULL, 'IMP-KEL-7340', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1066, 'pothubari malu', 'පොතුබරි', 'pothubari-malu', NULL, NULL, 'IMP-POT-5086', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1067, 'pastel 210/=', 'pastel', 'pastel-210', NULL, NULL, 'IMP-PAS-9922', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1068, 'marker pen', 'White Board Marker Pen', 'marker-pen', NULL, NULL, 'IMP-MAR-9875', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1069, 'A3 paper', 'A3 paper', 'a3-paper', NULL, NULL, 'IMP-A3P-8917', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1070, 'A3 paper', 'A3 paper', 'a3-paper-1', NULL, NULL, 'IMP-A3P-5937', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1071, 'file cover', 'File Cover', 'file-cover', NULL, NULL, 'IMP-FIL-5265', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1072, 'cfe dam 65/=', 'ෆෙම්ස්', 'cfe-dam-65', NULL, NULL, 'IMP-CFE-6675', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1073, 'maliban the 20g* 55/=', 'මැලිබන් තේ 20g', 'maliban-the-20g-55', NULL, NULL, 'IMP-MAL-3087', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1074, 'bala malu', 'බල මාළු', 'bala-malu', NULL, NULL, 'IMP-BAL-8734', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1075, 'file clip', 'file clip 50/=', 'file-clip', NULL, NULL, 'IMP-FIL-4140', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1076, 'uludu piti 200g', 'uludu piti 200g', 'uludu-piti-200g', NULL, NULL, 'IMP-ULU-4948', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1077, 'sri posha 200g', 'ශ්‍රී පෝෂ 200g', 'sri-posha-200g', NULL, NULL, 'IMP-SRI-4648', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1078, 'suvadal sahal 500g', 'සුවඳැල් 500g', 'suvadal-sahal-500g', NULL, NULL, 'IMP-SUV-2815', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1079, 'suvadal sahal 500g', 'සුවඳැල් 500g', 'suvadal-sahal-500g-1', NULL, NULL, 'IMP-SUV-1913', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1080, 'sweet 90', 'චොකලට්', 'sweet-90', NULL, NULL, 'IMP-SWE-8492', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1081, '899', '899', '899', NULL, NULL, 'IMP-899-5116', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1082, 'lak cow 60/=', 'Lak Cow 18g', 'lak-cow-60', NULL, NULL, 'IMP-LAK-3371', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1083, 'nipuna samba 5k', 'වෙනත්', 'nipuna-samba-5k', NULL, NULL, 'IMP-NIP-3530', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1084, 'sosej cataring pack', 'සොසේජ් catering pack', 'sosej-cataring-pack', NULL, NULL, 'IMP-SOS-9113', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1085, 'fresh milk abewela 120/=', 'Fresh Milk 200ml', 'fresh-milk-abewela-120', NULL, NULL, 'IMP-FRE-5011', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1086, 'calin  90/=', 'CALIN', 'calin-90', NULL, NULL, 'IMP-CAL-6286', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1087, 'amurthe 100/=', 'amurthe', 'amurthe-100', NULL, NULL, 'IMP-AMU-3972', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1088, 'beedi', 'බීඩි', 'beedi', NULL, NULL, 'IMP-BEE-7105', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1089, 'chocolate chip cookies 100g  240/=', 'chocolate chip cookies 100g', 'chocolate-chip-cookies-100g-240', NULL, NULL, 'IMP-CHO-3641', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1090, 'pelwatta milk powder 400g 1080/=', 'pelwatta milk powder 400g', 'pelwatta-milk-powder-400g-1080', NULL, NULL, 'IMP-PEL-9686', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1091, 'loku grosari katte', 'grocerry 1', 'loku-grosari-katte', NULL, NULL, 'IMP-LOK-1834', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1092, 'podi grosari 1', 'grocerry 1', 'podi-grosari-1', NULL, NULL, 'IMP-POD-5836', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1093, '650', '650', '650', NULL, NULL, 'IMP-650-3516', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1094, 'suposha 200g', 'සුපෝෂ 200g', 'suposha-200g', NULL, NULL, 'IMP-SUP-8502', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1095, '277', '280', '277', NULL, NULL, 'IMP-277-2211', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1096, 'dara mitiya', 'dara mitiya', 'dara-mitiya', NULL, NULL, 'IMP-DAR-7812', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1097, 'lanka samba loos 230/=', 'වෙනත්', 'lanka-samba-loos-230', NULL, NULL, 'IMP-LAN-2290', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1098, 'elephant house 120/=', 'අලියා බීම', 'elephant-house-120', NULL, NULL, 'IMP-ELE-7511', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1099, 'elephant house 170/=', 'අලියා බීම', 'elephant-house-170', NULL, NULL, 'IMP-ELE-5817', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1100, '129-133', '135', '129-133', NULL, NULL, 'IMP-129-1319', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1101, 'keells soya 80/=', 'සෝයා මීට් 50g', 'keells-soya-80', NULL, NULL, 'IMP-KEE-4221', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1102, '159-160', '160', '159-160', NULL, NULL, 'IMP-159-8770', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1103, 'boondi', 'boondi', 'boondi', NULL, NULL, 'IMP-BOO-6294', NULL, NULL, NULL, NULL, NULL, 'Grams', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1104, 'sweet 170/=', 'sweet 170/=', 'sweet-170', NULL, NULL, 'IMP-SWE-4985', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1105, 'vita 100/=', 'vita', 'vita-100', NULL, NULL, 'IMP-VIT-1419', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1106, 'soup 250/=', 'soup cup', 'soup-250', NULL, NULL, 'IMP-SOU-1568', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1107, 'soup 120/=', 'soup cup', 'soup-120', NULL, NULL, 'IMP-SOU-3510', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1108, 'soup with bread 300/=', 'soup with bread ', 'soup-with-bread-300', NULL, NULL, 'IMP-SOU-9215', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1109, 'soup with bread 150/=', 'soup with bread', 'soup-with-bread-150', NULL, NULL, 'IMP-SOU-2776', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1110, 'kola kada', 'kola kada 100/=', 'kola-kada', NULL, NULL, 'IMP-KOL-4382', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38'),
(1111, '198 reload', '198 reload', '198-reload', NULL, NULL, 'IMP-198-9878', NULL, NULL, NULL, NULL, NULL, 'Pieces', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 1, '2024-11-19 04:07:38', '2024-11-19 04:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `purchaseid` varchar(255) DEFAULT NULL,
  `total` varchar(255) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `cardno` varchar(255) DEFAULT NULL,
  `cardholdername` varchar(255) DEFAULT NULL,
  `chequeno` varchar(255) DEFAULT NULL,
  `chequedate` varchar(255) DEFAULT NULL,
  `chequebank` varchar(255) DEFAULT NULL,
  `bankaccount` varchar(100) DEFAULT NULL,
  `bankname` varchar(100) DEFAULT NULL,
  `accountholdername` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `paymentreference` varchar(255) DEFAULT NULL,
  `paymentnote` varchar(255) DEFAULT NULL,
  `paymentproof` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference`, `purchaseid`, `total`, `document`, `paymentmethod`, `cardno`, `cardholdername`, `chequeno`, `chequedate`, `chequebank`, `bankaccount`, `bankname`, `accountholdername`, `branch`, `paymentreference`, `paymentnote`, `paymentproof`, `supplier_id`, `created_at`, `updated_at`) VALUES
(1, '434534', 'PN24I11001', '500.00', '1d471aa7-5a8c-48d8-8770-c20a3cc088a1.png', 'Cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2024-11-25 18:28:10', '2024-11-25 18:28:10');

-- --------------------------------------------------------

--
-- Table structure for table `reward_settings`
--

CREATE TABLE `reward_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `spendamount` int(11) NOT NULL DEFAULT 100,
  `mintotal` int(11) NOT NULL DEFAULT 1,
  `maxpoint` int(11) DEFAULT NULL,
  `pointvalue` int(11) NOT NULL DEFAULT 1,
  `min_redeem_total` int(11) DEFAULT NULL,
  `min_redeem_per_invoice` int(11) DEFAULT NULL,
  `max_redeem_per_invoice` int(11) DEFAULT NULL,
  `exp_period` int(11) NOT NULL DEFAULT 12,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_settings`
--

INSERT INTO `reward_settings` (`id`, `spendamount`, `mintotal`, `maxpoint`, `pointvalue`, `min_redeem_total`, `min_redeem_per_invoice`, `max_redeem_per_invoice`, `exp_period`, `created_at`, `updated_at`) VALUES
(1, 100, 1, NULL, 1, 1, NULL, 300, 12, '2024-11-18 10:07:02', '2024-11-18 04:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `displayname` varchar(12) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `displayname`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', 'Super Admin', '2024-11-06 15:55:20', '2024-11-06 15:55:20'),
(2, 'admin', 'web', 'Admin', '2024-11-06 15:55:40', '2024-11-06 15:55:40'),
(3, 'user', 'web', 'User', '2024-11-06 15:55:55', '2024-11-06 15:55:55');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Soup', '', 1, '2024-11-13 08:05:51', '2024-11-13 08:10:35'),
(2, 'Vegitables', NULL, 1, '2024-11-13 09:14:41', '2024-11-13 09:14:41'),
(3, 'Retail', NULL, 1, '2024-11-13 09:14:49', '2024-11-13 09:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('e9axWCJM2QfVfrM0k6JqL4JWUNrltlP4OtwhEisj', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRXpaTHVxaFNiNVIwcHN0M2QzZncyMFNwUGU2RHg3WFZmUU9LaHl3UyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvcHVyY2hhc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1732559464);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `businessname` varchar(255) NOT NULL,
  `registrationno` varchar(255) DEFAULT NULL,
  `registrationtype` varchar(255) DEFAULT NULL,
  `contactperson` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `greetingmessage` varchar(255) NOT NULL DEFAULT '***ස්තූතියි, නැවත එන්න.***',
  `devname` varchar(255) NOT NULL DEFAULT 'TekSalad (Pvt) Ltd.',
  `devcontact` varchar(255) NOT NULL DEFAULT '077 068 7287',
  `startdate` date DEFAULT NULL,
  `loyaltypoints` tinyint(1) NOT NULL DEFAULT 0,
  `emailnotification` tinyint(1) NOT NULL DEFAULT 0,
  `smsnotification` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `businessname`, `registrationno`, `registrationtype`, `contactperson`, `contact`, `email`, `address1`, `address2`, `city`, `logo`, `greetingmessage`, `devname`, `devcontact`, `startdate`, `loyaltypoints`, `emailnotification`, `smsnotification`, `created_at`, `updated_at`) VALUES
(1, 'MJ Stores', NULL, 'Sole proprietorship', 'Lakindu Upeksha', '0770687287', 'lakinduupeksha93@gmail.com', 'Gonavila', NULL, 'Dankotuwa', 'logo.png', '***ස්තූතියි, නැවත එන්න.***', 'TekSalad (Pvt) Ltd.', '077 068 7287', '2024-11-01', 0, 0, 0, '2024-11-16 19:13:26', '2024-11-21 10:23:08');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stockid` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `availablequantity` varchar(255) DEFAULT NULL,
  `transferdqty` double DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `buyingprice` varchar(255) DEFAULT NULL,
  `marketprice` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `buyingtotal` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `stockid`, `reference`, `quantity`, `availablequantity`, `transferdqty`, `price`, `buyingprice`, `marketprice`, `total`, `buyingtotal`, `product_id`, `purchase_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'STK-2024-0001', NULL, '1000', '750', NULL, '250', '200', '300', '250', '200', 1, 1, 1, 1, '2024-11-25 18:28:10', '2024-11-25 18:29:11'),
(2, 'STK-2024-0002', NULL, '2000', '1750', NULL, '250', '150', '400', '500', '300', 2, 1, 1, 1, '2024-11-25 18:28:10', '2024-11-25 18:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0->disabled,1->active,2->deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `code`, `description`, `image`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Water', NULL, NULL, 'e55c5775-cbd5-40dc-abba-7b4eabeac44b.PNG', 3, 1, '2024-11-12 04:54:21', '2024-11-13 09:16:12'),
(2, 'Softdrinks', NULL, NULL, NULL, 3, 1, '2024-11-13 09:16:37', '2024-11-13 09:16:37');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contactperson` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `delivaryday` varchar(255) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `nextdelivary` date DEFAULT NULL,
  `lastdelivary` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0->disabled,1->active,2->deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contactperson`, `telephone`, `address`, `delivaryday`, `frequency`, `nextdelivary`, `lastdelivary`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Munchee', 'Lakindu Upeksha', '0770687858', NULL, 'wednesday', 'monthly', '2024-12-18', '2024-11-20', 1, 1, '2024-11-18 06:25:15', '2024-11-20 11:16:26'),
(2, 'DM', 'Lakindu Upeksha', '0770687287', NULL, 'monday', 'daily', '2024-11-20', '2024-11-19', 1, 1, '2024-11-19 03:40:28', '2024-11-19 08:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `telephone`, `address`, `email_verified_at`, `password`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lakindu Upeksha', 'lakinduupeksha93@gmail.com', '0770687287', NULL, NULL, '$2y$12$Tnl4OxcmaW8nhz.2MbOYyOyJcxfkghsuWuR05eST9mxm/SFgx6FYm', NULL, 1, '2024-11-06 10:48:01', '2024-11-06 10:48:01'),
(2, 'Lakindu Upeksha', 'admin@pos.com', '0770687287', NULL, NULL, '$2y$12$C4gVyWgz3l9pg7wUO/VVn.jyWd5zPLLsG3eAKTZYx/1gETvm9GXoC', NULL, 1, '2024-11-07 09:17:04', '2024-11-15 12:05:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_settings`
--
ALTER TABLE `reward_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1112;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reward_settings`
--
ALTER TABLE `reward_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
