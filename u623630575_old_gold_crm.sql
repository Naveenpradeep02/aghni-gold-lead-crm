-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 17, 2026 at 07:08 AM
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
(1, '24K', 14265.00, 14000.00, '2026-06-14 05:11:23'),
(2, '22K', 13065.00, 12824.00, '2026-06-14 05:11:23'),
(3, '18K', 10697.00, 10500.00, '2026-06-14 05:11:23');

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
  `status` enum('Potential','Enquiry','Call Back','Hindi Person','Sales Done With Us','Out Of Station','Not Interested','Genuine Reject','Fraud Reject','New','Contacted','Sales Done With Others') DEFAULT 'New',
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

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `customer_name`, `mobile`, `email`, `city`, `pincode`, `gold_type`, `weight`, `market_value`, `purchase_value`, `status`, `gold_location`, `pledged_amount`, `bank_finance_name`, `expected_sell_date`, `ornament_type`, `purity_verified`, `visit_required`, `pickup_required`, `source`, `lead_source_id`, `landing_page`, `ip_address`, `user_agent`, `referrer`, `utm_source`, `utm_medium`, `utm_campaign`, `utm_content`, `utm_term`, `source_id`, `report_status_id`, `created_at`) VALUES
(69, 'M.Nayanthara', '8148563415', 'mnayanthara30@gmail.com', 'Chennai', NULL, '22K', 2.00, 26550.00, 26200.00, 'Call Back', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=Cj0KCQjwjb3SBhDgARIsAMKiWziCqYH9RycPbKVhE-sHf-SpgFVG704n5uqiC7ZrDNYxmPvjPa2vs84aApUlEALw_wcB', '27.62.42.109', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-10 06:06:44'),
(72, 'Sutharsan', '8637472465', 'v.sutharsan7@gmail.com', 'Chennai', NULL, '22K', 3.97, 52701.75, 52007.00, 'Not Interested', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=Cj0KCQjwsMLSBhD9ARIsAIpUTDoBQFqALw6_epgQ9C2oVevBUAAa2mIj8yY-yV0-dgBoogtdHp-dEq8aAvFmEALw_wcB', '152.57.95.97', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-10 07:04:54'),
(73, 'Suman', '9994482264', 'sumanraj462914@gmail.com', 'Chennai', NULL, '22K', 8.00, 106200.00, 104800.00, 'Call Back', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=Cj0KCQjwsMLSBhD9ARIsAIpUTDqYtcAeAHcQEwA7PNHrYa25oXsodLgCnY9f9dbg2ouav9im8gZTGWEaArgPEALw_wcB', '106.192.175.144', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_2_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/150.0.7871.113 Mobile/15E148 Safari/604.1', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-11 06:00:55'),
(74, 'Kavinesan', '9943860219', 'kaviabbas.2001@gmail.com', 'Chennai', NULL, '22K', 1.00, 13275.00, 13100.00, 'Sales Done With Others', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=CjwKCAjw08fSBhA7EiwAfbQTsGTXm-3FYpxKaPgelH3KAlcy0XfoSLltCOQaq9tW5GMB8NpowFjOGhoCmNIQAvD_BwE', '27.5.87.179', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/416.4.894748588 Mobile/15E148 Safari/604.1', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-11 12:49:23'),
(75, 'Mahalakshmi T', '6381843859', 'mahahdkkcc@gmail.com', 'Chennai', NULL, '22K', 12.00, 159300.00, 157200.00, 'Call Back', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=CjwKCAjw08fSBhA7EiwAfbQTsGxuNnlVFotr44daKk1GsPCIUK6lHb_kk_ZUkpXtGe5CQbB3kH-mBBoCR6YQAvD_BwE', '157.51.113.246', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-12 04:11:59'),
(77, 'G.ANAND KUMAR', '9444510899', 'anandchonat@gmail.com', 'Chennai', NULL, '22K', 2.80, 37170.00, 36680.00, 'Sales Done With Us', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=CjwKCAjw9szSBhBNEiwAC57Sq11yx74bRZ_GUYq2O_7ec5-C2YsT57kfAOLWIZFnBUp8tiMDPMAY8xoCMIEQAvD_BwE', '157.51.126.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-12 12:25:02'),
(78, 'Arjun', '9884448824', 'aarjun_aj@yahoo.com', 'Chennai', NULL, '22K', 5.00, 66375.00, 65500.00, 'Enquiry', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=CjwKCAjw9szSBhBNEiwAC57Sq50g7HBgNZNR4_-9PJweWkPlcjdRBsEV38_SUrKeiEz1WTHfiSuoexoC1_YQAvD_BwE', '106.51.175.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/428.4.939275213 Mobile/15E148 Safari/604.1', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-12 14:16:41'),
(79, 'Sindhuja', '8608829504', 'sindhu.1247@gmail.com', 'Chennai', NULL, '22K', 139.00, 1845225.00, 1820900.00, 'Call Back', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=CjwKCAjw9szSBhBNEiwAC57SqzcYmA7wSao8PiVq8VRx07jr4_r4ce6ZCbsl66ItVFy-HWhWvEn_WxoC_6cQAvD_BwE', '223.237.187.60', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_3_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/145.0.7632.108 Mobile/15E148 Safari/604.1', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-12 14:37:58'),
(80, 'HARIHARAN BHARATH KUMAR', '9500002058', 'bharathkumar.h@gmail.com', 'Chennai', NULL, '22K', 40.00, 524000.00, 520000.00, 'Call Back', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gbraid=0AAAAA-TVOBb3vnauRer0SRa76iSNxkxHy&gclid=CjwKCAjwmdLSBhANEiwAkREMN0Vx6f1jSwIGQwSetF3SsvGXei-UUdPN8TAkSJhdtCk6oQDrHGoE6xoCLJsQAvD_BwE', '115.99.121.63', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-13 13:25:00'),
(81, 'Angeline Gnana Prakasi Y', '9791324228', 'angelinearul86@gmail.com', 'Chennai', NULL, '22K', 250.00, 3275000.00, 3250000.00, 'Enquiry', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gbraid=0AAAAA-TVOBZvCcyeamixHqXUo-bl5SboP&gclid=CjwKCAjwmdLSBhANEiwAkREMNykSVs5ys7HSNJoI0y5tBz8eF2_i8gadzfc0Xmh7R8Qcp00qB_oX5RoC4eUQAvD_BwE', '171.79.57.3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-13 14:04:15'),
(82, 'Dharani Kathirvel', '7397660263', 'tocutedharani@gmail.com', 'Chennai', NULL, '22K', 1.38, 18064.20, 17884.80, 'Sales Done With Us', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=CjwKCAjwvNfSBhBiEiwAyaGMCYr1D5ftyx0IBj9ibzo2hZugfTzukBHslF8Il2gPSYycDqHhlX3sahoCb2AQAvD_BwE', '106.192.78.117', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-14 11:37:13'),
(83, 'Krishna Priya', '8101296588', 'krishnapriya01kp@gmail.com', 'Chennai', NULL, '22K', 3.00, 39270.00, 38880.00, 'Not Interested', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=CjwKCAjwvNfSBhBiEiwAyaGMCbtPlRdBeEKb3bAMRiRneayikzK74k0oCwwIenloVaH1cOIIvQZbmBoCG6QQAvD_BwE', '157.51.124.201', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-14 12:04:43'),
(84, 'Padhmanaban Duraisamy', '9945933544', 'padhmanabanduraisamy@gmail.com', 'Chennai', NULL, '18K', 7.50, 80385.00, 79575.00, 'Potential', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=CjwKCAjwvNfSBhBiEiwAyaGMCYB5HgILJ3zqn-u0AZ0MeQHLMW32wSVHQ9BjuEfXRo0gtAdP-5psqhoC1fUQAvD_BwE', '183.82.204.152', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-14 15:07:26'),
(85, 'Parth', '9940012345', '123@yahoo.com', 'Chennai', NULL, '22K', 140.00, 1832600.00, 1814400.00, 'Call Back', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=CjwKCAjwvNfSBhBiEiwAyaGMCcrQJCO0IthPoaTxoKI2Uwh_blDcZcgJQR3k4ca7BnOd53VnZjXyYhoChZEQAvD_BwE', '122.167.102.168', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-15 05:49:24'),
(86, 'Anitha', '8056285298', 'anithaani218@gmail.com', 'Chennai', NULL, '22K', 33.00, 434280.00, 429000.00, 'Genuine Reject', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gbraid=0AAAAA-TVOBYrZozvsNLDjEyXJLONqkjnl&gclid=Cj0KCQjwguLSBhDLARIsAH-yPrFz29vxpP72UiKv9o39Pia1TADqENyntjtJak71RmRytWs3Yo0QJ34aAry3EALw_wcB', '27.61.59.235', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-16 08:42:25'),
(87, 'Anitha', '8056285298', 'anithaani218@gmail.com', 'Chennai', NULL, '22K', 33.00, 434280.00, 429000.00, 'Genuine Reject', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gbraid=0AAAAA-TVOBYrZozvsNLDjEyXJLONqkjnl&gclid=Cj0KCQjwguLSBhDLARIsAH-yPrFz29vxpP72UiKv9o39Pia1TADqENyntjtJak71RmRytWs3Yo0QJ34aAry3EALw_wcB', '27.61.59.235', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-16 08:43:15'),
(88, 'Kumaresan', '9094092563', 'ekumara1989@gmail.com', 'Chennai', NULL, '22K', 8.00, 105280.00, 104000.00, 'New', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gbraid=0AAAAA-TVOBbZ2n2JKKzs7JYsc00EQYjC9&gclid=EAIaIQobChMIwZyX6PnYlQMVvMQ8Ah2b3iLXEAAYASAAEgIdzvD_BwE', '117.242.1.123', 'Mozilla/5.0 (Linux; Android 15; V2355) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/131.0.6778.200 Mobile Safari/537.36 VivoBrowser/16.2.5.1', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-17 05:14:21'),
(89, 'Vishnu Bharath AC', '9940580459', 'bharathacv@gmail.com', 'Chennai', NULL, '22K', 200.00, 2632000.00, 2600000.00, 'Potential', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gbraid=0AAAAA-TVOBZzeG9mH3SWgrK-Xcrt2HuOS&gclid=Cj0KCQjwguLSBhDLARIsAH-yPrFO67q0TGoX5NyfwBlNXR_KD2g-Ionqu7oOLz9Xy3MQuLR0ayzGYvIaAlelEALw_wcB', '49.37.215.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-17 05:25:44'),
(90, 'S. Naresh Kumar', '9710020458', 'nareshks1989@gmail.com', 'Chennai', NULL, '22K', 3.20, 42112.00, 41600.00, 'New', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gbraid=0AAAAA-TVOBbZ2n2JKKzs7JYsc00EQYjC9&gclid=Cj0KCQjwguLSBhDLARIsAH-yPrH3Mx_lB2K39s1_PmC-b0X5R7totM4coTNjbWq2Cwl3sqaJLZvoYkYaAhTxEALw_wcB', '106.195.35.22', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-17 05:32:49'),
(91, 'Priyanka', '9363414574', 'kpriyanka.gems@gmail.com', 'Chennai', NULL, '22K', 15.37, 202269.20, 199810.00, 'New', 'in_hand', 0.00, '', NULL, 'Gold Jewellery', 0, 0, 0, NULL, 1, 'https://aghnigold.in/?gad_source=1&gad_campaignid=23803902472&gclid=Cj0KCQjwguLSBhDLARIsAH-yPrFhkLotl41asrtrN4hwUutZ_Q2SVef7Ko3JeMaOQXD27YudSKk3JkEaAt52EALw_wcB', '152.57.89.91', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', 'https://aghnigold.in/', 'Direct', 'Website', NULL, NULL, NULL, NULL, NULL, '2026-07-17 06:21:24');

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

--
-- Dumping data for table `lead_notes`
--

INSERT INTO `lead_notes` (`id`, `lead_id`, `note`, `created_by`, `created_at`) VALUES
(5, 72, 'NOT INTERSESTED RIGHT NOW.WHEN HE NEED HE CALL BACK US.', 1, '2026-07-10 09:00:30'),
(6, 69, 'CALL BACK', 1, '2026-07-10 09:02:23'),
(7, 72, 'sudharshan |3.97 grams|pledge in indian bank|916|egmore|', 1, '2026-07-13 06:56:35'),
(8, 69, 'nayanthara|2 grams|916|', 1, '2026-07-13 06:58:00'),
(9, 73, 'call back', 1, '2026-07-13 06:58:57'),
(10, 74, 'sholinganallur ', 1, '2026-07-13 06:59:39'),
(11, 74, 'sale done with outside', 1, '2026-07-13 06:59:54'),
(12, 75, 'always decline the call\n', 1, '2026-07-13 07:00:45'),
(13, 77, 'anand kumar -p.n |916|2.80 grams|pawnshop-nerkundram|p.a-16500|p.d-10 days|916 hallmark|paras jewellers-2 momnths-bill iruku|rent house|', 1, '2026-07-13 07:04:37'),
(14, 77, 'chit received potential tuesday process', 1, '2026-07-13 07:05:08'),
(15, 78, 'call back', 1, '2026-07-13 07:06:01'),
(16, 79, 'call back', 1, '2026-07-13 07:06:28'),
(17, 84, 'evening direct office visit', 1, '2026-07-15 06:22:58'),
(18, 83, 'no need just rate checked', 1, '2026-07-15 06:24:11'),
(19, 77, 'sales done with us \\ 15.07.2026 \\  total 2.8 grams', 1, '2026-07-15 06:26:57'),
(20, 87, 'Tally agala. ', 1, '2026-07-16 09:24:12');

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
(62, '18K', 10610.00, 10751.00, 1, '2026-07-09 06:07:46'),
(63, '24K', 14300.00, 14490.00, 1, '2026-07-10 05:34:43'),
(64, '22K', 13100.00, 13275.00, 1, '2026-07-10 05:35:09'),
(65, '18K', 10725.00, 10860.00, 1, '2026-07-10 05:35:59'),
(66, '24K', 14200.00, 14300.00, 1, '2026-07-13 07:44:45'),
(67, '22K', 13000.00, 13100.00, 1, '2026-07-13 07:45:00'),
(68, '18K', 10650.00, 10720.00, 1, '2026-07-13 07:45:18'),
(69, '24K', 14150.00, 14290.00, 1, '2026-07-14 07:35:59'),
(70, '22K', 12960.00, 13090.00, 1, '2026-07-14 07:36:32'),
(71, '24K', 14150.00, 14290.00, 1, '2026-07-14 07:36:34'),
(72, '18K', 10610.00, 10718.00, 1, '2026-07-14 07:36:48'),
(73, '24K', 14150.00, 14290.00, 1, '2026-07-14 07:37:01'),
(74, '22K', 12960.00, 13090.00, 1, '2026-07-14 07:37:02'),
(75, '18K', 10610.00, 10718.00, 1, '2026-07-14 07:37:03'),
(76, '24K', 14200.00, 14367.00, 1, '2026-07-15 10:49:38'),
(77, '22K', 13000.00, 13160.00, 1, '2026-07-15 10:49:56'),
(78, '18K', 10650.00, 10775.00, 1, '2026-07-15 10:50:13'),
(79, '24K', 14200.00, 14367.00, 1, '2026-07-15 10:50:27'),
(80, '22K', 13000.00, 13160.00, 1, '2026-07-15 10:50:28'),
(81, '18K', 10650.00, 10775.00, 1, '2026-07-15 10:50:29'),
(82, '24K', 14000.00, 14265.00, 1, '2026-07-17 06:42:43'),
(83, '22K', 12824.00, 13065.00, 1, '2026-07-17 06:42:46'),
(84, '18K', 10500.00, 10697.00, 1, '2026-07-17 06:43:06'),
(85, '22K', 12824.00, 13065.00, 1, '2026-07-17 06:43:07'),
(86, '24K', 14000.00, 14265.00, 1, '2026-07-17 06:43:09');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `lead_followups`
--
ALTER TABLE `lead_followups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_notes`
--
ALTER TABLE `lead_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rate_history`
--
ALTER TABLE `rate_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
