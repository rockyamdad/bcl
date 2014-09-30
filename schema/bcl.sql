-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 30, 2014 at 01:56 PM
-- Server version: 5.5.35
-- PHP Version: 5.3.10-1ubuntu3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bcl`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_suppliers`
--

CREATE TABLE IF NOT EXISTS `client_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_suppliers_email_unique` (`email`),
  KEY `client_suppliers_country_id_foreign` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `client_suppliers`
--

INSERT INTO `client_suppliers` (`id`, `first_name`, `last_name`, `email`, `sex`, `phone`, `company_name`, `address`, `country_id`, `group_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'hasan', 'jhlk', 'rakeybulhasan@gmail.com', 0, '89798', 'jhbk', 'jkhk', 4, 1, 1, '2014-04-09 01:11:33', '2014-05-08 01:31:40', NULL),
(2, 'jhlk', 'kjnklj', 'zahid.sa@yahoo.com', 1, '5498809', 'em', 'jbkbjk', 1, 2, 1, '2014-04-13 00:59:27', '2014-05-11 02:27:24', NULL),
(3, 'ff', 'ef', 'ere@yahoo.com', 1, '5498809', 'dfg', 'fd', 1, 1, 0, '2014-05-11 02:29:34', '2014-05-11 05:37:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=253 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'Afghanistan'),
(2, 'Albania'),
(3, 'Algeria'),
(4, 'American Samoa'),
(5, 'Andorra'),
(6, 'Angola'),
(7, 'Anguilla'),
(8, 'Antarctica'),
(9, 'Antigua and Barbuda'),
(10, 'Argentina'),
(11, 'Armenia'),
(12, 'Armenia'),
(13, 'Aruba'),
(14, 'Australia'),
(15, 'Austria'),
(16, 'Azerbaijan'),
(17, 'Azerbaijan'),
(18, 'Bahamas'),
(19, 'Bahrain'),
(20, 'Bangladesh'),
(21, 'Barbados'),
(22, 'Belarus'),
(23, 'Belgium'),
(24, 'Belize'),
(25, 'Benin'),
(26, 'Bermuda'),
(27, 'Bhutan'),
(28, 'Bolivia'),
(29, 'Bosnia and Herzegovina'),
(30, 'Botswana'),
(31, 'Bouvet Island'),
(32, 'Brazil'),
(33, 'British Indian Ocean Territory'),
(34, 'Brunei Darussalam'),
(35, 'Bulgaria'),
(36, 'Burkina Faso'),
(37, 'Burundi'),
(38, 'Cambodia'),
(39, 'Cameroon'),
(40, 'Canada'),
(41, 'Cape Verde'),
(42, 'Cayman Islands'),
(43, 'Central African Republic'),
(44, 'Chad'),
(45, 'Chile'),
(46, 'China'),
(47, 'Christmas Island'),
(48, 'Cocos (Keeling) Islands'),
(49, 'Colombia'),
(50, 'Comoros'),
(51, 'Congo'),
(52, 'Congo, The Democratic Republic of The'),
(53, 'Cook Islands'),
(54, 'Costa Rica'),
(55, 'Cote D''ivoire'),
(56, 'Croatia'),
(57, 'Cuba'),
(58, 'Cyprus'),
(60, 'Czech Republic'),
(61, 'Denmark'),
(62, 'Djibouti'),
(63, 'Dominica'),
(64, 'Dominican Republic'),
(65, 'Easter Island'),
(66, 'Ecuador'),
(67, 'Egypt'),
(68, 'El Salvador'),
(69, 'Equatorial Guinea'),
(70, 'Eritrea'),
(71, 'Estonia'),
(72, 'Ethiopia'),
(73, 'Falkland Islands (Malvinas)'),
(74, 'Faroe Islands'),
(75, 'Fiji'),
(76, 'Finland'),
(77, 'France'),
(78, 'French Guiana'),
(79, 'French Polynesia'),
(80, 'French Southern Territories'),
(81, 'Gabon'),
(82, 'Gambia'),
(83, 'Georgia'),
(85, 'Germany'),
(86, 'Ghana'),
(87, 'Gibraltar'),
(88, 'Greece'),
(89, 'Greenland'),
(91, 'Grenada'),
(92, 'Guadeloupe'),
(93, 'Guam'),
(94, 'Guatemala'),
(95, 'Guinea'),
(96, 'Guinea-bissau'),
(97, 'Guyana'),
(98, 'Haiti'),
(99, 'Heard Island and Mcdonald Islands'),
(100, 'Honduras'),
(101, 'Hong Kong'),
(102, 'Hungary'),
(103, 'Iceland'),
(104, 'India'),
(105, 'Indonesia'),
(106, 'Indonesia'),
(107, 'Iran'),
(108, 'Iraq'),
(109, 'Ireland'),
(110, 'Israel'),
(111, 'Italy'),
(112, 'Jamaica'),
(113, 'Japan'),
(114, 'Jordan'),
(115, 'Kazakhstan'),
(116, 'Kazakhstan'),
(117, 'Kenya'),
(118, 'Kiribati'),
(119, 'Korea, North'),
(120, 'Korea, South'),
(121, 'Kosovo'),
(122, 'Kuwait'),
(123, 'Kyrgyzstan'),
(124, 'Laos'),
(125, 'Latvia'),
(126, 'Lebanon'),
(127, 'Lesotho'),
(128, 'Liberia'),
(129, 'Libyan Arab Jamahiriya'),
(130, 'Liechtenstein'),
(131, 'Lithuania'),
(132, 'Luxembourg'),
(133, 'Macau'),
(134, 'Macedonia'),
(135, 'Madagascar'),
(136, 'Malawi'),
(137, 'Malaysia'),
(138, 'Maldives'),
(139, 'Mali'),
(140, 'Malta'),
(141, 'Marshall Islands'),
(142, 'Martinique'),
(143, 'Mauritania'),
(144, 'Mauritius'),
(145, 'Mayotte'),
(146, 'Mexico'),
(147, 'Micronesia, Federated States of'),
(148, 'Moldova, Republic of'),
(149, 'Monaco'),
(150, 'Mongolia'),
(151, 'Montenegro'),
(152, 'Montserrat'),
(153, 'Morocco'),
(154, 'Mozambique'),
(155, 'Myanmar'),
(156, 'Namibia'),
(157, 'Nauru'),
(158, 'Nepal'),
(159, 'Netherlands'),
(160, 'Netherlands Antilles'),
(161, 'New Caledonia'),
(162, 'New Zealand'),
(163, 'Nicaragua'),
(164, 'Niger'),
(165, 'Nigeria'),
(166, 'Niue'),
(167, 'Norfolk Island'),
(168, 'Northern Mariana Islands'),
(169, 'Norway'),
(170, 'Oman'),
(171, 'Pakistan'),
(172, 'Palau'),
(173, 'Palestinian Territory'),
(174, 'Panama'),
(175, 'Papua New Guinea'),
(176, 'Paraguay'),
(177, 'Peru'),
(178, 'Philippines'),
(179, 'Pitcairn'),
(180, 'Poland'),
(181, 'Portugal'),
(182, 'Puerto Rico'),
(183, 'Qatar'),
(184, 'Reunion'),
(185, 'Romania'),
(186, 'Russia'),
(187, 'Russia'),
(188, 'Rwanda'),
(189, 'Saint Helena'),
(190, 'Saint Kitts and Nevis'),
(191, 'Saint Lucia'),
(192, 'Saint Pierre and Miquelon'),
(193, 'Saint Vincent and The Grenadines'),
(194, 'Samoa'),
(195, 'San Marino'),
(196, 'Sao Tome and Principe'),
(197, 'Saudi Arabia'),
(198, 'Senegal'),
(199, 'Serbia and Montenegro'),
(200, 'Seychelles'),
(201, 'Sierra Leone'),
(202, 'Singapore'),
(203, 'Slovakia'),
(204, 'Slovenia'),
(205, 'Solomon Islands'),
(206, 'Somalia'),
(207, 'South Africa'),
(208, 'South Georgia and The South Sandwich Islands'),
(209, 'Spain'),
(210, 'Sri Lanka'),
(211, 'Sudan'),
(212, 'Suriname'),
(213, 'Svalbard and Jan Mayen'),
(214, 'Swaziland'),
(215, 'Sweden'),
(216, 'Switzerland'),
(217, 'Syria'),
(218, 'Taiwan'),
(219, 'Tajikistan'),
(220, 'Tanzania, United Republic of'),
(221, 'Thailand'),
(222, 'Timor-leste'),
(223, 'Togo'),
(224, 'Tokelau'),
(225, 'Tonga'),
(226, 'Trinidad and Tobago'),
(227, 'Tunisia'),
(228, 'Turkey'),
(229, 'Turkey'),
(230, 'Turkmenistan'),
(231, 'Turks and Caicos Islands'),
(232, 'Tuvalu'),
(233, 'Uganda'),
(234, 'Ukraine'),
(235, 'United Arab Emirates'),
(236, 'United Kingdom'),
(237, 'United States'),
(238, 'United States Minor Outlying Islands'),
(239, 'Uruguay'),
(240, 'Uzbekistan'),
(241, 'Vanuatu'),
(242, 'Vatican City'),
(243, 'Venezuela'),
(244, 'Vietnam'),
(245, 'Virgin Islands, British'),
(246, 'Virgin Islands, U.S.'),
(247, 'Wallis and Futuna'),
(248, 'Western Sahara'),
(249, 'Yemen'),
(250, 'Yemen'),
(251, 'Zambia'),
(252, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_04_02_054805_create_countries_table', 1),
('2014_04_09_065016_create_users_table', 2),
('2014_04_09_070550_create_client_suppliers_table', 3),
('2014_04_08_072658_create_products_table', 4),
('2014_04_17_061400_create_product_categories_table', 4),
('2014_05_04_104626_add_has_category_to_products', 5),
('2014_04_27_075036_create_offers_table', 6),
('2014_05_06_063305_add_status_to_offers', 6),
('2014_05_20_061532_create_offer_products_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `attachment` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pi` tinyint(1) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offers_client_id_foreign` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `offer_products`
--

CREATE TABLE IF NOT EXISTS `offer_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `price` float(10,2) NOT NULL,
  `commission` float(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `line_total` float(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_products_offer_id_foreign` (`offer_id`),
  KEY `offer_products_category_id_foreign` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `has_category` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `description`, `created_by`, `created_at`, `updated_at`, `deleted_at`, `has_category`) VALUES
(1, 'santo aaadd', 'kjk', 1, '2014-04-30 01:05:08', '2014-05-04 03:28:55', NULL, 0),
(2, 'pen', 'fee', 1, '2014-05-05 00:31:10', '2014-05-05 00:31:10', NULL, 0),
(4, 'bfg', 'rg', 1, '2014-05-10 23:52:21', '2014-05-10 23:52:21', NULL, 1),
(5, 'lyf jaket', 'dscd', 1, '2014-05-20 00:39:38', '2014-05-20 00:39:38', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `parent_id` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `commission` float(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_product_id_foreign` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category_name`, `product_id`, `parent_id`, `price`, `commission`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, 0, 300000.00, 100.00, '2014-04-30 01:05:08', '2014-05-04 03:30:16', NULL),
(2, 'econo', 2, 0, 32.00, 2.00, '2014-05-05 00:31:10', '2014-05-05 00:31:10', NULL),
(3, 'metro', 2, 1, 55.00, 4.00, '2014-05-05 00:31:10', '2014-05-10 23:30:44', NULL),
(6, 'g', 4, 0, 44.00, 4.00, '2014-05-10 23:52:21', '2014-05-10 23:52:21', NULL),
(7, 'ttt', 4, 1, 5554.00, 4.00, '2014-05-10 23:52:21', '2014-05-10 23:52:21', NULL),
(8, '', 5, 0, 434.00, 4.00, '2014-05-20 00:39:38', '2014-05-20 00:39:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_country_id_foreign` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `country_id`, `company_name`, `address`, `group_id`, `sex`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin', 'admin@yahoo.com', '$2y$10$5rupPTlRrG5vTgUz1jKVoOdJQLIn4A/pZQylD5czNAO6ezqWLdAHW', '2342342', 5, 'RBS', 'vvvvv', 1, 1, 1, '2014-04-08 18:00:00', '2014-05-12 01:58:31', '2014-04-09 07:08:28'),
(2, 'kjhkl', 'jb,', 'hassan.bai@yahoo.com', '$2y$10$3tsVcXotTZnFWH4TzfRJJ.N8s6olM5A60EqJcF9wPGahHiKlLw3QS', '897097', 1, 'hjbj', 'jbhbk', 2, 0, 1, '2014-04-15 00:24:04', '2014-05-12 00:25:32', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_suppliers`
--
ALTER TABLE `client_suppliers`
  ADD CONSTRAINT `client_suppliers_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `client_suppliers` (`id`);

--
-- Constraints for table `offer_products`
--
ALTER TABLE `offer_products`
  ADD CONSTRAINT `offer_products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`),
  ADD CONSTRAINT `offer_products_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`);

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
