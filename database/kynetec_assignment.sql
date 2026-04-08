-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2026 at 04:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keynetic_assign`
--

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
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`) VALUES
(6, 'Electronics', NULL),
(7, 'Fashion', NULL),
(8, 'Mobiles', 6),
(9, 'Laptops', 6),
(10, 'Mens Wear', 7);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('percentage','fixed') NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `title`, `type`, `value`, `created_at`, `updated_at`) VALUES
(4, 'Summer Sale 10%', 'percentage', 10.00, '2026-04-08 04:38:53', '2026-04-08 04:38:53'),
(5, 'Flat 500 Off', 'fixed', 500.00, '2026-04-08 04:38:53', '2026-04-08 04:38:53'),
(6, 'Festival 5%', 'percentage', 5.00, '2026-04-08 04:38:53', '2026-04-08 04:38:53');

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
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `last_restocked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `last_restocked_at`, `created_at`, `updated_at`) VALUES
(4, 4, 15, '2026-04-08 04:38:53', NULL, NULL),
(5, 5, 10, '2026-04-08 04:38:53', NULL, NULL),
(6, 6, 50, '2026-04-08 04:38:53', NULL, NULL);

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
(4, '2026_04_08_072014_create_personal_access_tokens_table', 1),
(5, '2026_04_08_072210_create_categories_table', 1),
(6, '2026_04_08_072216_create_products_table', 1),
(7, '2026_04_08_072223_create_discounts_table', 1),
(8, '2026_04_08_072240_create_orders_table', 1),
(9, '2026_04_08_072245_create_inventories_table', 1),
(10, '2026_04_08_072250_create_order_items_table', 1),
(11, '2026_04_08_072255_create_product_discount_table', 1),
(12, '2026_04_08_142356_create_oauth_auth_codes_table', 2),
(13, '2026_04_08_142357_create_oauth_access_tokens_table', 2),
(14, '2026_04_08_142358_create_oauth_refresh_tokens_table', 2),
(15, '2026_04_08_142359_create_oauth_clients_table', 2),
(16, '2026_04_08_142400_create_oauth_device_codes_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` char(80) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2aeafd094471901d3950f54fe7dd03f408bbd7261a1191f10b4d401ac6a568be61590575a439a632', 3, '019d6d7b-a7a4-7344-8972-25c6487dee86', 'API Token', '[]', 0, '2026-04-08 09:02:05', '2026-04-08 09:02:05', '2027-04-08 14:32:05'),
('4f50c1206cc061d5a86a346ba0201b38705e67dde320dd60b0fd1db1360c359554e2b127cf5a029f', 3, '019d6d7b-a7a4-7344-8972-25c6487dee86', 'API Token', '[]', 0, '2026-04-08 09:01:09', '2026-04-08 09:01:09', '2027-04-08 14:31:09'),
('64b4c15f47867e2354ca7be9a1f96ffa2c639fa9e8a3940dd434a579efabf132b05962ac33cf0518', 4, '019d6d7b-a7a4-7344-8972-25c6487dee86', 'API Token', '[]', 0, '2026-04-08 09:00:58', '2026-04-08 09:00:58', '2027-04-08 14:30:58'),
('d3302b22803d127ed16dd36e4112c9deeef83b02b0c00147355f8ba5a02a3caf8ef866f8e8453dd7', 3, '019d6d7b-a7a4-7344-8972-25c6487dee86', 'API Token', '[]', 0, '2026-04-08 09:01:41', '2026-04-08 09:01:41', '2027-04-08 14:31:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` char(80) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) NOT NULL,
  `owner_type` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect_uris` text NOT NULL,
  `grant_types` text NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `owner_type`, `owner_id`, `name`, `secret`, `provider`, `redirect_uris`, `grant_types`, `revoked`, `created_at`, `updated_at`) VALUES
('019d6d7a-789f-7115-92db-b80d8ea41d00', NULL, NULL, 'KeyneticAssign', '$2y$12$mFGrp5SRqac9vd9.klUshOrsp62xDF8KBccVvbHXvbmDQPU0qzDxy', NULL, '[]', '[\"personal_access\"]', 0, '2026-04-08 08:53:56', '2026-04-08 08:53:56'),
('019d6d7b-a7a4-7344-8972-25c6487dee86', NULL, NULL, 'KeyneticAssign', '$2y$12$ZmXh9U9OxmRdp9pZIALqGOI9rTn6zZqB0XLX2vr69Q4fdQzPb2TQq', NULL, '[]', '[\"personal_access\"]', 0, '2026-04-08 08:55:13', '2026-04-08 08:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_device_codes`
--

CREATE TABLE `oauth_device_codes` (
  `id` char(80) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `user_code` char(8) NOT NULL,
  `scopes` text NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `user_approved_at` datetime DEFAULT NULL,
  `last_polled_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` char(80) NOT NULL,
  `access_token_id` char(80) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_purchase` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'api-token', '7f33bc3f98f0a735b5a37062b1dabe963083574cd49da00e442988db856dcdf2', '[\"*\"]', NULL, NULL, '2026-04-08 04:39:24', '2026-04-08 04:39:24'),
(2, 'App\\Models\\User', 3, 'api-token', '13ab0a98aae54135338fd471fbbda6065a39e219f7131d9709ce7b7e7333a982', '[\"*\"]', NULL, NULL, '2026-04-08 04:48:42', '2026-04-08 04:48:42'),
(3, 'App\\Models\\User', 3, 'api-token', '56f7acb13e8f4765b8ee847c67f21121336daca31e15b7274aea789f9dc7e830', '[\"*\"]', NULL, NULL, '2026-04-08 04:49:27', '2026-04-08 04:49:27'),
(4, 'App\\Models\\User', 3, 'api-token', 'd832ec3fcab6b91d5b36a744863799860c594bcaab24451ebbdbf748498c1995', '[\"*\"]', NULL, NULL, '2026-04-08 04:50:27', '2026-04-08 04:50:27'),
(5, 'App\\Models\\User', 3, 'api-token', '7074e6629fa8d099e080366d4667d9c0ea51e3b44ec7da5b43cafe594200cd6e', '[\"*\"]', NULL, NULL, '2026-04-08 04:52:48', '2026-04-08 04:52:48'),
(6, 'App\\Models\\User', 3, 'api-token', '01576c9a7e1b448343ec3d0acfb2c62160e17f77f2ec0cf7f06fc8087e482693', '[\"*\"]', NULL, NULL, '2026-04-08 04:55:49', '2026-04-08 04:55:49'),
(7, 'App\\Models\\User', 3, 'api-token', 'f335327704745c4d614f46c01b853f1415c6a05a037e7dc1846e810b5e8fc96e', '[\"*\"]', NULL, NULL, '2026-04-08 05:03:17', '2026-04-08 05:03:17'),
(8, 'App\\Models\\User', 3, 'api-token', 'b813bb28cff0b342b4932025e232975a640f1e1ef0ebfff079a478e6d706eed9', '[\"*\"]', NULL, NULL, '2026-04-08 05:03:34', '2026-04-08 05:03:34'),
(9, 'App\\Models\\User', 3, 'api-token', 'e3414c1a02ef88100afd7e5c69bf43a408bb218110a4e7bbfedc082d9ede81f4', '[\"*\"]', NULL, NULL, '2026-04-08 05:05:56', '2026-04-08 05:05:56'),
(10, 'App\\Models\\User', 3, 'api-token', '3da968a85e73a58cbd8680b8327f65d7160ce1ffe89d88fde8e40141d7cf9a6b', '[\"*\"]', NULL, NULL, '2026-04-08 05:18:12', '2026-04-08 05:18:12'),
(11, 'App\\Models\\User', 3, 'api-token', '33f52e7bd19cbb565decdd9a43959c3ca6014d9a7ef8a826a902ede54e1cb783', '[\"*\"]', NULL, NULL, '2026-04-08 05:41:16', '2026-04-08 05:41:16'),
(12, 'App\\Models\\User', 3, 'api-token', 'c7cb3fec993d776c287a264ecf92f4b491d7f7f460dd0e081018a54b3bdc2bd5', '[\"*\"]', NULL, NULL, '2026-04-08 06:16:40', '2026-04-08 06:16:40'),
(13, 'App\\Models\\User', 3, 'api-token', 'dc3d609cd78880da9b2ae83ef665d3ab53a583e0ea10ff2b1e748cd30afc84c7', '[\"*\"]', NULL, NULL, '2026-04-08 06:17:57', '2026-04-08 06:17:57'),
(14, 'App\\Models\\User', 3, 'api-token', '25e4d4b9ec9d01bd29c57908b8c4e9e88d49feeae357f57168a4d7e79c4c1a6a', '[\"*\"]', NULL, NULL, '2026-04-08 06:56:05', '2026-04-08 06:56:05'),
(15, 'App\\Models\\User', 3, 'api-token', '98fab6381295a786db61293fa1dcafd2f6c7d3a30f74465e525874993b81e42a', '[\"*\"]', NULL, NULL, '2026-04-08 07:02:11', '2026-04-08 07:02:11'),
(16, 'App\\Models\\User', 3, 'api-token', 'f7e136ddf95714cca241f71c24f06c065a587ca1ed744b0cb9b2c6f0a507ec97', '[\"*\"]', NULL, NULL, '2026-04-08 07:21:16', '2026-04-08 07:21:16'),
(17, 'App\\Models\\User', 3, 'api-token', '12b9b188d3845ea8b17677b2035b68f5204a9987587ed7225321e42fb6117780', '[\"*\"]', NULL, NULL, '2026-04-08 07:34:30', '2026-04-08 07:34:30'),
(18, 'App\\Models\\User', 3, 'api-token', '30100cdcf2d300c047ab0aed889a1f9674c8cd7fd650d1fc51f77e354caec558', '[\"*\"]', NULL, NULL, '2026-04-08 07:40:59', '2026-04-08 07:40:59'),
(19, 'App\\Models\\User', 3, 'api-token', '3c0e1fea013654915a182923ac0fcf31c10a0d8b96a378f13cb34c1b5000c005', '[\"*\"]', NULL, NULL, '2026-04-08 07:43:03', '2026-04-08 07:43:03'),
(20, 'App\\Models\\User', 3, 'api-token', '0792088f3880a13cff78bede7301db78decdd9c23b42c20a7d6a319e2c401466', '[\"*\"]', NULL, NULL, '2026-04-08 07:52:07', '2026-04-08 07:52:07'),
(21, 'App\\Models\\User', 3, 'api-token', 'bfd0b25ade604880a0f03daa882d23fe31d673cd774e3d4d052ed1dec6ff4f30', '[\"*\"]', NULL, NULL, '2026-04-08 07:53:10', '2026-04-08 07:53:10'),
(22, 'App\\Models\\User', 3, 'api-token', 'ef8aa7173a5f5328be6bda8aeffce484717d8235067ad43a0f0fa2613eddb13b', '[\"*\"]', NULL, NULL, '2026-04-08 08:29:57', '2026-04-08 08:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category_id`, `created_at`, `updated_at`) VALUES
(4, 'iPhone 15', 'Apple smartphone with premium features', 79999.00, 8, '2026-04-08 04:38:53', '2026-04-08 04:38:53'),
(5, 'Dell Inspiron', 'Dell laptop for work and study', 55999.00, 9, '2026-04-08 04:38:53', '2026-04-08 04:38:53'),
(6, 'Men Casual Shirt', 'Comfortable cotton casual shirt', 1499.00, 10, '2026-04-08 04:38:53', '2026-04-08 04:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_discount`
--

CREATE TABLE `product_discount` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_discount`
--

INSERT INTO `product_discount` (`id`, `product_id`, `discount_id`) VALUES
(5, 4, 4),
(6, 4, 5),
(7, 5, 6),
(8, 6, 4);

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
('40Gd1oMCMN2CfPe0RxNNb2GJoZVMyXIqEeBHWDah', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHFtc0F4dmxTd3JlSDl3Rkt0VklxcUViUlVOMXV1SWVMYlF1cjJIVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1775652667),
('ndDVMGUHYbUjHNHYsHQmcuJ98PBZ9ZAQ5x1sC1qa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTJmM2tUT1lnN1V5c0FESUVGNDlOekZDRWlHWWx1V2JJR1BsSDQydyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1775658699),
('NYHHUQKhklbST9fAjS85zN4vOAYxsh3BtFE4KPEe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmZHNVRXWjZpcTZwWjBUbFpWUGV3aWZvRTNsR0N1MFRlaHpLSEZkNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjphZU1GdTZmaTl6NTM2aERsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1775644318),
('RWxUF7r9bEtNQaODTxTvfYFpur5MEhmo19OaOvNv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnltRVc4aXdGRU9nV2RVOTY4NDRqZUtjWDkzaTZsM016dEtHaWFmZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1775658693);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Admin User', 'admin@admin.com', NULL, '$2y$12$t1pEgMwCJ4X2mZHb2/rhw.OnFk9t5N29K/grCKNxTnHeMMAV/etT6', NULL, '2026-04-08 04:38:52', '2026-04-08 04:38:52'),
(4, 'Admin User', 'admin@example.com', NULL, '$2y$12$9hl2dRx6875jMc4IwQp29.45o38mm/igXLBgMcweJbRtv1CgQmko6', NULL, '2026-04-08 04:38:52', '2026-04-08 04:38:52'),
(5, 'Test User', 'user@example.com', NULL, '$2y$12$zDq7Cd7dBK5.Ta70GW4awObtF1f1fAN2CB2DjognKRxxC4rXR7Ony', NULL, '2026-04-08 04:38:53', '2026-04-08 04:38:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_product_id_foreign` (`product_id`);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_owner_type_owner_id_index` (`owner_type`,`owner_id`);

--
-- Indexes for table `oauth_device_codes`
--
ALTER TABLE `oauth_device_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_device_codes_user_code_unique` (`user_code`),
  ADD KEY `oauth_device_codes_user_id_index` (`user_id`),
  ADD KEY `oauth_device_codes_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_discount`
--
ALTER TABLE `product_discount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_discount_product_id_discount_id_unique` (`product_id`,`discount_id`),
  ADD KEY `product_discount_discount_id_foreign` (`discount_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_discount`
--
ALTER TABLE `product_discount`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_discount`
--
ALTER TABLE `product_discount`
  ADD CONSTRAINT `product_discount_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_discount_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
