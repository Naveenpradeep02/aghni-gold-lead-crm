-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 10, 2026 at 04:26 AM
-- Server version: 11.8.8-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u623630575_old_gold_crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `gold_rates`
--

CREATE TABLE `gold_rates` (
  `id` int(11) NOT NULL,
  `gold_type` enum('24K','22K','18K') DEFAULT NULL,
  `new_rate` decimal(10,2) DEFAULT NULL,
  `old_rate` decimal(10,2) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gold_rates`
--

INSERT INTO `gold_rates` (`id`, `gold_type`, `new_rate`, `old_rate`, `updated_at`) VALUES
(1, '24K', 14334.00, 14150.00, '2026-06-14 05:11:23'),
(2, '22K', 13130.00, 12960.00, '2026-06-14 05:11:23'),
(3, '18K', 10751.00, 10610.00, '2026-06-14 05:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `gold_type` enum('24K','22K','18K') DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `market_value` decimal(12,2) DEFAULT NULL,
  `purchase_value` decimal(12,2) DEFAULT NULL,
  `status` enum('new','contacted','scheduled','converted','purchased','rejected') DEFAULT 'new',
  `gold_location` enum('in_hand','bank_pledged','finance_pledged','pawn_shop','locker','other') DEFAULT 'in_hand',
  `pledged_amount` decimal(12,2) DEFAULT 0.00,
  `bank_finance_name` varchar(255) DEFAULT NULL,
  `expected_sell_date` date DEFAULT NULL,
  `ornament_type` varchar(100) DEFAULT NULL,
  `purity_verified` tinyint(1) DEFAULT 0,
  `visit_required` tinyint(1) DEFAULT 0,
  `pickup_required` tinyint(1) DEFAULT 0,
  `source` varchar(100) DEFAULT NULL,
  `lead_source_id` int(11) DEFAULT NULL,
  `landing_page` varchar(255) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `referrer` varchar(500) DEFAULT NULL,
  `utm_source` varchar(255) DEFAULT NULL,
  `utm_medium` varchar(255) DEFAULT NULL,
  `utm_campaign` varchar(255) DEFAULT NULL,
  `utm_content` varchar(255) DEFAULT NULL,
  `utm_term` varchar(255) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `report_status_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_followups`
--

CREATE TABLE `lead_followups` (
  `id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `followup_date` datetime NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` enum('pending','completed','missed') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_notes`
--

CREATE TABLE `lead_notes` (
  `id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` int(11) NOT NULL,
  `source_name` varchar(100) NOT NULL,
  `domain_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `source_name`, `domain_name`, `description`, `status`, `created_at`) VALUES
(1, 'Aghni Finance Gold', 'aghnifinancegold.co', NULL, 'active', '2026-07-09 04:51:35'),
(2, 'Aghni Gold Bank', 'aghnigoldbank.online', NULL, 'active', '2026-07-09 04:51:35'),
(3, 'Aghni Gold New Page', 'goldnewpage.in', NULL, 'active', '2026-07-09 04:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `rate_history`
--

CREATE TABLE `rate_history` (
  `id` int(11) NOT NULL,
  `gold_type` enum('24K','22K','18K') DEFAULT NULL,
  `old_rate` decimal(10,2) DEFAULT NULL,
  `new_rate` decimal(10,2) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rate_history`
--

INSERT INTO `rate_history` (`id`, `gold_type`, `old_rate`, `new_rate`, `updated_by`, `created_at`) VALUES
(1, '24K', 9500.00, 20000.00, 1, '2026-06-14 05:55:37'),
(2, '24K', 9500.00, 20000.00, 1, '2026-06-14 05:55:38'),
(3, '24K', 9500.00, 36000.00, 1, '2026-06-15 04:58:30'),
(4, '24K', 14400.00, 14800.00, 1, '2026-06-19 06:44:13'),
(5, '24K', 14400.00, 14800.00, 1, '2026-06-19 06:44:48'),
(6, '24K', 14400.00, 14800.00, 1, '2026-06-19 06:44:50'),
(7, '24K', 14400.00, 14800.00, 1, '2026-06-19 06:44:52'),
(8, '24K', 14400.00, 14800.00, 1, '2026-06-19 06:44:55'),
(9, '18K', 11000.00, 11350.00, 1, '2026-06-19 06:45:56'),
(10, '24K', 14400.00, 14800.00, 1, '2026-06-19 06:45:58'),
(11, '22K', 11500.00, 12000.00, 1, '2026-06-20 14:51:07'),
(12, '24K', 14500.00, 14600.00, 1, '2026-06-23 05:12:40'),
(13, '22K', 13280.00, 13375.00, 1, '2026-06-23 05:13:07'),
(14, '18K', 10875.00, 10950.00, 1, '2026-06-23 05:13:35'),
(15, '24K', 14400.00, 14440.00, 1, '2026-06-24 09:27:48'),
(16, '24K', 14400.00, 14440.00, 1, '2026-06-24 09:27:50'),
(17, '18K', 10800.00, 10830.00, 1, '2026-06-24 09:30:29'),
(18, '18K', 10800.00, 10830.00, 1, '2026-06-24 09:30:31'),
(19, '18K', 10800.00, 10830.00, 1, '2026-06-24 09:30:34'),
(20, '24K', 14000.00, 14023.00, 1, '2026-06-25 05:11:40'),
(21, '24K', 14000.00, 14023.00, 1, '2026-06-25 05:11:41'),
(22, '22K', 12800.00, 12845.00, 1, '2026-06-25 05:11:43'),
(23, '18K', 10500.00, 10517.00, 1, '2026-06-25 05:11:44'),
(24, '24K', 14000.00, 14023.00, 1, '2026-06-25 05:11:46'),
(25, '18K', 10500.00, 10517.00, 1, '2026-06-25 05:11:46'),
(26, '24K', 14300.00, 14405.00, 1, '2026-06-27 04:43:10'),
(27, '18K', 10725.00, 10800.00, 1, '2026-06-27 04:43:12'),
(28, '22K', 13100.00, 13195.00, 1, '2026-06-27 04:43:13'),
(29, '24K', 14250.00, 14312.00, 1, '2026-06-29 06:06:41'),
(30, '22K', 13050.00, 13110.00, 1, '2026-06-29 06:06:43'),
(31, '18K', 10650.00, 10734.00, 1, '2026-06-29 06:07:07'),
(32, '22K', 13050.00, 13110.00, 1, '2026-06-29 06:07:08'),
(33, '24K', 14250.00, 14312.00, 1, '2026-06-29 06:07:09'),
(34, '24K', 14000.00, 14020.00, 1, '2026-06-30 04:57:59'),
(35, '22K', 12800.00, 12845.00, 1, '2026-06-30 04:58:22'),
(36, '18K', 10500.00, 10517.00, 1, '2026-06-30 04:58:41'),
(37, '24K', 14100.00, 14150.00, 1, '2026-07-01 05:40:07'),
(38, '22K', 12950.00, 13020.00, 1, '2026-07-01 05:40:37'),
(39, '18K', 10600.00, 10660.00, 1, '2026-07-01 05:40:52'),
(40, '24K', 14300.00, 14400.00, 1, '2026-07-02 05:21:31'),
(41, '22K', 13100.00, 13180.00, 1, '2026-07-02 05:21:32'),
(42, '18K', 10725.00, 10795.00, 1, '2026-07-02 05:21:33'),
(43, '24K', 14500.00, 14710.00, 1, '2026-07-03 06:12:51'),
(44, '22K', 13280.00, 13475.00, 1, '2026-07-03 06:13:11'),
(45, '18K', 10875.00, 11030.00, 1, '2026-07-03 06:13:35'),
(46, '22K', 13280.00, 13475.00, 1, '2026-07-03 06:13:38'),
(47, '24K', 14300.00, 14680.00, 1, '2026-07-04 05:08:53'),
(48, '22K', 13100.00, 13450.00, 1, '2026-07-04 05:08:54'),
(49, '18K', 10725.00, 11010.00, 1, '2026-07-04 05:08:55'),
(50, '24K', 14300.00, 14672.00, 1, '2026-07-06 06:30:17'),
(51, '22K', 13100.00, 13440.00, 1, '2026-07-06 06:30:38'),
(52, '18K', 10750.00, 11005.00, 1, '2026-07-06 06:31:02'),
(53, '24K', 14250.00, 14530.00, 1, '2026-07-07 06:29:44'),
(54, '22K', 13050.00, 13315.00, 1, '2026-07-07 06:30:04'),
(55, '18K', 10700.00, 10900.00, 1, '2026-07-07 06:30:23'),
(56, '24K', 14350.00, 14460.00, 1, '2026-07-08 06:30:43'),
(57, '22K', 13245.00, 13245.00, 1, '2026-07-08 06:31:03'),
(58, '22K', 13100.00, 13245.00, 1, '2026-07-08 06:31:19'),
(59, '18K', 10725.00, 10845.00, 1, '2026-07-08 06:31:44'),
(60, '24K', 14150.00, 14334.00, 1, '2026-07-09 06:06:52'),
(61, '22K', 12960.00, 13130.00, 1, '2026-07-09 06:07:20'),
(62, '18K', 10610.00, 10751.00, 1, '2026-07-09 06:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `report_status_master`
--

CREATE TABLE `report_status_master` (
  `id` int(11) NOT NULL,
  `status_name` varchar(100) NOT NULL,
  `status_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_status_master`
--

INSERT INTO `report_status_master` (`id`, `status_name`, `status_code`, `created_at`) VALUES
(1, 'Potential', 'potential', '2026-06-14 05:11:23'),
(2, 'Enquiry', 'enquiry', '2026-06-14 05:11:23'),
(3, 'Call Back', 'callback', '2026-06-14 05:11:23'),
(4, 'Repledge', 'repledge', '2026-06-14 05:11:23'),
(5, 'Pledge', 'pledge', '2026-06-14 05:11:23'),
(6, 'Out Of Station', 'out_station', '2026-06-14 05:11:23'),
(7, 'Not Interested', 'not_interested', '2026-06-14 05:11:23'),
(8, 'Genuine Reject', 'genuine_reject', '2026-06-14 05:11:23'),
(9, 'Fraud Reject', 'fraud_reject', '2026-06-14 05:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('super_admin','staff') DEFAULT 'staff',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Super Admin', 'aghnigoldadmin@gmail.com', '$2b$10$vHy5XJapP/fjlBEefh0dAueZ0G8uwwipxc0oWAhrqBzM05E4MSbf2', 'super_admin', '2026-06-14 05:11:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gold_rates`
--
ALTER TABLE `gold_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lead_source` (`lead_source_id`);

--
-- Indexes for table `lead_followups`
--
ALTER TABLE `lead_followups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `lead_notes`
--
ALTER TABLE `lead_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_history`
--
ALTER TABLE `rate_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_status_master`
--
ALTER TABLE `report_status_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gold_rates`
--
ALTER TABLE `gold_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `lead_followups`
--
ALTER TABLE `lead_followups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_notes`
--
ALTER TABLE `lead_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rate_history`
--
ALTER TABLE `rate_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `report_status_master`
--
ALTER TABLE `report_status_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `fk_lead_source` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_sources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lead_followups`
--
ALTER TABLE `lead_followups`
  ADD CONSTRAINT `lead_followups_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_notes`
--
ALTER TABLE `lead_notes`
  ADD CONSTRAINT `lead_notes_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;
COMMIT;
USE old_gold_crm;

describe lead_sources;

drop table lead_sources;

CREATE TABLE lead_sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_name VARCHAR(100) NOT NULL,
    domain_name VARCHAR(255) DEFAULT NULL,
    description VARCHAR(255) DEFAULT NULL,
    status ENUM('active','inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO lead_sources (source_name, domain_name) VALUES
('Aghni Finance Gold', 'aghnifinancegold.co'),
('Aghni Gold Bank', 'aghnigoldbank.online'),
('Aghni Gold New Page', 'goldnewpage.in');

ALTER TABLE leads
ADD COLUMN lead_source_id INT NULL AFTER source,
ADD COLUMN landing_page VARCHAR(255) NULL AFTER lead_source_id,
ADD COLUMN ip_address VARCHAR(100) NULL AFTER landing_page,
ADD COLUMN user_agent TEXT NULL AFTER ip_address,
ADD COLUMN referrer VARCHAR(500) NULL AFTER user_agent,
ADD COLUMN utm_source VARCHAR(255) NULL AFTER referrer,
ADD COLUMN utm_medium VARCHAR(255) NULL AFTER utm_source,
ADD COLUMN utm_campaign VARCHAR(255) NULL AFTER utm_medium,
ADD COLUMN utm_content VARCHAR(255) NULL AFTER utm_campaign,
ADD COLUMN utm_term VARCHAR(255) NULL AFTER utm_content;

ALTER TABLE leads
ADD CONSTRAINT fk_lead_source
FOREIGN KEY (lead_source_id)
REFERENCES lead_sources(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

DESCRIBE leads;


ALTER TABLE leads
ADD COLUMN pincode VARCHAR(10) NULL AFTER city;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
