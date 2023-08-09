-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 08, 2023 at 07:54 PM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u872772425_das_control`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_details` text DEFAULT NULL,
  `initial_balance` decimal(25,4) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `opening_date` datetime DEFAULT NULL,
  `url` text DEFAULT NULL,
  `total_deposit` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_withdraw` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_transfer_from_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_transfer_to_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `account_name`, `account_details`, `initial_balance`, `account_no`, `contact_person`, `phone_number`, `opening_date`, `url`, `total_deposit`, `total_withdraw`, `total_transfer_from_other`, `total_transfer_to_other`, `created_at`, `updated_at`) VALUES
(1, 'Default Account', 'This is a default account for any store', '0.0000', '1234567890', 'iAngryboy', '+880133333333', '2019-05-15 08:27:03', 'https://controldas.com', '31945.7000', '0.0000', '0.0000', '0.0000', '2019-01-16 13:23:03', '2019-07-02 11:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `bank_account_to_store`
--

CREATE TABLE `bank_account_to_store` (
  `ba2s` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `deposit` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `withdraw` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `transfer_from_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `transfer_to_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `bank_account_to_store`
--

INSERT INTO `bank_account_to_store` (`ba2s`, `store_id`, `account_id`, `deposit`, `withdraw`, `transfer_from_other`, `transfer_to_other`, `status`, `sort_order`) VALUES
(1, 1, 1, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0),
(2, 2, 1, '8180.1000', '23765.6000', '0.0000', '0.0000', 1, 0),
(4, 3, 1, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bank_transaction_info`
--

CREATE TABLE `bank_transaction_info` (
  `info_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `transaction_type` text DEFAULT NULL,
  `is_substract` tinyint(1) NOT NULL DEFAULT 0,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `account_id` int(10) UNSIGNED NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `exp_category_id` int(11) DEFAULT NULL,
  `ref_no` varchar(100) NOT NULL COMMENT 'e.g. Transaction ID, Check No.',
  `invoice_id` varchar(100) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `details` text DEFAULT NULL,
  `from_account_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `image` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `bank_transaction_info`
--

INSERT INTO `bank_transaction_info` (`info_id`, `store_id`, `transaction_type`, `is_substract`, `is_hide`, `account_id`, `source_id`, `exp_category_id`, `ref_no`, `invoice_id`, `title`, `details`, `from_account_id`, `status`, `image`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W1', 'CINVENTARIO DAS', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:27:13', NULL),
(2, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W2', 'CCINVENTARIO DAS', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:28:54', NULL),
(3, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W3', 'CHUVGH', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:32:05', NULL),
(4, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W4', 'CMATEMATICAS SEGUNDO', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:33:23', NULL),
(5, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W5', 'CDAS INGLES', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 11:36:18', NULL),
(6, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W6', 'CDAS LOGROS CIENCIAS', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:37:00', NULL),
(7, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W7', 'CDAS MANUAL PARA EMPRESAS', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:37:31', NULL),
(8, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W8', 'CDAS LOGROS LENGUAJE BASICA', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:38:06', NULL),
(9, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W9', 'CDAS INGLES 2', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 11:39:15', NULL),
(10, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W10', 'CDAS LOGROS LENGUAJE ', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:39:47', NULL),
(11, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W11', 'CDAS TUTORIAL MATEMATICAS', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:40:27', NULL),
(12, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W12', 'CLOGROS SOCIALES SEGUNDO', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:41:00', NULL),
(13, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W13', 'CLOGROS MATEMATICAS 4', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:45:16', NULL),
(14, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W14', 'CDAS INGLES ELLEVATE 2', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 11:46:16', NULL),
(15, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W15', 'CLOGROS CIENCIAS NATURALES 5', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:46:50', NULL),
(16, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W16', 'CGUCHITO 3-4 AÑOS', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:48:27', NULL),
(17, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W17', 'CLOGROS CIENCIAS 6', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:49:15', NULL),
(18, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W18', 'CLOGROS LENGUAJE 5', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:49:56', NULL),
(19, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W19', 'CLOGROS CIENCIAS 9', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:51:19', NULL),
(20, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W20', 'CMARAVILLAS DE LEER 2', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:51:54', NULL),
(21, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W21', 'CLOGROS FILOSOFIA 1', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:52:34', NULL),
(22, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W22', 'CEVERYDAY 1', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 11:54:12', NULL),
(23, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W23', 'CLOGROS QUIMICA 3', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:55:24', NULL),
(24, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W24', 'CLOGROS ANTISTICA 1', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:55:57', NULL),
(25, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W25', 'CLOGROS QUIMICA 1', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:56:24', NULL),
(26, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W26', 'CGUCHITO PREPARATORIA', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:57:10', NULL),
(27, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W27', 'CMARAVILLA DE LEER 6', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:57:34', NULL),
(28, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W28', 'CLOGROS CONTABILIAD 9', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:57:57', NULL),
(29, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W29', 'CLOGROS LENGUAJE 8', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:58:57', NULL),
(30, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W30', 'CMARAVILLA DE LEER 5', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 11:59:30', NULL),
(31, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W31', 'CLOGROS QUIMICA 3BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:00:30', NULL),
(32, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W32', 'CLOGROS CIENCIAS 7', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:01:19', NULL),
(33, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W33', 'CBIOLOGIA 3', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:01:41', NULL),
(34, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W34', 'CEMPRENDIMIENTO 1', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:02:16', NULL),
(35, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W35', 'CMARAVILLA DE LEER 3', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:02:43', NULL),
(36, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W36', 'CLEARNING 4', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 12:03:15', NULL),
(37, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W37', 'CLENGUAJE 3BASICA', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:03:40', NULL),
(38, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W38', 'CELLEVATE FULL 6', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 12:04:11', NULL),
(39, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W39', 'CSOCIALES 5', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:04:36', NULL),
(40, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W40', 'CCIENCIAS NATURALES 2', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:05:06', NULL),
(41, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W41', 'CLENGUAJE 2BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:05:50', NULL),
(42, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W42', 'CQUIMICA 2BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:06:30', NULL),
(43, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W43', 'CSOCIALES 7', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:06:49', NULL),
(44, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W44', 'CPORTAFOLIO EXPERIMENTAL 9', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:08:17', NULL),
(45, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W45', 'CLOGROS MATEMATICAS 9', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:12:31', NULL),
(46, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W46', 'CLOGROS SOCIALES 6', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:12:50', NULL),
(47, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W47', 'CLOGROS BIOLOGIA 2', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:13:15', NULL),
(48, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W48', 'CLOGROS MATEMATICAS 8', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:14:08', NULL),
(49, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W49', 'CELLEVATE FULL 5', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 12:14:44', NULL),
(50, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W50', 'CLEARNING ZONE 5', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 12:15:11', NULL),
(51, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W51', 'CLOGROS CIENCIAS NATURALES 4', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:15:43', NULL),
(52, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W52', 'CLOGROS FILOSOFIA 2', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:16:42', NULL),
(53, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W53', 'CLOGROS MATEMATICAS 3', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:17:09', NULL),
(54, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W54', 'CLOGROS CIENCIAS 10', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:17:33', NULL),
(55, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W55', 'CCONTABILIDAD 8', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:18:19', NULL),
(56, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W56', 'CLOGROS LENGUAJE 4', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:18:46', NULL),
(57, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W57', 'CPORTAFOLIO EXPERIMENTAL 10', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:19:18', NULL),
(58, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W58', 'CPROBLEMAS DEL MUNDO CONTEPORANEO', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:20:06', NULL),
(59, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W59', 'CLOGROS LENGUAJE 9', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:20:30', NULL),
(60, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W60', 'CPORTAFOLIO EXPERIMENTAL 8', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:20:55', NULL),
(61, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W61', 'CLOGROS SOCIALES 8', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:21:22', NULL),
(62, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W62', 'CGUCHITO 4-5AÑOS', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:21:56', NULL),
(63, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W63', 'CLOGROS LENGUAJE 6', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:22:20', NULL),
(64, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W64', 'CLOGROS SOCIALES 9', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:22:46', NULL),
(65, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W65', 'CLOGROS SOCIALLES 10', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:23:07', NULL),
(66, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W66', 'CEVERYDAY 2', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 12:23:37', NULL),
(67, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W67', 'CECA 2BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:24:05', NULL),
(68, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W68', 'CLEARNING ZONE 3', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 12:24:38', NULL),
(69, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W69', 'CCONTABILIDAD 1BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:25:58', NULL),
(70, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W70', 'CCONTABILIDAD 10', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:26:19', NULL),
(71, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W71', 'CLOGROS EMPRENDIMIENTO 2', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:26:51', NULL),
(72, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W72', 'CLOGROS MATEMATICAS ', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:27:53', NULL),
(73, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W73', 'CLOGROS MATEMATICAS 10', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:28:45', NULL),
(74, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W74', 'CLOGROS CIENCIAS 8', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:29:59', NULL),
(75, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W75', 'CLOGROS MATEMATICAS 7', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:30:46', NULL),
(76, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W76', 'CLOGROS MATEMATICAS 5', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:31:23', NULL),
(77, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W77', 'CMARAVILLA DE LEER 7', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:31:57', NULL),
(78, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W78', 'CLOGROS SOCIALES 3', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:32:25', NULL),
(79, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W79', 'CMARAVILLA DE LEER 4', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:32:57', NULL),
(80, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W80', 'CLOGROS LENGUAJE 1BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:33:30', NULL),
(81, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W81', 'CLOGROS SOCIALES 4', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 12:33:55', NULL),
(82, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W82', 'CLEARNING ZONE 6', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 12:34:41', NULL),
(83, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W83', 'CELLEVATE TEEN 1', 'Debit for Product Purchase', 'Supplier name: ELT SOLUTIONS', NULL, 1, 'NULL', 6, '2023-08-01 12:35:46', NULL),
(84, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W84', 'CMI TUTORIAL DIGITAL 2BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 13:33:00', NULL),
(85, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W85', 'CMI TUTORIAL DIGITAL 3BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 13:33:29', NULL),
(86, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W86', 'CMI TUTORIAL DIGITAL MATEMATICAS 8', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 13:53:14', NULL),
(87, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W87', 'CMI TUTORIAL DIGITAL MATEMATICAS 2BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 13:54:47', NULL),
(88, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W88', 'CMI TUTORIAL DIGITAL MATEMATICAS 3BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 13:55:52', NULL),
(89, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W89', 'CMI TUTORIAL DIGITAL FISICA 3BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 13:56:54', NULL),
(90, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W90', 'CMI TUTORIAL DIGITAL FISICA 2BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-01 13:57:23', NULL),
(91, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W91', 'CREFUERZO ESCOLAR 2', 'Debit for Product Purchase', 'Supplier name: HERNAN EIVAR', NULL, 1, 'NULL', 6, '2023-08-01 14:01:34', NULL),
(92, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W92', 'CREFUERZO ESCOLAR 3', 'Debit for Product Purchase', 'Supplier name: HERNAN EIVAR', NULL, 1, 'NULL', 6, '2023-08-01 14:02:00', NULL),
(93, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W93', 'CREFUERZO ESCOLAR 5', 'Debit for Product Purchase', 'Supplier name: HERNAN EIVAR', NULL, 1, 'NULL', 6, '2023-08-01 14:04:00', NULL),
(94, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W94', 'CREFUERZO ESCOLAR 6', 'Debit for Product Purchase', 'Supplier name: HERNAN EIVAR', NULL, 1, 'NULL', 6, '2023-08-01 14:04:36', NULL),
(95, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W95', 'CREFUERZO ESCOLAR 4', 'Debit for Product Purchase', 'Supplier name: HERNAN EIVAR', NULL, 1, 'NULL', 6, '2023-08-01 14:04:58', NULL),
(96, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W96', 'CREFUERZO ESCOLAR 7', 'Debit for Product Purchase', 'Supplier name: HERNAN EIVAR', NULL, 1, 'NULL', 6, '2023-08-01 14:05:26', NULL),
(97, 2, 'deposit', 0, 0, 1, 9, NULL, 'D97', 'CQUIMICA 2BGU', 'Deposit for purchase delete', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 1, '2023-08-01 15:06:48', NULL),
(98, 2, 'deposit', 0, 0, 1, 9, NULL, 'D98', 'CLOGROS QUIMICA 3BGU', 'Deposit for purchase delete', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 1, '2023-08-01 15:07:02', NULL),
(99, 2, 'deposit', 0, 0, 1, 9, NULL, 'D99', 'CLOGROS QUIMICA 1', 'Deposit for purchase delete', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 1, '2023-08-01 15:07:05', NULL),
(100, 2, 'deposit', 0, 0, 1, 9, NULL, 'D100', 'CLOGROS QUIMICA 3', 'Deposit for purchase delete', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 1, '2023-08-01 15:07:08', NULL),
(101, 2, 'deposit', 0, 0, 1, 9, NULL, 'D101', 'CDAS TUTORIAL MATEMATICAS', 'Deposit for purchase delete', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 1, '2023-08-01 15:10:34', NULL),
(102, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W102', 'CBGU QUIMICA ORGANICA ', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-02 10:22:01', NULL),
(103, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W103', 'C3BGU CERIT', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-02 10:23:05', NULL),
(104, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W104', 'C2BGU CERIT', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-02 10:23:54', NULL),
(105, 2, 'deposit', 0, 0, 1, 1, NULL, 'D105', '22023/00000001', 'Deposit for selling', 'Customer name: hermogenes mena dominguez', NULL, 1, 'NULL', 6, '2023-08-02 11:21:03', NULL),
(106, 2, 'deposit', 0, 0, 1, 1, NULL, 'D106', '22023/00000002', 'Deposit for selling', 'Customer name: JOHANNA ALEJANDRA BORJA BRAZALES', NULL, 1, 'NULL', 6, '2023-08-02 11:28:33', NULL),
(107, 2, 'deposit', 0, 0, 1, 1, NULL, 'D107', '22023/00000003', 'Deposit for selling', 'Customer name: JORGE ANDRES PARRA PARRA', NULL, 1, 'NULL', 6, '2023-08-02 11:31:26', NULL),
(108, 2, 'deposit', 0, 0, 1, 1, NULL, 'D108', '22023/00000004', 'Deposit for selling', 'Customer name: Cliente Final', NULL, 1, 'NULL', 6, '2023-08-02 11:32:36', NULL),
(109, 2, 'deposit', 0, 0, 1, 1, NULL, 'D109', '22023/00000005', 'Deposit for selling', 'Customer name: PATRICIA PILCO', NULL, 1, 'NULL', 6, '2023-08-02 11:36:25', NULL),
(110, 2, 'deposit', 0, 0, 1, 1, NULL, 'D110', '22023/00000006', 'Deposit for selling', 'Customer name: PAMELA DEL ROSARIO CHIMBA MAIGUASHIA', NULL, 1, 'NULL', 6, '2023-08-02 11:38:24', NULL),
(111, 2, 'deposit', 0, 0, 1, 1, NULL, 'D111', '22023/00000007', 'Deposit for selling', 'Customer name: JESSICA GUALPA', NULL, 1, 'NULL', 6, '2023-08-02 11:40:41', NULL),
(112, 2, 'deposit', 0, 0, 1, 1, NULL, 'D112', '22023/00000008', 'Deposit for selling', 'Customer name: SILVIA ALBAN ', NULL, 1, 'NULL', 6, '2023-08-02 11:43:07', NULL),
(113, 2, 'deposit', 0, 0, 1, 1, NULL, 'D113', '22023/00000009', 'Deposit for selling', 'Customer name: MILTON HERNANDEZ', NULL, 1, 'NULL', 6, '2023-08-02 11:44:19', NULL),
(114, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W114', 'CMI TUTORIAL DIGITAL 9', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-02 11:49:52', NULL),
(115, 2, 'deposit', 0, 0, 1, 1, NULL, 'D115', '22023/00000010', 'Deposit for selling', 'Customer name: MARCO ORLANDO CHILE', NULL, 1, 'NULL', 6, '2023-08-02 11:50:32', NULL),
(116, 2, 'deposit', 0, 0, 1, 1, NULL, 'D116', '22023/00000011', 'Deposit for selling', 'Customer name: FERNANDO XAVIER CALVOPIÑA PROAÑO', NULL, 1, 'NULL', 6, '2023-08-02 11:57:23', NULL),
(117, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W117', 'CLOGROS CIENCIAS NATURALES 6', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-02 12:03:10', NULL),
(118, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W118', 'CLOGROS CIENCIAS NATURALES 4.', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-02 12:06:29', NULL),
(119, 2, 'deposit', 0, 0, 1, 1, NULL, 'D119', '22023/00000012', 'Deposit for selling', 'Customer name: EDGAR GEOVANNY GALLO MOLINA', NULL, 1, 'NULL', 6, '2023-08-02 12:07:02', NULL),
(120, 2, 'deposit', 0, 0, 1, 1, NULL, 'D120', '22023/00000013', 'Deposit for selling', 'Customer name: NANCY MOREANO ', NULL, 1, 'NULL', 6, '2023-08-02 12:08:41', NULL),
(121, 2, 'deposit', 0, 0, 1, 1, NULL, 'D121', '22023/00000014', 'Deposit for selling', 'Customer name: Cliente Final', NULL, 1, 'NULL', 6, '2023-08-02 12:18:19', NULL),
(122, 2, 'deposit', 0, 0, 1, 1, NULL, 'D122', '22023/00000015', 'Deposit for selling', 'Customer name: GUILINTON FABRICIO MERIZABLE VILLAMARIN ', NULL, 1, 'NULL', 6, '2023-08-03 10:26:48', NULL),
(123, 2, 'deposit', 0, 0, 1, 1, NULL, 'D123', '22023/00000016', 'Deposit for selling', 'Customer name: YESENIA YUGSI', NULL, 1, 'NULL', 6, '2023-08-03 10:58:55', NULL),
(124, 2, 'deposit', 0, 0, 1, 1, NULL, 'D124', '22023/00000017', 'Deposit for selling', 'Customer name: JOSE CHILUISA ', NULL, 1, 'NULL', 6, '2023-08-03 13:54:55', NULL),
(125, 2, 'deposit', 0, 0, 1, 1, NULL, 'D125', '22023/00000018', 'Deposit for selling', 'Customer name: KATHERYN SEMBLANTES ', NULL, 1, 'NULL', 6, '2023-08-03 14:56:44', NULL),
(126, 2, 'deposit', 0, 0, 1, 1, NULL, 'D126', '22023/00000019', 'Deposit for selling', 'Customer name: BOLIVAR CAMACHO ', NULL, 1, 'NULL', 6, '2023-08-04 11:19:57', NULL),
(127, 2, 'deposit', 0, 0, 1, 1, NULL, 'D127', '22023/00000020', 'Deposit for selling', 'Customer name: CRISTHIAN BASANTES', NULL, 1, 'NULL', 6, '2023-08-04 13:36:29', NULL),
(128, 2, 'deposit', 0, 0, 1, 1, NULL, 'D128', '22023/00000021', 'Deposit for selling', 'Customer name: DANIELO CUENCA', NULL, 1, 'NULL', 6, '2023-08-04 14:40:26', NULL),
(129, 2, 'deposit', 0, 0, 1, 1, NULL, 'D129', '22023/00000022', 'Deposit for selling', 'Customer name: MARIA DE LOS ANGELES MAZAPANTA RIVADENEIRA', NULL, 1, 'NULL', 6, '2023-08-04 15:09:58', NULL),
(130, 2, 'deposit', 0, 0, 1, 1, NULL, 'D130', '22023/00000023', 'Deposit for selling', 'Customer name: FERNANDO LARA', NULL, 1, 'NULL', 6, '2023-08-05 12:01:57', NULL),
(131, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W131', 'CHISTORIA 3BGU', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-05 12:16:20', NULL),
(132, 2, 'deposit', 0, 0, 1, 1, NULL, 'D132', '22023/00000024', 'Deposit for selling', 'Customer name: HUGO MUÑOZ', NULL, 1, 'NULL', 6, '2023-08-05 12:30:13', NULL),
(133, 2, 'deposit', 0, 0, 1, 1, NULL, 'D133', '22023/00000025', 'Deposit for selling', 'Customer name: HUGO MUÑOZ', NULL, 1, 'NULL', 6, '2023-08-05 12:34:42', NULL),
(134, 2, 'withdraw', 1, 0, 1, 1, 10, 'W134', '22023/00000025', 'Debit while deleting sell invoice', 'Customer name: HUGO MUÑOZ', NULL, 1, 'NULL', 2, '2023-08-05 13:29:29', NULL),
(135, 2, 'deposit', 0, 0, 1, 1, NULL, 'D135', '22023/00000025', 'Deposit for selling', 'Customer name: HUGO MUÑOZ', NULL, 1, 'NULL', 6, '2023-08-05 14:12:07', NULL),
(136, 2, 'withdraw', 0, 0, 1, NULL, 9, 'W136', 'CLOGROS HISTORIA 2', 'Debit for Product Purchase', 'Supplier name: EDITORIALES HOLGUIN', NULL, 1, 'NULL', 6, '2023-08-05 14:19:17', NULL),
(137, 2, 'deposit', 0, 0, 1, 1, NULL, 'D137', '22023/00000026', 'Deposit for selling', 'Customer name: MANUEL PANCHE ', NULL, 1, 'NULL', 6, '2023-08-05 14:24:32', NULL),
(138, 2, 'deposit', 0, 0, 1, 1, NULL, 'D138', '22023/00000027', 'Deposit for selling', 'Customer name: CARMEN VALENCIA', NULL, 1, 'NULL', 6, '2023-08-07 12:26:37', NULL),
(139, 2, 'deposit', 0, 0, 1, 1, NULL, 'D139', '22023/00000028', 'Deposit for selling', 'Customer name: HECTOR ALEJANDO MORALES PERES', NULL, 1, 'NULL', 6, '2023-08-07 14:45:35', NULL),
(140, 2, 'deposit', 0, 0, 1, 1, NULL, 'D140', '22023/00000029', 'Deposit for selling', 'Customer name: Cliente Final', NULL, 1, 'NULL', 6, '2023-08-07 15:41:35', NULL),
(141, 2, 'deposit', 0, 0, 1, 1, NULL, 'D141', '22023/00000030', 'Deposit for selling', 'Customer name: ESTEFANIA QUERIDO', NULL, 1, 'NULL', 6, '2023-08-08 10:23:06', NULL),
(142, 2, 'deposit', 0, 0, 1, 1, NULL, 'D142', '22023/00000031', 'Deposit for selling', 'Customer name: DIEGO MOLINA ', NULL, 1, 'NULL', 6, '2023-08-08 10:47:23', NULL),
(143, 2, 'deposit', 0, 0, 1, 1, NULL, 'D143', '22023/00000032', 'Deposit for selling', 'Customer name: KARINA LAVERDE', NULL, 1, 'NULL', 6, '2023-08-08 11:47:40', NULL),
(144, 2, 'deposit', 0, 0, 1, 1, NULL, 'D144', '22023/00000033', 'Deposit for selling', 'Customer name: CARMEN BROUWN', NULL, 1, 'NULL', 6, '2023-08-08 12:39:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_transaction_price`
--

CREATE TABLE `bank_transaction_price` (
  `price_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `info_id` int(11) DEFAULT NULL,
  `ref_no` varchar(100) NOT NULL COMMENT 'e.g. Transaction ID, Check No.',
  `amount` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `bank_transaction_price`
--

INSERT INTO `bank_transaction_price` (`price_id`, `store_id`, `info_id`, `ref_no`, `amount`) VALUES
(1, 2, 1, 'W1', '302.4000'),
(2, 2, 2, 'W2', '280.8000'),
(3, 2, 3, 'W3', '216.0000'),
(4, 2, 4, 'W4', '216.0000'),
(5, 2, 5, 'W5', '405.0000'),
(6, 2, 6, 'W6', '270.0000'),
(7, 2, 7, 'W7', '310.0000'),
(8, 2, 8, 'W8', '237.6000'),
(9, 2, 9, 'W9', '405.0000'),
(10, 2, 10, 'W10', '64.8000'),
(11, 2, 11, 'W11', '174.0000'),
(12, 2, 12, 'W12', '270.0000'),
(13, 2, 13, 'W13', '270.0000'),
(14, 2, 14, 'W14', '176.0000'),
(15, 2, 15, 'W15', '259.2000'),
(16, 2, 16, 'W16', '380.0000'),
(17, 2, 17, 'W17', '10.8000'),
(18, 2, 18, 'W18', '302.4000'),
(19, 2, 19, 'W19', '324.0000'),
(20, 2, 20, 'W20', '117.6000'),
(21, 2, 21, 'W21', '43.2000'),
(22, 2, 22, 'W22', '315.0000'),
(23, 2, 23, 'W23', '313.2000'),
(24, 2, 24, 'W24', '75.0000'),
(25, 2, 25, 'W25', '294.0000'),
(26, 2, 26, 'W26', '560.0000'),
(27, 2, 27, 'W27', '123.2000'),
(28, 2, 28, 'W28', '80.0000'),
(29, 2, 29, 'W29', '237.6000'),
(30, 2, 30, 'W30', '123.2000'),
(31, 2, 31, 'W31', '313.2000'),
(32, 2, 32, 'W32', '194.4000'),
(33, 2, 33, 'W33', '259.2000'),
(34, 2, 34, 'W34', '54.0000'),
(35, 2, 35, 'W35', '162.4000'),
(36, 2, 36, 'W36', '270.0000'),
(37, 2, 37, 'W37', '248.4000'),
(38, 2, 38, 'W38', '66.0000'),
(39, 2, 39, 'W39', '291.6000'),
(40, 2, 40, 'W40', '248.4000'),
(41, 2, 41, 'W41', '313.2000'),
(42, 2, 42, 'W42', '313.2000'),
(43, 2, 43, 'W43', '302.4000'),
(44, 2, 44, 'W44', '128.8000'),
(45, 2, 45, 'W45', '302.4000'),
(46, 2, 46, 'W46', '345.6000'),
(47, 2, 47, 'W47', '270.0000'),
(48, 2, 48, 'W48', '302.4000'),
(49, 2, 49, 'W49', '176.0000'),
(50, 2, 50, 'W50', '270.0000'),
(51, 2, 51, 'W51', '21.6000'),
(52, 2, 52, 'W52', '345.6000'),
(53, 2, 53, 'W53', '237.6000'),
(54, 2, 54, 'W54', '324.0000'),
(55, 2, 55, 'W55', '320.0000'),
(56, 2, 56, 'W56', '237.6000'),
(57, 2, 57, 'W57', '123.2000'),
(58, 2, 58, 'W58', '250.0000'),
(59, 2, 59, 'W59', '291.6000'),
(60, 2, 60, 'W60', '123.2000'),
(61, 2, 61, 'W61', '324.0000'),
(62, 2, 62, 'W62', '640.0000'),
(63, 2, 63, 'W63', '302.4000'),
(64, 2, 64, 'W64', '313.2000'),
(65, 2, 65, 'W65', '313.2000'),
(66, 2, 66, 'W66', '105.0000'),
(67, 2, 67, 'W67', '700.0000'),
(68, 2, 68, 'W68', '243.0000'),
(69, 2, 69, 'W69', '360.0000'),
(70, 2, 70, 'W70', '330.0000'),
(71, 2, 71, 'W71', '237.6000'),
(72, 2, 72, 'W72', '291.6000'),
(73, 2, 73, 'W73', '313.2000'),
(74, 2, 74, 'W74', '334.8000'),
(75, 2, 75, 'W75', '259.2000'),
(76, 2, 76, 'W76', '291.6000'),
(77, 2, 77, 'W77', '128.8000'),
(78, 2, 78, 'W78', '280.8000'),
(79, 2, 79, 'W79', '162.4000'),
(80, 2, 80, 'W80', '97.2000'),
(81, 2, 81, 'W81', '270.0000'),
(82, 2, 82, 'W82', '220.0000'),
(83, 2, 83, 'W83', '132.0000'),
(84, 2, 84, 'W84', '120.0000'),
(85, 2, 85, 'W85', '120.0000'),
(86, 2, 86, 'W86', '42.0000'),
(87, 2, 87, 'W87', '42.0000'),
(88, 2, 88, 'W88', '42.0000'),
(89, 2, 89, 'W89', '180.0000'),
(90, 2, 90, 'W90', '168.0000'),
(91, 2, 91, 'W91', '65.0000'),
(92, 2, 92, 'W92', '65.0000'),
(93, 2, 93, 'W93', '65.0000'),
(94, 2, 94, 'W94', '65.0000'),
(95, 2, 95, 'W95', '65.0000'),
(96, 2, 96, 'W96', '65.0000'),
(97, 2, 97, 'D97', '313.2000'),
(98, 2, 98, 'D98', '313.2000'),
(99, 2, 99, 'D99', '294.0000'),
(100, 2, 100, 'D100', '313.2000'),
(101, 2, 101, 'D101', '174.0000'),
(102, 2, 102, 'W102', '252.0000'),
(103, 2, 103, 'W103', '194.4000'),
(104, 2, 104, 'W104', '302.4000'),
(105, 2, 105, 'D105', '164.0000'),
(106, 2, 106, 'D106', '164.0000'),
(107, 2, 107, 'D107', '85.0000'),
(108, 2, 108, 'D108', '164.0000'),
(109, 2, 109, 'D109', '164.0000'),
(110, 2, 110, 'D110', '164.0000'),
(111, 2, 111, 'D111', '164.0000'),
(112, 2, 112, 'D112', '164.0000'),
(113, 2, 113, 'D113', '164.0000'),
(114, 2, 114, 'W114', '42.0000'),
(115, 2, 115, 'D115', '306.0000'),
(116, 2, 116, 'D116', '164.0000'),
(117, 2, 117, 'W117', '129.6000'),
(118, 2, 118, 'W118', '129.6000'),
(119, 2, 119, 'D119', '164.0000'),
(120, 2, 120, 'D120', '85.0000'),
(121, 2, 121, 'D121', '1417.5000'),
(122, 2, 122, 'D122', '164.0000'),
(123, 2, 123, 'D123', '164.0000'),
(124, 2, 124, 'D124', '85.0000'),
(125, 2, 125, 'D125', '164.0000'),
(126, 2, 126, 'D126', '164.0000'),
(127, 2, 127, 'D127', '164.0000'),
(128, 2, 128, 'D128', '142.0000'),
(129, 2, 129, 'D129', '164.0000'),
(130, 2, 130, 'D130', '164.0000'),
(131, 2, 131, 'W131', '205.2000'),
(132, 2, 132, 'D132', '164.0000'),
(133, 2, 133, 'D133', '192.0000'),
(134, 2, 134, 'W134', '192.0000'),
(135, 2, 135, 'D135', '180.0000'),
(136, 2, 136, 'W136', '302.4000'),
(137, 2, 137, 'D137', '180.0000'),
(138, 2, 138, 'D138', '85.0000'),
(139, 2, 139, 'D139', '164.0000'),
(140, 2, 140, 'D140', '164.0000'),
(141, 2, 141, 'D141', '164.0000'),
(142, 2, 142, 'D142', '164.0000'),
(143, 2, 143, 'D143', '322.0000'),
(144, 2, 144, 'D144', '85.0000');

-- --------------------------------------------------------

--
-- Table structure for table `boxes`
--

CREATE TABLE `boxes` (
  `box_id` int(10) UNSIGNED NOT NULL,
  `box_name` varchar(100) NOT NULL,
  `code_name` varchar(55) DEFAULT NULL,
  `box_details` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `boxes`
--

INSERT INTO `boxes` (`box_id`, `box_name`, `code_name`, `box_details`, `status`) VALUES
(1, 'Common Box', 'common', 'Common Box details here...', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `code_name` varchar(100) NOT NULL,
  `brand_details` longtext DEFAULT NULL,
  `brand_image` varchar(250) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `code_name`, `brand_details`, `brand_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'No brand', 'no_brand', '', '', 1, '2019-03-31 03:36:47', '2019-07-02 11:59:26');

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(60) NOT NULL,
  `category_slug` varchar(60) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `category_details` text DEFAULT NULL,
  `category_image` varchar(250) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`category_id`, `category_name`, `category_slug`, `parent_id`, `category_details`, `category_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TEXTOS ESCOLARES', 'textos_escolares', 0, 'TEXTOS ESCOLARES', '', 1, '2018-08-17 05:28:16', '2019-07-02 12:00:23'),
(2, 'PLATAFORMAS DIGITALES', 'plataformas_digitales', 1, '', '', 1, '2023-06-13 15:32:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `college_id` int(10) UNSIGNED NOT NULL,
  `college_name` varchar(100) NOT NULL,
  `code_name` varchar(100) NOT NULL,
  `college_details` longtext DEFAULT NULL,
  `college_image` varchar(250) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`college_id`, `college_name`, `code_name`, `college_details`, `college_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'U.E PASTOCALLE ', 'u.e_pastocalle', 'LCDO FABIAN MOSQUERA', '', 1, '2023-07-21 13:52:10', NULL),
(2, 'U.E INTERNACIONAL COTOPAXI ', 'u.e_internacional_cotopaxi', 'MGS. JOHANA PROAÑO ', '', 1, '2023-07-21 14:31:41', NULL),
(3, 'PCI JATARI UNANCHA/PUJILI ', 'pci_jatari_unancha/pujili', 'ING. DARIO GANCHALA', '', 1, '2023-07-21 14:37:11', NULL),
(4, 'CERIT', 'cerit', 'JOSE SANTO MENA\r\nruc 0500843222001\r\nCEL 0960463639\r\nEMAIL planificacionbuho@gmail.com\r\nDIRECCION Quito y Tarqui diagonal a la notaria 3ra', '', 1, '2023-07-26 16:31:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(10) UNSIGNED NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `code_name` varchar(100) NOT NULL,
  `course_details` longtext DEFAULT NULL,
  `course_image` varchar(250) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `code_name`, `course_details`, `course_image`, `status`, `created_at`, `updated_at`) VALUES
(1, '1 PREPARATORIA', '1_preparatoria', 'a', '', 1, '2023-06-16 00:00:00', '2023-06-16 05:00:00'),
(2, '2', '2', '', '', 1, '2023-06-16 14:22:56', NULL),
(3, '3', '3', '', '', 1, '2023-06-16 16:02:13', NULL),
(4, '4', '4', '', '', 1, '2023-06-16 16:13:06', NULL),
(5, '5', '5', '', '', 1, '2023-06-16 16:13:08', NULL),
(6, '6', '6', '', '', 1, '2023-06-16 16:13:10', NULL),
(7, '7', '7', '', '', 1, '2023-06-16 16:13:11', NULL),
(8, '8', '8', '', '', 1, '2023-06-16 16:13:13', NULL),
(9, '9', '9', '', '', 1, '2023-06-16 16:13:16', NULL),
(10, '10', '10', '', '', 1, '2023-06-16 16:13:17', NULL),
(11, 'INICIAL 1', 'inicial_1', '', '', 1, '2023-06-16 16:13:20', NULL),
(12, 'INICIAL 2', 'inicial_2', '', '', 1, '2023-06-16 16:13:25', NULL),
(13, 'BGU 1', '1_bgu', '', '', 1, '2023-06-16 16:13:33', NULL),
(14, 'BGU 2', '2_bgu', '', '', 1, '2023-06-16 16:13:37', NULL),
(15, 'BGU 3', 'bgu_3', '', '', 1, '2023-07-21 11:54:34', NULL),
(16, 'MATERNAL 2 AÑOS', 'maternal_2_os', '', '', 1, '2023-07-21 11:56:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` decimal(25,4) NOT NULL DEFAULT 1.0000,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `created_at`) VALUES
(1, 'United States Dollar', 'USD', '$', '', '2', '1.0000', 1, '2018-09-19 14:40:00'),
(2, 'Euros', 'EUR', '€', '', '2', '1.0000', 1, '2023-06-24 14:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_document` varchar(20) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_mobile` varchar(14) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `customer_sex` tinyint(1) NOT NULL DEFAULT 1,
  `customer_age` int(10) UNSIGNED DEFAULT NULL,
  `gtin` varchar(100) DEFAULT NULL,
  `customer_city` varchar(100) DEFAULT NULL,
  `customer_state` varchar(100) DEFAULT NULL,
  `customer_country` varchar(100) DEFAULT NULL,
  `is_giftcard` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(100) DEFAULT NULL,
  `raw_password` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_document`, `customer_name`, `customer_email`, `customer_mobile`, `customer_address`, `dob`, `customer_sex`, `customer_age`, `gtin`, `customer_city`, `customer_state`, `customer_country`, `is_giftcard`, `password`, `raw_password`, `created_at`, `updated_at`) VALUES
(1, '9999999999', 'Cliente Final', 'default@controldas.com', '', 'CENTRO DE LATACUNGA FRENTE A LA ESPE 33', '1993-01-01', 1, 20, '', 'AN', 'AN', 'AD', 0, 'c33367701511b4f6020ec61ded352059', '654321', '2018-04-29 14:18:37', '2019-07-02 13:50:11'),
(2, '0500875133', 'hermogenes mena dominguez', 'carmen.fm61@hotmail.com', '', '', '1969-12-31', 1, 0, '', 'Latacunga', '', 'AD', 0, NULL, NULL, '2023-07-26 14:19:54', NULL),
(3, 'COLEGIO LATACUNGA', 'COLEGIO CERIT ', '3253e2@gmail.com', '', 'VENTA EN PUNTO DE VENTA PROPIO', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-07-28 09:24:18', NULL),
(4, '0502567621', 'JOHANNA ALEJANDRA BORJA BRAZALES', 'eduallmighty@yahoo.com', '0987317953', 'EL LOREDO CASA 5', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:27:46', NULL),
(5, '0503692993', 'JORGE ANDRES PARRA PARRA', 'jorgeandres.j@hotmail.com', '0987716930', 'LATACUNGA', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:30:14', NULL),
(6, '0922967286', 'PATRICIA PILCO', 'patriciapilco1990@gmail.com', '0998590760', 'LATACUNGA', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:34:45', NULL),
(7, '0503888141', 'PAMELA DEL ROSARIO CHIMBA MAIGUASHIA', 'pamer199212@gmail.com', '', 'LATACUNGA', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:37:58', NULL),
(8, '0503030850', 'JESSICA GUALPA', 'jessicagualpa35@gmail.com', '0979483868', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:40:21', NULL),
(9, '0503020406', 'SILVIA ALBAN ', 'silvialban28@gmail.com', '0999076270', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:41:48', NULL),
(10, '1709527178', 'MILTON HERNANDEZ', 'milton_her@hotmail.com', '', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:44:02', NULL),
(11, '0502002876', 'MARCO ORLANDO CHILE', 'mark_bust@hotmail.com', '0984874677', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:45:23', NULL),
(12, '0502655780', 'FERNANDO XAVIER CALVOPIÑA PROAÑO', 'fernandofae85@gmail.com', '', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:56:40', NULL),
(13, '0303051534', 'EDGAR GEOVANNY GALLO MOLINA', 'vanfrangaith66@gmail.com', '', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 11:59:06', NULL),
(14, '0503352122', 'NANCY MOREANO ', 'nancymoreano_23@hotmail.com', '0984559024', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-02 12:08:14', NULL),
(15, '0501048169', 'GUILINTON FABRICIO MERIZABLE VILLAMARIN ', 'guilintin18@hotmail.com', '0987874870', '', '1969-12-31', 1, 0, '', 'LATACUNGA ', '', 'AD', 0, NULL, NULL, '2023-08-03 10:26:26', NULL),
(16, '0504426578', 'YESENIA YUGSI', 'yesseniayugsi3k@gmail.com', '', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-03 10:58:30', NULL),
(17, '0500168331', 'JOSE CHILUISA ', 'marco.chulisa@gmail.com', '0987085359', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-03 13:54:25', NULL),
(18, '0503071816001', 'KATHERYN SEMBLANTES ', 'brigite@live.com', '0998568141', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-03 14:56:14', NULL),
(19, '1718904731', 'BOLIVAR CAMACHO ', 'bolo.77@hotmail.com', '0985377936', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-04 11:19:29', NULL),
(20, '053143414', 'CRISTHIAN BASANTES', 'cristhianbasantes@hotmail.com', '0998066143', '', '1969-12-31', 1, 0, '', '', '', 'AD', 0, NULL, NULL, '2023-08-04 13:36:04', NULL),
(21, '1104170301', 'DANIELO CUENCA', 'cuencawilber1983@gmail.com', '0961800733', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-04 14:40:08', NULL),
(22, '0503387946', 'MARIA DE LOS ANGELES MAZAPANTA RIVADENEIRA', 'psico.ange.mr@gmail.com', '0998533552', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-04 15:09:42', NULL),
(23, '0503328072001', 'FERNANDO LARA', 'fernandolaracrespo@hotmail.com', '', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-05 12:01:18', NULL),
(24, '0502067028', 'HUGO MUÑOZ', 'verito261987@hotmail.com', '0997367992', 'LASSO ', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-05 12:11:51', NULL),
(25, '0502059785', 'MANUEL PANCHE ', 'panchiman22@gmail.com', '0981937194', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-05 14:24:12', NULL),
(26, '0500559158', 'CARMEN VALENCIA', 'carcumvp@yahoo.es', '0996646083', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-07 12:25:56', NULL),
(27, '0502256191', 'HECTOR ALEJANDO MORALES PERES', 'anafran410@gmail.com', '', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-07 14:45:19', NULL),
(28, '0504348723', 'ESTEFANIA QUERIDO', 'ceciquerido@gmail.com', '0984612677', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-08 10:22:19', NULL),
(29, '0502671860001', 'DIEGO MOLINA ', 'diegfml_2006@hotmail.com', '0999661606', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-08 10:46:17', NULL),
(30, '0503154122', 'KARINA LAVERDE', 'immaginemoda@hotmail.com', '0997871520', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-08 11:46:30', NULL),
(31, '1759915232', 'CARMEN BROUWN', 'care_brownm@hotmail.com', '0963115284', '', '1969-12-31', 1, 0, '', 'LATACUNGA', '', 'AD', 0, NULL, NULL, '2023-08-08 12:38:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_to_store`
--

CREATE TABLE `customer_to_store` (
  `c2s_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `balance` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `customer_to_store`
--

INSERT INTO `customer_to_store` (`c2s_id`, `customer_id`, `store_id`, `balance`, `due`, `status`, `sort_order`) VALUES
(1, 1, 1, '0.0000', '0.0000', 1, 0),
(2, 1, 2, '0.0000', '0.0000', 1, 0),
(3, 2, 2, '0.0000', '0.0000', 1, 0),
(4, 3, 2, '0.0000', '0.0000', 1, 0),
(5, 4, 2, '0.0000', '0.0000', 1, 0),
(6, 5, 2, '0.0000', '0.0000', 1, 0),
(7, 6, 2, '0.0000', '0.0000', 1, 0),
(8, 7, 2, '0.0000', '0.0000', 1, 0),
(9, 8, 2, '0.0000', '0.0000', 1, 0),
(10, 9, 2, '0.0000', '0.0000', 1, 0),
(11, 10, 2, '0.0000', '0.0000', 1, 0),
(12, 11, 2, '0.0000', '0.0000', 1, 0),
(13, 12, 2, '0.0000', '0.0000', 1, 0),
(14, 13, 2, '0.0000', '0.0000', 1, 0),
(15, 14, 2, '0.0000', '0.0000', 1, 0),
(16, 15, 2, '0.0000', '0.0000', 1, 0),
(17, 16, 2, '0.0000', '0.0000', 1, 0),
(18, 17, 2, '0.0000', '0.0000', 1, 0),
(19, 18, 2, '0.0000', '0.0000', 1, 0),
(20, 19, 2, '0.0000', '0.0000', 1, 0),
(21, 20, 2, '0.0000', '0.0000', 1, 0),
(22, 21, 2, '0.0000', '0.0000', 1, 0),
(23, 22, 2, '0.0000', '0.0000', 1, 0),
(24, 23, 2, '0.0000', '0.0000', 1, 0),
(25, 24, 2, '0.0000', '0.0000', 1, 0),
(26, 25, 2, '0.0000', '0.0000', 1, 0),
(27, 1, 3, '0.0000', '0.0000', 1, 0),
(28, 26, 2, '0.0000', '0.0000', 1, 0),
(29, 27, 2, '0.0000', '0.0000', 1, 0),
(30, 28, 2, '0.0000', '0.0000', 1, 0),
(31, 29, 2, '0.0000', '0.0000', 1, 0),
(32, 30, 2, '0.0000', '0.0000', 1, 0),
(33, 31, 2, '0.0000', '0.0000', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_transactions`
--

CREATE TABLE `customer_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('purchase','add_balance','substract_balance','due_paid','others') NOT NULL,
  `reference_no` varchar(55) DEFAULT NULL,
  `ref_invoice_id` varchar(55) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `pmethod_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `balance` decimal(25,4) DEFAULT 0.0000,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `returnable` enum('no','yes') NOT NULL DEFAULT 'no',
  `note` longtext NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categorys`
--

CREATE TABLE `expense_categorys` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(60) NOT NULL,
  `category_slug` varchar(60) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `category_details` longtext DEFAULT NULL,
  `sell_return` tinyint(1) NOT NULL DEFAULT 0,
  `sell_delete` tinyint(1) NOT NULL DEFAULT 0,
  `loan_delete` tinyint(1) NOT NULL DEFAULT 0,
  `loan_payment` tinyint(1) NOT NULL DEFAULT 0,
  `giftcard_sell_delete` tinyint(1) NOT NULL DEFAULT 0,
  `topup_delete` tinyint(1) NOT NULL DEFAULT 0,
  `product_purchase` tinyint(1) NOT NULL DEFAULT 0,
  `stock_transfer` tinyint(1) NOT NULL DEFAULT 0,
  `due_paid` tinyint(1) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `expense_categorys`
--

INSERT INTO `expense_categorys` (`category_id`, `category_name`, `category_slug`, `parent_id`, `category_details`, `sell_return`, `sell_delete`, `loan_delete`, `loan_payment`, `giftcard_sell_delete`, `topup_delete`, `product_purchase`, `stock_transfer`, `due_paid`, `status`, `is_hide`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Employee Salary', 'employee_salary', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:21:53', '2019-07-02 12:08:08'),
(2, 'Showroom Rent', 'showroom_rent', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:22:13', '2019-07-02 12:08:10'),
(3, 'Electricity Bill + Dish', 'electricity_bill_+_dish', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:22:29', '2019-07-02 12:08:12'),
(4, 'Advertisements', 'advertisements', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:23:16', '2019-07-02 12:08:16'),
(5, 'Bonous', 'bonous', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:23:52', '2019-07-02 12:08:18'),
(6, 'Others', 'others', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:24:23', '2019-07-02 12:08:19'),
(7, 'Returnable', 'returnable', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-03-02 05:58:46', '2019-07-02 12:08:21'),
(8, 'Sell Return', 'sell_return', 0, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2019-03-06 07:35:14', '2019-07-02 12:08:28'),
(9, 'Product Purchase', 'product_purchase', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, '2019-03-06 07:35:38', '2019-07-02 12:08:30'),
(10, 'Sell Delete', 'sell_delete', 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2019-03-06 09:54:14', '2019-07-02 12:08:34'),
(11, 'Loan Delete', 'loan_delete', 0, '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2019-03-06 07:02:41', '2019-07-02 12:08:36'),
(12, 'Giftcard Topup Delete', 'giftcard_topup_delete', 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, '2019-03-07 12:54:16', '2019-07-02 12:08:38'),
(13, 'Giftcard Sell Delete', 'giftcard_sell_delete', 0, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, '2019-03-07 13:03:24', '2019-07-02 12:08:41'),
(14, 'Loan Payment', 'loan_payment', 0, '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2019-03-08 06:43:35', '2019-07-02 12:08:43'),
(15, 'Due Paid to Supplier', 'due_paid_to_supplier', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, '2019-03-08 06:43:35', '2019-07-02 12:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` datetime DEFAULT NULL,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_topups`
--

CREATE TABLE `gift_card_topups` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` datetime DEFAULT NULL,
  `card_id` varchar(20) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(60) NOT NULL,
  `group_slug` varchar(60) NOT NULL,
  `college_id` int(11) DEFAULT NULL,
  `group_details` text DEFAULT NULL,
  `group_image` varchar(250) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holding_info`
--

CREATE TABLE `holding_info` (
  `info_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `order_title` varchar(255) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `invoice_note` text DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holding_item`
--

CREATE TABLE `holding_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `item_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `item_name` varchar(100) NOT NULL,
  `item_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_discount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('inclusive','exclusive') NOT NULL DEFAULT 'exclusive',
  `taxrate_id` int(10) UNSIGNED NOT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` int(10) UNSIGNED NOT NULL,
  `item_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holding_price`
--

CREATE TABLE `holding_price` (
  `price_id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `subtotal` decimal(25,4) DEFAULT 0.0000,
  `discount_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `order_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `others_charge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable_amount` decimal(25,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_sources`
--

CREATE TABLE `income_sources` (
  `source_id` int(10) UNSIGNED NOT NULL,
  `source_name` varchar(60) NOT NULL,
  `type` enum('credit','debit') NOT NULL DEFAULT 'credit',
  `source_slug` varchar(60) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `source_details` longtext DEFAULT NULL,
  `for_sell` tinyint(1) NOT NULL DEFAULT 0,
  `for_purchase_return` tinyint(1) NOT NULL DEFAULT 0,
  `for_due_collection` tinyint(1) NOT NULL DEFAULT 0,
  `for_loan` tinyint(1) NOT NULL DEFAULT 0,
  `for_giftcard_sell` tinyint(1) NOT NULL DEFAULT 0,
  `for_topup` tinyint(1) NOT NULL DEFAULT 0,
  `for_stock_transfer` tinyint(1) NOT NULL DEFAULT 0,
  `for_purchase_delete` tinyint(1) NOT NULL DEFAULT 0,
  `for_expense_delete` tinyint(1) NOT NULL DEFAULT 0,
  `profitable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `show_in_income` enum('yes','no') NOT NULL DEFAULT 'yes',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `income_sources`
--

INSERT INTO `income_sources` (`source_id`, `source_name`, `type`, `source_slug`, `parent_id`, `source_details`, `for_sell`, `for_purchase_return`, `for_due_collection`, `for_loan`, `for_giftcard_sell`, `for_topup`, `for_stock_transfer`, `for_purchase_delete`, `for_expense_delete`, `profitable`, `show_in_income`, `status`, `is_hide`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Sell', 'credit', 'sell', 0, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 'yes', 'no', 1, 1, 0, '2019-02-27 04:54:07', '2019-04-29 01:58:28'),
(2, 'Purchase Return', 'credit', 'purchase_return', 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2019-02-27 05:17:43', '2019-04-29 01:58:31'),
(3, 'Due Collection', 'credit', 'due_collection', 0, '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 'yes', 'no', 1, 1, 0, '2019-03-01 08:04:58', '2019-04-29 01:58:34'),
(4, 'Others', 'credit', 'others', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'yes', 'yes', 1, 1, 0, '2019-02-17 06:22:46', '2019-07-02 12:11:05'),
(5, 'Loan Taken', 'credit', 'loan_taken', 0, '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2019-03-06 06:04:54', '2019-07-02 12:11:08'),
(6, 'Giftcard Sell', 'credit', 'giftcard_sell', 0, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2019-03-07 12:53:43', '2019-07-02 12:11:11'),
(7, 'Giftcard Topup', 'credit', 'giftcard_topup', 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2019-03-07 12:53:55', '2019-07-02 12:11:14'),
(8, 'Stock Transfer', 'credit', 'stock_transfer', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 0, 'no', 'yes', 1, 1, 0, '2019-03-08 04:14:39', '2019-07-02 12:11:17'),
(9, 'Purchase Delete', 'credit', 'purchase_delete', 0, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 'no', 'yes', 1, 1, 0, '2019-03-08 04:14:39', '2019-07-02 12:11:19'),
(10, 'Expense Delete', 'credit', 'expense_delete', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 'no', 'yes', 1, 1, 0, '2019-03-08 04:14:39', '2019-07-02 12:11:22');

-- --------------------------------------------------------

--
-- Table structure for table `installment_orders`
--

CREATE TABLE `installment_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `duration` int(11) NOT NULL,
  `interval_count` int(11) NOT NULL,
  `installment_count` int(11) NOT NULL,
  `interest_percentage` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `interest_amount` decimal(25,2) NOT NULL DEFAULT 0.00,
  `initial_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payment_status` enum('paid','due') NOT NULL DEFAULT 'due',
  `last_installment_date` datetime DEFAULT NULL,
  `installment_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installment_payments`
--

CREATE TABLE `installment_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `pmethod_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `capital` decimal(25,4) NOT NULL,
  `interest` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payment_status` enum('paid','due','pending','cancel') NOT NULL DEFAULT 'due'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `slug`, `code`, `status`) VALUES
(1, 'Spanish', 'spanish', 'es', 1),
(2, 'English', 'english', 'en', 0),
(3, 'Bangla', 'bangla', 'bn', 0),
(4, 'Hindi', 'hindi', 'hi', 0),
(5, 'French', 'french', 'fr', 0),
(6, 'Germany', 'Germany', 'de', 0);

-- --------------------------------------------------------

--
-- Table structure for table `language_translations`
--

CREATE TABLE `language_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `lang_key` varchar(100) NOT NULL,
  `key_type` enum('specific','default') NOT NULL DEFAULT 'specific',
  `lang_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `language_translations`
--

INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(1, 1, 'title_language_translation', 'specific', 'TRADUCCION'),
(2, 1, 'text_english', 'specific', 'Ingles'),
(3, 1, 'text_arabic', 'specific', 'Arabe'),
(4, 1, 'text_bangla', 'specific', 'Bangladesh'),
(5, 1, 'text_hindi', 'specific', 'Hindi'),
(6, 1, 'text_french', 'specific', 'Frances'),
(7, 1, 'text_Germany', 'specific', 'Aleman'),
(8, 1, 'text_spanish', 'specific', 'Español'),
(9, 1, 'text_pos', 'specific', 'DAS'),
(10, 1, 'menu_pos', 'specific', 'DAS'),
(11, 1, 'text_cashbook_report', 'specific', 'Informe de caja'),
(12, 1, 'menu_cashbook', 'specific', 'Libro De Pago'),
(13, 1, 'text_invoice', 'specific', 'Factura'),
(14, 1, 'menu_invoice', 'specific', 'Factura'),
(15, 1, 'text_user_preference', 'specific', 'Preferencia de usuario'),
(16, 1, 'text_settings', 'specific', 'Configuraciones'),
(17, 1, 'text_stock_alert', 'specific', 'Alerta de stock'),
(18, 1, 'text_itsolution24', 'specific', 'Expira'),
(19, 1, 'text_fullscreen', 'specific', 'Maximizar'),
(20, 1, 'text_reports', 'specific', 'Reportes'),
(21, 1, 'text_lockscreen', 'specific', 'Bloquear pantalla'),
(22, 1, 'text_logout', 'specific', 'Cerrar sesion'),
(23, 1, 'menu_dashboard', 'specific', 'Inicio'),
(24, 1, 'menu_point_of_sell', 'specific', 'DAS'),
(25, 1, 'menu_sell', 'specific', 'Ventas'),
(26, 1, 'menu_sell_list', 'specific', 'Listas Ventas'),
(27, 1, 'menu_return_list', 'specific', 'Lista Devueltos'),
(28, 1, 'menu_sell_log', 'specific', 'Pedidos'),
(29, 1, 'menu_giftcard', 'specific', 'Tarjeta Regalo'),
(30, 1, 'menu_add_giftcard', 'specific', 'Agregar Tarjeta Regalo'),
(31, 1, 'menu_giftcard_list', 'specific', 'Lista Tarjeta Regalo'),
(32, 1, 'menu_giftcard_topup', 'specific', 'Tarjeta De Regalo'),
(33, 1, 'menu_quotation', 'specific', 'Cotización'),
(34, 1, 'menu_add_quotation', 'specific', 'Agregar Cotizacion'),
(35, 1, 'menu_quotation_list', 'specific', 'Lista De Cotizaciones'),
(36, 1, 'menu_installment', 'specific', 'Pagos'),
(37, 1, 'menu_installment_list', 'specific', 'Lista De Cuotas'),
(38, 1, 'menu_payment_list', 'specific', 'Lista De Pagos'),
(39, 1, 'menu_payment_due_today', 'specific', 'Pago Debido Hoy'),
(40, 1, 'menu_payment_due_all', 'specific', 'Pago Debido A Todos'),
(41, 1, 'menu_payment_due_expired', 'specific', 'Pago Por Exp.'),
(42, 1, 'menu_overview_report', 'specific', 'Informe General'),
(43, 1, 'menu_purchase', 'specific', 'Compra'),
(44, 1, 'menu_add_purchase', 'specific', 'Agregar Compra'),
(45, 1, 'menu_purchase_list', 'specific', 'Lista De Compras'),
(46, 1, 'menu_due_invoice', 'specific', 'Factura Debida'),
(47, 1, 'menu_purchase_logs', 'specific', 'Registros Compras'),
(48, 1, 'menu_transfer', 'specific', 'Transferir Stock'),
(49, 1, 'menu_add_transfer', 'specific', 'Agregar Transferencia'),
(50, 1, 'menu_transfer_list', 'specific', 'Lista De Transferencia'),
(51, 1, 'menu_receive_list', 'specific', 'Recibir Lista'),
(52, 1, 'menu_product', 'specific', 'Producto'),
(53, 1, 'menu_product_list', 'specific', 'Lista De Productos'),
(54, 1, 'menu_add_product', 'specific', 'Agregar Producto'),
(55, 1, 'menu_barcode_print', 'specific', 'Código De Barras'),
(56, 1, 'menu_category', 'specific', 'Lista De Categoría'),
(57, 1, 'menu_add_category', 'specific', 'Agregar Categoría'),
(58, 1, 'menu_product_import', 'specific', 'Importación (.Xls)'),
(59, 1, 'menu_stock_alert', 'specific', 'Alerta De Stock'),
(60, 1, 'menu_customer', 'specific', 'Cliente'),
(61, 1, 'menu_add_customer', 'specific', 'Agregar Cliente'),
(62, 1, 'menu_customer_list', 'specific', 'Lista De Clientes'),
(63, 1, 'menu_statements', 'specific', 'Declaraciones'),
(64, 1, 'menu_supplier', 'specific', 'Proveedor'),
(65, 1, 'menu_add_supplier', 'specific', 'Agregar Proveedor'),
(66, 1, 'menu_supplier_list', 'specific', 'Lista De Proveedores'),
(67, 1, 'menu_accounting', 'specific', 'Contabilidad'),
(68, 1, 'menu_new_deposit', 'specific', 'Depositar'),
(69, 1, 'menu_new_withdraw', 'specific', 'Retirar'),
(70, 1, 'menu_list_transactions', 'specific', 'Lista Transacciones'),
(71, 1, 'menu_new_transfer', 'specific', 'Agregar Transferencia'),
(72, 1, 'menu_list_transfer', 'specific', 'Lista De Transferencia'),
(73, 1, 'menu_add_bank_account', 'specific', 'Agregar Cuenta Bancaria'),
(74, 1, 'menu_bank_accounts', 'specific', 'Lista De Cuentas Bancarias'),
(75, 1, 'menu_income_source', 'specific', 'Fuente De Ingresos'),
(76, 1, 'menu_balance_sheet', 'specific', 'Hoja De Balance'),
(77, 1, 'menu_income_monthwise', 'specific', 'Ingresos Meses'),
(78, 1, 'menu_expense_monthwise', 'specific', 'Gastos Meses'),
(79, 1, 'menu_income_and_expense', 'specific', 'Ingresos Vs Gastos'),
(80, 1, 'menu_profit_and_loss', 'specific', 'Ganacias Vs Perdidas'),
(81, 1, 'menu_expenditure', 'specific', 'Gasto'),
(82, 1, 'menu_create_expense', 'specific', 'Agregar Gastos'),
(83, 1, 'menu_expense_list', 'specific', 'Lista De Gastos'),
(84, 1, 'menu_summary', 'specific', 'Resumen'),
(85, 1, 'menu_loan_manager', 'specific', 'Prestamo'),
(86, 1, 'menu_loan_list', 'specific', 'Lista De Prestamos'),
(87, 1, 'menu_take_loan', 'specific', 'Tomar Prestamo'),
(88, 1, 'menu_loan_summary', 'specific', 'Resumen'),
(89, 1, 'menu_reports', 'specific', 'Reportes'),
(90, 1, 'menu_report_overview', 'specific', 'Informe General'),
(91, 1, 'menu_report_collection', 'specific', 'Informe Recoleccion'),
(92, 1, 'menu_report_due_collection', 'specific', 'Informe Recoleccion Debido'),
(93, 1, 'menu_report_due_paid', 'specific', 'Informe Pagos Debido'),
(94, 1, 'menu_sell_report', 'specific', 'Informe De Venta'),
(95, 1, 'menu_purchase_report', 'specific', 'Informe De Compra'),
(96, 1, 'menu_sell_payment_report', 'specific', 'Informe Pago De Venta'),
(97, 1, 'menu_purchase_payment_report', 'specific', 'Informe Pago De Compra'),
(98, 1, 'menu_tax_report', 'specific', 'Informe De Impuestos'),
(99, 1, 'menu_purchase_tax_report', 'specific', 'Informe Impuestos Sobre Compras'),
(100, 1, 'menu_tax_overview_report', 'specific', 'Informe General De Impuestos'),
(101, 1, 'menu_report_stock', 'specific', 'Informe De Stock'),
(102, 1, 'menu_analytics', 'specific', 'Analitica'),
(103, 1, 'menu_sms', 'specific', 'Sms'),
(104, 1, 'menu_send_sms', 'specific', 'Enviar Sms'),
(105, 1, 'menu_sms_report', 'specific', 'Informe Sms'),
(106, 1, 'menu_sms_setting', 'specific', 'Configuración De Sms'),
(107, 1, 'menu_user', 'specific', 'Usuario'),
(108, 1, 'menu_add_user', 'specific', 'Agregar Usuario'),
(109, 1, 'menu_user_list', 'specific', 'Lista Usuario'),
(110, 1, 'menu_add_usergroup', 'specific', 'Agregar Grupo De Usuarios'),
(111, 1, 'menu_usergroup_list', 'specific', 'Lista Grupo De Usuarios'),
(112, 1, 'menu_password', 'specific', 'Contraseña'),
(113, 1, 'menu_filemanager', 'specific', 'Archivos'),
(114, 1, 'menu_system', 'specific', 'Configuraciones'),
(115, 1, 'menu_store', 'specific', 'SUCURSAL'),
(116, 1, 'menu_create_store', 'specific', 'Crear Sucursal'),
(117, 1, 'menu_store_list', 'specific', 'Lista Sucursal'),
(118, 1, 'menu_store_setting', 'specific', 'Ajuste De La Sucursal'),
(119, 1, 'menu_receipt_template', 'specific', 'Plantilla De Recibo'),
(120, 1, 'menu_user_preference', 'specific', 'Preferencia De Usuario'),
(121, 1, 'menu_brand', 'specific', 'Marca'),
(122, 1, 'menu_add_brand', 'specific', 'Agregar Marca'),
(123, 1, 'menu_brand_list', 'specific', 'Lista Marca'),
(124, 1, 'menu_currency', 'specific', 'Moneda'),
(125, 1, 'menu_pmethod', 'specific', 'Metodo De Pago'),
(126, 1, 'menu_unit', 'specific', 'Unidad'),
(127, 1, 'menu_taxrate', 'specific', 'Tasa De Impuesto'),
(128, 1, 'menu_box', 'specific', 'Caja'),
(129, 1, 'menu_printer', 'specific', 'Impresora'),
(130, 1, 'menu_language', 'specific', 'Lenguaje'),
(131, 1, 'menu_backup_restore', 'specific', 'Copia De Seguridad'),
(132, 1, 'menu_data_reset', 'specific', 'Resetear Datos'),
(133, 1, 'menu_store_change', 'specific', 'Cambio De Sucursal'),
(134, 1, 'text_language_translation_title', 'specific', 'TRADUCCION LENGUAJE'),
(135, 1, 'text_dashboard', 'specific', 'Tableros'),
(136, 1, 'text_translations', 'specific', 'TRADUCCION'),
(137, 1, 'button_add_new_language', 'specific', 'AGREGAR LENGUAJE'),
(138, 1, 'button_edit', 'specific', 'EDITAR'),
(139, 1, 'button_delete', 'specific', 'BORRAR'),
(140, 1, 'button_default', 'specific', 'POR DEFECTO'),
(141, 1, 'button_dublicate_entry', 'specific', 'DUPLICAR'),
(142, 1, 'button_empty_value', 'specific', 'VACIO'),
(143, 1, 'label_key', 'specific', 'Clave'),
(144, 1, 'label_value', 'specific', 'Valor'),
(145, 1, 'label_translate', 'specific', 'Traducir'),
(146, 1, 'label_delete', 'specific', 'Borrar'),
(147, 1, 'placeholder_search_here', 'specific', 'BUSCAR AQUI'),
(148, 1, 'text_version', 'specific', 'VERSION'),
(149, 1, 'button_today', 'specific', 'HOY'),
(150, 1, 'button_last_7_days', 'specific', 'ULTIMOS 7 DIAS'),
(151, 1, 'button_last_30_days', 'specific', 'ULTIMOS 30 DIAS'),
(152, 1, 'button_last_365_days', 'specific', 'ULTIMO AÑO'),
(153, 1, 'button_filter', 'specific', 'FILTRAR'),
(154, 1, 'button_translate', 'specific', 'TRADUCIR'),
(155, 1, 'title_dashboard', 'specific', 'TABLEROS'),
(156, 1, 'button_pos', 'specific', 'DAS'),
(157, 1, 'button_sell_list', 'specific', 'LISTA VENTAS'),
(158, 1, 'button_overview_report', 'specific', 'REPORTES GENERAL'),
(159, 1, 'button_sell_report', 'specific', 'REPORTE VENTAS'),
(160, 1, 'button_purchase_report', 'specific', 'REPORTE COMPRA'),
(161, 1, 'button_stock_alert', 'specific', 'REPORTE ALERTA STOCK'),
(162, 1, 'button_expired_alert', 'specific', 'REPORTE ALERTA EXPERADOS'),
(163, 1, 'button_backup_restore', 'specific', 'RESTAURAR BACKUP'),
(164, 1, 'button_stores', 'specific', 'SUCURSALES'),
(165, 1, 'text_total_invoice', 'specific', 'FACTURA TOTAL'),
(166, 1, 'text_total_invoice_today', 'specific', 'FACTURA TOTAL HOY'),
(167, 1, 'text_details', 'specific', 'DETALLES'),
(168, 1, 'text_total_customer', 'specific', 'CLIENTE'),
(169, 1, 'text_total_customer_today', 'specific', 'CLIENTE HOY'),
(170, 1, 'text_total_supplier', 'specific', 'TOTAL PROVEEDORES'),
(171, 1, 'text_total_supplier_today', 'specific', 'TOTAL PROVEEDORES HOY'),
(172, 1, 'text_total_product', 'specific', 'TOTAL PRODUCTOS'),
(173, 1, 'text_total_product_today', 'specific', 'TOTAL PRODUCTOS HOY'),
(174, 1, 'text_recent_activities', 'specific', 'ACTIVIDADES RECIENTES'),
(175, 1, 'text_sales', 'specific', 'VENTAS'),
(176, 1, 'text_quotations', 'specific', 'CONTIZACIONES'),
(177, 1, 'text_purchases', 'specific', 'COMPRAS'),
(178, 1, 'text_transfers', 'specific', 'TRANSFERENCIAS'),
(179, 1, 'text_customers', 'specific', 'CLIENTES'),
(180, 1, 'text_suppliers', 'specific', 'PROVEEDORES'),
(181, 1, 'label_invoice_id', 'specific', 'Id Factura'),
(182, 1, 'label_created_at', 'specific', 'Creado El'),
(183, 1, 'label_customer_name', 'specific', 'Nombre Cliente'),
(184, 1, 'label_amount', 'specific', 'Cantidad'),
(185, 1, 'label_payment_status', 'specific', 'Estado Pago'),
(186, 1, 'button_add_sales', 'specific', 'AGREGAR VENTAS'),
(187, 1, 'button_list_sales', 'specific', 'LISTA VENTAS'),
(188, 1, 'text_sales_amount', 'specific', 'CANTIDAD VENTA'),
(189, 1, 'text_discount_given', 'specific', 'DESCUENTO'),
(190, 1, 'text_due_given', 'specific', 'DEBIDO'),
(191, 1, 'text_received_amount', 'specific', 'CANTIDAD RECIBIDA'),
(192, 1, 'label_date', 'specific', 'Fecha'),
(193, 1, 'label_reference_no', 'specific', 'Nro Referencia'),
(194, 1, 'label_customer', 'specific', 'Cliente'),
(195, 1, 'label_status', 'specific', 'Estado'),
(196, 1, 'button_add_quotations', 'specific', 'AGREGAR COTIZACION'),
(197, 1, 'button_list_quotations', 'specific', 'LISTA COTIZACION'),
(198, 1, 'label_supplier_name', 'specific', 'Nombre Proveedor'),
(199, 1, 'button_add_purchases', 'specific', 'AGREGAR COMPRAS'),
(200, 1, 'button_list_purchases', 'specific', 'LISTA COMPRAS'),
(201, 1, 'label_from', 'specific', 'De'),
(202, 1, 'label_to', 'specific', 'A'),
(203, 1, 'label_quantity', 'specific', 'Cantidad'),
(204, 1, 'button_add_transfers', 'specific', 'AGREGAR TRANSFERENCIA'),
(205, 1, 'button_list_transfers', 'specific', 'LISTA TRANSFERENCIA'),
(206, 1, 'label_phone', 'specific', 'Teléfono'),
(207, 1, 'label_email', 'specific', 'Email'),
(208, 1, 'label_address', 'specific', 'Direccion'),
(209, 1, 'button_add_customer', 'specific', 'CLIENTE'),
(210, 1, 'button_list_customers', 'specific', 'CLIENTES'),
(211, 1, 'button_add_supplier', 'specific', 'PROVEEDOR'),
(212, 1, 'button_list_suppliers', 'specific', 'PROVEEDORES'),
(213, 1, 'text_deposit_today', 'specific', 'DEPOSITADO HOY'),
(214, 1, 'text_withdraw_today', 'specific', 'RETIRAR HOY'),
(215, 1, 'text_recent_deposit', 'specific', 'DEPOSITO RECIENTE'),
(216, 1, 'label_description', 'specific', 'Descripcion'),
(217, 1, 'button_view_all', 'specific', 'VER TODO'),
(218, 1, 'text_recent_withdraw', 'specific', 'RETIRO RECIENTE'),
(219, 1, 'title_income_vs_expense', 'specific', 'INGRESO VS GASTO'),
(220, 1, 'text_download_as_jpg', 'specific', 'DESCARGAR IMAGEN'),
(221, 1, 'label_day', 'specific', 'Dia'),
(222, 1, 'text_income', 'specific', 'INGRESOS'),
(223, 1, 'text_expense', 'specific', 'GASTOS'),
(224, 1, 'text_income_vs_expense', 'specific', 'INGRESO VS GASTO'),
(225, 1, 'text_translation_success', 'specific', 'TRADUCCION EXITOSA'),
(226, 1, 'title_pos', 'specific', 'DAS'),
(227, 1, 'text_gift_card', 'specific', 'TARJETA DE REGALO'),
(228, 1, 'button_sell_gift_card', 'specific', 'VENTA TARJETA DE REGALO'),
(229, 1, 'text_keyboard_shortcut', 'specific', 'ATAJOS TECLADO'),
(230, 1, 'text_holding_order', 'specific', 'ORDEN DE ESPERA'),
(231, 1, 'text_search_product', 'specific', 'BUSCAR PRODUCTO'),
(232, 1, 'text_view_all', 'specific', 'VER TODOS'),
(233, 1, 'button_add_product', 'specific', 'AGREGAR PRODUCTO'),
(234, 1, 'button_add_purchase', 'specific', 'AGREGAR  COMPRA'),
(235, 1, 'label_add_to_cart', 'specific', 'Agregar al...'),
(236, 1, 'text_add_note', 'specific', 'AGREGAR NOTA'),
(237, 1, 'label_due', 'specific', 'Debido'),
(238, 1, 'label_product', 'specific', 'Producto'),
(239, 1, 'label_price', 'specific', 'Precio'),
(240, 1, 'label_subtotal', 'specific', 'Sub Total'),
(241, 1, 'label_total_items', 'specific', 'Total Articulos'),
(242, 1, 'label_total', 'specific', 'Total'),
(243, 1, 'label_discount', 'specific', 'Descuento'),
(244, 1, 'label_tax_amount', 'specific', 'Monto Impuesto'),
(245, 1, 'label_shipping_charge', 'specific', 'Costo Envio'),
(246, 1, 'label_others_charge', 'specific', 'Otros Cobros'),
(247, 1, 'label_total_payable', 'specific', 'Total Pago'),
(248, 1, 'button_pay', 'specific', 'PAGA'),
(249, 1, 'button_hold', 'specific', 'PEDIDOS'),
(250, 1, 'text_general', 'specific', 'GENERAL'),
(251, 1, 'text_images', 'specific', 'IMAGENES'),
(252, 1, 'label_serial_no', 'specific', 'Nro Serial'),
(253, 1, 'label_image', 'specific', 'Imagen'),
(254, 1, 'label_url', 'specific', 'Url'),
(255, 1, 'label_sort_order', 'specific', 'Orden De Clasificacion'),
(256, 1, 'label_action', 'specific', 'Accion'),
(257, 1, 'label_thumbnail', 'specific', 'Miniatura'),
(258, 1, 'label_product_type', 'specific', 'Tipo Producto'),
(259, 1, 'text_standard', 'specific', 'STANDARD'),
(260, 1, 'text_service', 'specific', 'SERVICIO'),
(261, 1, 'label_name', 'specific', 'Nombres'),
(262, 1, 'text_product', 'specific', 'PRODUCTO'),
(263, 1, 'label_pcode', 'specific', 'Código'),
(264, 1, 'label_category', 'specific', 'Categoria'),
(265, 1, 'text_select', 'specific', 'SELECCIONAR'),
(266, 1, 'label_supplier', 'specific', 'Proveedor'),
(267, 1, 'label_brand', 'specific', 'Marca'),
(268, 1, 'label_barcode_symbology', 'specific', 'Código De Barra'),
(269, 1, 'label_box', 'specific', 'Caja'),
(270, 1, 'label_expired_date', 'specific', 'Fecha Expira'),
(271, 1, 'label_unit', 'specific', 'Unidad'),
(272, 1, 'label_product_cost', 'specific', 'Costo'),
(273, 1, 'label_product_price', 'specific', 'Precio'),
(274, 1, 'label_product_tax', 'specific', 'Impuesto'),
(275, 1, 'label_tax_method', 'specific', 'Metodo De Impuestos'),
(276, 1, 'text_inclusive', 'specific', 'INCLUSIVO'),
(277, 1, 'text_exclusive', 'specific', 'EXCLUSIVO'),
(278, 1, 'label_store', 'specific', 'Sucursal'),
(279, 1, 'search', 'specific', 'BUSCAR'),
(280, 1, 'label_alert_quantity', 'specific', 'Cantidad De Alerta'),
(281, 1, 'text_active', 'specific', 'ACTIVO'),
(282, 1, 'text_inactive', 'specific', 'INACTIVO'),
(283, 1, 'button_save', 'specific', 'GUARDAR'),
(284, 1, 'button_reset', 'specific', 'LIMPIAR'),
(285, 1, 'title_purchase', 'specific', 'COMPRA'),
(286, 1, 'text_purchase_title', 'specific', 'COMPRAS'),
(287, 1, 'text_add', 'specific', 'AGREGAR'),
(288, 1, 'text_new_purchase_title', 'specific', 'NUEVA COMPRA'),
(289, 1, 'label_note', 'specific', 'Nota'),
(290, 1, 'text_received', 'specific', 'RECIBIDA'),
(291, 1, 'text_pending', 'specific', 'PENDIENTE'),
(292, 1, 'text_ordered', 'specific', 'ORDENADA'),
(293, 1, 'label_attachment', 'specific', 'Archivo Adjunto'),
(294, 1, 'label_add_product', 'specific', 'Agregar Producto'),
(295, 1, 'placeholder_search_product', 'specific', 'BUSCAR PRODUCTO'),
(296, 1, 'label_available', 'specific', 'Disponible'),
(297, 1, 'label_cost', 'specific', 'Costo'),
(298, 1, 'label_sell_price', 'specific', 'Precio Venta'),
(299, 1, 'label_item_tax', 'specific', 'Impuesto Articulo'),
(300, 1, 'label_item_total', 'specific', 'Total Articulo'),
(301, 1, 'label_order_tax', 'specific', 'Orden Impuesto'),
(302, 1, 'label_discount_amount', 'specific', 'Importe Descuento'),
(303, 1, 'label_payable_amount', 'specific', 'Importe A Pagar'),
(304, 1, 'label_payment_method', 'specific', 'Metodo De Pago'),
(305, 1, 'label_paid_amount', 'specific', 'Monto De Pago'),
(306, 1, 'label_due_amount', 'specific', 'Cantidad Debida'),
(307, 1, 'label_change_amount', 'specific', 'Cambiar Cantidad'),
(308, 1, 'button_submit', 'specific', 'ENVIAR'),
(309, 1, 'text_purchase_list_title', 'specific', 'LISTA DE COMPRAS'),
(310, 1, 'button_today_invoice', 'specific', 'FACTURA HOY'),
(311, 1, 'button_all_invoice', 'specific', 'TODAS LAS FACTURAS'),
(312, 1, 'button_due_invoice', 'specific', 'FACTURA DEBIDA'),
(313, 1, 'button_all_due_invoice', 'specific', 'TODAS LAS FACTURAS DEBIDAS'),
(314, 1, 'button_paid_invoice', 'specific', 'FACTURA PAGADA'),
(315, 1, 'button_inactive_invoice', 'specific', 'FACTURA INACTIVA'),
(316, 1, 'label_datetime', 'specific', 'Fecha Y Hora'),
(317, 1, 'label_creator', 'specific', 'Creador'),
(318, 1, 'label_invoice_paid', 'specific', 'Factura Pagada'),
(319, 1, 'label_pay', 'specific', 'Pago'),
(320, 1, 'label_return', 'specific', 'Retorno'),
(321, 1, 'label_view', 'specific', 'Ver'),
(322, 1, 'label_edit', 'specific', 'Editar'),
(323, 1, 'label_credit_balance', 'specific', 'Balance Credito'),
(324, 1, 'label_date_of_birth', 'specific', 'Fecha Nacimiento'),
(325, 1, 'label_sex', 'specific', 'Sexo'),
(326, 1, 'label_male', 'specific', 'Masculino'),
(327, 1, 'label_female', 'specific', 'Femenino'),
(328, 1, 'label_others', 'specific', 'Otros'),
(329, 1, 'label_age', 'specific', 'Edad'),
(330, 1, 'label_city', 'specific', 'Ciudad'),
(331, 1, 'label_state', 'specific', 'Departamento'),
(332, 1, 'label_country', 'specific', 'Pais'),
(333, 1, 'text_redirecting_to_dashbaord', 'specific', 'REDIRIGIENDO A DASHBOARD'),
(334, 1, 'title_product', 'specific', 'PRODUCTO'),
(335, 1, 'text_products', 'specific', 'PRODUCTOS'),
(336, 1, 'text_add_new', 'specific', 'AGREGAR NUEVO'),
(337, 1, 'label_all_product', 'specific', 'Todos Los Productos'),
(338, 1, 'button_trash', 'specific', 'BASURA'),
(339, 1, 'button_bulk', 'specific', 'ABULTAR'),
(340, 1, 'button_delete_all', 'specific', 'ELIMINAR TODOS'),
(341, 1, 'label_stock', 'specific', 'Stock'),
(342, 1, 'label_purchase_price', 'specific', 'Precio Compra'),
(343, 1, 'label_selling_price', 'specific', 'Precio Venta'),
(344, 1, 'label_purchase', 'specific', 'Compra'),
(345, 1, 'label_print_barcode', 'specific', 'Imprimir Codigo De Barra'),
(346, 1, 'text_select_store', 'specific', 'SELECCIONE SUCURSAL'),
(347, 1, 'title_user_preference', 'specific', 'PREFERENCIA DE USUARIO'),
(348, 1, 'text_user_preference_title', 'specific', 'PREFERENCIA DE USUARIO'),
(349, 1, 'text_language_preference_title', 'specific', 'PREFERENCIA DE IDIOMA'),
(350, 1, 'label_select_language', 'specific', 'Seleccionar Lenguaje'),
(351, 1, 'text_color_preference_title', 'specific', 'PREFERENCIA COLOR'),
(352, 1, 'label_base_color', 'specific', 'Color Base'),
(353, 1, 'text_color_black', 'specific', 'COLOR NEGRO'),
(354, 1, 'text_color_blue', 'specific', 'COLOR AZUL'),
(355, 1, 'text_color_green', 'specific', 'COLOR VERDE'),
(356, 1, 'text_color_red', 'specific', 'COLOR ROJO'),
(357, 1, 'text_color_yellow', 'specific', 'COLOR AMARILLO'),
(358, 1, 'text_pos_side_panel_position_title', 'specific', 'POSICION SILDER DAS'),
(359, 1, 'label_pos_side_panel_position', 'specific', 'Posicion Silder Das'),
(360, 1, 'text_right', 'specific', 'DERECHA'),
(361, 1, 'text_left', 'specific', 'IZQUIERDA'),
(362, 1, 'text_pos_pattern_title', 'specific', 'PATRON DAS'),
(363, 1, 'label_select_pos_pattern', 'specific', 'Seleccione Patron Das'),
(364, 1, 'button_update', 'specific', 'ACTUALIZAR'),
(365, 1, 'text_product_created', 'specific', 'CREADA'),
(366, 1, 'button_view', 'specific', 'VER'),
(367, 1, 'button_purchase_product', 'specific', 'COMPRA PRODUCTO'),
(368, 1, 'button_barcode', 'specific', 'CODIGO DE BARRA'),
(369, 1, 'label_card_no', 'specific', 'Nro Tarjeta'),
(370, 1, 'label_giftcard_value', 'specific', 'Valor De Tarjeta De Regalo'),
(371, 1, 'label_balance', 'specific', 'Balance'),
(372, 1, 'label_expiry_date', 'specific', 'Fecha Expira'),
(373, 1, 'button_create_giftcard', 'specific', 'CREAR TARJETA REGALO'),
(374, 1, 'title_stock_alert', 'specific', 'ALERTA STOCK'),
(375, 1, 'text_stock_alert_title', 'specific', 'ALERTA STOCK'),
(376, 1, 'text_stock_alert_box_title', 'specific', 'CUADRO DE ALERTA STOCK'),
(377, 1, 'label_id', 'specific', 'Id'),
(378, 1, 'label_mobile', 'specific', 'Usuario'),
(379, 1, 'error_sell_price_must_be_greated_that_purchase_price', 'specific', 'EL PRECIO DE VENTA DEBE SER MAYOR QUE EL DE COMPRA'),
(380, 1, 'text_success', 'specific', 'Creado con éxito'),
(381, 1, 'text_paid', 'specific', 'Pagada'),
(382, 1, 'button_return', 'specific', 'RETORNAR'),
(383, 1, 'button_view_receipt', 'specific', 'VER RECIBO'),
(384, 1, 'text_order_title', 'specific', 'PEDIDO'),
(385, 1, 'text_order_details', 'specific', 'DETALLES ORDEN'),
(386, 1, 'text_pmethod', 'specific', 'METODO'),
(387, 1, 'button_full_payment', 'specific', 'PAGO COMPLETO'),
(388, 1, 'button_full_due', 'specific', 'DEBIDO COMPLETO'),
(389, 1, 'button_sell_with_installment', 'specific', 'VENDER PLAZOS'),
(390, 1, 'text_pay_amount', 'specific', 'VALOR RECIBIDO'),
(391, 1, 'placeholder_input_an_amount', 'specific', 'INGRESE CANTIDAD'),
(392, 1, 'placeholder_note_here', 'specific', 'NOTA AQUI'),
(393, 1, 'title_installment_details', 'specific', 'DETALLES INSTALACION'),
(394, 1, 'label_duration', 'specific', 'Duracion'),
(395, 1, 'text_days', 'specific', 'DIAS'),
(396, 1, 'label_interval', 'specific', 'Intervalo'),
(397, 1, 'label_total_installment', 'specific', 'Total Dias'),
(398, 1, 'label_interest_percentage', 'specific', 'Porcentaje Interes'),
(399, 1, 'label_interest_amount', 'specific', 'Monto Interes'),
(400, 1, 'label_previous_due', 'specific', 'Debido Anterior'),
(401, 1, 'error_walking_customer_can_not_craete_due', 'specific', 'CLIENTE NORMAL NO PUEDE CREAR DEBIDO'),
(402, 1, 'text_invoice_create_success', 'specific', 'FACTURA CREAR EXITO'),
(403, 1, 'text_update_title', 'specific', '*** ACTUALIZACIÓN ***'),
(404, 1, 'text_product_updated', 'specific', 'PRODUCTO ACTUALIZADO'),
(405, 1, 'title_settings', 'specific', 'AJUSTES'),
(406, 1, 'title_store', 'specific', 'SUCURSAL'),
(407, 1, 'text_pos_setting', 'specific', 'AJUSTES DAS'),
(408, 1, 'text_email_setting', 'specific', 'AJUSTE EMAIL'),
(409, 1, 'text_ftp_setting', 'specific', 'CONFIGURACION FTP'),
(410, 1, 'text_cronjob', 'specific', ''),
(411, 1, 'label_deposit_account', 'specific', 'Cuenta Deposito'),
(412, 1, 'label_code_name', 'specific', 'Código'),
(413, 1, 'label_zip_code', 'specific', 'Código Postal'),
(414, 1, 'label_gst_reg_no', 'specific', 'Reg Nro Gst'),
(415, 1, 'label_vat_reg_no', 'specific', 'Reg Nro Vay'),
(416, 1, 'label_cashier_name', 'specific', 'Nombre Cajero'),
(417, 1, 'label_timezone', 'specific', 'Zona Horaria'),
(418, 1, 'label_invoice_edit_lifespan', 'specific', 'Edicion Factura'),
(419, 1, 'hint_invoice_edit_lifespan', 'specific', 'VIDA UTIL EDICION FACTURA'),
(420, 1, 'text_minute', 'specific', 'MINUTO'),
(421, 1, 'text_second', 'specific', 'SEGUNDO'),
(422, 1, 'label_invoice_delete_lifespan', 'specific', 'Eliminar Factura'),
(423, 1, 'hint_invoice_delete_lifespan', 'specific', 'ELIMINAR  FACTURA'),
(424, 1, 'label_tax', 'specific', 'Impuesto'),
(425, 1, 'hint_tax', 'specific', 'IMPUESTO'),
(426, 1, 'label_sms_gateway', 'specific', 'Sms Gateway'),
(427, 1, 'hint_sms_gateway', 'specific', 'GATEWAY'),
(428, 1, 'label_sms_alert', 'specific', 'Sms Alerta'),
(429, 1, 'hint_sms_alert', 'specific', 'SMS ALERTA'),
(430, 1, 'text_yes', 'specific', 'SI'),
(431, 1, 'text_no', 'specific', 'NO'),
(432, 1, 'label_auto_sms', 'specific', 'Auto Sms '),
(433, 1, 'text_sms_after_creating_invoice', 'specific', 'SMS DESPUES DE CREAR FACTURA'),
(434, 1, 'label_expiration_system', 'specific', 'Sistema De Caducidad'),
(435, 1, 'label_datatable_item_limit', 'specific', 'Limite De Elemento De Tabla De Datos'),
(436, 1, 'hint_datatable_item_limit', 'specific', 'LIMITE DE ELEMENTO DE TABLA DE DATOS'),
(437, 1, 'label_reference_format', 'specific', 'Formato # Factura'),
(438, 1, 'label_sales_reference_prefix', 'specific', 'Prefijo Factura'),
(439, 1, 'label_receipt_template', 'specific', 'Plantilla Recibo'),
(440, 1, 'label_pos_printing', 'specific', 'Imprimir Das'),
(441, 1, 'label_receipt_printer', 'specific', 'Recibo Impresora'),
(442, 1, 'label_auto_print_receipt', 'specific', 'Auto Recibo Impresora'),
(443, 1, 'label_invoice_view', 'specific', 'Ver Factura'),
(444, 1, 'hint_invoice_view', 'specific', 'VER FACTURA'),
(445, 1, 'text_tax_invoice', 'specific', 'IMPUESTO FACTURA'),
(446, 1, 'text_indian_gst', 'specific', 'INDIA'),
(447, 1, 'label_change_item_price_while_billing', 'specific', 'Cambiar Precio Articulo Facturacion'),
(448, 1, 'hint_change_item_price_while_billing', 'specific', 'CAMBIAR EL PRECIO DEL ARTICULO DURANTE FACTURACION'),
(449, 1, 'label_pos_product_display_limit', 'specific', 'Limite Visualizacion Pruducto Pos'),
(450, 1, 'hint_pos_product_display_limit', 'specific', 'LIMITE VISUALIZACION PRUDUCTO POS'),
(451, 1, 'label_after_sell_page', 'specific', 'Despues De La Pagina De Venta'),
(452, 1, 'hint_after_sell_page', 'specific', 'ANTES DE LA PAGINA DE VENTA'),
(453, 1, 'label_invoice_footer_text', 'specific', 'Texto Del Pie De Pagina De Factura'),
(454, 1, 'hint_invoice_footer_text', 'specific', 'TEXTO DEL PIE DE PAGINA DE FACTURA'),
(455, 1, 'label_sound_effect', 'specific', 'Efecto Sonido'),
(456, 1, 'label_email_from', 'specific', 'Email De'),
(457, 1, 'hint_email_from', 'specific', 'EMAIL DE'),
(458, 1, 'label_email_address', 'specific', 'Direccion Email'),
(459, 1, 'hint_email_address', 'specific', 'DIRECCION EMAIL'),
(460, 1, 'label_email_driver', 'specific', 'Driver Email'),
(461, 1, 'hint_email_driver', 'specific', 'DRIVER EMAIL'),
(462, 1, 'label_send_mail_path', 'specific', 'Enviar Ruta Correo'),
(463, 1, 'hint_send_mail_path', 'specific', 'ENVIAR RUTA CORREO'),
(464, 1, 'label_smtp_host', 'specific', 'Host Smtp'),
(465, 1, 'hint_smtp_host', 'specific', 'HOST SMTP'),
(466, 1, 'label_smtp_username', 'specific', 'Usuario Smtp'),
(467, 1, 'hint_smtp_username', 'specific', 'USUARIO SMTP'),
(468, 1, 'label_smtp_password', 'specific', 'Password Smtp'),
(469, 1, 'hint_smtp_password', 'specific', 'PASSWORD SMTP'),
(470, 1, 'label_smtp_port', 'specific', 'Puerto Smtp'),
(471, 1, 'hint_smtp_port', 'specific', 'PUERTO SMTP'),
(472, 1, 'label_ssl_tls', 'specific', 'Ssl Tls'),
(473, 1, 'hint_ssl_tls', 'specific', 'SSL TLS'),
(474, 1, 'label_ftp_hostname', 'specific', 'Nomre Host Ftp'),
(475, 1, 'label_ftp_username', 'specific', 'Usuario Ftp'),
(476, 1, 'label_ftp_password', 'specific', 'Password Ftp'),
(477, 1, 'button_back', 'specific', 'ATRAS'),
(478, 1, 'text_logo', 'specific', 'LOGO'),
(479, 1, 'button_upload', 'specific', 'SUBIR'),
(480, 1, 'text_favicon', 'specific', 'ICONO'),
(481, 1, 'title_invoice', 'specific', 'FACTURA'),
(482, 1, 'text_sell_list_title', 'specific', 'LISTA VENTAS'),
(483, 1, 'text_invoices', 'specific', 'FACTURAS'),
(484, 1, 'title_cashbook', 'specific', 'LIBRO DE PAGO'),
(485, 1, 'text_cashbook_title', 'specific', 'LIBRO DE PAGO'),
(486, 1, 'text_cashbook_details_title', 'specific', 'DETALLES  LIBRO DE PAGO'),
(487, 1, 'text_print', 'specific', 'IMPRIMIR'),
(488, 1, 'label_opening_balance', 'specific', 'Saldo Apertura'),
(489, 1, 'title_income', 'specific', 'INGRESOS'),
(490, 1, 'label_title', 'specific', 'Titulo'),
(491, 1, 'title_expense', 'specific', 'GASTOS'),
(492, 1, 'button_details', 'specific', 'DETALLES'),
(493, 1, 'label_today_income', 'specific', 'Ingreso Hoy'),
(494, 1, 'label_total_income', 'specific', 'Ingresos Totales'),
(495, 1, 'label_today_expense', 'specific', 'Gatos Hoy'),
(496, 1, 'label_cash_in_hand', 'specific', 'Dinero Efectivo'),
(497, 1, 'label_today_closing_balance', 'specific', 'Saldo Final Hoy'),
(498, 1, 'text_opening_balance_update_success', 'specific', 'ACTUALIZACION DE SALDO INICIAL EXITOSA'),
(499, 1, 'title_pmethod', 'specific', 'METODO PAGO'),
(500, 1, 'text_pmethod_title', 'specific', 'METODOS DE PAGO'),
(501, 1, 'text_new_pmethod_title', 'specific', 'NUEVO METODO DE PAGO'),
(502, 1, 'label_details', 'specific', 'Detalles'),
(503, 1, 'text_in_active', 'specific', 'INACTIVO'),
(504, 1, 'text_pmethod_list_title', 'specific', 'LISTA METODO PAGO'),
(505, 1, 'title_unit', 'specific', 'UNIDAD'),
(506, 1, 'text_unit_title', 'specific', 'UNIDAD'),
(507, 1, 'text_new_unit_title', 'specific', 'NUEVA UNIDAD'),
(508, 1, 'label_unit_name', 'specific', 'Nombre Unidad'),
(509, 1, 'label_unit_details', 'specific', 'Detalles Unidad'),
(510, 1, 'text_unit_list_title', 'specific', 'LISTA UNIDAD'),
(511, 1, 'title_filemanager', 'specific', 'ADMINISTRADOR ARCHIVOS'),
(512, 1, 'label_product_name', 'specific', 'Nombre Producto'),
(513, 1, 'title_bank_account_sheet', 'specific', 'HOJA CUENTA BANCARIA'),
(514, 1, 'text_bank_account_sheet_title', 'specific', 'HOJA CUENTA BANCARIA'),
(515, 1, 'text_bank_account_title', 'specific', 'CUENTAS BANCARIAS'),
(516, 1, 'text_bank_account_sheet_list_title', 'specific', 'LISTA  HOJA CUENTA BANCARIA'),
(517, 1, 'label_account_id', 'specific', 'Id Cuenta'),
(518, 1, 'label_account_name', 'specific', 'Nombre Cuenta'),
(519, 1, 'label_credit', 'specific', 'Credito'),
(520, 1, 'label_debit', 'specific', 'Debido'),
(521, 1, 'label_transfer_to_other', 'specific', 'Transferir A Otro'),
(522, 1, 'label_transfer_from_other', 'specific', 'Transferir De Otro'),
(523, 1, 'label_deposit', 'specific', 'Depositar'),
(524, 1, 'label_withdraw', 'specific', 'Retirar'),
(525, 1, 'text_due', 'specific', 'DEBIDA'),
(526, 1, 'title_purchase_return', 'specific', 'DEVOLUCION DE COMPRA'),
(527, 1, 'text_purchase_return_title', 'specific', 'DEVOLUCION DE COMPRA'),
(528, 1, 'text_return_list_title', 'specific', 'LISTA DEVOLUCIONES'),
(529, 1, 'text_purchase_return_list_title', 'specific', 'LISTA DEVOLUCIONES COMPRA'),
(530, 1, 'title_purchase_log', 'specific', 'REGISTROS COMPRAS'),
(531, 1, 'text_purchase_log_title', 'specific', 'REGISTROS COMPRAS'),
(532, 1, 'text_purchase_log_list_title', 'specific', 'LISTA REGISTROS COMPRA'),
(533, 1, 'label_type', 'specific', 'Tipo'),
(534, 1, 'label_pmethod', 'specific', 'Metodo Pago'),
(535, 1, 'label_created_by', 'specific', 'Creado Por'),
(536, 1, 'title_quotation', 'specific', 'COTIZACION'),
(537, 1, 'text_quotation_title', 'specific', 'COTIZACIONES'),
(538, 1, 'text_new_quotation_title', 'specific', 'NUEVA COTIZACION'),
(539, 1, 'text_sent', 'specific', 'EXPEDIDA'),
(540, 1, 'text_complete', 'specific', 'COMPLETAR'),
(541, 1, 'text_all_suppliers', 'specific', 'PROVEEDORES'),
(542, 1, 'text_quotation_list_title', 'specific', 'LISTA COTIZACIONES'),
(543, 1, 'button_all', 'specific', 'TODOS'),
(544, 1, 'button_sent', 'specific', 'EXPEDIDO'),
(545, 1, 'button_pending', 'specific', 'PENDIENTE'),
(546, 1, 'button_complete', 'specific', 'COMPLETO'),
(547, 1, 'label_biller', 'specific', 'Facturador'),
(548, 1, 'title_sell_log', 'specific', 'REGISTROS VENTA'),
(549, 1, 'text_sell_log_title', 'specific', 'REGISTRO VENTAS'),
(550, 1, 'text_sell_title', 'specific', 'VENDER'),
(551, 1, 'text_sell_log_list_title', 'specific', 'LISTA REGISTRO VENTAS'),
(552, 1, 'title_giftcard_topup', 'specific', 'RECARGAR TARJETA REGALO'),
(553, 1, 'text_giftcard_topup_title', 'specific', 'RECARGAR TARJETA REGALO'),
(554, 1, 'text_giftcard_title', 'specific', 'TARJETA REGALO'),
(555, 1, 'text_topup_title', 'specific', 'RECARGAS'),
(556, 1, 'text_giftcard_topup_list_title', 'specific', 'LISTA RECARGAS'),
(557, 1, 'error_order_title', 'specific', 'PEDIDOS'),
(558, 1, 'title_sell_return', 'specific', 'VENTAS DEVUELTAS'),
(559, 1, 'text_sell_return_title', 'specific', 'VENTAS DEVUELTAS'),
(560, 1, 'text_sell_return_list_title', 'specific', 'LISTA VENTAS DEVUELTAS'),
(561, 1, 'label_ref_invoice_Id', 'specific', 'Id Factura Referencia'),
(562, 1, 'label_pmethod_name', 'specific', 'Nombre Metodo Pago'),
(563, 1, 'title_barcode', 'specific', 'CODIGO BARRAS'),
(564, 1, 'text_barcode_title', 'specific', 'CODIGO BARRAS'),
(565, 1, 'text_barcode_generate_title', 'specific', 'GENERAR CODIGO BARRAS'),
(566, 1, 'label_product_name_with_code', 'specific', 'Nombre Producto Con Codigo'),
(567, 1, 'label_page_layout', 'specific', 'Diseño Pagina'),
(568, 1, 'label_fields', 'specific', 'Campos'),
(569, 1, 'button_generate', 'specific', 'GENERAR'),
(570, 1, 'text_category_title', 'specific', 'CATEGORIA'),
(571, 1, 'text_new_category_title', 'specific', 'NUEVA CATEGORIA'),
(572, 1, 'label_category_name', 'specific', 'Nombre Categoria'),
(573, 1, 'label_category_slug', 'specific', 'Slug Categoria'),
(574, 1, 'label_parent', 'specific', 'Parentesco'),
(575, 1, 'label_category_details', 'specific', 'Detalles Categoria'),
(576, 1, 'text_category_list_title', 'specific', 'LISTA CATEGORIAS'),
(577, 1, 'label_total_item', 'specific', 'Total Articulos'),
(578, 1, 'title_import_product', 'specific', 'PRODUCTO IMPORTADO'),
(579, 1, 'text_import_title', 'specific', 'IMPORTAR PRODUCTOS'),
(580, 1, 'text_download_sample_format_file', 'specific', 'DESCARGAR ARCHIVO FORMATO MUESTRA'),
(581, 1, 'button_download', 'specific', 'DESCARGAR'),
(582, 1, 'text_select_xls_file', 'specific', 'SELECCIONA ARCHIVO XLS '),
(583, 1, 'button_import', 'specific', 'IMPORTAR'),
(584, 1, 'title_create_store', 'specific', 'CREAR SUCURSAL'),
(585, 1, 'text_create_store_title', 'specific', 'CREAR SUCURSAL'),
(586, 1, 'text_stores', 'specific', 'SUCURSALES'),
(587, 1, 'text_currency', 'specific', 'MONEDA'),
(588, 1, 'text_payment_method', 'specific', 'METODO PAGO'),
(589, 1, 'text_receipt_template', 'specific', 'PLANTILLA RECIBO'),
(590, 1, 'text_printer', 'specific', 'IMPRESORA'),
(591, 1, 'label_stock_alert_quantity', 'specific', 'Alerta Cantidad Stock'),
(592, 1, 'hint_stock_alert_quantity', 'specific', 'ALERTA CANTIDAD STOCK'),
(593, 1, 'text_store_title', 'specific', 'SUCURSAL'),
(594, 1, 'text_store_list_title', 'specific', 'LISTA SUCURSAL'),
(595, 1, 'button_activated', 'specific', 'ACTIVADA'),
(596, 1, 'title_receipt_template', 'specific', 'PLANTILLA RECIBO'),
(597, 1, 'text_receipt_tempalte_title', 'specific', 'PLANTILLA RECIBOS'),
(598, 1, 'title_pos_setting', 'specific', 'AJUSTES DAS'),
(599, 1, 'text_receipt_tempalte_sub_title', 'specific', 'SUBTITULO PLANTILLA RECIBOS'),
(600, 1, 'button_preview', 'specific', 'VISTA PREVIA'),
(601, 1, 'text_tempalte_content_title', 'specific', 'PLANTILLA CONTENIDO'),
(602, 1, 'text_tempalte_css_title', 'specific', 'PLANTILLA  CSS'),
(603, 1, 'text_template_tags', 'specific', 'PLANTILLA  ETIQUETAS'),
(604, 1, 'text_brand_list_title', 'specific', 'LISTA MARCAS'),
(605, 1, 'text_brand_title', 'specific', 'MARCAS'),
(606, 1, 'text_new_brand_title', 'specific', 'NUEVA MARCAS'),
(607, 1, 'label_total_product', 'specific', 'Total Producto'),
(608, 1, 'button_view_profile', 'specific', 'VER PERFIL'),
(609, 1, 'title_currency', 'specific', 'MONEDA'),
(610, 1, 'text_currency_title', 'specific', 'MONEDA'),
(611, 1, 'text_new_currency_title', 'specific', 'NUEVA MONEDA'),
(612, 1, 'label_code', 'specific', 'Código'),
(613, 1, 'hint_code', 'specific', 'CODIGO'),
(614, 1, 'label_symbol_left', 'specific', 'Simbolo Izquierdo'),
(615, 1, 'hint_symbol_left', 'specific', 'SIMBOLO IZQUIERDO'),
(616, 1, 'label_symbol_right', 'specific', 'Simbolo Derecho'),
(617, 1, 'hint_symbol_right', 'specific', 'SIMBOLO DERECHO'),
(618, 1, 'label_decimal_place', 'specific', 'Total Decimales'),
(619, 1, 'hint_decimal_place', 'specific', 'TOTAL DECIMALES'),
(620, 1, 'text_currency_list_title', 'specific', 'LISTA MONEDAS'),
(621, 1, 'text_enabled', 'specific', 'HABILITADA'),
(622, 1, 'button_activate', 'specific', 'ACTIVAR'),
(623, 1, 'title_taxrate', 'specific', 'TASA IMPUESTO'),
(624, 1, 'text_taxrate_title', 'specific', 'TASA IMPUESTOS'),
(625, 1, 'text_new_taxrate_title', 'specific', 'NUEVO TASA IMPUESTOS'),
(626, 1, 'label_taxrate_name', 'specific', 'Nombre Tasa Impuesto'),
(627, 1, 'label_taxrate', 'specific', 'Tasa Impuesto'),
(628, 1, 'text_taxrate_list_title', 'specific', 'LISTA TASA IMPUESTO'),
(629, 1, 'title_box', 'specific', 'CAJA'),
(630, 1, 'text_box_title', 'specific', 'CAJA'),
(631, 1, 'label_box_name', 'specific', 'Nombre Caja'),
(632, 1, 'label_box_details', 'specific', 'Detalles Caja'),
(633, 1, 'text_box_list_title', 'specific', 'LISTA CAJAS'),
(634, 1, 'title_printer', 'specific', 'IMPRESORA'),
(635, 1, 'text_printer_title', 'specific', 'IMPRESORAS'),
(636, 1, 'text_new_printer_title', 'specific', 'NUEVA IMPRESORA'),
(637, 1, 'label_char_per_line', 'specific', 'Char Por Linea'),
(638, 1, 'label_path', 'specific', 'Direccion'),
(639, 1, 'label_ip_address', 'specific', 'Direccion Ip'),
(640, 1, 'label_port', 'specific', 'Puerto'),
(641, 1, 'text_printer_list_title', 'specific', 'LISTA IMPRESORAS'),
(642, 1, 'title_user', 'specific', 'USUARIO'),
(643, 1, 'text_user_title', 'specific', 'USUARIOS'),
(644, 1, 'text_new_user_title', 'specific', 'NUEVO USUARIO'),
(645, 1, 'label_password', 'specific', 'Contraseña'),
(646, 1, 'label_password_retype', 'specific', 'Repetir Contraseña'),
(647, 1, 'label_group', 'specific', 'Grupo'),
(648, 1, 'hint_group', 'specific', 'GRUPO'),
(649, 1, 'text_user_list_title', 'specific', 'LISTA USUARIO'),
(650, 1, 'label_profile', 'specific', 'Perfil'),
(651, 1, 'title_user_group', 'specific', 'GRUPO USUARIO'),
(652, 1, 'text_group_title', 'specific', 'GRUPO'),
(653, 1, 'text_new_group_title', 'specific', 'NUEVO GRUPO'),
(654, 1, 'label_slug', 'specific', 'Codigo'),
(655, 1, 'text_group_list_title', 'specific', 'LISTA GRUPO'),
(656, 1, 'label_total_user', 'specific', 'Total Usuario'),
(657, 1, 'title_password', 'specific', 'CONTRASEÑA'),
(658, 1, 'text_password_title', 'specific', 'CONTRASEÑA'),
(659, 1, 'text_password_box_title', 'specific', 'CONTRASEÑA'),
(660, 1, 'label_password_user', 'specific', 'Usuario Password '),
(661, 1, 'label_password_new', 'specific', 'Nueva contraseña'),
(662, 1, 'label_password_confirm', 'specific', 'Confirmar Contraseña'),
(663, 1, 'title_send_sms', 'specific', 'ENVIAR SMS'),
(664, 1, 'text_sms_title', 'specific', 'SMS'),
(665, 1, 'text_send_sms', 'specific', 'ENVIAR SMS'),
(666, 1, 'text_send_sms_title', 'specific', 'ENVIAR SMS'),
(667, 1, 'text_single', 'specific', 'INDIVIDUAL'),
(668, 1, 'text_group', 'specific', 'GRUPO'),
(669, 1, 'label_phone_number', 'specific', 'Numero Teléfono'),
(670, 1, 'label_message', 'specific', 'Mensaje'),
(671, 1, 'button_send', 'specific', 'ENVIAR'),
(672, 1, 'label_people_type', 'specific', 'Tipo Persona'),
(673, 1, 'text_all_customer', 'specific', 'TODOS LOS CLIENTES'),
(674, 1, 'text_all_user', 'specific', 'TODOS LOS USUARIOS'),
(675, 1, 'label_people', 'specific', 'Persona'),
(676, 1, 'title_sms_report', 'specific', 'INFORME SMS'),
(677, 1, 'text_sms_report_title', 'specific', 'REPORTE SMS'),
(678, 1, 'text_sms_history_title', 'specific', 'HISTORIA SMS'),
(679, 1, 'text_all', 'specific', 'TODOS'),
(680, 1, 'button_delivered', 'specific', 'ENTREGADO'),
(681, 1, 'button_failed', 'specific', 'HA FALLADO'),
(682, 1, 'label_schedule_at', 'specific', 'Fecha Y Hora'),
(683, 1, 'label_campaign_name', 'specific', 'Nombre Campaña'),
(684, 1, 'label_people_name', 'specific', 'Nombre Persona'),
(685, 1, 'label_mobile_number', 'specific', 'Numero Teléfono'),
(686, 1, 'label_process_status', 'specific', 'Estado Proceso'),
(687, 1, 'label_response_text', 'specific', 'Texto Respuesta'),
(688, 1, 'label_delivered', 'specific', 'Entregada'),
(689, 1, 'label_resend', 'specific', 'Reenviar'),
(690, 1, 'title_sms_setting', 'specific', 'AJUSTES SMS'),
(691, 1, 'text_sms_setting_title', 'specific', 'AJUSTES SMS'),
(692, 1, 'text_sms_setting', 'specific', 'AJUSTES SMS'),
(693, 1, 'text_clickatell', 'specific', 'clickatell'),
(694, 1, 'text_twilio', 'specific', 'twilio'),
(695, 1, 'text_msg91', 'specific', 'msg91'),
(696, 1, 'text_mimsms', 'specific', 'mimsms'),
(697, 1, 'text_onnorokomsms', 'specific', 'onnorokomsms'),
(698, 1, 'label_username', 'specific', 'Usuario'),
(699, 1, 'label_api_key', 'specific', 'Api Key'),
(700, 1, 'label_sender_id', 'specific', 'Id Remitente'),
(701, 1, 'label_auth_key', 'specific', 'Clave Autentificacion'),
(702, 1, 'label_contact', 'specific', 'Contacto'),
(703, 1, 'label_country_code', 'specific', 'Código Pais'),
(704, 1, 'label_api_token', 'specific', 'Api Token'),
(705, 1, 'label_maskname', 'specific', 'Nombre Mascara'),
(706, 1, 'label_optional', 'specific', 'Opcional'),
(707, 1, 'label_campaignname', 'specific', 'Nombre Campaña'),
(708, 1, 'title_analytics', 'specific', 'ANALITICA'),
(709, 1, 'text_analytics_title', 'specific', 'ANALITICA'),
(710, 1, 'text_top_products', 'specific', 'MEJORES PRODUCTOS'),
(711, 1, 'text_top_customers', 'specific', 'MEJORES CLIENTES'),
(712, 1, 'text_top_suppliers', 'specific', 'MEJORES PROVEEDORES'),
(713, 1, 'text_top_brands', 'specific', 'MEJORES MARCAS'),
(714, 1, 'title_customer_analytics', 'specific', 'CLIENTE ANALITICA'),
(715, 1, 'text_birthday_today', 'specific', 'CUMPLEAÑOS HOY'),
(716, 1, 'text_birthday_coming', 'specific', 'FIESTA CUMPLEAÑOS'),
(717, 1, 'label_member_since', 'specific', 'Miembro Desde'),
(718, 1, 'text_not_found', 'specific', 'NO ENCONTRADO'),
(719, 1, 'text_best_customer', 'specific', 'MEJOR CLIENTE'),
(720, 1, 'text_purchase', 'specific', 'COMPRA'),
(721, 1, 'title_login_logs', 'specific', 'REGISTROS LOGIN'),
(722, 1, 'label_ip', 'specific', 'Ip'),
(723, 1, 'label_logged_in', 'specific', 'Conectado'),
(724, 1, 'title_overview', 'specific', 'VISION GENERAL'),
(725, 1, 'text_overview_title', 'specific', 'VISION GENERAL'),
(726, 1, 'text_sell_overview', 'specific', 'RESUMEN VENTAS'),
(727, 1, 'text_purchase_overview', 'specific', 'RESUMEN COMPRAS'),
(728, 1, 'text_title_sells_overview', 'specific', 'RESUMEN VENTAS'),
(729, 1, 'text_invoice_amount', 'specific', 'IMPORTE FACTURA'),
(730, 1, 'text_discount_amount', 'specific', 'IMPORTE DESCUENTO'),
(731, 1, 'text_due_collection', 'specific', 'DEBIDO COBRO'),
(732, 1, 'text_shipping_charge', 'specific', 'COSTO ENVIO'),
(733, 1, 'text_others_charge', 'specific', 'OTROS COBROS'),
(734, 1, 'text_order_tax', 'specific', 'IMPUESTO ORDEN'),
(735, 1, 'text_item_tax', 'specific', 'IMPUESTO ORDEN'),
(736, 1, 'text_total_tax', 'specific', 'TOTAL IMPUESTO '),
(737, 1, 'text_title_purchase_overview', 'specific', 'RESUMEN COMPRA'),
(738, 1, 'text_purchase_amount', 'specific', 'MONTO COMPRA'),
(739, 1, 'text_due_taken', 'specific', 'DEBIDO'),
(740, 1, 'text_due_paid', 'specific', 'DEBIDO PAGADO'),
(741, 1, 'text_total_paid', 'specific', 'TOTAL PAGADO'),
(742, 1, 'text_return_amount', 'specific', 'IMPORTE DEVOLUCION'),
(743, 1, 'title_collection_report', 'specific', 'INFORME RECOLECCION'),
(744, 1, 'text_collection_report_title', 'specific', 'INFORME RECOLECCION'),
(745, 1, 'text_collection_report', 'specific', 'INFORME RECOLECCION'),
(746, 1, 'label_total_inv', 'specific', 'Total Inv'),
(747, 1, 'label_net_amount', 'specific', 'Importe Neto'),
(748, 1, 'label_prev_due_collection', 'specific', 'Debido Coleccion Previo'),
(749, 1, 'label_due_collection', 'specific', 'Debido Coleccion '),
(750, 1, 'label_due_given', 'specific', 'Debido Dado'),
(751, 1, 'label_received', 'specific', 'Recibida'),
(752, 1, 'title_due_collection', 'specific', 'DEBIDO COLECCION'),
(753, 1, 'text_due_collection_title', 'specific', 'DEBIDO COLECCION'),
(754, 1, 'text_due_collection_sub_title', 'specific', 'DEBIDO COLECCION'),
(755, 1, 'title_supplier_due_paid', 'specific', 'DEUDAS PAGADA PROVEEDOR'),
(756, 1, 'text_supplier_due_paid_title', 'specific', 'DEUDAS PAGADA PROVEEDOR'),
(757, 1, 'text_supplier_due_paid_sub_title', 'specific', 'DEUDAS PAGADA PROVEEDOR'),
(758, 1, 'title_sell_report', 'specific', 'INFORME VENTA'),
(759, 1, 'text_selling_report_title', 'specific', 'INFORME VENTA'),
(760, 1, 'text_selling_report_sub_title', 'specific', 'INFORME VENTAS'),
(761, 1, 'button_itemwise', 'specific', 'ARTICULO '),
(762, 1, 'button_categorywise', 'specific', 'CATEGORIA'),
(763, 1, 'button_supplierwise', 'specific', 'PROVEEDOR'),
(764, 1, 'title_loan', 'specific', 'PRESTAMO'),
(765, 1, 'text_loan_title', 'specific', 'PRESTAMO'),
(766, 1, 'text_take_loan_title', 'specific', 'PRESTAMOS'),
(767, 1, 'label_loan_from', 'specific', 'Prestamo De'),
(768, 1, 'label_ref_no', 'specific', 'Nro Ref'),
(769, 1, 'label_interest', 'specific', 'Intereses'),
(770, 1, 'label_payable', 'specific', 'Valor'),
(771, 1, 'label_loan_for', 'specific', 'Prestamo Para'),
(772, 1, 'text_loan_list_title', 'specific', 'LISTA PRESTAMO PARA'),
(773, 1, 'button_paid', 'specific', 'PAGADA'),
(774, 1, 'button_due', 'specific', 'DEBIDA'),
(775, 1, 'label_basic_amount', 'specific', 'Cantidad Basica'),
(776, 1, 'label_paid', 'specific', 'Pagado'),
(777, 1, 'title_loan_summary', 'specific', 'RESUMEN PRESTAMO'),
(778, 1, 'text_loan_summary_title', 'specific', 'RESUMEN PRESTAMO'),
(779, 1, 'text_summary_title', 'specific', 'RESUMEN'),
(780, 1, 'text_total_loan', 'specific', 'TOTAL PRESTAMO'),
(781, 1, 'text_total_due', 'specific', 'TOTAL DEBIDO'),
(782, 1, 'text_recent_payments', 'specific', 'PAGOS RECIENTES'),
(783, 1, 'text_expense_title', 'specific', 'GASTOS'),
(784, 1, 'text_new_expense_title', 'specific', 'NUEVO GASTOS'),
(785, 1, 'label_what_for', 'specific', 'Para Que'),
(786, 1, 'label_returnable', 'specific', 'Retornable'),
(787, 1, 'label_notes', 'specific', 'Notas'),
(788, 1, 'text_expense_list_title', 'specific', 'LISTA GASTOS'),
(789, 1, 'title_expense_category', 'specific', 'CATEGORIA GASTOS'),
(790, 1, 'text_expense_category_title', 'specific', 'CATEGORIA GASTOS'),
(791, 1, 'text_new_expense_category_title', 'specific', 'NUEVO CATEGORIA GASTOS'),
(792, 1, 'title_expense_monthwise', 'specific', 'GASTO MENSUAL'),
(793, 1, 'text_expense_monthwise_title', 'specific', 'GASTO MENSUAL'),
(794, 1, 'label_summary', 'specific', 'Resumen'),
(795, 1, 'label_grand_total', 'specific', 'Gran Total'),
(796, 1, 'label_this_week', 'specific', 'Esta Semana'),
(797, 1, 'label_this_month', 'specific', 'Este Mes'),
(798, 1, 'label_this_year', 'specific', 'Este Año'),
(799, 1, 'label_income_source', 'specific', 'Fuente Ingresos'),
(800, 1, 'label_account', 'specific', 'Cuenta'),
(801, 1, 'label_about', 'specific', 'Acerca De'),
(802, 1, 'label_capital', 'specific', 'Capital'),
(803, 1, 'button_deposit_now', 'specific', 'DEPOSITAR AHORA'),
(804, 1, 'label_exp_category', 'specific', 'Categoria Exp'),
(805, 1, 'button_withdraw_now', 'specific', 'RETIRAR AHORA'),
(806, 1, 'title_bank_transactions', 'specific', 'TRANSACCIONES BANCARIAS'),
(807, 1, 'text_bank_transaction_title', 'specific', 'TRANSACCION BANCARIA'),
(808, 1, 'text_bank_transaction_list_title', 'specific', 'LISTA TRANSACCION BANCARIA'),
(809, 1, 'button_filtering', 'specific', 'FILTRACION'),
(810, 1, 'text_view_all_transactions', 'specific', 'VER TODAS LAS TRANSACCIONES '),
(811, 1, 'button_transfer_now', 'specific', 'TRANSFERIR AHORA'),
(812, 1, 'title_bank_transfer', 'specific', 'TRANSFERENCIA BANCARIA'),
(813, 1, 'text_bank_transfer_title', 'specific', 'TRANSFERENCIA BANCARIA'),
(814, 1, 'text_banking_title', 'specific', 'BANCARIA'),
(815, 1, 'text_list_bank_transfer_title', 'specific', 'LISTA TRANSFERENCIA BANCARIA'),
(816, 1, 'label_from_account', 'specific', 'De La Cuenta'),
(817, 1, 'label_to_account', 'specific', 'A La Cuenta'),
(818, 1, 'title_bank_account', 'specific', 'CUENTA BANCARIA'),
(819, 1, 'text_new_bank_account_title', 'specific', 'NUEVA CUENTA BANCARIA'),
(820, 1, 'label_account_details', 'specific', 'Detalles Cuenta '),
(821, 1, 'label_account_no', 'specific', 'Nro Cuenta'),
(822, 1, 'label_contact_person', 'specific', 'Persona Contacto'),
(823, 1, 'label_internal_banking_url', 'specific', 'Url Banca Interna'),
(824, 1, 'text_bank_account_list_title', 'specific', 'LISTA  CUENTA BANCARIA'),
(825, 1, 'label_account_description', 'specific', 'Descripcion Cuenta '),
(826, 1, 'title_income_source', 'specific', 'FUENTE INGRESOS'),
(827, 1, 'text_income_source_title', 'specific', 'FUENTE INGRESOS'),
(828, 1, 'text_new_income_source_title', 'specific', 'NUEVA FUENTE INGRESOS'),
(829, 1, 'label_source_name', 'specific', 'Nombre Fuente'),
(830, 1, 'label_source_slug', 'specific', 'Slug Fuente'),
(831, 1, 'label_source_details', 'specific', 'Detalles Fuente'),
(832, 1, 'text_income_source_sub_title', 'specific', 'SUB FUENTE INGRESOS'),
(833, 1, 'title_income_monthwise', 'specific', 'INGRESO MENSUAL'),
(834, 1, 'text_income_monthwise_title', 'specific', 'INGRESO MENSUAL'),
(835, 1, 'label_profit', 'specific', 'Ganancia'),
(836, 1, 'title_income_and_expense', 'specific', 'INGRESOS Y GASTOS'),
(837, 1, 'text_income_and_expense_title', 'specific', 'INGRESOS Y GASTOS'),
(838, 1, 'text_date', 'specific', 'FECHA'),
(839, 1, 'label_till_now', 'specific', 'Hasta Ahora'),
(840, 1, 'title_profit_and_loss', 'specific', 'GANANCIA Y PERDIDA'),
(841, 1, 'text_profit_and_loss_title', 'specific', 'GANANCIA Y PERDIDA'),
(842, 1, 'text_profit_and_loss_details_title', 'specific', 'DETALLES GANANCIA Y PERDIDA'),
(843, 1, 'text_loss_title', 'specific', 'PERDIDA'),
(844, 1, 'text_profit_title', 'specific', 'GANANCIA '),
(845, 1, 'title_profit', 'specific', 'GANANCIA '),
(846, 1, 'label_total_profit', 'specific', 'Total Ganancia '),
(847, 1, 'label_total_loss', 'specific', 'Total Perdida'),
(848, 1, 'label_net_profit', 'specific', 'Beneficio Neto'),
(849, 1, 'text_supplier_list_title', 'specific', 'LISTA PROVEEDORES'),
(850, 1, 'text_supplier_title', 'specific', 'PROVEEDORES'),
(851, 1, 'text_new_supplier_title', 'specific', 'NUEVO PROVEEDOR'),
(852, 1, 'text_customer_list_title', 'specific', 'LISTA DE CLIENTE'),
(853, 1, 'text_customer_title', 'specific', 'CLIENTE'),
(854, 1, 'text_new_customer_title', 'specific', 'NUEVO CLIENTE'),
(855, 1, 'label_sell', 'specific', 'Vender'),
(856, 1, 'button_sell', 'specific', 'VENDER'),
(857, 1, 'title_transfer', 'specific', 'TRANSFERIR'),
(858, 1, 'text_stock_transfer_title', 'specific', 'TRANSFERENCIA STOCK'),
(859, 1, 'text_transfer_title', 'specific', 'TRANSFERENCIA ');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(860, 1, 'text_add_transfer_title', 'specific', 'AGREGAR TRANSFERENCIA'),
(861, 1, 'text_stock_list', 'specific', 'LISTA STOCK'),
(862, 1, 'text_invoice_id', 'specific', 'ID FACTURA'),
(863, 1, 'text_stock', 'specific', 'STOCK'),
(864, 1, 'text_transfer_list', 'specific', 'LISTA TRANSFERENCIA'),
(865, 1, 'label_item_name', 'specific', 'Nombre Articulo'),
(866, 1, 'label_transfer_qty', 'specific', 'Cantidad Transferencia'),
(867, 1, 'text_list__transfer__title', 'specific', 'LISTA  TRANSFERENCIA'),
(868, 1, 'label_from_store', 'specific', 'De La Sucursal'),
(869, 1, 'label_to_store', 'specific', 'A La Sucursal'),
(870, 1, 'label_total_quantity', 'specific', 'Total Cantidad'),
(871, 1, 'title_receive', 'specific', 'RECIBIR'),
(872, 1, 'text_stock_receive_title', 'specific', 'RECIBIR STOCK'),
(873, 1, 'text_receive_title', 'specific', 'RECIBIR '),
(874, 1, 'text_list__receive__title', 'specific', 'LISTA RECIBIR'),
(875, 1, 'title_installment', 'specific', 'ENTREGA'),
(876, 1, 'text_installment_title', 'specific', 'ENTREGA'),
(877, 1, 'text_installment_sub_title', 'specific', 'SUB PLAZOS'),
(878, 1, 'button_all_installment', 'specific', 'TODA LA ENTREGA'),
(879, 1, 'button_due_installment', 'specific', 'DEUDA ENTREGA'),
(880, 1, 'button_paid_installment', 'specific', 'PAGO ENTREGA'),
(881, 1, 'label_total_ins', 'specific', 'Total Entrega'),
(882, 1, 'title_installment_payment', 'specific', 'PAGO ENTREGA'),
(883, 1, 'text_installment_payment_title', 'specific', 'PAGO ENTREGA'),
(884, 1, 'text_installment', 'specific', 'ENTREGA'),
(885, 1, 'text_installment_payment_list_title', 'specific', 'LISTA PAGO ENTREGA'),
(886, 1, 'text_all_payment', 'specific', 'TODOS LOS PAGOS'),
(887, 1, 'button_all_payment', 'specific', 'TODOS LOS PAGOS'),
(888, 1, 'button_todays_due_payment', 'specific', 'PAGO VENCIDO HOY'),
(889, 1, 'button_all_due_payment', 'specific', 'TODAS LAS DEUDAS PAGADAS'),
(890, 1, 'button_expired_due_payment', 'specific', 'DEUDAS PAGADAS EXPERIDAS'),
(891, 1, 'label_payment_date', 'specific', 'Fecha Pago'),
(892, 1, 'button_payment', 'specific', 'PAGO'),
(893, 1, 'text_todays_due_payment', 'specific', 'PAGOS DEUDAS HOY'),
(894, 1, 'text_all_due_payment', 'specific', 'TOTAL PAGOS DEUDAS'),
(895, 1, 'text_expired_due_payment', 'specific', 'PAGOS DEUDAS EXPIRADOS'),
(896, 1, 'title_installment_overview', 'specific', 'RESUMEN ENTREGA'),
(897, 1, 'text_installment_overview_title', 'specific', 'RESUMEN ENTREGA'),
(898, 1, 'text_installment_overview', 'specific', 'RESUMEN ENTREGA'),
(899, 1, 'text_invoice_count', 'specific', 'CUENTA FACTURA'),
(900, 1, 'text_sell_amount', 'specific', 'Cantidad Venta'),
(901, 1, 'text_interest_amount', 'specific', 'CANTIDAD INTERES'),
(902, 1, 'text_amount_received', 'specific', 'CANTIDAD  RECIBIDA'),
(903, 1, 'text_amount_due', 'specific', 'CANTIDAD  DEUDA'),
(904, 1, 'title_giftcard', 'specific', 'TARJETA DE REGALO'),
(905, 1, 'text_new_giftcard_title', 'specific', 'NUEVA TARJETA DE REGALO'),
(906, 1, 'text_giftcard_list_title', 'specific', 'LISTA TARJETA DE REGALO'),
(907, 1, 'label_expiry', 'specific', 'Expiracion'),
(908, 1, 'label_topup', 'specific', 'Reposicion'),
(909, 1, 'title_purchase_report', 'specific', 'INFORME COMPRA'),
(910, 1, 'text_purchase_report_title', 'specific', 'INFORME COMPRA'),
(911, 1, 'text_purchase_report_sub_title', 'specific', 'INFORME COMPRA'),
(912, 1, 'title_backup_restore', 'specific', 'RESTAURAR BACKUP'),
(913, 1, 'text_backup_restore_title', 'specific', 'RESTAURAR BACKUP'),
(914, 1, 'text_backup', 'specific', 'BACKUP'),
(915, 1, 'text_restore', 'specific', 'RESTAURAR '),
(916, 1, 'label_databases', 'specific', 'Base De Datos'),
(917, 1, 'label_select_all', 'specific', 'Seleccionar Todo'),
(918, 1, 'label_unselect_all', 'specific', 'Deseleccionar Todo'),
(919, 1, 'button_export', 'specific', 'EXPORTAR'),
(920, 1, 'label_progress', 'specific', 'Progreso'),
(921, 1, 'button_select_sql_file', 'specific', 'SELECCIONAR ARCHIVO SQL'),
(922, 1, 'text_male', 'specific', 'MASCULINO'),
(923, 1, 'text_female', 'specific', 'FEMENINO'),
(924, 1, 'title_tax_overview_report', 'specific', 'INFORME GENERAL IMPUESTO'),
(925, 1, 'text_tax_overview_report_title', 'specific', 'INFORME GENERAL IMPUESTO'),
(926, 1, 'text_sell_tax', 'specific', 'IMPUESTO VENTA'),
(927, 1, 'text_purchase_tax', 'specific', 'IMPUESTO COMPRA'),
(928, 1, 'label_tax_percent', 'specific', 'Porcentaje Impuesto '),
(929, 1, 'label_count', 'specific', 'Contar'),
(930, 1, 'text_login_title', 'specific', 'LOGIN'),
(931, 1, 'title_user_profile', 'specific', 'Perfil del usuario'),
(932, 1, 'text_profile_title', 'specific', 'Perfil'),
(933, 1, 'text_users', 'specific', 'Usuarios'),
(934, 1, 'text_since', 'specific', 'Creado el'),
(935, 1, 'text_contact_information', 'specific', 'Información del contacto'),
(936, 1, 'label_collection', 'specific', 'Colección'),
(937, 1, 'text_sell_report', 'specific', 'Informe de venta'),
(938, 1, 'text_purchase_report', 'specific', 'Informe de compra'),
(939, 1, 'text_payment_report', 'specific', 'Informe de pago'),
(940, 1, 'text_login_log', 'specific', 'Historial de inicio de sesión'),
(941, 1, 'button_collection_report', 'specific', 'Informe de cobranza'),
(942, 1, 'button_log', 'specific', 'Iniciar sesión'),
(943, 1, 'text_invoice_list', 'specific', 'Lista de facturas'),
(944, 1, 'label_items', 'specific', 'Artículos'),
(945, 1, 'label_time', 'specific', 'Hora'),
(946, 1, 'text_update_success', 'specific', 'Actualizado con Éxito!.'),
(947, 1, 'text_permission', 'specific', 'Permiso'),
(948, 1, 'text_quotation_create_success', 'specific', 'Creado con éxito'),
(949, 1, 'button_action', 'specific', 'Acción'),
(950, 1, 'button_create_sell', 'specific', 'Crear Vender'),
(951, 1, 'label_sl', 'specific', 'Sl'),
(952, 1, 'label_unit_price', 'specific', 'Precio Unitario'),
(953, 1, 'label_shipping', 'specific', 'Envío'),
(954, 1, 'label_stamp_and_signature', 'specific', 'Sello Y Firma'),
(955, 1, 'text_stock_register', 'specific', 'Informe de compra'),
(956, 1, 'text_chart', 'specific', 'Gráfico'),
(957, 1, 'label_select', 'specific', 'Seleccione'),
(958, 1, 'label_sold', 'specific', 'Vendido'),
(959, 1, 'title_reset_your_system', 'specific', 'Reinicia tu sistema'),
(960, 1, 'error_insufficient_balance', 'specific', 'Saldo insuficiente'),
(961, 1, 'label_invoice_amount', 'specific', 'Importe De La Factura'),
(962, 1, 'label_customer_mobile', 'specific', 'Cliente Móvil'),
(963, 1, 'label_invoice_note', 'specific', 'Nota De Factura'),
(964, 1, 'text_invoice_title', 'specific', 'Factura'),
(965, 1, 'button_print', 'specific', 'Imprimir'),
(966, 1, 'button_send_email', 'specific', 'Enviar correo electrónico'),
(967, 1, 'button_back_to_pos', 'specific', 'Volver a DAS'),
(968, 1, 'text_order_summary', 'specific', 'Resumen del pedido'),
(969, 1, 'label_previous_due_paid', 'specific', 'Previo / Vencido'),
(970, 1, 'text_return_item', 'specific', 'Devolver objeto'),
(971, 1, 'label_return_quantity', 'specific', 'Cantidad Devuelta'),
(972, 1, 'placeholder_type_any_note', 'specific', 'Nota'),
(973, 1, 'error_select_at_least_one_item', 'specific', 'Seleccione al menos un producto'),
(974, 1, 'error_select_at_least_one_item', 'specific', 'Seleccione al menos un producto'),
(975, 1, 'text_return_success', 'specific', 'Devolucion con exito'),
(976, 1, 'error_quantity_exceed', 'specific', 'Cantidad excedida'),
(977, 1, 'error_unexpected', 'specific', 'Error inesperada'),
(978, 1, 'text_sell_update_success', 'specific', 'Actualizado'),
(979, 1, 'title_customer_profile', 'specific', 'Perfil de cliente'),
(980, 1, 'text_total_purchase', 'specific', 'Compra total'),
(981, 1, 'text_information', 'specific', 'Información'),
(982, 1, 'label_mobile_phone', 'specific', 'Teléfono Móvil'),
(983, 1, 'label_giftcard_taken', 'specific', 'Tarjeta De Regalo Tomada'),
(984, 1, 'button_add_balance', 'specific', 'Agregar saldo'),
(985, 1, 'button_statement', 'specific', 'Declaración'),
(986, 1, 'text_all_invoice', 'specific', 'Toda la factura'),
(987, 1, 'label_prev_due', 'specific', 'Prev. Debido'),
(988, 1, 'text_balance_added', 'specific', 'Saldo agregado exitosamente'),
(989, 1, 'button_substract_balance', 'specific', 'Restar saldo'),
(990, 1, 'text_balance_substracted', 'specific', 'Saldo restado correctamente.'),
(991, 1, 'label_customer_id', 'specific', 'Identificacion'),
(992, 1, 'label_returened_by', 'specific', 'Devuelto Por'),
(993, 1, 'label_total_amount', 'specific', 'Valor Total'),
(994, 1, 'text_return_products', 'specific', 'Productos de devolución'),
(995, 1, 'error_customer', 'specific', 'Datos invalidos'),
(996, 1, 'button_topup', 'specific', 'Recarga'),
(997, 1, 'text_delete_success', 'specific', 'Borrado con Éxito!.'),
(998, 1, 'error_card_no', 'specific', 'error numero trajeta'),
(999, 1, 'error_expiry_date', 'specific', 'Falta fecha vencimiento'),
(1000, 1, 'text_expiry', 'specific', 'Expira'),
(1001, 1, 'button_topup_now', 'specific', 'Recarga ahora'),
(1002, 1, 'text_topup_success', 'specific', 'Recarga exitosa'),
(1003, 1, 'error_amount', 'specific', 'La cantidad no es válida'),
(1004, 1, 'text_topup_delete_success', 'specific', ''),
(1005, 1, 'text_expired', 'specific', 'Caducado'),
(1006, 1, 'menu_sale_list', 'specific', 'Vender Lista'),
(1007, 1, 'menu_expired', 'specific', 'Caducado'),
(1008, 1, 'menu_transaction_list', 'specific', 'Lista Transacciones'),
(1009, 1, 'text_old_dashboard', 'specific', 'Tablero antiguo'),
(1010, 1, 'button_invoice', 'specific', 'Factura'),
(1011, 1, 'text_total_deposit', 'specific', 'Total Deposit'),
(1012, 1, 'text_total_withdraw', 'specific', 'Total Widthdraw'),
(1013, 1, 'text_sells_analytics', 'specific', 'Vender análisis'),
(1014, 1, 'title_language', 'specific', 'Idioma'),
(1015, 1, 'text_language_title', 'specific', 'Idioma'),
(1016, 1, 'text_language_list_title', 'specific', 'Traductor de idiomas'),
(1017, 1, 'text_invoice_sub_title', 'specific', 'Lista de facturas'),
(1018, 1, 'label_invoice_due', 'specific', 'Factura Vencida'),
(1019, 1, 'text_list_transfer_title', 'specific', 'Transfer List'),
(1020, 1, 'text_image', 'specific', 'Imagen'),
(1021, 1, 'error_no_selected', 'specific', 'No seleccionado'),
(1022, 1, 'success_delete_all', 'specific', 'Borrado con Éxito!.'),
(1023, 1, 'text_login', 'specific', 'Iniciar sesión'),
(1024, 1, 'button_sign_in', 'specific', 'Ingresar'),
(1025, 1, 'text_forgot_password', 'specific', '¿Se te olvidó tu contraseña?'),
(1026, 1, 'title_forgot_password', 'specific', 'Se te olvidó tu contraseña'),
(1027, 1, 'text_forgot_password_instruction', 'specific', 'Escriba su correo electrónico. Le enviaremos un enlace, solo siga los pasos.'),
(1028, 1, 'button_close', 'specific', 'Cerrar'),
(1029, 1, 'login_success', 'specific', 'Inicio de sesión exitoso'),
(1030, 1, 'text_box_box_title', 'specific', 'Caja'),
(1031, 1, 'title_edit_store', 'specific', 'Editar Sucursal'),
(1032, 1, 'text_title', 'specific', 'Title'),
(1033, 1, 'label_invoice_prefix', 'specific', 'Prefijo De Invocación'),
(1034, 1, 'label_logo_size', 'specific', 'Tamaño Del Logotipo'),
(1035, 1, 'label_favicon_size', 'specific', 'Tamaño Del Favicon'),
(1036, 1, 'text_event_sms', 'specific', 'SMS de eventos'),
(1037, 1, 'label_sms_for', 'specific', 'Sms Para'),
(1038, 1, 'text_birthday', 'specific', 'Cumpleaños'),
(1039, 1, 'text_sms_list_title', 'specific', 'Lista de SMS'),
(1040, 1, 'text_report_title', 'specific', 'Reporte'),
(1041, 1, 'text_top_product', 'specific', 'Top Product'),
(1042, 1, 'text_others', 'specific', 'Otros'),
(1043, 1, 'text_profit_or_loss', 'specific', 'Ganancia o pérdida'),
(1044, 1, 'label_selling_price_tax', 'specific', 'Impuesto Sobre El Precio De Venta'),
(1045, 1, 'label_sup_name', 'specific', 'Nombre'),
(1046, 1, 'title_sell_payment_report', 'specific', 'Informe de pago de venta'),
(1047, 1, 'text_sell_payment_report_title', 'specific', 'Informe de pago de venta'),
(1048, 1, 'title_purchase_payment_report', 'specific', 'Informe de pago de compra'),
(1049, 1, 'text_purchase_payment_report_title', 'specific', 'Informe de pago de compra'),
(1050, 1, 'title_sell_tax_report', 'specific', 'Informe de impuestos de venta'),
(1051, 1, 'text_sell_tax_report_title', 'specific', 'Informe de impuestos de venta'),
(1052, 1, 'text_product_tax_amount', 'specific', 'Impuesto sobre el producto'),
(1053, 1, 'text_order_tax_amount', 'specific', 'Impuesto de pedido'),
(1054, 1, 'text_tax_report_sub_title', 'specific', 'Informe de impuestos'),
(1055, 1, 'title_purchase_tax_report', 'specific', 'Informe de impuestos sobre compras'),
(1056, 1, 'text_purchase_tax_report_title', 'specific', 'Informe de impuestos sobre compras'),
(1057, 1, 'text_total_tax_amount', 'specific', 'Total Tax'),
(1058, 1, 'text_purchase_tax_report_sub_title', 'specific', 'Informe de impuestos de compra'),
(1059, 1, 'title_stock_report', 'specific', 'Informe de stock'),
(1060, 1, 'text_stock_report_title', 'specific', 'Informe de stock'),
(1061, 1, 'text_stock_report', 'specific', 'Informe de stock'),
(1062, 1, 'supplier_name', 'specific', 'Nombre del proveedor'),
(1063, 1, 'button_disabled', 'specific', 'Discapacitado'),
(1064, 1, 'title_purchase_transaction', 'specific', 'Transacción de compra'),
(1065, 1, 'text_purchase_transaction_title', 'specific', 'Transacción de compra'),
(1066, 1, 'text_transaction_title', 'specific', 'Transaction'),
(1067, 1, 'text_transaction_list_title', 'specific', 'LISTA TRANSACCIONES'),
(1068, 1, 'title_sell_transaction', 'specific', 'Vender transacción'),
(1069, 1, 'text_sell_transaction_title', 'specific', 'Vender transacción'),
(1070, 1, 'text_sell_transaction_list_title', 'specific', 'Vender lista de transacciones'),
(1071, 1, 'text_no_product', 'specific', 'No. Proudct'),
(1072, 1, 'title_category', 'specific', 'Categoría'),
(1073, 1, 'text_product_import_alert', 'specific', 'Alerta de importación de productos'),
(1074, 1, 'text_download', 'specific', 'Descargar'),
(1075, 1, 'title_expired', 'specific', 'Caducado'),
(1076, 1, 'text_expired_title', 'specific', 'Caducado'),
(1077, 1, 'text_expired_box_title', 'specific', 'Caducado'),
(1078, 1, 'button_expired', 'specific', 'Caducado'),
(1079, 1, 'button_expiring_soon', 'specific', 'Próximamente'),
(1080, 1, 'button_purchase_now', 'specific', 'Comprar ahora'),
(1081, 1, 'text_thumbnail', 'specific', 'Thumbnail'),
(1082, 1, 'text_unpaid', 'specific', 'Pendiente'),
(1083, 1, 'error_currency_title', 'specific', 'moneda no es válido'),
(1084, 1, 'error_reference_no', 'specific', 'Numero de referencia. no es válido'),
(1085, 1, 'error_date', 'specific', 'La fecha no es válida'),
(1086, 1, 'error_total_amount', 'specific', 'Total amount is not valid'),
(1087, 1, 'label_purchase_note', 'specific', 'Nota De Compra'),
(1088, 1, 'text_purchase_update_success', 'specific', 'Actualizado exitosamente'),
(1089, 1, 'error_items', 'specific', 'Los artículos no son válidos'),
(1090, 1, 'error_store_id', 'specific', 'La Sucursal no es válida'),
(1091, 1, 'text_transfer_success', 'specific', 'Transferido con éxito'),
(1092, 1, 'button_transfer_edit', 'specific', 'Editar Transferencia'),
(1093, 1, 'text_update_transfer_status_success', 'specific', 'Actualizado exitosamente'),
(1094, 1, 'label_transferred_to', 'specific', 'Transferido A'),
(1095, 1, 'text_product_list', 'specific', 'Lista de productos'),
(1096, 1, 'error_category_name', 'specific', 'El Nombre de la Categoría es Requerido!.'),
(1097, 1, 'error_sup_name', 'specific', 'Suppllier name is not valid'),
(1098, 1, 'error_supplier_email_or_mobile', 'specific', 'El correo electrónico o el móvil no es válido'),
(1099, 1, 'error_sup_address', 'specific', 'La dirección del proveedor no es válida'),
(1100, 1, 'error_unit_name', 'specific', 'Unit name is not valid'),
(1101, 1, 'error_product_name', 'specific', 'El nombre del producto no es válido'),
(1102, 1, 'error_sup_id', 'specific', 'El proveedor no es válido'),
(1103, 1, 'text_product_name', 'specific', 'nombre del producto'),
(1104, 1, 'text_quantity', 'specific', 'Cantidad'),
(1105, 1, 'error_stock', 'specific', 'La cantidad de stock no es válida'),
(1106, 1, 'error_installment_count', 'specific', 'El recuento de cuotas no es válido'),
(1107, 1, 'text_activate_success', 'specific', 'Activado con éxito'),
(1108, 1, 'text_template_content_update_success', 'specific', 'Actualizado exitosamente'),
(1109, 1, 'text_template_css_update_success', 'specific', 'Actualizado exitosamente'),
(1110, 1, 'text_balance_update_success', 'specific', 'Actualizado exitosamente'),
(1111, 1, 'label_source', 'specific', 'Fuente'),
(1112, 1, 'label_slip_no', 'specific', 'Deslizamiento No.'),
(1113, 1, 'label_by', 'specific', 'Por'),
(1114, 1, 'text_deposit_success', 'specific', 'Depósito exitoso'),
(1115, 1, 'text_delete_title', 'specific', '*** PRECAUCIÓN BORRADO DE DATOS ***'),
(1116, 1, 'text_delete_instruction', 'specific', '¿Qué se debe hacer con los datos que pertenecen al registro actual?'),
(1117, 1, 'label_insert_content_to', 'specific', 'Insertar Registros en:'),
(1118, 1, 'button_add_language', 'specific', 'Agregar idioma'),
(1119, 1, 'code', 'specific', 'Código'),
(1120, 1, 'error_code', 'specific', 'El Código es Requerido!.'),
(1121, 1, 'text_uppdate_success', 'specific', 'Actualizado con Éxito!.'),
(1122, 1, 'error_name', 'specific', 'El nombre no es válido'),
(1123, 1, 'text_create_success', 'specific', 'Creado con éxito'),
(1124, 1, 'text_gremany', 'specific', 'Alemania'),
(1125, 1, 'text_amount', 'specific', 'Cantidad'),
(1126, 1, 'title_activity_logs', 'specific', 'Registros de actividad'),
(1127, 1, 'error_disabled_by_default', 'specific', 'Desactivado por defecto'),
(1128, 1, 'button_send_sms', 'specific', 'Enviar SMS'),
(1129, 1, 'button_email', 'specific', 'Correo electrónico'),
(1130, 1, 'error_status', 'specific', 'El estado no es válido'),
(1131, 1, 'error_reference_no_exist', 'specific', 'Árbitro. No. no es válido'),
(1132, 1, 'text_view_invoice_title', 'specific', 'View Invoice Title'),
(1133, 1, 'text_new_dashboard', 'specific', 'Nuevo tablero'),
(1134, 1, 'text_recent_customer_box_title', 'specific', 'Clientes recientes'),
(1135, 1, 'label_vat_number', 'specific', 'Vat Number'),
(1136, 1, 'title_quotation_edit', 'specific', 'Cotización Editar'),
(1137, 1, 'text_quotation_edit_title', 'specific', 'Cotización Editar'),
(1138, 1, 'text_quotation_update_success', 'specific', 'Actualizado exitosamente'),
(1139, 1, 'error_product_not_found', 'specific', 'Producto no encontrado'),
(1140, 1, 'error_invoice_product_type', 'specific', 'El tipo de producto de la factura no es válido'),
(1141, 1, 'label_checkout_status', 'specific', 'Estado De Pago'),
(1142, 1, 'label_sub_total', 'specific', 'Sub Total'),
(1143, 1, 'text_payments', 'specific', 'Pagos'),
(1144, 1, 'button_pay_now', 'specific', 'Pagar ahora'),
(1145, 1, 'text_billing_details', 'specific', 'Detalles de facturación'),
(1146, 1, 'Print Barcode', 'specific', 'undefined'),
(1147, 1, 'error_new_category_name', 'specific', 'Porfavor seleccione una categoría'),
(1148, 1, 'error_customer_name', 'specific', 'El nombre del cliente no es válido'),
(1149, 1, 'error_expired_date_below', 'specific', 'La fecha de vencimiento no es válida'),
(1150, 1, 'label_insert_invoice_to', 'specific', 'Insertar Factura En'),
(1151, 1, 'error_new_customer_name', 'specific', 'Por favor seleccione un cliente'),
(1152, 1, 'button_transaction_list', 'specific', 'LISTA TRANSACCIONES'),
(1153, 1, 'error_code_name', 'specific', 'El nombre del código no es válido'),
(1154, 1, 'title_supplier_profile', 'specific', 'Perfil del proveedor'),
(1155, 1, 'text_supplier_profile_title', 'specific', 'Perfil del proveedor'),
(1156, 1, 'text_supplier_products', 'specific', 'Productos de proveedores'),
(1157, 1, 'button_products', 'specific', 'Productos'),
(1158, 1, 'text_balance_amount', 'specific', 'Balance total'),
(1159, 1, 'text_sells', 'specific', 'Venta'),
(1160, 1, 'text_purchase_invoice_list', 'specific', 'Lista de facturas de compra'),
(1161, 1, 'button_all_purchase', 'specific', 'Todas las compras'),
(1162, 1, 'button_due_purchase', 'specific', 'Compra vencida'),
(1163, 1, 'button_paid_purchase', 'specific', 'Compra pagada'),
(1164, 1, 'button_stock_transfer', 'specific', 'Transferencia de acciones'),
(1165, 1, 'text_selling_invoice_list', 'specific', 'Lista de facturas de venta'),
(1166, 1, 'error_account', 'specific', 'La cuenta no es válida'),
(1167, 1, 'error_ref_no', 'specific', 'Árbitro. No. no es válido'),
(1168, 1, 'error_about', 'specific', 'Acerca de no es válido'),
(1169, 1, 'error_title', 'specific', 'no es válido'),
(1170, 1, 'text_withdraw_success', 'specific', 'Creado con éxito'),
(1171, 1, 'error_from_account', 'specific', 'De la cuenta no es válida'),
(1172, 1, 'error_to_account', 'specific', 'To account is not valid'),
(1173, 1, 'error_same_account', 'specific', 'El receptor y el remitente no pueden ser iguales'),
(1174, 1, 'error_ref_no_exist', 'specific', 'Árbitro. No. ya existe'),
(1175, 1, 'error_account_name', 'specific', 'El nombre de la cuenta no es válido'),
(1176, 1, 'error_account_no', 'specific', 'Cuenta no. no es válido'),
(1177, 1, 'error_contact_person', 'specific', 'La persona de contacto no es válida'),
(1178, 1, 'error_phone_number', 'specific', 'El número de teléfono no es válido'),
(1179, 1, 'text_update_income_source_success', 'specific', 'Actualizado exitosamente'),
(1180, 1, 'error_new_source_name', 'specific', 'Seleccione una fuente'),
(1181, 1, 'text_delete_income_source_success', 'specific', 'Ingreso elimidado con Éxito!.'),
(1182, 1, 'error_category_id', 'specific', 'El Código de la Categoría es Requerido!.'),
(1183, 1, 'button_viefw', 'specific', 'View'),
(1184, 1, 'error_loan_from', 'specific', 'El préstamo de no es válido'),
(1185, 1, 'error_loan_headline', 'specific', 'préstamo no es válido'),
(1186, 1, 'error_loan_amount', 'specific', 'El monto del préstamo no es válido'),
(1187, 1, 'text_take_loan_success', 'specific', 'Creado con éxito'),
(1188, 1, 'error_paid_amount', 'specific', 'El monto pagado no es válido'),
(1189, 1, 'error_pay_amount_greater_than_due_amount', 'specific', 'El monto a pagar no puede ser mayor que el monto adeudado'),
(1190, 1, 'text_loan_paid_success', 'specific', 'Pagado exitosamente'),
(1191, 1, 'error_sms_text', 'specific', 'Ingrese un texto valido.'),
(1192, 1, 'text_success_sms_sent', 'specific', 'Mensaje enviado con éxito'),
(1193, 1, 'error_user_name', 'specific', 'user name is not valid'),
(1194, 1, 'error_user_email_or_mobile', 'specific', 'El correo electrónico o el móvil no es válido'),
(1195, 1, 'error_user_group', 'specific', 'User Group is not valid'),
(1196, 1, 'error_user_password_match', 'specific', 'Vuelva a escribir la contraseña no coincidió'),
(1197, 1, 'error_user_password_length', 'specific', 'La longitud de la contraseña de usuario no es válida'),
(1198, 1, 'error_mobile', 'specific', 'El Usuario es Requerido.!'),
(1199, 1, 'error_email', 'specific', 'El correo no es válido'),
(1200, 1, 'error_zip_code', 'specific', 'Zip code is not valid'),
(1201, 1, 'error_addreess', 'specific', 'La dirección no es válida'),
(1202, 1, 'error_preference_receipt_template', 'specific', 'La plantilla de recibo no es válida'),
(1203, 1, 'error_currency', 'specific', 'La moneda no es válida'),
(1204, 1, 'error_brand_name', 'specific', 'El nombre de la Marca es Requerido!.'),
(1205, 1, 'title_brand_profile', 'specific', 'Perfil de marca'),
(1206, 1, 'text_brand_profile_title', 'specific', 'Perfil de marca'),
(1207, 1, 'text_brands', 'specific', 'Marcas'),
(1208, 1, 'text_brand_products', 'specific', 'Productos de marca'),
(1209, 1, 'button_all_products', 'specific', 'Todos los productos'),
(1210, 1, 'text_total_sell', 'specific', 'Total Venta'),
(1211, 1, 'label_brand_name', 'specific', 'Nombre De La Marca'),
(1212, 1, 'label_insert_product_to', 'specific', 'Insertar Producto En'),
(1213, 1, 'error_currency_code', 'specific', 'El código de moneda no es válido'),
(1214, 1, 'error_currency_symbol', 'specific', 'El símbolo de moneda no es válido'),
(1215, 1, 'error_currency_decimal_place', 'specific', 'El número decimal no es válido'),
(1216, 1, 'error_pmethod_name', 'specific', 'El método de pago no es válido'),
(1217, 1, 'label_invoice_to', 'specific', 'Factura A'),
(1218, 1, 'error_delete_unit_name', 'specific', 'Seleccione una unidad'),
(1219, 1, 'error_taxrate_name', 'specific', 'Taxrate name is not valid'),
(1220, 1, 'error_taxrate', 'specific', 'Taxrate is not valid'),
(1221, 1, 'error_delete_taxrate_name', 'specific', 'Seleccione una tasa de impuestos'),
(1222, 1, 'error_box_name', 'specific', 'El nombre de la casilla no es válido'),
(1223, 1, 'error_delete_box_name', 'specific', 'Seleccione una casilla'),
(1224, 1, 'label_success', 'specific', 'Éxito'),
(1225, 1, 'title_customer_analysis', 'specific', 'Análisis de clientes'),
(1226, 1, 'error_not_found', 'specific', 'Extraviado'),
(1227, 1, 'placeholder_input_discount_amount', 'specific', 'Importe de descuento de entrada'),
(1228, 1, 'text_selling_tax', 'specific', 'Impuesto de venta'),
(1229, 1, 'text_igst', 'specific', 'IGST'),
(1230, 1, 'text_cgst', 'specific', 'CGST'),
(1231, 1, 'text_sgst', 'specific', 'SGST'),
(1232, 1, 'text_sell_due_paid_success', 'specific', 'Vencimiento pagado correctamente'),
(1233, 1, 'label_hsn_code', 'specific', 'Código Hsn'),
(1234, 1, 'button_view_details', 'specific', 'View'),
(1235, 1, 'text_installment_details', 'specific', 'Detalles de pago'),
(1236, 1, 'label_initial_payment', 'specific', 'Pago Inicial'),
(1237, 1, 'label_interval_count', 'specific', 'Recuento Interno'),
(1238, 1, 'label_installment_count', 'specific', 'Recuento De Cuotas'),
(1239, 1, 'label_last_installment_date', 'specific', 'Última Fecha De Pago'),
(1240, 1, 'label_installment_end_date', 'specific', 'Fecha De Finalización Del Plazo'),
(1241, 1, 'text_update_installment_payment_success', 'specific', 'Pago a plazos exitoso'),
(1242, 1, 'error_amount_exceed', 'specific', 'Cantidad excedida'),
(1243, 1, 'label_gtin', 'specific', 'Etiqueta Gtin'),
(1244, 1, 'error_invoice_id', 'specific', 'La identificación de la factura no es válida'),
(1245, 1, 'button_due_invoice_list', 'specific', 'botón lista de facturas vencidas'),
(1246, 1, 'text_substract_amount', 'specific', 'cantidad de sustracción de texto'),
(1247, 1, 'title_log_in', 'specific', 'Login'),
(1248, 1, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(1249, 1, 'error_disabled_in_demo', 'specific', 'This feature is disable in error!'),
(1250, 1, 'error_purchase_price', 'specific', 'precio de compra de error'),
(1251, 1, 'text_barcode_print', 'specific', 'impresión de código de barras de texto'),
(1252, 1, 'button_semd_email', 'specific', 'botón de correo electrónico semd'),
(1253, 1, 'error_email_not_sent', 'specific', 'correo electrónico de error no enviado'),
(1254, 1, 'text_success_email_sent', 'specific', 'mensaje de texto exitoso correo electrónico enviado'),
(1255, 1, 'button_installment_payment', 'specific', 'botón de pago a plazos'),
(1256, 1, 'error_out_of_stock', 'specific', 'error agotado'),
(1257, 1, 'xxx', 'specific', 'xxx'),
(1258, 1, 'error_login', 'specific', 'error de inicio de sesión'),
(1259, 1, 'text_purchase_due_paid_success', 'specific', 'compra por mensaje de texto debido al éxito pagado'),
(1260, 1, 'text_trash', 'specific', 'basura de texto'),
(1261, 1, 'button_restore_all', 'specific', 'Restaura todo'),
(1262, 1, 'success_restore_all', 'specific', 'éxito restaurar todo'),
(1263, 1, 'title_customer_statement', 'specific', 'declaración de título del cliente'),
(1264, 1, 'text_statement_title', 'specific', 'TRANSACCIONES'),
(1265, 1, 'error_return_quantity_exceed', 'specific', 'la cantidad devuelta por error excede'),
(1266, 1, 'label_transferred_from', 'specific', 'Etiqueta Transferida Desde'),
(1267, 1, 'text_disabled', 'specific', 'texto deshabilitado'),
(1268, 1, 'text_gtin', 'specific', 'texto gtin'),
(1269, 1, 'text_balance', 'specific', 'SALDO'),
(1270, 1, 'error_invalid_username_password', 'specific', 'error contraseña de nombre de usuario no válida'),
(1271, 1, 'error_installment_interest_percentage', 'specific', 'porcentaje de interés de la cuota de error'),
(1272, 1, 'error_installment_interest_amount', 'specific', 'cantidad de interés de la cuota de error'),
(1273, 1, 'button_resend', 'specific', 'Reenviar'),
(1274, 1, 'error_sms_not_sent', 'specific', 'sms de error no enviado'),
(1275, 1, 'text_sms_logs_title', 'specific', 'título de los registros de SMS de texto'),
(1276, 1, 'error_mobile_exist', 'specific', 'El Usuario ya Exite.!'),
(1277, 1, 'text_success_sms_schedule', 'specific', 'programa de SMS de éxito de texto'),
(1278, 1, 'text_success_sms_added_to_schedule', 'specific', 'SMS de texto de éxito agregado a la programación'),
(1279, 1, 'error_gateway', 'specific', 'puerta de enlace de error'),
(1280, 1, 'error_sms_not_send', 'specific', 'Error Enviando Mensaje'),
(1281, 1, 'invoice_sms_text', 'specific', 'Estimado [customer_name], ID de factura: [invoice_id], Pagadero: [monto_pagable], Pagado: [monto_pagado], Vencimiento: [vencimiento]. Compra a las [fecha_hora]. Saludos, [store_name], [address]'),
(1282, 1, 'text_urdu', 'specific', 'texto en urdu'),
(1283, 1, 'error_default_language', 'specific', 'error idioma predeterminado'),
(1284, 1, 'error_active_or_sold', 'specific', 'Ya realizo ventas de esta compra.'),
(1285, 1, 'title_home', 'specific', 'Hogar'),
(1286, 1, 'error_supplier_name', 'specific', 'No se puede eliminar'),
(1287, 1, 'error_expired_date_belowx', 'specific', 'fecha de vencimiento del error a continuaciónx'),
(1288, 1, 'title_categories', 'specific', 'categorías de títulos'),
(1289, 1, 'title_products', 'specific', 'Productos'),
(1290, 1, 'title_shop_on_sale', 'specific', 'Sucursal de títulos a la venta'),
(1291, 1, 'title_cart', 'specific', 'Carro'),
(1292, 1, 'title_wishlist', 'specific', 'lista de deseos de título'),
(1293, 1, 'title_account', 'specific', 'cuenta de título'),
(1294, 1, 'title_contact', 'specific', 'título de contacto'),
(1295, 1, 'title_contact_us', 'specific', 'título contáctenos'),
(1296, 1, 'title_return_refund', 'specific', 'reembolso de devolución de título'),
(1297, 1, 'title_faq', 'specific', 'preguntas frecuentes sobre el título'),
(1298, 1, 'title_terms_condition', 'specific', 'condición de los términos del título'),
(1299, 1, 'title_support', 'specific', 'soporte de título'),
(1300, 1, 'title_login', 'specific', 'título de inicio de sesión'),
(1301, 1, 'title_about', 'specific', 'título sobre'),
(1302, 1, 'text_restore_completed', 'specific', 'Restaurado completado con éxito'),
(1303, 1, 'error_receipt_printer', 'specific', 'La impresora de recibos no es válida'),
(1304, 1, 'title_checkout', 'specific', 'Revisa'),
(1305, 1, 'text_are_you_sure', 'specific', '¿Estás seguro?'),
(1306, 1, 'text_store_access_success', 'specific', 'Sucursal activada correctamente'),
(1307, 1, 'title_cart_empty', 'specific', 'El carrito esta vacío'),
(1308, 1, 'title_payment', 'specific', 'Pago'),
(1309, 1, 'error_installment_duration', 'specific', 'La duración del plazo no es válida'),
(1310, 1, 'error_password_mismatch', 'specific', 'Confirme que la contraseña no coincide'),
(1311, 1, 'error_email_exist', 'specific', '¡El Email ya existe!'),
(1312, 1, 'error_invalid_purchase_code', 'specific', 'Código de compra no válido'),
(1313, 1, 'error_printer_ip_address_or_port', 'specific', 'Dirección IP o puerto'),
(1314, 1, 'error_printer_path', 'specific', 'Ruta de la impresora'),
(1315, 1, 'text_barcode_print', 'specific', 'Impresión de código de barras'),
(1316, 1, 'error_invalid_username_password', 'specific', 'El nombre de usuario o la contraseña no son válidos'),
(1317, 1, 'text_order', 'specific', 'Orden'),
(1318, 1, 'menu_order', 'specific', 'Orden'),
(1319, 1, 'menu_hold_order', 'specific', 'Mantener Orden'),
(1320, 1, 'menu_stock_transfer', 'specific', 'Transferencia De Acciones'),
(1321, 1, 'button_gift_card', 'specific', 'Tarjeta de regalo'),
(1322, 1, 'placeholder_input_discount_amount', 'specific', 'Importe de descuento'),
(1323, 1, 'text_sell_due_paid_success', 'specific', 'Pagado exitosamente'),
(1324, 1, 'button_due_invoice_list', 'specific', 'Lista de facturas vencidas'),
(1325, 1, 'error_pmethod_id', 'specific', 'El método de pago no es válido'),
(1326, 1, 'button_sell_product', 'specific', 'Vender Producto'),
(1327, 1, 'error_pmethod_code', 'specific', 'El código del método de pago no es válido'),
(1328, 1, 'invoice_sms_text', 'specific', 'SMS'),
(1329, 1, 'error_installment_duration', 'specific', 'La duración del plazo no es válida'),
(1330, 1, 'button_view_details', 'specific', 'View Details'),
(1331, 1, 'text_installment_details', 'specific', 'Detalles de pago'),
(1332, 1, 'label_initial_payment', 'specific', 'Pago Inicial'),
(1333, 1, 'label_interval_count', 'specific', 'Recuento De Intervalos'),
(1334, 1, 'label_installment_count', 'specific', 'Recuento De Cuotas'),
(1335, 1, 'label_last_installment_date', 'specific', 'Última Fecha De Pago'),
(1336, 1, 'label_installment_end_date', 'specific', 'Fecha De Finalización De La Instalación'),
(1337, 1, 'text_all_due', 'specific', 'Todo debido'),
(1338, 1, 'button_purchase', 'specific', 'Compra'),
(1339, 1, 'error_login_attempt', 'specific', 'Error al intentar iniciar sesión'),
(1340, 1, 'error_login_attempt_exceed', 'specific', 'Intento de inicio de sesión superado'),
(1341, 1, 'error_login_attempts_exceeded', 'specific', 'Se superó el intento de inicio de sesión'),
(1342, 1, 'error_mobile_exist', 'specific', 'El Usuario ya Exite.!'),
(1343, 1, 'error_login', 'specific', 'Error de inicio de sesión.'),
(1344, 1, 'button_product_purchase', 'specific', 'Compra de producto'),
(1345, 1, 'label_change', 'specific', 'Cambio'),
(1346, 1, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(1347, 1, 'error_disabled_in_demo', 'specific', 'This feature disabled in demo.'),
(1348, 1, 'error_amount_exceed', 'specific', 'Se supera la cantidad.'),
(1349, 1, 'title_customer_transaction', 'specific', 'Transacción del cliente'),
(1350, 1, 'text_customer_transaction_title', 'specific', 'Transacción del cliente'),
(1351, 1, 'text_customer_transaction_list_title', 'specific', 'Lista de transacciones del cliente'),
(1352, 1, 'title_supplier_transaction', 'specific', 'Transacción del proveedor'),
(1353, 1, 'text_supplier_transaction_title', 'specific', 'Transacción del proveedor'),
(1354, 1, 'error_activate_permission', 'specific', 'El permiso de activación no es válido.'),
(1355, 1, 'error_discount_amount_exceed', 'specific', 'La cantidad de descuento excede'),
(1356, 1, 'text_returns', 'specific', 'Devolucionesdddd'),
(1357, 1, 'label_sup_id', 'specific', 'Proveedor'),
(1358, 1, 'label_delete_all', 'specific', 'Eliminar Todos'),
(1359, 1, 'label_insert_store_to', 'specific', 'Insertar Sucursal En'),
(1360, 1, 'label_insert_store_content_into', 'specific', 'Insertar Registros en:'),
(1361, 1, 'error_store_name', 'specific', 'El nombre de la Sucursal no es v?lido'),
(1362, 1, 'error_email_exist', 'specific', 'Ya existe el correo electrónico'),
(1363, 1, 'error_customer_gift_card_exist', 'specific', 'La tarjeta de regalo del cliente ya existe'),
(1364, 1, 'label_transferred_from', 'specific', 'Transferido Desde'),
(1365, 1, 'text_download_samdple_format_file', 'specific', 'Descargar formato de muestra'),
(1366, 1, 'store_code 1 is not valid!', 'specific', 'El código de Sucursal no es válido'),
(1367, 1, 'text_purchase_due_paid_success', 'specific', 'Pagado exitosamente'),
(1368, 1, 'error_invalid_balance', 'specific', 'Saldo inválido'),
(1369, 1, 'button_installment_payment', 'specific', 'Pago de instalación'),
(1370, 1, 'text_update_installment_payment_success', 'specific', 'Pago a plazos actualizado correctamente'),
(1371, 1, 'error_email_address', 'specific', 'La dirección de correo electrónico es inválida'),
(1372, 1, 'email_sent_successful', 'specific', 'Correo electrónico enviado correctamente'),
(1373, 1, 'error_id', 'specific', 'La identificación no es válida'),
(1374, 1, 'store_code store2 is not valid!', 'specific', 'El código de Sucursal store2 no es válido!'),
(1375, 1, 'error_xls_sheet_not_found', 'specific', 'error hoja xls no encontrada'),
(1376, 1, 'text_delete_holding_order_success', 'specific', 'Orden de pedido eliminada con Éxito!.'),
(1377, 1, 'text_expired_listing_title', 'specific', 'Listado caducado'),
(1378, 1, 'label_item_quantity', 'specific', 'Cantidad De Objetos'),
(1379, 1, 'error_source', 'specific', 'La fuente no es válida'),
(1380, 1, 'label_returned_at', 'specific', 'Devuelto En'),
(1381, 1, 'error_print_permission', 'specific', 'You don\'t have permission in printing.'),
(1382, 1, 'text_due_incoice', 'specific', 'Factura vencida'),
(1383, 1, 'text_loan_details', 'specific', 'Detalles del préstamo'),
(1384, 1, 'label_paid_by', 'specific', 'Pagado Por'),
(1385, 1, 'button_conform_order', 'specific', 'orden confirmada'),
(1386, 1, 'text_order_successfully_placed', 'specific', 'Pedido realizado correctamente'),
(1387, 1, 'text_order_placed', 'specific', 'Pedido realizado'),
(1388, 1, 'title_order_placed', 'specific', 'Pedido realizado correctamente'),
(1389, 1, 'error_address', 'specific', 'El campo de dirección es obligatorio'),
(1390, 1, 'error_current_password', 'specific', 'contraseña actual'),
(1391, 1, 'error_new_password', 'specific', 'Nueva contraseña'),
(1392, 1, 'error_current_password_not_matched', 'specific', '¡Las contraseñas no coinciden!'),
(1393, 1, 'text_password_update_success', 'specific', 'Contraseña actualizada exitosamente'),
(1394, 1, 'error_full_name', 'specific', 'Nombre completo'),
(1395, 1, 'title_register', 'specific', 'Registrarse'),
(1396, 1, 'error_record_not_found', 'specific', '¡Recuperado no encontrado!'),
(1397, 1, 'text_account_created', 'specific', 'Cuenta creada con éxito'),
(1398, 1, 'text_login_success', 'specific', 'Iniciar sesión correctamente'),
(1399, 1, 'title_view_order', 'specific', 'View Order'),
(1400, 1, 'title_order', 'specific', 'Orden'),
(1401, 1, 'text_new_order_title', 'specific', 'Nuevo orden'),
(1402, 1, 'text_order_list_title', 'specific', 'Lista de orden'),
(1403, 1, 'label_shipping_and_billing_address', 'specific', 'Envío'),
(1404, 1, 'label_order_status', 'specific', 'Estado Del Pedido'),
(1405, 1, 'title_order_edit', 'specific', 'Editar orden'),
(1406, 1, 'text_order_edit_title', 'specific', 'Editar orden'),
(1407, 1, 'text_order_update_success', 'specific', 'Pedido actualizado correctamente'),
(1408, 1, 'label_insert_content_into', 'specific', 'Insertar Registros en:'),
(1409, 1, 'label_delete_the_product', 'specific', 'Eliminar El Producto'),
(1410, 1, 'label_soft_delete_the_product', 'specific', 'Eliminación Suave Del Producto'),
(1411, 1, 'error_phone_exist', 'specific', 'El número de teléfono ya existe'),
(1412, 1, 'title_stores', 'specific', 'Historias'),
(1413, 1, 'text_email_update_success', 'specific', 'Actualizado exitosamente'),
(1414, 1, 'text_phone_update_success', 'specific', 'Número de teléfono actualizado correctamente'),
(1415, 1, 'text_phone_number_update_success', 'specific', 'Número de teléfono actualizado correctamente'),
(1416, 1, 'label_link', 'specific', 'Enlace'),
(1417, 1, 'error_unit_code', 'specific', 'El código de la unidad no es válido'),
(1418, 1, 'error_service_can_not_be_returned', 'specific', 'El servicio no se puede devolver'),
(1419, 1, 'error_invalid_product_type', 'specific', 'El tipo de producto no es válido'),
(1420, 1, 'error_invalid_barcode_symbology', 'specific', 'La simbología del código de barras no es válida'),
(1421, 1, 'store_code store1111 is not valid!', 'specific', 'El código de Sucursal no es válido'),
(1422, 1, 'error_category_slug', 'specific', 'La babosa de categoría no es válida'),
(1423, 1, 'error_invalid_category_slug', 'specific', 'La babosa de categoría no es válida'),
(1424, 1, 'error_invalid_unit_code', 'specific', 'El código de la unidad no es válido'),
(1425, 1, 'error_invalid_taxrate_code', 'specific', 'Taxrate code is not valid'),
(1426, 1, 'error_invalid_tax_method', 'specific', 'Tax method is not valid'),
(1427, 1, 'error_invalid_supplier_code', 'specific', 'El código del proveedor no es válido'),
(1428, 1, 'error_invalid_brand_code', 'specific', 'El código de marca es Requerido!.'),
(1429, 1, 'error_invalid_box_code', 'specific', 'El código de la casilla no es válido'),
(1430, 1, 'error_invalid_cost_price', 'specific', 'El precio de costo no es válido'),
(1431, 1, 'error_product_item', 'specific', 'Agregue un producto al menos'),
(1432, 1, 'error_payment_method', 'specific', ''),
(1434, 1, 'error_customer_email_or_mobile', 'specific', 'Error de correo electrónico del cliente o móvil'),
(1435, 1, 'label_document', 'specific', 'N° Identificacion'),
(1436, 1, 'error_customer_sex', 'specific', ''),
(1437, 1, 'text_soft_delete', 'specific', ''),
(1438, 1, 'label_delete_all_content', 'specific', ''),
(1439, 1, 'label_document', 'specific', 'Nit/c.c'),
(1440, 1, 'error_product_exist', 'specific', 'El Producto ya Existe!.'),
(1441, 1, 'label_consecutive', 'specific', 'Consecutivo Actual'),
(1442, 1, 'label_since', 'specific', 'Consecutivo Desde'),
(1443, 1, 'label_until', 'specific', 'Consecutivo Hasta'),
(1444, 1, 'label_resolution', 'specific', 'Resolucion'),
(1445, 1, 'label_regime', 'specific', 'Regimen'),
(1446, 1, 'label_date_since', 'specific', 'Fecha Resolucion'),
(1447, 1, 'error_cashier_name', 'specific', ''),
(1448, 1, 'error_preference_tax', 'specific', 'impuesto de preferencia'),
(1449, 1, 'label_unit_discount', 'specific', '%descuento'),
(1450, 1, 'código de tienda store1 No es válido!', 'specific', ''),
(1451, 1, '', 'specific', ''),
(1452, 1, 'label_document', 'specific', 'Documento'),
(1453, 1, 'error_read_permission', 'specific', ''),
(1454, 1, 'error_preference_datatable_item_limit', 'specific', 'Limite de elemtos'),
(1455, 1, 'error_invalid_gateway', 'specific', 'Error de puerta de enlace no válida'),
(1456, 1, 'text_sms_sent', 'specific', 'Mensaje enviado con éxito 2'),
(1457, 1, 'label_password_old', 'specific', 'Contraseña Anterior'),
(1458, 1, 'error_product_tax', 'specific', ''),
(1459, 1, 'error_product_price', 'specific', 'El precio del producto es Requerido!.'),
(1460, 1, 'text_delete', 'specific', ''),
(1461, 1, 'error_password', 'specific', ''),
(1462, 1, 'error_username', 'specific', ''),
(1463, 1, 'código de tienda Mi Tienda No es válido!', 'specific', ''),
(1464, 1, 'error_delete_duration_expired', 'specific', ''),
(1465, 1, 'error_invalid_file', 'specific', ''),
(1466, 1, 'error_user_not_found', 'specific', ''),
(1467, 1, 'error_invoice_product_price', 'specific', ''),
(1468, 1, 'error_email_permission', 'specific', ''),
(1469, 1, 'error_invalid_password', 'specific', ''),
(1470, 1, 'error_store', 'specific', ''),
(1471, 1, 'label_failed', 'specific', ''),
(1472, 1, 'error_pmethod', 'specific', ''),
(1473, 1, 'error_invalid_username_or_password', 'specific', ''),
(1474, 1, 'error_taxrate_name_exist', 'specific', ''),
(1475, 1, 'error_access_permission', 'specific', ''),
(1476, 1, 'error_product_code_exist', 'specific', 'El Código del producto ya Existe!.'),
(1477, 1, 'error_group_exist', 'specific', ''),
(1478, 1, 'error_installment_interval_count', 'specific', ''),
(1479, 1, 'error_category_exist', 'specific', ''),
(2048, 2, 'title_dashboard', 'specific', 'Dashboard'),
(2049, 2, 'text_arabic', 'specific', 'Arabic'),
(2050, 2, 'text_french', 'specific', 'French'),
(2051, 2, 'text_germany', 'specific', 'Germany'),
(2052, 2, 'text_spanish', 'specific', 'Spanish'),
(2053, 2, 'text_pos', 'specific', 'POS'),
(2054, 2, 'menu_pos', 'specific', 'POS'),
(2055, 2, 'text_cashbook_report', 'specific', 'Cashbook Report'),
(2056, 2, 'menu_cashbook', 'specific', 'CASHBOOK'),
(2057, 2, 'text_invoice', 'specific', 'Invoice'),
(2058, 2, 'menu_invoice', 'specific', 'INVOICE'),
(2059, 2, 'text_user_preference', 'specific', 'User Preference'),
(2060, 2, 'text_settings', 'specific', 'Settings'),
(2061, 2, 'text_stock_alert', 'specific', 'Stock Alert'),
(2062, 2, 'text_expired', 'specific', 'Expired'),
(2063, 2, 'text_itsolution24', 'specific', 'ITsolution24'),
(2064, 2, 'text_reports', 'specific', 'Reports'),
(2065, 2, 'text_lockscreen', 'specific', 'Lockscreen'),
(2066, 2, 'text_logout', 'specific', 'Logout'),
(2067, 2, 'menu_dashboard', 'specific', 'DASHBOARD'),
(2068, 2, 'menu_point_of_sell', 'specific', 'POINT OF SELL'),
(2069, 2, 'menu_sell', 'specific', 'SELL'),
(2070, 2, 'menu_sale_list', 'specific', 'SELL LIST'),
(2071, 2, 'menu_return_list', 'specific', 'RETURN LIST'),
(2072, 2, 'menu_giftcard', 'specific', 'GIFTCARD'),
(2073, 2, 'menu_add_giftcard', 'specific', 'ADD GIFTCARD'),
(2074, 2, 'menu_giftcard_list', 'specific', 'GIFTCARD LIST'),
(2075, 2, 'menu_giftcard_topup', 'specific', 'GIFTCARD TOPUP'),
(2076, 2, 'menu_quotation', 'specific', 'QUOTATION'),
(2077, 2, 'menu_add_quotation', 'specific', 'ADD QUOTATION'),
(2078, 2, 'menu_quotation_list', 'specific', 'QUOTATION LIST'),
(2079, 2, 'menu_installment', 'specific', 'INSTALLMENT'),
(2080, 2, 'menu_installment_list', 'specific', 'INSTALLMENT LIST'),
(2081, 2, 'menu_payment_list', 'specific', 'PAYMENT LIST'),
(2082, 2, 'menu_payment_due_today', 'specific', 'PAYMENT DUE TODAY'),
(2083, 2, 'menu_payment_due_all', 'specific', 'PAYMENT DUE ALL'),
(2084, 2, 'menu_payment_due_expired', 'specific', 'PAYMENT DUE EXP.'),
(2085, 2, 'menu_overview_report', 'specific', 'OVERVIEW REPORT'),
(2086, 2, 'menu_purchase', 'specific', 'Purchase 2'),
(2087, 2, 'menu_add_purchase', 'specific', 'ADD PURCHASE'),
(2088, 2, 'menu_purchase_list', 'specific', 'PURCHASE LIST'),
(2089, 2, 'menu_due_invoice', 'specific', 'DUE INVOICE'),
(2090, 2, 'menu_transfer', 'specific', 'STOCK TRANSFER'),
(2091, 2, 'menu_add_transfer', 'specific', 'ADD TRANSFER'),
(2092, 2, 'menu_transfer_list', 'specific', 'TRANSFER LIST'),
(2093, 2, 'menu_product', 'specific', 'PRODUCT'),
(2094, 2, 'menu_product_list', 'specific', 'PRODUCT LIST'),
(2095, 2, 'menu_add_product', 'specific', 'ADD PRODUCT'),
(2096, 2, 'menu_barcode_print', 'specific', 'BARCODE PRINT'),
(2097, 2, 'menu_category', 'specific', 'CATEGORY LIST'),
(2098, 2, 'menu_add_category', 'specific', 'ADD CATEGORY'),
(2099, 2, 'menu_product_import', 'specific', 'IMPORT (.xls)'),
(2100, 2, 'menu_stock_alert', 'specific', 'STOCK ALERT'),
(2101, 2, 'menu_expired', 'specific', 'EXPIRED'),
(2102, 2, 'menu_customer', 'specific', 'CUSTOMER'),
(2103, 2, 'menu_add_customer', 'specific', 'ADD CUSTOMER'),
(2104, 2, 'menu_customer_list', 'specific', 'CUSTOMER LIST'),
(2105, 2, 'menu_transaction_list', 'specific', 'TRANSACTION LIST'),
(2106, 2, 'menu_supplier', 'specific', 'SUPPLIER'),
(2107, 2, 'menu_add_supplier', 'specific', 'ADD SUPPLIER'),
(2108, 2, 'menu_supplier_list', 'specific', 'SUPPLIER LIST'),
(2109, 2, 'menu_accounting', 'specific', 'ACCOUNTING'),
(2110, 2, 'menu_new_deposit', 'specific', 'DEPOSIT'),
(2111, 2, 'menu_new_withdraw', 'specific', 'WIDTHDRAW'),
(2112, 2, 'menu_new_transfer', 'specific', 'ADD TRANSFER '),
(2113, 2, 'menu_list_transfer', 'specific', 'TRANSFER LIST'),
(2114, 2, 'menu_add_bank_account', 'specific', 'ADD BANK ACCOUNT'),
(2115, 2, 'menu_bank_accounts', 'specific', 'BANK ACCOUNT LIST'),
(2116, 2, 'menu_income_source', 'specific', 'INCOME SOURCE'),
(2117, 2, 'menu_list_transactions', 'specific', 'TRANSACTION LIST'),
(2118, 2, 'menu_balance_sheet', 'specific', 'BALANCE SHEET'),
(2119, 2, 'menu_income_monthwise', 'specific', 'INCOME MONTHWISE'),
(2120, 2, 'menu_income_and_expense', 'specific', 'INCOME VS EXPENSE'),
(2121, 2, 'menu_profit_and_loss', 'specific', 'PROFIT VS LOSS'),
(2122, 2, 'menu_expenditure', 'specific', 'EXPANDITURE'),
(2123, 2, 'menu_create_expense', 'specific', 'ADD EXPENSE'),
(2124, 2, 'menu_expense_list', 'specific', 'EXPENSE LIST'),
(2125, 2, 'menu_expense_monthwise', 'specific', 'EXPENSE MONTHWISE'),
(2126, 2, 'menu_summary', 'specific', 'SUMMARY'),
(2127, 2, 'menu_loan_manager', 'specific', 'LOAN MANAGER'),
(2128, 2, 'menu_take_loan', 'specific', 'TAKE LOAN'),
(2129, 2, 'menu_loan_list', 'specific', 'LOAN LIST'),
(2130, 2, 'menu_loan_summary', 'specific', 'SUMMARY'),
(2131, 2, 'menu_reports', 'specific', 'REPORTS'),
(2132, 2, 'menu_report_overview', 'specific', 'OVERVIEW REPORT'),
(2133, 2, 'menu_report_collection', 'specific', 'COLLECTION REPORT'),
(2134, 2, 'menu_report_due_collection', 'specific', 'DUE COLLECTION RPT'),
(2135, 2, 'menu_report_due_paid', 'specific', 'DUE PAID RPT'),
(2136, 2, 'menu_sell_report', 'specific', 'SELL REPORT'),
(2137, 2, 'menu_purchase_report', 'specific', 'PURCHASE REPORT'),
(2138, 2, 'menu_sell_payment_report', 'specific', 'SELL PAYMENT REPORT'),
(2139, 2, 'menu_purchase_payment_report', 'specific', 'PUR. PAYMENT RPT.'),
(2140, 2, 'menu_tax_report', 'specific', 'SELL TAX REPORT'),
(2141, 2, 'menu_purchase_tax_report', 'specific', 'PURCHASE TAX RPT.'),
(2142, 2, 'menu_tax_overview_report', 'specific', 'TAX OVERVIEW RPT.'),
(2143, 2, 'menu_report_stock', 'specific', 'STOCK REPORT'),
(2144, 2, 'menu_analytics', 'specific', 'ANALYTICS'),
(2145, 2, 'menu_sms', 'specific', 'SMS'),
(2146, 2, 'menu_send_sms', 'specific', 'SEND SMS'),
(2147, 2, 'menu_sms_report', 'specific', 'SMS REPORT'),
(2148, 2, 'menu_sms_setting', 'specific', 'SMS SETTING'),
(2149, 2, 'menu_user', 'specific', 'USER'),
(2150, 2, 'menu_add_user', 'specific', 'ADD USER'),
(2151, 2, 'menu_user_list', 'specific', 'USER LIST'),
(2152, 2, 'menu_add_usergroup', 'specific', 'ADD USERGROUP'),
(2153, 2, 'menu_usergroup_list', 'specific', 'USERGROUP LIST'),
(2154, 2, 'menu_password', 'specific', 'PASSWORD'),
(2155, 2, 'menu_filemanager', 'specific', 'FILEMANAGER'),
(2156, 2, 'menu_system', 'specific', 'SYSTEM'),
(2157, 2, 'menu_store', 'specific', 'STORE'),
(2158, 2, 'menu_create_store', 'specific', 'STORE CREATE'),
(2159, 2, 'menu_store_list', 'specific', 'STORE LIST'),
(2160, 2, 'menu_store_setting', 'specific', 'STORE SETTING'),
(2161, 2, 'menu_receipt_template', 'specific', 'RECEIPT TEMPLATE'),
(2162, 2, 'menu_user_preference', 'specific', 'USER PREFERENCE'),
(2163, 2, 'menu_brand', 'specific', 'BRAND'),
(2164, 2, 'menu_add_brand', 'specific', 'ADD BRAND'),
(2165, 2, 'menu_brand_list', 'specific', 'BRAND LIST'),
(2166, 2, 'menu_currency', 'specific', 'CURRENCY'),
(2167, 2, 'menu_pmethod', 'specific', 'PAYMENT METHOD'),
(2168, 2, 'menu_unit', 'specific', 'UNIT'),
(2169, 2, 'menu_taxrate', 'specific', 'TAXRATE'),
(2170, 2, 'menu_box', 'specific', 'BOX'),
(2171, 2, 'menu_printer', 'specific', 'PRINTER'),
(2172, 2, 'menu_backup_restore', 'specific', 'BACKUP/RESTORE'),
(2173, 2, 'menu_store_change', 'specific', 'STORE CHANGE'),
(2174, 2, 'text_dashboard', 'specific', 'Dashboard'),
(2175, 2, 'text_old_dashboard', 'specific', 'Old Dashboard'),
(2176, 2, 'button_pos', 'specific', 'POS'),
(2177, 2, 'button_invoice', 'specific', 'Invoice'),
(2178, 2, 'button_overview_report', 'specific', 'Overview Report'),
(2179, 2, 'button_sell_report', 'specific', 'Sell Report'),
(2180, 2, 'button_purchase_report', 'specific', 'Purchase Report');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(2181, 2, 'button_stock_alert', 'specific', 'Stock Alert'),
(2182, 2, 'button_expired_alert', 'specific', 'Expired'),
(2183, 2, 'button_backup_restore', 'specific', 'Backup/Restore'),
(2184, 2, 'button_stores', 'specific', 'Stores'),
(2185, 2, 'text_total_invoice', 'specific', 'TOTAL INVOICE'),
(2186, 2, 'text_total_invoice_today', 'specific', 'TOTAL INVOICE TODAY'),
(2187, 2, 'text_details', 'specific', 'Details'),
(2188, 2, 'text_total_customer', 'specific', 'TOTAL CUSTOMER'),
(2189, 2, 'text_total_customer_today', 'specific', 'TOTAL CUSTOMER TODAY'),
(2190, 2, 'text_total_supplier', 'specific', 'TOTAL SUPPLIER'),
(2191, 2, 'text_total_supplier_today', 'specific', 'TOTAL SUPPLIER TODAY'),
(2192, 2, 'text_total_product', 'specific', 'TOTAL PRODUCT'),
(2193, 2, 'text_total_product_today', 'specific', 'TOTAL PRODUCT TODAY'),
(2194, 2, 'text_deposit_today', 'specific', 'Deposit Today'),
(2195, 2, 'text_withdraw_today', 'specific', 'Widthdraw Today'),
(2196, 2, 'text_total_deposit', 'specific', 'Total Deposit'),
(2197, 2, 'text_total_withdraw', 'specific', 'Total Widthdraw'),
(2198, 2, 'text_recent_deposit', 'specific', 'Recent Deposit'),
(2199, 2, 'label_date', 'specific', 'Date'),
(2200, 2, 'label_description', 'specific', 'Description'),
(2201, 2, 'label_amount', 'specific', 'Amount'),
(2202, 2, 'button_view_all', 'specific', 'View All'),
(2203, 2, 'text_recent_withdraw', 'specific', 'Recent Withdraw'),
(2204, 2, 'text_collection_report', 'specific', 'Collection Report'),
(2205, 2, 'label_serial_no', 'specific', 'SL'),
(2206, 2, 'label_username', 'specific', 'Username'),
(2207, 2, 'label_total_inv', 'specific', 'Total Inv'),
(2208, 2, 'label_net_amount', 'specific', 'Net Amount'),
(2209, 2, 'label_prev_due_collection', 'specific', 'Prev. Due Col.'),
(2210, 2, 'label_due_collection', 'specific', 'Due Collection'),
(2211, 2, 'label_due_given', 'specific', 'Due GIven'),
(2212, 2, 'label_received', 'specific', 'Received'),
(2213, 2, 'text_sells_analytics', 'specific', 'Sell Analytics'),
(2214, 2, 'text_version', 'specific', 'Version'),
(2215, 2, 'button_today', 'specific', 'Today'),
(2216, 2, 'button_last_7_days', 'specific', 'Last 7 Days'),
(2217, 2, 'button_last_30_days', 'specific', 'Last 30 Days'),
(2218, 2, 'button_last_365_days', 'specific', 'Last 365 Days'),
(2219, 2, 'button_filter', 'specific', 'Filter'),
(2220, 2, 'title_language', 'specific', 'Language'),
(2221, 2, 'text_language_title', 'specific', 'Language'),
(2222, 2, 'text_language_list_title', 'specific', 'Language Translate'),
(2223, 2, 'label_key', 'specific', 'Key'),
(2224, 2, 'label_value', 'specific', 'Value'),
(2225, 2, 'label_translate', 'specific', 'Translate'),
(2226, 2, 'button_translate', 'specific', 'Translate'),
(2227, 2, 'title_quotation', 'specific', 'Quotation'),
(2228, 2, 'text_quotation_title', 'specific', 'Quotation'),
(2229, 2, 'text_add', 'specific', 'Add'),
(2230, 2, 'text_new_quotation_title', 'specific', 'Add New Quotation'),
(2231, 2, 'label_reference_no', 'specific', 'Ref. No.'),
(2232, 2, 'label_note', 'specific', 'Notes'),
(2233, 2, 'label_status', 'specific', 'Status'),
(2234, 2, 'text_sent', 'specific', 'Sent'),
(2235, 2, 'text_pending', 'specific', 'Pending'),
(2236, 2, 'text_complete', 'specific', 'Complete'),
(2237, 2, 'label_customer', 'specific', 'Customer'),
(2238, 2, 'text_select', 'specific', '--- Please Select ---'),
(2239, 2, 'label_supplier', 'specific', 'Supplier'),
(2240, 2, 'text_all_suppliers', 'specific', 'All Supplier'),
(2241, 2, 'label_add_product', 'specific', 'Add Product'),
(2242, 2, 'placeholder_search_product', 'specific', 'Search Product'),
(2243, 2, 'label_product', 'specific', 'Product'),
(2244, 2, 'label_available', 'specific', 'Available'),
(2245, 2, 'label_quantity', 'specific', 'Quantity'),
(2246, 2, 'label_sell_price', 'specific', 'Sell Price'),
(2247, 2, 'label_item_tax', 'specific', 'Item Tax'),
(2248, 2, 'label_subtotal', 'specific', 'Subtotal'),
(2249, 2, 'label_order_tax', 'specific', 'Order Tax'),
(2250, 2, 'label_shipping_charge', 'specific', 'Shipping Charge'),
(2251, 2, 'label_others_charge', 'specific', 'Other Charge'),
(2252, 2, 'label_discount_amount', 'specific', 'Discount'),
(2253, 2, 'label_payable_amount', 'specific', 'Payable Amount'),
(2254, 2, 'button_save', 'specific', 'Save'),
(2255, 2, 'button_reset', 'specific', 'Reset'),
(2256, 2, 'text_quotation_list_title', 'specific', 'Quotation List'),
(2257, 2, 'button_all', 'specific', 'All'),
(2258, 2, 'button_sent', 'specific', 'Sent'),
(2259, 2, 'button_pending', 'specific', 'Pending'),
(2260, 2, 'button_complete', 'specific', 'Complete'),
(2261, 2, 'label_biller', 'specific', 'Biller'),
(2262, 2, 'label_total', 'specific', 'Total'),
(2263, 2, 'label_action', 'specific', 'Action'),
(2264, 2, 'text_translation_success', 'specific', 'Translation Successfull'),
(2265, 2, 'title_purchase', 'specific', 'Purchase 2'),
(2266, 2, 'text_purchase_title', 'specific', 'Purchase 2'),
(2267, 2, 'text_new_purchase_title', 'specific', 'Add New Purchase'),
(2268, 2, 'text_received', 'specific', 'Received'),
(2269, 2, 'text_ordered', 'specific', 'Ordered'),
(2270, 2, 'label_attachment', 'specific', 'Attachment'),
(2271, 2, 'label_cost', 'specific', 'Cost'),
(2272, 2, 'label_item_total', 'specific', 'Item Total'),
(2273, 2, 'label_payment_method', 'specific', 'Payment Method'),
(2274, 2, 'label_paid_amount', 'specific', 'Paid Amount'),
(2275, 2, 'label_due_amount', 'specific', 'Due Amount'),
(2276, 2, 'label_change_amount', 'specific', 'Change Amount'),
(2277, 2, 'button_submit', 'specific', 'Submit'),
(2278, 2, 'text_purchase_list_title', 'specific', 'Purchase List'),
(2279, 2, 'button_today_invoice', 'specific', 'Today Invoice'),
(2280, 2, 'button_all_invoice', 'specific', 'All Invoice'),
(2281, 2, 'button_due_invoice', 'specific', 'Due Invoice'),
(2282, 2, 'button_all_due_invoice', 'specific', 'All Due Invoice'),
(2283, 2, 'button_paid_invoice', 'specific', 'Paid Invoice'),
(2284, 2, 'button_inactive_invoice', 'specific', 'Inactive Invoice'),
(2285, 2, 'label_datetime', 'specific', 'Date Time'),
(2286, 2, 'label_invoice_id', 'specific', 'Invoice Id'),
(2287, 2, 'label_creator', 'specific', 'Creator'),
(2288, 2, 'label_invoice_paid', 'specific', 'Paid Amount'),
(2289, 2, 'label_due', 'specific', 'Due'),
(2290, 2, 'label_pay', 'specific', 'Pay'),
(2291, 2, 'label_return', 'specific', 'Return'),
(2292, 2, 'label_view', 'specific', 'View'),
(2293, 2, 'label_edit', 'specific', 'Edit'),
(2294, 2, 'title_language_translation', 'specific', 'Language Translate'),
(2295, 2, 'title_invoice', 'specific', 'Invoice'),
(2296, 2, 'text_invoice_title', 'specific', 'Invoice'),
(2297, 2, 'text_invoice_sub_title', 'specific', 'Invoice List'),
(2298, 2, 'label_customer_name', 'specific', 'Customer Name'),
(2299, 2, 'label_invoice_amount', 'specific', 'Inv. Amount'),
(2300, 2, 'label_invoice_due', 'specific', 'Invoice Due'),
(2301, 2, 'title_transfer', 'specific', 'Transfer'),
(2302, 2, 'text_transfer_title', 'specific', 'Transfer'),
(2303, 2, 'text_add_transfer_title', 'specific', 'Add New Transfer'),
(2304, 2, 'label_ref_no', 'specific', 'Ref. No.'),
(2305, 2, 'label_from', 'specific', 'From'),
(2306, 2, 'label_to', 'specific', 'To'),
(2307, 2, 'text_stock_list', 'specific', 'Stock List'),
(2308, 2, 'search', 'specific', 'Search'),
(2309, 2, 'text_invoice_id', 'specific', 'Invoice Id'),
(2310, 2, 'text_stock', 'specific', 'Stock'),
(2311, 2, 'text_transfer_list', 'specific', 'Transfer List'),
(2312, 2, 'label_item_name', 'specific', 'Item Name'),
(2313, 2, 'label_transfer_qty', 'specific', 'Transfer Qty.'),
(2314, 2, 'button_transfer_now', 'specific', 'Transfer Now'),
(2315, 2, 'text_list_transfer_title', 'specific', 'Transfer List'),
(2316, 2, 'label_from_store', 'specific', 'From Store'),
(2317, 2, 'label_to_store', 'specific', 'To Store'),
(2318, 2, 'label_total_item', 'specific', 'Total Item'),
(2319, 2, 'label_total_quantity', 'specific', 'Total Quantity'),
(2320, 2, 'text_success', 'specific', 'Successfully Created'),
(2321, 2, 'title_product', 'specific', 'Product'),
(2322, 2, 'text_products', 'specific', 'Products'),
(2323, 2, 'text_add_new', 'specific', 'Add New Product'),
(2324, 2, 'text_product', 'specific', 'Product'),
(2325, 2, 'text_general', 'specific', 'General'),
(2326, 2, 'text_image', 'specific', 'Image'),
(2327, 2, 'label_image', 'specific', 'Image'),
(2328, 2, 'label_url', 'specific', 'Url'),
(2329, 2, 'label_sort_order', 'specific', 'Order'),
(2330, 2, 'label_thumbnail', 'specific', 'Thumbnail'),
(2331, 2, 'label_product_type', 'specific', 'Product Type'),
(2332, 2, 'text_standard', 'specific', 'Standard'),
(2333, 2, 'text_service', 'specific', 'Service'),
(2334, 2, 'label_name', 'specific', 'Name'),
(2335, 2, 'label_pcode', 'specific', 'P. Code'),
(2336, 2, 'label_category', 'specific', 'Category'),
(2337, 2, 'label_brand', 'specific', 'Brand'),
(2338, 2, 'label_barcode_symbology', 'specific', 'Barcode Symbiology'),
(2339, 2, 'label_box', 'specific', 'Box'),
(2340, 2, 'label_expired_date', 'specific', 'Expired Date'),
(2341, 2, 'label_unit', 'specific', 'Unit'),
(2342, 2, 'label_product_cost', 'specific', 'Product Cost'),
(2343, 2, 'label_product_price', 'specific', 'Product Price'),
(2344, 2, 'label_product_tax', 'specific', 'Product Tax'),
(2345, 2, 'label_tax_method', 'specific', 'Tax Method'),
(2346, 2, 'text_inclusive', 'specific', 'Inclusive'),
(2347, 2, 'text_exclusive', 'specific', 'Exclusive'),
(2348, 2, 'label_store', 'specific', 'Store'),
(2349, 2, 'label_alert_quantity', 'specific', 'Alert Quantity'),
(2350, 2, 'text_active', 'specific', 'Active'),
(2351, 2, 'text_inactive', 'specific', 'Inactive'),
(2352, 2, 'text_view_all', 'specific', 'View All'),
(2353, 2, 'label_all_product', 'specific', 'All Product'),
(2354, 2, 'button_trash', 'specific', 'Trash'),
(2355, 2, 'button_bulk', 'specific', 'Bulk Action'),
(2356, 2, 'button_delete_all', 'specific', 'Delete All'),
(2357, 2, 'label_stock', 'specific', 'Stock'),
(2358, 2, 'label_purchase_price', 'specific', 'Purchase Price'),
(2359, 2, 'label_selling_price', 'specific', 'Selling Price'),
(2360, 2, 'label_purchase', 'specific', 'Purchase 2'),
(2361, 2, 'label_print_barcode', 'specific', 'Print Barcode'),
(2362, 2, 'button_view', 'specific', 'View'),
(2363, 2, 'button_edit', 'specific', 'Edit'),
(2364, 2, 'button_purchase_product', 'specific', 'Purchase Product'),
(2365, 2, 'button_barcode', 'specific', 'Barcode'),
(2366, 2, 'button_delete', 'specific', 'Delete'),
(2367, 2, 'error_no_selected', 'specific', 'Not Selected'),
(2368, 2, 'success_delete_all', 'specific', 'Successfully Deleted'),
(2369, 2, 'text_language_translation_title', 'specific', 'Language Translate'),
(2370, 2, 'title_user_preference', 'specific', 'User Preference'),
(2371, 2, 'text_user_preference_title', 'specific', 'User Preference'),
(2372, 2, 'text_language_preference_title', 'specific', 'Language Translate'),
(2373, 2, 'label_select_language', 'specific', 'Select Language'),
(2374, 2, 'text_english', 'specific', 'English'),
(2375, 2, 'text_color_preference_title', 'specific', 'Color Preference'),
(2376, 2, 'label_base_color', 'specific', 'Base color'),
(2377, 2, 'text_color_black', 'specific', 'Black'),
(2378, 2, 'text_color_blue', 'specific', 'Blue'),
(2379, 2, 'text_color_green', 'specific', 'Green'),
(2380, 2, 'text_color_red', 'specific', 'Red'),
(2381, 2, 'text_color_yellow', 'specific', 'Yellow'),
(2382, 2, 'text_pos_side_panel_position_title', 'specific', 'POS Side Panel Position'),
(2383, 2, 'label_pos_side_panel_position', 'specific', 'Pos Side Panel Position'),
(2384, 2, 'text_right', 'specific', 'Right'),
(2385, 2, 'text_left', 'specific', 'Left'),
(2386, 2, 'text_pos_pattern_title', 'specific', 'POS Pattern'),
(2387, 2, 'label_select_pos_pattern', 'specific', 'Select POS Pattern'),
(2388, 2, 'button_update', 'specific', 'Update 1'),
(2389, 2, 'text_login_title', 'specific', 'Login'),
(2390, 2, 'text_login', 'specific', 'Login'),
(2391, 2, 'button_sign_in', 'specific', 'Sign In'),
(2392, 2, 'text_forgot_password', 'specific', 'Forgot Password?'),
(2393, 2, 'title_forgot_password', 'specific', 'Forgot Password'),
(2394, 2, 'text_forgot_password_instruction', 'specific', 'Please type your email.  We will send you a link just follow the steps.'),
(2395, 2, 'button_close', 'specific', 'Close'),
(2396, 2, 'title_receipt_template', 'specific', 'Receipt Template'),
(2397, 2, 'text_receipt_tempalte_title', 'specific', 'Receipt Template'),
(2398, 2, 'title_pos_setting', 'specific', 'POS Settings'),
(2399, 2, 'text_receipt_template', 'specific', 'Receipt Template'),
(2400, 2, 'text_receipt_tempalte_sub_title', 'specific', 'Receipt Template'),
(2401, 2, 'button_preview', 'specific', 'Preview'),
(2402, 2, 'text_tempalte_content_title', 'specific', 'Template Content'),
(2403, 2, 'text_tempalte_css_title', 'specific', 'Template CSS'),
(2404, 2, 'text_template_tags', 'specific', 'Template Tags'),
(2405, 2, 'text_translations', 'specific', 'Translations'),
(2406, 2, 'text_bangla', 'specific', 'Bangla'),
(2407, 2, 'menu_language', 'specific', 'LANGUAGE'),
(2408, 2, 'button_default', 'specific', 'Default'),
(2409, 2, 'text_paid', 'specific', 'Paid'),
(2410, 2, 'button_return', 'specific', 'Return'),
(2411, 2, 'button_view_receipt', 'specific', 'View Receipt'),
(2412, 2, 'label_delete', 'default', 'Delete'),
(2413, 2, 'button_dublicate_entry', 'specific', 'Dublicate Entry'),
(2414, 2, 'text_delete_success', 'specific', 'Successfully Deleted'),
(2415, 2, 'label_delete', 'specific', 'Delete'),
(2416, 2, 'text_customer_list_title', 'specific', 'Customer List'),
(2417, 2, 'text_customer_title', 'specific', 'Customer'),
(2418, 2, 'text_new_customer_title', 'specific', 'Add New Customer'),
(2419, 2, 'label_phone', 'specific', 'Phone'),
(2420, 2, 'label_date_of_birth', 'specific', 'Date of Birth'),
(2421, 2, 'label_email', 'specific', 'Email'),
(2422, 2, 'label_sex', 'specific', 'Sex'),
(2423, 2, 'label_male', 'specific', 'Male'),
(2424, 2, 'label_female', 'specific', 'Female'),
(2425, 2, 'label_others', 'specific', 'Others'),
(2426, 2, 'label_age', 'specific', 'Age'),
(2427, 2, 'label_address', 'specific', 'Address'),
(2428, 2, 'label_city', 'specific', 'City'),
(2429, 2, 'label_state', 'specific', 'State'),
(2430, 2, 'label_country', 'specific', 'Country'),
(2431, 2, 'label_id', 'specific', 'Id'),
(2432, 2, 'label_balance', 'specific', 'Balance'),
(2433, 2, 'label_sell', 'specific', 'Sell'),
(2434, 2, 'button_sell', 'specific', 'Sell'),
(2435, 2, 'button_view_profile', 'specific', 'View Profile'),
(2436, 2, 'login_success', 'specific', 'Login Successfull'),
(2437, 2, 'title_installment_payment', 'specific', 'Installment Payment'),
(2438, 2, 'text_installment_payment_title', 'specific', 'Installment Payment'),
(2439, 2, 'text_installment', 'specific', 'Installment'),
(2440, 2, 'text_installment_payment_list_title', 'specific', 'Installment Payment List'),
(2441, 2, 'text_all_payment', 'specific', 'All Payment'),
(2442, 2, 'button_all_payment', 'specific', 'All Payment'),
(2443, 2, 'button_todays_due_payment', 'specific', 'Todays Due Payment'),
(2444, 2, 'button_all_due_payment', 'specific', 'All Due Payment'),
(2445, 2, 'button_expired_due_payment', 'specific', 'Expired Due Payment'),
(2446, 2, 'label_payment_date', 'specific', 'Payment Date'),
(2447, 2, 'label_payable', 'specific', 'Payable'),
(2448, 2, 'label_paid', 'specific', 'Paid'),
(2449, 2, 'button_payment', 'specific', 'Payment'),
(2450, 2, 'title_backup_restore', 'specific', 'Backup/Restore'),
(2451, 2, 'text_backup_restore_title', 'specific', 'Backup/Restore'),
(2452, 2, 'text_backup', 'specific', 'Backup'),
(2453, 2, 'text_restore', 'specific', 'Restore'),
(2454, 2, 'label_databases', 'specific', 'Databases'),
(2455, 2, 'label_select_all', 'specific', 'Select All'),
(2456, 2, 'label_unselect_all', 'specific', 'Unselect All'),
(2457, 2, 'button_export', 'specific', 'Export'),
(2458, 2, 'label_progress', 'specific', 'Progress'),
(2459, 2, 'button_select_sql_file', 'specific', 'Select .sql File'),
(2460, 2, 'title_printer', 'specific', 'Printer'),
(2461, 2, 'text_printer_title', 'specific', 'Printer'),
(2462, 2, 'text_new_printer_title', 'specific', 'Add New Printer'),
(2463, 2, 'label_title', 'specific', 'Title'),
(2464, 2, 'label_type', 'specific', 'Type'),
(2465, 2, 'label_char_per_line', 'specific', 'Char Per Line'),
(2466, 2, 'label_path', 'specific', 'Path'),
(2467, 2, 'label_ip_address', 'specific', 'Ip Address'),
(2468, 2, 'label_port', 'specific', 'Port'),
(2469, 2, 'text_printer_list_title', 'specific', 'Printer List'),
(2470, 2, 'title_box', 'specific', 'Box'),
(2471, 2, 'text_box_title', 'specific', 'Box'),
(2472, 2, 'text_box_box_title', 'specific', 'Box '),
(2473, 2, 'label_box_name', 'specific', 'Box Name'),
(2474, 2, 'label_code_name', 'specific', 'Code Name'),
(2475, 2, 'label_box_details', 'specific', 'Box Details'),
(2476, 2, 'text_in_active', 'specific', 'Inactive'),
(2477, 2, 'text_box_list_title', 'specific', 'Box List'),
(2478, 2, 'title_taxrate', 'specific', 'Taxrate'),
(2479, 2, 'text_taxrate_title', 'specific', 'Taxrate'),
(2480, 2, 'text_new_taxrate_title', 'specific', 'Add New Taxrate'),
(2481, 2, 'label_taxrate_name', 'specific', 'Taxrate Name'),
(2482, 2, 'label_taxrate', 'specific', 'Taxrate'),
(2483, 2, 'text_taxrate_list_title', 'specific', 'Taxrate List'),
(2484, 2, 'title_unit', 'specific', 'Unit'),
(2485, 2, 'text_unit_title', 'specific', 'Unit'),
(2486, 2, 'text_new_unit_title', 'specific', 'Add New Unit'),
(2487, 2, 'label_unit_name', 'specific', 'Unit Name'),
(2488, 2, 'label_unit_details', 'specific', 'Unit Details'),
(2489, 2, 'text_unit_list_title', 'specific', 'Unit List'),
(2490, 2, 'title_pmethod', 'specific', 'Payment Mehtod'),
(2491, 2, 'text_pmethod_title', 'specific', 'Payment Method'),
(2492, 2, 'text_new_pmethod_title', 'specific', 'Add New Payment Method'),
(2493, 2, 'label_details', 'specific', 'Details'),
(2494, 2, 'text_pmethod_list_title', 'specific', 'Payment Method List'),
(2495, 2, 'title_currency', 'specific', 'Currency'),
(2496, 2, 'text_currency_title', 'specific', 'Currency'),
(2497, 2, 'text_new_currency_title', 'specific', 'Add New Currency'),
(2498, 2, 'label_code', 'specific', 'Code'),
(2499, 2, 'hint_code', 'specific', 'Code name here'),
(2500, 2, 'label_symbol_left', 'specific', 'Symbol Left'),
(2501, 2, 'hint_symbol_left', 'specific', 'It will display in Left side'),
(2502, 2, 'label_symbol_right', 'specific', 'Symbol Right'),
(2503, 2, 'hint_symbol_right', 'specific', 'It will display in right  side'),
(2504, 2, 'label_decimal_place', 'specific', 'Decimal  Place'),
(2505, 2, 'hint_decimal_place', 'specific', 'It indicates number of digit after ponts. I.E.  100.00'),
(2506, 2, 'text_currency_list_title', 'specific', 'Currency List'),
(2507, 2, 'text_enabled', 'specific', 'Enabled'),
(2508, 2, 'button_activate', 'specific', 'Active'),
(2509, 2, 'button_activated', 'specific', 'Activated'),
(2510, 2, 'text_brand_list_title', 'specific', 'Brand List'),
(2511, 2, 'text_brand_title', 'specific', 'Brand'),
(2512, 2, 'text_new_brand_title', 'specific', 'Brand'),
(2513, 2, 'label_total_product', 'specific', 'Total Product'),
(2514, 2, 'title_create_store', 'specific', 'Create Store'),
(2515, 2, 'text_create_store_title', 'specific', 'Create Store'),
(2516, 2, 'text_stores', 'specific', 'Stores'),
(2517, 2, 'text_currency', 'specific', 'Currency'),
(2518, 2, 'text_payment_method', 'specific', 'Paymen Method'),
(2519, 2, 'text_printer', 'specific', 'Printer'),
(2520, 2, 'text_email_setting', 'specific', 'Email Setting'),
(2521, 2, 'text_ftp_setting', 'specific', 'FTP Setting'),
(2522, 2, 'label_mobile', 'specific', 'Mobile'),
(2523, 2, 'label_zip_code', 'specific', 'Zip Code'),
(2524, 2, 'label_vat_reg_no', 'specific', 'VAT Reg. No.'),
(2525, 2, 'label_cashier_name', 'specific', 'Cashier Name'),
(2526, 2, 'label_timezone', 'specific', 'Timezone'),
(2527, 2, 'label_invoice_edit_lifespan', 'specific', 'Invoice Edit Lifespan'),
(2528, 2, 'hint_invoice_edit_lifespan', 'specific', 'After this time you won\'t be able to edit invoice.'),
(2529, 2, 'text_minute', 'specific', 'Minute'),
(2530, 2, 'text_second', 'specific', 'Second'),
(2531, 2, 'label_invoice_delete_lifespan', 'specific', 'Invoice Delete Lifespan'),
(2532, 2, 'hint_invoice_delete_lifespan', 'specific', 'After this time you won\'t be able to delete invoice.'),
(2533, 2, 'label_after_sell_page', 'specific', 'After Sell Page'),
(2534, 2, 'hint_after_sell_page', 'specific', 'After Sell Page'),
(2535, 2, 'label_pos_printing', 'specific', 'POS Printing'),
(2536, 2, 'label_receipt_printer', 'specific', 'Receipt Printer'),
(2537, 2, 'label_auto_print_receipt', 'specific', 'Auto Print Receipt'),
(2538, 2, 'label_deposit_account', 'specific', 'Deposit Account'),
(2539, 2, 'label_tax', 'specific', 'TAX'),
(2540, 2, 'hint_tax', 'specific', 'Tax'),
(2541, 2, 'label_stock_alert_quantity', 'specific', 'Stock Alert Quantity'),
(2542, 2, 'hint_stock_alert_quantity', 'specific', 'If quantity reach this value so it will be alert as stock low alert'),
(2543, 2, 'label_datatable_item_limit', 'specific', 'Datatable Item Limit'),
(2544, 2, 'hint_datatable_item_limit', 'specific', 'It indicates how many row you will show in any table'),
(2545, 2, 'label_invoice_footer_text', 'specific', 'Invoice Footer Text'),
(2546, 2, 'hint_invoice_footer_text', 'specific', 'This will display in footer of invoice'),
(2547, 2, 'label_sound_effect', 'specific', 'Sound Effect'),
(2548, 2, 'label_email_from', 'specific', 'Email From'),
(2549, 2, 'hint_email_from', 'specific', 'Email From'),
(2550, 2, 'label_email_address', 'specific', 'Email Address'),
(2551, 2, 'hint_email_address', 'specific', 'Email Addrress'),
(2552, 2, 'label_email_driver', 'specific', 'Email Driver'),
(2553, 2, 'hint_email_driver', 'specific', 'Email Driver'),
(2554, 2, 'label_smtp_host', 'specific', 'SMTP Host'),
(2555, 2, 'hint_smtp_host', 'specific', 'SMTP Host'),
(2556, 2, 'label_smtp_username', 'specific', 'SMTP Username'),
(2557, 2, 'hint_smtp_username', 'specific', 'SMTP Username'),
(2558, 2, 'label_smtp_password', 'specific', 'SMTP Password'),
(2559, 2, 'hint_smtp_password', 'specific', 'SMTP Password'),
(2560, 2, 'label_smtp_port', 'specific', 'SMTP Port'),
(2561, 2, 'hint_smtp_port', 'specific', 'SMTP Port'),
(2562, 2, 'label_ssl_tls', 'specific', 'SSL/TLS'),
(2563, 2, 'hint_ssl_tls', 'specific', 'SSL/TLS'),
(2564, 2, 'label_ftp_hostname', 'specific', 'FTP Hostname'),
(2565, 2, 'label_ftp_username', 'specific', 'FTP Username'),
(2566, 2, 'label_ftp_password', 'specific', 'FTP Password'),
(2567, 2, 'button_back', 'specific', 'Back'),
(2568, 2, 'title_store', 'specific', 'Store'),
(2569, 2, 'text_store_title', 'specific', 'Store'),
(2570, 2, 'text_store_list_title', 'specific', 'Store List'),
(2571, 2, 'label_created_at', 'specific', 'Created At'),
(2572, 2, 'title_edit_store', 'specific', 'Edit Store'),
(2573, 2, 'text_title', 'specific', 'Title'),
(2574, 2, 'text_pos_setting', 'specific', 'POS Setting'),
(2575, 2, 'label_gst_reg_no', 'specific', 'GST Reg. No.'),
(2576, 2, 'label_sms_gateway', 'specific', 'SMS Gateway'),
(2577, 2, 'hint_sms_gateway', 'specific', 'SMS Gateway like clickatell, 91sms'),
(2578, 2, 'label_sms_alert', 'specific', 'SMS Alert'),
(2579, 2, 'hint_sms_alert', 'specific', 'SMS Alert'),
(2580, 2, 'text_yes', 'specific', 'Yes'),
(2581, 2, 'text_no', 'specific', 'No.'),
(2582, 2, 'label_auto_sms', 'specific', 'Auto SMS'),
(2583, 2, 'text_sms_after_creating_invoice', 'specific', 'SMS After Create Invoice'),
(2584, 2, 'label_expiration_system', 'specific', 'Expiration System'),
(2585, 2, 'label_invoice_prefix', 'specific', 'Invoive Prefix'),
(2586, 2, 'label_receipt_template', 'specific', 'Receipt Template'),
(2587, 2, 'label_invoice_view', 'specific', 'Invoice View'),
(2588, 2, 'hint_invoice_view', 'specific', 'Invoice View'),
(2589, 2, 'text_tax_invoice', 'specific', 'Tax Invoice'),
(2590, 2, 'text_indian_gst', 'specific', 'Indian GST'),
(2591, 2, 'label_change_item_price_while_billing', 'specific', 'Change Price when Billing'),
(2592, 2, 'hint_change_item_price_while_billing', 'specific', 'You will be able to edit sell price when you will create a invoice.'),
(2593, 2, 'label_pos_product_display_limit', 'specific', 'POS Product Display Limit'),
(2594, 2, 'hint_pos_product_display_limit', 'specific', 'Number of product that will display in POS'),
(2595, 2, 'label_send_mail_path', 'specific', 'Send Mail Path'),
(2596, 2, 'hint_send_mail_path', 'specific', 'Type send mail path here'),
(2597, 2, 'text_logo', 'specific', 'Logo'),
(2598, 2, 'label_logo_size', 'specific', 'Logo Size'),
(2599, 2, 'button_upload', 'specific', 'Upload'),
(2600, 2, 'text_favicon', 'specific', 'Favicon'),
(2601, 2, 'label_favicon_size', 'specific', 'Favicon Size'),
(2602, 2, 'title_user', 'specific', 'User'),
(2603, 2, 'text_user_title', 'specific', 'User'),
(2604, 2, 'text_new_user_title', 'specific', 'Add New User'),
(2605, 2, 'label_password', 'specific', 'Password'),
(2606, 2, 'label_password_retype', 'specific', 'Retype Password'),
(2607, 2, 'label_group', 'specific', 'Group'),
(2608, 2, 'hint_group', 'specific', 'Group name here'),
(2609, 2, 'text_user_list_title', 'specific', 'User List'),
(2610, 2, 'label_profile', 'specific', 'Profile'),
(2611, 2, 'title_user_group', 'specific', 'Usergroup'),
(2612, 2, 'text_group_title', 'specific', 'User Group'),
(2613, 2, 'text_new_group_title', 'specific', 'Add New Usergroup'),
(2614, 2, 'label_slug', 'specific', 'Slug'),
(2615, 2, 'text_group_list_title', 'specific', 'User Group List'),
(2616, 2, 'label_total_user', 'specific', 'Total User'),
(2617, 2, 'title_password', 'specific', 'Password'),
(2618, 2, 'text_password_title', 'specific', 'Password'),
(2619, 2, 'text_password_box_title', 'specific', 'Password'),
(2620, 2, 'label_password_user', 'specific', 'Password'),
(2621, 2, 'label_password_new', 'specific', 'New Password'),
(2622, 2, 'label_password_confirm', 'specific', 'Password Confirm'),
(2623, 2, 'title_send_sms', 'specific', 'Send SMS'),
(2624, 2, 'text_sms_title', 'specific', 'SMS'),
(2625, 2, 'text_send_sms', 'specific', 'Send SMS'),
(2626, 2, 'text_send_sms_title', 'specific', 'Send SMS'),
(2627, 2, 'text_event_sms', 'specific', 'Event SMS'),
(2628, 2, 'text_single', 'specific', 'Single'),
(2629, 2, 'text_group', 'specific', 'User Group'),
(2630, 2, 'label_sms_for', 'specific', 'SMS For'),
(2631, 2, 'text_birthday', 'specific', 'Birthday'),
(2632, 2, 'label_people_type', 'specific', 'People Type'),
(2633, 2, 'text_all_customer', 'specific', 'All Customer'),
(2634, 2, 'text_all_user', 'specific', 'All User'),
(2635, 2, 'label_people', 'specific', 'People'),
(2636, 2, 'label_message', 'specific', 'Messeage'),
(2637, 2, 'button_send', 'specific', 'Send'),
(2638, 2, 'label_phone_number', 'specific', 'Phone Number'),
(2639, 2, 'title_sms_report', 'specific', 'SMS Report'),
(2640, 2, 'text_sms_report_title', 'specific', 'SMS Report'),
(2641, 2, 'text_sms_list_title', 'specific', 'SMS List'),
(2642, 2, 'text_all', 'specific', 'All'),
(2643, 2, 'button_delivered', 'specific', 'Delivered'),
(2644, 2, 'button_failed', 'specific', 'Failed'),
(2645, 2, 'label_schedule_at', 'specific', 'Schedule At'),
(2646, 2, 'label_campaign_name', 'specific', 'Campaign Name'),
(2647, 2, 'label_people_name', 'specific', 'People Name'),
(2648, 2, 'label_mobile_number', 'specific', 'Mobile Number'),
(2649, 2, 'label_process_status', 'specific', 'Process Status'),
(2650, 2, 'label_response_text', 'specific', 'Response Text'),
(2651, 2, 'label_delivered', 'specific', 'Delivered'),
(2652, 2, 'label_resend', 'specific', 'Resend'),
(2653, 2, 'title_sms_setting', 'specific', 'SMS Setting'),
(2654, 2, 'text_sms_setting_title', 'specific', 'SMS Setting'),
(2655, 2, 'text_sms_setting', 'specific', 'SMS Setting'),
(2656, 2, 'text_clickatell', 'specific', 'clickatell'),
(2657, 2, 'text_twilio', 'specific', 'twilio'),
(2658, 2, 'text_msg91', 'specific', 'msg91'),
(2659, 2, 'text_onnorokomsms', 'specific', 'Onnorokom SMS'),
(2660, 2, 'label_api_key', 'specific', 'API Key'),
(2661, 2, 'label_sender_id', 'specific', 'Sender Id'),
(2662, 2, 'label_auth_key', 'specific', 'Auth Key'),
(2663, 2, 'label_contact', 'specific', 'Contact'),
(2664, 2, 'label_country_code', 'specific', 'Country Code'),
(2665, 2, 'label_maskname', 'specific', 'Maskname'),
(2666, 2, 'label_optional', 'specific', 'Optional'),
(2667, 2, 'label_campaignname', 'specific', 'Campaign Name'),
(2668, 2, 'title_analytics', 'specific', 'Analytics'),
(2669, 2, 'text_analytics_title', 'specific', 'Analytics'),
(2670, 2, 'text_report_title', 'specific', 'Report'),
(2671, 2, 'text_best_customer', 'specific', 'Best Customer'),
(2672, 2, 'text_purchase_amount', 'specific', 'Purchase Amount'),
(2673, 2, 'text_top_product', 'specific', 'Top Product'),
(2674, 2, 'title_overview', 'specific', 'Overview Report'),
(2675, 2, 'text_overview_title', 'specific', 'Overview Report'),
(2676, 2, 'text_sell_overview', 'specific', 'Sell Overview'),
(2677, 2, 'text_purchase_overview', 'specific', 'Purchase Overview'),
(2678, 2, 'text_title_sells_overview', 'specific', 'Sell Overview'),
(2679, 2, 'text_invoice_amount', 'specific', 'Monto de la factura'),
(2680, 2, 'button_details', 'specific', 'Details'),
(2681, 2, 'text_discount_amount', 'specific', 'Discount'),
(2682, 2, 'text_due_given', 'specific', 'Due Given'),
(2683, 2, 'text_due_collection', 'specific', 'Due Collection'),
(2684, 2, 'text_others', 'specific', 'Others'),
(2685, 2, 'text_shipping_charge', 'specific', 'Shipping Charge'),
(2686, 2, 'text_others_charge', 'specific', 'Others Charge'),
(2687, 2, 'text_profit_or_loss', 'specific', 'Profit or Loss'),
(2688, 2, 'text_order_tax', 'specific', 'Order Tax'),
(2689, 2, 'text_item_tax', 'specific', 'Item Tax'),
(2690, 2, 'text_total_tax', 'specific', 'Total Tax'),
(2691, 2, 'text_title_purchase_overview', 'specific', 'Purchase Overview'),
(2692, 2, 'text_due_taken', 'specific', 'Due Taken'),
(2693, 2, 'text_due_paid', 'specific', 'Due Paid'),
(2694, 2, 'text_total_paid', 'specific', 'Total Paid'),
(2695, 2, 'title_collection_report', 'specific', 'Collection Report'),
(2696, 2, 'text_collection_report_title', 'specific', 'Collection Report'),
(2697, 2, 'title_due_collection', 'specific', 'Due Collection'),
(2698, 2, 'text_due_collection_title', 'specific', 'Due Collection'),
(2699, 2, 'text_due_collection_sub_title', 'specific', 'Due Collection List'),
(2700, 2, 'label_pmethod_name', 'specific', 'Payment Mehtod'),
(2701, 2, 'label_created_by', 'specific', 'Created By'),
(2702, 2, 'title_supplier_due_paid', 'specific', 'Supplier Due Paid'),
(2703, 2, 'text_supplier_due_paid_title', 'specific', 'Supplier Due Paid'),
(2704, 2, 'text_supplier_due_paid_sub_title', 'specific', 'Supplier Due Paid'),
(2705, 2, 'title_sell_report', 'specific', 'Sell Report'),
(2706, 2, 'text_selling_report_title', 'specific', 'Selling Report'),
(2707, 2, 'text_selling_report_sub_title', 'specific', 'Selling Report'),
(2708, 2, 'button_itemwise', 'specific', 'Itemwise'),
(2709, 2, 'button_categorywise', 'specific', 'Categorywise'),
(2710, 2, 'button_supplierwise', 'specific', 'Supplierwise'),
(2711, 2, 'label_product_name', 'specific', 'Product Name'),
(2712, 2, 'label_selling_price_tax', 'specific', 'Selling Price Tax'),
(2713, 2, 'label_profit', 'specific', 'Profit'),
(2714, 2, 'title_purchase_report', 'specific', 'Purchase Report'),
(2715, 2, 'text_purchase_report_title', 'specific', 'Purchase Report'),
(2716, 2, 'text_purchase_report_sub_title', 'specific', 'Informe de compra'),
(2717, 2, 'label_sup_name', 'specific', 'Sup Name'),
(2718, 2, 'title_sell_payment_report', 'specific', 'Sell Payment Report'),
(2719, 2, 'text_sell_payment_report_title', 'specific', 'Sell Payment Report'),
(2720, 2, 'title_purchase_payment_report', 'specific', 'Purchase Payment Report'),
(2721, 2, 'text_purchase_payment_report_title', 'specific', 'Purchase Payment Report'),
(2722, 2, 'title_sell_tax_report', 'specific', 'Sell Tax Report'),
(2723, 2, 'text_sell_tax_report_title', 'specific', 'Sell Tax Report '),
(2724, 2, 'text_sell_amount', 'specific', 'Sell Amount'),
(2725, 2, 'text_product_tax_amount', 'specific', 'Product Tax'),
(2726, 2, 'text_order_tax_amount', 'specific', 'Order Tax'),
(2727, 2, 'text_tax_report_sub_title', 'specific', 'Tax Report '),
(2728, 2, 'label_total_amount', 'specific', 'Total Amount'),
(2729, 2, 'title_purchase_tax_report', 'specific', 'Purchase Tax Report'),
(2730, 2, 'text_purchase_tax_report_title', 'specific', 'Purchase Tax Report'),
(2731, 2, 'text_total_tax_amount', 'specific', 'Total Tax'),
(2732, 2, 'text_purchase_tax_report_sub_title', 'specific', 'Purcahse Tax Report'),
(2733, 2, 'label_tax_amount', 'specific', 'Tax Amount'),
(2734, 2, 'title_tax_overview_report', 'specific', 'Tax Overview Report'),
(2735, 2, 'text_tax_overview_report_title', 'specific', 'Tax Overview Report'),
(2736, 2, 'text_sell_tax', 'specific', 'Sell Tax'),
(2737, 2, 'text_purchase_tax', 'specific', 'Purchase Tax'),
(2738, 2, 'label_tax_percent', 'specific', 'Tax Percent'),
(2739, 2, 'label_count', 'specific', 'Count'),
(2740, 2, 'title_stock_report', 'specific', 'Stock Report'),
(2741, 2, 'text_stock_report_title', 'specific', 'Stock Report'),
(2742, 2, 'text_stock_report', 'specific', 'Stock Report'),
(2743, 2, 'supplier_name', 'specific', 'Supplier Name'),
(2744, 2, 'title_filemanager', 'specific', 'Filemanager'),
(2745, 2, 'title_loan', 'specific', 'Loan'),
(2746, 2, 'text_loan_title', 'specific', 'Loan'),
(2747, 2, 'text_take_loan_title', 'specific', 'Take Loan'),
(2748, 2, 'label_loan_from', 'specific', 'Loan From'),
(2749, 2, 'label_interest', 'specific', 'Interest'),
(2750, 2, 'label_loan_for', 'specific', 'Loan For'),
(2751, 2, 'text_loan_list_title', 'specific', 'Loan List'),
(2752, 2, 'button_paid', 'specific', 'Paid'),
(2753, 2, 'button_due', 'specific', 'Due'),
(2754, 2, 'button_disabled', 'specific', 'Disabled'),
(2755, 2, 'label_basic_amount', 'specific', 'Basic Amount'),
(2756, 2, 'title_loan_summary', 'specific', 'Loan Summary'),
(2757, 2, 'text_loan_summary_title', 'specific', 'Loan Summary'),
(2758, 2, 'text_summary_title', 'specific', 'Summary'),
(2759, 2, 'text_total_loan', 'specific', 'Total Loan'),
(2760, 2, 'text_total_due', 'specific', 'Total Due'),
(2761, 2, 'text_recent_payments', 'specific', 'Recent Payments'),
(2762, 2, 'title_expense', 'specific', 'Expense'),
(2763, 2, 'text_expense_title', 'specific', 'Expense'),
(2764, 2, 'text_new_expense_title', 'specific', 'Add New Expense'),
(2765, 2, 'label_returnable', 'specific', 'Returnable?'),
(2766, 2, 'label_notes', 'specific', 'Notes'),
(2767, 2, 'text_expense_list_title', 'specific', 'Expense Category List'),
(2768, 2, 'label_category_name', 'specific', 'Category Name'),
(2769, 2, 'title_expense_category', 'specific', 'Expense Category'),
(2770, 2, 'text_expense_category_title', 'specific', 'Expense Category'),
(2771, 2, 'text_new_expense_category_title', 'specific', 'Add New Expense Category'),
(2772, 2, 'label_category_slug', 'specific', 'Category Slug'),
(2773, 2, 'label_parent', 'specific', 'Parent'),
(2774, 2, 'label_category_details', 'specific', 'Category Details'),
(2775, 2, 'text_category_list_title', 'specific', 'Category List'),
(2776, 2, 'title_expense_monthwise', 'specific', 'Expense Monthwise'),
(2777, 2, 'text_expense_monthwise_title', 'specific', 'Expense Monthwise'),
(2778, 2, 'text_print', 'specific', 'Print'),
(2779, 2, 'text_supplier_list_title', 'specific', 'Supplier List'),
(2780, 2, 'text_supplier_title', 'specific', 'Supplier '),
(2781, 2, 'text_new_supplier_title', 'specific', 'Add New Supplier'),
(2782, 2, 'title_purchase_transaction', 'specific', 'Purchase Transaction'),
(2783, 2, 'text_purchase_transaction_title', 'specific', 'Purchase Transaction'),
(2784, 2, 'text_transaction_title', 'specific', 'Transaction'),
(2785, 2, 'text_transaction_list_title', 'specific', 'Transaction List'),
(2786, 2, 'label_pmethod', 'specific', 'Payment Method'),
(2787, 2, 'title_sell_transaction', 'specific', 'Sell Transaction'),
(2788, 2, 'text_sell_transaction_title', 'specific', 'Sell Transaction'),
(2789, 2, 'text_sell_transaction_list_title', 'specific', 'Sell Transaction List'),
(2790, 2, 'title_barcode', 'specific', 'Barcode'),
(2791, 2, 'text_barcode_title', 'specific', 'Barcode'),
(2792, 2, 'text_barcode_generate_title', 'specific', 'Barcode Generate'),
(2793, 2, 'label_product_name_with_code', 'specific', 'Product Name with Code'),
(2794, 2, 'text_no_product', 'specific', 'No. Proudct'),
(2795, 2, 'label_page_layout', 'specific', 'Page Layout'),
(2796, 2, 'label_fields', 'specific', 'Fileds'),
(2797, 2, 'button_generate', 'specific', 'Generate'),
(2798, 2, 'title_category', 'specific', 'Category'),
(2799, 2, 'text_category_title', 'specific', 'Category'),
(2800, 2, 'text_new_category_title', 'specific', 'Add New Category'),
(2801, 2, 'text_product_import_alert', 'specific', 'Product Import Alert'),
(2802, 2, 'title_import_product', 'specific', 'Import Product'),
(2803, 2, 'text_import_title', 'specific', 'Import'),
(2804, 2, 'text_download', 'specific', 'Download'),
(2805, 2, 'button_download', 'specific', 'Download'),
(2806, 2, 'text_select_xls_file', 'specific', 'Select .xls File'),
(2807, 2, 'button_import', 'specific', 'Import'),
(2808, 2, 'title_stock_alert', 'specific', 'Stock Alert'),
(2809, 2, 'text_stock_alert_title', 'specific', 'Stock Alert'),
(2810, 2, 'text_stock_alert_box_title', 'specific', 'Stock Alert'),
(2811, 2, 'title_expired', 'specific', 'Expired'),
(2812, 2, 'text_expired_title', 'specific', 'Expired'),
(2813, 2, 'text_expired_box_title', 'specific', 'Expired'),
(2814, 2, 'button_expired', 'specific', 'Expired'),
(2815, 2, 'button_expiring_soon', 'specific', 'Comming Soon'),
(2816, 2, 'text_due', 'specific', 'Due'),
(2817, 2, 'title_purchase_return', 'specific', 'Purchase Return'),
(2818, 2, 'text_purchase_return_title', 'specific', 'Purchase Return'),
(2819, 2, 'text_return_list_title', 'specific', 'Return List'),
(2820, 2, 'text_purchase_return_list_title', 'specific', 'Purchase Return List'),
(2821, 2, 'title_sell_return', 'specific', 'Sell Return'),
(2822, 2, 'text_sell_return_title', 'specific', 'Sell Return'),
(2823, 2, 'text_sell_return_list_title', 'specific', 'Sell Return List'),
(2824, 2, 'title_giftcard', 'specific', 'Giftcard'),
(2825, 2, 'text_giftcard_title', 'specific', 'Giftcard'),
(2826, 2, 'text_new_giftcard_title', 'specific', 'Add New Giftcard'),
(2827, 2, 'label_card_no', 'specific', 'Card No.'),
(2828, 2, 'label_giftcard_value', 'specific', 'GIftcard Value'),
(2829, 2, 'label_expiry_date', 'specific', 'Expiry Date'),
(2830, 2, 'button_create_giftcard', 'specific', 'Create GIftcard'),
(2831, 2, 'text_giftcard_list_title', 'specific', 'Giftcard List'),
(2832, 2, 'label_expiry', 'specific', 'Expiry'),
(2833, 2, 'label_topup', 'specific', 'Topup'),
(2834, 2, 'title_giftcard_topup', 'specific', 'Giftcard Topup'),
(2835, 2, 'text_giftcard_topup_title', 'specific', 'Giftcard Topup'),
(2836, 2, 'text_topup_title', 'specific', 'Topup'),
(2837, 2, 'text_giftcard_topup_list_title', 'specific', 'Giftcard Popup List'),
(2838, 2, 'title_pos', 'specific', 'POS'),
(2839, 2, 'text_gift_card', 'specific', 'Giftcard'),
(2840, 2, 'button_sell_gift_card', 'specific', 'Giftcard'),
(2841, 2, 'text_keyboard_shortcut', 'specific', 'Keyboard Shortcut '),
(2842, 2, 'text_holding_order', 'specific', 'Holding Order'),
(2843, 2, 'text_search_product', 'specific', 'Search/Barcode Scan'),
(2844, 2, 'button_add_product', 'specific', 'Add Product'),
(2845, 2, 'button_purchase_now', 'specific', 'Purchase Now'),
(2846, 2, 'label_add_to_cart', 'specific', 'Add To Cart'),
(2847, 2, 'text_add_note', 'specific', 'Add Note'),
(2848, 2, 'label_price', 'specific', 'Price'),
(2849, 2, 'label_total_items', 'specific', 'Total Item'),
(2850, 2, 'label_discount', 'specific', 'Discount'),
(2851, 2, 'label_total_payable', 'specific', 'Total Payable'),
(2852, 2, 'button_pay', 'specific', 'Pay Now'),
(2853, 2, 'button_hold', 'specific', 'Hold'),
(2854, 2, 'text_update_title', 'specific', 'Update 1'),
(2855, 2, 'text_male', 'specific', 'Male'),
(2856, 2, 'text_female', 'specific', 'Female'),
(2857, 2, 'text_thumbnail', 'specific', 'Thumbnail'),
(2858, 2, 'text_update_success', 'specific', 'Successfully Updated'),
(2859, 2, 'title_user_profile', 'specific', 'User Profile'),
(2860, 2, 'text_profile_title', 'specific', 'Profile'),
(2861, 2, 'text_users', 'specific', 'Users'),
(2862, 2, 'text_since', 'specific', 'Since'),
(2863, 2, 'text_contact_information', 'specific', 'Contact Information'),
(2864, 2, 'label_collection', 'specific', 'Collection'),
(2865, 2, 'text_sell_report', 'specific', 'Sell Report'),
(2866, 2, 'text_purchase_report', 'specific', 'Purchase Report'),
(2867, 2, 'text_payment_report', 'specific', 'Payment Report'),
(2868, 2, 'text_login_log', 'specific', 'Login History'),
(2869, 2, 'button_collection_report', 'specific', 'Collection Report'),
(2870, 2, 'button_log', 'specific', 'Log'),
(2871, 2, 'text_invoice_list', 'specific', 'Invoice List'),
(2872, 2, 'label_items', 'specific', 'Items'),
(2873, 2, 'label_time', 'specific', 'Time'),
(2874, 2, 'title_bank_transactions', 'specific', 'Bank Transactions'),
(2875, 2, 'text_bank_transaction_title', 'specific', 'Bank Transaction'),
(2876, 2, 'text_bank_account_title', 'specific', 'Bank Account'),
(2877, 2, 'text_bank_transaction_list_title', 'specific', 'Bank Transaction List'),
(2878, 2, 'button_filtering', 'specific', 'Filtering'),
(2879, 2, 'text_view_all_transactions', 'specific', 'View All Transactions'),
(2880, 2, 'label_account', 'specific', 'Account'),
(2881, 2, 'label_credit', 'specific', 'Credit'),
(2882, 2, 'label_debit', 'specific', 'Debit'),
(2883, 2, 'text_unpaid', 'specific', 'Unpaid'),
(2884, 2, 'title_income_source', 'specific', 'Income Source'),
(2885, 2, 'text_income_source_title', 'specific', 'Income Source'),
(2886, 2, 'text_new_income_source_title', 'specific', 'Add New Income Source'),
(2887, 2, 'label_source_name', 'specific', 'Source Name'),
(2888, 2, 'label_source_slug', 'specific', 'Source Slug'),
(2889, 2, 'label_source_details', 'specific', 'Source Details'),
(2890, 2, 'text_income_source_sub_title', 'specific', 'Income Source List'),
(2891, 2, 'title_income_monthwise', 'specific', 'Income Monthwise'),
(2892, 2, 'text_income_monthwise_title', 'specific', 'Income Monthwise'),
(2893, 2, 'label_capital', 'specific', 'Capital'),
(2894, 2, 'title_bank_transfer', 'specific', 'Bank Transfer'),
(2895, 2, 'text_bank_transfer_title', 'specific', 'Bank Transfer'),
(2896, 2, 'text_banking_title', 'specific', 'Banking'),
(2897, 2, 'text_list_bank_transfer_title', 'specific', 'Bank Transfer List'),
(2898, 2, 'label_from_account', 'specific', 'From Account'),
(2899, 2, 'label_to_account', 'specific', 'To Account'),
(2900, 2, 'title_income_and_expense', 'specific', 'Income '),
(2901, 2, 'text_income_and_expense_title', 'specific', 'Income vs Expense'),
(2902, 2, 'text_date', 'specific', 'Date'),
(2903, 2, 'title_income', 'specific', 'Income'),
(2904, 2, 'label_this_month', 'specific', 'This Month'),
(2905, 2, 'label_this_year', 'specific', 'This Year'),
(2906, 2, 'label_till_now', 'specific', 'Till Now'),
(2907, 2, 'error_currency_title', 'specific', 'Currency Tittle is not valid'),
(2908, 2, 'text_pmethod', 'specific', 'Payment Method'),
(2909, 2, 'button_full_payment', 'specific', 'FULL PAYMENT'),
(2910, 2, 'button_full_due', 'specific', 'FULL DUE'),
(2911, 2, 'button_sell_with_installment', 'specific', 'Sell With Installment'),
(2912, 2, 'text_pay_amount', 'specific', 'Pay Amount'),
(2913, 2, 'placeholder_input_an_amount', 'specific', 'Input Amount'),
(2914, 2, 'placeholder_note_here', 'specific', 'Note Here'),
(2915, 2, 'title_installment_details', 'specific', 'Installment Details'),
(2916, 2, 'label_duration', 'specific', 'Duration'),
(2917, 2, 'text_days', 'specific', 'Days'),
(2918, 2, 'label_interval', 'specific', 'Interval'),
(2919, 2, 'label_total_installment', 'specific', 'Total Installment'),
(2920, 2, 'label_interest_percentage', 'specific', 'Interest Percentage'),
(2921, 2, 'label_interest_amount', 'specific', 'Interest Amount'),
(2922, 2, 'text_order_details', 'specific', 'Order Details'),
(2923, 2, 'error_reference_no', 'specific', 'Reference no. is not valid'),
(2924, 2, 'error_date', 'specific', 'Date is not valid'),
(2925, 2, 'error_total_amount', 'specific', 'Total amount is not valid'),
(2926, 2, 'error_customer', 'specific', 'Customer is not valid'),
(2927, 2, 'text_quotation_create_success', 'specific', 'Successfully Created'),
(2928, 2, 'button_action', 'specific', 'Action'),
(2929, 2, 'button_create_sell', 'specific', 'Create Sell'),
(2930, 2, 'title_installment_overview', 'specific', 'Installment Overview'),
(2931, 2, 'text_installment_overview_title', 'specific', 'Installment Overview Report'),
(2932, 2, 'text_installment_overview', 'specific', 'Installment Overview'),
(2933, 2, 'text_invoice_count', 'specific', 'Invoice Count'),
(2934, 2, 'text_interest_amount', 'specific', 'Interest Amount'),
(2935, 2, 'text_amount_received', 'specific', 'Amount Received'),
(2936, 2, 'text_amount_due', 'specific', 'Amount Due'),
(2937, 2, 'text_expired_due_payment', 'specific', 'Expired Due Payment'),
(2938, 2, 'text_all_due_payment', 'specific', 'All Due Payment'),
(2939, 2, 'text_todays_due_payment', 'specific', 'Todays Due Payment'),
(2940, 2, 'title_installment', 'specific', 'Installment'),
(2941, 2, 'text_installment_title', 'specific', 'Installment'),
(2942, 2, 'text_installment_sub_title', 'specific', 'Installment List'),
(2943, 2, 'button_all_installment', 'specific', 'All Installment'),
(2944, 2, 'button_due_installment', 'specific', 'Due Installment'),
(2945, 2, 'button_paid_installment', 'specific', 'Paid Installment'),
(2946, 2, 'label_total_ins', 'specific', 'Total Ins.'),
(2947, 2, 'text_order_summary', 'specific', 'Order Summary'),
(2948, 2, 'label_previous_due', 'specific', 'Previous Due'),
(2949, 2, 'text_return_item', 'specific', 'Return Item'),
(2950, 2, 'label_return_quantity', 'specific', 'Return Quantity'),
(2951, 2, 'placeholder_type_any_note', 'specific', 'Type Note'),
(2952, 2, 'error_quantity_exceed', 'specific', 'Quantity Exceed'),
(2953, 2, 'text_return_success', 'specific', 'Return Successfull'),
(2954, 2, 'label_purchase_note', 'specific', 'Purchase Note'),
(2955, 2, 'text_purchase_update_success', 'specific', 'Successfully Updated'),
(2956, 2, 'error_items', 'specific', 'Items is not valid'),
(2957, 2, 'error_store_id', 'specific', 'Store is not valid'),
(2958, 2, 'text_transfer_success', 'specific', 'Successfully Transfered'),
(2959, 2, 'button_transfer_edit', 'specific', 'Transfer Edit'),
(2960, 2, 'text_update_transfer_status_success', 'specific', 'Successfully Updated'),
(2961, 2, 'label_transferred_to', 'specific', 'Transfered To'),
(2962, 2, 'text_product_list', 'specific', 'Product List'),
(2963, 2, 'error_category_name', 'specific', 'Category name is not valid'),
(2964, 2, 'error_sup_name', 'specific', 'Suppllier name is not valid'),
(2965, 2, 'error_supplier_email_or_mobile', 'specific', 'Supplier email or mobile is not valid'),
(2966, 2, 'error_sup_address', 'specific', 'Supplier Address is not valid'),
(2967, 2, 'error_unit_name', 'specific', 'Unit name is not valid'),
(2968, 2, 'error_product_name', 'specific', 'Product name is not valid'),
(2969, 2, 'error_sup_id', 'specific', 'Supplier is not valid'),
(2970, 2, 'text_product_name', 'specific', 'Product Name'),
(2971, 2, 'text_quantity', 'specific', 'Quantity'),
(2972, 2, 'button_print', 'specific', 'Print'),
(2973, 2, 'error_walking_customer_can_not_craete_due', 'specific', 'Walking Customer Can\'t to Create a Due'),
(2974, 2, 'error_stock', 'specific', 'Stock amount is not valid'),
(2975, 2, 'error_installment_count', 'specific', 'Installment count is not valid'),
(2976, 2, 'title_bank_account', 'specific', 'Bank Account'),
(2977, 2, 'text_new_bank_account_title', 'specific', 'Add New Bank Account'),
(2978, 2, 'label_account_name', 'specific', 'Account Name'),
(2979, 2, 'label_account_details', 'specific', 'Account Details'),
(2980, 2, 'label_account_no', 'specific', 'Account No.'),
(2981, 2, 'label_contact_person', 'specific', 'Contact Person'),
(2982, 2, 'label_internal_banking_url', 'specific', 'Internal Banking Url'),
(2983, 2, 'text_bank_account_list_title', 'specific', 'Bank Account List'),
(2984, 2, 'label_account_description', 'specific', 'Account Description'),
(2985, 2, 'title_bank_account_sheet', 'specific', 'Balance Sheet'),
(2986, 2, 'text_bank_account_sheet_title', 'specific', 'Balance Sheet'),
(2987, 2, 'text_bank_account_sheet_list_title', 'specific', 'Balance Sheet Details'),
(2988, 2, 'label_account_id', 'specific', 'Account Id'),
(2989, 2, 'label_transfer_to_other', 'specific', 'Transfer To Other'),
(2990, 2, 'label_transfer_from_other', 'specific', 'Transfer From Other'),
(2991, 2, 'label_deposit', 'specific', 'Deposit'),
(2992, 2, 'label_withdraw', 'specific', 'Widthdraw'),
(2993, 2, 'text_select_store', 'specific', 'Select Store'),
(2994, 2, 'text_activate_success', 'specific', 'Successfully Activated'),
(2995, 2, 'text_template_content_update_success', 'specific', 'Successfully updated'),
(2996, 2, 'text_template_css_update_success', 'specific', 'Successfully updated'),
(2997, 2, 'title_cashbook', 'specific', 'Cashbook'),
(2998, 2, 'text_cashbook_title', 'specific', 'Cashbook'),
(2999, 2, 'text_cashbook_details_title', 'specific', 'Cashbook Details'),
(3000, 2, 'label_opening_balance', 'specific', 'Opening Balance'),
(3001, 2, 'label_today_income', 'specific', 'Today Income'),
(3002, 2, 'label_total_income', 'specific', 'Total Income'),
(3003, 2, 'label_today_expense', 'specific', 'Today Expense'),
(3004, 2, 'label_cash_in_hand', 'specific', 'Cash In Hand'),
(3005, 2, 'label_today_closing_balance', 'specific', 'Today Closing Balance'),
(3006, 2, 'text_balance_update_success', 'specific', 'Successfully Updated'),
(3007, 2, 'title_profit_and_loss', 'specific', 'Profit vs Loss'),
(3008, 2, 'text_profit_and_loss_title', 'specific', 'Profit vs Loss'),
(3009, 2, 'text_profit_and_loss_details_title', 'specific', 'Profit vs Loss Details'),
(3010, 2, 'text_loss_title', 'specific', 'Loss'),
(3011, 2, 'text_profit_title', 'specific', 'Profit'),
(3012, 2, 'label_total_profit', 'specific', 'Total Profit'),
(3013, 2, 'label_total_loss', 'specific', 'Total Loss'),
(3014, 2, 'label_net_profit', 'specific', 'Net Profit'),
(3015, 2, 'label_source', 'specific', 'Source'),
(3016, 2, 'label_slip_no', 'specific', 'Slip No.'),
(3017, 2, 'label_by', 'specific', 'By'),
(3018, 2, 'label_exp_category', 'specific', 'Expense Category'),
(3019, 2, 'label_about', 'specific', 'About'),
(3020, 2, 'button_withdraw_now', 'specific', 'Widthdraw Now'),
(3021, 2, 'label_income_source', 'specific', 'Income Source'),
(3022, 2, 'button_deposit_now', 'specific', 'Deposit Now'),
(3023, 2, 'text_deposit_success', 'specific', 'Deposit Successfull'),
(3024, 2, 'text_delete_title', 'specific', 'Delete'),
(3025, 2, 'text_delete_instruction', 'specific', 'What should be done with data belong to the content?'),
(3026, 2, 'label_insert_content_to', 'specific', 'Insert Content To'),
(3027, 2, 'button_add_language', 'specific', 'Add Language'),
(3028, 2, 'code', 'specific', 'code'),
(3029, 2, 'error_code', 'specific', 'Code is not valid'),
(3030, 2, 'text_uppdate_success', 'specific', 'Successfully Updated');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(3031, 2, 'error_name', 'specific', 'Name is not valid'),
(3032, 2, 'text_hindi', 'specific', 'Hindi'),
(3033, 2, 'text_create_success', 'specific', 'Successfully Created'),
(3034, 2, 'text_gremany', 'specific', 'Germany'),
(3035, 2, 'button_add_new_language', 'specific', 'Add New Language'),
(3036, 2, 'text_fullscreen', 'specific', 'Fullscreen'),
(3037, 2, 'text_sales', 'specific', 'Sells'),
(3038, 2, 'text_quotations', 'specific', 'Quotations'),
(3039, 2, 'text_purchases', 'specific', 'Purchases'),
(3040, 2, 'text_transfers', 'specific', 'Transfers'),
(3041, 2, 'text_customers', 'specific', 'Customers'),
(3042, 2, 'text_suppliers', 'specific', 'Suppliers'),
(3043, 2, 'label_payment_status', 'specific', 'Payment Status'),
(3044, 2, 'button_add_sales', 'specific', 'Add Sell'),
(3045, 2, 'button_list_sales', 'specific', 'SELL LIST'),
(3046, 2, 'text_sales_amount', 'specific', 'Sell Amount'),
(3047, 2, 'text_discount_given', 'specific', 'Discount Given'),
(3048, 2, 'text_received_amount', 'specific', 'Received Amount'),
(3049, 2, 'button_add_quotations', 'specific', 'Add Quotation'),
(3050, 2, 'button_list_quotations', 'specific', 'Quotation List'),
(3051, 2, 'label_supplier_name', 'specific', 'Supplier Name'),
(3052, 2, 'button_add_purchases', 'specific', 'Add Purchase'),
(3053, 2, 'button_list_purchases', 'specific', 'Purchase List'),
(3054, 2, 'button_add_transfers', 'specific', 'Add Transfer'),
(3055, 2, 'button_list_transfers', 'specific', 'Transfer List'),
(3056, 2, 'button_add_customer', 'specific', 'Add Customer'),
(3057, 2, 'button_list_customers', 'specific', 'Customer List'),
(3058, 2, 'button_add_supplier', 'specific', 'Add Supplier'),
(3059, 2, 'button_list_suppliers', 'specific', 'Supplier List'),
(3060, 2, 'text_permission', 'specific', 'Permission'),
(3061, 2, 'text_recent_activities', 'specific', 'Recent Activities'),
(3062, 2, 'text_top_products', 'specific', 'Top Products'),
(3063, 2, 'text_top_customers', 'specific', 'Top Customers'),
(3064, 2, 'text_top_suppliers', 'specific', 'Top Suppliers'),
(3065, 2, 'text_top_brands', 'specific', 'Top Brands'),
(3066, 2, 'text_amount', 'specific', 'Amount'),
(3067, 2, 'text_purchase', 'specific', 'Purchase 2'),
(3068, 2, 'title_login_logs', 'specific', 'Login Logs'),
(3069, 2, 'title_activity_logs', 'specific', 'Activity Logs'),
(3070, 2, 'text_birthday_today', 'specific', 'Birthday Today'),
(3071, 2, 'text_birthday_coming', 'specific', 'Birthday Coming'),
(3072, 2, 'title_income_vs_expense', 'specific', 'Income vs Expense'),
(3073, 2, 'text_download_as_jpg', 'specific', 'Download as PNG'),
(3074, 2, 'error_disabled_by_default', 'specific', 'Disabled By Default'),
(3075, 2, 'button_empty_value', 'specific', 'Empty Value'),
(3076, 2, 'text_invoice_create_success', 'specific', 'Successfully Created'),
(3077, 2, 'button_send_sms', 'specific', 'Send SMS'),
(3078, 2, 'button_email', 'specific', 'Email'),
(3079, 2, 'button_back_to_pos', 'specific', 'Back to POS'),
(3080, 2, 'error_status', 'specific', 'Status is not valid'),
(3081, 2, 'error_reference_no_exist', 'specific', 'Ref. no. is not valid'),
(3082, 2, 'text_view_invoice_title', 'specific', 'View Invoice Title'),
(3083, 2, 'text_new_dashboard', 'specific', 'New Dashboard'),
(3084, 2, 'text_recent_customer_box_title', 'specific', 'Recent Customers'),
(3085, 2, 'label_customer_mobile', 'specific', 'Customer Mobile'),
(3086, 2, 'label_invoice_note', 'specific', 'Invoice Note'),
(3087, 2, 'text_sell_update_success', 'specific', 'Successfully Updated'),
(3088, 2, 'label_customer_id', 'specific', 'Customer Id'),
(3089, 2, 'label_returened_by', 'specific', 'Returned By'),
(3090, 2, 'text_return_products', 'specific', 'Return Products'),
(3091, 2, 'button_topup', 'specific', 'Topup'),
(3092, 2, 'button_topup_now', 'specific', 'Topup Now'),
(3093, 2, 'error_amount', 'specific', 'Amount is not Valid'),
(3094, 2, 'error_expiry_date', 'specific', 'Expiry Date'),
(3095, 2, 'text_topup_success', 'specific', 'Topup Successfull'),
(3096, 2, 'label_vat_number', 'specific', 'VAT Number'),
(3097, 2, 'label_unit_price', 'specific', 'Unit Price'),
(3098, 2, 'label_shipping', 'specific', 'Shipping'),
(3099, 2, 'label_stamp_and_signature', 'specific', 'Stamp and Signature'),
(3100, 2, 'title_quotation_edit', 'specific', 'Quotation Edit'),
(3101, 2, 'text_quotation_edit_title', 'specific', 'Quotation Edit'),
(3102, 2, 'text_quotation_update_success', 'specific', 'Successfully Updated'),
(3103, 2, 'error_product_not_found', 'specific', 'Product Not Found'),
(3104, 2, 'error_invoice_product_type', 'specific', 'Invoice product type is not valid'),
(3105, 2, 'label_checkout_status', 'specific', 'Checkout Status'),
(3106, 2, 'label_sub_total', 'specific', 'Sub Total'),
(3107, 2, 'text_payments', 'specific', 'Payments'),
(3108, 2, 'error_select_at_least_one_item', 'specific', 'Seleccione al menos un producto'),
(3109, 2, 'button_pay_now', 'specific', 'Pay Now'),
(3110, 2, 'text_billing_details', 'specific', 'Billing Details'),
(3111, 2, 'Print Barcode', 'specific', 'undefined'),
(3112, 2, 'error_new_category_name', 'specific', 'Please select a category'),
(3113, 2, 'error_customer_name', 'specific', 'Customer name is not valid'),
(3114, 2, 'error_expired_date_below', 'specific', 'Expired date is not valid'),
(3115, 2, 'label_insert_invoice_to', 'specific', 'Insert Invoice To'),
(3116, 2, 'error_new_customer_name', 'specific', 'Please select a customer'),
(3117, 2, 'title_customer_profile', 'specific', 'Customer Profile'),
(3118, 2, 'text_total_purchase', 'specific', 'Total Purchase'),
(3119, 2, 'label_mobile_phone', 'specific', 'Mobile Phone'),
(3120, 2, 'button_transaction_list', 'specific', 'Transaction List'),
(3121, 2, 'label_ref_invoice_Id', 'specific', 'Ref. Invoice Id'),
(3122, 2, 'error_code_name', 'specific', 'Code name is not valid'),
(3123, 2, 'title_supplier_profile', 'specific', 'Supplier Profile'),
(3124, 2, 'text_supplier_profile_title', 'specific', 'Supplier Profile'),
(3125, 2, 'text_supplier_products', 'specific', 'Supplier Products'),
(3126, 2, 'button_products', 'specific', 'Products'),
(3127, 2, 'text_balance_amount', 'specific', 'Balance Amount'),
(3128, 2, 'text_sells', 'specific', 'Sells'),
(3129, 2, 'text_chart', 'specific', 'Chart'),
(3130, 2, 'text_purchase_invoice_list', 'specific', 'Purchase Invoice List'),
(3131, 2, 'button_all_purchase', 'specific', 'All Purchase'),
(3132, 2, 'button_due_purchase', 'specific', 'Due Purchase'),
(3133, 2, 'button_paid_purchase', 'specific', 'Paid Purchase'),
(3134, 2, 'button_stock_transfer', 'specific', 'Stock Transfer'),
(3135, 2, 'text_selling_invoice_list', 'specific', 'Selling Invoice List'),
(3136, 2, 'error_account', 'specific', 'Account is not valid'),
(3137, 2, 'error_ref_no', 'specific', 'Ref. no. is not valid'),
(3138, 2, 'error_about', 'specific', 'About is not valid'),
(3139, 2, 'error_title', 'specific', 'Title is not valid'),
(3140, 2, 'text_withdraw_success', 'specific', 'successfully created'),
(3141, 2, 'error_from_account', 'specific', 'From account is not valid'),
(3142, 2, 'error_to_account', 'specific', 'To account is not valid'),
(3143, 2, 'error_same_account', 'specific', 'Receiver and sender can\'t be same'),
(3144, 2, 'error_insufficient_balance', 'specific', 'Insufficient balance'),
(3145, 2, 'error_ref_no_exist', 'specific', 'Ref. no. already exists'),
(3146, 2, 'error_account_name', 'specific', 'Account name is not valid'),
(3147, 2, 'error_account_no', 'specific', 'Account no. is not valid'),
(3148, 2, 'error_contact_person', 'specific', 'Contact person is not valid'),
(3149, 2, 'error_phone_number', 'specific', 'Phone number is not valid'),
(3150, 2, 'text_income', 'specific', 'Income'),
(3151, 2, 'text_expense', 'specific', 'Expense'),
(3152, 2, 'text_update_income_source_success', 'specific', 'Successfully updated'),
(3153, 2, 'error_new_source_name', 'specific', 'Please select a source'),
(3154, 2, 'text_delete_income_source_success', 'specific', 'Successfully deleted'),
(3155, 2, 'label_day', 'specific', 'Day'),
(3156, 2, 'error_category_id', 'specific', 'Category id is not valid'),
(3157, 2, 'button_viefw', 'specific', 'View'),
(3158, 2, 'label_summary', 'specific', 'Summary'),
(3159, 2, 'label_grand_total', 'specific', 'Grand Total'),
(3160, 2, 'label_this_week', 'specific', 'This Week'),
(3161, 2, 'error_loan_from', 'specific', 'Loan from is not valid'),
(3162, 2, 'error_loan_headline', 'specific', 'Loan headline is not valid'),
(3163, 2, 'error_loan_amount', 'specific', 'Loan amount is not valid'),
(3164, 2, 'text_take_loan_success', 'specific', 'Successfully created'),
(3165, 2, 'error_paid_amount', 'specific', 'Paid amount is not valid'),
(3166, 2, 'error_pay_amount_greater_than_due_amount', 'specific', 'Pay amount can\'t be greater than due amount'),
(3167, 2, 'text_loan_paid_success', 'specific', 'Successfully paid'),
(3168, 2, 'error_sms_text', 'specific', 'SMS text is not valid'),
(3169, 2, 'text_success_sms_sent', 'specific', 'SMS successfully sent'),
(3170, 2, 'error_user_name', 'specific', 'user name is not valid'),
(3171, 2, 'error_user_email_or_mobile', 'specific', 'Email or mobile is not valid'),
(3172, 2, 'error_user_group', 'specific', 'User Group is not valid'),
(3173, 2, 'error_user_password_match', 'specific', 'Retype password didn\'t matched'),
(3174, 2, 'error_user_password_length', 'specific', 'User password length is not valid'),
(3175, 2, 'text_income_vs_expense', 'specific', 'Income vs Expense'),
(3176, 2, 'error_mobile', 'specific', 'Mobile number is not valid'),
(3177, 2, 'error_email', 'specific', 'Email is not valid'),
(3178, 2, 'error_zip_code', 'specific', 'Zip code is not valid'),
(3179, 2, 'error_addreess', 'specific', 'Address is not valid'),
(3180, 2, 'error_preference_receipt_template', 'specific', 'Receipt template is not valid'),
(3181, 2, 'error_currency', 'specific', 'Currency is not valid'),
(3182, 2, 'error_brand_name', 'specific', 'Please select a brand name'),
(3183, 2, 'title_brand_profile', 'specific', 'Brand Profile'),
(3184, 2, 'text_brand_profile_title', 'specific', 'Brand Profile'),
(3185, 2, 'text_brands', 'specific', 'Brands'),
(3186, 2, 'text_brand_products', 'specific', 'Brand Products'),
(3187, 2, 'button_all_products', 'specific', 'All Products'),
(3188, 2, 'text_total_sell', 'specific', 'Total Sell'),
(3189, 2, 'label_brand_name', 'specific', 'Brand Name'),
(3190, 2, 'label_insert_product_to', 'specific', 'Insert Product To'),
(3191, 2, 'error_currency_code', 'specific', 'Currency code is not valid'),
(3192, 2, 'error_currency_symbol', 'specific', 'Currency symbol is not valid'),
(3193, 2, 'error_currency_decimal_place', 'specific', 'Decimal number is not valid'),
(3194, 2, 'error_pmethod_name', 'specific', 'Payment method is not valid'),
(3195, 2, 'label_invoice_to', 'specific', 'Invoice To'),
(3196, 2, 'error_delete_unit_name', 'specific', 'Please select a unit'),
(3197, 2, 'label_ip', 'specific', 'Ip'),
(3198, 2, 'error_taxrate_name', 'specific', 'Taxrate name is not valid'),
(3199, 2, 'error_taxrate', 'specific', 'Taxrate is not valid'),
(3200, 2, 'error_delete_taxrate_name', 'specific', 'Please select a taxrate'),
(3201, 2, 'error_box_name', 'specific', 'Box name is not valid'),
(3202, 2, 'error_delete_box_name', 'specific', 'Please select a box'),
(3203, 2, 'label_success', 'specific', 'Success'),
(3204, 2, 'title_customer_analysis', 'specific', 'Customer Analysis'),
(3205, 2, 'title_customer_analytics', 'specific', 'Customer Analytics'),
(3206, 2, 'error_not_found', 'specific', 'Not Found'),
(3207, 2, 'menu_sell_list', 'specific', 'SELL LIST'),
(3208, 2, 'menu_sell_log', 'specific', 'SELL LOG'),
(3209, 2, 'menu_purchase_logs', 'specific', 'PURCHASE LOG'),
(3210, 2, 'menu_receive_list', 'specific', 'RECEIVE LIST'),
(3211, 2, 'menu_statements', 'specific', 'STATEMENTS'),
(3212, 2, 'menu_data_reset', 'specific', 'DATA RESET'),
(3213, 2, 'placeholder_search_here', 'specific', 'Search Here...'),
(3214, 2, 'text_sell_list_title', 'specific', 'Sell List'),
(3215, 2, 'text_invoices', 'specific', 'Invoices'),
(3216, 2, 'placeholder_input_discount_amount', 'specific', 'Input Discount Amount'),
(3217, 2, 'label_previous_due_paid', 'specific', 'Prev. Due Paid'),
(3218, 2, 'button_add_purchase', 'specific', 'Add Purchase'),
(3219, 2, 'text_selling_tax', 'specific', 'Selling Tax'),
(3220, 2, 'text_igst', 'specific', 'IGST'),
(3221, 2, 'text_cgst', 'specific', 'CGST'),
(3222, 2, 'text_sgst', 'specific', 'SGST'),
(3223, 2, 'text_return_amount', 'specific', 'Return Amount'),
(3224, 2, 'text_sell_due_paid_success', 'specific', 'Due successfully paid'),
(3225, 2, 'text_images', 'specific', 'Images'),
(3226, 2, 'label_hsn_code', 'specific', 'HSN Code'),
(3227, 2, 'label_select', 'specific', '-- Please Select --'),
(3228, 2, 'label_sold', 'specific', 'Sold'),
(3229, 2, 'button_view_details', 'specific', 'View'),
(3230, 2, 'text_installment_details', 'specific', 'Installment Details'),
(3231, 2, 'label_initial_payment', 'specific', 'Initial Payment'),
(3232, 2, 'label_interval_count', 'specific', 'Internal Count'),
(3233, 2, 'label_installment_count', 'specific', 'Installment Count'),
(3234, 2, 'label_last_installment_date', 'specific', 'Last Installment Date'),
(3235, 2, 'label_installment_end_date', 'specific', 'Installment End Date'),
(3236, 2, 'label_sl', 'specific', 'SL'),
(3237, 2, 'text_update_installment_payment_success', 'specific', 'Installment payment successfull'),
(3238, 2, 'error_amount_exceed', 'specific', 'Amount Exceed'),
(3239, 2, 'text_expiry', 'specific', 'Expiry'),
(3240, 2, 'text_opening_balance_update_success', 'specific', 'Opening balance successfully updated'),
(3241, 2, 'title_reset_your_system', 'specific', 'Reset your system'),
(3242, 2, 'title_sell_log', 'specific', 'Sell Log'),
(3243, 2, 'text_sell_log_title', 'specific', 'Sell Log'),
(3244, 2, 'text_sell_title', 'specific', 'Sell'),
(3245, 2, 'label_gtin', 'specific', ''),
(3246, 2, 'button_add_balance', 'specific', 'Add Balance'),
(3247, 2, 'button_statement', 'specific', 'Statement'),
(3248, 2, 'text_all_invoice', 'specific', 'All Invoice'),
(3249, 2, 'label_prev_due', 'specific', 'Prev. Due'),
(3250, 2, 'error_invoice_id', 'specific', 'Invoice id is not valid'),
(3251, 2, 'title_settings', 'specific', ''),
(3252, 2, 'text_cronjob', 'specific', ''),
(3253, 2, 'button_due_invoice_list', 'specific', ''),
(3254, 2, 'text_substract_amount', 'specific', ''),
(3255, 2, 'text_balance_added', 'specific', ''),
(3256, 2, 'button_substract_balance', 'specific', ''),
(3257, 2, 'title_purchase_log', 'specific', 'Purchase log'),
(3258, 2, 'text_purchase_log_title', 'specific', 'Purchase Log'),
(3259, 2, 'title_log_in', 'specific', ''),
(3260, 2, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;font-weight:bold&quot; href=&quot;http://docs.itsolution24.com/pos/&quot;&gt;Online Documentation&lt;/a&gt;  |  &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(3261, 2, 'error_disabled_in_demo', 'specific', 'This feature is disable in error!'),
(3262, 2, 'text_order_title', 'specific', ''),
(3263, 2, 'error_purchase_price', 'specific', ''),
(3264, 2, 'text_list__transfer__title', 'specific', ''),
(3265, 2, 'text_download_sample_format_file', 'specific', ''),
(3266, 2, 'text_barcode_print', 'specific', ''),
(3267, 2, 'button_semd_email', 'specific', ''),
(3268, 2, 'button_send_email', 'specific', 'Send Email'),
(3269, 2, 'error_email_not_sent', 'specific', ''),
(3270, 2, 'text_success_email_sent', 'specific', ''),
(3271, 2, 'button_installment_payment', 'specific', ''),
(3272, 2, 'text_sell_log_list_title', 'specific', 'Sell Log Details'),
(3273, 2, 'text_purchase_log_list_title', 'specific', 'Purchase Log Details'),
(3274, 2, 'text_stock_transfer_title', 'specific', ''),
(3275, 2, 'title_receive', 'specific', 'Receive'),
(3276, 2, 'text_stock_receive_title', 'specific', 'Stock Receive'),
(3277, 2, 'text_receive_title', 'specific', 'Receive'),
(3278, 2, 'text_list__receive__title', 'specific', 'Receive Details'),
(3279, 2, 'label_what_for', 'specific', ''),
(3280, 2, 'error_out_of_stock', 'specific', ''),
(3281, 2, 'xxx', 'specific', ''),
(3282, 2, 'error_login', 'specific', ''),
(3283, 2, 'text_purchase_due_paid_success', 'specific', ''),
(3284, 2, 'text_trash', 'specific', ''),
(3285, 2, 'button_restore_all', 'specific', 'Restore All'),
(3286, 2, 'success_restore_all', 'specific', ''),
(3287, 2, 'title_customer_statement', 'specific', ''),
(3288, 2, 'text_statement_title', 'specific', ''),
(3289, 2, 'title_profit', 'specific', ''),
(3290, 2, 'error_return_quantity_exceed', 'specific', ''),
(3291, 2, 'label_transferred_from', 'specific', ''),
(3292, 2, 'label_member_since', 'specific', ''),
(3293, 2, 'text_not_found', 'specific', ''),
(3294, 2, 'label_logged_in', 'specific', ''),
(3295, 2, 'text_disabled', 'specific', ''),
(3296, 2, 'text_gtin', 'specific', ''),
(3297, 2, 'text_balance', 'specific', ''),
(3298, 2, 'error_invalid_username_password', 'specific', ''),
(3299, 2, 'error_installment_interest_percentage', 'specific', ''),
(3300, 2, 'error_installment_interest_amount', 'specific', ''),
(3301, 2, 'button_resend', 'specific', ''),
(3302, 2, 'error_sms_not_sent', 'specific', ''),
(3303, 2, 'text_sms_logs_title', 'specific', ''),
(3304, 2, 'text_sms_history_title', 'specific', ''),
(3305, 2, 'error_mobile_exist', 'specific', ''),
(3306, 2, 'text_success_sms_schedule', 'specific', ''),
(3307, 2, 'text_success_sms_added_to_schedule', 'specific', ''),
(3308, 2, 'text_mimsms', 'specific', ''),
(3309, 2, 'label_api_token', 'specific', ''),
(3310, 2, 'error_gateway', 'specific', ''),
(3311, 2, 'error_sms_not_send', 'specific', ''),
(3312, 2, 'invoice_sms_text', 'specific', 'Dear [customer_name],  Invoice ID: [invoice_id],  Payable: [payable_amount],  Paid: [paid_amount] ,  Due: [due]. Purchase at- [date_time]. Regards, [store_name],  [address]'),
(3313, 2, 'text_stock_register', 'specific', ''),
(3314, 2, 'text_urdu', 'specific', ''),
(3315, 2, 'error_default_language', 'specific', ''),
(3316, 2, 'error_active_or_sold', 'specific', ''),
(3317, 2, 'title_home', 'specific', 'Home'),
(3318, 2, 'error_supplier_name', 'specific', ''),
(3319, 2, 'error_expired_date_belowx', 'specific', ''),
(3320, 2, 'title_categories', 'specific', ''),
(3321, 2, 'title_products', 'specific', 'Products'),
(3322, 2, 'title_shop_on_sale', 'specific', ''),
(3323, 2, 'title_cart', 'specific', 'Cart'),
(3324, 2, 'title_wishlist', 'specific', ''),
(3325, 2, 'title_account', 'specific', ''),
(3326, 2, 'title_contact', 'specific', ''),
(3327, 2, 'title_contact_us', 'specific', ''),
(3328, 2, 'title_return_refund', 'specific', ''),
(3329, 2, 'title_faq', 'specific', ''),
(3330, 2, 'title_terms_condition', 'specific', ''),
(3331, 2, 'title_support', 'specific', ''),
(3332, 2, 'title_login', 'specific', ''),
(3333, 2, 'title_about', 'specific', ''),
(3334, 2, 'text_restore_completed', 'specific', 'Restored successfully completed'),
(3335, 2, 'error_receipt_printer', 'specific', 'Receipt printer is not valid'),
(3336, 2, 'title_checkout', 'specific', 'Checkout'),
(3337, 2, 'label_credit_balance', 'specific', 'Credit Balance'),
(3338, 2, 'label_giftcard_taken', 'specific', 'Gift Card taken'),
(3339, 2, 'text_are_you_sure', 'specific', 'Are you sure?'),
(3340, 2, 'text_information', 'specific', 'Information'),
(3341, 2, 'text_store_access_success', 'specific', 'Store  successfully activated'),
(3342, 2, 'title_cart_empty', 'specific', 'Cart is empty'),
(3343, 2, 'title_payment', 'specific', 'Payment'),
(3344, 2, 'error_installment_duration', 'specific', 'Installment duration is not valid'),
(3345, 2, 'error_password_mismatch', 'specific', 'Confirm password did\'t match'),
(3346, 2, 'error_email_exist', 'specific', 'Email already exists!'),
(3347, 2, 'error_invalid_purchase_code', 'specific', 'Invalid Purchase Code'),
(3348, 2, 'label_member_since', 'specific', 'Member Since'),
(3349, 2, 'error_printer_ip_address_or_port', 'specific', 'IP address or Port'),
(3350, 2, 'error_printer_path', 'specific', 'Printer Path'),
(3351, 2, 'text_barcode_print', 'specific', 'Barcode Print'),
(3352, 2, 'label_select', 'specific', 'Select'),
(3353, 2, 'label_sold', 'specific', 'Sold'),
(3354, 2, 'error_invalid_username_password', 'specific', 'Username or Password is invalid'),
(3355, 2, 'text_order_title', 'specific', 'Order'),
(3356, 2, 'placeholder_search_here', 'specific', 'Search here...'),
(3357, 2, 'text_order', 'specific', 'Order'),
(3358, 2, 'menu_order', 'specific', 'ORDER'),
(3359, 2, 'menu_hold_order', 'specific', 'Hold Order'),
(3360, 2, 'menu_stock_transfer', 'specific', 'Stock Transfer'),
(3361, 2, 'button_gift_card', 'specific', 'Gift Card'),
(3362, 2, 'title_settings', 'specific', 'Settings'),
(3363, 2, 'placeholder_input_discount_amount', 'specific', 'Discount Amount'),
(3364, 2, 'text_sell_due_paid_success', 'specific', 'Successfully Paid'),
(3365, 2, 'button_due_invoice_list', 'specific', 'Due Invoice List'),
(3366, 2, 'button_add_balance', 'specific', 'Add Balance'),
(3367, 2, 'error_pmethod_id', 'specific', 'Payment method is not valid'),
(3368, 2, 'text_balance_added', 'specific', 'Balance successfully added'),
(3369, 2, 'button_sell_product', 'specific', 'Sell Product'),
(3370, 2, 'error_pmethod_code', 'specific', 'Payment method code is not valid'),
(3371, 2, 'invoice_sms_text', 'specific', 'SMS'),
(3372, 2, 'error_installment_duration', 'specific', 'Installment duration is not valid'),
(3373, 2, 'button_view_details', 'specific', 'View Details'),
(3374, 2, 'text_installment_details', 'specific', 'Installment Details'),
(3375, 2, 'label_initial_payment', 'specific', 'Initial Payment'),
(3376, 2, 'label_interval_count', 'specific', 'Interval Count'),
(3377, 2, 'label_installment_count', 'specific', 'Installment Count'),
(3378, 2, 'label_last_installment_date', 'specific', 'Last Installment Date'),
(3379, 2, 'label_installment_end_date', 'specific', 'Intallment End Date'),
(3380, 2, 'text_all_invoice', 'specific', 'All Invoice'),
(3381, 2, 'text_all_due', 'specific', 'All Due'),
(3382, 2, 'button_purchase', 'specific', 'Purchase 2'),
(3383, 2, 'error_login_attempt', 'specific', 'Error Login Attempt'),
(3384, 2, 'error_login_attempt_exceed', 'specific', 'Login Attempt Exceed'),
(3385, 2, 'error_login_attempts_exceeded', 'specific', 'Login attempt exceeded'),
(3386, 2, 'label_logged_in', 'specific', 'Logged In'),
(3387, 2, 'error_mobile_exist', 'specific', 'Mobile number already exist.'),
(3388, 2, 'error_login', 'specific', 'Login Error.'),
(3389, 2, 'button_product_purchase', 'specific', 'Product purchase'),
(3390, 2, 'button_add_purchase', 'specific', 'Add Purchase'),
(3391, 2, 'label_change', 'specific', 'Change'),
(3392, 2, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(3393, 2, 'error_disabled_in_demo', 'specific', 'This feature disabled in demo.'),
(3394, 2, 'button_substract_balance', 'specific', 'Substract Balance'),
(3395, 2, 'error_amount_exceed', 'specific', 'Amount is exceed.'),
(3396, 2, 'text_balance_substracted', 'specific', 'Balance successfully substracted.'),
(3397, 2, 'title_customer_transaction', 'specific', 'Customer Transaction'),
(3398, 2, 'text_customer_transaction_title', 'specific', 'Customer Transaction'),
(3399, 2, 'text_customer_transaction_list_title', 'specific', 'Customer Transaction List'),
(3400, 2, 'title_supplier_transaction', 'specific', 'Supplier Transaction'),
(3401, 2, 'text_supplier_transaction_title', 'specific', 'Supplier Transaction'),
(3402, 2, 'error_card_no', 'specific', 'Card no. is not valid'),
(3403, 2, 'error_activate_permission', 'specific', 'Activate permission is not valid.'),
(3404, 2, 'error_discount_amount_exceed', 'specific', 'Discount amount exceed'),
(3405, 2, 'error_unexpected', 'specific', 'Unexpected error.'),
(3406, 2, 'text_returns', 'specific', 'Returnsdddd'),
(3407, 2, 'label_sl', 'specific', 'Sl'),
(3408, 2, 'label_sup_id', 'specific', 'Sup Id'),
(3409, 2, 'label_delete_all', 'specific', 'Delete All'),
(3410, 2, 'label_insert_store_to', 'specific', 'Insert Store To'),
(3411, 2, 'label_insert_store_content_into', 'specific', 'Insert Content To'),
(3412, 2, 'error_store_name', 'specific', 'Store name is not valid'),
(3413, 2, 'error_email_exist', 'specific', 'Email already exist'),
(3414, 2, 'error_customer_gift_card_exist', 'specific', 'Customer giftcard already exist'),
(3415, 2, 'text_expiry', 'specific', 'Expiry'),
(3416, 2, 'label_transferred_from', 'specific', 'Transfered From'),
(3417, 2, 'text_download_samdple_format_file', 'specific', 'Download Sample Format'),
(3418, 2, 'store_code 1 is not valid!', 'specific', 'Store code is not valid'),
(3419, 2, 'text_purchase_due_paid_success', 'specific', 'Successfully Paid'),
(3420, 2, 'error_invalid_balance', 'specific', 'Invalid Balance'),
(3421, 2, 'text_opening_balance_update_success', 'specific', 'Opening balance successfully updated'),
(3422, 2, 'button_installment_payment', 'specific', 'Installment Payment'),
(3423, 2, 'text_update_installment_payment_success', 'specific', 'Installment payment successfully updated'),
(3424, 2, 'error_email_address', 'specific', 'Email address is not valid'),
(3425, 2, 'email_sent_successful', 'specific', 'Email successfully sent'),
(3426, 2, 'error_id', 'specific', 'Id is not valid'),
(3427, 2, 'store_code store2 is not valid!', 'specific', ''),
(3428, 2, 'error_xls_sheet_not_found', 'specific', ''),
(3429, 2, 'text_cronjob', 'specific', ''),
(3430, 2, 'text_delete_holding_order_success', 'specific', 'Holding order successfully deleted'),
(3431, 2, 'label_reference_format', 'specific', 'Reference Format'),
(3432, 2, 'label_sales_reference_prefix', 'specific', 'Sales Prefix'),
(3433, 2, 'text_expired_listing_title', 'specific', 'Expired Listing'),
(3434, 2, 'label_item_quantity', 'specific', 'Item Quantity'),
(3435, 2, 'error_source', 'specific', 'Source is not valid'),
(3436, 2, 'label_returned_at', 'specific', 'Returned At'),
(3437, 2, 'error_print_permission', 'specific', 'You don\'t have permission in printing.'),
(3438, 2, 'text_due_incoice', 'specific', 'Due Invoice'),
(3439, 2, 'text_loan_details', 'specific', 'Loan Details'),
(3440, 2, 'label_paid_by', 'specific', 'Paid By'),
(3441, 2, 'error_order_title', 'specific', 'Order'),
(3442, 2, 'button_conform_order', 'specific', 'Order Confirmed'),
(3443, 2, 'text_order_successfully_placed', 'specific', 'Order Successfully Placed'),
(3444, 2, 'text_order_placed', 'specific', 'Order Placed'),
(3445, 2, 'title_order_placed', 'specific', 'Order successfully placed'),
(3446, 2, 'error_address', 'specific', 'Address field is required'),
(3447, 2, 'error_current_password', 'specific', 'Current Password'),
(3448, 2, 'error_new_password', 'specific', 'New Password'),
(3449, 2, 'error_current_password_not_matched', 'specific', 'Passwords not matched!'),
(3450, 2, 'text_password_update_success', 'specific', 'Password updated successfully'),
(3451, 2, 'error_full_name', 'specific', 'Full name'),
(3452, 2, 'title_register', 'specific', 'Register'),
(3453, 2, 'error_record_not_found', 'specific', 'Recored not found!'),
(3454, 2, 'text_account_created', 'specific', 'Account created successfully'),
(3455, 2, 'text_login_success', 'specific', 'Successfully Logged in'),
(3456, 2, 'title_view_order', 'specific', 'View Order'),
(3457, 2, 'title_order', 'specific', 'Order'),
(3458, 2, 'text_new_order_title', 'specific', 'New Order'),
(3459, 2, 'text_order_list_title', 'specific', 'Order List'),
(3460, 2, 'label_shipping_and_billing_address', 'specific', 'Shipping '),
(3461, 2, 'label_order_status', 'specific', 'Order Status'),
(3462, 2, 'title_order_edit', 'specific', 'Edit Order'),
(3463, 2, 'text_order_edit_title', 'specific', 'Edit Order'),
(3464, 2, 'text_order_update_success', 'specific', 'Order successfully updated'),
(3465, 2, 'label_insert_content_into', 'specific', 'Insert Content Into'),
(3466, 2, 'label_delete_the_product', 'specific', 'Delete The Product'),
(3467, 2, 'label_soft_delete_the_product', 'specific', 'Soft Delete The Product'),
(3468, 2, 'error_phone_exist', 'specific', 'Phone number already exists'),
(3469, 2, 'title_stores', 'specific', 'Stores'),
(3470, 2, 'text_email_update_success', 'specific', 'Successfully Updated'),
(3471, 2, 'text_phone_update_success', 'specific', 'Phone number updated successfully'),
(3472, 2, 'text_phone_number_update_success', 'specific', 'Phone number updated successfully'),
(3473, 2, 'label_link', 'specific', 'Link'),
(3474, 2, 'error_unit_code', 'specific', 'Unit code is not valid'),
(3475, 2, 'error_service_can_not_be_returned', 'specific', 'Service can\'t be returned'),
(3476, 2, 'error_invalid_product_type', 'specific', 'Product type is not valid'),
(3477, 2, 'error_invalid_barcode_symbology', 'specific', 'Barcode symbology is not valid'),
(3478, 2, 'store_code store1111 is not valid!', 'specific', 'Store code is not valid'),
(3479, 2, 'error_category_slug', 'specific', 'Category slug is not valid'),
(3480, 2, 'error_invalid_category_slug', 'specific', 'Category slug is not valid'),
(3481, 2, 'error_invalid_unit_code', 'specific', 'Unit code is not valid'),
(3482, 2, 'error_invalid_taxrate_code', 'specific', 'Taxrate code is not valid'),
(3483, 2, 'error_invalid_tax_method', 'specific', 'Tax method is not valid'),
(3484, 2, 'error_invalid_supplier_code', 'specific', 'Supplier code is not valid'),
(3485, 2, 'error_invalid_brand_code', 'specific', 'Brand code is not valid'),
(3486, 2, 'error_invalid_box_code', 'specific', 'Box code is not valid'),
(3487, 2, 'error_invalid_cost_price', 'specific', 'Cost price is not valid'),
(3488, 2, 'button_sell_list', 'specific', 'Sell List'),
(3489, 2, 'text_redirecting_to_dashbaord', 'specific', ''),
(3490, 2, 'label_unit_discount', 'specific', ''),
(3491, 2, 'label_document', 'specific', ''),
(3492, 2, 'label_resolution', 'specific', ''),
(3493, 2, 'label_since', 'specific', ''),
(3494, 2, 'label_until', 'specific', ''),
(3495, 2, 'label_consecutive', 'specific', ''),
(3496, 2, 'label_date_since', 'specific', ''),
(3497, 2, 'label_regime', 'specific', ''),
(3498, 2, 'error_product_tax', 'specific', ''),
(3499, 2, 'label_failed', 'specific', ''),
(3500, 2, 'error_read_permission', 'specific', ''),
(4095, 1, 'menu_college', 'specific', 'Colegios'),
(4096, 1, 'menu_add_college', 'specific', 'Crear Colegio'),
(4097, 1, 'menu_college_list', 'specific', 'Lista de Colegios'),
(4098, 1, 'menu_add_course', 'specific', 'Crear Curso'),
(4099, 1, 'menu_course_list', 'specific', 'Lista de Cursos'),
(4100, 1, 'text_color_purple', 'specific', NULL),
(4101, 1, 'text_product_setting', 'specific', 'AJUSTES PRODUCTOS'),
(4102, 1, 'label_course', 'specific', 'Curso'),
(4103, 1, 'text_new_product_title', 'specific', 'NUEVO PRODUCTO'),
(4104, 1, 'label_subtotal_quantity', 'specific', 'Total Cantidad '),
(4105, 1, 'text_course_list_title', 'specific', NULL),
(4106, 1, 'text_course_title', 'specific', NULL),
(4107, 1, 'text_new_course_title', 'specific', 'NUEVO CURSO'),
(4108, 1, 'error_course_name', 'specific', 'El nombre del Curso es Requerido.!'),
(4109, 1, 'label_quantity_product', 'specific', 'Total Productos'),
(4110, 1, 'error_sort_order', 'specific', NULL),
(4111, 1, 'text_today', 'specific', NULL),
(4112, 1, 'error_code_document', 'specific', 'El Docuemto es Requerido!.'),
(4113, 1, 'error_customer_document', 'specific', 'Documento del Cliente es Requerido.!'),
(4114, 1, 'error_document_exist', 'specific', 'Error Documento ya Existe.!'),
(4115, 0, '', 'specific', NULL),
(4116, 1, 'error_pmethod_exist', 'specific', NULL),
(4117, 1, 'title_course_profile', 'specific', NULL),
(4118, 1, 'text_course_profile_title', 'specific', NULL),
(4119, 1, 'text_courses', 'specific', NULL),
(4120, 1, 'text_course_products', 'specific', NULL),
(4121, 1, 'text_college_list_title', 'specific', 'LISTA DE COLEGIOS'),
(4122, 1, 'text_college_title', 'specific', 'COLEGIOS'),
(4123, 1, 'text_new_college_title', 'specific', 'Crear nuevo Colegio'),
(4124, 1, 'report', 'specific', NULL),
(4125, 1, 'read_recent_activities', 'specific', NULL),
(4126, 1, 'read_dashboard_accounting_report', 'specific', NULL),
(4127, 1, 'read_sell_report', 'specific', NULL),
(4128, 1, 'read_overview_report', 'specific', NULL),
(4129, 1, 'read_collection_report', 'specific', NULL),
(4130, 1, 'read_full_collection_report', 'specific', NULL),
(4131, 1, 'read_customer_due_collection_report', 'specific', NULL),
(4132, 1, 'read_supplier_due_paid_report', 'specific', NULL),
(4133, 1, 'read_analytics', 'specific', NULL),
(4134, 1, 'read_purchase_report', 'specific', NULL),
(4135, 1, 'read_purchase_payment_report', 'specific', NULL),
(4136, 1, 'read_purchase_tax_report', 'specific', NULL),
(4137, 1, 'read_sell_payment_report', 'specific', NULL),
(4138, 1, 'read_sell_tax_report', 'specific', NULL),
(4139, 1, 'read_tax_overview_report', 'specific', NULL),
(4140, 1, 'read_stock_report', 'specific', NULL),
(4141, 1, 'send_report_via_email', 'specific', NULL),
(4142, 1, 'accounting', 'specific', NULL),
(4143, 1, 'withdraw', 'specific', NULL),
(4144, 1, 'deposit', 'specific', NULL),
(4145, 1, 'transfer', 'specific', NULL),
(4146, 1, 'read_bank_account', 'specific', NULL),
(4147, 1, 'read_bank_account_sheet', 'specific', NULL),
(4148, 1, 'read_bank_transfer', 'specific', NULL),
(4149, 1, 'read_bank_transactions', 'specific', NULL),
(4150, 1, 'read_income_source', 'specific', NULL),
(4151, 1, 'create_bank_account', 'specific', NULL),
(4152, 1, 'update_bank_account', 'specific', NULL),
(4153, 1, 'delete_bank_account', 'specific', NULL),
(4154, 1, 'create_income_source', 'specific', NULL),
(4155, 1, 'update_income_source', 'specific', NULL),
(4156, 1, 'delete_income_source', 'specific', NULL),
(4157, 1, 'read_income_monthwise', 'specific', NULL),
(4158, 1, 'read_income_and_expense_report', 'specific', NULL),
(4159, 1, 'read_profit_and_loss_report', 'specific', NULL),
(4160, 1, 'read_cashbook_report', 'specific', NULL),
(4161, 1, 'quotation', 'specific', NULL),
(4162, 1, 'read_quotation', 'specific', NULL),
(4163, 1, 'create_quotation', 'specific', NULL),
(4164, 1, 'update_quotation', 'specific', NULL),
(4165, 1, 'delete_quotation', 'specific', NULL),
(4166, 1, 'installment', 'specific', NULL),
(4167, 1, 'read_installment', 'specific', NULL),
(4168, 1, 'create_installment', 'specific', NULL),
(4169, 1, 'update_installment', 'specific', NULL),
(4170, 1, 'delete_installment', 'specific', NULL),
(4171, 1, 'installment_payment', 'specific', NULL),
(4172, 1, 'installment_overview', 'specific', NULL),
(4173, 1, 'expenditure', 'specific', NULL),
(4174, 1, 'read_expense', 'specific', NULL),
(4175, 1, 'create_expense', 'specific', NULL),
(4176, 1, 'update_expense', 'specific', NULL),
(4177, 1, 'delete_expense', 'specific', NULL),
(4178, 1, 'read_expense_category', 'specific', NULL),
(4179, 1, 'create_expense_category', 'specific', NULL),
(4180, 1, 'update_expense_category', 'specific', NULL),
(4181, 1, 'delete_expense_category', 'specific', NULL),
(4182, 1, 'read_expense_monthwise', 'specific', NULL),
(4183, 1, 'read_expense_summary', 'specific', NULL),
(4184, 1, 'sell', 'specific', NULL),
(4185, 1, 'read_sell_invoice', 'specific', NULL),
(4186, 1, 'read_sell_list', 'specific', NULL),
(4187, 1, 'create_sell_invoice', 'specific', NULL),
(4188, 1, 'update_sell_invoice_info', 'specific', NULL),
(4189, 1, 'delete_sell_invoice', 'specific', NULL),
(4190, 1, 'sell_payment', 'specific', NULL),
(4191, 1, 'create_sell_due', 'specific', NULL),
(4192, 1, 'create_sell_return', 'specific', NULL),
(4193, 1, 'read_sell_return', 'specific', NULL),
(4194, 1, 'update_sell_return', 'specific', NULL),
(4195, 1, 'delete_sell_return', 'specific', NULL),
(4196, 1, 'sms_sell_invoice', 'specific', NULL),
(4197, 1, 'email_sell_invoice', 'specific', NULL),
(4198, 1, 'read_sell_log', 'specific', NULL),
(4199, 1, 'create_holding_order', 'specific', NULL),
(4200, 1, 'read_holding_order', 'specific', NULL),
(4201, 1, 'purchase', 'specific', NULL),
(4202, 1, 'create_purchase_invoice', 'specific', NULL),
(4203, 1, 'read_purchase_list', 'specific', NULL),
(4204, 1, 'update_purchase_invoice_info', 'specific', NULL),
(4205, 1, 'delete_purchase_invoice', 'specific', NULL),
(4206, 1, 'purchase_payment', 'specific', NULL),
(4207, 1, 'create_purchase_due', 'specific', NULL),
(4208, 1, 'create_purchase_return', 'specific', NULL),
(4209, 1, 'read_purchase_return', 'specific', NULL),
(4210, 1, 'update_purchase_return', 'specific', NULL),
(4211, 1, 'delete_purchase_return', 'specific', NULL),
(4212, 1, 'read_purchase_log', 'specific', NULL),
(4213, 1, 'read_transfer', 'specific', NULL),
(4214, 1, 'add_transfer', 'specific', NULL),
(4215, 1, 'update_transfer', 'specific', NULL),
(4216, 1, 'delete_transfer', 'specific', NULL),
(4217, 1, 'giftcard', 'specific', NULL),
(4218, 1, 'read_giftcard', 'specific', NULL),
(4219, 1, 'add_giftcard', 'specific', NULL),
(4220, 1, 'update_giftcard', 'specific', NULL),
(4221, 1, 'delete_giftcard', 'specific', NULL),
(4222, 1, 'giftcard_topup', 'specific', NULL),
(4223, 1, 'read_giftcard_topup', 'specific', NULL),
(4224, 1, 'delete_giftcard_topup', 'specific', NULL),
(4225, 1, 'product', 'specific', NULL),
(4226, 1, 'read_product', 'specific', NULL),
(4227, 1, 'create_product', 'specific', NULL),
(4228, 1, 'update_product', 'specific', NULL),
(4229, 1, 'delete_product', 'specific', NULL),
(4230, 1, 'import_product', 'specific', NULL),
(4231, 1, 'product_bulk_action', 'specific', NULL),
(4232, 1, 'delete_all_product', 'specific', NULL),
(4233, 1, 'read_category', 'specific', NULL),
(4234, 1, 'create_category', 'specific', NULL),
(4235, 1, 'update_category', 'specific', NULL),
(4236, 1, 'delete_category', 'specific', NULL),
(4237, 1, 'read_stock_alert', 'specific', NULL),
(4238, 1, 'read_expired_product', 'specific', NULL),
(4239, 1, 'barcode_print', 'specific', NULL),
(4240, 1, 'restore_all_product', 'specific', NULL),
(4241, 1, 'supplier', 'specific', NULL),
(4242, 1, 'read_supplier', 'specific', NULL),
(4243, 1, 'create_supplier', 'specific', NULL),
(4244, 1, 'update_supplier', 'specific', NULL),
(4245, 1, 'delete_supplier', 'specific', NULL),
(4246, 1, 'read_supplier_profile', 'specific', NULL),
(4247, 1, 'brand', 'specific', NULL),
(4248, 1, 'read_brand', 'specific', NULL),
(4249, 1, 'create_brand', 'specific', NULL),
(4250, 1, 'update_brand', 'specific', NULL),
(4251, 1, 'delete_brand', 'specific', NULL),
(4252, 1, 'read_brand_profile', 'specific', NULL),
(4253, 1, 'storebox', 'specific', NULL),
(4254, 1, 'read_box', 'specific', NULL),
(4255, 1, 'create_box', 'specific', NULL),
(4256, 1, 'update_box', 'specific', NULL),
(4257, 1, 'delete_box', 'specific', NULL),
(4258, 1, 'unit', 'specific', NULL),
(4259, 1, 'read_unit', 'specific', NULL),
(4260, 1, 'create_unit', 'specific', NULL),
(4261, 1, 'update_unit', 'specific', NULL),
(4262, 1, 'delete_unit', 'specific', NULL),
(4263, 1, 'taxrate', 'specific', NULL),
(4264, 1, 'read_taxrate', 'specific', NULL),
(4265, 1, 'create_taxrate', 'specific', NULL),
(4266, 1, 'update_taxrate', 'specific', NULL),
(4267, 1, 'delete_taxrate', 'specific', NULL),
(4268, 1, 'loan', 'specific', NULL),
(4269, 1, 'read_loan', 'specific', NULL),
(4270, 1, 'read_loan_summary', 'specific', NULL),
(4271, 1, 'take_loan', 'specific', NULL),
(4272, 1, 'update_loan', 'specific', NULL),
(4273, 1, 'delete_loan', 'specific', NULL),
(4274, 1, 'loan_pay', 'specific', NULL),
(4275, 1, 'customer', 'specific', NULL),
(4276, 1, 'read_customer', 'specific', NULL),
(4277, 1, 'read_customer_profile', 'specific', NULL),
(4278, 1, 'create_customer', 'specific', NULL),
(4279, 1, 'update_customer', 'specific', NULL),
(4280, 1, 'delete_customer', 'specific', NULL),
(4281, 1, 'add_customer_balance', 'specific', NULL),
(4282, 1, 'substract_customer_balance', 'specific', NULL),
(4283, 1, 'read_customer_transaction', 'specific', NULL),
(4284, 1, 'user', 'specific', NULL),
(4285, 1, 'read_user', 'specific', NULL),
(4286, 1, 'create_user', 'specific', NULL),
(4287, 1, 'update_user', 'specific', NULL),
(4288, 1, 'delete_user', 'specific', NULL),
(4289, 1, 'change_password', 'specific', NULL),
(4290, 1, 'usergroup', 'specific', NULL),
(4291, 1, 'read_usergroup', 'specific', NULL),
(4292, 1, 'create_usergroup', 'specific', NULL),
(4293, 1, 'update_usergroup', 'specific', NULL),
(4294, 1, 'delete_usergroup', 'specific', NULL),
(4295, 1, 'currency', 'specific', NULL),
(4296, 1, 'read_currency', 'specific', NULL),
(4297, 1, 'create_currency', 'specific', NULL),
(4298, 1, 'update_currency', 'specific', NULL),
(4299, 1, 'change_currency', 'specific', NULL),
(4300, 1, 'delete_currency', 'specific', NULL),
(4301, 1, 'filemanager', 'specific', NULL),
(4302, 1, 'read_filemanager', 'specific', NULL),
(4303, 1, 'payment_method', 'specific', NULL),
(4304, 1, 'read_pmethod', 'specific', NULL),
(4305, 1, 'create_pmethod', 'specific', NULL),
(4306, 1, 'update_pmethod', 'specific', NULL),
(4307, 1, 'delete_pmethod', 'specific', NULL),
(4308, 1, 'updadte_pmethod_status', 'specific', NULL),
(4309, 1, 'store', 'specific', NULL),
(4310, 1, 'read_store', 'specific', NULL),
(4311, 1, 'create_store', 'specific', NULL),
(4312, 1, 'update_store', 'specific', NULL),
(4313, 1, 'delete_store', 'specific', NULL),
(4314, 1, 'activate_store', 'specific', NULL),
(4315, 1, 'upload_favicon', 'specific', NULL),
(4316, 1, 'upload_logo', 'specific', NULL),
(4317, 1, 'college', 'specific', 'Colegio'),
(4318, 1, 'read_college', 'specific', NULL),
(4319, 1, 'create_college', 'specific', NULL),
(4320, 1, 'update_college', 'specific', NULL),
(4321, 1, 'delete_college', 'specific', NULL),
(4322, 1, 'activate_college', 'specific', NULL),
(4323, 1, 'read_course', 'specific', NULL),
(4324, 1, 'create_course', 'specific', NULL),
(4325, 1, 'update_course', 'specific', NULL),
(4326, 1, 'delete_course', 'specific', NULL),
(4327, 1, 'activate_course', 'specific', NULL),
(4328, 1, 'printer', 'specific', NULL),
(4329, 1, 'read_printer', 'specific', NULL),
(4330, 1, 'create_printer', 'specific', NULL),
(4331, 1, 'update_printer', 'specific', NULL),
(4332, 1, 'delete_printer', 'specific', NULL),
(4333, 1, 'sms', 'specific', NULL),
(4334, 1, 'send_sms', 'specific', NULL),
(4335, 1, 'read_sms_report', 'specific', NULL),
(4336, 1, 'read_sms_setting', 'specific', NULL),
(4337, 1, 'update_sms_setting', 'specific', NULL),
(4338, 1, 'send_email', 'specific', NULL),
(4339, 1, 'langauge', 'specific', NULL),
(4340, 1, 'read_language', 'specific', NULL),
(4341, 1, 'create_language', 'specific', NULL),
(4342, 1, 'update_language', 'specific', NULL),
(4343, 1, 'delete_language', 'specific', NULL),
(4344, 1, 'language_translation', 'specific', NULL),
(4345, 1, 'delete_language_key', 'specific', NULL),
(4346, 1, 'settings', 'specific', NULL),
(4347, 1, 'receipt_template', 'specific', NULL),
(4348, 1, 'read_user_preference', 'specific', NULL),
(4349, 1, 'update_user_preference', 'specific', NULL),
(4350, 1, 'filtering', 'specific', NULL),
(4351, 1, 'language_sync', 'specific', NULL),
(4352, 1, 'backup', 'specific', NULL),
(4353, 1, 'restore', 'specific', NULL),
(4354, 1, 'reset', 'specific', NULL),
(4355, 1, 'show_purchase_price', 'specific', NULL),
(4356, 1, 'show_profit', 'specific', NULL),
(4357, 1, 'show_graph', 'specific', NULL),
(4358, 1, 'label_insert_all_user_to', 'specific', NULL),
(4359, 1, 'error_user_group_name', 'specific', NULL),
(4360, 1, 'error_date_of_birth', 'specific', NULL),
(4361, 1, 'error_sup_document', 'specific', 'El Documento del Proveedor es Requerido!.'),
(4362, 1, 'error_supplier_name_exist', 'specific', 'El Proveedor ya se encuentra Registrado!.'),
(4363, 1, 'error_customer_name_exist', 'specific', 'El Cliente ya se encuentra Reqhistrado!.'),
(4364, 1, 'error_order_name_exist', 'specific', 'El Nombre del Pedido ya Éxiste!.'),
(4365, 1, 'label_responsible', 'specific', 'Responsables'),
(4366, 1, 'error_college_name', 'specific', 'El nombre de Colegio es Requerido!.'),
(4367, 1, 'error_product_college', 'specific', 'No ha seleccionado ningún Producto!.'),
(4368, 1, 'error_college_responsible', 'specific', 'Los Responsables de Colegio son Requeridos!.'),
(4369, 1, 'title_college_profile', 'specific', NULL),
(4370, 1, 'text_college_profile_title', 'specific', NULL),
(4371, 1, 'text_colleges', 'specific', NULL),
(4372, 1, 'text_college_products', 'specific', NULL),
(4373, 1, 'error_update_permission', 'specific', 'Error al actualizar Permisos'),
(4374, 1, 'text_search_college', 'specific', 'BUSCAR COLEGIO'),
(4375, 1, 'text_total_amount', 'specific', 'TOTAL A PAGAR'),
(4376, 1, 'text_total_balance', 'specific', 'CAMBIO'),
(4377, 1, 'label_college', 'specific', 'Colegio'),
(4378, 1, 'hint_college', 'specific', 'Colegio'),
(4379, 1, 'hint_supplier', 'specific', 'Proveedor'),
(4380, 1, 'label_estimated_sales', 'specific', 'Ventas Estimadas'),
(4381, 1, 'label_college_name', 'specific', 'Colegio'),
(4382, 1, 'dashboard', 'specific', NULL),
(4383, 1, 'read_dashboard_invoce_view', 'specific', NULL),
(4384, 1, 'read_dashboard_customer_view', 'specific', NULL),
(4385, 1, 'read_dashboard_supplier_view', 'specific', NULL),
(4386, 1, 'read_dashboard_product_view', 'specific', NULL),
(4387, 1, 'show_selling_price', 'specific', NULL),
(4388, 1, 'show_estimated_sales', 'specific', NULL),
(4389, 1, 'label_names', 'specific', 'Nombres'),
(4390, 1, 'read_user_profile', 'specific', NULL),
(4391, 1, 'error_user_password', 'specific', NULL),
(4392, 1, 'error_user_supplier', 'specific', NULL),
(4393, 1, 'read_user_log', 'specific', NULL),
(4394, 1, 'label_usermane', 'specific', 'Usuario_o_ Correo'),
(4395, 1, 'text_items_list_select', 'specific', NULL),
(4396, 1, 'error_create_permission', 'specific', NULL),
(4397, 1, 'error_delete_permission', 'specific', NULL),
(4398, 1, 'error_return_permission', 'specific', NULL),
(4399, 1, 'error_store_exist', 'specific', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `loan_from` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `amount` decimal(25,4) UNSIGNED NOT NULL,
  `interest` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable` decimal(25,4) UNSIGNED NOT NULL,
  `paid` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `details` longtext NOT NULL,
  `attachment` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `lloan_id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `paid` decimal(25,4) NOT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `status` enum('success','error') NOT NULL DEFAULT 'success',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_id`, `username`, `ip`, `status`, `created_at`) VALUES
(1, 2, 'admin@controldas.com', '181.198.104.222', 'success', '2023-07-20 18:09:24'),
(3, 2, 'admin@controldas.com', '181.188.200.247', 'success', '2023-07-20 18:21:42'),
(4, 1, '0969237302', '200.115.36.38', 'success', '2023-07-20 19:03:12'),
(6, 2, 'admin@controldas.com', '190.99.77.62', 'success', '2023-07-20 19:24:38'),
(7, 2, 'admin@controldas.com', '190.99.77.62', 'success', '2023-07-20 19:25:18'),
(8, 2, 'admin@controldas.com', '190.99.77.62', 'success', '2023-07-20 19:43:04'),
(9, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-07-20 20:01:53'),
(10, 2, 'DAVID POLO', '190.99.77.62', 'success', '2023-07-20 20:05:24'),
(11, 2, 'admin@controldas.com', '181.198.104.222', 'success', '2023-07-20 20:54:10'),
(12, 2, 'admin@controldas.com', '200.115.36.38', 'success', '2023-07-20 21:22:08'),
(13, 2, 'DAVID POLO', '190.99.77.62', 'success', '2023-07-21 13:18:53'),
(14, 7, 'DALI', '190.99.77.62', 'success', '2023-07-21 13:21:59'),
(15, 2, 'DAVID POLO', '190.99.77.62', 'success', '2023-07-21 13:25:29'),
(16, 7, 'DALI', '2800:430:1205:d440:2c84:f543:88d2:7c8f', 'success', '2023-07-21 13:28:26'),
(17, 1, '0969237302', '200.115.36.38', 'success', '2023-07-21 13:43:27'),
(18, 2, 'admin@controldas.com', '181.198.104.222', 'success', '2023-07-21 14:01:02'),
(19, 2, 'DAVID POLO', '190.99.77.62', 'success', '2023-07-21 15:12:19'),
(20, 2, 'DAVID POLO', '190.99.77.62', 'success', '2023-07-21 15:15:28'),
(21, 7, 'DALI', '190.99.77.62', 'success', '2023-07-21 15:19:34'),
(22, 7, 'DALI', '181.198.104.222', 'success', '2023-07-21 15:24:57'),
(23, 2, 'admin@controldas.com', '181.198.104.222', 'success', '2023-07-21 15:26:55'),
(24, 7, 'DALI', '190.99.77.62', 'success', '2023-07-21 15:37:29'),
(25, 2, 'DAVID POLO', '190.99.77.62', 'success', '2023-07-21 15:39:57'),
(33, 5, 'HERNAN', '190.99.77.62', 'success', '2023-07-21 15:44:56'),
(34, 2, 'DAVID POLO', '190.99.77.62', 'success', '2023-07-21 16:13:03'),
(35, 2, 'DAVID POLO', '190.99.77.62', 'success', '2023-07-21 18:03:27'),
(36, 1, '0969237302', '181.198.104.222', 'success', '2023-07-21 20:28:57'),
(37, 2, 'admin@controldas.com', '181.198.104.222', 'success', '2023-07-21 23:16:25'),
(38, 5, 'HERNAN', '2800:bf0:2902:108e:64f2:cf1a:eb5d:517c', 'success', '2023-07-22 15:27:49'),
(39, 6, 'MAURICIO', '2800:bf0:3005:ca:4507:7f0f:1052:c702', 'success', '2023-07-22 21:54:48'),
(40, 6, 'MAURICIO', '2800:bf0:3005:ca:4507:7f0f:1052:c702', 'success', '2023-07-22 22:08:30'),
(41, 1, 'eye_layla@hotmail.com', '45.236.169.168', 'success', '2023-07-22 23:27:54'),
(42, 6, 'MAURICIO', '2800:bf0:3005:ca:4507:7f0f:1052:c702', 'success', '2023-07-22 23:46:52'),
(43, 1, 'eye_layla@hotmail.com', '45.236.169.168', 'success', '2023-07-22 23:49:14'),
(44, 6, 'MAURICIO', '2800:bf0:3005:ca:4507:7f0f:1052:c702', 'success', '2023-07-22 23:52:33'),
(45, 1, 'eye_layla@hotmail.com', '45.224.98.147', 'success', '2023-07-23 14:22:38'),
(46, 6, 'MAURICIO', '157.100.63.41', 'success', '2023-07-23 16:29:41'),
(47, 1, 'eye_layla@hotmail.com', '127.0.0.1', 'success', '2023-07-23 17:02:17'),
(48, 2, 'admin@controldas.com', '127.0.0.1', 'success', '2023-07-23 17:03:01'),
(49, 5, 'HERNAN', '2800:bf0:2902:108e:64f2:cf1a:eb5d:517c', 'success', '2023-07-23 17:40:53'),
(50, 5, 'HERNAN', '2800:bf0:2902:108e:64f2:cf1a:eb5d:517c', 'success', '2023-07-23 22:21:55'),
(51, 5, 'HERNAN', '190.99.77.62', 'success', '2023-07-24 22:28:32'),
(52, 5, 'HERNAN', '190.99.77.62', 'success', '2023-07-24 22:32:11'),
(53, 5, 'HERNAN', '190.99.77.62', 'success', '2023-07-24 22:35:32'),
(54, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-07-25 15:41:42'),
(55, 2, 'DAVID POLO', '157.100.63.41', 'success', '2023-07-25 15:48:25'),
(56, 6, 'MAURICIO', '157.100.63.41', 'success', '2023-07-25 15:52:40'),
(57, 2, 'DAVID POLO', '157.100.63.41', 'success', '2023-07-25 15:54:44'),
(58, 5, 'HERNAN', '2800:bf0:2902:108e:64f2:cf1a:eb5d:517c', 'success', '2023-07-26 15:01:00'),
(59, 5, 'HERNAN', '190.99.77.62', 'success', '2023-07-26 16:07:09'),
(60, 2, 'admin@controldas.com', '2800:430:b281:5ef3:91d7:a4b6:de2c:b0cc', 'success', '2023-07-26 16:37:30'),
(61, 5, 'HERNAN', '190.99.77.62', 'success', '2023-07-26 17:52:44'),
(62, 5, 'HERNAN', '190.99.77.62', 'success', '2023-07-26 18:12:11'),
(63, 5, 'HERNAN', '190.99.77.62', 'success', '2023-07-26 18:13:44'),
(64, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-07-26 19:15:50'),
(65, 5, 'HERNAN', '2800:bf0:2902:108e:4d66:a527:f12e:45df', 'success', '2023-07-26 21:02:09'),
(66, 5, 'HERNAN', '181.188.200.168', 'success', '2023-07-26 22:18:08'),
(67, 5, 'HERNAN', '2800:bf0:2902:108e:4d66:a527:f12e:45df', 'success', '2023-07-26 22:37:21'),
(68, 5, 'HERNAN', '2800:bf0:2902:108e:4d66:a527:f12e:45df', 'success', '2023-07-26 22:44:30'),
(69, 5, 'HERNAN', '2800:bf0:2902:108e:4d66:a527:f12e:45df', 'success', '2023-07-26 22:46:35'),
(70, 2, 'DAVID POLO', '177.234.249.184', 'success', '2023-07-27 12:15:30'),
(73, 5, 'HERNAN', '2800:bf0:2902:108e:64f2:cf1a:eb5d:517c', 'success', '2023-07-27 15:06:57'),
(74, 1, 'eye_layla@hotmail.com', '200.7.246.67', 'success', '2023-07-27 15:07:51'),
(75, 1, 'eye_layla@hotmail.com', '200.7.246.67', 'success', '2023-07-27 16:43:19'),
(76, 5, 'HERNAN', '2800:bf0:2902:108e:4d66:a527:f12e:45df', 'success', '2023-07-27 19:14:50'),
(77, 5, 'HERNAN', '2800:bf0:2902:108e:4d66:a527:f12e:45df', 'success', '2023-07-27 19:20:04'),
(78, 5, 'HERNAN', '2800:bf0:2902:108e:4d66:a527:f12e:45df', 'success', '2023-07-27 19:26:16'),
(79, 2, 'DAVID POLO', '177.234.249.183', 'success', '2023-07-28 13:18:27'),
(80, 5, 'HERNAN', '200.7.247.227', 'success', '2023-07-30 02:07:56'),
(81, 1, '0969237302', '45.224.98.149', 'success', '2023-07-31 05:22:17'),
(82, 2, 'admin@controldas.com', '127.0.0.1', 'success', '2023-07-31 16:11:28'),
(83, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-07-31 16:30:46'),
(84, 1, '0969237302', '200.115.36.38', 'success', '2023-07-31 16:33:18'),
(85, 2, 'admin@controldas.com', '200.115.36.38', 'success', '2023-07-31 16:33:29'),
(86, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-07-31 17:51:45'),
(87, 5, 'HERNAN', '2800:bf0:2902:108e:809b:3c28:a283:21b6', 'success', '2023-07-31 18:21:33'),
(88, 6, 'mauriciocastillo@controldas.com', '127.0.0.1', 'success', '2023-07-31 19:32:51'),
(89, 1, '0969237302', '200.115.36.38', 'success', '2023-07-31 19:46:11'),
(90, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-07-31 21:02:55'),
(91, 2, 'admin@controldas.com', '2800:bf0:a821:1122:ec3e:6801:3a48:795', 'success', '2023-07-31 22:10:32'),
(92, 7, 'DALI', '2800:bf0:a821:1122:ec3e:6801:3a48:795', 'success', '2023-07-31 22:15:11'),
(93, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-01 16:23:07'),
(94, 5, 'HERNAN', '2800:bf0:2902:108e:3022:86f6:ce78:d112', 'success', '2023-08-01 17:29:11'),
(98, 5, 'HERNAN', '2800:bf0:2902:108e:809b:3c28:a283:21b6', 'success', '2023-08-01 18:57:42'),
(99, 2, 'admin@controldas.com', '200.115.36.38', 'success', '2023-08-01 19:15:21'),
(102, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-01 20:04:20'),
(103, 1, '0969237302', '181.198.104.222', 'success', '2023-08-01 20:06:34'),
(104, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-01 20:16:07'),
(105, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-02 16:15:16'),
(106, 1, '0969237302', '200.115.36.38', 'success', '2023-08-02 16:16:00'),
(107, 1, '0969237302', '200.115.36.38', 'success', '2023-08-02 19:49:32'),
(108, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-03 14:55:20'),
(109, 2, 'admin@controldas.com', '181.198.104.222', 'success', '2023-08-03 18:57:20'),
(110, 2, 'DAVID POLO', '181.199.42.39', 'success', '2023-08-03 22:22:24'),
(112, 2, 'admin@controldas.com', '181.188.200.32', 'success', '2023-08-03 22:32:26'),
(113, 2, 'DAVID POLO', '181.199.42.39', 'success', '2023-08-03 22:32:57'),
(114, 2, 'DAVID POLO', '181.199.42.39', 'success', '2023-08-03 22:37:23'),
(115, 6, 'MAURICIO', '181.199.42.39', 'success', '2023-08-03 22:58:49'),
(116, 2, 'DAVID POLO', '181.199.42.39', 'success', '2023-08-03 23:03:32'),
(117, 5, 'HERNAN', '181.199.42.39', 'success', '2023-08-03 23:37:11'),
(118, 2, 'DAVID POLO', '181.199.42.39', 'success', '2023-08-03 23:40:34'),
(119, 8, 'HOLGUIN', '181.199.42.39', 'success', '2023-08-03 23:42:46'),
(120, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-04 14:56:57'),
(121, 2, 'admin@controldas.com', '2800:bf0:a821:1122:a5ad:ab55:30b9:ff53', 'success', '2023-08-04 21:42:52'),
(122, 2, 'admin@controldas.com', '2800:bf0:a821:1122:a5ad:ab55:30b9:ff53', 'success', '2023-08-04 21:44:59'),
(123, 2, 'admin@controldas.com', '2800:bf0:a821:1122:a5ad:ab55:30b9:ff53', 'success', '2023-08-04 21:45:19'),
(124, 1, 'eye_layla@hotmail.com', '127.0.0.1', 'success', '2023-08-04 23:59:53'),
(125, 1, '0969237302', '45.224.98.149', 'success', '2023-08-05 00:06:22'),
(126, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-05 16:01:25'),
(127, 2, 'admin@controldas.com', '2800:bf0:a821:1122:1c0:dabe:8e3c:a474', 'success', '2023-08-05 18:05:04'),
(128, 1, '0969237302', '2800:bf0:82d2:1038:55e3:7999:ae0f:b837', 'success', '2023-08-05 18:07:08'),
(129, 6, 'MAURICIO', '2800:bf0:82d2:1038:55e3:7999:ae0f:b837', 'success', '2023-08-05 18:11:00'),
(130, 2, 'admin@controldas.com', '2800:bf0:a821:1122:1c0:dabe:8e3c:a474', 'success', '2023-08-05 18:48:56'),
(131, 2, 'admin@controldas.com', '2800:bf0:a821:1122:1c0:dabe:8e3c:a474', 'success', '2023-08-05 18:49:45'),
(132, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-05 19:15:47'),
(133, 2, 'admin@controldas.com', '2800:bf0:a821:1122:1c0:dabe:8e3c:a474', 'success', '2023-08-05 19:18:52'),
(134, 2, 'DAVID POLO', '2800:bf0:a821:1122:c19a:4347:44c9:df', 'success', '2023-08-05 19:28:18'),
(135, 1, '0969237302', '2800:bf0:82d2:1038:55e3:7999:ae0f:b837', 'success', '2023-08-05 19:37:28'),
(136, 2, 'admin@controldas.com', '45.224.98.149', 'success', '2023-08-06 23:20:26'),
(137, 1, '0969237302', '45.224.98.149', 'success', '2023-08-07 00:12:14'),
(138, 1, '0969237302', '45.224.98.149', 'success', '2023-08-07 01:02:46'),
(139, 5, 'HERNAN', '181.188.200.92', 'success', '2023-08-07 15:28:13'),
(140, 2, 'admin@controldas.com', '2800:bf0:a821:1122:cdfd:ce4d:4ed0:c98e', 'success', '2023-08-07 17:12:22'),
(141, 2, 'admin@controldas.com', '2800:bf0:a821:1122:cdfd:ce4d:4ed0:c98e', 'success', '2023-08-07 17:17:19'),
(142, 1, '0969237302', '200.115.36.38', 'success', '2023-08-07 20:25:40'),
(143, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-07 20:31:16'),
(144, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-07 20:38:10'),
(145, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-07 20:40:46'),
(146, 5, 'HERNAN', '2800:bf0:2902:108e:809b:3c28:a283:21b6', 'success', '2023-08-08 02:45:11'),
(147, 2, 'DAVID POLO', '181.199.42.39', 'success', '2023-08-08 14:52:28'),
(150, 2, 'DAVID POLO', '181.199.42.39', 'success', '2023-08-08 14:55:56'),
(151, 9, 'UEI COTOPAXI', '181.199.42.39', 'success', '2023-08-08 14:59:57'),
(152, 2, 'DAVID POLO', '181.199.42.39', 'success', '2023-08-08 15:14:58'),
(153, 6, 'MAURICIO', '190.99.77.62', 'success', '2023-08-08 15:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `mail_sms_tag`
--

CREATE TABLE `mail_sms_tag` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `tagname` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `mail_sms_tag`
--

INSERT INTO `mail_sms_tag` (`tag_id`, `type`, `tagname`, `created_at`) VALUES
(1, 'invoice', '[customer_name]', '2019-03-08 14:50:39'),
(2, 'invoice', '[payable_amount]', '2019-07-02 12:12:59'),
(3, 'invoice', '[paid_amount]', '2019-07-02 12:13:02'),
(4, 'invoice', '[due]', '2019-07-02 12:13:04'),
(5, 'invoice', '[store_name]', '2019-07-02 12:13:07'),
(6, 'invoice', '[payment_status]', '2019-07-02 12:13:09'),
(7, 'invoice', '[customer_mobile]', '2019-07-02 12:13:11'),
(8, 'invoice', '[payment_method]', '2019-07-02 12:13:13'),
(9, 'invoice', '[date_time]', '2019-07-02 12:13:15'),
(10, 'invoice', '[date]', '2019-07-02 12:13:18'),
(11, 'invoice', '[tax]', '2019-07-02 12:13:20'),
(12, 'invoice', '[discount]', '2019-07-02 12:13:21'),
(13, 'invoice', '[address]', '2019-07-02 12:13:23'),
(14, 'invoice', '[invoice_id]', '2019-07-02 12:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'sell',
  `is_profit` tinyint(1) NOT NULL DEFAULT 1,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `pmethod_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `capital` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `amount` decimal(25,4) NOT NULL,
  `details` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `total_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `type`, `is_profit`, `is_hide`, `store_id`, `invoice_id`, `reference_no`, `pmethod_id`, `transaction_id`, `capital`, `amount`, `details`, `attachment`, `note`, `total_paid`, `pos_balance`, `created_by`, `created_at`) VALUES
(1, 'sell', 1, 0, 2, '22023/00000001', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '170.0000', '6.0000', 6, '2023-08-02 11:21:03'),
(2, 'sell', 1, 0, 2, '22023/00000002', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-02 11:28:33'),
(3, 'sell', 1, 0, 2, '22023/00000003', NULL, 1, NULL, '41.0000', '85.0000', 'a:0:{}', NULL, '', '85.0000', '0.0000', 6, '2023-08-02 11:31:26'),
(4, 'sell', 1, 0, 2, '22023/00000004', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-02 11:32:36'),
(5, 'sell', 1, 0, 2, '22023/00000005', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '170.0000', '6.0000', 6, '2023-08-02 11:36:25'),
(6, 'sell', 1, 0, 2, '22023/00000006', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-02 11:38:24'),
(7, 'sell', 1, 0, 2, '22023/00000007', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-02 11:40:41'),
(8, 'sell', 1, 0, 2, '22023/00000008', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-02 11:43:07'),
(9, 'sell', 1, 0, 2, '22023/00000009', NULL, 1, NULL, '71.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-02 11:44:19'),
(10, 'sell', 1, 0, 2, '22023/00000010', NULL, 1, NULL, '137.1000', '306.0000', 'a:0:{}', NULL, 'TRANSFERENCIA', '306.0000', '0.0000', 6, '2023-08-02 11:50:32'),
(11, 'sell', 1, 0, 2, '22023/00000011', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-02 11:57:23'),
(12, 'sell', 1, 0, 2, '22023/00000012', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-02 12:07:02'),
(13, 'sell', 1, 0, 2, '22023/00000013', NULL, 1, NULL, '41.0000', '85.0000', 'a:0:{}', NULL, '', '85.0000', '0.0000', 6, '2023-08-02 12:08:41'),
(14, 'sell', 1, 0, 2, '22023/00000014', NULL, 1, NULL, '748.8000', '1417.5000', 'a:0:{}', NULL, '', '1417.5000', '0.0000', 6, '2023-08-02 12:18:19'),
(15, 'sell', 1, 0, 2, '22023/00000015', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '170.0000', '6.0000', 6, '2023-08-03 10:26:48'),
(16, 'sell', 1, 0, 2, '22023/00000016', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '170.0000', '6.0000', 6, '2023-08-03 10:58:55'),
(17, 'sell', 1, 0, 2, '22023/00000017', NULL, 1, NULL, '41.0000', '85.0000', 'a:0:{}', NULL, 'TRANSFERENCIA ', '85.0000', '0.0000', 6, '2023-08-03 13:54:55'),
(18, 'sell', 1, 0, 2, '22023/00000018', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, 'TRANSFERENCIA', '164.0000', '0.0000', 6, '2023-08-03 14:56:44'),
(19, 'sell', 1, 0, 2, '22023/00000019', NULL, 1, NULL, '71.7000', '164.0000', 'a:0:{}', NULL, 'TRANSFERENCIA', '164.0000', '0.0000', 6, '2023-08-04 11:19:57'),
(20, 'sell', 1, 0, 2, '22023/00000020', NULL, 1, NULL, '71.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-04 13:36:29'),
(21, 'sell', 1, 0, 2, '22023/00000021', NULL, 1, NULL, '60.4000', '142.0000', 'a:0:{}', NULL, '', '150.0000', '8.0000', 6, '2023-08-04 14:40:26'),
(22, 'sell', 1, 0, 2, '22023/00000022', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '180.0000', '16.0000', 6, '2023-08-04 15:09:58'),
(23, 'sell', 1, 0, 2, '22023/00000023', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '170.0000', '6.0000', 6, '2023-08-05 12:01:57'),
(24, 'sell', 1, 0, 2, '22023/00000024', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-05 12:30:13'),
(26, 'sell', 1, 0, 2, '22023/00000025', NULL, 1, NULL, '72.4000', '180.0000', 'a:0:{}', NULL, '', '180.0000', '0.0000', 6, '2023-08-05 14:12:07'),
(27, 'sell', 1, 0, 2, '22023/00000026', NULL, 1, NULL, '72.4000', '180.0000', 'a:0:{}', NULL, '', '180.0000', '0.0000', 6, '2023-08-05 14:24:32'),
(28, 'sell', 1, 0, 2, '22023/00000027', NULL, 1, NULL, '41.0000', '85.0000', 'a:0:{}', NULL, '', '100.0000', '15.0000', 6, '2023-08-07 12:26:37'),
(29, 'sell', 1, 0, 2, '22023/00000028', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '170.0000', '6.0000', 6, '2023-08-07 14:45:35'),
(30, 'sell', 1, 0, 2, '22023/00000029', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-07 15:41:35'),
(31, 'sell', 1, 0, 2, '22023/00000030', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, '', '164.0000', '0.0000', 6, '2023-08-08 10:23:06'),
(32, 'sell', 1, 0, 2, '22023/00000031', NULL, 1, NULL, '76.7000', '164.0000', 'a:0:{}', NULL, 'TRANSFERENCIA', '164.0000', '0.0000', 6, '2023-08-08 10:47:23'),
(33, 'sell', 1, 0, 2, '22023/00000032', NULL, 1, NULL, '132.8000', '322.0000', 'a:0:{}', NULL, 'transferencia 2 kit', '322.0000', '0.0000', 6, '2023-08-08 11:47:40'),
(34, 'sell', 1, 0, 2, '22023/00000033', NULL, 1, NULL, '41.0000', '85.0000', 'a:0:{}', NULL, 'TRANSFERENCIA ', '85.0000', '0.0000', 6, '2023-08-08 12:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `pmethods`
--

CREATE TABLE `pmethods` (
  `pmethod_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `details` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `pmethods`
--

INSERT INTO `pmethods` (`pmethod_id`, `name`, `code_name`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Efectivo', 'cod', 'Payment method details goes here...', 1, '2018-03-23 18:00:00', '2019-05-08 18:18:30'),
(2, 'Banco', 'bkash', 'Bkash a Brack Bank Service', 1, '2019-01-09 18:00:00', '2019-07-02 16:13:57'),
(3, 'Tarjeta de Regalo', 'gift_card', 'Details of giftcard payment method', 1, '2019-02-04 11:32:44', '2019-07-02 21:41:57'),
(4, 'Crédito', 'credit', 'Payment by customer credited balance', 1, '2019-05-08 12:46:05', '2019-07-02 16:14:03');

-- --------------------------------------------------------

--
-- Table structure for table `pos_register`
--

CREATE TABLE `pos_register` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `opening_balance` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `closing_balance` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `note` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `pos_register`
--

INSERT INTO `pos_register` (`id`, `store_id`, `opening_balance`, `closing_balance`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '100.0000', '0.0000', NULL, 1, '2019-12-15 12:23:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_templates`
--

CREATE TABLE `pos_templates` (
  `template_id` int(10) UNSIGNED NOT NULL,
  `template_name` varchar(100) DEFAULT NULL,
  `template_content` longtext NOT NULL,
  `template_css` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `pos_templates`
--

INSERT INTO `pos_templates` (`template_id`, `template_name`, `template_content`, `template_css`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'Default', '&lt;section class=&quot;receipt-template&quot;&gt;\n\n        &lt;header class=&quot;receipt-header&quot;&gt;\n            &lt;div class=&quot;logo-area&quot;&gt;\n                &lt;img class=&quot;logo&quot; src=&quot;{{ logo_url }}&quot;&gt;\n            &lt;/div&gt;\n            &lt;h2 class=&quot;store-name&quot;&gt;{{ store_name }}&lt;/h2&gt;\n            &lt;div class=&quot;address-area&quot;&gt;\n                &lt;span class=&quot;info address&quot;&gt;{{ store_address }}&lt;/span&gt;\n                &lt;div class=&quot;block&quot;&gt;\n                    &lt;span class=&quot;info phone&quot;&gt;Teléfono: {{ store_phone }}&lt;/span&gt;, &lt;span class=&quot;info email&quot;&gt;Correo: {{ store_email }}&lt;/span&gt;\n                &lt;/div&gt;\n            &lt;/div&gt;\n        &lt;/header&gt;\n        \n        &lt;section class=&quot;info-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;Recibo No:&lt;/td&gt;\n                    &lt;td&gt;{{ invoice_id }}&lt;/td&gt;\n                &lt;/tr&gt;\n               &lt;!-- &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;VAT-Reg:&lt;/td&gt;\n                    &lt;td&gt;{{ vat_reg }}&lt;/td&gt; \n                &lt;/tr&gt; --&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;Fecha:&lt;/td&gt;\n                    &lt;td&gt;{{ date_time }}&lt;/td&gt;\n                &lt;/tr&gt;\n               &lt;!-- &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;GST Reg:&lt;/td&gt;\n                    &lt;td&gt;{{ gst_reg }}&lt;/td&gt;\n                &lt;/tr&gt; --&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Cliente:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_name }}&lt;/td&gt;\n                &lt;/tr&gt;\n                 &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Cédula / RUC:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_document }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Correo:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_email }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;!-- &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;GTIN:&lt;/td&gt;\n                    &lt;td&gt;{{ gtin }}&lt;/td&gt;\n                &lt;/tr&gt; --&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        &lt;/br&gt;\n        \n       &lt;!-- &lt;h4 class=&quot;main-title&quot;&gt;INVOICE&lt;/h4&gt; --&gt;\n        \n        {{ if items }}\n        &lt;section class=&quot;listing-area item-list&quot;&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;tr&gt;\n                        &lt;td class=&quot;w-10 text-center&quot;&gt;Sl.&lt;/td&gt;\n                        &lt;td class=&quot;w-40 text-center&quot;&gt;Prod.&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-center&quot;&gt;Cant.&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-right&quot;&gt;PVP&lt;/td&gt;\n                        &lt;td class=&quot;w-20 text-right&quot;&gt;Total&lt;/td&gt;\n                    &lt;/tr&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ items }}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td&gt;{{ item_name }} \n                               &lt;!-- {{ if invoice_view == indian_gst }} \n                                    &lt;small&gt;[HSN-{{ hsn_code }}]&lt;/small&gt;\n                                {{ endif }} --&gt;\n                            &lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_quantity }} &lt;!-- {{ unitName }} --&gt; &lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_price }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt;   \n                        &lt;/tr&gt;\n                    {{ /items }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        \n        &lt;section class=&quot;info-area calculation-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;SubTotal:&lt;/td&gt;\n                    &lt;td&gt;{{ subtotal }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;IVA:&lt;/td&gt;\n                    &lt;td&gt;{{ order_tax }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Descuento:&lt;/td&gt;\n                    &lt;td&gt;{{ discount_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;!-- &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Cargo Envío:&lt;/td&gt;\n                    &lt;td&gt;{{ shipping_amount }}&lt;/td&gt;\n                &lt;/tr&gt; --&gt;\n                &lt;!-- &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Otros Cargos:&lt;/td&gt;\n                    &lt;td&gt;{{ others_charge }}&lt;/td&gt;\n                &lt;/tr&gt; --&gt;\n                &lt;!-- &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Deuda Vencida:&lt;/td&gt;\n                    &lt;td&gt;{{ previous_due }}&lt;/td&gt;\n                &lt;/tr&gt; --&gt;\n                &lt;!-- &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Total Adeudado:&lt;/td&gt;\n                    &lt;td&gt;{{ payable_amount }}&lt;/td&gt;\n                &lt;/tr&gt; --&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Total Pagado:&lt;/td&gt;\n                    &lt;td&gt;{{ paid_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Cambio:&lt;/td&gt;\n                    &lt;td&gt;{{ change }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;!-- &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Vencido:&lt;/td&gt;\n                    &lt;td&gt;{{ due }}&lt;/td&gt; --&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;!-- &lt;section class=&quot;info-area italic&quot;&gt;\n            &lt;span class=&quot;text-small&quot;&gt;&lt;b&gt;In Text:&lt;/b&gt; {{ amount_in_text }}&lt;/span&gt;&lt;br&gt;\n            &lt;span class=&quot;text-small&quot;&gt;&lt;b&gt;Note:&lt;/b&gt; {{ invoice_note }}&lt;/span&gt;\n        &lt;/section&gt; --&gt;\n\n       &lt;!-- {{ if return_items }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Returns&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-5 text-center&quot;&gt;Sl.&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-center&quot;&gt;Returned at&lt;/td&gt;\n                    &lt;td class=&quot;w-30 text-center&quot;&gt;Item Name&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Qty&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Amt&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{return_items}}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ created_at }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_quantity }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{/return_items}}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }} --&gt;\n        \n        {{ if payments }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Pagos&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-10 text-center&quot;&gt;Sl.&lt;/td&gt;\n                    &lt;td class=&quot;w-50 text-center&quot;&gt;Método Pago&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Total&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Saldo&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ payments }}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td&gt;{{ name }} by {{ by }} on {{ created_at }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ amount }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ pos_balance }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{ /payments }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n           \n        {{ if invoice_view != \'standard\' }}\n        {{ if taxes }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Tax Information&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-25&quot;&gt;Name&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-center&quot;&gt;Code&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-right&quot;&gt;Qty&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-right&quot;&gt;Tax Amt.&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ taxes }}\n                        &lt;tr&gt;\n                            &lt;td&gt;{{ taxrate_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ code_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ qty }}&lt;/td&gt; \n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_tax }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{ /taxes }}\n                    {{ if invoice_view == \'indian_gst\' }}\n                        &lt;tr class=&quot;bg-gray&quot;&gt;\n                            &lt;td&gt;Order Tax: {{ order_tax }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;CGST: {{ cgst }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;SGST: {{ sgst }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;IGST: {{ igst }}&lt;/td&gt;\n                        &lt;/tr&gt;\n                     {{ endif }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        {{ endif }}\n        \n        {{ if barcode }}\n        &lt;section class=&quot;info-area barcode-area&quot;&gt;\n            {{ barcode }}\n        &lt;/section&gt;\n        {{ endif }}\n        \n        &lt;section class=&quot;info-area align-center footer-area&quot;&gt;\n           &lt;!-- &lt;span class=&quot;block&quot;&gt;Sold product No Claim. No Change, New product One Month Warranty.&lt;/span&gt; --&gt;\n            &lt;span class=&quot;block bold&quot;&gt;{{ footer_text }}&lt;/span&gt;\n        &lt;/section&gt;\n        \n &lt;/section&gt;', '/*Common CSS*/\n        .receipt-template {\n            width:302px;\n            margin:0 auto;\n        }\n        .receipt-template .text-small {\n            font-size: 10px;\n        }\n        .receipt-template .block {\n            display: block;\n        }\n        .receipt-template .inline-block {\n            display: inline-block;\n        }\n        .receipt-template .bold {\n            font-weight: 700;\n        }\n        .receipt-template .italic {\n            font-style: italic;\n        }\n        .receipt-template .align-right {\n            text-align: right;\n        }\n        .receipt-template .align-center {\n            text-align: center;\n        }\n        .receipt-template .main-title {\n            font-size: 14px;\n            font-weight: 700;\n            text-align: center;\n            margin: 10px 0 5px 0;\n            padding: 0;\n        }\n        .receipt-template .heading {\n            position: relation;\n        }\n        .receipt-template .title {\n            font-size: 16px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template .sub-title {\n            font-size: 12px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template table {\n            width: 100%;\n        }\n        .receipt-template td,\n        .receipt-template th {\n            font-size:12px;\n        }\n        .receipt-template .info-area {\n            font-size: 12px;      \n            line-height: 1.222;  \n        }\n        .receipt-template .listing-area {\n            line-height: 1.222;\n        }\n        .receipt-template .listing-area table {}\n        .receipt-template .listing-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n            font-weight: 700;\n        }\n        .receipt-template .listing-area table tbody tr {\n            border-top: 1px dashed #000;\n            border-bottom: 1px dashed #000;\n        }\n        .receipt-template .listing-area table tbody tr:last-child {\n            border-bottom: none;\n        }\n        .receipt-template .listing-area table td {\n            vertical-align: top;\n        }\n        .receipt-template .info-area table {}\n        .receipt-template .info-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n        }\n    \n /*Receipt Heading*/\n        .receipt-template .receipt-header {\n            text-align: center;\n        }\n        .receipt-template .receipt-header .logo-area {\n            width: 80px;\n            height: 80px;\n            margin: 0 auto;\n        }\n        .receipt-template .receipt-header .logo-area img.logo {\n            display: inline-block;\n            max-width: 100%;\n            max-height: 100%;\n        }\n        .receipt-template .receipt-header .address-area {\n            margin-bottom: 5px;\n            line-height: 1;\n        }\n        .receipt-template .receipt-header .info {\n            font-size: 12px;\n        }\n        .receipt-template .receipt-header .store-name {\n            font-size: 24px;\n            font-weight: 700;\n            margin: 0;\n            padding: 0;\n        }\n        \n        \n/*Invoice Info Area*/ \n    .receipt-template .invoice-info-area {}\n    \n/*Customer Customer Area*/\n    .receipt-template .customer-area {\n        margin-top:10px;\n    }\n\n/*Calculation Area*/\n    .receipt-template .calculation-area {\n        border-top: 2px solid #000;\n        font-weight: bold;\n    }\n    .receipt-template .calculation-area table td {\n        text-align: right;\n    }\n    .receipt-template .calculation-area table td:nth-child(2) {\n        border-bottom: 1px dashed #000;\n    }\n\n/*Item Listing*/\n    .receipt-template .item-list table tr {\n    }\n    \n/*Barcode Area*/\n    .receipt-template .barcode-area {\n        margin-top: 10px;\n        text-align: center;\n    }\n    .receipt-template .barcode-area img {\n        max-width: 100%;\n        display: inline-block;\n    }\n    \n/*Footer Area*/\n    .receipt-template .footer-area {\n        line-height: 1.222;\n        font-size: 10px;\n    }\n \n/*Media Query*/\n    @media print {\n        .receipt-template {\n            width: 100%;\n        }\n    }\n    @media all and (max-width: 215px) {}', '2019-05-10 12:35:05', '2019-07-02 21:06:02', 1),
(2, 'Minimal', '&lt;section class=&quot;receipt-template&quot;&gt;\n\n        &lt;header class=&quot;receipt-header&quot;&gt;\n            &lt;div class=&quot;logo-area&quot;&gt;\n                &lt;img class=&quot;logo&quot; src=&quot;{{  logo_url  }}&quot;&gt;\n            &lt;/div&gt;\n            &lt;h2 class=&quot;store-name&quot;&gt;{{ store_name }}&lt;/h2&gt;\n            &lt;div class=&quot;address-area&quot;&gt;\n                &lt;span class=&quot;info address&quot;&gt;{{ store_address }}&lt;/span&gt;\n                &lt;div class=&quot;block&quot;&gt;\n                    &lt;span class=&quot;info phone&quot;&gt;Mobile: {{ store_phone }}&lt;/span&gt;, &lt;span class=&quot;info email&quot;&gt;Email: {{ store_email }}&lt;/span&gt;\n                &lt;/div&gt;\n            &lt;/div&gt;\n        &lt;/header&gt;\n        \n        &lt;div class=&quot;heading&quot;&gt;\n            &lt;h2 class=&quot;title text-center zero-around title-lg&quot;&gt;INVOICE&lt;/h2&gt;\n        &lt;/div&gt;\n        \n        &lt;section class=&quot;info-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-10&quot;&gt;&lt;span&gt;Bill #:&lt;/td&gt;\n                    &lt;td class=&quot;w-40 text-center sinfo billno&quot;&gt;&lt;span&gt;{{ invoice_id }}&lt;/span&gt;&lt;/td&gt;\n                    &lt;td class=&quot;w-10 text-right&quot;&gt;&lt;span&gt;Date:&lt;/td&gt;\n                    &lt;td class=&quot;w-40 text-center sinfo date&quot;&gt;&lt;span&gt;{{ date_time }}&lt;/span&gt;&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-10&quot;&gt;M/S:&lt;/td&gt;\n                    &lt;td class=&quot;w-90&quot; colspan=&quot;3&quot;&gt;&lt;span class=&quot;text-lg&quot;&gt;{{ customer_name }}&lt;/span&gt;&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;listing-area item-list&quot;&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;tr&gt;\n                        &lt;td class=&quot;w-40 text-center&quot;&gt;DESC.&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-center&quot;&gt;Qty&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-right&quot;&gt;Price&lt;/td&gt;\n                        &lt;td class=&quot;w-20 text-right&quot;&gt;AMT&lt;/td&gt;\n                    &lt;/tr&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ items }}\n                        &lt;tr&gt;\n                            &lt;td&gt;{{ item_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_quantity }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_price }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt;   \n                        &lt;/tr&gt;\n                    {{ /items }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;info-area calculation-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Subtotal:&lt;/td&gt;\n                    &lt;td&gt;{{ subtotal }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Impuesto:&lt;/td&gt;\n                    &lt;td&gt;{{ order_tax }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Descuento:&lt;/td&gt;\n                    &lt;td&gt;{{ discount_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Cargo Envío:&lt;/td&gt;\n                    &lt;td&gt;{{ shipping_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Otros Cargos:&lt;/td&gt;\n                    &lt;td&gt;{{ others_charge }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Previous Due:&lt;/td&gt;\n                    &lt;td&gt;{{ previous_due }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Amount Total:&lt;/td&gt;\n                    &lt;td&gt;{{ payable_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Amount Paid:&lt;/td&gt;\n                    &lt;td&gt;{{ paid_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Due:&lt;/td&gt;\n                    &lt;td&gt;{{ due }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Change:&lt;/td&gt;\n                    &lt;td&gt;{{ change }}&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;stylish-footer text-center&quot;&gt;\n            &lt;span&gt;Impreso el: {{ printed_on }}&lt;/span&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;info-area align-center footer-area&quot;&gt;\n            &lt;!-- &lt;span class=&quot;block&quot;&gt;Sold product No Claim. No Change, New product One Month Warranty.&lt;/span&gt; --&gt;\n            &lt;span class=&quot;block bold&quot;&gt;Gracias por elegirnos.&lt;/span&gt;\n        &lt;/section&gt;\n        \n &lt;/section&gt;', '/*Common CSS*/\n        .receipt-template {\n            width:302px;\n            margin:0 auto;\n        }\n        .receipt-template .text-small {\n            font-size: 10px;\n        }\n        .receipt-template .block {\n            display: block;\n        }\n        .receipt-template .inline-block {\n            display: inline-block;\n        }\n        .receipt-template .bold {\n            font-weight: 700;\n        }\n        .receipt-template .italic {\n            font-style: italic;\n        }\n        .receipt-template .align-right {\n            text-align: right;\n        }\n        .receipt-template .align-center {\n            text-align: center;\n        }\n        .receipt-template .heading {\n            position: relation;\n        }\n        .receipt-template .title {\n            font-size: 16px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template .sub-title {\n            font-size: 12px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template table {\n            width: 100%;\n        }\n        .receipt-template td,\n        .receipt-template th {\n            font-size:10px;\n        }\n        .receipt-template .info-area {\n            font-size: 12px;      \n            line-height: 1.222;  \n        }\n        .receipt-template .listing-area {\n            line-height: 1.222;\n        }\n        .receipt-template .listing-area table {}\n        .receipt-template .listing-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n            font-weight: 700;\n        }\n        .receipt-template .listing-area table tbody tr {\n            border-top: 1px dashed #000;\n            border-bottom: 1px dashed #000;\n        }\n        .receipt-template .listing-area table tbody tr:last-child {\n            border-bottom: none;\n        }\n        .receipt-template .listing-area table td {\n            vertical-align: top;\n        }\n        .receipt-template .info-area table {}\n        .receipt-template .info-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n        }\n\n /*Receipt Heading*/\n        .receipt-template .receipt-header {\n            text-align: center;\n        }\n        .receipt-template .receipt-header .logo-area {\n            width: 80px;\n            height: 80px;\n            margin: 0 auto;\n        }\n        .receipt-template .receipt-header .logo-area img.logo {\n            display: inline-block;\n            max-width: 100%;\n            max-height: 100%;\n        }\n        .receipt-template .receipt-header .address-area {\n            margin-bottom: 5px;\n            line-height: 1;\n        }\n        .receipt-template .receipt-header .info {\n            font-size: 12px;\n        }\n        .receipt-template .receipt-header .store-name {\n            font-size: 28px;\n            font-weight: 700;\n            margin: 0;\n            padding: 0;\n        }\n        \n        \n/*Invoice Info Area*/ \n    .receipt-template .invoice-info-area {}\n    \n/*Customer Info Area*/\n    .receipt-template .customer-area {\n        margin-top:10px;\n    }\n\n/*Calculation Area*/\n    .receipt-template .calculation-area {\n        border-top: 2px solid #000;\n    }\n    .receipt-template .calculation-area table td {\n        text-align: right;\n    }\n    .receipt-template .calculation-area table td:nth-child(2) {\n        border-bottom: 1px dashed #000;\n    }\n\n/*Item Listing*/\n    .receipt-template .item-list table tr {\n    }\n    \n/*Barcode Area*/\n    .receipt-template .barcode-area {\n        margin-top: 10px;\n        text-align: center;\n    }\n    .receipt-template .barcode-area img {\n        max-width: 100%;\n        display: inline-block;\n    }\n    \n/*Footer Area*/\n    .receipt-template .footer-area {\n        line-height: 1.222;\n        font-size: 10px;\n    }\n \n/*Media Query*/\n    @media print {\n        .receipt-template {\n            width: 100%;\n        }\n    }\n    @media all and (max-width: 215px) {}\n    \n    \n/* Additional */\n        .receipt-template .zero-around {\n            margin:0;\n            padding: 0;\n        }\n        .receipt-template .title-lg {\n            font-size: 18px!important;\n            margin-bottom: 5px;\n         }\n         .receipt-template .text-lg {\n             font-size: 18px;\n             font-weight: 700;\n         }\n         .receipt-template .info-area td {\n             vertical-align: center;\n         }\n         .receipt-template .info-area td.sinfo {\n             padding: 1px!important;\n         }\n         .receipt-template .info-area td.sinfo span {\n             display: block;\n             font-weight: 700;\n             border: 1px solid #000;\n             padding: 2px;\n         }\n         .receipt-template .listing-area td, .receipt-template .listing-area th, .receipt-template .calculation-area table td {\n             font-size: 13px;\n             font-weight: 700;\n         }\n         .receipt-template .item-list table thead td {\n             text-align: center;\n             padding: 3px;\n             border: 2px solid #000;\n          }\n          .receipt-template .stylish-footer {\n              margin: 10px 0 5px 0;\n          }\n          .receipt-template .stylish-footer span {\n              display: inline-block;\n              font-size: 12px;\n              border-top: 1px dashed #000;\n              border-bottom: 1px dashed #000; \n          }\n', '2019-05-14 19:02:11', '2019-07-02 16:16:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos_template_to_store`
--

CREATE TABLE `pos_template_to_store` (
  `pt2s` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `ttemplate_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `pos_template_to_store`
--

INSERT INTO `pos_template_to_store` (`pt2s`, `store_id`, `ttemplate_id`, `is_active`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 0),
(2, 1, 2, 1, 1, 0),
(3, 2, 1, 1, 1, 0),
(4, 3, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `printer_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) DEFAULT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`printer_id`, `title`, `type`, `profile`, `char_per_line`, `created_at`) VALUES
(1, 'Common Printer', 'windows', '', 200, '2018-09-27 13:52:04');

-- --------------------------------------------------------

--
-- Table structure for table `printer_to_store`
--

CREATE TABLE `printer_to_store` (
  `p2s_id` int(10) UNSIGNED NOT NULL,
  `pprinter_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `printer_to_store`
--

INSERT INTO `printer_to_store` (`p2s_id`, `pprinter_id`, `store_id`, `path`, `ip_address`, `port`, `status`, `sort_order`) VALUES
(1, 1, 2, 'POS-80C', '', '9100', 1, 0),
(2, 1, 3, NULL, NULL, NULL, 1, 0),
(3, 1, 1, NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` int(10) UNSIGNED NOT NULL,
  `p_type` enum('standard','service') NOT NULL DEFAULT 'standard',
  `p_code` varchar(50) DEFAULT NULL,
  `hsn_code` varchar(100) DEFAULT NULL,
  `barcode_symbology` varchar(50) DEFAULT NULL,
  `p_name` varchar(500) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `p_image` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_id`, `p_type`, `p_code`, `hsn_code`, `barcode_symbology`, `p_name`, `category_id`, `unit_id`, `p_image`, `description`) VALUES
(1, 'standard', '84908708', NULL, 'code128', 'KIT EXPLORA Y APRENDE CON GUCHITO 3 - 4 AÑOS + PLATAFORMA', 1, 1, '', ''),
(2, 'standard', '28738122', NULL, 'code128', 'KIT DESCUBRE Y APRENDE CON GUCHITO 4 - 5 AÑOS + PLATAFORMA', 1, 1, '', ''),
(3, 'standard', '72297389', NULL, 'code128', 'KIT CREA Y APRENDE CON GUCHITO (PRIMERO DE BÁSICA)+ PLATAFORMA', 1, 1, '', ''),
(4, 'standard', '95350428', NULL, 'code128', 'LOGROS LENGUA Y LITERATURA 2 + PLATAFORMA', 1, 1, '', ''),
(5, 'standard', '58755162', '', 'code128', 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', 1, 1, '', ''),
(6, 'standard', '33126218', '', 'code128', 'LOGROS LENGUA Y LITERATURA 4 + PLATAFORMA', 1, 1, '', ''),
(7, 'standard', '82852916', '', 'code128', 'LOGROS LENGUA Y LITERATURA 5 + PLATAFORMA', 1, 1, '', ''),
(8, 'standard', '28177392', '', 'code128', 'LOGROS LENGUA Y LITERATURA 6 + PLATAFORMA', 1, 1, '', ''),
(9, 'standard', '98750354', '', 'code128', 'LOGROS LENGUA Y LITERATURA 7 + PLATAFORMA', 1, 1, '', ''),
(10, 'standard', '97845309', '', 'code128', 'LOGROS MATEMÁTICAS 2 + PLATAFORMA', 1, 1, '', ''),
(11, 'standard', '37446446', '', 'code128', 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', 1, 1, '', ''),
(12, 'standard', '87452555', '', 'code128', 'LOGROS MATEMÁTICAS 4 + PLATAFORMA', 1, 1, '', ''),
(13, 'standard', '17125951', '', 'code128', 'LOGROS MATEMÁTICAS 5 + PLATAFORMA', 1, 1, '', ''),
(14, 'standard', '20336388', '', 'code128', 'LOGROS MATEMÁTICAS 6 + PLATAFORMA', 1, 1, '', ''),
(15, 'standard', '17379500', '', 'code128', 'LOGROS MATEMÁTICAS 7 + PLATAFORMA', 1, 1, '', ''),
(16, 'standard', '67985814', '', 'code128', 'LOGROS LENGUA Y LITERATURA 8 + PLATAFORMA', 1, 1, '', ''),
(17, 'standard', '30812878', '', 'code128', 'LOGROS LENGUA Y LITERATURA 9 + PLATAFORMA', 1, 1, '', ''),
(18, 'standard', '90694587', '', 'code128', 'LOGROS LENGUA Y LITERATURA 10 + PLATAFORMA', 1, 1, '', ''),
(19, 'standard', '48168494', '', 'code128', 'LOGROS MATEMÁTICAS 8 + PLATAFORMA', 1, 1, '', ''),
(20, 'standard', '50470905', '', 'code128', 'LOGROS MATEMÁTICAS 9 + PLATAFORMA', 1, 1, '', ''),
(21, 'standard', '19661370', '', 'code128', 'LOGROS MATEMÁTICAS 10 + PLATAFORMA', 1, 1, '', ''),
(22, 'standard', '57191121', '', 'code128', 'LOGROS CIENCIAS NATURALES 2 + PLATAFORMA', 1, 1, '', ''),
(23, 'standard', '96429566', NULL, 'code128', 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', 1, 1, '', ''),
(24, 'standard', '46133072', '', 'code128', 'LOGROS CIENCIAS NATURALES 4 + PLATAFORMA', 1, 1, '', ''),
(25, 'standard', '85762375', '', 'code128', 'LOGROS CIENCIAS NATURALES 5 + PLATAFORMA', 1, 1, '', ''),
(26, 'standard', '84337349', '', 'code128', 'LOGROS CIENCIAS NATURALES 6 + PLATAFORMA', 1, 1, '', ''),
(27, 'standard', '65309184', '', 'code128', 'LOGROS CIENCIAS NATURALES 7 + PLATAFORMA', 1, 1, '', ''),
(28, 'standard', '18823344', '', 'code128', 'LOGROS CIENCIAS NATURALES 8 + PLATAFORMA', 1, 1, '', ''),
(29, 'standard', '82277104', '', 'code128', 'LOGROS CIENCIAS NATURALES 9 + PLATAFORMA', 1, 1, '', ''),
(30, 'standard', '35452264', '', 'code128', 'LOGROS CIENCIAS NATURALES 10 + PLATAFORMA', 1, 1, '', ''),
(31, 'standard', '89110615', '', 'code128', 'LOGROS ESTUDIOS SOCIALES 2 + PLATAFORMA', 1, 1, '', ''),
(32, 'standard', '16276275', '', 'code128', 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', 1, 1, '', ''),
(33, 'standard', '13187309', '', 'code128', 'LOGROS ESTUDIOS SOCIALES 4 + PLATAFORMA', 1, 1, '', ''),
(34, 'standard', '58075868', '', 'code128', 'LOGROS ESTUDIOS SOCIALES 5 + PLATAFORMA', 1, 1, '', ''),
(35, 'standard', '50111795', '', 'code128', 'LOGROS ESTUDIOS SOCIALES 6 + PLATAFORMA', 1, 1, '', ''),
(36, 'standard', '53356925', '', 'code128', 'LOGROS ESTUDIOS SOCIALES 7 + PLATAFORMA', 1, 1, '', ''),
(37, 'standard', '29653913', '', 'code128', 'LOGROS ESTUDIOS SOCIALES 8 + PLATAFORMA', 1, 1, '', ''),
(38, 'standard', '28058757', '', 'code128', 'LOGROS ESTUDIOS SOCIALES 9 + PLATAFORMA', 1, 1, '', ''),
(39, 'standard', '27908612', '', 'code128', 'LOGROS ESTUDIOS SOCIALES 10 + PLATAFORMA', 1, 1, '', ''),
(40, 'standard', '33223163', NULL, 'code128', 'CONTABILIDAD 8 + PLATAFORMA', 1, 1, '', ''),
(41, 'standard', '71048773', NULL, 'code128', 'CONTABILIDAD 9 + PLATAFORMA', 1, 1, '', ''),
(42, 'standard', '22657311', '', 'code128', 'CONTABILIDAD 10 + PLATAFORMA', 1, 1, '', ''),
(43, 'standard', '81440463', '', 'code128', 'LOGROS LA MARAVILLA DE LEER 2 + PLATAFORMA', 1, 1, '', ''),
(44, 'standard', '65169137', '', 'code128', 'LOGROS LA MARAVILLA DE LEER 3 + PLATAFORMA', 1, 1, '', ''),
(45, 'standard', '15448204', '', 'code128', 'LOGROS LA MARAVILLA DE LEER 4 + PLATAFORMA', 1, 1, '', ''),
(46, 'standard', '67642288', NULL, 'code128', 'LOGROS LA MARAVILLA DE LEER 5 + PLATAFORMA', 1, 1, '', ''),
(47, 'standard', '72191249', '', 'code128', 'LOGROS LA MARAVILLA DE LEER 6 + PLATAFORMA', 1, 1, '', ''),
(48, 'standard', '16740100', '', 'code128', 'LOGROS LA MARAVILLA DE LEER 7 + PLATAFORMA', 1, 1, '', ''),
(49, 'standard', '30393218', '', 'code128', 'PORTAFOLIO EXPERIMENTAL DE CIENCIAS NATURALES 8 + PLATAFORMA', 1, 1, '', ''),
(50, 'standard', '52011903', '', 'code128', 'PORTAFOLIO EXPERIMENTAL DE CIENCIAS NATURALES 9+ PLATAFORMA', 1, 1, '', ''),
(51, 'standard', '31548609', '', 'code128', 'PORTAFOLIO EXPERIMENTAL DE CIENCIAS NATURALES 10 + PLATAFORMA', 1, 1, '', ''),
(52, 'standard', '14403437', NULL, 'code128', 'LOGROS LENGUA Y LITERATURA 1 BACH + PLATAFORMA', 1, 1, '', ''),
(53, 'standard', '55889087', NULL, 'code128', 'LOGROS LENGUA Y LITERATURA 2 BACH + PLATAFORMA', 1, 1, '', ''),
(54, 'standard', '99714065', NULL, 'code128', 'LOGROS LENGUA Y LITERATURA 3 BACH + PLATAFORMA', 1, 1, '', ''),
(55, 'standard', '99116268', NULL, 'code128', 'LOGROS BIOLOGÍA 1+ PLATAFORMA', 1, 1, '', ''),
(56, 'standard', '49297715', NULL, 'code128', 'LOGROS BIOLOGÍA 2 + PLATAFORMA', 1, 1, '', ''),
(57, 'standard', '65231252', NULL, 'code128', 'LOGROS BIOLOGÍA 3 + PLATAFORMA', 1, 1, '', ''),
(58, 'standard', '88201511', NULL, 'code128', 'LOGROS HISTORIA 1 + PLATAFORMA', 1, 1, '', ''),
(59, 'standard', '88113470', NULL, 'code128', 'LOGROS HISTORIA 2 + PLATAFORMA', 1, 1, '', ''),
(60, 'standard', '39874358', NULL, 'code128', 'LOGROS HISTORIA 3 + PLATAFORMA', 1, 1, '', ''),
(61, 'standard', '51634477', NULL, 'code128', 'LOGROS QUÍMICA 1 + PLATAFORMA', 1, 1, '', ''),
(62, 'standard', '55700997', NULL, 'code128', 'LOGROS QUÍMICA 2 + PLATAFORMA', 1, 1, '', ''),
(63, 'standard', '79118971', NULL, 'code128', 'LOGROS QUÍMICA 3 + PLATAFORMA', 1, 1, '', ''),
(64, 'standard', '45320218', NULL, 'code128', 'LOGROS EDUCACIÓN PARA LA CIUDADANÍA 1 + PLATAFORMA', 1, 1, '', ''),
(65, 'standard', '49074616', NULL, 'code128', 'LOGROS EDUCACIÓN PARA LA CIUDADANÍA 2 + PLATAFORMA', 1, 1, '', ''),
(66, 'standard', '65209792', NULL, 'code128', 'LOGROS EMPRENDIMIENTO 1 + PLATAFORMA', 1, 1, '', ''),
(67, 'standard', '22146400', NULL, 'code128', 'LOGROS EMPRENDIMIENTO 2 + PLATAFORMA', 1, 1, '', ''),
(68, 'standard', '80740272', NULL, 'code128', 'LOGROS FILOSOFÍA 1 + PLATAFORMA', 1, 1, '', ''),
(69, 'standard', '37748813', NULL, 'code128', 'LOGROS FILOSOFÍA 2 + PLATAFORMA', 1, 1, '', ''),
(70, 'standard', '78626800', NULL, 'code128', 'LOGROS EDUCACIÓN CULTURAL Y ARTÍSTICA 1 + PLATAFORMA', 1, 1, '', ''),
(71, 'standard', '25620676', NULL, 'code128', 'LOGROS EDUCACIÓN CULTURAL Y ARTÍSTICA  2 BGU + PLATAFORMA', 1, 1, '', ''),
(72, 'standard', '31307535', '', 'code128', 'LOGROS PROBLEMAS DEL MUNDO CONTEMPORÁNEO + PLATAFORMA', 1, 1, '', ''),
(73, 'standard', '52056978', '', 'code128', 'LOGROS FORMACIÓN Y ORIENTACIÓN LABORAL (BACHILLERATO TÉCNICO) + PLATAFORMA', 1, 1, '', ''),
(74, 'standard', '22725447', NULL, 'code128', 'CONTABILIDAD 1 BACH + PLATAFORMA', 1, 1, '', ''),
(75, 'standard', '96294190', NULL, 'code128', 'MANUAL DE FINANCIAMIENTO PARA EMPRESAS ( PARA CONTABILIDAD BANCARIA, DE COSTOS Y GENERAL DE BACHILLERATO TÉCNICO CONTABLE; COMPLEMENTO FINANCIERO PARA LA ASIGNATURA DE  EMPRENDIMIENTO; PARA MÓDULO DE FINANZAS DE BACHILLERATO INTERNACIONAL) + PLATAFORMA', 1, 1, '', ''),
(76, 'standard', '17386793', NULL, 'code128', 'GESTIÓN Y COMERCIALIZACIÓN DE UNA PYME (BACHILLERATO TÉCNICO) + PLATAFORMA', 1, 1, '', ''),
(77, 'standard', '15625001', NULL, 'code128', 'MI TUTORIAL DIGITAL MATEMATICAS 8', 1, 1, '', ''),
(78, 'standard', '11526783', NULL, 'code128', 'MI TUTORIAL DIGITAL QUIMICA 3BGU', 1, 1, '', ''),
(79, 'standard', '25221076', NULL, 'code128', 'MI TUTORIAL DIGITAL FISICA 1 BGU', 1, 1, '', ''),
(80, 'standard', '11374527', NULL, 'code128', 'EXPRESIONES VIVAS #8', 1, 1, '', ''),
(81, 'standard', '37593457', NULL, 'code128', 'EXPRESIONES VIVAS #9', 1, 1, '', ''),
(82, 'standard', '70795215', NULL, 'code128', 'EXPRESIONES VIVAS #10', 1, 1, '', ''),
(83, 'standard', '80656305', NULL, 'code128', 'EVERYDAY ENGLISH 1', 1, 1, '', ''),
(84, 'standard', '27532016', NULL, 'code128', 'EVERYDAY INGLISH 2', 1, 1, '', ''),
(85, 'standard', '88085768', NULL, 'code128', 'REFUERZO ESCOLAR 2', 1, 1, '', ''),
(86, 'standard', '81040877', NULL, 'code128', 'REFUERZO ESCOLAR 3', 1, 1, '', ''),
(87, 'standard', '47387043', NULL, 'code128', 'REFUERZO ESCOLAR 4', 1, 1, '', ''),
(88, 'standard', '56847516', NULL, 'code128', 'REFUERZO ESCOLAR 5', 1, 1, '', ''),
(89, 'standard', '54713392', NULL, 'code128', 'REFUERZO ESCOLAR 6', 1, 1, '', ''),
(90, 'standard', '31075130', NULL, 'code128', 'REFUERZO ESCOLAR 7', 1, 1, '', ''),
(91, 'standard', '97382986', NULL, 'code128', 'LEARNING ZONE SB + ONLINE 1', 1, 1, '', ''),
(92, 'standard', '91768734', NULL, 'code128', 'LEARNING ZONE SB + ONLINE 2', 1, 1, '', ''),
(93, 'standard', '23131941', NULL, 'code128', 'LEARNING ZONE SB + ONLINE 3', 1, 1, '', ''),
(94, 'standard', '64346616', NULL, 'code128', 'LEARNING ZONE SB + ONLINE 4', 1, 1, '', ''),
(95, 'standard', '46136097', NULL, 'code128', 'LEARNING ZONE SB + ONLINE 5', 1, 1, '', ''),
(96, 'standard', '01112179', NULL, 'code128', 'ELLEVATE ENGLISH TEEN  SB FULL 1', 1, 1, '', ''),
(97, 'standard', '86452196', NULL, 'code128', 'ELLEVATE ENGLISH TEEN  SB FULL 2', 1, 1, '', ''),
(98, 'standard', '97245655', NULL, 'code128', 'ELLEVATE ENGLISH TEEN  SB FULL 3', 1, 1, '', ''),
(99, 'standard', '06618545', NULL, 'code128', 'ELLEVATE ENGLISH TEEN  SB FULL 4', 1, 1, '', ''),
(100, 'standard', '46684151', NULL, 'code128', 'ELLEVATE ENGLISH TEEN  SB FULL 5 COTOPAXI', 1, 1, '', ''),
(101, 'standard', '58330793', NULL, 'code128', 'ELLEVATE ENGLISH TEEN  SB FULL 6 COTOPAXI', 1, 1, '', ''),
(102, 'standard', '07656311', NULL, 'code128', 'LEARNING ZONE SB + ONLINE 6', 1, 1, '', ''),
(103, 'standard', '44421888', NULL, 'code128', 'MI TUTORIAL DIGITAL FISICA 2 BGU', 2, 1, '', ''),
(104, 'standard', '66998264', NULL, 'code128', 'MI TUTORIAL DIGITAL FISICA 3 BGU', 2, 1, '', ''),
(105, 'standard', '90523185', NULL, 'code128', 'MI TUTORIAL DIGITAL MATEMATICAS 9', 2, 1, '', ''),
(106, 'standard', '50668852', NULL, 'code128', 'MI TUTORIAL DIGITAL MATEMATICAS 10', 2, 1, '', ''),
(107, 'standard', '85198993', NULL, 'code128', 'MI TUTORIAL DIGITAL MATEMATICAS 1 BGU', 2, 1, '', ''),
(108, 'standard', '42856354', NULL, 'code128', 'MI TUTORIAL DIGITAL MATEMATICAS 2 BGU', 2, 1, '', ''),
(109, 'standard', '40687141', NULL, 'code128', 'MI TUTORIAL DIGITAL MATEMATICAS 3 BGU', 2, 1, '', ''),
(110, 'standard', '51557845', NULL, 'code128', 'MI TUTORIAL DIGITAL QUIMICA 1BGU', 2, 1, '', ''),
(111, 'standard', '44073539', NULL, 'code128', 'MI TUTORIAL DIGITAL QUIMICA 2BGU', 2, 1, '', ''),
(112, 'standard', '74070107', NULL, 'code128', 'QUIMICA 1 BGU CERIT ', 2, 1, '', ''),
(113, 'standard', '38847908', NULL, 'code128', 'QUIMICA 2 BGU CERIT', 2, 1, '', ''),
(114, 'standard', '66710782', NULL, 'code128', 'QUIMICA 3 BGU CERIT ', 2, 1, '', ''),
(115, 'standard', '58902647', NULL, 'code128', 'ARTETICS 1', 1, 1, '', ''),
(116, 'standard', '18630040', NULL, 'code128', 'ARTETICS 2', 1, 1, '', ''),
(117, 'standard', '76498313', NULL, 'code128', 'ARTETICS 3', 1, 1, '', ''),
(118, 'standard', '92253813', NULL, 'code128', 'ARTETICS 4', 1, 1, '', ''),
(119, 'standard', '80698074', NULL, 'code128', 'ARTETICS 5', 1, 1, '', ''),
(120, 'standard', '20010234', NULL, 'code128', 'ARTETICS 6', 1, 1, '', ''),
(121, 'standard', '21930897', NULL, 'code128', 'ARTETICS 7', 1, 1, '', ''),
(122, 'standard', '02230164', NULL, 'code128', 'DESTRESAS EMOCIONALES Y VALORES 8', 1, 1, '', ''),
(123, 'standard', '62057082', NULL, 'code128', 'DESTRESAS EMOCIONALES Y VALORES 9', 1, 1, '', ''),
(124, 'standard', '47679109', NULL, 'code128', 'DESTRESAS EMOCIONALES Y VALORES 10', 1, 1, '', ''),
(125, 'standard', '94677024', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 1', 1, 1, '', ''),
(126, 'standard', '20387912', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 2', 1, 1, '', ''),
(127, 'standard', '12390024', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 3', 1, 1, '', ''),
(128, 'standard', '57215916', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 4', 1, 1, '', ''),
(129, 'standard', '09165720', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 5', 1, 1, '', ''),
(130, 'standard', '38957392', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 6', 1, 1, '', ''),
(131, 'standard', '73172640', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 7', 1, 1, '', ''),
(132, 'standard', '66096306', NULL, 'code128', 'DESTRESAS EMOCIONALES Y VALORES 1BGU', 1, 1, '', ''),
(133, 'standard', '61146065', NULL, 'code128', 'DESTRESAS EMOCIONALES Y VALORES 2 BGU', 1, 1, '', ''),
(134, 'standard', '33258485', NULL, 'code128', 'DESTRESAS EMOCIONALES Y VALORES 3 BGU', 1, 1, '', ''),
(135, 'standard', '60952706', NULL, 'code128', 'INGLES MB 1', 1, 1, '', ''),
(136, 'standard', '31671929', NULL, 'code128', 'INGLES MB 2', 1, 1, '', ''),
(137, 'standard', '06228294', NULL, 'code128', 'INGLES MB 3', 1, 1, '', ''),
(138, 'standard', '74621265', NULL, 'code128', 'INGLES MB 4', 1, 1, '', ''),
(139, 'standard', '07889479', NULL, 'code128', 'INGLES MB 5', 1, 1, '', ''),
(140, 'standard', '88643307', NULL, 'code128', 'INGLES MB 6', 1, 1, '', ''),
(141, 'standard', '88456939', NULL, 'code128', 'INGLES MB 7', 1, 1, '', ''),
(142, 'standard', '83903811', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 8', 1, 1, '', ''),
(143, 'standard', '67601388', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 9', 1, 1, '', ''),
(144, 'standard', '03410794', NULL, 'code128', 'CALIGRAFIA Y ORTOGRAFIA MB 10', 1, 1, '', ''),
(145, 'standard', '60173741', NULL, 'code128', 'EVERYDAY ENGLISH 1 STA MARIANA AMBATO', 1, 1, '', ''),
(146, 'standard', '11845077', NULL, 'code128', 'EVERYDAY ENGLISH 2 STA MARIANA AMBATO', 1, 1, '', ''),
(147, 'standard', '79581210', NULL, 'code128', 'MI LECTURA DIRIGIDA 7', 1, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_college`
--

CREATE TABLE `product_to_college` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `college_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `estimatedsales` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `product_to_college`
--

INSERT INTO `product_to_college` (`id`, `product_id`, `college_id`, `estimatedsales`, `status`, `sort_order`) VALUES
(1, 73, 1, 140, 1, 0),
(2, 43, 1, 40, 1, 0),
(3, 44, 1, 40, 1, 0),
(4, 45, 1, 40, 1, 0),
(5, 46, 1, 40, 1, 0),
(6, 47, 1, 40, 1, 0),
(7, 48, 1, 40, 1, 0),
(8, 61, 1, 70, 1, 0),
(9, 62, 1, 70, 1, 0),
(10, 63, 1, 70, 1, 0),
(11, 96, 2, 15, 1, 0),
(12, 97, 2, 15, 1, 0),
(13, 100, 2, 15, 1, 0),
(14, 101, 2, 15, 1, 0),
(15, 83, 2, 15, 1, 0),
(16, 84, 2, 15, 1, 0),
(17, 3, 2, 15, 1, 0),
(18, 2, 2, 15, 1, 0),
(19, 91, 2, 15, 1, 0),
(20, 92, 2, 15, 1, 0),
(21, 93, 2, 15, 1, 0),
(22, 94, 2, 15, 1, 0),
(23, 95, 2, 15, 1, 0),
(24, 102, 2, 15, 1, 0),
(25, 22, 2, 15, 1, 0),
(26, 23, 2, 15, 1, 0),
(27, 24, 2, 15, 1, 0),
(28, 25, 2, 15, 1, 0),
(29, 26, 2, 15, 1, 0),
(30, 27, 2, 15, 1, 0),
(31, 28, 2, 15, 1, 0),
(32, 29, 2, 15, 1, 0),
(33, 31, 2, 15, 1, 0),
(34, 32, 2, 15, 1, 0),
(35, 33, 2, 15, 1, 0),
(36, 34, 2, 15, 1, 0),
(37, 35, 2, 15, 1, 0),
(38, 36, 2, 15, 1, 0),
(39, 37, 2, 15, 1, 0),
(40, 38, 2, 15, 1, 0),
(41, 58, 2, 15, 1, 0),
(42, 59, 2, 15, 1, 0),
(43, 60, 2, 15, 1, 0),
(44, 4, 2, 15, 1, 0),
(45, 53, 2, 15, 1, 0),
(46, 5, 2, 15, 1, 0),
(47, 54, 2, 15, 1, 0),
(48, 6, 2, 15, 1, 0),
(49, 7, 2, 15, 1, 0),
(50, 8, 2, 15, 1, 0),
(51, 9, 2, 15, 1, 0),
(52, 16, 2, 15, 1, 0),
(53, 17, 2, 15, 1, 0),
(54, 10, 2, 15, 1, 0),
(55, 11, 2, 15, 1, 0),
(56, 12, 2, 15, 1, 0),
(57, 13, 2, 15, 1, 0),
(58, 14, 2, 15, 1, 0),
(59, 15, 2, 15, 1, 0),
(60, 103, 2, 15, 1, 0),
(61, 104, 2, 15, 1, 0),
(62, 108, 2, 15, 1, 0),
(63, 109, 2, 15, 1, 0),
(64, 77, 2, 15, 1, 0),
(65, 105, 2, 15, 1, 0),
(66, 111, 2, 15, 1, 0),
(67, 78, 2, 15, 1, 0),
(68, 85, 2, 15, 1, 0),
(69, 86, 2, 15, 1, 0),
(70, 87, 2, 15, 1, 0),
(71, 88, 2, 15, 1, 0),
(72, 89, 2, 15, 1, 0),
(73, 90, 2, 15, 1, 0),
(74, 107, 3, 90, 1, 0),
(75, 106, 3, 90, 1, 0),
(76, 108, 3, 90, 1, 0),
(77, 109, 3, 90, 1, 0),
(78, 77, 3, 90, 1, 0),
(79, 105, 3, 90, 1, 0),
(80, 63, 4, 18, 0, 0),
(81, 62, 4, 28, 0, 0),
(82, 61, 4, 24, 0, 0),
(83, 112, 4, 30, 1, 0),
(84, 113, 4, 30, 1, 0),
(85, 114, 4, 30, 1, 0),
(86, 57, 2, 1, 1, 0),
(87, 56, 2, 15, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_to_store`
--

CREATE TABLE `product_to_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `purchase_price` float NOT NULL DEFAULT 0,
  `sell_price` float NOT NULL DEFAULT 0,
  `quantity_in_stock` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `alert_quantity` decimal(25,4) NOT NULL DEFAULT 10.0000,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `box_id` int(10) UNSIGNED DEFAULT NULL,
  `taxrate_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_method` varchar(55) NOT NULL DEFAULT 'inclusive',
  `preference` longtext DEFAULT NULL,
  `e_date` date DEFAULT NULL,
  `p_date` date NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `product_to_store`
--

INSERT INTO `product_to_store` (`id`, `product_id`, `store_id`, `purchase_price`, `sell_price`, `quantity_in_stock`, `alert_quantity`, `sup_id`, `brand_id`, `course_id`, `box_id`, `taxrate_id`, `tax_method`, `preference`, `e_date`, `p_date`, `status`, `sort_order`) VALUES
(1, 1, 1, 20, 40, '0.0000', '10.0000', 1, 1, 11, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(2, 2, 1, 20, 40, '0.0000', '10.0000', 1, 1, 12, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(3, 3, 1, 20, 40, '0.0000', '10.0000', 1, 1, 1, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(4, 4, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(5, 5, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(6, 6, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(7, 7, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(8, 8, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(9, 9, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(10, 10, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(11, 11, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(12, 12, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(13, 13, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(14, 14, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(15, 15, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(16, 16, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(17, 17, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(18, 18, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(19, 19, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(20, 20, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(21, 21, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(22, 22, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(23, 23, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(24, 24, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(25, 25, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(26, 26, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(27, 27, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(28, 28, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(29, 29, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(30, 30, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(31, 31, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(32, 32, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(33, 33, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(34, 34, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(35, 35, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(36, 36, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(37, 37, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(38, 38, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(39, 39, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(40, 40, 1, 10, 25, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(41, 41, 1, 10, 25, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(42, 42, 1, 10, 25, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(43, 43, 1, 5.6, 14, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(44, 44, 1, 5.6, 14, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(45, 45, 1, 5.6, 14, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(46, 46, 1, 5.6, 14, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(47, 47, 1, 5.6, 14, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(48, 48, 1, 5.6, 14, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(49, 49, 1, 5.6, 14, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(50, 50, 1, 5.6, 14, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(51, 51, 1, 5.6, 14, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(52, 52, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(53, 53, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(54, 54, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(55, 55, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(56, 56, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(57, 57, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(58, 58, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(59, 59, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(60, 60, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(61, 61, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(62, 62, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(63, 63, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(64, 64, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(65, 65, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(66, 66, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(67, 67, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(68, 68, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(69, 69, 1, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(70, 70, 1, 25, 25, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(71, 71, 1, 25, 25, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(72, 72, 1, 10, 25, '0.0000', '10.0000', 1, 1, 0, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(73, 73, 1, 10, 25, '0.0000', '10.0000', 1, 1, 0, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(74, 74, 1, 10, 25, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(75, 75, 1, 10, 25, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(76, 76, 1, 10, 25, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(77, 77, 1, 6, 15, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(78, 78, 1, 6, 15, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(79, 79, 1, 6, 15, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(207, 80, 1, 14, 14, '0.0000', '10.0000', 1, 0, 8, 1, 2, 'inclusive', 'a:0:{}', '2024-06-16', '2023-06-17', 1, 0),
(210, 81, 1, 14, 14, '0.0000', '10.0000', 1, 0, 9, 1, 2, 'inclusive', 'a:0:{}', '2024-06-16', '2023-06-17', 1, 0),
(213, 82, 1, 14, 14, '0.0000', '10.0000', 1, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-06-16', '2023-06-17', 1, 0),
(214, 1, 2, 20, 40, '19.0000', '10.0000', 1, 1, 11, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(215, 2, 2, 20, 40, '30.0000', '10.0000', 1, 1, 12, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(216, 3, 2, 20, 40, '25.0000', '10.0000', 1, 1, 1, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(217, 4, 2, 10.8, 27, '20.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(218, 5, 2, 10.8, 27, '15.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(219, 6, 2, 10.8, 27, '19.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(220, 7, 2, 10.8, 27, '25.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(221, 8, 2, 10.8, 27, '24.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(222, 9, 2, 10.8, 27, '17.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(223, 10, 2, 10.8, 27, '18.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(224, 11, 2, 10.8, 27, '14.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(225, 12, 2, 10.8, 27, '22.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(226, 13, 2, 10.8, 27, '24.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(227, 14, 2, 10.8, 27, '23.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(228, 15, 2, 10.8, 27, '21.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(229, 16, 2, 10.8, 27, '22.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(230, 17, 2, 10.8, 27, '24.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(231, 18, 2, 10.8, 27, '6.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(232, 19, 2, 10.8, 27, '28.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(233, 20, 2, 10.8, 27, '28.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(234, 21, 2, 10.8, 27, '29.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(235, 22, 2, 10.8, 27, '21.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(236, 23, 2, 10.8, 27, '17.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(237, 24, 2, 10.8, 27, '11.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(238, 25, 2, 10.8, 27, '21.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(239, 26, 2, 10.8, 27, '9.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(240, 27, 2, 10.8, 27, '15.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(241, 28, 2, 10.8, 27, '31.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(242, 29, 2, 10.8, 27, '27.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(243, 30, 2, 10.8, 27, '30.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(244, 31, 2, 10.8, 27, '23.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(245, 32, 2, 10.8, 27, '18.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(246, 33, 2, 10.8, 27, '22.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(247, 34, 2, 10.8, 27, '24.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(248, 35, 2, 10.8, 27, '28.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(249, 36, 2, 10.8, 27, '25.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(250, 37, 2, 10.8, 27, '30.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(251, 38, 2, 10.8, 27, '26.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(252, 39, 2, 10.8, 27, '29.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(253, 40, 2, 10, 25, '32.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(254, 41, 2, 10, 25, '8.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(255, 42, 2, 10, 25, '33.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(256, 43, 2, 5.6, 14, '21.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(257, 44, 2, 5.6, 14, '29.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(258, 45, 2, 5.6, 14, '29.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(259, 46, 2, 5.6, 14, '22.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(260, 47, 2, 5.6, 14, '22.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(261, 48, 2, 5.6, 14, '23.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(262, 49, 2, 5.6, 14, '22.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(263, 50, 2, 5.6, 14, '23.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(264, 51, 2, 5.6, 14, '22.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(265, 52, 2, 10.8, 27, '9.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(266, 53, 2, 10.8, 27, '27.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(267, 54, 2, 10.8, 27, '27.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(268, 55, 2, 10.8, 27, '26.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(269, 56, 2, 10.8, 27, '23.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(270, 57, 2, 10.8, 27, '23.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(271, 58, 2, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(272, 59, 2, 10.8, 27, '26.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(273, 60, 2, 10.8, 27, '18.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(274, 61, 2, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(275, 62, 2, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(276, 63, 2, 10.8, 27, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(277, 64, 2, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(278, 65, 2, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(279, 66, 2, 10.8, 27, '5.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(280, 67, 2, 10.8, 27, '22.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(281, 68, 2, 10.8, 27, '4.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(282, 69, 2, 10.8, 27, '32.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(283, 70, 2, 25, 25, '3.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(284, 71, 2, 25, 25, '28.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(285, 72, 2, 10, 25, '25.0000', '10.0000', 1, 1, 0, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(286, 73, 2, 10, 25, '0.0000', '10.0000', 1, 1, 0, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(287, 74, 2, 10, 25, '36.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(288, 75, 2, 10, 25, '31.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(289, 76, 2, 10, 25, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(290, 77, 2, 6, 15, '7.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(291, 78, 2, 6, 15, '19.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(292, 79, 2, 6, 15, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(293, 80, 2, 14, 14, '0.0000', '10.0000', 1, 0, 8, 1, 2, 'inclusive', 'a:0:{}', '2024-06-16', '2023-06-17', 1, 0),
(294, 81, 2, 14, 14, '0.0000', '10.0000', 1, 0, 9, 1, 2, 'inclusive', 'a:0:{}', '2024-06-16', '2023-06-17', 1, 0),
(295, 82, 2, 14, 14, '0.0000', '10.0000', 1, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-06-16', '2023-06-17', 1, 0),
(341, 83, 1, 21, 45, '0.0000', '10.0000', 4, 0, 12, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(342, 83, 2, 21, 45, '13.0000', '10.0000', 4, 0, 12, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(343, 84, 1, 21, 45, '0.0000', '10.0000', 4, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(344, 84, 2, 21, 45, '2.0000', '10.0000', 4, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(345, 85, 1, 6.5, 10, '0.0000', '10.0000', 7, 0, 2, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(346, 85, 2, 6.5, 10, '8.0000', '10.0000', 7, 0, 2, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(347, 86, 1, 6.5, 10, '0.0000', '10.0000', 7, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(348, 86, 2, 6.5, 10, '2.0000', '10.0000', 7, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(349, 87, 1, 6.5, 10, '0.0000', '10.0000', 7, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(350, 87, 2, 6.5, 10, '7.0000', '10.0000', 7, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(351, 88, 1, 6.5, 10, '0.0000', '10.0000', 7, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(352, 88, 2, 6.5, 10, '7.0000', '10.0000', 7, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(353, 89, 1, 6.5, 10, '0.0000', '10.0000', 7, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(354, 89, 2, 6.5, 10, '6.0000', '10.0000', 7, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(355, 90, 1, 6.5, 10, '0.0000', '10.0000', 7, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(356, 90, 2, 6.5, 10, '7.0000', '10.0000', 7, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(357, 91, 1, 27, 46, '0.0000', '10.0000', 4, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(358, 91, 2, 27, 46, '13.0000', '10.0000', 4, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(359, 92, 1, 27, 46, '0.0000', '10.0000', 4, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(360, 92, 2, 27, 46, '7.0000', '10.0000', 4, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(361, 93, 1, 27, 46, '0.0000', '10.0000', 4, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(362, 93, 2, 27, 46, '6.0000', '10.0000', 4, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(363, 94, 1, 27, 46, '0.0000', '10.0000', 4, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(364, 94, 2, 27, 46, '7.0000', '10.0000', 4, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(365, 95, 1, 27, 46, '0.0000', '10.0000', 4, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(366, 95, 2, 27, 46, '6.0000', '10.0000', 4, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(367, 96, 1, 22, 46, '0.0000', '10.0000', 4, 0, 8, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(368, 96, 2, 22, 46, '6.0000', '10.0000', 4, 0, 8, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(369, 97, 1, 22, 46, '0.0000', '10.0000', 4, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(370, 97, 2, 22, 46, '5.0000', '10.0000', 4, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(371, 98, 1, 22, 46, '0.0000', '10.0000', 4, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(372, 98, 2, 22, 46, '0.0000', '10.0000', 4, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(373, 99, 1, 22, 46, '0.0000', '10.0000', 4, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(374, 99, 2, 22, 46, '0.0000', '10.0000', 4, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(375, 100, 1, 22, 54, '0.0000', '10.0000', 4, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(376, 100, 2, 22, 54, '6.0000', '10.0000', 4, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(377, 101, 1, 22, 54, '0.0000', '10.0000', 4, 0, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(378, 101, 2, 22, 54, '2.0000', '10.0000', 4, 0, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(379, 102, 1, 22, 46, '0.0000', '10.0000', 4, 0, 7, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(380, 102, 2, 22, 46, '7.0000', '10.0000', 4, 0, 7, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(381, 103, 1, 6, 15, '0.0000', '10.0000', 1, 0, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(382, 103, 2, 6, 15, '26.0000', '10.0000', 1, 0, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(383, 104, 1, 6, 15, '0.0000', '10.0000', 1, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(384, 104, 2, 6, 15, '29.0000', '10.0000', 1, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(385, 105, 1, 6, 15, '0.0000', '10.0000', 1, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(386, 105, 2, 6, 15, '4.0000', '10.0000', 1, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(387, 106, 1, 6, 15, '0.0000', '10.0000', 1, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(388, 106, 2, 6, 15, '0.0000', '10.0000', 1, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(389, 107, 1, 6, 15, '0.0000', '10.0000', 1, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(390, 107, 2, 6, 15, '0.0000', '10.0000', 1, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(391, 108, 1, 6, 15, '0.0000', '10.0000', 1, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(392, 108, 2, 6, 15, '5.0000', '10.0000', 1, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(393, 109, 1, 6, 15, '0.0000', '10.0000', 1, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(394, 109, 2, 6, 15, '6.0000', '10.0000', 1, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(395, 110, 1, 6, 15, '0.0000', '10.0000', 1, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(396, 110, 2, 6, 15, '0.0000', '10.0000', 1, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(397, 111, 1, 6, 15, '0.0000', '10.0000', 1, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(398, 111, 2, 6, 15, '18.0000', '10.0000', 1, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(399, 112, 1, 10.5, 20.25, '0.0000', '10.0000', 1, 0, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-07-27', '2023-07-28', 1, 0),
(400, 112, 2, 10.5, 20.25, '0.0000', '10.0000', 1, 0, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-07-27', '2023-07-28', 1, 0),
(401, 113, 1, 10.8, 20.25, '0.0000', '10.0000', 1, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-27', '2023-07-28', 1, 0),
(402, 113, 2, 10.8, 20.25, '0.0000', '10.0000', 1, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-27', '2023-07-28', 1, 0),
(403, 114, 1, 10.8, 20.25, '0.0000', '10.0000', 1, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-07-27', '2023-07-28', 1, 0),
(404, 114, 2, 10.8, 20.25, '0.0000', '10.0000', 1, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-07-27', '2023-07-28', 1, 0),
(405, 1, 3, 20, 40, '0.0000', '10.0000', 1, 1, 11, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(406, 2, 3, 20, 40, '0.0000', '10.0000', 1, 1, 12, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(407, 3, 3, 20, 40, '0.0000', '10.0000', 1, 1, 1, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(408, 4, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(409, 5, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(410, 6, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(411, 7, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(412, 8, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(413, 9, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(414, 10, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(415, 11, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(416, 12, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(417, 13, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(418, 14, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(419, 15, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(420, 16, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(421, 17, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(422, 18, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(423, 19, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(424, 20, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(425, 21, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(426, 22, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(427, 23, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(428, 24, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(429, 25, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(430, 26, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(431, 27, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(432, 28, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(433, 29, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(434, 30, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(435, 31, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(436, 32, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(437, 33, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(438, 34, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(439, 35, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(440, 36, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(441, 37, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(442, 38, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(443, 39, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(444, 40, 3, 10, 25, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(445, 41, 3, 10, 25, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(446, 42, 3, 10, 25, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(447, 43, 3, 5.6, 14, '0.0000', '10.0000', 1, 1, 2, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(448, 44, 3, 5.6, 14, '0.0000', '10.0000', 1, 1, 3, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(449, 45, 3, 5.6, 14, '0.0000', '10.0000', 1, 1, 4, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(450, 46, 3, 5.6, 14, '0.0000', '10.0000', 1, 1, 5, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(451, 47, 3, 5.6, 14, '0.0000', '10.0000', 1, 1, 6, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(452, 48, 3, 5.6, 14, '0.0000', '10.0000', 1, 1, 7, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(453, 49, 3, 5.6, 14, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(454, 50, 3, 5.6, 14, '0.0000', '10.0000', 1, 1, 9, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(455, 51, 3, 5.6, 14, '0.0000', '10.0000', 1, 1, 10, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(456, 52, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(457, 53, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(458, 54, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(459, 55, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(460, 56, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(461, 57, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(462, 58, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(463, 59, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(464, 60, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(465, 61, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(466, 62, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(467, 63, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(468, 64, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(469, 65, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(470, 66, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(471, 67, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(472, 68, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(473, 69, 3, 10.8, 27, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(474, 70, 3, 25, 25, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(475, 71, 3, 25, 25, '0.0000', '10.0000', 1, 1, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(476, 72, 3, 10, 25, '0.0000', '10.0000', 1, 1, 0, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(477, 73, 3, 10, 25, '0.0000', '10.0000', 1, 1, 0, 1, 2, 'inclusive', NULL, '2024-06-14', '2023-06-14', 1, 0),
(478, 74, 3, 10, 25, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(479, 75, 3, 10, 25, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(480, 76, 3, 10, 25, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(481, 77, 3, 6, 15, '0.0000', '10.0000', 1, 1, 8, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(482, 78, 3, 6, 15, '0.0000', '10.0000', 1, 1, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(483, 79, 3, 6, 15, '0.0000', '10.0000', 1, 1, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-06-14', '2023-06-14', 1, 0),
(484, 80, 3, 14, 14, '0.0000', '10.0000', 1, 0, 8, 1, 2, 'inclusive', 'a:0:{}', '2024-06-16', '2023-06-17', 1, 0),
(485, 81, 3, 14, 14, '0.0000', '10.0000', 1, 0, 9, 1, 2, 'inclusive', 'a:0:{}', '2024-06-16', '2023-06-17', 1, 0),
(486, 82, 3, 14, 14, '0.0000', '10.0000', 1, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-06-16', '2023-06-17', 1, 0),
(487, 83, 3, 21, 45, '0.0000', '10.0000', 4, 0, 12, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(488, 84, 3, 21, 45, '0.0000', '10.0000', 4, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(489, 85, 3, 6.5, 10, '0.0000', '10.0000', 7, 0, 2, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(490, 86, 3, 6.5, 10, '0.0000', '10.0000', 7, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(491, 87, 3, 6.5, 10, '0.0000', '10.0000', 7, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(492, 88, 3, 6.5, 10, '0.0000', '10.0000', 7, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(493, 89, 3, 6.5, 10, '0.0000', '10.0000', 7, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(494, 90, 3, 6.5, 10, '0.0000', '10.0000', 7, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(495, 91, 3, 27, 46, '0.0000', '10.0000', 4, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(496, 92, 3, 27, 46, '0.0000', '10.0000', 4, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(497, 93, 3, 27, 46, '0.0000', '10.0000', 4, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(498, 94, 3, 27, 46, '0.0000', '10.0000', 4, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(499, 95, 3, 27, 46, '0.0000', '10.0000', 4, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(500, 96, 3, 22, 46, '0.0000', '10.0000', 4, 0, 8, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(501, 97, 3, 22, 46, '0.0000', '10.0000', 4, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(502, 98, 3, 22, 46, '0.0000', '10.0000', 4, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(503, 99, 3, 22, 46, '0.0000', '10.0000', 4, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(504, 100, 3, 22, 54, '0.0000', '10.0000', 4, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(505, 101, 3, 22, 54, '0.0000', '10.0000', 4, 0, 15, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(506, 102, 3, 22, 46, '0.0000', '10.0000', 4, 0, 7, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(507, 103, 3, 6, 15, '0.0000', '10.0000', 1, 0, 14, 1, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(508, 104, 3, 6, 15, '0.0000', '10.0000', 1, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(509, 105, 3, 6, 15, '0.0000', '10.0000', 1, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(510, 106, 3, 6, 15, '0.0000', '10.0000', 1, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(511, 107, 3, 6, 15, '0.0000', '10.0000', 1, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(512, 108, 3, 6, 15, '0.0000', '10.0000', 1, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(513, 109, 3, 6, 15, '0.0000', '10.0000', 1, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(514, 110, 3, 6, 15, '0.0000', '10.0000', 1, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(515, 111, 3, 6, 15, '0.0000', '10.0000', 1, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-20', '2023-07-21', 1, 0),
(516, 112, 3, 10.5, 20.25, '0.0000', '10.0000', 1, 0, 13, 1, 2, 'inclusive', 'a:0:{}', '2024-07-27', '2023-07-28', 1, 0),
(517, 113, 3, 10.8, 20.25, '0.0000', '10.0000', 1, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-07-27', '2023-07-28', 1, 0),
(518, 114, 3, 10.8, 20.25, '0.0000', '10.0000', 1, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-07-27', '2023-07-28', 1, 0),
(532, 115, 1, 4, 14, '0.0000', '10.0000', 3, 0, 1, 1, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(533, 115, 2, 4, 14, '0.0000', '10.0000', 3, 0, 1, 1, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(534, 115, 3, 4, 14, '0.0000', '10.0000', 3, 0, 1, 1, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(535, 116, 1, 4, 14, '0.0000', '10.0000', 3, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(536, 116, 2, 4, 14, '0.0000', '10.0000', 3, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(537, 116, 3, 4, 14, '0.0000', '10.0000', 3, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(538, 117, 1, 4, 14, '0.0000', '10.0000', 3, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(539, 117, 2, 4, 14, '0.0000', '10.0000', 3, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(540, 117, 3, 4, 14, '0.0000', '10.0000', 3, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(541, 118, 1, 4, 14, '0.0000', '10.0000', 3, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(542, 118, 2, 4, 14, '0.0000', '10.0000', 3, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(543, 118, 3, 4, 14, '0.0000', '10.0000', 3, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(544, 119, 1, 4, 14, '0.0000', '10.0000', 3, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(545, 119, 2, 4, 14, '0.0000', '10.0000', 3, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(546, 119, 3, 4, 14, '0.0000', '10.0000', 3, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(547, 120, 1, 4, 14, '0.0000', '10.0000', 3, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(548, 120, 2, 4, 14, '0.0000', '10.0000', 3, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(549, 120, 3, 4, 14, '0.0000', '10.0000', 3, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(550, 121, 1, 4, 14, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(551, 121, 2, 4, 14, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(552, 121, 3, 4, 14, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(553, 122, 1, 3, 14, '0.0000', '10.0000', 3, 0, 8, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(554, 122, 2, 3, 14, '0.0000', '10.0000', 3, 0, 8, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(555, 122, 3, 3, 14, '0.0000', '10.0000', 3, 0, 8, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(556, 123, 1, 3, 14, '0.0000', '10.0000', 3, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(557, 123, 2, 3, 14, '0.0000', '10.0000', 3, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(558, 123, 3, 3, 14, '0.0000', '10.0000', 3, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(559, 124, 1, 3, 14, '0.0000', '10.0000', 3, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(560, 124, 2, 3, 14, '0.0000', '10.0000', 3, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(561, 124, 3, 3, 14, '0.0000', '10.0000', 3, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(562, 125, 1, 4, 12, '0.0000', '10.0000', 3, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(563, 125, 2, 4, 12, '0.0000', '10.0000', 3, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(564, 125, 3, 4, 12, '0.0000', '10.0000', 3, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(565, 126, 1, 4, 12, '0.0000', '10.0000', 3, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(566, 126, 2, 4, 12, '0.0000', '10.0000', 3, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(567, 126, 3, 4, 12, '0.0000', '10.0000', 3, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(568, 127, 1, 4, 12, '0.0000', '10.0000', 3, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(569, 127, 2, 4, 12, '0.0000', '10.0000', 3, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(570, 127, 3, 4, 12, '0.0000', '10.0000', 3, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(571, 128, 1, 4, 12, '0.0000', '10.0000', 3, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(572, 128, 2, 4, 12, '0.0000', '10.0000', 3, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(573, 128, 3, 4, 12, '0.0000', '10.0000', 3, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(574, 129, 1, 4, 12, '0.0000', '10.0000', 3, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(575, 129, 2, 4, 12, '0.0000', '10.0000', 3, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(576, 129, 3, 4, 12, '0.0000', '10.0000', 3, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(577, 130, 1, 4, 12, '0.0000', '10.0000', 3, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(578, 130, 2, 4, 12, '0.0000', '10.0000', 3, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(579, 130, 3, 4, 12, '0.0000', '10.0000', 3, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(580, 131, 1, 4, 12, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(581, 131, 2, 4, 12, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(582, 131, 3, 4, 12, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(583, 132, 1, 4, 12, '0.0000', '10.0000', 3, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(584, 132, 2, 4, 12, '0.0000', '10.0000', 3, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(585, 132, 3, 4, 12, '0.0000', '10.0000', 3, 0, 13, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(586, 133, 1, 4, 12, '0.0000', '10.0000', 3, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(587, 133, 2, 4, 12, '0.0000', '10.0000', 3, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(588, 133, 3, 4, 12, '0.0000', '10.0000', 3, 0, 14, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(589, 134, 1, 4, 12, '0.0000', '10.0000', 3, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(590, 134, 2, 4, 12, '0.0000', '10.0000', 3, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(591, 134, 3, 4, 12, '0.0000', '10.0000', 3, 0, 15, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(592, 135, 1, 4, 12, '0.0000', '10.0000', 3, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(593, 135, 2, 4, 12, '0.0000', '10.0000', 3, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(594, 135, 3, 4, 12, '0.0000', '10.0000', 3, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(595, 136, 1, 4, 13, '0.0000', '10.0000', 3, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(596, 136, 2, 4, 13, '0.0000', '10.0000', 3, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(597, 136, 3, 4, 13, '0.0000', '10.0000', 3, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(598, 137, 1, 4, 13, '0.0000', '10.0000', 3, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(599, 137, 2, 4, 13, '0.0000', '10.0000', 3, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(600, 137, 3, 4, 13, '0.0000', '10.0000', 3, 0, 3, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(601, 138, 1, 4, 13, '0.0000', '10.0000', 3, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(602, 138, 2, 4, 13, '0.0000', '10.0000', 3, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(603, 138, 3, 4, 13, '0.0000', '10.0000', 3, 0, 4, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(604, 139, 1, 4, 13, '0.0000', '10.0000', 3, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(605, 139, 2, 4, 13, '0.0000', '10.0000', 3, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(606, 139, 3, 4, 13, '0.0000', '10.0000', 3, 0, 5, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(607, 140, 1, 4, 13, '0.0000', '10.0000', 3, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(608, 140, 2, 4, 13, '0.0000', '10.0000', 3, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(609, 140, 3, 4, 13, '0.0000', '10.0000', 3, 0, 6, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(610, 141, 1, 4, 13, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(611, 141, 2, 4, 13, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(612, 141, 3, 4, 13, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(613, 142, 1, 4, 14, '0.0000', '10.0000', 3, 0, 8, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(614, 142, 2, 4, 14, '0.0000', '10.0000', 3, 0, 8, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(615, 142, 3, 4, 14, '0.0000', '10.0000', 3, 0, 8, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(616, 143, 1, 4, 14, '0.0000', '10.0000', 3, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(617, 143, 2, 4, 14, '0.0000', '10.0000', 3, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(618, 143, 3, 4, 14, '0.0000', '10.0000', 3, 0, 9, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(619, 144, 1, 4, 14, '0.0000', '10.0000', 3, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(620, 144, 2, 4, 14, '0.0000', '10.0000', 3, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(621, 144, 3, 4, 14, '0.0000', '10.0000', 3, 0, 10, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(622, 145, 1, 21, 37.7, '0.0000', '10.0000', 4, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(623, 145, 2, 21, 37.7, '0.0000', '10.0000', 4, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(624, 145, 3, 21, 37.7, '0.0000', '10.0000', 4, 0, 1, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(625, 146, 1, 21, 37.7, '0.0000', '10.0000', 4, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(626, 146, 2, 21, 37.7, '0.0000', '10.0000', 4, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(627, 146, 3, 21, 37.7, '0.0000', '10.0000', 4, 0, 2, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(628, 147, 1, 4, 14, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0);
INSERT INTO `product_to_store` (`id`, `product_id`, `store_id`, `purchase_price`, `sell_price`, `quantity_in_stock`, `alert_quantity`, `sup_id`, `brand_id`, `course_id`, `box_id`, `taxrate_id`, `tax_method`, `preference`, `e_date`, `p_date`, `status`, `sort_order`) VALUES
(629, 147, 2, 4, 14, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0),
(630, 147, 3, 4, 14, '0.0000', '10.0000', 3, 0, 7, 0, 2, 'inclusive', 'a:0:{}', '2024-08-06', '2023-08-07', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_info`
--

CREATE TABLE `purchase_info` (
  `info_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `inv_type` enum('purchase','transfer') NOT NULL DEFAULT 'purchase',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `sup_id` int(10) UNSIGNED DEFAULT NULL,
  `total_item` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` enum('stock','active','sold') NOT NULL DEFAULT 'stock',
  `total_sell` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `purchase_note` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `is_visible` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `payment_status` varchar(20) NOT NULL DEFAULT 'due',
  `checkout_status` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_status` enum('received','pending','ordered') NOT NULL DEFAULT 'received',
  `created_by` int(11) NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `purchase_info`
--

INSERT INTO `purchase_info` (`info_id`, `invoice_id`, `inv_type`, `store_id`, `sup_id`, `total_item`, `status`, `total_sell`, `purchase_note`, `attachment`, `is_visible`, `payment_status`, `checkout_status`, `shipping_status`, `created_by`, `purchase_date`, `created_at`, `updated_at`) VALUES
(1, 'CINVENTARIO DAS', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:27:13', NULL),
(2, 'CCINVENTARIO DAS', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:28:54', NULL),
(3, 'CHUVGH', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:32:05', NULL),
(4, 'CMATEMATICAS SEGUNDO', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:33:23', NULL),
(5, 'CDAS INGLES', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:36:18', NULL),
(6, 'CDAS LOGROS CIENCIAS', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:37:00', NULL),
(7, 'CDAS MANUAL PARA EMPRESAS', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:37:31', NULL),
(8, 'CDAS LOGROS LENGUAJE BASICA', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:38:06', NULL),
(9, 'CDAS INGLES 2', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:39:15', NULL),
(10, 'CDAS LOGROS LENGUAJE ', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:39:47', NULL),
(12, 'CLOGROS SOCIALES SEGUNDO', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:41:00', NULL),
(13, 'CLOGROS MATEMATICAS 4', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:45:16', NULL),
(14, 'CDAS INGLES ELLEVATE 2', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:46:16', NULL),
(15, 'CLOGROS CIENCIAS NATURALES 5', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:46:50', NULL),
(16, 'CGUCHITO 3-4 AÑOS', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:48:27', NULL),
(17, 'CLOGROS CIENCIAS 6', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:49:15', NULL),
(18, 'CLOGROS LENGUAJE 5', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:49:56', NULL),
(19, 'CLOGROS CIENCIAS 9', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:51:19', NULL),
(20, 'CMARAVILLAS DE LEER 2', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:51:54', NULL),
(21, 'CLOGROS FILOSOFIA 1', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:52:34', NULL),
(22, 'CEVERYDAY 1', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:54:12', NULL),
(24, 'CLOGROS ANTISTICA 1', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:55:57', NULL),
(26, 'CGUCHITO PREPARATORIA', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:57:10', NULL),
(27, 'CMARAVILLA DE LEER 6', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:57:34', NULL),
(28, 'CLOGROS CONTABILIAD 9', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:57:57', NULL),
(29, 'CLOGROS LENGUAJE 8', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:58:57', NULL),
(30, 'CMARAVILLA DE LEER 5', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 11:59:30', NULL),
(32, 'CLOGROS CIENCIAS 7', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:01:19', NULL),
(33, 'CBIOLOGIA 3', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:01:41', NULL),
(34, 'CEMPRENDIMIENTO 1', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:02:16', NULL),
(35, 'CMARAVILLA DE LEER 3', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:02:43', NULL),
(36, 'CLEARNING 4', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:03:15', NULL),
(37, 'CLENGUAJE 3BASICA', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:03:40', NULL),
(38, 'CELLEVATE FULL 6', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:04:11', NULL),
(39, 'CSOCIALES 5', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:04:36', NULL),
(40, 'CCIENCIAS NATURALES 2', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:05:05', NULL),
(41, 'CLENGUAJE 2BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:05:50', NULL),
(43, 'CSOCIALES 7', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:06:49', NULL),
(44, 'CPORTAFOLIO EXPERIMENTAL 9', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:08:17', NULL),
(45, 'CLOGROS MATEMATICAS 9', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:12:31', NULL),
(46, 'CLOGROS SOCIALES 6', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:12:50', NULL),
(47, 'CLOGROS BIOLOGIA 2', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:13:15', NULL),
(48, 'CLOGROS MATEMATICAS 8', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:14:08', NULL),
(49, 'CELLEVATE FULL 5', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:14:44', NULL),
(50, 'CLEARNING ZONE 5', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:15:11', NULL),
(51, 'CLOGROS CIENCIAS NATURALES 4', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:15:43', NULL),
(52, 'CLOGROS FILOSOFIA 2', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:16:42', NULL),
(53, 'CLOGROS MATEMATICAS 3', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:17:09', NULL),
(54, 'CLOGROS CIENCIAS 10', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:17:33', NULL),
(55, 'CCONTABILIDAD 8', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:18:19', NULL),
(56, 'CLOGROS LENGUAJE 4', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:18:46', NULL),
(57, 'CPORTAFOLIO EXPERIMENTAL 10', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:19:18', NULL),
(58, 'CPROBLEMAS DEL MUNDO CONTEPORANEO', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:20:06', NULL),
(59, 'CLOGROS LENGUAJE 9', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:20:30', NULL),
(60, 'CPORTAFOLIO EXPERIMENTAL 8', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:20:55', NULL),
(61, 'CLOGROS SOCIALES 8', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:21:22', NULL),
(62, 'CGUCHITO 4-5AÑOS', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:21:56', NULL),
(63, 'CLOGROS LENGUAJE 6', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:22:20', NULL),
(64, 'CLOGROS SOCIALES 9', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:22:46', NULL),
(65, 'CLOGROS SOCIALLES 10', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:23:07', NULL),
(66, 'CEVERYDAY 2', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:23:37', NULL),
(67, 'CECA 2BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:24:05', NULL),
(68, 'CLEARNING ZONE 3', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:24:38', NULL),
(69, 'CCONTABILIDAD 1BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:25:58', NULL),
(70, 'CCONTABILIDAD 10', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:26:19', NULL),
(71, 'CLOGROS EMPRENDIMIENTO 2', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:26:51', NULL),
(72, 'CLOGROS MATEMATICAS ', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:27:53', NULL),
(73, 'CLOGROS MATEMATICAS 10', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:28:45', NULL),
(74, 'CLOGROS CIENCIAS 8', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:29:59', NULL),
(75, 'CLOGROS MATEMATICAS 7', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:30:46', NULL),
(76, 'CLOGROS MATEMATICAS 5', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:31:23', NULL),
(77, 'CMARAVILLA DE LEER 7', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:31:57', NULL),
(78, 'CLOGROS SOCIALES 3', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:32:25', NULL),
(79, 'CMARAVILLA DE LEER 4', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:32:57', NULL),
(80, 'CLOGROS LENGUAJE 1BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:33:30', NULL),
(81, 'CLOGROS SOCIALES 4', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:33:55', NULL),
(82, 'CLEARNING ZONE 6', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:34:41', NULL),
(83, 'CELLEVATE TEEN 1', 'purchase', 2, 4, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 12:35:46', NULL),
(84, 'CMI TUTORIAL DIGITAL 2BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 13:33:00', NULL),
(85, 'CMI TUTORIAL DIGITAL 3BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 13:33:29', NULL),
(86, 'CMI TUTORIAL DIGITAL MATEMATICAS 8', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 13:53:14', NULL),
(87, 'CMI TUTORIAL DIGITAL MATEMATICAS 2BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 13:54:47', NULL),
(88, 'CMI TUTORIAL DIGITAL MATEMATICAS 3BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 13:55:52', NULL),
(89, 'CMI TUTORIAL DIGITAL FISICA 3BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 13:56:54', NULL),
(90, 'CMI TUTORIAL DIGITAL FISICA 2BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 13:57:23', NULL),
(91, 'CREFUERZO ESCOLAR 2', 'purchase', 2, 7, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 14:01:34', NULL),
(92, 'CREFUERZO ESCOLAR 3', 'purchase', 2, 7, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 14:02:00', NULL),
(93, 'CREFUERZO ESCOLAR 5', 'purchase', 2, 7, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 14:04:00', NULL),
(94, 'CREFUERZO ESCOLAR 6', 'purchase', 2, 7, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 14:04:36', NULL),
(95, 'CREFUERZO ESCOLAR 4', 'purchase', 2, 7, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 14:04:58', NULL),
(96, 'CREFUERZO ESCOLAR 7', 'purchase', 2, 7, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-01 00:00:00', '2023-08-01 14:05:26', NULL),
(97, 'CBGU QUIMICA ORGANICA ', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-02 00:00:00', '2023-08-02 10:22:00', NULL),
(98, 'C3BGU CERIT', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-02 00:00:00', '2023-08-02 10:23:05', NULL),
(99, 'C2BGU CERIT', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-02 00:00:00', '2023-08-02 10:23:54', NULL),
(100, 'CMI TUTORIAL DIGITAL 9', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-02 00:00:00', '2023-08-02 11:49:52', NULL),
(101, 'CLOGROS CIENCIAS NATURALES 6', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-02 00:00:00', '2023-08-02 12:03:10', NULL),
(102, 'CLOGROS CIENCIAS NATURALES 4.', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-02 00:00:00', '2023-08-02 12:06:29', NULL),
(103, 'CHISTORIA 3BGU', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-05 00:00:00', '2023-08-05 12:16:20', NULL),
(104, 'CLOGROS HISTORIA 2', 'purchase', 2, 1, '1.0000', 'stock', '0.0000', '', '', 1, 'paid', 1, 'received', 6, '2023-08-05 00:00:00', '2023-08-05 14:19:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `item_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_purchase_price` decimal(25,4) NOT NULL,
  `item_selling_price` decimal(25,4) NOT NULL,
  `item_quantity` decimal(25,4) NOT NULL,
  `total_sell` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` enum('stock','active','sold') NOT NULL DEFAULT 'stock',
  `item_total` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('exclusive','inclusive') DEFAULT 'exclusive',
  `tax` varchar(20) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `return_quantity` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `purchase_item`
--

INSERT INTO `purchase_item` (`id`, `invoice_id`, `store_id`, `item_id`, `category_id`, `brand_id`, `item_name`, `item_purchase_price`, `item_selling_price`, `item_quantity`, `total_sell`, `status`, `item_total`, `item_tax`, `tax_method`, `tax`, `gst`, `cgst`, `sgst`, `igst`, `return_quantity`) VALUES
(1, 'CINVENTARIO DAS', 2, 54, 1, 1, 'LOGROS LENGUA Y LITERATURA 3 BACH + PLATAFORMA', '10.8000', '27.0000', '28.0000', '1.0000', 'active', '302.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(2, 'CCINVENTARIO DAS', 2, 55, 1, 1, 'LOGROS BIOLOGÍA 1+ PLATAFORMA', '10.8000', '27.0000', '26.0000', '0.0000', 'active', '280.8000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(3, 'CHUVGH', 2, 9, 1, 1, 'LOGROS LENGUA Y LITERATURA 7 + PLATAFORMA', '10.8000', '27.0000', '20.0000', '3.0000', 'active', '216.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(4, 'CMATEMATICAS SEGUNDO', 2, 10, 1, 1, 'LOGROS MATEMÁTICAS 2 + PLATAFORMA', '10.8000', '27.0000', '20.0000', '2.0000', 'active', '216.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(5, 'CDAS INGLES', 2, 91, 1, 0, 'LEARNING ZONE SB + ONLINE 1', '27.0000', '46.0000', '15.0000', '2.0000', 'active', '405.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(6, 'CDAS LOGROS CIENCIAS', 2, 23, 1, 1, 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', '10.8000', '27.0000', '25.0000', '8.0000', 'active', '270.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(7, 'CDAS MANUAL PARA EMPRESAS', 2, 75, 1, 1, 'MANUAL DE FINANCIAMIENTO PARA EMPRESAS ( PARA CONTABILIDAD BANCARIA, DE COSTOS Y GENERAL DE BACHILLE', '10.0000', '25.0000', '31.0000', '0.0000', 'active', '310.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(8, 'CDAS LOGROS LENGUAJE BASICA', 2, 4, 1, 1, 'LOGROS LENGUA Y LITERATURA 2 + PLATAFORMA', '10.8000', '27.0000', '22.0000', '2.0000', 'active', '237.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(9, 'CDAS INGLES 2', 2, 92, 1, 0, 'LEARNING ZONE SB + ONLINE 2', '27.0000', '46.0000', '15.0000', '8.0000', 'active', '405.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(10, 'CDAS LOGROS LENGUAJE ', 2, 18, 1, 1, 'LOGROS LENGUA Y LITERATURA 10 + PLATAFORMA', '10.8000', '27.0000', '6.0000', '0.0000', 'active', '64.8000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(12, 'CLOGROS SOCIALES SEGUNDO', 2, 31, 1, 1, 'LOGROS ESTUDIOS SOCIALES 2 + PLATAFORMA', '10.8000', '27.0000', '25.0000', '2.0000', 'active', '270.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(13, 'CLOGROS MATEMATICAS 4', 2, 12, 1, 1, 'LOGROS MATEMÁTICAS 4 + PLATAFORMA', '10.8000', '27.0000', '25.0000', '3.0000', 'active', '270.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(14, 'CDAS INGLES ELLEVATE 2', 2, 97, 1, 0, 'ELLEVATE ENGLISH TEEN  SB FULL 2', '22.0000', '46.0000', '8.0000', '3.0000', 'active', '176.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(15, 'CLOGROS CIENCIAS NATURALES 5', 2, 25, 1, 1, 'LOGROS CIENCIAS NATURALES 5 + PLATAFORMA', '10.8000', '27.0000', '24.0000', '3.0000', 'active', '259.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(16, 'CGUCHITO 3-4 AÑOS', 2, 1, 1, 1, 'KIT EXPLORA Y APRENDE CON GUCHITO 3 - 4 AÑOS + PLATAFORMA', '20.0000', '40.0000', '19.0000', '0.0000', 'active', '380.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(17, 'CLOGROS CIENCIAS 6', 2, 26, 1, 1, 'LOGROS CIENCIAS NATURALES 6 + PLATAFORMA', '10.8000', '27.0000', '1.0000', '1.0000', 'sold', '10.8000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(18, 'CLOGROS LENGUAJE 5', 2, 7, 1, 1, 'LOGROS LENGUA Y LITERATURA 5 + PLATAFORMA', '10.8000', '27.0000', '28.0000', '3.0000', 'active', '302.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(19, 'CLOGROS CIENCIAS 9', 2, 29, 1, 1, 'LOGROS CIENCIAS NATURALES 9 + PLATAFORMA', '10.8000', '27.0000', '30.0000', '3.0000', 'active', '324.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(20, 'CMARAVILLAS DE LEER 2', 2, 43, 1, 1, 'LOGROS LA MARAVILLA DE LEER 2 + PLATAFORMA', '5.6000', '14.0000', '21.0000', '0.0000', 'active', '117.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(21, 'CLOGROS FILOSOFIA 1', 2, 68, 1, 1, 'LOGROS FILOSOFÍA 1 + PLATAFORMA', '10.8000', '27.0000', '4.0000', '0.0000', 'active', '43.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(22, 'CEVERYDAY 1', 2, 83, 1, 0, 'EVERYDAY ENGLISH 1', '21.0000', '45.0000', '15.0000', '2.0000', 'active', '315.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(24, 'CLOGROS ANTISTICA 1', 2, 70, 1, 1, 'LOGROS EDUCACIÓN CULTURAL Y ARTÍSTICA 1 + PLATAFORMA', '25.0000', '25.0000', '3.0000', '0.0000', 'active', '75.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(26, 'CGUCHITO PREPARATORIA', 2, 3, 1, 1, 'KIT CREA Y APRENDE CON GUCHITO (PRIMERO DE BÁSICA)+ PLATAFORMA', '20.0000', '40.0000', '28.0000', '3.0000', 'active', '560.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(27, 'CMARAVILLA DE LEER 6', 2, 47, 1, 1, 'LOGROS LA MARAVILLA DE LEER 6 + PLATAFORMA', '5.6000', '14.0000', '22.0000', '0.0000', 'active', '123.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(28, 'CLOGROS CONTABILIAD 9', 2, 41, 1, 1, 'CONTABILIDAD 9 + PLATAFORMA', '10.0000', '25.0000', '8.0000', '0.0000', 'active', '80.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(29, 'CLOGROS LENGUAJE 8', 2, 16, 1, 1, 'LOGROS LENGUA Y LITERATURA 8 + PLATAFORMA', '10.8000', '27.0000', '22.0000', '0.0000', 'active', '237.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(30, 'CMARAVILLA DE LEER 5', 2, 46, 1, 1, 'LOGROS LA MARAVILLA DE LEER 5 + PLATAFORMA', '5.6000', '14.0000', '22.0000', '0.0000', 'active', '123.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(32, 'CLOGROS CIENCIAS 7', 2, 27, 1, 1, 'LOGROS CIENCIAS NATURALES 7 + PLATAFORMA', '10.8000', '27.0000', '18.0000', '3.0000', 'active', '194.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(33, 'CBIOLOGIA 3', 2, 57, 1, 1, 'LOGROS BIOLOGÍA 3 + PLATAFORMA', '10.8000', '27.0000', '24.0000', '1.0000', 'active', '259.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(34, 'CEMPRENDIMIENTO 1', 2, 66, 1, 1, 'LOGROS EMPRENDIMIENTO 1 + PLATAFORMA', '10.8000', '27.0000', '5.0000', '0.0000', 'active', '54.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(35, 'CMARAVILLA DE LEER 3', 2, 44, 1, 1, 'LOGROS LA MARAVILLA DE LEER 3 + PLATAFORMA', '5.6000', '14.0000', '29.0000', '0.0000', 'active', '162.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(36, 'CLEARNING 4', 2, 94, 1, 0, 'LEARNING ZONE SB + ONLINE 4', '27.0000', '46.0000', '10.0000', '3.0000', 'active', '270.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(37, 'CLENGUAJE 3BASICA', 2, 5, 1, 1, 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', '10.8000', '27.0000', '23.0000', '8.0000', 'active', '248.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(38, 'CELLEVATE FULL 6', 2, 101, 1, 0, 'ELLEVATE ENGLISH TEEN  SB FULL 6', '22.0000', '46.0000', '3.0000', '1.0000', 'active', '66.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(39, 'CSOCIALES 5', 2, 34, 1, 1, 'LOGROS ESTUDIOS SOCIALES 5 + PLATAFORMA', '10.8000', '27.0000', '27.0000', '3.0000', 'active', '291.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(40, 'CCIENCIAS NATURALES 2', 2, 22, 1, 1, 'LOGROS CIENCIAS NATURALES 2 + PLATAFORMA', '10.8000', '27.0000', '23.0000', '2.0000', 'active', '248.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(41, 'CLENGUAJE 2BGU', 2, 53, 1, 1, 'LOGROS LENGUA Y LITERATURA 2 BACH + PLATAFORMA', '10.8000', '27.0000', '29.0000', '2.0000', 'active', '313.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(43, 'CSOCIALES 7', 2, 36, 1, 1, 'LOGROS ESTUDIOS SOCIALES 7 + PLATAFORMA', '10.8000', '27.0000', '28.0000', '3.0000', 'active', '302.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(44, 'CPORTAFOLIO EXPERIMENTAL 9', 2, 50, 1, 1, 'PORTAFOLIO EXPERIMENTAL DE CIENCIAS NATURALES 9+ PLATAFORMA', '5.6000', '14.0000', '23.0000', '0.0000', 'active', '128.8000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(45, 'CLOGROS MATEMATICAS 9', 2, 20, 1, 1, 'LOGROS MATEMÁTICAS 9 + PLATAFORMA', '10.8000', '27.0000', '28.0000', '0.0000', 'active', '302.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(46, 'CLOGROS SOCIALES 6', 2, 35, 1, 1, 'LOGROS ESTUDIOS SOCIALES 6 + PLATAFORMA', '10.8000', '27.0000', '32.0000', '4.0000', 'active', '345.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(47, 'CLOGROS BIOLOGIA 2', 2, 56, 1, 1, 'LOGROS BIOLOGÍA 2 + PLATAFORMA', '10.8000', '27.0000', '25.0000', '2.0000', 'active', '270.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(48, 'CLOGROS MATEMATICAS 8', 2, 19, 1, 1, 'LOGROS MATEMÁTICAS 8 + PLATAFORMA', '10.8000', '27.0000', '28.0000', '0.0000', 'active', '302.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(49, 'CELLEVATE FULL 5', 2, 100, 1, 0, 'ELLEVATE ENGLISH TEEN  SB FULL 5', '22.0000', '46.0000', '8.0000', '2.0000', 'active', '176.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(50, 'CLEARNING ZONE 5', 2, 95, 1, 0, 'LEARNING ZONE SB + ONLINE 5', '27.0000', '46.0000', '10.0000', '4.0000', 'active', '270.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(51, 'CLOGROS CIENCIAS NATURALES 4', 2, 24, 1, 1, 'LOGROS CIENCIAS NATURALES 4 + PLATAFORMA', '10.8000', '27.0000', '2.0000', '2.0000', 'sold', '21.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(52, 'CLOGROS FILOSOFIA 2', 2, 69, 1, 1, 'LOGROS FILOSOFÍA 2 + PLATAFORMA', '10.8000', '27.0000', '32.0000', '0.0000', 'active', '345.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(53, 'CLOGROS MATEMATICAS 3', 2, 11, 1, 1, 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', '10.8000', '27.0000', '22.0000', '8.0000', 'active', '237.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(54, 'CLOGROS CIENCIAS 10', 2, 30, 1, 1, 'LOGROS CIENCIAS NATURALES 10 + PLATAFORMA', '10.8000', '27.0000', '30.0000', '0.0000', 'active', '324.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(55, 'CCONTABILIDAD 8', 2, 40, 1, 1, 'CONTABILIDAD 8 + PLATAFORMA', '10.0000', '25.0000', '32.0000', '0.0000', 'active', '320.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(56, 'CLOGROS LENGUAJE 4', 2, 6, 1, 1, 'LOGROS LENGUA Y LITERATURA 4 + PLATAFORMA', '10.8000', '27.0000', '22.0000', '3.0000', 'active', '237.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(57, 'CPORTAFOLIO EXPERIMENTAL 10', 2, 51, 1, 1, 'PORTAFOLIO EXPERIMENTAL DE CIENCIAS NATURALES 10 + PLATAFORMA', '5.6000', '14.0000', '22.0000', '0.0000', 'active', '123.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(58, 'CPROBLEMAS DEL MUNDO CONTEPORANEO', 2, 72, 1, 1, 'LOGROS PROBLEMAS DEL MUNDO CONTEMPORÁNEO + PLATAFORMA', '10.0000', '25.0000', '25.0000', '0.0000', 'active', '250.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(59, 'CLOGROS LENGUAJE 9', 2, 17, 1, 1, 'LOGROS LENGUA Y LITERATURA 9 + PLATAFORMA', '10.8000', '27.0000', '27.0000', '3.0000', 'active', '291.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(60, 'CPORTAFOLIO EXPERIMENTAL 8', 2, 49, 1, 1, 'PORTAFOLIO EXPERIMENTAL DE CIENCIAS NATURALES 8 + PLATAFORMA', '5.6000', '14.0000', '22.0000', '0.0000', 'active', '123.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(61, 'CLOGROS SOCIALES 8', 2, 37, 1, 1, 'LOGROS ESTUDIOS SOCIALES 8 + PLATAFORMA', '10.8000', '27.0000', '30.0000', '0.0000', 'active', '324.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(62, 'CGUCHITO 4-5AÑOS', 2, 2, 1, 1, 'KIT DESCUBRE Y APRENDE CON GUCHITO 4 - 5 AÑOS + PLATAFORMA', '20.0000', '40.0000', '32.0000', '2.0000', 'active', '640.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(63, 'CLOGROS LENGUAJE 6', 2, 8, 1, 1, 'LOGROS LENGUA Y LITERATURA 6 + PLATAFORMA', '10.8000', '27.0000', '28.0000', '4.0000', 'active', '302.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(64, 'CLOGROS SOCIALES 9', 2, 38, 1, 1, 'LOGROS ESTUDIOS SOCIALES 9 + PLATAFORMA', '10.8000', '27.0000', '29.0000', '3.0000', 'active', '313.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(65, 'CLOGROS SOCIALLES 10', 2, 39, 1, 1, 'LOGROS ESTUDIOS SOCIALES 10 + PLATAFORMA', '10.8000', '27.0000', '29.0000', '0.0000', 'active', '313.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(66, 'CEVERYDAY 2', 2, 84, 1, 0, 'EVERYDAY INGLISH 2', '21.0000', '45.0000', '5.0000', '3.0000', 'active', '105.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(67, 'CECA 2BGU', 2, 71, 1, 1, 'LOGROS EDUCACIÓN CULTURAL Y ARTÍSTICA  2 BGU + PLATAFORMA', '25.0000', '25.0000', '28.0000', '0.0000', 'active', '700.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(68, 'CLEARNING ZONE 3', 2, 93, 1, 0, 'LEARNING ZONE SB + ONLINE 3', '27.0000', '46.0000', '9.0000', '3.0000', 'active', '243.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(69, 'CCONTABILIDAD 1BGU', 2, 74, 1, 1, 'CONTABILIDAD 1 BACH + PLATAFORMA', '10.0000', '25.0000', '36.0000', '0.0000', 'active', '360.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(70, 'CCONTABILIDAD 10', 2, 42, 1, 1, 'CONTABILIDAD 10 + PLATAFORMA', '10.0000', '25.0000', '33.0000', '0.0000', 'active', '330.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(71, 'CLOGROS EMPRENDIMIENTO 2', 2, 67, 1, 1, 'LOGROS EMPRENDIMIENTO 2 + PLATAFORMA', '10.8000', '27.0000', '22.0000', '0.0000', 'active', '237.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(72, 'CLOGROS MATEMATICAS ', 2, 14, 1, 1, 'LOGROS MATEMÁTICAS 6 + PLATAFORMA', '10.8000', '27.0000', '27.0000', '4.0000', 'active', '291.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(73, 'CLOGROS MATEMATICAS 10', 2, 21, 1, 1, 'LOGROS MATEMÁTICAS 10 + PLATAFORMA', '10.8000', '27.0000', '29.0000', '0.0000', 'active', '313.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(74, 'CLOGROS CIENCIAS 8', 2, 28, 1, 1, 'LOGROS CIENCIAS NATURALES 8 + PLATAFORMA', '10.8000', '27.0000', '31.0000', '0.0000', 'active', '334.8000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(75, 'CLOGROS MATEMATICAS 7', 2, 15, 1, 1, 'LOGROS MATEMÁTICAS 7 + PLATAFORMA', '10.8000', '27.0000', '24.0000', '3.0000', 'active', '259.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(76, 'CLOGROS MATEMATICAS 5', 2, 13, 1, 1, 'LOGROS MATEMÁTICAS 5 + PLATAFORMA', '10.8000', '27.0000', '27.0000', '3.0000', 'active', '291.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(77, 'CMARAVILLA DE LEER 7', 2, 48, 1, 1, 'LOGROS LA MARAVILLA DE LEER 7 + PLATAFORMA', '5.6000', '14.0000', '23.0000', '0.0000', 'active', '128.8000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(78, 'CLOGROS SOCIALES 3', 2, 32, 1, 1, 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', '10.8000', '27.0000', '26.0000', '8.0000', 'active', '280.8000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(79, 'CMARAVILLA DE LEER 4', 2, 45, 1, 1, 'LOGROS LA MARAVILLA DE LEER 4 + PLATAFORMA', '5.6000', '14.0000', '29.0000', '0.0000', 'active', '162.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(80, 'CLOGROS LENGUAJE 1BGU', 2, 52, 1, 1, 'LOGROS LENGUA Y LITERATURA 1 BACH + PLATAFORMA', '10.8000', '27.0000', '9.0000', '0.0000', 'active', '97.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(81, 'CLOGROS SOCIALES 4', 2, 33, 1, 1, 'LOGROS ESTUDIOS SOCIALES 4 + PLATAFORMA', '10.8000', '27.0000', '25.0000', '3.0000', 'active', '270.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(82, 'CLEARNING ZONE 6', 2, 102, 1, 0, 'LEARNING ZONE SB + ONLINE 6', '22.0000', '46.0000', '10.0000', '3.0000', 'active', '220.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(83, 'CELLEVATE TEEN 1', 2, 96, 1, 0, 'ELLEVATE ENGLISH TEEN  SB FULL 1', '22.0000', '46.0000', '6.0000', '0.0000', 'active', '132.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(84, 'CMI TUTORIAL DIGITAL 2BGU', 2, 111, 2, 0, 'MI TUTORIAL DIGITAL QUIMICA 2BGU', '6.0000', '15.0000', '20.0000', '2.0000', 'active', '120.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(85, 'CMI TUTORIAL DIGITAL 3BGU', 2, 78, 1, 1, 'MI TUTORIAL DIGITAL QUIMICA 3BGU', '6.0000', '15.0000', '20.0000', '1.0000', 'active', '120.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(86, 'CMI TUTORIAL DIGITAL MATEMATICAS 8', 2, 77, 1, 1, 'MI TUTORIAL DIGITAL MATEMATICAS 8', '6.0000', '15.0000', '7.0000', '0.0000', 'active', '42.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(87, 'CMI TUTORIAL DIGITAL MATEMATICAS 2BGU', 2, 108, 2, 0, 'MI TUTORIAL DIGITAL MATEMATICAS 2 BGU', '6.0000', '15.0000', '7.0000', '2.0000', 'active', '42.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(88, 'CMI TUTORIAL DIGITAL MATEMATICAS 3BGU', 2, 109, 2, 0, 'MI TUTORIAL DIGITAL MATEMATICAS 3 BGU', '6.0000', '15.0000', '7.0000', '1.0000', 'active', '42.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(89, 'CMI TUTORIAL DIGITAL FISICA 3BGU', 2, 104, 2, 0, 'MI TUTORIAL DIGITAL FISICA 3 BGU', '6.0000', '15.0000', '30.0000', '1.0000', 'active', '180.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(90, 'CMI TUTORIAL DIGITAL FISICA 2BGU', 2, 103, 2, 0, 'MI TUTORIAL DIGITAL FISICA 2 BGU', '6.0000', '15.0000', '28.0000', '2.0000', 'active', '168.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(91, 'CREFUERZO ESCOLAR 2', 2, 85, 1, 0, 'REFUERZO ESCOLAR 2', '6.5000', '10.0000', '10.0000', '2.0000', 'active', '65.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(92, 'CREFUERZO ESCOLAR 3', 2, 86, 1, 0, 'REFUERZO ESCOLAR 3', '6.5000', '10.0000', '10.0000', '8.0000', 'active', '65.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(93, 'CREFUERZO ESCOLAR 5', 2, 88, 1, 0, 'REFUERZO ESCOLAR 5', '6.5000', '10.0000', '10.0000', '3.0000', 'active', '65.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(94, 'CREFUERZO ESCOLAR 6', 2, 89, 1, 0, 'REFUERZO ESCOLAR 6', '6.5000', '10.0000', '10.0000', '4.0000', 'active', '65.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(95, 'CREFUERZO ESCOLAR 4', 2, 87, 1, 0, 'REFUERZO ESCOLAR 4', '6.5000', '10.0000', '10.0000', '3.0000', 'active', '65.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(96, 'CREFUERZO ESCOLAR 7', 2, 90, 1, 0, 'REFUERZO ESCOLAR 7', '6.5000', '10.0000', '10.0000', '3.0000', 'active', '65.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(97, 'CBGU QUIMICA ORGANICA ', 2, 112, 2, 0, 'QUIMICA 1 BGU CERIT ', '10.5000', '20.2500', '24.0000', '24.0000', 'sold', '252.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(98, 'C3BGU CERIT', 2, 114, 2, 0, 'QUIMICA 3 BGU CERIT ', '10.8000', '20.2500', '18.0000', '18.0000', 'sold', '194.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(99, 'C2BGU CERIT', 2, 113, 2, 0, 'QUIMICA 2 BGU CERIT', '10.8000', '20.2500', '28.0000', '28.0000', 'sold', '302.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(100, 'CMI TUTORIAL DIGITAL 9', 2, 105, 2, 0, 'MI TUTORIAL DIGITAL MATEMATICAS 9', '6.0000', '15.0000', '7.0000', '3.0000', 'active', '42.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(101, 'CLOGROS CIENCIAS NATURALES 6', 2, 26, 1, 1, 'LOGROS CIENCIAS NATURALES 6 + PLATAFORMA', '10.8000', '27.0000', '12.0000', '3.0000', 'active', '129.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(102, 'CLOGROS CIENCIAS NATURALES 4.', 2, 24, 1, 1, 'LOGROS CIENCIAS NATURALES 4 + PLATAFORMA', '10.8000', '27.0000', '12.0000', '1.0000', 'active', '129.6000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(103, 'CHISTORIA 3BGU', 2, 60, 1, 1, 'LOGROS HISTORIA 3 + PLATAFORMA', '10.8000', '27.0000', '19.0000', '1.0000', 'active', '205.2000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(104, 'CLOGROS HISTORIA 2', 2, 59, 1, 1, 'LOGROS HISTORIA 2 + PLATAFORMA', '10.8000', '27.0000', '28.0000', '2.0000', 'active', '302.4000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_logs`
--

CREATE TABLE `purchase_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(55) DEFAULT NULL,
  `ref_invoice_id` varchar(55) DEFAULT NULL,
  `type` varchar(55) NOT NULL,
  `pmethod_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `store_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `purchase_logs`
--

INSERT INTO `purchase_logs` (`id`, `sup_id`, `reference_no`, `ref_invoice_id`, `type`, `pmethod_id`, `description`, `amount`, `store_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'CT230801200001', 'CINVENTARIO DAS', 'purchase', 1, 'Paid while purchasing', '302.4000', 2, 6, '2023-08-01 11:27:13', NULL),
(2, 1, 'CT2308012002', 'CCINVENTARIO DAS', 'purchase', 1, 'Paid while purchasing', '280.8000', 2, 6, '2023-08-01 11:28:54', NULL),
(3, 1, 'CT23080122003', 'CHUVGH', 'purchase', 1, 'Paid while purchasing', '216.0000', 2, 6, '2023-08-01 11:32:05', NULL),
(4, 1, 'CT23080122004', 'CMATEMATICAS SEGUNDO', 'purchase', 1, 'Paid while purchasing', '216.0000', 2, 6, '2023-08-01 11:33:23', NULL),
(5, 4, 'CT23080122005', 'CDAS INGLES', 'purchase', 1, 'Paid while purchasing', '405.0000', 2, 6, '2023-08-01 11:36:18', NULL),
(6, 1, 'CT23080122006', 'CDAS LOGROS CIENCIAS', 'purchase', 1, 'Paid while purchasing', '270.0000', 2, 6, '2023-08-01 11:37:00', NULL),
(7, 1, 'CT23080122007', 'CDAS MANUAL PARA EMPRESAS', 'purchase', 1, 'Paid while purchasing', '310.0000', 2, 6, '2023-08-01 11:37:31', NULL),
(8, 1, 'CT23080122008', 'CDAS LOGROS LENGUAJE BASICA', 'purchase', 1, 'Paid while purchasing', '237.6000', 2, 6, '2023-08-01 11:38:06', NULL),
(9, 4, 'CT23080122009', 'CDAS INGLES 2', 'purchase', 1, 'Paid while purchasing', '405.0000', 2, 6, '2023-08-01 11:39:15', NULL),
(10, 1, 'CT23080122010', 'CDAS LOGROS LENGUAJE ', 'purchase', 1, 'Paid while purchasing', '64.8000', 2, 6, '2023-08-01 11:39:47', NULL),
(11, 1, 'CT23080122011', 'CDAS TUTORIAL MATEMATICAS', 'purchase', 1, 'Paid while purchasing', '174.0000', 2, 6, '2023-08-01 11:40:27', NULL),
(12, 1, 'CT23080122012', 'CLOGROS SOCIALES SEGUNDO', 'purchase', 1, 'Paid while purchasing', '270.0000', 2, 6, '2023-08-01 11:41:00', NULL),
(13, 1, 'CT23080122013', 'CLOGROS MATEMATICAS 4', 'purchase', 1, 'Paid while purchasing', '270.0000', 2, 6, '2023-08-01 11:45:16', NULL),
(14, 4, 'CT23080122014', 'CDAS INGLES ELLEVATE 2', 'purchase', 1, 'Paid while purchasing', '176.0000', 2, 6, '2023-08-01 11:46:16', NULL),
(15, 1, 'CT23080122015', 'CLOGROS CIENCIAS NATURALES 5', 'purchase', 1, 'Paid while purchasing', '259.2000', 2, 6, '2023-08-01 11:46:50', NULL),
(16, 1, 'CT23080122016', 'CGUCHITO 3-4 AÑOS', 'purchase', 1, 'Paid while purchasing', '380.0000', 2, 6, '2023-08-01 11:48:27', NULL),
(17, 1, 'CT23080122017', 'CLOGROS CIENCIAS 6', 'purchase', 1, 'Paid while purchasing', '10.8000', 2, 6, '2023-08-01 11:49:15', NULL),
(18, 1, 'CT23080122018', 'CLOGROS LENGUAJE 5', 'purchase', 1, 'Paid while purchasing', '302.4000', 2, 6, '2023-08-01 11:49:56', NULL),
(19, 1, 'CT23080122019', 'CLOGROS CIENCIAS 9', 'purchase', 1, 'Paid while purchasing', '324.0000', 2, 6, '2023-08-01 11:51:19', NULL),
(20, 1, 'CT23080122020', 'CMARAVILLAS DE LEER 2', 'purchase', 1, 'Paid while purchasing', '117.6000', 2, 6, '2023-08-01 11:51:54', NULL),
(21, 1, 'CT23080122021', 'CLOGROS FILOSOFIA 1', 'purchase', 1, 'Paid while purchasing', '43.2000', 2, 6, '2023-08-01 11:52:34', NULL),
(22, 4, 'CT23080122022', 'CEVERYDAY 1', 'purchase', 1, 'Paid while purchasing', '315.0000', 2, 6, '2023-08-01 11:54:12', NULL),
(23, 1, 'CT23080122023', 'CLOGROS QUIMICA 3', 'purchase', 1, 'Paid while purchasing', '313.2000', 2, 6, '2023-08-01 11:55:24', NULL),
(24, 1, 'CT23080122024', 'CLOGROS ANTISTICA 1', 'purchase', 1, 'Paid while purchasing', '75.0000', 2, 6, '2023-08-01 11:55:57', NULL),
(25, 1, 'CT23080122025', 'CLOGROS QUIMICA 1', 'purchase', 1, 'Paid while purchasing', '294.0000', 2, 6, '2023-08-01 11:56:23', NULL),
(26, 1, 'CT23080122026', 'CGUCHITO PREPARATORIA', 'purchase', 1, 'Paid while purchasing', '560.0000', 2, 6, '2023-08-01 11:57:10', NULL),
(27, 1, 'CT23080122027', 'CMARAVILLA DE LEER 6', 'purchase', 1, 'Paid while purchasing', '123.2000', 2, 6, '2023-08-01 11:57:34', NULL),
(28, 1, 'CT23080122028', 'CLOGROS CONTABILIAD 9', 'purchase', 1, 'Paid while purchasing', '80.0000', 2, 6, '2023-08-01 11:57:57', NULL),
(29, 1, 'CT23080122029', 'CLOGROS LENGUAJE 8', 'purchase', 1, 'Paid while purchasing', '237.6000', 2, 6, '2023-08-01 11:58:57', NULL),
(30, 1, 'CT23080122030', 'CMARAVILLA DE LEER 5', 'purchase', 1, 'Paid while purchasing', '123.2000', 2, 6, '2023-08-01 11:59:30', NULL),
(31, 1, 'CT23080122031', 'CLOGROS QUIMICA 3BGU', 'purchase', 1, 'Paid while purchasing', '313.2000', 2, 6, '2023-08-01 12:00:30', NULL),
(32, 1, 'CT23080122032', 'CLOGROS CIENCIAS 7', 'purchase', 1, 'Paid while purchasing', '194.4000', 2, 6, '2023-08-01 12:01:19', NULL),
(33, 1, 'CT23080122033', 'CBIOLOGIA 3', 'purchase', 1, 'Paid while purchasing', '259.2000', 2, 6, '2023-08-01 12:01:41', NULL),
(34, 1, 'CT23080122034', 'CEMPRENDIMIENTO 1', 'purchase', 1, 'Paid while purchasing', '54.0000', 2, 6, '2023-08-01 12:02:16', NULL),
(35, 1, 'CT23080122035', 'CMARAVILLA DE LEER 3', 'purchase', 1, 'Paid while purchasing', '162.4000', 2, 6, '2023-08-01 12:02:43', NULL),
(36, 4, 'CT23080122036', 'CLEARNING 4', 'purchase', 1, 'Paid while purchasing', '270.0000', 2, 6, '2023-08-01 12:03:15', NULL),
(37, 1, 'CT23080122037', 'CLENGUAJE 3BASICA', 'purchase', 1, 'Paid while purchasing', '248.4000', 2, 6, '2023-08-01 12:03:40', NULL),
(38, 4, 'CT23080122038', 'CELLEVATE FULL 6', 'purchase', 1, 'Paid while purchasing', '66.0000', 2, 6, '2023-08-01 12:04:11', NULL),
(39, 1, 'CT23080122039', 'CSOCIALES 5', 'purchase', 1, 'Paid while purchasing', '291.6000', 2, 6, '2023-08-01 12:04:36', NULL),
(40, 1, 'CT23080122040', 'CCIENCIAS NATURALES 2', 'purchase', 1, 'Paid while purchasing', '248.4000', 2, 6, '2023-08-01 12:05:05', NULL),
(41, 1, 'CT23080122041', 'CLENGUAJE 2BGU', 'purchase', 1, 'Paid while purchasing', '313.2000', 2, 6, '2023-08-01 12:05:50', NULL),
(42, 1, 'CT23080122042', 'CQUIMICA 2BGU', 'purchase', 1, 'Paid while purchasing', '313.2000', 2, 6, '2023-08-01 12:06:30', NULL),
(43, 1, 'CT23080122043', 'CSOCIALES 7', 'purchase', 1, 'Paid while purchasing', '302.4000', 2, 6, '2023-08-01 12:06:49', NULL),
(44, 1, 'CT23080122044', 'CPORTAFOLIO EXPERIMENTAL 9', 'purchase', 1, 'Paid while purchasing', '128.8000', 2, 6, '2023-08-01 12:08:17', NULL),
(45, 1, 'CT23080122045', 'CLOGROS MATEMATICAS 9', 'purchase', 1, 'Paid while purchasing', '302.4000', 2, 6, '2023-08-01 12:12:31', NULL),
(46, 1, 'CT23080122046', 'CLOGROS SOCIALES 6', 'purchase', 1, 'Paid while purchasing', '345.6000', 2, 6, '2023-08-01 12:12:50', NULL),
(47, 1, 'CT23080122047', 'CLOGROS BIOLOGIA 2', 'purchase', 1, 'Paid while purchasing', '270.0000', 2, 6, '2023-08-01 12:13:15', NULL),
(48, 1, 'CT23080122048', 'CLOGROS MATEMATICAS 8', 'purchase', 1, 'Paid while purchasing', '302.4000', 2, 6, '2023-08-01 12:14:08', NULL),
(49, 4, 'CT23080122049', 'CELLEVATE FULL 5', 'purchase', 1, 'Paid while purchasing', '176.0000', 2, 6, '2023-08-01 12:14:44', NULL),
(50, 4, 'CT23080122050', 'CLEARNING ZONE 5', 'purchase', 1, 'Paid while purchasing', '270.0000', 2, 6, '2023-08-01 12:15:11', NULL),
(51, 1, 'CT23080122051', 'CLOGROS CIENCIAS NATURALES 4', 'purchase', 1, 'Paid while purchasing', '21.6000', 2, 6, '2023-08-01 12:15:43', NULL),
(52, 1, 'CT23080122052', 'CLOGROS FILOSOFIA 2', 'purchase', 1, 'Paid while purchasing', '345.6000', 2, 6, '2023-08-01 12:16:42', NULL),
(53, 1, 'CT23080122053', 'CLOGROS MATEMATICAS 3', 'purchase', 1, 'Paid while purchasing', '237.6000', 2, 6, '2023-08-01 12:17:09', NULL),
(54, 1, 'CT23080122054', 'CLOGROS CIENCIAS 10', 'purchase', 1, 'Paid while purchasing', '324.0000', 2, 6, '2023-08-01 12:17:33', NULL),
(55, 1, 'CT23080122055', 'CCONTABILIDAD 8', 'purchase', 1, 'Paid while purchasing', '320.0000', 2, 6, '2023-08-01 12:18:19', NULL),
(56, 1, 'CT23080122056', 'CLOGROS LENGUAJE 4', 'purchase', 1, 'Paid while purchasing', '237.6000', 2, 6, '2023-08-01 12:18:46', NULL),
(57, 1, 'CT23080122057', 'CPORTAFOLIO EXPERIMENTAL 10', 'purchase', 1, 'Paid while purchasing', '123.2000', 2, 6, '2023-08-01 12:19:18', NULL),
(58, 1, 'CT23080122058', 'CPROBLEMAS DEL MUNDO CONTEPORANEO', 'purchase', 1, 'Paid while purchasing', '250.0000', 2, 6, '2023-08-01 12:20:06', NULL),
(59, 1, 'CT23080122059', 'CLOGROS LENGUAJE 9', 'purchase', 1, 'Paid while purchasing', '291.6000', 2, 6, '2023-08-01 12:20:30', NULL),
(60, 1, 'CT23080122060', 'CPORTAFOLIO EXPERIMENTAL 8', 'purchase', 1, 'Paid while purchasing', '123.2000', 2, 6, '2023-08-01 12:20:55', NULL),
(61, 1, 'CT23080122061', 'CLOGROS SOCIALES 8', 'purchase', 1, 'Paid while purchasing', '324.0000', 2, 6, '2023-08-01 12:21:22', NULL),
(62, 1, 'CT23080122062', 'CGUCHITO 4-5AÑOS', 'purchase', 1, 'Paid while purchasing', '640.0000', 2, 6, '2023-08-01 12:21:56', NULL),
(63, 1, 'CT23080122063', 'CLOGROS LENGUAJE 6', 'purchase', 1, 'Paid while purchasing', '302.4000', 2, 6, '2023-08-01 12:22:20', NULL),
(64, 1, 'CT23080122064', 'CLOGROS SOCIALES 9', 'purchase', 1, 'Paid while purchasing', '313.2000', 2, 6, '2023-08-01 12:22:46', NULL),
(65, 1, 'CT23080122065', 'CLOGROS SOCIALLES 10', 'purchase', 1, 'Paid while purchasing', '313.2000', 2, 6, '2023-08-01 12:23:07', NULL),
(66, 4, 'CT23080122066', 'CEVERYDAY 2', 'purchase', 1, 'Paid while purchasing', '105.0000', 2, 6, '2023-08-01 12:23:37', NULL),
(67, 1, 'CT23080122067', 'CECA 2BGU', 'purchase', 1, 'Paid while purchasing', '700.0000', 2, 6, '2023-08-01 12:24:05', NULL),
(68, 4, 'CT23080122068', 'CLEARNING ZONE 3', 'purchase', 1, 'Paid while purchasing', '243.0000', 2, 6, '2023-08-01 12:24:38', NULL),
(69, 1, 'CT23080122069', 'CCONTABILIDAD 1BGU', 'purchase', 1, 'Paid while purchasing', '360.0000', 2, 6, '2023-08-01 12:25:58', NULL),
(70, 1, 'CT23080122070', 'CCONTABILIDAD 10', 'purchase', 1, 'Paid while purchasing', '330.0000', 2, 6, '2023-08-01 12:26:19', NULL),
(71, 1, 'CT23080122071', 'CLOGROS EMPRENDIMIENTO 2', 'purchase', 1, 'Paid while purchasing', '237.6000', 2, 6, '2023-08-01 12:26:51', NULL),
(72, 1, 'CT23080122072', 'CLOGROS MATEMATICAS ', 'purchase', 1, 'Paid while purchasing', '291.6000', 2, 6, '2023-08-01 12:27:53', NULL),
(73, 1, 'CT23080122073', 'CLOGROS MATEMATICAS 10', 'purchase', 1, 'Paid while purchasing', '313.2000', 2, 6, '2023-08-01 12:28:45', NULL),
(74, 1, 'CT23080122074', 'CLOGROS CIENCIAS 8', 'purchase', 1, 'Paid while purchasing', '334.8000', 2, 6, '2023-08-01 12:29:59', NULL),
(75, 1, 'CT23080122075', 'CLOGROS MATEMATICAS 7', 'purchase', 1, 'Paid while purchasing', '259.2000', 2, 6, '2023-08-01 12:30:46', NULL),
(76, 1, 'CT23080122076', 'CLOGROS MATEMATICAS 5', 'purchase', 1, 'Paid while purchasing', '291.6000', 2, 6, '2023-08-01 12:31:23', NULL),
(77, 1, 'CT23080122077', 'CMARAVILLA DE LEER 7', 'purchase', 1, 'Paid while purchasing', '128.8000', 2, 6, '2023-08-01 12:31:57', NULL),
(78, 1, 'CT23080122078', 'CLOGROS SOCIALES 3', 'purchase', 1, 'Paid while purchasing', '280.8000', 2, 6, '2023-08-01 12:32:25', NULL),
(79, 1, 'CT23080122079', 'CMARAVILLA DE LEER 4', 'purchase', 1, 'Paid while purchasing', '162.4000', 2, 6, '2023-08-01 12:32:57', NULL),
(80, 1, 'CT23080122080', 'CLOGROS LENGUAJE 1BGU', 'purchase', 1, 'Paid while purchasing', '97.2000', 2, 6, '2023-08-01 12:33:30', NULL),
(81, 1, 'CT23080122081', 'CLOGROS SOCIALES 4', 'purchase', 1, 'Paid while purchasing', '270.0000', 2, 6, '2023-08-01 12:33:55', NULL),
(82, 4, 'CT23080122082', 'CLEARNING ZONE 6', 'purchase', 1, 'Paid while purchasing', '220.0000', 2, 6, '2023-08-01 12:34:41', NULL),
(83, 4, 'CT23080122083', 'CELLEVATE TEEN 1', 'purchase', 1, 'Paid while purchasing', '132.0000', 2, 6, '2023-08-01 12:35:46', NULL),
(84, 1, 'CT23080122084', 'CMI TUTORIAL DIGITAL 2BGU', 'purchase', 1, 'Paid while purchasing', '120.0000', 2, 6, '2023-08-01 13:33:00', NULL),
(85, 1, 'CT23080122085', 'CMI TUTORIAL DIGITAL 3BGU', 'purchase', 1, 'Paid while purchasing', '120.0000', 2, 6, '2023-08-01 13:33:29', NULL),
(86, 1, 'CT23080122086', 'CMI TUTORIAL DIGITAL MATEMATICAS 8', 'purchase', 1, 'Paid while purchasing', '42.0000', 2, 6, '2023-08-01 13:53:14', NULL),
(87, 1, 'CT23080122087', 'CMI TUTORIAL DIGITAL MATEMATICAS 2BGU', 'purchase', 1, 'Paid while purchasing', '42.0000', 2, 6, '2023-08-01 13:54:47', NULL),
(88, 1, 'CT23080122088', 'CMI TUTORIAL DIGITAL MATEMATICAS 3BGU', 'purchase', 1, 'Paid while purchasing', '42.0000', 2, 6, '2023-08-01 13:55:52', NULL),
(89, 1, 'CT23080122089', 'CMI TUTORIAL DIGITAL FISICA 3BGU', 'purchase', 1, 'Paid while purchasing', '180.0000', 2, 6, '2023-08-01 13:56:54', NULL),
(90, 1, 'CT23080122090', 'CMI TUTORIAL DIGITAL FISICA 2BGU', 'purchase', 1, 'Paid while purchasing', '168.0000', 2, 6, '2023-08-01 13:57:23', NULL),
(91, 7, 'CT23080122091', 'CREFUERZO ESCOLAR 2', 'purchase', 1, 'Paid while purchasing', '65.0000', 2, 6, '2023-08-01 14:01:34', NULL),
(92, 7, 'CT23080122092', 'CREFUERZO ESCOLAR 3', 'purchase', 1, 'Paid while purchasing', '65.0000', 2, 6, '2023-08-01 14:02:00', NULL),
(93, 7, 'CT23080122093', 'CREFUERZO ESCOLAR 5', 'purchase', 1, 'Paid while purchasing', '65.0000', 2, 6, '2023-08-01 14:04:00', NULL),
(94, 7, 'CT23080122094', 'CREFUERZO ESCOLAR 6', 'purchase', 1, 'Paid while purchasing', '65.0000', 2, 6, '2023-08-01 14:04:36', NULL),
(95, 7, 'CT23080122095', 'CREFUERZO ESCOLAR 4', 'purchase', 1, 'Paid while purchasing', '65.0000', 2, 6, '2023-08-01 14:04:58', NULL),
(96, 7, 'CT23080122096', 'CREFUERZO ESCOLAR 7', 'purchase', 1, 'Paid while purchasing', '65.0000', 2, 6, '2023-08-01 14:05:26', NULL),
(97, 1, 'CT23080222097', 'CBGU QUIMICA ORGANICA ', 'purchase', 1, 'Paid while purchasing', '252.0000', 2, 6, '2023-08-02 10:22:00', NULL),
(98, 1, 'CT23080222098', 'C3BGU CERIT', 'purchase', 1, 'Paid while purchasing', '194.4000', 2, 6, '2023-08-02 10:23:05', NULL),
(99, 1, 'CT23080222099', 'C2BGU CERIT', 'purchase', 1, 'Paid while purchasing', '302.4000', 2, 6, '2023-08-02 10:23:54', NULL),
(100, 1, 'CT23080222100', 'CMI TUTORIAL DIGITAL 9', 'purchase', 1, 'Paid while purchasing', '42.0000', 2, 6, '2023-08-02 11:49:52', NULL),
(101, 1, 'CT23080222101', 'CLOGROS CIENCIAS NATURALES 6', 'purchase', 1, 'Paid while purchasing', '129.6000', 2, 6, '2023-08-02 12:03:10', NULL),
(102, 1, 'CT23080222102', 'CLOGROS CIENCIAS NATURALES 4.', 'purchase', 1, 'Paid while purchasing', '129.6000', 2, 6, '2023-08-02 12:06:29', NULL),
(103, 1, 'CT23080522103', 'CHISTORIA 3BGU', 'purchase', 1, 'Paid while purchasing', '205.2000', 2, 6, '2023-08-05 12:16:20', NULL),
(104, 1, 'CT23080522104', 'CLOGROS HISTORIA 2', 'purchase', 1, 'Paid while purchasing', '302.4000', 2, 6, '2023-08-05 14:19:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'purchase',
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `pmethod_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `total_paid` decimal(25,4) DEFAULT 0.0000,
  `balance` decimal(25,4) DEFAULT 0.0000,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `purchase_payments`
--

INSERT INTO `purchase_payments` (`id`, `type`, `is_hide`, `store_id`, `invoice_id`, `reference_no`, `pmethod_id`, `transaction_id`, `details`, `attachment`, `note`, `amount`, `total_paid`, `balance`, `created_by`, `created_at`) VALUES
(1, 'purchase', 0, 2, 'CINVENTARIO DAS', NULL, 1, NULL, NULL, NULL, '', '302.4000', '302.4000', '0.0000', 6, '2023-08-01 11:27:13'),
(2, 'purchase', 0, 2, 'CCINVENTARIO DAS', NULL, 1, NULL, NULL, NULL, '', '280.8000', '280.8000', '0.0000', 6, '2023-08-01 11:28:54'),
(3, 'purchase', 0, 2, 'CHUVGH', NULL, 1, NULL, NULL, NULL, '', '216.0000', '216.0000', '0.0000', 6, '2023-08-01 11:32:05'),
(4, 'purchase', 0, 2, 'CMATEMATICAS SEGUNDO', NULL, 1, NULL, NULL, NULL, '', '216.0000', '216.0000', '0.0000', 6, '2023-08-01 11:33:23'),
(5, 'purchase', 0, 2, 'CDAS INGLES', NULL, 1, NULL, NULL, NULL, '', '405.0000', '405.0000', '0.0000', 6, '2023-08-01 11:36:18'),
(6, 'purchase', 0, 2, 'CDAS LOGROS CIENCIAS', NULL, 1, NULL, NULL, NULL, '', '270.0000', '270.0000', '0.0000', 6, '2023-08-01 11:37:00'),
(7, 'purchase', 0, 2, 'CDAS MANUAL PARA EMPRESAS', NULL, 1, NULL, NULL, NULL, '', '310.0000', '310.0000', '0.0000', 6, '2023-08-01 11:37:31'),
(8, 'purchase', 0, 2, 'CDAS LOGROS LENGUAJE BASICA', NULL, 1, NULL, NULL, NULL, '', '237.6000', '237.6000', '0.0000', 6, '2023-08-01 11:38:06'),
(9, 'purchase', 0, 2, 'CDAS INGLES 2', NULL, 1, NULL, NULL, NULL, '', '405.0000', '405.0000', '0.0000', 6, '2023-08-01 11:39:15'),
(10, 'purchase', 0, 2, 'CDAS LOGROS LENGUAJE ', NULL, 1, NULL, NULL, NULL, '', '64.8000', '64.8000', '0.0000', 6, '2023-08-01 11:39:47'),
(12, 'purchase', 0, 2, 'CLOGROS SOCIALES SEGUNDO', NULL, 1, NULL, NULL, NULL, '', '270.0000', '270.0000', '0.0000', 6, '2023-08-01 11:41:00'),
(13, 'purchase', 0, 2, 'CLOGROS MATEMATICAS 4', NULL, 1, NULL, NULL, NULL, '', '270.0000', '270.0000', '0.0000', 6, '2023-08-01 11:45:16'),
(14, 'purchase', 0, 2, 'CDAS INGLES ELLEVATE 2', NULL, 1, NULL, NULL, NULL, '', '176.0000', '176.0000', '0.0000', 6, '2023-08-01 11:46:16'),
(15, 'purchase', 0, 2, 'CLOGROS CIENCIAS NATURALES 5', NULL, 1, NULL, NULL, NULL, '', '259.2000', '259.2000', '0.0000', 6, '2023-08-01 11:46:50'),
(16, 'purchase', 0, 2, 'CGUCHITO 3-4 AÑOS', NULL, 1, NULL, NULL, NULL, '', '380.0000', '380.0000', '0.0000', 6, '2023-08-01 11:48:27'),
(17, 'purchase', 0, 2, 'CLOGROS CIENCIAS 6', NULL, 1, NULL, NULL, NULL, '', '10.8000', '10.8000', '0.0000', 6, '2023-08-01 11:49:15'),
(18, 'purchase', 0, 2, 'CLOGROS LENGUAJE 5', NULL, 1, NULL, NULL, NULL, '', '302.4000', '302.4000', '0.0000', 6, '2023-08-01 11:49:56'),
(19, 'purchase', 0, 2, 'CLOGROS CIENCIAS 9', NULL, 1, NULL, NULL, NULL, '', '324.0000', '324.0000', '0.0000', 6, '2023-08-01 11:51:19'),
(20, 'purchase', 0, 2, 'CMARAVILLAS DE LEER 2', NULL, 1, NULL, NULL, NULL, '', '117.6000', '117.6000', '0.0000', 6, '2023-08-01 11:51:54'),
(21, 'purchase', 0, 2, 'CLOGROS FILOSOFIA 1', NULL, 1, NULL, NULL, NULL, '', '43.2000', '43.2000', '0.0000', 6, '2023-08-01 11:52:34'),
(22, 'purchase', 0, 2, 'CEVERYDAY 1', NULL, 1, NULL, NULL, NULL, '', '315.0000', '315.0000', '0.0000', 6, '2023-08-01 11:54:12'),
(24, 'purchase', 0, 2, 'CLOGROS ANTISTICA 1', NULL, 1, NULL, NULL, NULL, '', '75.0000', '75.0000', '0.0000', 6, '2023-08-01 11:55:57'),
(26, 'purchase', 0, 2, 'CGUCHITO PREPARATORIA', NULL, 1, NULL, NULL, NULL, '', '560.0000', '560.0000', '0.0000', 6, '2023-08-01 11:57:10'),
(27, 'purchase', 0, 2, 'CMARAVILLA DE LEER 6', NULL, 1, NULL, NULL, NULL, '', '123.2000', '123.2000', '0.0000', 6, '2023-08-01 11:57:34'),
(28, 'purchase', 0, 2, 'CLOGROS CONTABILIAD 9', NULL, 1, NULL, NULL, NULL, '', '80.0000', '80.0000', '0.0000', 6, '2023-08-01 11:57:57'),
(29, 'purchase', 0, 2, 'CLOGROS LENGUAJE 8', NULL, 1, NULL, NULL, NULL, '', '237.6000', '237.6000', '0.0000', 6, '2023-08-01 11:58:57'),
(30, 'purchase', 0, 2, 'CMARAVILLA DE LEER 5', NULL, 1, NULL, NULL, NULL, '', '123.2000', '123.2000', '0.0000', 6, '2023-08-01 11:59:30'),
(32, 'purchase', 0, 2, 'CLOGROS CIENCIAS 7', NULL, 1, NULL, NULL, NULL, '', '194.4000', '194.4000', '0.0000', 6, '2023-08-01 12:01:19'),
(33, 'purchase', 0, 2, 'CBIOLOGIA 3', NULL, 1, NULL, NULL, NULL, '', '259.2000', '259.2000', '0.0000', 6, '2023-08-01 12:01:41'),
(34, 'purchase', 0, 2, 'CEMPRENDIMIENTO 1', NULL, 1, NULL, NULL, NULL, '', '54.0000', '54.0000', '0.0000', 6, '2023-08-01 12:02:16'),
(35, 'purchase', 0, 2, 'CMARAVILLA DE LEER 3', NULL, 1, NULL, NULL, NULL, '', '162.4000', '162.4000', '0.0000', 6, '2023-08-01 12:02:43'),
(36, 'purchase', 0, 2, 'CLEARNING 4', NULL, 1, NULL, NULL, NULL, '', '270.0000', '270.0000', '0.0000', 6, '2023-08-01 12:03:15'),
(37, 'purchase', 0, 2, 'CLENGUAJE 3BASICA', NULL, 1, NULL, NULL, NULL, '', '248.4000', '248.4000', '0.0000', 6, '2023-08-01 12:03:40'),
(38, 'purchase', 0, 2, 'CELLEVATE FULL 6', NULL, 1, NULL, NULL, NULL, '', '66.0000', '66.0000', '0.0000', 6, '2023-08-01 12:04:11'),
(39, 'purchase', 0, 2, 'CSOCIALES 5', NULL, 1, NULL, NULL, NULL, '', '291.6000', '291.6000', '0.0000', 6, '2023-08-01 12:04:36'),
(40, 'purchase', 0, 2, 'CCIENCIAS NATURALES 2', NULL, 1, NULL, NULL, NULL, '', '248.4000', '248.4000', '0.0000', 6, '2023-08-01 12:05:05'),
(41, 'purchase', 0, 2, 'CLENGUAJE 2BGU', NULL, 1, NULL, NULL, NULL, '', '313.2000', '313.2000', '0.0000', 6, '2023-08-01 12:05:50'),
(43, 'purchase', 0, 2, 'CSOCIALES 7', NULL, 1, NULL, NULL, NULL, '', '302.4000', '302.4000', '0.0000', 6, '2023-08-01 12:06:49'),
(44, 'purchase', 0, 2, 'CPORTAFOLIO EXPERIMENTAL 9', NULL, 1, NULL, NULL, NULL, '', '128.8000', '128.8000', '0.0000', 6, '2023-08-01 12:08:17'),
(45, 'purchase', 0, 2, 'CLOGROS MATEMATICAS 9', NULL, 1, NULL, NULL, NULL, '', '302.4000', '302.4000', '0.0000', 6, '2023-08-01 12:12:31'),
(46, 'purchase', 0, 2, 'CLOGROS SOCIALES 6', NULL, 1, NULL, NULL, NULL, '', '345.6000', '345.6000', '0.0000', 6, '2023-08-01 12:12:50'),
(47, 'purchase', 0, 2, 'CLOGROS BIOLOGIA 2', NULL, 1, NULL, NULL, NULL, '', '270.0000', '270.0000', '0.0000', 6, '2023-08-01 12:13:15'),
(48, 'purchase', 0, 2, 'CLOGROS MATEMATICAS 8', NULL, 1, NULL, NULL, NULL, '', '302.4000', '302.4000', '0.0000', 6, '2023-08-01 12:14:08'),
(49, 'purchase', 0, 2, 'CELLEVATE FULL 5', NULL, 1, NULL, NULL, NULL, '', '176.0000', '176.0000', '0.0000', 6, '2023-08-01 12:14:44'),
(50, 'purchase', 0, 2, 'CLEARNING ZONE 5', NULL, 1, NULL, NULL, NULL, '', '270.0000', '270.0000', '0.0000', 6, '2023-08-01 12:15:11'),
(51, 'purchase', 0, 2, 'CLOGROS CIENCIAS NATURALES 4', NULL, 1, NULL, NULL, NULL, '', '21.6000', '21.6000', '0.0000', 6, '2023-08-01 12:15:43'),
(52, 'purchase', 0, 2, 'CLOGROS FILOSOFIA 2', NULL, 1, NULL, NULL, NULL, '', '345.6000', '345.6000', '0.0000', 6, '2023-08-01 12:16:42'),
(53, 'purchase', 0, 2, 'CLOGROS MATEMATICAS 3', NULL, 1, NULL, NULL, NULL, '', '237.6000', '237.6000', '0.0000', 6, '2023-08-01 12:17:09'),
(54, 'purchase', 0, 2, 'CLOGROS CIENCIAS 10', NULL, 1, NULL, NULL, NULL, '', '324.0000', '324.0000', '0.0000', 6, '2023-08-01 12:17:33'),
(55, 'purchase', 0, 2, 'CCONTABILIDAD 8', NULL, 1, NULL, NULL, NULL, '', '320.0000', '320.0000', '0.0000', 6, '2023-08-01 12:18:19'),
(56, 'purchase', 0, 2, 'CLOGROS LENGUAJE 4', NULL, 1, NULL, NULL, NULL, '', '237.6000', '237.6000', '0.0000', 6, '2023-08-01 12:18:46'),
(57, 'purchase', 0, 2, 'CPORTAFOLIO EXPERIMENTAL 10', NULL, 1, NULL, NULL, NULL, '', '123.2000', '123.2000', '0.0000', 6, '2023-08-01 12:19:18'),
(58, 'purchase', 0, 2, 'CPROBLEMAS DEL MUNDO CONTEPORANEO', NULL, 1, NULL, NULL, NULL, '', '250.0000', '250.0000', '0.0000', 6, '2023-08-01 12:20:06'),
(59, 'purchase', 0, 2, 'CLOGROS LENGUAJE 9', NULL, 1, NULL, NULL, NULL, '', '291.6000', '291.6000', '0.0000', 6, '2023-08-01 12:20:30'),
(60, 'purchase', 0, 2, 'CPORTAFOLIO EXPERIMENTAL 8', NULL, 1, NULL, NULL, NULL, '', '123.2000', '123.2000', '0.0000', 6, '2023-08-01 12:20:55'),
(61, 'purchase', 0, 2, 'CLOGROS SOCIALES 8', NULL, 1, NULL, NULL, NULL, '', '324.0000', '324.0000', '0.0000', 6, '2023-08-01 12:21:22'),
(62, 'purchase', 0, 2, 'CGUCHITO 4-5AÑOS', NULL, 1, NULL, NULL, NULL, '', '640.0000', '640.0000', '0.0000', 6, '2023-08-01 12:21:56'),
(63, 'purchase', 0, 2, 'CLOGROS LENGUAJE 6', NULL, 1, NULL, NULL, NULL, '', '302.4000', '302.4000', '0.0000', 6, '2023-08-01 12:22:20'),
(64, 'purchase', 0, 2, 'CLOGROS SOCIALES 9', NULL, 1, NULL, NULL, NULL, '', '313.2000', '313.2000', '0.0000', 6, '2023-08-01 12:22:46'),
(65, 'purchase', 0, 2, 'CLOGROS SOCIALLES 10', NULL, 1, NULL, NULL, NULL, '', '313.2000', '313.2000', '0.0000', 6, '2023-08-01 12:23:07'),
(66, 'purchase', 0, 2, 'CEVERYDAY 2', NULL, 1, NULL, NULL, NULL, '', '105.0000', '105.0000', '0.0000', 6, '2023-08-01 12:23:37'),
(67, 'purchase', 0, 2, 'CECA 2BGU', NULL, 1, NULL, NULL, NULL, '', '700.0000', '700.0000', '0.0000', 6, '2023-08-01 12:24:05'),
(68, 'purchase', 0, 2, 'CLEARNING ZONE 3', NULL, 1, NULL, NULL, NULL, '', '243.0000', '243.0000', '0.0000', 6, '2023-08-01 12:24:38'),
(69, 'purchase', 0, 2, 'CCONTABILIDAD 1BGU', NULL, 1, NULL, NULL, NULL, '', '360.0000', '360.0000', '0.0000', 6, '2023-08-01 12:25:58'),
(70, 'purchase', 0, 2, 'CCONTABILIDAD 10', NULL, 1, NULL, NULL, NULL, '', '330.0000', '330.0000', '0.0000', 6, '2023-08-01 12:26:19'),
(71, 'purchase', 0, 2, 'CLOGROS EMPRENDIMIENTO 2', NULL, 1, NULL, NULL, NULL, '', '237.6000', '237.6000', '0.0000', 6, '2023-08-01 12:26:51'),
(72, 'purchase', 0, 2, 'CLOGROS MATEMATICAS ', NULL, 1, NULL, NULL, NULL, '', '291.6000', '291.6000', '0.0000', 6, '2023-08-01 12:27:53'),
(73, 'purchase', 0, 2, 'CLOGROS MATEMATICAS 10', NULL, 1, NULL, NULL, NULL, '', '313.2000', '313.2000', '0.0000', 6, '2023-08-01 12:28:45'),
(74, 'purchase', 0, 2, 'CLOGROS CIENCIAS 8', NULL, 1, NULL, NULL, NULL, '', '334.8000', '334.8000', '0.0000', 6, '2023-08-01 12:29:59'),
(75, 'purchase', 0, 2, 'CLOGROS MATEMATICAS 7', NULL, 1, NULL, NULL, NULL, '', '259.2000', '259.2000', '0.0000', 6, '2023-08-01 12:30:46'),
(76, 'purchase', 0, 2, 'CLOGROS MATEMATICAS 5', NULL, 1, NULL, NULL, NULL, '', '291.6000', '291.6000', '0.0000', 6, '2023-08-01 12:31:23'),
(77, 'purchase', 0, 2, 'CMARAVILLA DE LEER 7', NULL, 1, NULL, NULL, NULL, '', '128.8000', '128.8000', '0.0000', 6, '2023-08-01 12:31:57'),
(78, 'purchase', 0, 2, 'CLOGROS SOCIALES 3', NULL, 1, NULL, NULL, NULL, '', '280.8000', '280.8000', '0.0000', 6, '2023-08-01 12:32:25'),
(79, 'purchase', 0, 2, 'CMARAVILLA DE LEER 4', NULL, 1, NULL, NULL, NULL, '', '162.4000', '162.4000', '0.0000', 6, '2023-08-01 12:32:57'),
(80, 'purchase', 0, 2, 'CLOGROS LENGUAJE 1BGU', NULL, 1, NULL, NULL, NULL, '', '97.2000', '97.2000', '0.0000', 6, '2023-08-01 12:33:30'),
(81, 'purchase', 0, 2, 'CLOGROS SOCIALES 4', NULL, 1, NULL, NULL, NULL, '', '270.0000', '270.0000', '0.0000', 6, '2023-08-01 12:33:55'),
(82, 'purchase', 0, 2, 'CLEARNING ZONE 6', NULL, 1, NULL, NULL, NULL, '', '220.0000', '220.0000', '0.0000', 6, '2023-08-01 12:34:41'),
(83, 'purchase', 0, 2, 'CELLEVATE TEEN 1', NULL, 1, NULL, NULL, NULL, '', '132.0000', '132.0000', '0.0000', 6, '2023-08-01 12:35:46'),
(84, 'purchase', 0, 2, 'CMI TUTORIAL DIGITAL 2BGU', NULL, 1, NULL, NULL, NULL, '', '120.0000', '120.0000', '0.0000', 6, '2023-08-01 13:33:00'),
(85, 'purchase', 0, 2, 'CMI TUTORIAL DIGITAL 3BGU', NULL, 1, NULL, NULL, NULL, '', '120.0000', '120.0000', '0.0000', 6, '2023-08-01 13:33:29'),
(86, 'purchase', 0, 2, 'CMI TUTORIAL DIGITAL MATEMATICAS 8', NULL, 1, NULL, NULL, NULL, '', '42.0000', '42.0000', '0.0000', 6, '2023-08-01 13:53:14'),
(87, 'purchase', 0, 2, 'CMI TUTORIAL DIGITAL MATEMATICAS 2BGU', NULL, 1, NULL, NULL, NULL, '', '42.0000', '42.0000', '0.0000', 6, '2023-08-01 13:54:47'),
(88, 'purchase', 0, 2, 'CMI TUTORIAL DIGITAL MATEMATICAS 3BGU', NULL, 1, NULL, NULL, NULL, '', '42.0000', '42.0000', '0.0000', 6, '2023-08-01 13:55:52'),
(89, 'purchase', 0, 2, 'CMI TUTORIAL DIGITAL FISICA 3BGU', NULL, 1, NULL, NULL, NULL, '', '180.0000', '180.0000', '0.0000', 6, '2023-08-01 13:56:54'),
(90, 'purchase', 0, 2, 'CMI TUTORIAL DIGITAL FISICA 2BGU', NULL, 1, NULL, NULL, NULL, '', '168.0000', '168.0000', '0.0000', 6, '2023-08-01 13:57:23'),
(91, 'purchase', 0, 2, 'CREFUERZO ESCOLAR 2', NULL, 1, NULL, NULL, NULL, '', '65.0000', '65.0000', '0.0000', 6, '2023-08-01 14:01:34'),
(92, 'purchase', 0, 2, 'CREFUERZO ESCOLAR 3', NULL, 1, NULL, NULL, NULL, '', '65.0000', '65.0000', '0.0000', 6, '2023-08-01 14:02:00'),
(93, 'purchase', 0, 2, 'CREFUERZO ESCOLAR 5', NULL, 1, NULL, NULL, NULL, '', '65.0000', '65.0000', '0.0000', 6, '2023-08-01 14:04:00'),
(94, 'purchase', 0, 2, 'CREFUERZO ESCOLAR 6', NULL, 1, NULL, NULL, NULL, '', '65.0000', '65.0000', '0.0000', 6, '2023-08-01 14:04:36'),
(95, 'purchase', 0, 2, 'CREFUERZO ESCOLAR 4', NULL, 1, NULL, NULL, NULL, '', '65.0000', '65.0000', '0.0000', 6, '2023-08-01 14:04:58'),
(96, 'purchase', 0, 2, 'CREFUERZO ESCOLAR 7', NULL, 1, NULL, NULL, NULL, '', '65.0000', '65.0000', '0.0000', 6, '2023-08-01 14:05:26'),
(97, 'purchase', 0, 2, 'CBGU QUIMICA ORGANICA ', NULL, 1, NULL, NULL, NULL, '', '252.0000', '252.0000', '0.0000', 6, '2023-08-02 10:22:00'),
(98, 'purchase', 0, 2, 'C3BGU CERIT', NULL, 1, NULL, NULL, NULL, '', '194.4000', '194.4000', '0.0000', 6, '2023-08-02 10:23:05'),
(99, 'purchase', 0, 2, 'C2BGU CERIT', NULL, 1, NULL, NULL, NULL, '', '302.4000', '302.4000', '0.0000', 6, '2023-08-02 10:23:54'),
(100, 'purchase', 0, 2, 'CMI TUTORIAL DIGITAL 9', NULL, 1, NULL, NULL, NULL, '', '42.0000', '42.0000', '0.0000', 6, '2023-08-02 11:49:52'),
(101, 'purchase', 0, 2, 'CLOGROS CIENCIAS NATURALES 6', NULL, 1, NULL, NULL, NULL, '', '129.6000', '129.6000', '0.0000', 6, '2023-08-02 12:03:10'),
(102, 'purchase', 0, 2, 'CLOGROS CIENCIAS NATURALES 4.', NULL, 1, NULL, NULL, NULL, '', '129.6000', '129.6000', '0.0000', 6, '2023-08-02 12:06:29'),
(103, 'purchase', 0, 2, 'CHISTORIA 3BGU', NULL, 1, NULL, NULL, NULL, '', '205.2000', '205.2000', '0.0000', 6, '2023-08-05 12:16:20'),
(104, 'purchase', 0, 2, 'CLOGROS HISTORIA 2', NULL, 1, NULL, NULL, NULL, '', '302.4000', '302.4000', '0.0000', 6, '2023-08-05 14:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_price`
--

CREATE TABLE `purchase_price` (
  `price_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('percentage','plain') NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `shipping_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `others_charge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `order_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payable_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `paid_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `due_paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_amount` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `balance` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `purchase_price`
--

INSERT INTO `purchase_price` (`price_id`, `invoice_id`, `store_id`, `subtotal`, `discount_type`, `discount_amount`, `shipping_type`, `shipping_amount`, `others_charge`, `item_tax`, `order_tax`, `cgst`, `sgst`, `igst`, `payable_amount`, `paid_amount`, `due_paid`, `due`, `return_amount`, `balance`) VALUES
(1, 'CINVENTARIO DAS', 2, '302.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '302.4000', '302.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(2, 'CCINVENTARIO DAS', 2, '280.8000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '280.8000', '280.8000', '0.0000', '0.0000', '0.0000', '0.0000'),
(3, 'CHUVGH', 2, '216.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '216.0000', '216.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(4, 'CMATEMATICAS SEGUNDO', 2, '216.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '216.0000', '216.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(5, 'CDAS INGLES', 2, '405.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '405.0000', '405.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(6, 'CDAS LOGROS CIENCIAS', 2, '270.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '270.0000', '270.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(7, 'CDAS MANUAL PARA EMPRESAS', 2, '310.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '310.0000', '310.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(8, 'CDAS LOGROS LENGUAJE BASICA', 2, '237.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '237.6000', '237.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(9, 'CDAS INGLES 2', 2, '405.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '405.0000', '405.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(10, 'CDAS LOGROS LENGUAJE ', 2, '64.8000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '64.8000', '64.8000', '0.0000', '0.0000', '0.0000', '0.0000'),
(12, 'CLOGROS SOCIALES SEGUNDO', 2, '270.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '270.0000', '270.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(13, 'CLOGROS MATEMATICAS 4', 2, '270.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '270.0000', '270.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(14, 'CDAS INGLES ELLEVATE 2', 2, '176.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '176.0000', '176.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(15, 'CLOGROS CIENCIAS NATURALES 5', 2, '259.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '259.2000', '259.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(16, 'CGUCHITO 3-4 AÑOS', 2, '380.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '380.0000', '380.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(17, 'CLOGROS CIENCIAS 6', 2, '10.8000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '10.8000', '10.8000', '0.0000', '0.0000', '0.0000', '0.0000'),
(18, 'CLOGROS LENGUAJE 5', 2, '302.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '302.4000', '302.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(19, 'CLOGROS CIENCIAS 9', 2, '324.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '324.0000', '324.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(20, 'CMARAVILLAS DE LEER 2', 2, '117.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '117.6000', '117.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(21, 'CLOGROS FILOSOFIA 1', 2, '43.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '43.2000', '43.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(22, 'CEVERYDAY 1', 2, '315.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '315.0000', '315.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(24, 'CLOGROS ANTISTICA 1', 2, '75.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '75.0000', '75.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(26, 'CGUCHITO PREPARATORIA', 2, '560.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '560.0000', '560.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(27, 'CMARAVILLA DE LEER 6', 2, '123.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '123.2000', '123.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(28, 'CLOGROS CONTABILIAD 9', 2, '80.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '80.0000', '80.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(29, 'CLOGROS LENGUAJE 8', 2, '237.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '237.6000', '237.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(30, 'CMARAVILLA DE LEER 5', 2, '123.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '123.2000', '123.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(32, 'CLOGROS CIENCIAS 7', 2, '194.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '194.4000', '194.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(33, 'CBIOLOGIA 3', 2, '259.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '259.2000', '259.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(34, 'CEMPRENDIMIENTO 1', 2, '54.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '54.0000', '54.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(35, 'CMARAVILLA DE LEER 3', 2, '162.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '162.4000', '162.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(36, 'CLEARNING 4', 2, '270.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '270.0000', '270.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(37, 'CLENGUAJE 3BASICA', 2, '248.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '248.4000', '248.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(38, 'CELLEVATE FULL 6', 2, '66.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '66.0000', '66.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(39, 'CSOCIALES 5', 2, '291.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '291.6000', '291.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(40, 'CCIENCIAS NATURALES 2', 2, '248.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '248.4000', '248.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(41, 'CLENGUAJE 2BGU', 2, '313.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '313.2000', '313.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(43, 'CSOCIALES 7', 2, '302.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '302.4000', '302.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(44, 'CPORTAFOLIO EXPERIMENTAL 9', 2, '128.8000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '128.8000', '128.8000', '0.0000', '0.0000', '0.0000', '0.0000'),
(45, 'CLOGROS MATEMATICAS 9', 2, '302.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '302.4000', '302.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(46, 'CLOGROS SOCIALES 6', 2, '345.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '345.6000', '345.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(47, 'CLOGROS BIOLOGIA 2', 2, '270.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '270.0000', '270.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(48, 'CLOGROS MATEMATICAS 8', 2, '302.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '302.4000', '302.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(49, 'CELLEVATE FULL 5', 2, '176.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '176.0000', '176.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(50, 'CLEARNING ZONE 5', 2, '270.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '270.0000', '270.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(51, 'CLOGROS CIENCIAS NATURALES 4', 2, '21.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '21.6000', '21.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(52, 'CLOGROS FILOSOFIA 2', 2, '345.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '345.6000', '345.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(53, 'CLOGROS MATEMATICAS 3', 2, '237.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '237.6000', '237.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(54, 'CLOGROS CIENCIAS 10', 2, '324.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '324.0000', '324.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(55, 'CCONTABILIDAD 8', 2, '320.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '320.0000', '320.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(56, 'CLOGROS LENGUAJE 4', 2, '237.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '237.6000', '237.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(57, 'CPORTAFOLIO EXPERIMENTAL 10', 2, '123.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '123.2000', '123.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(58, 'CPROBLEMAS DEL MUNDO CONTEPORANEO', 2, '250.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '250.0000', '250.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(59, 'CLOGROS LENGUAJE 9', 2, '291.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '291.6000', '291.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(60, 'CPORTAFOLIO EXPERIMENTAL 8', 2, '123.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '123.2000', '123.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(61, 'CLOGROS SOCIALES 8', 2, '324.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '324.0000', '324.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(62, 'CGUCHITO 4-5AÑOS', 2, '640.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '640.0000', '640.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(63, 'CLOGROS LENGUAJE 6', 2, '302.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '302.4000', '302.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(64, 'CLOGROS SOCIALES 9', 2, '313.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '313.2000', '313.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(65, 'CLOGROS SOCIALLES 10', 2, '313.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '313.2000', '313.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(66, 'CEVERYDAY 2', 2, '105.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '105.0000', '105.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(67, 'CECA 2BGU', 2, '700.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '700.0000', '700.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(68, 'CLEARNING ZONE 3', 2, '243.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '243.0000', '243.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(69, 'CCONTABILIDAD 1BGU', 2, '360.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '360.0000', '360.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(70, 'CCONTABILIDAD 10', 2, '330.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '330.0000', '330.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(71, 'CLOGROS EMPRENDIMIENTO 2', 2, '237.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '237.6000', '237.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(72, 'CLOGROS MATEMATICAS ', 2, '291.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '291.6000', '291.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(73, 'CLOGROS MATEMATICAS 10', 2, '313.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '313.2000', '313.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(74, 'CLOGROS CIENCIAS 8', 2, '334.8000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '334.8000', '334.8000', '0.0000', '0.0000', '0.0000', '0.0000'),
(75, 'CLOGROS MATEMATICAS 7', 2, '259.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '259.2000', '259.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(76, 'CLOGROS MATEMATICAS 5', 2, '291.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '291.6000', '291.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(77, 'CMARAVILLA DE LEER 7', 2, '128.8000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '128.8000', '128.8000', '0.0000', '0.0000', '0.0000', '0.0000'),
(78, 'CLOGROS SOCIALES 3', 2, '280.8000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '280.8000', '280.8000', '0.0000', '0.0000', '0.0000', '0.0000'),
(79, 'CMARAVILLA DE LEER 4', 2, '162.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '162.4000', '162.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(80, 'CLOGROS LENGUAJE 1BGU', 2, '97.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '97.2000', '97.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(81, 'CLOGROS SOCIALES 4', 2, '270.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '270.0000', '270.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(82, 'CLEARNING ZONE 6', 2, '220.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '220.0000', '220.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(83, 'CELLEVATE TEEN 1', 2, '132.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '132.0000', '132.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(84, 'CMI TUTORIAL DIGITAL 2BGU', 2, '120.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '120.0000', '120.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(85, 'CMI TUTORIAL DIGITAL 3BGU', 2, '120.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '120.0000', '120.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(86, 'CMI TUTORIAL DIGITAL MATEMATICAS 8', 2, '42.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '42.0000', '42.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(87, 'CMI TUTORIAL DIGITAL MATEMATICAS 2BGU', 2, '42.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '42.0000', '42.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(88, 'CMI TUTORIAL DIGITAL MATEMATICAS 3BGU', 2, '42.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '42.0000', '42.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(89, 'CMI TUTORIAL DIGITAL FISICA 3BGU', 2, '180.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '180.0000', '180.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(90, 'CMI TUTORIAL DIGITAL FISICA 2BGU', 2, '168.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '168.0000', '168.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(91, 'CREFUERZO ESCOLAR 2', 2, '65.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '65.0000', '65.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(92, 'CREFUERZO ESCOLAR 3', 2, '65.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '65.0000', '65.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(93, 'CREFUERZO ESCOLAR 5', 2, '65.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '65.0000', '65.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(94, 'CREFUERZO ESCOLAR 6', 2, '65.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '65.0000', '65.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(95, 'CREFUERZO ESCOLAR 4', 2, '65.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '65.0000', '65.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(96, 'CREFUERZO ESCOLAR 7', 2, '65.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '65.0000', '65.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(97, 'CBGU QUIMICA ORGANICA ', 2, '252.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '252.0000', '252.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(98, 'C3BGU CERIT', 2, '194.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '194.4000', '194.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(99, 'C2BGU CERIT', 2, '302.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '302.4000', '302.4000', '0.0000', '0.0000', '0.0000', '0.0000'),
(100, 'CMI TUTORIAL DIGITAL 9', 2, '42.0000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '42.0000', '42.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(101, 'CLOGROS CIENCIAS NATURALES 6', 2, '129.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '129.6000', '129.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(102, 'CLOGROS CIENCIAS NATURALES 4.', 2, '129.6000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '129.6000', '129.6000', '0.0000', '0.0000', '0.0000', '0.0000'),
(103, 'CHISTORIA 3BGU', 2, '205.2000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '205.2000', '205.2000', '0.0000', '0.0000', '0.0000', '0.0000'),
(104, 'CLOGROS HISTORIA 2', 2, '302.4000', 'plain', '0.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '302.4000', '302.4000', '0.0000', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_item` int(11) DEFAULT NULL,
  `total_quantity` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_amount` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_items`
--

CREATE TABLE `purchase_return_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_quantity` decimal(15,4) NOT NULL,
  `item_price` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_info`
--

CREATE TABLE `quotation_info` (
  `info_id` int(11) NOT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `status` enum('sent','pending','complete','canceled') NOT NULL DEFAULT 'sent',
  `payment_status` varchar(50) DEFAULT NULL,
  `quotation_note` text DEFAULT NULL,
  `is_installment` tinyint(1) NOT NULL DEFAULT 0,
  `is_order` tinyint(1) NOT NULL DEFAULT 0,
  `total_items` int(11) NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `pmethod_details` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_item`
--

CREATE TABLE `quotation_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_price` decimal(25,4) NOT NULL,
  `item_discount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('exclusive','inclusive') NOT NULL DEFAULT 'exclusive',
  `taxrate_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` decimal(25,4) UNSIGNED NOT NULL,
  `item_purchase_price` decimal(25,4) UNSIGNED DEFAULT NULL,
  `item_total` decimal(25,4) UNSIGNED NOT NULL,
  `purchase_invoice_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_price`
--

CREATE TABLE `quotation_price` (
  `price_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT 0.0000,
  `interest_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `interest_percentage` int(11) NOT NULL DEFAULT 0,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `total_purchase_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `shipping_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) DEFAULT 0.0000,
  `others_charge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable_amount` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_item` decimal(25,4) DEFAULT NULL,
  `total_quantity` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_amount` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `total_purchase_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `profit` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_items`
--

CREATE TABLE `return_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_quantity` decimal(25,4) NOT NULL,
  `item_purchase_price` decimal(25,4) DEFAULT NULL,
  `item_price` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_info`
--

CREATE TABLE `selling_info` (
  `info_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `edit_counter` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `inv_type` enum('sell') NOT NULL DEFAULT 'sell',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `college_id` int(10) UNSIGNED DEFAULT NULL,
  `ref_invoice_id` varchar(100) DEFAULT NULL,
  `ref_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invoice_note` text DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `is_installment` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `pmethod_id` int(11) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `checkout_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `selling_info`
--

INSERT INTO `selling_info` (`info_id`, `invoice_id`, `edit_counter`, `inv_type`, `store_id`, `customer_id`, `customer_mobile`, `college_id`, `ref_invoice_id`, `ref_user_id`, `invoice_note`, `total_items`, `is_installment`, `status`, `pmethod_id`, `payment_status`, `checkout_status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '22023/00000001', 0, 'sell', 2, 2, '', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:21:03', NULL),
(2, '22023/00000002', 0, 'sell', 2, 4, '0987317953', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:28:33', NULL),
(3, '22023/00000003', 0, 'sell', 2, 5, '0987716930', 2, NULL, 0, '', 2, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:31:26', NULL),
(4, '22023/00000004', 0, 'sell', 2, 1, '', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:32:36', NULL),
(5, '22023/00000005', 0, 'sell', 2, 6, '0998590760', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:36:25', NULL),
(6, '22023/00000006', 0, 'sell', 2, 7, 'pamer199212@gmail.co', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:38:24', NULL),
(7, '22023/00000007', 0, 'sell', 2, 8, '0979483868', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:40:41', NULL),
(8, '22023/00000008', 0, 'sell', 2, 9, '0999076270', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:43:07', NULL),
(9, '22023/00000009', 0, 'sell', 2, 10, 'milton_her@hotmail.c', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:44:19', NULL),
(10, '22023/00000010', 0, 'sell', 2, 11, '0984874677', 2, NULL, 0, 'TRANSFERENCIA', 11, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:50:32', NULL),
(11, '22023/00000011', 0, 'sell', 2, 12, 'fernandofae85@gmail.', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 11:57:23', NULL),
(12, '22023/00000012', 0, 'sell', 2, 13, '', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-02 12:07:02', NULL),
(13, '22023/00000013', 0, 'sell', 2, 14, '0984559024', 2, NULL, 0, '', 2, 0, 1, 1, 'paid', 1, 6, '2023-08-02 12:08:41', NULL),
(14, '22023/00000014', 0, 'sell', 2, 1, '', 4, NULL, 0, '', 3, 0, 1, 1, 'paid', 1, 6, '2023-08-02 12:18:19', NULL),
(15, '22023/00000015', 0, 'sell', 2, 15, '0987874870', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-03 10:26:48', NULL),
(16, '22023/00000016', 0, 'sell', 2, 16, 'yesseniayugsi3k@gmai', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-03 10:58:55', NULL),
(17, '22023/00000017', 0, 'sell', 2, 17, '0987085359', 2, NULL, 0, 'TRANSFERENCIA ', 2, 0, 1, 1, 'paid', 1, 6, '2023-08-03 13:54:55', NULL),
(18, '22023/00000018', 0, 'sell', 2, 18, '0998568141', 2, NULL, 0, 'TRANSFERENCIA', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-03 14:56:44', NULL),
(19, '22023/00000019', 0, 'sell', 2, 19, '0985377936', 2, NULL, 0, 'TRANSFERENCIA', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-04 11:19:57', NULL),
(20, '22023/00000020', 0, 'sell', 2, 20, '0998066143', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-04 13:36:29', NULL),
(21, '22023/00000021', 0, 'sell', 2, 21, '0961800733', 2, NULL, 0, '', 5, 0, 1, 1, 'paid', 1, 6, '2023-08-04 14:40:26', NULL),
(22, '22023/00000022', 0, 'sell', 2, 22, '0998533552', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-04 15:09:58', NULL),
(23, '22023/00000023', 0, 'sell', 2, 23, 'fernandolaracrespo@h', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-05 12:01:57', NULL),
(24, '22023/00000024', 0, 'sell', 2, 24, '0997367992', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-05 12:30:13', NULL),
(26, '22023/00000025', 0, 'sell', 2, 24, '0997367992', 2, NULL, 0, '', 7, 0, 1, 1, 'paid', 1, 6, '2023-08-05 14:12:07', NULL),
(27, '22023/00000026', 0, 'sell', 2, 25, '0981937194', 2, NULL, 0, '', 7, 0, 1, 1, 'paid', 1, 6, '2023-08-05 14:24:32', NULL),
(28, '22023/00000027', 0, 'sell', 2, 26, '0996646083', 2, NULL, 0, '', 2, 0, 1, 1, 'paid', 1, 6, '2023-08-07 12:26:37', NULL),
(29, '22023/00000028', 0, 'sell', 2, 27, 'anafran410@gmail.com', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-07 14:45:35', NULL),
(30, '22023/00000029', 0, 'sell', 2, 1, '', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-07 15:41:35', NULL),
(31, '22023/00000030', 0, 'sell', 2, 28, '0984612677', 2, NULL, 0, '', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-08 10:23:06', NULL),
(32, '22023/00000031', 0, 'sell', 2, 29, '0999661606', 2, NULL, 0, 'TRANSFERENCIA', 6, 0, 1, 1, 'paid', 1, 6, '2023-08-08 10:47:23', NULL),
(33, '22023/00000032', 0, 'sell', 2, 30, '0997871520', 2, NULL, 0, 'transferencia 2 kit', 12, 0, 1, 1, 'paid', 1, 6, '2023-08-08 11:47:40', NULL),
(34, '22023/00000033', 0, 'sell', 2, 31, '0963115284', 2, NULL, 0, 'TRANSFERENCIA ', 2, 0, 1, 1, 'paid', 1, 6, '2023-08-08 12:39:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `selling_item`
--

CREATE TABLE `selling_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `college_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_price` decimal(25,4) NOT NULL,
  `item_discount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('inclusive','exclusive') DEFAULT 'exclusive',
  `taxrate_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` decimal(25,4) NOT NULL,
  `item_purchase_price` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL,
  `purchase_invoice_id` varchar(100) DEFAULT NULL,
  `print_counter` int(10) UNSIGNED DEFAULT 0,
  `print_counter_time` datetime DEFAULT NULL,
  `printed_by` int(11) DEFAULT NULL,
  `return_quantity` decimal(25,4) DEFAULT 0.0000,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `selling_item`
--

INSERT INTO `selling_item` (`id`, `invoice_id`, `category_id`, `brand_id`, `sup_id`, `store_id`, `college_id`, `item_id`, `item_name`, `item_price`, `item_discount`, `item_tax`, `tax_method`, `taxrate_id`, `tax`, `gst`, `cgst`, `sgst`, `igst`, `item_quantity`, `item_purchase_price`, `item_total`, `purchase_invoice_id`, `print_counter`, `print_counter_time`, `printed_by`, `return_quantity`, `created_at`) VALUES
(1, '22023/00000001', 1, 0, 4, 2, 2, 92, 'LEARNING ZONE SB + ONLINE 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES 2', 0, NULL, NULL, '0.0000', NULL),
(2, '22023/00000001', 1, 1, 1, 2, 2, 23, 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS CIENCIAS', 0, NULL, NULL, '0.0000', NULL),
(3, '22023/00000001', 1, 1, 1, 2, 2, 32, 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 3', 0, NULL, NULL, '0.0000', NULL),
(4, '22023/00000001', 1, 1, 1, 2, 2, 5, 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 3BASICA', 0, NULL, NULL, '0.0000', NULL),
(5, '22023/00000001', 1, 1, 1, 2, 2, 11, 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 3', 0, NULL, NULL, '0.0000', NULL),
(6, '22023/00000001', 1, 0, 7, 2, 2, 86, 'REFUERZO ESCOLAR 3', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 3', 0, NULL, NULL, '0.0000', NULL),
(7, '22023/00000002', 1, 0, 4, 2, 2, 94, 'LEARNING ZONE SB + ONLINE 4', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING 4', 0, NULL, NULL, '0.0000', NULL),
(8, '22023/00000002', 1, 1, 1, 2, 2, 25, 'LOGROS CIENCIAS NATURALES 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS NATURALES 5', 0, NULL, NULL, '0.0000', NULL),
(9, '22023/00000002', 1, 1, 1, 2, 2, 34, 'LOGROS ESTUDIOS SOCIALES 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CSOCIALES 5', 0, NULL, NULL, '0.0000', NULL),
(10, '22023/00000002', 1, 1, 1, 2, 2, 7, 'LOGROS LENGUA Y LITERATURA 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 5', 0, NULL, NULL, '0.0000', NULL),
(11, '22023/00000002', 1, 1, 1, 2, 2, 13, 'LOGROS MATEMÁTICAS 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 5', 0, NULL, NULL, '0.0000', NULL),
(12, '22023/00000002', 1, 0, 7, 2, 2, 88, 'REFUERZO ESCOLAR 5', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 5', 0, NULL, NULL, '0.0000', NULL),
(13, '22023/00000003', 1, 0, 4, 2, 2, 84, 'EVERYDAY INGLISH 2', '45.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '21.0000', '45.0000', 'CEVERYDAY 2', 0, NULL, NULL, '0.0000', NULL),
(14, '22023/00000003', 1, 1, 1, 2, 2, 3, 'KIT CREA Y APRENDE CON GUCHITO (PRIMERO DE BÁSICA)+ PLATAFORMA', '40.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '20.0000', '40.0000', 'CGUCHITO PREPARATORIA', 0, NULL, NULL, '0.0000', NULL),
(15, '22023/00000004', 1, 0, 4, 2, 2, 93, 'LEARNING ZONE SB + ONLINE 3', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING ZONE 3', 0, NULL, NULL, '0.0000', NULL),
(16, '22023/00000004', 1, 1, 1, 2, 2, 24, 'LOGROS CIENCIAS NATURALES 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS NATURALES 4', 0, NULL, NULL, '0.0000', NULL),
(17, '22023/00000004', 1, 1, 1, 2, 2, 33, 'LOGROS ESTUDIOS SOCIALES 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 4', 0, NULL, NULL, '0.0000', NULL),
(18, '22023/00000004', 1, 1, 1, 2, 2, 6, 'LOGROS LENGUA Y LITERATURA 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 4', 0, NULL, NULL, '0.0000', NULL),
(19, '22023/00000004', 1, 1, 1, 2, 2, 12, 'LOGROS MATEMÁTICAS 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 4', 0, NULL, NULL, '0.0000', NULL),
(20, '22023/00000004', 1, 0, 7, 2, 2, 87, 'REFUERZO ESCOLAR 4', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 4', 0, NULL, NULL, '0.0000', NULL),
(21, '22023/00000005', 1, 0, 4, 2, 2, 92, 'LEARNING ZONE SB + ONLINE 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES 2', 0, NULL, NULL, '0.0000', NULL),
(22, '22023/00000005', 1, 1, 1, 2, 2, 23, 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS CIENCIAS', 0, NULL, NULL, '0.0000', NULL),
(23, '22023/00000005', 1, 1, 1, 2, 2, 32, 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 3', 0, NULL, NULL, '0.0000', NULL),
(24, '22023/00000005', 1, 1, 1, 2, 2, 5, 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 3BASICA', 0, NULL, NULL, '0.0000', NULL),
(25, '22023/00000005', 1, 1, 1, 2, 2, 11, 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 3', 0, NULL, NULL, '0.0000', NULL),
(26, '22023/00000005', 1, 0, 7, 2, 2, 86, 'REFUERZO ESCOLAR 3', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 3', 0, NULL, NULL, '0.0000', NULL),
(27, '22023/00000006', 1, 0, 4, 2, 2, 92, 'LEARNING ZONE SB + ONLINE 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES 2', 0, NULL, NULL, '0.0000', NULL),
(28, '22023/00000006', 1, 1, 1, 2, 2, 23, 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS CIENCIAS', 0, NULL, NULL, '0.0000', NULL),
(29, '22023/00000006', 1, 1, 1, 2, 2, 32, 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 3', 0, NULL, NULL, '0.0000', NULL),
(30, '22023/00000006', 1, 1, 1, 2, 2, 5, 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 3BASICA', 0, NULL, NULL, '0.0000', NULL),
(31, '22023/00000006', 1, 1, 1, 2, 2, 11, 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 3', 0, NULL, NULL, '0.0000', NULL),
(32, '22023/00000006', 1, 0, 7, 2, 2, 86, 'REFUERZO ESCOLAR 3', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 3', 0, NULL, NULL, '0.0000', NULL),
(33, '22023/00000007', 1, 0, 4, 2, 2, 92, 'LEARNING ZONE SB + ONLINE 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES 2', 0, NULL, NULL, '0.0000', NULL),
(34, '22023/00000007', 1, 1, 1, 2, 2, 23, 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS CIENCIAS', 0, NULL, NULL, '0.0000', NULL),
(35, '22023/00000007', 1, 1, 1, 2, 2, 32, 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 3', 0, NULL, NULL, '0.0000', NULL),
(36, '22023/00000007', 1, 1, 1, 2, 2, 5, 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 3BASICA', 0, NULL, NULL, '0.0000', NULL),
(37, '22023/00000007', 1, 1, 1, 2, 2, 11, 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 3', 0, NULL, NULL, '0.0000', NULL),
(38, '22023/00000007', 1, 0, 7, 2, 2, 86, 'REFUERZO ESCOLAR 3', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 3', 0, NULL, NULL, '0.0000', NULL),
(39, '22023/00000008', 1, 0, 4, 2, 2, 92, 'LEARNING ZONE SB + ONLINE 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES 2', 0, NULL, NULL, '0.0000', NULL),
(40, '22023/00000008', 1, 1, 1, 2, 2, 23, 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS CIENCIAS', 0, NULL, NULL, '0.0000', NULL),
(41, '22023/00000008', 1, 1, 1, 2, 2, 32, 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 3', 0, NULL, NULL, '0.0000', NULL),
(42, '22023/00000008', 1, 1, 1, 2, 2, 5, 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 3BASICA', 0, NULL, NULL, '0.0000', NULL),
(43, '22023/00000008', 1, 1, 1, 2, 2, 11, 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 3', 0, NULL, NULL, '0.0000', NULL),
(44, '22023/00000008', 1, 0, 7, 2, 2, 86, 'REFUERZO ESCOLAR 3', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 3', 0, NULL, NULL, '0.0000', NULL),
(45, '22023/00000009', 1, 0, 4, 2, 2, 102, 'LEARNING ZONE SB + ONLINE 6', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '22.0000', '46.0000', 'CLEARNING ZONE 6', 0, NULL, NULL, '0.0000', NULL),
(46, '22023/00000009', 1, 1, 1, 2, 2, 27, 'LOGROS CIENCIAS NATURALES 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS 7', 0, NULL, NULL, '0.0000', NULL),
(47, '22023/00000009', 1, 1, 1, 2, 2, 36, 'LOGROS ESTUDIOS SOCIALES 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CSOCIALES 7', 0, NULL, NULL, '0.0000', NULL),
(48, '22023/00000009', 1, 1, 1, 2, 2, 9, 'LOGROS LENGUA Y LITERATURA 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CHUVGH', 0, NULL, NULL, '0.0000', NULL),
(49, '22023/00000009', 1, 1, 1, 2, 2, 15, 'LOGROS MATEMÁTICAS 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 7', 0, NULL, NULL, '0.0000', NULL),
(50, '22023/00000009', 1, 0, 7, 2, 2, 90, 'REFUERZO ESCOLAR 7', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 7', 0, NULL, NULL, '0.0000', NULL),
(51, '22023/00000010', 1, 0, 4, 2, 2, 97, 'ELLEVATE ENGLISH TEEN  SB FULL 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '22.0000', '46.0000', 'CDAS INGLES ELLEVATE 2', 0, NULL, NULL, '0.0000', NULL),
(52, '22023/00000010', 1, 1, 1, 2, 2, 29, 'LOGROS CIENCIAS NATURALES 9 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS 9', 0, NULL, NULL, '0.0000', NULL),
(53, '22023/00000010', 1, 1, 1, 2, 2, 38, 'LOGROS ESTUDIOS SOCIALES 9 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 9', 0, NULL, NULL, '0.0000', NULL),
(54, '22023/00000010', 1, 1, 1, 2, 2, 17, 'LOGROS LENGUA Y LITERATURA 9 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 9', 0, NULL, NULL, '0.0000', NULL),
(55, '22023/00000010', 2, 0, 1, 2, 2, 105, 'MI TUTORIAL DIGITAL MATEMATICAS 9', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL 9', 0, NULL, NULL, '0.0000', NULL),
(56, '22023/00000010', 1, 0, 4, 2, 2, 95, 'LEARNING ZONE SB + ONLINE 5', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING ZONE 5', 0, NULL, NULL, '0.0000', NULL),
(57, '22023/00000010', 1, 1, 1, 2, 2, 26, 'LOGROS CIENCIAS NATURALES 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS 6', 0, NULL, NULL, '0.0000', NULL),
(58, '22023/00000010', 1, 1, 1, 2, 2, 35, 'LOGROS ESTUDIOS SOCIALES 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 6', 0, NULL, NULL, '0.0000', NULL),
(59, '22023/00000010', 1, 1, 1, 2, 2, 8, 'LOGROS LENGUA Y LITERATURA 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 6', 0, NULL, NULL, '0.0000', NULL),
(60, '22023/00000010', 1, 1, 1, 2, 2, 14, 'LOGROS MATEMÁTICAS 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS ', 0, NULL, NULL, '0.0000', NULL),
(61, '22023/00000010', 1, 0, 7, 2, 2, 89, 'REFUERZO ESCOLAR 6', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 6', 0, NULL, NULL, '0.0000', NULL),
(62, '22023/00000011', 1, 0, 4, 2, 2, 94, 'LEARNING ZONE SB + ONLINE 4', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING 4', 0, NULL, NULL, '0.0000', NULL),
(63, '22023/00000011', 1, 1, 1, 2, 2, 25, 'LOGROS CIENCIAS NATURALES 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS NATURALES 5', 0, NULL, NULL, '0.0000', NULL),
(64, '22023/00000011', 1, 1, 1, 2, 2, 34, 'LOGROS ESTUDIOS SOCIALES 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CSOCIALES 5', 0, NULL, NULL, '0.0000', NULL),
(65, '22023/00000011', 1, 1, 1, 2, 2, 7, 'LOGROS LENGUA Y LITERATURA 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 5', 0, NULL, NULL, '0.0000', NULL),
(66, '22023/00000011', 1, 1, 1, 2, 2, 13, 'LOGROS MATEMÁTICAS 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 5', 0, NULL, NULL, '0.0000', NULL),
(67, '22023/00000011', 1, 0, 7, 2, 2, 88, 'REFUERZO ESCOLAR 5', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 5', 0, NULL, NULL, '0.0000', NULL),
(68, '22023/00000012', 1, 0, 4, 2, 2, 95, 'LEARNING ZONE SB + ONLINE 5', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING ZONE 5', 0, NULL, NULL, '0.0000', NULL),
(69, '22023/00000012', 1, 1, 1, 2, 2, 26, 'LOGROS CIENCIAS NATURALES 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS NATURALES 6', 0, NULL, NULL, '0.0000', NULL),
(70, '22023/00000012', 1, 1, 1, 2, 2, 8, 'LOGROS LENGUA Y LITERATURA 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 6', 0, NULL, NULL, '0.0000', NULL),
(71, '22023/00000012', 1, 1, 1, 2, 2, 14, 'LOGROS MATEMÁTICAS 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS ', 0, NULL, NULL, '0.0000', NULL),
(72, '22023/00000012', 1, 0, 7, 2, 2, 89, 'REFUERZO ESCOLAR 6', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 6', 0, NULL, NULL, '0.0000', NULL),
(73, '22023/00000012', 1, 1, 1, 2, 2, 35, 'LOGROS ESTUDIOS SOCIALES 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 6', 0, NULL, NULL, '0.0000', NULL),
(74, '22023/00000013', 1, 0, 4, 2, 2, 84, 'EVERYDAY INGLISH 2', '45.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '21.0000', '45.0000', 'CEVERYDAY 2', 0, NULL, NULL, '0.0000', NULL),
(75, '22023/00000013', 1, 1, 1, 2, 2, 3, 'KIT CREA Y APRENDE CON GUCHITO (PRIMERO DE BÁSICA)+ PLATAFORMA', '40.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '20.0000', '40.0000', 'CGUCHITO PREPARATORIA', 0, NULL, NULL, '0.0000', NULL),
(76, '22023/00000014', 2, 0, 1, 2, 4, 112, 'QUIMICA 1 BGU CERIT ', '20.2500', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '24.0000', '252.0000', '486.0000', 'CBGU QUIMICA ORGANICA ', 0, NULL, NULL, '0.0000', NULL),
(77, '22023/00000014', 2, 0, 1, 2, 4, 113, 'QUIMICA 2 BGU CERIT', '20.2500', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '28.0000', '302.4000', '567.0000', 'C2BGU CERIT', 0, NULL, NULL, '0.0000', NULL),
(78, '22023/00000014', 2, 0, 1, 2, 4, 114, 'QUIMICA 3 BGU CERIT ', '20.2500', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '18.0000', '194.4000', '364.5000', 'C3BGU CERIT', 0, NULL, NULL, '0.0000', NULL),
(79, '22023/00000015', 1, 0, 4, 2, 2, 91, 'LEARNING ZONE SB + ONLINE 1', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES', 0, NULL, NULL, '0.0000', NULL),
(80, '22023/00000015', 1, 1, 1, 2, 2, 22, 'LOGROS CIENCIAS NATURALES 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CCIENCIAS NATURALES 2', 0, NULL, NULL, '0.0000', NULL),
(81, '22023/00000015', 1, 1, 1, 2, 2, 31, 'LOGROS ESTUDIOS SOCIALES 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES SEGUNDO', 0, NULL, NULL, '0.0000', NULL),
(82, '22023/00000015', 1, 1, 1, 2, 2, 4, 'LOGROS LENGUA Y LITERATURA 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS LENGUAJE BASICA', 0, NULL, NULL, '0.0000', NULL),
(83, '22023/00000015', 1, 1, 1, 2, 2, 10, 'LOGROS MATEMÁTICAS 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CMATEMATICAS SEGUNDO', 0, NULL, NULL, '0.0000', NULL),
(84, '22023/00000015', 1, 0, 7, 2, 2, 85, 'REFUERZO ESCOLAR 2', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 2', 0, NULL, NULL, '0.0000', NULL),
(85, '22023/00000016', 1, 0, 4, 2, 2, 93, 'LEARNING ZONE SB + ONLINE 3', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING ZONE 3', 0, NULL, NULL, '0.0000', NULL),
(86, '22023/00000016', 1, 1, 1, 2, 2, 24, 'LOGROS CIENCIAS NATURALES 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS NATURALES 4', 0, NULL, NULL, '0.0000', NULL),
(87, '22023/00000016', 1, 1, 1, 2, 2, 33, 'LOGROS ESTUDIOS SOCIALES 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 4', 0, NULL, NULL, '0.0000', NULL),
(88, '22023/00000016', 1, 1, 1, 2, 2, 6, 'LOGROS LENGUA Y LITERATURA 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 4', 0, NULL, NULL, '0.0000', NULL),
(89, '22023/00000016', 1, 1, 1, 2, 2, 12, 'LOGROS MATEMÁTICAS 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 4', 0, NULL, NULL, '0.0000', NULL),
(90, '22023/00000016', 1, 0, 7, 2, 2, 87, 'REFUERZO ESCOLAR 4', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 4', 0, NULL, NULL, '0.0000', NULL),
(91, '22023/00000017', 1, 0, 4, 2, 2, 83, 'EVERYDAY ENGLISH 1', '45.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '21.0000', '45.0000', 'CEVERYDAY 1', 0, NULL, NULL, '0.0000', NULL),
(92, '22023/00000017', 1, 1, 1, 2, 2, 2, 'KIT DESCUBRE Y APRENDE CON GUCHITO 4 - 5 AÑOS + PLATAFORMA', '40.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '20.0000', '40.0000', 'CGUCHITO 4-5AÑOS', 0, NULL, NULL, '0.0000', NULL),
(93, '22023/00000018', 1, 0, 4, 2, 2, 95, 'LEARNING ZONE SB + ONLINE 5', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING ZONE 5', 0, NULL, NULL, '0.0000', NULL),
(94, '22023/00000018', 1, 1, 1, 2, 2, 26, 'LOGROS CIENCIAS NATURALES 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS NATURALES 6', 0, NULL, NULL, '0.0000', NULL),
(95, '22023/00000018', 1, 1, 1, 2, 2, 35, 'LOGROS ESTUDIOS SOCIALES 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 6', 0, NULL, NULL, '0.0000', NULL),
(96, '22023/00000018', 1, 1, 1, 2, 2, 8, 'LOGROS LENGUA Y LITERATURA 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 6', 0, NULL, NULL, '0.0000', NULL),
(97, '22023/00000018', 1, 1, 1, 2, 2, 14, 'LOGROS MATEMÁTICAS 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS ', 0, NULL, NULL, '0.0000', NULL),
(98, '22023/00000018', 1, 0, 7, 2, 2, 89, 'REFUERZO ESCOLAR 6', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 6', 0, NULL, NULL, '0.0000', NULL),
(99, '22023/00000019', 1, 0, 4, 2, 2, 102, 'LEARNING ZONE SB + ONLINE 6', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '22.0000', '46.0000', 'CLEARNING ZONE 6', 0, NULL, NULL, '0.0000', NULL),
(100, '22023/00000019', 1, 1, 1, 2, 2, 27, 'LOGROS CIENCIAS NATURALES 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS 7', 0, NULL, NULL, '0.0000', NULL),
(101, '22023/00000019', 1, 1, 1, 2, 2, 36, 'LOGROS ESTUDIOS SOCIALES 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CSOCIALES 7', 0, NULL, NULL, '0.0000', NULL),
(102, '22023/00000019', 1, 1, 1, 2, 2, 9, 'LOGROS LENGUA Y LITERATURA 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CHUVGH', 0, NULL, NULL, '0.0000', NULL),
(103, '22023/00000019', 1, 1, 1, 2, 2, 15, 'LOGROS MATEMÁTICAS 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 7', 0, NULL, NULL, '0.0000', NULL),
(104, '22023/00000019', 1, 0, 7, 2, 2, 90, 'REFUERZO ESCOLAR 7', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 7', 0, NULL, NULL, '0.0000', NULL),
(105, '22023/00000020', 1, 0, 4, 2, 2, 102, 'LEARNING ZONE SB + ONLINE 6', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '22.0000', '46.0000', 'CLEARNING ZONE 6', 0, NULL, NULL, '0.0000', NULL),
(106, '22023/00000020', 1, 1, 1, 2, 2, 27, 'LOGROS CIENCIAS NATURALES 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS 7', 0, NULL, NULL, '0.0000', NULL),
(107, '22023/00000020', 1, 1, 1, 2, 2, 36, 'LOGROS ESTUDIOS SOCIALES 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CSOCIALES 7', 0, NULL, NULL, '0.0000', NULL),
(108, '22023/00000020', 1, 1, 1, 2, 2, 9, 'LOGROS LENGUA Y LITERATURA 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CHUVGH', 0, NULL, NULL, '0.0000', NULL),
(109, '22023/00000020', 1, 1, 1, 2, 2, 15, 'LOGROS MATEMÁTICAS 7 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 7', 0, NULL, NULL, '0.0000', NULL),
(110, '22023/00000020', 1, 0, 7, 2, 2, 90, 'REFUERZO ESCOLAR 7', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 7', 0, NULL, NULL, '0.0000', NULL),
(111, '22023/00000021', 1, 0, 4, 2, 2, 97, 'ELLEVATE ENGLISH TEEN  SB FULL 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '22.0000', '46.0000', 'CDAS INGLES ELLEVATE 2', 0, NULL, NULL, '0.0000', NULL),
(112, '22023/00000021', 1, 1, 1, 2, 2, 29, 'LOGROS CIENCIAS NATURALES 9 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS 9', 0, NULL, NULL, '0.0000', NULL),
(113, '22023/00000021', 1, 1, 1, 2, 2, 38, 'LOGROS ESTUDIOS SOCIALES 9 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 9', 0, NULL, NULL, '0.0000', NULL),
(114, '22023/00000021', 1, 1, 1, 2, 2, 17, 'LOGROS LENGUA Y LITERATURA 9 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 9', 0, NULL, NULL, '0.0000', NULL),
(115, '22023/00000021', 2, 0, 1, 2, 2, 105, 'MI TUTORIAL DIGITAL MATEMATICAS 9', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL 9', 0, NULL, NULL, '0.0000', NULL),
(116, '22023/00000022', 1, 0, 4, 2, 2, 92, 'LEARNING ZONE SB + ONLINE 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES 2', 0, NULL, NULL, '0.0000', NULL),
(117, '22023/00000022', 1, 1, 1, 2, 2, 23, 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS CIENCIAS', 0, NULL, NULL, '0.0000', NULL),
(118, '22023/00000022', 1, 1, 1, 2, 2, 32, 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 3', 0, NULL, NULL, '0.0000', NULL),
(119, '22023/00000022', 1, 1, 1, 2, 2, 5, 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 3BASICA', 0, NULL, NULL, '0.0000', NULL),
(120, '22023/00000022', 1, 1, 1, 2, 2, 11, 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 3', 0, NULL, NULL, '0.0000', NULL),
(121, '22023/00000022', 1, 0, 7, 2, 2, 86, 'REFUERZO ESCOLAR 3', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 3', 0, NULL, NULL, '0.0000', NULL),
(122, '22023/00000023', 1, 0, 4, 2, 2, 95, 'LEARNING ZONE SB + ONLINE 5', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING ZONE 5', 0, NULL, NULL, '0.0000', NULL),
(123, '22023/00000023', 1, 1, 1, 2, 2, 26, 'LOGROS CIENCIAS NATURALES 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS NATURALES 6', 0, NULL, NULL, '0.0000', NULL),
(124, '22023/00000023', 1, 1, 1, 2, 2, 35, 'LOGROS ESTUDIOS SOCIALES 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 6', 0, NULL, NULL, '0.0000', NULL),
(125, '22023/00000023', 1, 1, 1, 2, 2, 8, 'LOGROS LENGUA Y LITERATURA 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 6', 0, NULL, NULL, '0.0000', NULL),
(126, '22023/00000023', 1, 1, 1, 2, 2, 14, 'LOGROS MATEMÁTICAS 6 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS ', 0, NULL, NULL, '0.0000', NULL),
(127, '22023/00000023', 1, 0, 7, 2, 2, 89, 'REFUERZO ESCOLAR 6', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 6', 0, NULL, NULL, '0.0000', NULL),
(128, '22023/00000024', 1, 0, 4, 2, 2, 93, 'LEARNING ZONE SB + ONLINE 3', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING ZONE 3', 0, NULL, NULL, '0.0000', NULL),
(129, '22023/00000024', 1, 1, 1, 2, 2, 24, 'LOGROS CIENCIAS NATURALES 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS NATURALES 4.', 0, NULL, NULL, '0.0000', NULL),
(130, '22023/00000024', 1, 1, 1, 2, 2, 33, 'LOGROS ESTUDIOS SOCIALES 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 4', 0, NULL, NULL, '0.0000', NULL),
(131, '22023/00000024', 1, 1, 1, 2, 2, 6, 'LOGROS LENGUA Y LITERATURA 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 4', 0, NULL, NULL, '0.0000', NULL),
(132, '22023/00000024', 1, 1, 1, 2, 2, 12, 'LOGROS MATEMÁTICAS 4 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 4', 0, NULL, NULL, '0.0000', NULL),
(133, '22023/00000024', 1, 0, 7, 2, 2, 87, 'REFUERZO ESCOLAR 4', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 4', 0, NULL, NULL, '0.0000', NULL),
(141, '22023/00000025', 1, 0, 4, 2, 2, 101, 'ELLEVATE ENGLISH TEEN  SB FULL 6 COTOPAXI', '54.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '22.0000', '54.0000', 'CELLEVATE FULL 6', 0, NULL, NULL, '0.0000', NULL),
(142, '22023/00000025', 1, 1, 1, 2, 2, 57, 'LOGROS BIOLOGÍA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CBIOLOGIA 3', 0, NULL, NULL, '0.0000', NULL),
(143, '22023/00000025', 1, 1, 1, 2, 2, 60, 'LOGROS HISTORIA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CHISTORIA 3BGU', 0, NULL, NULL, '0.0000', NULL),
(144, '22023/00000025', 1, 1, 1, 2, 2, 54, 'LOGROS LENGUA Y LITERATURA 3 BACH + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CINVENTARIO DAS', 0, NULL, NULL, '0.0000', NULL),
(145, '22023/00000025', 2, 0, 1, 2, 2, 104, 'MI TUTORIAL DIGITAL FISICA 3 BGU', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL FISICA 3BGU', 0, NULL, NULL, '0.0000', NULL),
(146, '22023/00000025', 2, 0, 1, 2, 2, 109, 'MI TUTORIAL DIGITAL MATEMATICAS 3 BGU', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL MATEMATICAS 3BGU', 0, NULL, NULL, '0.0000', NULL),
(147, '22023/00000025', 1, 1, 1, 2, 2, 78, 'MI TUTORIAL DIGITAL QUIMICA 3BGU', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL 3BGU', 0, NULL, NULL, '0.0000', NULL),
(148, '22023/00000026', 1, 0, 4, 2, 2, 100, 'ELLEVATE ENGLISH TEEN  SB FULL 5 COTOPAXI', '54.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '22.0000', '54.0000', 'CELLEVATE FULL 5', 0, NULL, NULL, '0.0000', NULL),
(149, '22023/00000026', 1, 1, 1, 2, 2, 59, 'LOGROS HISTORIA 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS HISTORIA 2', 0, NULL, NULL, '0.0000', NULL),
(150, '22023/00000026', 1, 1, 1, 2, 2, 53, 'LOGROS LENGUA Y LITERATURA 2 BACH + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 2BGU', 0, NULL, NULL, '0.0000', NULL),
(151, '22023/00000026', 2, 0, 1, 2, 2, 103, 'MI TUTORIAL DIGITAL FISICA 2 BGU', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL FISICA 2BGU', 0, NULL, NULL, '0.0000', NULL),
(152, '22023/00000026', 2, 0, 1, 2, 2, 108, 'MI TUTORIAL DIGITAL MATEMATICAS 2 BGU', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL MATEMATICAS 2BGU', 0, NULL, NULL, '0.0000', NULL),
(153, '22023/00000026', 2, 0, 1, 2, 2, 111, 'MI TUTORIAL DIGITAL QUIMICA 2BGU', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL 2BGU', 0, NULL, NULL, '0.0000', NULL),
(154, '22023/00000026', 1, 1, 1, 2, 2, 56, 'LOGROS BIOLOGÍA 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS BIOLOGIA 2', 0, NULL, NULL, '0.0000', NULL),
(155, '22023/00000027', 1, 0, 4, 2, 2, 84, 'EVERYDAY INGLISH 2', '45.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '21.0000', '45.0000', 'CEVERYDAY 2', 0, NULL, NULL, '0.0000', NULL),
(156, '22023/00000027', 1, 1, 1, 2, 2, 3, 'KIT CREA Y APRENDE CON GUCHITO (PRIMERO DE BÁSICA)+ PLATAFORMA', '40.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '20.0000', '40.0000', 'CGUCHITO PREPARATORIA', 0, NULL, NULL, '0.0000', NULL),
(157, '22023/00000028', 1, 0, 4, 2, 2, 94, 'LEARNING ZONE SB + ONLINE 4', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CLEARNING 4', 0, NULL, NULL, '0.0000', NULL),
(158, '22023/00000028', 1, 1, 1, 2, 2, 25, 'LOGROS CIENCIAS NATURALES 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS NATURALES 5', 0, NULL, NULL, '0.0000', NULL),
(159, '22023/00000028', 1, 1, 1, 2, 2, 34, 'LOGROS ESTUDIOS SOCIALES 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CSOCIALES 5', 0, NULL, NULL, '0.0000', NULL),
(160, '22023/00000028', 1, 1, 1, 2, 2, 7, 'LOGROS LENGUA Y LITERATURA 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 5', 0, NULL, NULL, '0.0000', NULL),
(161, '22023/00000028', 1, 1, 1, 2, 2, 13, 'LOGROS MATEMÁTICAS 5 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 5', 0, NULL, NULL, '0.0000', NULL),
(162, '22023/00000028', 1, 0, 7, 2, 2, 88, 'REFUERZO ESCOLAR 5', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 5', 0, NULL, NULL, '0.0000', NULL),
(163, '22023/00000029', 1, 0, 4, 2, 2, 92, 'LEARNING ZONE SB + ONLINE 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES 2', 0, NULL, NULL, '0.0000', NULL),
(164, '22023/00000029', 1, 1, 1, 2, 2, 23, 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS CIENCIAS', 0, NULL, NULL, '0.0000', NULL),
(165, '22023/00000029', 1, 1, 1, 2, 2, 32, 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 3', 0, NULL, NULL, '0.0000', NULL),
(166, '22023/00000029', 1, 1, 1, 2, 2, 5, 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 3BASICA', 0, NULL, NULL, '0.0000', NULL),
(167, '22023/00000029', 1, 1, 1, 2, 2, 11, 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 3', 0, NULL, NULL, '0.0000', NULL),
(168, '22023/00000029', 1, 0, 7, 2, 2, 86, 'REFUERZO ESCOLAR 3', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 3', 0, NULL, NULL, '0.0000', NULL),
(169, '22023/00000030', 1, 0, 4, 2, 2, 91, 'LEARNING ZONE SB + ONLINE 1', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES', 0, NULL, NULL, '0.0000', NULL),
(170, '22023/00000030', 1, 1, 1, 2, 2, 22, 'LOGROS CIENCIAS NATURALES 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CCIENCIAS NATURALES 2', 0, NULL, NULL, '0.0000', NULL),
(171, '22023/00000030', 1, 1, 1, 2, 2, 31, 'LOGROS ESTUDIOS SOCIALES 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES SEGUNDO', 0, NULL, NULL, '0.0000', NULL),
(172, '22023/00000030', 1, 1, 1, 2, 2, 10, 'LOGROS MATEMÁTICAS 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CMATEMATICAS SEGUNDO', 0, NULL, NULL, '0.0000', NULL),
(173, '22023/00000030', 1, 0, 7, 2, 2, 85, 'REFUERZO ESCOLAR 2', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 2', 0, NULL, NULL, '0.0000', NULL),
(174, '22023/00000030', 1, 1, 1, 2, 2, 4, 'LOGROS LENGUA Y LITERATURA 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS LENGUAJE BASICA', 0, NULL, NULL, '0.0000', NULL),
(175, '22023/00000031', 1, 0, 4, 2, 2, 92, 'LEARNING ZONE SB + ONLINE 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '27.0000', '46.0000', 'CDAS INGLES 2', 0, NULL, NULL, '0.0000', NULL),
(176, '22023/00000031', 1, 1, 1, 2, 2, 23, 'LOGROS CIENCIAS NATURALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CDAS LOGROS CIENCIAS', 0, NULL, NULL, '0.0000', NULL),
(177, '22023/00000031', 1, 1, 1, 2, 2, 32, 'LOGROS ESTUDIOS SOCIALES 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 3', 0, NULL, NULL, '0.0000', NULL),
(178, '22023/00000031', 1, 1, 1, 2, 2, 5, 'LOGROS LENGUA Y LITERATURA 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 3BASICA', 0, NULL, NULL, '0.0000', NULL),
(179, '22023/00000031', 1, 1, 1, 2, 2, 11, 'LOGROS MATEMÁTICAS 3 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS MATEMATICAS 3', 0, NULL, NULL, '0.0000', NULL),
(180, '22023/00000031', 1, 0, 7, 2, 2, 86, 'REFUERZO ESCOLAR 3', '10.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.5000', '10.0000', 'CREFUERZO ESCOLAR 3', 0, NULL, NULL, '0.0000', NULL),
(181, '22023/00000032', 1, 0, 4, 2, 2, 97, 'ELLEVATE ENGLISH TEEN  SB FULL 2', '46.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '22.0000', '46.0000', 'CDAS INGLES ELLEVATE 2', 0, NULL, NULL, '0.0000', NULL),
(182, '22023/00000032', 1, 1, 1, 2, 2, 29, 'LOGROS CIENCIAS NATURALES 9 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS CIENCIAS 9', 0, NULL, NULL, '0.0000', NULL),
(183, '22023/00000032', 1, 1, 1, 2, 2, 38, 'LOGROS ESTUDIOS SOCIALES 9 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS SOCIALES 9', 0, NULL, NULL, '0.0000', NULL),
(184, '22023/00000032', 1, 1, 1, 2, 2, 17, 'LOGROS LENGUA Y LITERATURA 9 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS LENGUAJE 9', 0, NULL, NULL, '0.0000', NULL),
(185, '22023/00000032', 2, 0, 1, 2, 2, 105, 'MI TUTORIAL DIGITAL MATEMATICAS 9', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL 9', 0, NULL, NULL, '0.0000', NULL),
(186, '22023/00000032', 1, 0, 4, 2, 2, 100, 'ELLEVATE ENGLISH TEEN  SB FULL 5 COTOPAXI', '54.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '22.0000', '54.0000', 'CELLEVATE FULL 5', 0, NULL, NULL, '0.0000', NULL),
(187, '22023/00000032', 1, 1, 1, 2, 2, 59, 'LOGROS HISTORIA 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS HISTORIA 2', 0, NULL, NULL, '0.0000', NULL),
(188, '22023/00000032', 1, 1, 1, 2, 2, 53, 'LOGROS LENGUA Y LITERATURA 2 BACH + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLENGUAJE 2BGU', 0, NULL, NULL, '0.0000', NULL),
(189, '22023/00000032', 1, 1, 1, 2, 2, 56, 'LOGROS BIOLOGÍA 2 + PLATAFORMA', '27.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '10.8000', '27.0000', 'CLOGROS BIOLOGIA 2', 0, NULL, NULL, '0.0000', NULL),
(190, '22023/00000032', 2, 0, 1, 2, 2, 103, 'MI TUTORIAL DIGITAL FISICA 2 BGU', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL FISICA 2BGU', 0, NULL, NULL, '0.0000', NULL),
(191, '22023/00000032', 2, 0, 1, 2, 2, 108, 'MI TUTORIAL DIGITAL MATEMATICAS 2 BGU', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL MATEMATICAS 2BGU', 0, NULL, NULL, '0.0000', NULL),
(192, '22023/00000032', 2, 0, 1, 2, 2, 111, 'MI TUTORIAL DIGITAL QUIMICA 2BGU', '15.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '6.0000', '15.0000', 'CMI TUTORIAL DIGITAL 2BGU', 0, NULL, NULL, '0.0000', NULL),
(193, '22023/00000033', 1, 0, 4, 2, 2, 83, 'EVERYDAY ENGLISH 1', '45.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '21.0000', '45.0000', 'CEVERYDAY 1', 0, NULL, NULL, '0.0000', NULL),
(194, '22023/00000033', 1, 1, 1, 2, 2, 2, 'KIT DESCUBRE Y APRENDE CON GUCHITO 4 - 5 AÑOS + PLATAFORMA', '40.0000', '0.0000', '0.0000', 'inclusive', 2, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '20.0000', '40.0000', 'CGUCHITO 4-5AÑOS', 0, NULL, NULL, '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price`
--

CREATE TABLE `selling_price` (
  `price_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT 0.0000,
  `interest_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `interest_percentage` int(11) NOT NULL DEFAULT 0,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `total_purchase_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `shipping_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) DEFAULT 0.0000,
  `others_charge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable_amount` decimal(25,4) DEFAULT NULL,
  `paid_amount` decimal(25,4) NOT NULL,
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `due_paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_amount` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `balance` decimal(25,4) DEFAULT 0.0000,
  `profit` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `previous_due` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `prev_due_paid` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `selling_price`
--

INSERT INTO `selling_price` (`price_id`, `invoice_id`, `store_id`, `subtotal`, `discount_type`, `discount_amount`, `interest_amount`, `interest_percentage`, `item_tax`, `order_tax`, `cgst`, `sgst`, `igst`, `total_purchase_price`, `shipping_type`, `shipping_amount`, `others_charge`, `payable_amount`, `paid_amount`, `due`, `due_paid`, `return_amount`, `balance`, `profit`, `previous_due`, `prev_due_paid`) VALUES
(1, '22023/00000001', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '6.0000', '87.3000', '0.0000', '0.0000'),
(2, '22023/00000002', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(3, '22023/00000003', 2, '85.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '41.0000', 'plain', '0.0000', '0.0000', '85.0000', '85.0000', '0.0000', '0.0000', '0.0000', '0.0000', '44.0000', '0.0000', '0.0000'),
(4, '22023/00000004', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(5, '22023/00000005', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '6.0000', '87.3000', '0.0000', '0.0000'),
(6, '22023/00000006', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(7, '22023/00000007', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(8, '22023/00000008', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(9, '22023/00000009', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '71.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '92.3000', '0.0000', '0.0000'),
(10, '22023/00000010', 2, '306.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '137.1000', 'plain', '0.0000', '0.0000', '306.0000', '306.0000', '0.0000', '0.0000', '0.0000', '0.0000', '168.9000', '0.0000', '0.0000'),
(11, '22023/00000011', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(12, '22023/00000012', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(13, '22023/00000013', 2, '85.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '41.0000', 'plain', '0.0000', '0.0000', '85.0000', '85.0000', '0.0000', '0.0000', '0.0000', '0.0000', '44.0000', '0.0000', '0.0000'),
(14, '22023/00000014', 2, '1417.5000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '748.8000', 'plain', '0.0000', '0.0000', '1417.5000', '1417.5000', '0.0000', '0.0000', '0.0000', '0.0000', '668.7000', '0.0000', '0.0000'),
(15, '22023/00000015', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '6.0000', '87.3000', '0.0000', '0.0000'),
(16, '22023/00000016', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '6.0000', '87.3000', '0.0000', '0.0000'),
(17, '22023/00000017', 2, '85.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '41.0000', 'plain', '0.0000', '0.0000', '85.0000', '85.0000', '0.0000', '0.0000', '0.0000', '0.0000', '44.0000', '0.0000', '0.0000'),
(18, '22023/00000018', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(19, '22023/00000019', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '71.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '92.3000', '0.0000', '0.0000'),
(20, '22023/00000020', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '71.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '92.3000', '0.0000', '0.0000'),
(21, '22023/00000021', 2, '142.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '60.4000', 'plain', '0.0000', '0.0000', '142.0000', '142.0000', '0.0000', '0.0000', '0.0000', '8.0000', '81.6000', '0.0000', '0.0000'),
(22, '22023/00000022', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '16.0000', '87.3000', '0.0000', '0.0000'),
(23, '22023/00000023', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '6.0000', '87.3000', '0.0000', '0.0000'),
(24, '22023/00000024', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(26, '22023/00000025', 2, '180.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '72.4000', 'plain', '0.0000', '0.0000', '180.0000', '180.0000', '0.0000', '0.0000', '0.0000', '0.0000', '107.6000', '0.0000', '0.0000'),
(27, '22023/00000026', 2, '180.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '72.4000', 'plain', '0.0000', '0.0000', '180.0000', '180.0000', '0.0000', '0.0000', '0.0000', '0.0000', '107.6000', '0.0000', '0.0000'),
(28, '22023/00000027', 2, '85.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '41.0000', 'plain', '0.0000', '0.0000', '85.0000', '85.0000', '0.0000', '0.0000', '0.0000', '15.0000', '44.0000', '0.0000', '0.0000'),
(29, '22023/00000028', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '6.0000', '87.3000', '0.0000', '0.0000'),
(30, '22023/00000029', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(31, '22023/00000030', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(32, '22023/00000031', 2, '164.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '76.7000', 'plain', '0.0000', '0.0000', '164.0000', '164.0000', '0.0000', '0.0000', '0.0000', '0.0000', '87.3000', '0.0000', '0.0000'),
(33, '22023/00000032', 2, '322.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '132.8000', 'plain', '0.0000', '0.0000', '322.0000', '322.0000', '0.0000', '0.0000', '0.0000', '0.0000', '189.2000', '0.0000', '0.0000'),
(34, '22023/00000033', 2, '85.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '41.0000', 'plain', '0.0000', '0.0000', '85.0000', '85.0000', '0.0000', '0.0000', '0.0000', '0.0000', '44.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sell_logs`
--

CREATE TABLE `sell_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `college_id` int(10) UNSIGNED DEFAULT NULL,
  `reference_no` varchar(55) DEFAULT NULL,
  `ref_invoice_id` varchar(55) DEFAULT NULL,
  `type` varchar(55) NOT NULL,
  `pmethod_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `store_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `sell_logs`
--

INSERT INTO `sell_logs` (`id`, `customer_id`, `college_id`, `reference_no`, `ref_invoice_id`, `type`, `pmethod_id`, `description`, `amount`, `store_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'CT230802200001', '22023/00000001', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 11:21:03', NULL),
(2, 4, 2, 'CT2308022002', '22023/00000002', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 11:28:33', NULL),
(3, 5, 2, 'CT23080222003', '22023/00000003', 'sell', 1, 'Paid while selling', '85.0000', 2, 6, '2023-08-02 11:31:26', NULL),
(4, 1, 2, 'CT23080222004', '22023/00000004', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 11:32:36', NULL),
(5, 6, 2, 'CT23080222005', '22023/00000005', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 11:36:25', NULL),
(6, 7, 2, 'CT23080222006', '22023/00000006', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 11:38:24', NULL),
(7, 8, 2, 'CT23080222007', '22023/00000007', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 11:40:41', NULL),
(8, 9, 2, 'CT23080222008', '22023/00000008', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 11:43:07', NULL),
(9, 10, 2, 'CT23080222009', '22023/00000009', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 11:44:19', NULL),
(10, 11, 2, 'CT23080222010', '22023/00000010', 'sell', 1, 'Paid while selling', '306.0000', 2, 6, '2023-08-02 11:50:32', NULL),
(11, 12, 2, 'CT23080222011', '22023/00000011', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 11:57:23', NULL),
(12, 13, 2, 'CT23080222012', '22023/00000012', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-02 12:07:02', NULL),
(13, 14, 2, 'CT23080222013', '22023/00000013', 'sell', 1, 'Paid while selling', '85.0000', 2, 6, '2023-08-02 12:08:41', NULL),
(14, 1, 4, 'CT23080222014', '22023/00000014', 'sell', 1, 'Paid while selling', '1417.5000', 2, 6, '2023-08-02 12:18:19', NULL),
(15, 15, 2, 'CT23080322015', '22023/00000015', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-03 10:26:48', NULL),
(16, 16, 2, 'CT23080322016', '22023/00000016', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-03 10:58:55', NULL),
(17, 17, 2, 'CT23080322017', '22023/00000017', 'sell', 1, 'Paid while selling', '85.0000', 2, 6, '2023-08-03 13:54:55', NULL),
(18, 18, 2, 'CT23080322018', '22023/00000018', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-03 14:56:44', NULL),
(19, 19, 2, 'CT23080422019', '22023/00000019', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-04 11:19:57', NULL),
(20, 20, 2, 'CT23080422020', '22023/00000020', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-04 13:36:29', NULL),
(21, 21, 2, 'CT23080422021', '22023/00000021', 'sell', 1, 'Paid while selling', '142.0000', 2, 6, '2023-08-04 14:40:26', NULL),
(22, 22, 2, 'CT23080422022', '22023/00000022', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-04 15:09:58', NULL),
(23, 23, 2, 'CT23080522023', '22023/00000023', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-05 12:01:57', NULL),
(24, 24, 2, 'CT23080522024', '22023/00000024', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-05 12:30:13', NULL),
(25, 24, 2, 'CT23080522025', '22023/00000025', 'sell', 1, 'Paid while selling', '192.0000', 2, 6, '2023-08-05 12:34:42', NULL),
(26, 24, 2, 'CT23080522026', '22023/00000025', 'sell', 1, 'Paid while selling', '180.0000', 2, 6, '2023-08-05 14:12:07', NULL),
(27, 25, 2, 'CT23080522027', '22023/00000026', 'sell', 1, 'Paid while selling', '180.0000', 2, 6, '2023-08-05 14:24:32', NULL),
(28, 26, 2, 'CT23080722028', '22023/00000027', 'sell', 1, 'Paid while selling', '85.0000', 2, 6, '2023-08-07 12:26:37', NULL),
(29, 27, 2, 'CT23080722029', '22023/00000028', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-07 14:45:35', NULL),
(30, 1, 2, 'CT23080722030', '22023/00000029', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-07 15:41:35', NULL),
(31, 28, 2, 'CT23080822031', '22023/00000030', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-08 10:23:06', NULL),
(32, 29, 2, 'CT23080822032', '22023/00000031', 'sell', 1, 'Paid while selling', '164.0000', 2, 6, '2023-08-08 10:47:23', NULL),
(33, 30, 2, 'CT23080822033', '22023/00000032', 'sell', 1, 'Paid while selling', '322.0000', 2, 6, '2023-08-08 11:47:40', NULL),
(34, 31, 2, 'CT23080822034', '22023/00000033', 'sell', 1, 'Paid while selling', '85.0000', 2, 6, '2023-08-08 12:39:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `version` varchar(10) NOT NULL,
  `is_update_available` tinyint(1) NOT NULL DEFAULT 0,
  `update_version` varchar(100) DEFAULT NULL,
  `update_link` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `version`, `is_update_available`, `update_version`, `update_link`, `created_at`, `updated_at`) VALUES
(1, '3.0', 0, '', '', '2018-09-14 18:00:00', '2019-06-12 15:34:18');

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_links`
--

CREATE TABLE `shortcut_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `href` text DEFAULT NULL,
  `target` varchar(100) NOT NULL DEFAULT '_self',
  `title` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `thumbnail` text DEFAULT NULL,
  `permission_slug` varchar(50) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `shortcut_links`
--

INSERT INTO `shortcut_links` (`id`, `type`, `href`, `target`, `title`, `icon`, `thumbnail`, `permission_slug`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'report', '/admin/report_overview.php', '', 'Informe General', 'fa-angle-right', '', 'read_overview_report', 1, 1, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(2, 'report', '/admin/report_collection.php', '', 'Informe de Colleción', 'fa-angle-right', '', 'read_collection_report', 1, 2, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(3, 'report', '/admin/report_customer_due_collection.php', '', 'Informe de Cobro Vencido', 'fa-angle-right', '', 'read_customer_due_collection_report', 1, 3, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(4, 'report', '/admin/report_supplier_due_paid.php', '', 'Informe de Pagos Vencidos', 'fa-angle-right', '', 'read_supplier_due_paid_report', 1, 4, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(5, 'report', '/admin/report_sell_itemwise.php', '', 'Informe de Ventas', 'fa-angle-right', '', 'read_sell_report', 1, 5, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(6, 'report', '/admin/report_purchase_supplierwise.php', '', 'Informe de Compras', 'fa-angle-right', '', 'read_purchase_report', 1, 6, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(7, 'report', '/admin/report_sell_payment.php', '', 'Informe de Pago de Venta', 'fa-angle-right', '', 'read_sell_payment_report', 1, 7, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(8, 'report', '/admin/report_purchase_payment.php', '', 'Informe de Pago de Compra', 'fa-angle-right', '', 'read_purchase_payment_report', 1, 8, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(9, 'report', '/admin/report_sell_tax.php', '', 'Informe de Impuesto de Venta', 'fa-angle-right', '', 'read_sell_tax_report', 1, 9, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(10, 'report', '/admin/report_purchase_tax.php', '', 'Informe de Impuesto de Compra', 'fa-angle-right', '', 'read_purchase_tax_report', 1, 10, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(11, 'report', '/admin/report_tax_overview.php', '', 'Informe General de Impuesto', 'fa-angle-right', '', 'read_tax_overview_report', 1, 11, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(12, 'report', '/admin/report_stock.php', '', 'Informe de Stock', 'fa-angle-right', '', 'read_stock_report', 1, 12, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(13, 'report', '/admin/bank_transactions.php', '', 'Transacción Bancaria', 'fa-angle-right', '', 'read_bank_transactions', 1, 13, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(14, 'report', '/admin/bank_account_sheet.php', '', 'Hoja de Balance', 'fa-angle-right', '', 'read_bank_account_sheet', 1, 14, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(15, 'report', '/admin/income_monthwise.php', '', 'Informe de Ingresos Mensuales', 'fa-angle-right', '', 'read_income_monthwise', 1, 15, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(16, 'report', '/admin/report_income_and_expense.php', '', 'Informe de Ingresos y Gastos', 'fa-angle-right', '', 'read_income_and_expense_report', 1, 16, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(17, 'report', '/admin/report_profit_and_loss.php', '', 'Informe de Pérdidad y Ganancias', 'fa-angle-right', '', 'read_profit_and_loss_report', 1, 17, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(18, 'report', '/admin/report_cashbook.php', '', 'Libro de Pago', 'fa-angle-right', '', 'read_cashbook_report', 1, 18, '2019-02-03 12:00:00', '2019-07-01 03:59:30'),
(19, 'report', '/admin/expense_monthwise.php', '', 'Informe de Gastos Mensuales', 'fa-angle-right', '', 'read_income_monthwise', 1, 15, '2019-02-03 12:00:00', '2019-07-01 03:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `sms_schedule`
--

CREATE TABLE `sms_schedule` (
  `id` int(10) UNSIGNED NOT NULL,
  `schedule_datetime` datetime DEFAULT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `people_type` varchar(100) DEFAULT NULL,
  `people_sms_type` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `people_name` varchar(100) NOT NULL,
  `sms_text` text DEFAULT NULL,
  `sms_type` varchar(50) NOT NULL DEFAULT 'TEXT',
  `campaign_name` varchar(100) DEFAULT NULL,
  `process_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `total_try` int(11) NOT NULL DEFAULT 0,
  `response_text` varchar(250) DEFAULT NULL,
  `delivery_status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_setting`
--

CREATE TABLE `sms_setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `api_id` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) DEFAULT NULL,
  `sender_id` varchar(100) NOT NULL,
  `contact` text DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `maskname` varchar(100) DEFAULT NULL,
  `campaignname` varchar(100) DEFAULT NULL,
  `unicode` varchar(20) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `sms_setting`
--

INSERT INTO `sms_setting` (`id`, `type`, `api_id`, `auth_key`, `sender_id`, `contact`, `username`, `password`, `maskname`, `campaignname`, `unicode`, `country_code`, `url`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Clickatell', NULL, '', '', '', NULL, NULL, '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', '2019-07-02 16:23:32'),
(2, 'Twilio', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', '2019-07-02 16:23:16'),
(3, 'Msg91', '', '', '', '', '', '', '', '', '', '', 'http://api.msg91.com/api/v2/', 1, 0, '0000-00-00 00:00:00', '2019-07-02 16:23:17'),
(4, 'Onnorokomsms', '', '', '', '', '', '', '', '', '', '', 'https://api2.onnorokomsms.com/HttpSendSms.ashx?', 1, 0, '0000-00-00 00:00:00', '2019-07-02 16:23:19'),
(5, 'Mimsms', '', '', '', '', '', '', '', '', '', '', 'https://www.mimsms.com.bd/smsAPI?', 1, 0, '0000-00-00 00:00:00', '2019-07-02 16:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `code_name` varchar(55) DEFAULT NULL,
  `mobile` varchar(14) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `currency` varchar(100) NOT NULL DEFAULT 'USD',
  `vat_reg_no` varchar(250) DEFAULT NULL,
  `cashier_id` int(10) UNSIGNED NOT NULL,
  `address` longtext DEFAULT NULL,
  `receipt_printer` varchar(100) DEFAULT NULL,
  `cash_drawer_codes` varchar(100) DEFAULT NULL,
  `char_per_line` tinyint(4) NOT NULL DEFAULT 42,
  `remote_printing` tinyint(1) NOT NULL DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(100) DEFAULT NULL,
  `auto_print` tinyint(1) NOT NULL DEFAULT 0,
  `local_printers` tinyint(1) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `favicon` varchar(250) DEFAULT NULL,
  `preference` longtext DEFAULT NULL,
  `sound_effect` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `feedback_status` varchar(100) NOT NULL DEFAULT 'ready',
  `feedback_at` datetime DEFAULT NULL,
  `deposit_account_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `name`, `code_name`, `mobile`, `email`, `country`, `zip_code`, `currency`, `vat_reg_no`, `cashier_id`, `address`, `receipt_printer`, `cash_drawer_codes`, `char_per_line`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `logo`, `favicon`, `preference`, `sound_effect`, `sort_order`, `feedback_status`, `feedback_at`, `deposit_account_id`, `thumbnail`, `status`, `created_at`) VALUES
(1, 'AGENCIA CENTRAL', 'agencia_central', '231321', 'polorenan@hotmail.com', 'EC', '1200', 'USD', '', 3, 'LA LIBERTAD', '1', NULL, 42, 0, 1, '[\"1\"]', 1, 1, '1_logo.jpg', '1_favicon.png', 'a:32:{s:10:\"gst_reg_no\";s:0:\"\";s:8:\"timezone\";s:12:\"America/Lima\";s:21:\"invoice_edit_lifespan\";s:4:\"1440\";s:26:\"invoice_edit_lifespan_unit\";s:6:\"minute\";s:23:\"invoice_delete_lifespan\";s:4:\"1440\";s:28:\"invoice_delete_lifespan_unit\";s:6:\"minute\";s:3:\"tax\";s:1:\"0\";s:11:\"sms_gateway\";s:10:\"Clickatell\";s:9:\"sms_alert\";s:1:\"0\";s:24:\"expiring_soon_alert_days\";s:0:\"\";s:20:\"datatable_item_limit\";s:2:\"25\";s:16:\"reference_format\";s:8:\"sequence\";s:22:\"sales_reference_prefix\";s:1:\"V\";s:16:\"receipt_template\";s:1:\"1\";s:12:\"invoice_view\";s:8:\"standard\";s:14:\"business_state\";s:2:\"AN\";s:31:\"change_item_price_while_billing\";s:1:\"0\";s:25:\"pos_product_display_limit\";s:0:\"\";s:15:\"after_sell_page\";s:16:\"receipt_in_popup\";s:19:\"invoice_footer_text\";s:25:\"Gracias por Preferirnos!.\";s:10:\"email_from\";s:13:\"tusolutionweb\";s:13:\"email_address\";s:2:\"US\";s:12:\"email_driver\";s:11:\"smtp_server\";s:14:\"send_mail_path\";s:18:\"/usr/sbin/sendmail\";s:9:\"smtp_host\";s:15:\"smtp.google.com\";s:13:\"smtp_username\";s:0:\"\";s:13:\"smtp_password\";s:0:\"\";s:9:\"smtp_port\";s:3:\"465\";s:7:\"ssl_tls\";s:3:\"ssl\";s:12:\"ftp_hostname\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";}', 1, 0, 'ready', '2019-03-01 14:29:18', 0, NULL, 1, '2018-09-24 18:00:00'),
(2, 'SUCURSAL LATACUNGA ', 'sucursal_latacunga', '', 'importadorapoloapolo@hotmail.com', 'AD', '', 'USD', '', 3, 'CENTRO DE LATACUNGA FRENTE A LA ESPE 33', '1', NULL, 42, 0, NULL, NULL, 1, NULL, '2_logo.jpg', NULL, 'a:32:{s:10:\"gst_reg_no\";s:0:\"\";s:8:\"timezone\";s:12:\"America/Lima\";s:21:\"invoice_edit_lifespan\";s:4:\"1440\";s:26:\"invoice_edit_lifespan_unit\";s:6:\"minute\";s:23:\"invoice_delete_lifespan\";s:4:\"1440\";s:28:\"invoice_delete_lifespan_unit\";s:6:\"minute\";s:3:\"tax\";s:1:\"0\";s:11:\"sms_gateway\";s:10:\"Clickatell\";s:9:\"sms_alert\";s:1:\"0\";s:24:\"expiring_soon_alert_days\";s:0:\"\";s:20:\"datatable_item_limit\";s:2:\"25\";s:16:\"reference_format\";s:13:\"year_sequence\";s:22:\"sales_reference_prefix\";s:0:\"\";s:16:\"receipt_template\";s:1:\"1\";s:12:\"invoice_view\";s:8:\"standard\";s:14:\"business_state\";s:2:\"AN\";s:31:\"change_item_price_while_billing\";s:1:\"0\";s:25:\"pos_product_display_limit\";s:0:\"\";s:15:\"after_sell_page\";s:16:\"receipt_in_popup\";s:19:\"invoice_footer_text\";s:0:\"\";s:10:\"email_from\";s:13:\"tusolutionweb\";s:13:\"email_address\";s:2:\"US\";s:12:\"email_driver\";s:11:\"smtp_server\";s:14:\"send_mail_path\";s:18:\"/usr/sbin/sendmail\";s:9:\"smtp_host\";s:15:\"smtp.google.com\";s:13:\"smtp_username\";s:0:\"\";s:13:\"smtp_password\";s:0:\"\";s:9:\"smtp_port\";s:3:\"465\";s:7:\"ssl_tls\";s:3:\"ssl\";s:12:\"ftp_hostname\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";}', 1, 0, 'ready', NULL, 1, NULL, 1, '2023-07-20 14:45:05'),
(3, 'SUCURSAL AMBATO', 'sucursal_ambato', '', 'ambato@controldas.com', 'AD', '', 'USD', '', 3, 'AMBATO', '', NULL, 42, 0, NULL, NULL, 1, NULL, NULL, NULL, 'a:21:{s:8:\"timezone\";s:12:\"America/Lima\";s:21:\"invoice_edit_lifespan\";s:4:\"1440\";s:26:\"invoice_edit_lifespan_unit\";s:6:\"minute\";s:23:\"invoice_delete_lifespan\";s:4:\"1440\";s:28:\"invoice_delete_lifespan_unit\";s:6:\"minute\";s:15:\"after_sell_page\";s:3:\"pos\";s:3:\"tax\";s:1:\"0\";s:20:\"stock_alert_quantity\";s:0:\"\";s:20:\"datatable_item_limit\";s:2:\"25\";s:19:\"invoice_footer_text\";s:0:\"\";s:10:\"email_from\";s:13:\"tusolutionweb\";s:13:\"email_address\";s:2:\"US\";s:12:\"email_driver\";s:11:\"smtp_server\";s:9:\"smtp_host\";s:15:\"smtp.google.com\";s:13:\"smtp_username\";s:0:\"\";s:13:\"smtp_password\";s:0:\"\";s:9:\"smtp_port\";s:3:\"465\";s:7:\"ssl_tls\";s:3:\"ssl\";s:12:\"ftp_hostname\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";}', 1, 0, 'ready', NULL, 1, NULL, 1, '2023-08-05 14:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `sup_id` int(10) UNSIGNED NOT NULL,
  `sup_document` varchar(20) NOT NULL,
  `sup_name` varchar(100) NOT NULL,
  `code_name` varchar(55) DEFAULT NULL,
  `sup_mobile` varchar(14) DEFAULT NULL,
  `sup_email` varchar(100) DEFAULT NULL,
  `gtin` varchar(100) DEFAULT NULL,
  `sup_address` text DEFAULT NULL,
  `sup_city` varchar(100) DEFAULT NULL,
  `sup_state` varchar(55) DEFAULT NULL,
  `sup_country` varchar(100) DEFAULT NULL,
  `sup_details` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `sup_document`, `sup_name`, `code_name`, `sup_mobile`, `sup_email`, `gtin`, `sup_address`, `sup_city`, `sup_state`, `sup_country`, `sup_details`, `created_at`) VALUES
(1, '1', 'EDITORIALES HOLGUIN', 'editoriales_holguin', '', '', '', 'GUAYAQUIL', '', '', 'AD', '', '2023-06-25 23:20:18'),
(2, '000000000', 'EDITORIAL LEA MAS ', 'editorial_lea_mas', 'FLORY', '000000000', '', 'QUITO', '', '', 'AD', '', '2023-07-21 10:52:01'),
(3, '00000000000', 'MARCO BOSMEDIANO', 'marco_bosmediano', 'MARCOB', '00000000000', '', 'QUITO', '', '', 'AD', '', '2023-07-21 10:52:32'),
(4, '00000000', 'ELT SOLUTIONS', 'elt_solutions', 'MARCELO', '00000000', '', 'QUITO', '', '', 'AD', '', '2023-07-21 10:53:33'),
(5, '2', 'EDITORIAL LOS ANDES', 'editorial_los_andes', 'VERONICA PURUN', '2', '', 'QUITO', '', '', 'AD', '', '2023-07-21 10:55:20'),
(6, '3', 'EDIPCENTRO', 'edipcentro', 'LORENA FREIRE', '3', '', 'RIOBAMBA', '', '', 'AD', '', '2023-07-21 10:56:08'),
(7, '0602937070', 'HERNAN EIVAR', 'hernan_eivar', 'HERNAN', 'hernaneivarv@gmail.com', '', 'LATACUNGA', '', '', 'AD', '', '2023-07-21 11:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_to_store`
--

CREATE TABLE `supplier_to_store` (
  `s2s_id` int(10) UNSIGNED NOT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `balance` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `supplier_to_store`
--

INSERT INTO `supplier_to_store` (`s2s_id`, `sup_id`, `store_id`, `balance`, `status`, `sort_order`) VALUES
(1, 1, 1, '0.0000', 1, 0),
(2, 1, 2, '0.0000', 1, 0),
(3, 2, 1, '0.0000', 1, 0),
(4, 2, 2, '0.0000', 1, 0),
(5, 3, 1, '0.0000', 1, 0),
(6, 3, 2, '0.0000', 1, 0),
(7, 4, 1, '0.0000', 1, 0),
(8, 4, 2, '0.0000', 1, 0),
(9, 5, 1, '0.0000', 1, 0),
(10, 5, 2, '0.0000', 1, 0),
(11, 6, 1, '0.0000', 1, 0),
(12, 6, 2, '0.0000', 1, 0),
(13, 7, 1, '0.0000', 1, 0),
(14, 7, 2, '0.0000', 1, 0),
(15, 1, 3, '0.0000', 1, 0),
(16, 2, 3, '0.0000', 1, 0),
(17, 3, 3, '0.0000', 1, 0),
(18, 4, 3, '0.0000', 1, 0),
(19, 5, 3, '0.0000', 1, 0),
(20, 6, 3, '0.0000', 1, 0),
(21, 7, 3, '0.0000', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxrates`
--

CREATE TABLE `taxrates` (
  `taxrate_id` int(10) UNSIGNED NOT NULL,
  `taxrate_name` varchar(55) NOT NULL,
  `code_name` varchar(55) DEFAULT NULL,
  `taxrate` decimal(25,4) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `taxrates`
--

INSERT INTO `taxrates` (`taxrate_id`, `taxrate_name`, `code_name`, `taxrate`, `status`, `sort_order`) VALUES
(1, '12% Iva', 'iva_12', '12.0000', 1, 0),
(2, '0% Iva', 'iva_0', '0.0000', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(55) NOT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `from_store_id` int(10) UNSIGNED NOT NULL,
  `to_store_id` int(10) UNSIGNED NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_item` decimal(25,4) DEFAULT NULL,
  `total_quantity` decimal(25,4) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `attachment` varchar(55) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_items`
--

CREATE TABLE `transfer_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `transfer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` decimal(25,4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit_id` int(10) UNSIGNED NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `code_name` varchar(50) DEFAULT NULL,
  `unit_details` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `unit_name`, `code_name`, `unit_details`, `status`) VALUES
(1, 'UND', 'und', 'Unidad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(10) NOT NULL DEFAULT 'M',
  `password` varchar(100) NOT NULL,
  `raw_password` varchar(100) DEFAULT NULL,
  `pass_reset_code` varchar(32) DEFAULT NULL,
  `reset_code_time` datetime DEFAULT NULL,
  `login_try` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `ip` varchar(40) NOT NULL,
  `address` text DEFAULT NULL,
  `preference` longtext DEFAULT NULL,
  `user_image` varchar(250) DEFAULT NULL,
  `fk_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `group_id`, `username`, `email`, `mobile`, `dob`, `sex`, `password`, `raw_password`, `pass_reset_code`, `reset_code_time`, `login_try`, `last_login`, `ip`, `address`, `preference`, `user_image`, `fk_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'EDGAR YAGUAL', 'eye_layla@hotmail.com', '0969237302', '1990-09-08', 'M', 'c4221155b59e510664712215ed60e476', 'Administrator2023DAS', '', NULL, 0, '2023-08-07 15:25:40', '181.198.104.222', NULL, 'a:4:{s:10:\"base_color\";s:6:\"purple\";s:14:\"pos_side_panel\";s:4:\"left\";s:11:\"pos_pattern\";s:15:\"brick-color.jpg\";s:8:\"language\";s:2:\"es\";}', '/edgartm.jpg', NULL, '2019-12-14 22:27:47', '2019-07-03 22:29:20'),
(2, 4, 'DAVID POLO', 'admin@controldas.com', 'DAVID POLO', '1990-01-01', 'M', 'a618780a5f901e3d81b8b0bfe0281385', 'ControlAdmin1', '', NULL, 0, '2023-08-08 10:14:58', '181.199.42.39', NULL, 'a:4:{s:8:\"language\";s:2:\"es\";s:10:\"base_color\";s:6:\"purple\";s:14:\"pos_side_panel\";s:5:\"right\";s:11:\"pos_pattern\";s:9:\"space.jpg\";}', '', 0, '2019-12-14 22:27:47', '2019-07-02 16:28:15'),
(3, 2, 'Cashier', 'cashier@controldas.com', '0113743700', '1990-01-01', 'M', 'a618780a5f901e3d81b8b0bfe0281385', 'ControlAdmin1', '', NULL, 0, '2023-06-13 14:01:19', '::1', NULL, 'a:4:{s:10:\"base_color\";s:4:\"blue\";s:14:\"pos_side_panel\";s:4:\"left\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";s:8:\"language\";s:2:\"es\";}', '', NULL, '2019-12-14 22:27:47', '2019-07-02 21:35:07'),
(4, 3, 'Salesman', 'salesman@controldas.com', '1234567890', '0000-00-00', 'M', 'a618780a5f901e3d81b8b0bfe0281385', 'ControlAdmin1', NULL, NULL, 0, '2023-06-14 21:58:20', '127.0.0.1', NULL, 'a:1:{s:8:\"language\";s:2:\"es\";}', '', NULL, '2023-06-14 21:57:48', NULL),
(5, 8, 'HERNAN EIVAR', 'hernaneivar@controldas.com', 'HERNAN', '0000-00-00', 'M', '314a4e69e0cf213e0d9cfd14a5ead1f2', '0983171925', NULL, NULL, 0, '2023-08-07 21:45:11', '2800:bf0:2902:108e:809b:3c28:a283:21b6', NULL, 'a:1:{s:8:\"language\";s:2:\"es\";}', '', 0, '2023-07-20 14:52:36', NULL),
(6, 5, 'MAURICIO CASTILLO', 'mauriciocastillo@controldas.com', 'MAURICIO ', '0000-00-00', 'M', '56740f5615802370aa445aadfb0be840', '0980948929', NULL, NULL, 0, '2023-08-08 10:21:15', '190.99.77.62', NULL, 'a:1:{s:8:\"language\";s:2:\"en\";}', '', 0, '2023-07-20 15:01:04', NULL),
(7, 5, 'DALILA SEGURA', 'dalila_segura@controldas.com', 'DALI', '0000-00-00', 'M', '5a612297eef412bc00bd0ca726f53fdb', '0939684718', NULL, NULL, 0, '2023-07-31 17:15:11', '2800:bf0:a821:1122:4457:7a58:99c6:9b14', NULL, 'a:1:{s:8:\"language\";s:2:\"en\";}', '', 0, '2023-07-21 08:21:08', NULL),
(8, 6, 'HOLGUIN EDICIONES', 'E@', 'HOLGUIN ', '0000-00-00', 'M', '827ccb0eea8a706c4c34a16891f84e7b', '12345', NULL, NULL, 0, '2023-08-03 18:42:46', '181.199.42.39', NULL, 'a:1:{s:8:\"language\";s:2:\"en\";}', '', 1, '2023-08-03 18:42:30', NULL),
(9, 7, 'UE COTOPAXI', 'DJD', 'UEI COTOPAXI', '0000-00-00', 'M', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, NULL, 0, '2023-08-08 09:59:57', '181.199.42.39', NULL, 'a:1:{s:8:\"language\";s:2:\"en\";}', '', 2, '2023-08-08 09:55:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`group_id`, `name`, `slug`, `sort_order`, `status`, `permission`) VALUES
(1, 'Admin', 'admin', 1, 1, 'a:1:{s:6:\"access\";a:122:{s:16:\"read_sell_report\";s:4:\"true\";s:20:\"read_overview_report\";s:4:\"true\";s:22:\"read_collection_report\";s:4:\"true\";s:27:\"read_full_collection_report\";s:4:\"true\";s:35:\"read_customer_due_collection_report\";s:4:\"true\";s:29:\"read_supplier_due_paid_report\";s:4:\"true\";s:14:\"read_analytics\";s:4:\"true\";s:24:\"read_sell_payment_report\";s:4:\"true\";s:20:\"read_sell_tax_report\";s:4:\"true\";s:24:\"read_tax_overview_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:21:\"send_report_via_email\";s:4:\"true\";s:8:\"withdraw\";s:4:\"true\";s:7:\"deposit\";s:4:\"true\";s:8:\"transfer\";s:4:\"true\";s:17:\"read_bank_account\";s:4:\"true\";s:23:\"read_bank_account_sheet\";s:4:\"true\";s:18:\"read_bank_transfer\";s:4:\"true\";s:22:\"read_bank_transactions\";s:4:\"true\";s:19:\"create_bank_account\";s:4:\"true\";s:19:\"update_bank_account\";s:4:\"true\";s:19:\"delete_bank_account\";s:4:\"true\";s:12:\"read_expense\";s:4:\"true\";s:14:\"create_expense\";s:4:\"true\";s:14:\"update_expense\";s:4:\"true\";s:14:\"delete_expense\";s:4:\"true\";s:21:\"read_sell_transaction\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:13:\"read_transfer\";s:4:\"true\";s:12:\"add_transfer\";s:4:\"true\";s:15:\"update_transfer\";s:4:\"true\";s:13:\"read_giftcard\";s:4:\"true\";s:12:\"add_giftcard\";s:4:\"true\";s:15:\"update_giftcard\";s:4:\"true\";s:15:\"delete_giftcard\";s:4:\"true\";s:14:\"giftcard_topup\";s:4:\"true\";s:19:\"read_giftcard_topup\";s:4:\"true\";s:21:\"delete_giftcard_topup\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:18:\"delete_all_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:19:\"restore_all_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:8:\"read_box\";s:4:\"true\";s:10:\"create_box\";s:4:\"true\";s:10:\"update_box\";s:4:\"true\";s:10:\"delete_box\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:11:\"create_unit\";s:4:\"true\";s:11:\"update_unit\";s:4:\"true\";s:11:\"delete_unit\";s:4:\"true\";s:12:\"read_taxrate\";s:4:\"true\";s:14:\"create_taxrate\";s:4:\"true\";s:14:\"update_taxrate\";s:4:\"true\";s:14:\"delete_taxrate\";s:4:\"true\";s:9:\"read_loan\";s:4:\"true\";s:17:\"read_loan_summary\";s:4:\"true\";s:9:\"take_loan\";s:4:\"true\";s:11:\"update_loan\";s:4:\"true\";s:11:\"delete_loan\";s:4:\"true\";s:8:\"loan_pay\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"delete_customer\";s:4:\"true\";s:9:\"read_user\";s:4:\"true\";s:11:\"create_user\";s:4:\"true\";s:11:\"update_user\";s:4:\"true\";s:11:\"delete_user\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:14:\"read_usergroup\";s:4:\"true\";s:16:\"create_usergroup\";s:4:\"true\";s:16:\"update_usergroup\";s:4:\"true\";s:16:\"delete_usergroup\";s:4:\"true\";s:13:\"read_currency\";s:4:\"true\";s:15:\"create_currency\";s:4:\"true\";s:15:\"update_currency\";s:4:\"true\";s:15:\"change_currency\";s:4:\"true\";s:15:\"delete_currency\";s:4:\"true\";s:16:\"read_filemanager\";s:4:\"true\";s:12:\"read_pmethod\";s:4:\"true\";s:14:\"create_pmethod\";s:4:\"true\";s:14:\"update_pmethod\";s:4:\"true\";s:14:\"delete_pmethod\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:14:\"upload_favicon\";s:4:\"true\";s:11:\"upload_logo\";s:4:\"true\";s:12:\"read_printer\";s:4:\"true\";s:14:\"create_printer\";s:4:\"true\";s:14:\"update_printer\";s:4:\"true\";s:14:\"delete_printer\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:13:\"language_sync\";s:4:\"true\";s:6:\"backup\";s:4:\"true\";s:7:\"restore\";s:4:\"true\";s:11:\"show_profit\";s:4:\"true\";s:10:\"show_graph\";s:4:\"true\";}}'),
(2, 'Cajero', 'cashier', 2, 1, 'a:0:{}'),
(3, 'Vendedor', 'salesman', 3, 1, 'a:0:{}'),
(4, 'Admin DAS', 'admin_das', 0, 1, 'a:1:{s:6:\"access\";a:95:{s:26:\"read_dashboard_invoce_view\";s:4:\"true\";s:28:\"read_dashboard_customer_view\";s:4:\"true\";s:28:\"read_dashboard_supplier_view\";s:4:\"true\";s:27:\"read_dashboard_product_view\";s:4:\"true\";s:22:\"read_recent_activities\";s:4:\"true\";s:16:\"read_sell_report\";s:4:\"true\";s:14:\"read_analytics\";s:4:\"true\";s:20:\"read_purchase_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:17:\"read_sell_invoice\";s:4:\"true\";s:14:\"read_sell_list\";s:4:\"true\";s:19:\"create_sell_invoice\";s:4:\"true\";s:24:\"update_sell_invoice_info\";s:4:\"true\";s:19:\"delete_sell_invoice\";s:4:\"true\";s:12:\"sell_payment\";s:4:\"true\";s:15:\"create_sell_due\";s:4:\"true\";s:18:\"create_sell_return\";s:4:\"true\";s:16:\"read_sell_return\";s:4:\"true\";s:18:\"update_sell_return\";s:4:\"true\";s:18:\"delete_sell_return\";s:4:\"true\";s:16:\"sms_sell_invoice\";s:4:\"true\";s:18:\"email_sell_invoice\";s:4:\"true\";s:13:\"read_sell_log\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:17:\"read_purchase_log\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:10:\"read_brand\";s:4:\"true\";s:12:\"create_brand\";s:4:\"true\";s:12:\"update_brand\";s:4:\"true\";s:12:\"delete_brand\";s:4:\"true\";s:18:\"read_brand_profile\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:12:\"read_taxrate\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"delete_customer\";s:4:\"true\";s:20:\"add_customer_balance\";s:4:\"true\";s:26:\"substract_customer_balance\";s:4:\"true\";s:25:\"read_customer_transaction\";s:4:\"true\";s:9:\"read_user\";s:4:\"true\";s:11:\"create_user\";s:4:\"true\";s:17:\"read_user_profile\";s:4:\"true\";s:11:\"update_user\";s:4:\"true\";s:11:\"delete_user\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:13:\"read_user_log\";s:4:\"true\";s:14:\"read_usergroup\";s:4:\"true\";s:12:\"read_pmethod\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:14:\"upload_favicon\";s:4:\"true\";s:11:\"upload_logo\";s:4:\"true\";s:12:\"read_college\";s:4:\"true\";s:14:\"create_college\";s:4:\"true\";s:14:\"update_college\";s:4:\"true\";s:14:\"delete_college\";s:4:\"true\";s:16:\"activate_college\";s:4:\"true\";s:11:\"read_course\";s:4:\"true\";s:13:\"create_course\";s:4:\"true\";s:13:\"update_course\";s:4:\"true\";s:13:\"delete_course\";s:4:\"true\";s:15:\"activate_course\";s:4:\"true\";s:12:\"read_printer\";s:4:\"true\";s:14:\"create_printer\";s:4:\"true\";s:14:\"update_printer\";s:4:\"true\";s:16:\"receipt_template\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:19:\"show_purchase_price\";s:4:\"true\";s:18:\"show_selling_price\";s:4:\"true\";s:20:\"show_estimated_sales\";s:4:\"true\";s:11:\"show_profit\";s:4:\"true\";s:10:\"show_graph\";s:4:\"true\";}}'),
(5, 'Administrador Sucursal', 'administrador_sucursal', 0, 1, 'a:1:{s:6:\"access\";a:26:{s:16:\"read_sell_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:17:\"read_sell_invoice\";s:4:\"true\";s:14:\"read_sell_list\";s:4:\"true\";s:19:\"create_sell_invoice\";s:4:\"true\";s:12:\"sell_payment\";s:4:\"true\";s:13:\"read_sell_log\";s:4:\"true\";s:20:\"create_holding_order\";s:4:\"true\";s:18:\"read_holding_order\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:17:\"read_purchase_log\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:18:\"show_selling_price\";s:4:\"true\";s:20:\"show_estimated_sales\";s:4:\"true\";}}'),
(6, 'Proveedor Visor', 'proveedor_visor', 0, 1, 'a:1:{s:6:\"access\";a:6:{s:16:\"read_sell_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:19:\"show_purchase_price\";s:4:\"true\";}}'),
(7, 'Colegio Visor', 'colegio_visor', 0, 1, 'a:1:{s:6:\"access\";a:4:{s:16:\"read_sell_report\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:20:\"show_estimated_sales\";s:4:\"true\";}}'),
(8, 'Ejecutivo de Ventas', 'ejecutivo_de_ventas', 0, 1, 'a:1:{s:6:\"access\";a:14:{s:16:\"read_sell_report\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:12:\"read_college\";s:4:\"true\";s:14:\"create_college\";s:4:\"true\";s:14:\"update_college\";s:4:\"true\";s:14:\"delete_college\";s:4:\"true\";s:16:\"activate_college\";s:4:\"true\";s:11:\"read_course\";s:4:\"true\";s:13:\"create_course\";s:4:\"true\";s:13:\"update_course\";s:4:\"true\";s:13:\"delete_course\";s:4:\"true\";s:15:\"activate_course\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:20:\"show_estimated_sales\";s:4:\"true\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `user_to_store`
--

CREATE TABLE `user_to_store` (
  `u2s_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `user_to_store`
--

INSERT INTO `user_to_store` (`u2s_id`, `user_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 3, 1, 1, 2),
(6, 4, 1, 1, 3),
(23, 1, 1, 1, 1),
(24, 3, 2, 1, 0),
(25, 1, 2, 1, 0),
(27, 5, 1, 1, 0),
(28, 5, 2, 1, 0),
(29, 2, 1, 1, 0),
(30, 2, 2, 1, 0),
(31, 6, 2, 1, 0),
(33, 7, 1, 1, 0),
(34, 8, 1, 1, 0),
(35, 8, 2, 1, 0),
(36, 3, 3, 1, 0),
(37, 1, 3, 1, 0),
(38, 2, 3, 1, 0),
(42, 9, 1, 1, 0),
(43, 9, 2, 1, 0),
(44, 9, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_box_to_store_`
--

CREATE TABLE `_box_to_store_` (
  `id` int(10) UNSIGNED NOT NULL,
  `box_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_brand_to_store_`
--

CREATE TABLE `_brand_to_store_` (
  `b2s_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_category_to_store_`
--

CREATE TABLE `_category_to_store_` (
  `c2s_id` int(10) UNSIGNED NOT NULL,
  `ccategory_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_college_to_store_`
--

CREATE TABLE `_college_to_store_` (
  `b2s_id` int(10) UNSIGNED NOT NULL,
  `college_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_currency_to_store_`
--

CREATE TABLE `_currency_to_store_` (
  `ca2s_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_pmethod_to_store_`
--

CREATE TABLE `_pmethod_to_store_` (
  `p2s_id` int(10) UNSIGNED NOT NULL,
  `ppmethod_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_unit_to_store_`
--

CREATE TABLE `_unit_to_store_` (
  `unit2s_id` int(10) UNSIGNED NOT NULL,
  `uunit_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `store_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_account_to_store`
--
ALTER TABLE `bank_account_to_store`
  ADD PRIMARY KEY (`ba2s`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `bank_transaction_info`
--
ALTER TABLE `bank_transaction_info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `bank_transaction_price`
--
ALTER TABLE `bank_transaction_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `ref_no` (`ref_no`);

--
-- Indexes for table `boxes`
--
ALTER TABLE `boxes`
  ADD PRIMARY KEY (`box_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`college_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_to_store`
--
ALTER TABLE `customer_to_store`
  ADD PRIMARY KEY (`c2s_id`),
  ADD UNIQUE KEY `UK_customer_to_store` (`customer_id`,`store_id`),
  ADD KEY `FK_customer_to_store_store_id` (`store_id`);

--
-- Indexes for table `customer_transactions`
--
ALTER TABLE `customer_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categorys`
--
ALTER TABLE `expense_categorys`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `gift_card_topups`
--
ALTER TABLE `gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `holding_info`
--
ALTER TABLE `holding_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indexes for table `holding_item`
--
ALTER TABLE `holding_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `holding_price`
--
ALTER TABLE `holding_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `ref_no` (`ref_no`);

--
-- Indexes for table `income_sources`
--
ALTER TABLE `income_sources`
  ADD PRIMARY KEY (`source_id`);

--
-- Indexes for table `installment_orders`
--
ALTER TABLE `installment_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `installment_payments`
--
ALTER TABLE `installment_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_translations`
--
ALTER TABLE `language_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lloan_id` (`lloan_id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `mail_sms_tag`
--
ALTER TABLE `mail_sms_tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `pmethods`
--
ALTER TABLE `pmethods`
  ADD PRIMARY KEY (`pmethod_id`);

--
-- Indexes for table `pos_register`
--
ALTER TABLE `pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_templates`
--
ALTER TABLE `pos_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `pos_template_to_store`
--
ALTER TABLE `pos_template_to_store`
  ADD PRIMARY KEY (`pt2s`),
  ADD KEY `ttemplate_id` (`ttemplate_id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`printer_id`);

--
-- Indexes for table `printer_to_store`
--
ALTER TABLE `printer_to_store`
  ADD PRIMARY KEY (`p2s_id`),
  ADD KEY `pprinter_id` (`pprinter_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `p_code` (`p_code`) USING BTREE;

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_to_college`
--
ALTER TABLE `product_to_college`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_to_store`
--
ALTER TABLE `product_to_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_date` (`p_date`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `purchase_info`
--
ALTER TABLE `purchase_info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `purchase_logs`
--
ALTER TABLE `purchase_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sup_id` (`sup_id`),
  ADD KEY `reference_no` (`reference_no`),
  ADD KEY `ref_invoice_id` (`ref_invoice_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `purchase_price`
--
ALTER TABLE `purchase_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `quotation_info`
--
ALTER TABLE `quotation_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indexes for table `quotation_item`
--
ALTER TABLE `quotation_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_no` (`reference_no`);

--
-- Indexes for table `quotation_price`
--
ALTER TABLE `quotation_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `reference_no` (`reference_no`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `return_items`
--
ALTER TABLE `return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`invoice_id`),
  ADD KEY `product_id` (`item_id`);

--
-- Indexes for table `selling_info`
--
ALTER TABLE `selling_info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `selling_item`
--
ALTER TABLE `selling_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `selling_price`
--
ALTER TABLE `selling_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `sell_logs`
--
ALTER TABLE `sell_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shortcut_links`
--
ALTER TABLE `shortcut_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_schedule`
--
ALTER TABLE `sms_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `people_type` (`people_type`);

--
-- Indexes for table `sms_setting`
--
ALTER TABLE `sms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `supplier_to_store`
--
ALTER TABLE `supplier_to_store`
  ADD PRIMARY KEY (`s2s_id`),
  ADD UNIQUE KEY `UK_supplier_to_store` (`sup_id`,`store_id`),
  ADD KEY `sup_id` (`sup_id`),
  ADD KEY `FK_supplier_to_store_store_id` (`store_id`);

--
-- Indexes for table `taxrates`
--
ALTER TABLE `taxrates`
  ADD PRIMARY KEY (`taxrate_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_items`
--
ALTER TABLE `transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user_to_store`
--
ALTER TABLE `user_to_store`
  ADD PRIMARY KEY (`u2s_id`),
  ADD UNIQUE KEY `UK_user_to_store` (`user_id`,`store_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `FK_user_to_store_store_id` (`store_id`);

--
-- Indexes for table `_box_to_store_`
--
ALTER TABLE `_box_to_store_`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_box_to_store` (`box_id`,`store_id`);

--
-- Indexes for table `_brand_to_store_`
--
ALTER TABLE `_brand_to_store_`
  ADD PRIMARY KEY (`b2s_id`),
  ADD UNIQUE KEY `UK_brand_to_store` (`brand_id`,`store_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `_category_to_store_`
--
ALTER TABLE `_category_to_store_`
  ADD PRIMARY KEY (`c2s_id`),
  ADD UNIQUE KEY `UK_category_to_store` (`ccategory_id`,`store_id`),
  ADD KEY `ccategory_id` (`ccategory_id`);

--
-- Indexes for table `_college_to_store_`
--
ALTER TABLE `_college_to_store_`
  ADD PRIMARY KEY (`b2s_id`),
  ADD KEY `college_id` (`college_id`);

--
-- Indexes for table `_currency_to_store_`
--
ALTER TABLE `_currency_to_store_`
  ADD PRIMARY KEY (`ca2s_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `_pmethod_to_store_`
--
ALTER TABLE `_pmethod_to_store_`
  ADD PRIMARY KEY (`p2s_id`),
  ADD KEY `ppmethod_id` (`ppmethod_id`);

--
-- Indexes for table `_unit_to_store_`
--
ALTER TABLE `_unit_to_store_`
  ADD PRIMARY KEY (`unit2s_id`),
  ADD KEY `uunit_id` (`uunit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_account_to_store`
--
ALTER TABLE `bank_account_to_store`
  MODIFY `ba2s` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_transaction_info`
--
ALTER TABLE `bank_transaction_info`
  MODIFY `info_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `bank_transaction_price`
--
ALTER TABLE `bank_transaction_price`
  MODIFY `price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `boxes`
--
ALTER TABLE `boxes`
  MODIFY `box_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `college_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `customer_to_store`
--
ALTER TABLE `customer_to_store`
  MODIFY `c2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `customer_transactions`
--
ALTER TABLE `customer_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categorys`
--
ALTER TABLE `expense_categorys`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_topups`
--
ALTER TABLE `gift_card_topups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holding_info`
--
ALTER TABLE `holding_info`
  MODIFY `info_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holding_item`
--
ALTER TABLE `holding_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holding_price`
--
ALTER TABLE `holding_price`
  MODIFY `price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_sources`
--
ALTER TABLE `income_sources`
  MODIFY `source_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `installment_orders`
--
ALTER TABLE `installment_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installment_payments`
--
ALTER TABLE `installment_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `language_translations`
--
ALTER TABLE `language_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4400;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `mail_sms_tag`
--
ALTER TABLE `mail_sms_tag`
  MODIFY `tag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `pmethods`
--
ALTER TABLE `pmethods`
  MODIFY `pmethod_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pos_register`
--
ALTER TABLE `pos_register`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pos_templates`
--
ALTER TABLE `pos_templates`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pos_template_to_store`
--
ALTER TABLE `pos_template_to_store`
  MODIFY `pt2s` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `printer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `printer_to_store`
--
ALTER TABLE `printer_to_store`
  MODIFY `p2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `p_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_to_college`
--
ALTER TABLE `product_to_college`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `product_to_store`
--
ALTER TABLE `product_to_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=631;

--
-- AUTO_INCREMENT for table `purchase_info`
--
ALTER TABLE `purchase_info`
  MODIFY `info_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `purchase_logs`
--
ALTER TABLE `purchase_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `purchase_price`
--
ALTER TABLE `purchase_price`
  MODIFY `price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_info`
--
ALTER TABLE `quotation_info`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quotation_item`
--
ALTER TABLE `quotation_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quotation_price`
--
ALTER TABLE `quotation_price`
  MODIFY `price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_items`
--
ALTER TABLE `return_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_info`
--
ALTER TABLE `selling_info`
  MODIFY `info_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `selling_item`
--
ALTER TABLE `selling_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `selling_price`
--
ALTER TABLE `selling_price`
  MODIFY `price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sell_logs`
--
ALTER TABLE `sell_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shortcut_links`
--
ALTER TABLE `shortcut_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sms_schedule`
--
ALTER TABLE `sms_schedule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supplier_to_store`
--
ALTER TABLE `supplier_to_store`
  MODIFY `s2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `taxrates`
--
ALTER TABLE `taxrates`
  MODIFY `taxrate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_items`
--
ALTER TABLE `transfer_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_to_store`
--
ALTER TABLE `user_to_store`
  MODIFY `u2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `_box_to_store_`
--
ALTER TABLE `_box_to_store_`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_brand_to_store_`
--
ALTER TABLE `_brand_to_store_`
  MODIFY `b2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_category_to_store_`
--
ALTER TABLE `_category_to_store_`
  MODIFY `c2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_college_to_store_`
--
ALTER TABLE `_college_to_store_`
  MODIFY `b2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_currency_to_store_`
--
ALTER TABLE `_currency_to_store_`
  MODIFY `ca2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_pmethod_to_store_`
--
ALTER TABLE `_pmethod_to_store_`
  MODIFY `p2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_unit_to_store_`
--
ALTER TABLE `_unit_to_store_`
  MODIFY `unit2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_to_store`
--
ALTER TABLE `customer_to_store`
  ADD CONSTRAINT `FK_customer_to_store_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `FK_customer_to_store_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `supplier_to_store`
--
ALTER TABLE `supplier_to_store`
  ADD CONSTRAINT `FK_supplier_to_store_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `FK_supplier_to_store_sup_id` FOREIGN KEY (`sup_id`) REFERENCES `suppliers` (`sup_id`);

--
-- Constraints for table `user_to_store`
--
ALTER TABLE `user_to_store`
  ADD CONSTRAINT `FK_user_to_store_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `FK_user_to_store_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
