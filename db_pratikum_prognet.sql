/*
SQLyog Professional v12.4.3 (64 bit)
MySQL - 10.1.28-MariaDB : Database - db_praktikum_prognet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_praktikum_prognet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_praktikum_prognet`;

/*Table structure for table `admin_notifications` */

DROP TABLE IF EXISTS `admin_notifications`;

CREATE TABLE `admin_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `admin_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_notifications` */

insert  into `admin_notifications`(`id`,`type`,`notifiable_type`,`notifiable_id`,`data`,`read_at`,`created_at`,`updated_at`) values 
('6402d08b-5f7f-4ced-a31c-1d62e3226d68','App\\Notifications\\AdminNotification','App\\Admin',2,'<a href=\'/admin/transactionAdmin/16\'>ada transaksi yang berubah status menjadi Unverified</a>',NULL,'2019-05-24 07:09:22','2019-05-24 07:09:22'),
('c4f1ef4f-eecf-4f50-a3ae-03a9ecaca736','App\\Notifications\\AdminNotification','App\\Admin',2,'<a href=\'/admin/transactionAdmin/16\'>ada transaksi yang berubah status menjadi Success</a>',NULL,'2019-05-24 08:06:59','2019-05-24 08:06:59');

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sellers_email_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admins` */

insert  into `admins`(`id`,`username`,`password`,`name`,`profile_image`,`phone`,`remember_token`,`created_at`,`updated_at`) values 
(2,'adim','$2y$10$IhyxVze7jGiKKkEWABNgU.H3kXIpYOAbyeZIMoisqJyc/OulFB1ou','adim','adim','083117270179',NULL,'2019-05-23 06:36:18','2019-05-23 06:36:18'),
(3,'santi','$2y$10$99oj5NyUppqTKyXi51MIIO9zgEN04yWnSytAXgR3vLaoCmjnw32r6','santi','null','083117270159',NULL,'2019-05-24 08:01:04','2019-05-24 08:01:04');

/*Table structure for table `biodatas` */

DROP TABLE IF EXISTS `biodatas`;

CREATE TABLE `biodatas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `biodatas` */

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('checkedout','notyet','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`,`deleted_at`) values 
(7,1,3,1,'2019-05-13 03:19:48','2019-05-13 03:21:26','notyet','2019-05-13 03:21:26'),
(8,1,3,1,'2019-05-13 03:21:37','2019-05-13 03:22:05','notyet','2019-05-13 03:22:05'),
(9,1,3,1,'2019-05-13 03:23:19','2019-05-14 11:09:19','checkedout',NULL),
(10,1,4,1,'2019-05-14 10:18:39','2019-05-14 10:48:58','notyet','2019-05-14 10:48:58'),
(11,1,4,2,'2019-05-14 10:49:27','2019-05-14 11:09:19','checkedout',NULL),
(12,2,3,1,'2019-05-14 11:30:46','2019-05-14 11:31:54','checkedout',NULL),
(13,1,4,1,'2019-05-20 01:56:35','2019-05-20 02:05:08','checkedout',NULL),
(14,1,3,1,'2019-05-20 01:59:25','2019-05-20 02:05:08','checkedout',NULL),
(15,1,4,2,'2019-05-20 02:07:47','2019-05-20 02:10:22','checkedout',NULL),
(16,1,3,1,'2019-05-20 03:05:24','2019-05-20 14:21:20','checkedout',NULL),
(17,1,4,1,'2019-05-20 14:20:06','2019-05-20 14:21:20','checkedout',NULL),
(18,1,4,1,'2019-05-20 14:22:23','2019-05-20 14:22:23','notyet',NULL),
(19,6,8,1,'2019-05-23 07:18:31','2019-05-23 07:19:27','checkedout',NULL),
(20,6,10,1,'2019-05-23 09:58:22','2019-05-23 09:58:40','notyet','2019-05-23 09:58:40'),
(21,6,10,1,'2019-05-23 09:59:30','2019-05-23 11:19:30','notyet','2019-05-23 11:19:30'),
(22,6,6,1,'2019-05-23 11:15:20','2019-05-24 07:09:03','checkedout',NULL),
(23,8,11,1,'2019-05-23 14:47:50','2019-05-23 14:49:04','notyet','2019-05-23 14:49:04'),
(24,8,6,1,'2019-05-23 14:48:46','2019-05-23 14:50:43','checkedout',NULL),
(25,6,11,1,'2019-05-24 06:44:47','2019-05-24 07:09:03','checkedout',NULL),
(26,6,11,2,'2019-05-24 07:48:28','2019-05-24 07:48:28','notyet',NULL);

/*Table structure for table `couriers` */

DROP TABLE IF EXISTS `couriers`;

CREATE TABLE `couriers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `couriers` */

insert  into `couriers`(`id`,`courier`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'JNE','2019-05-05 12:15:27','2019-05-05 12:48:00','2019-05-05 12:48:00'),
(2,'tiki','2019-05-05 12:15:39','2019-05-05 12:15:39',NULL),
(3,'pos','2019-05-05 12:15:47','2019-05-05 12:15:47',NULL),
(4,'jne','2019-05-05 12:48:09','2019-05-05 12:48:09',NULL);

/*Table structure for table `discounts` */

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned DEFAULT NULL,
  `percentage` int(3) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `discounts` */

insert  into `discounts`(`id`,`id_product`,`percentage`,`start`,`end`,`created_at`,`updated_at`) values 
(4,4,10,'2019-05-14','2019-06-14','2019-05-14 10:17:58','2019-05-14 10:17:58'),
(5,5,20,'2019-10-29','2019-11-29','2019-05-21 13:30:22','2019-05-21 13:30:22'),
(23,6,10,'2019-05-23','2019-05-31','2019-05-24 04:34:51','2019-05-24 04:34:51'),
(24,7,10,'2019-05-23','2019-05-31','2019-05-24 04:35:14','2019-05-24 04:35:14'),
(25,8,10,'2019-05-23','2019-05-31','2019-05-24 04:35:40','2019-05-24 04:35:40'),
(26,9,10,'2019-05-23','2019-05-31','2019-05-24 04:36:24','2019-05-24 04:36:24'),
(27,10,10,'2019-05-23','2019-05-31','2019-05-24 04:36:45','2019-05-24 04:36:45'),
(28,11,10,'2019-05-23','2019-05-31','2019-05-24 04:37:08','2019-05-24 04:37:08'),
(29,12,15,'2019-05-24','2019-06-04','2019-05-24 08:35:15','2019-05-24 08:35:15');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(3,'2014_10_12_000000_create_users_table',2),
(2,'2014_10_12_100000_create_password_resets_table',1),
(8,'2018_10_20_040609_create_categories_table',3),
(9,'2018_10_24_075802_create_products_table',4),
(10,'2018_11_08_024109_create_product_att_table',5),
(11,'2018_11_20_055123_create_tblgallery_table',6),
(12,'2018_11_26_070031_create_cart_table',7),
(13,'2018_11_28_072535_create_coupons_table',8),
(15,'2018_12_01_042342_create_countries_table',10),
(19,'2018_12_03_043804_add_more_fields_to_users_table',14),
(17,'2018_12_03_093548_create_delivery_address_table',12),
(18,'2018_12_05_024718_create_orders_table',13),
(20,'2019_05_23_173508_create_biodatas_table',15);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `product_categories` */

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_categories` */

insert  into `product_categories`(`id`,`parent_id`,`category_name`,`created_at`,`updated_at`,`deleted_at`) values 
(1,0,'Sepatu','2019-05-05 12:07:01','2019-05-23 03:21:41','2019-05-23 03:21:41'),
(2,1,'Sepatu Pria','2019-05-05 12:07:16','2019-05-23 03:20:28',NULL),
(3,1,'Sepatu Wanita','2019-05-05 12:49:08','2019-05-13 03:53:13','2019-05-13 03:53:13'),
(4,0,'Baju','2019-05-05 12:49:53','2019-05-13 03:47:11','2019-05-13 03:47:11'),
(10,0,'Sepatu','2019-05-23 06:28:01','2019-05-23 06:28:01',NULL),
(11,10,'Sneaker','2019-05-23 06:28:16','2019-05-23 06:28:16',NULL),
(12,0,'Fashion','2019-05-23 09:32:53','2019-05-23 09:32:53',NULL),
(13,12,'Fashion Pria','2019-05-23 09:33:43','2019-05-23 09:33:43',NULL),
(14,12,'Fashion Wanita','2019-05-23 09:34:09','2019-05-23 09:34:09',NULL),
(15,0,'Topi','2019-05-23 09:34:37','2019-05-23 09:34:37',NULL),
(16,0,'Celana','2019-05-23 14:43:26','2019-05-23 14:43:26',NULL);

/*Table structure for table `product_category_details` */

DROP TABLE IF EXISTS `product_category_details`;

CREATE TABLE `product_category_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_category_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_category_details_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

/*Data for the table `product_category_details` */

insert  into `product_category_details`(`id`,`product_id`,`category_id`,`created_at`,`updated_at`,`deleted_at`) values 
(9,3,2,'2019-05-14 19:29:19','0000-00-00 00:00:00',NULL),
(10,4,2,'2019-05-14 19:29:21','0000-00-00 00:00:00',NULL),
(11,5,1,'2019-05-21 13:30:22','2019-05-21 13:30:22',NULL),
(12,5,2,'2019-05-21 13:30:22','2019-05-21 13:30:22',NULL),
(13,6,1,'2019-05-23 11:31:29','2019-05-23 03:31:29','2019-05-23 03:31:29'),
(14,6,2,'2019-05-23 11:31:29','2019-05-23 03:31:29','2019-05-23 03:31:29'),
(15,6,1,'2019-05-23 11:31:43','2019-05-23 03:31:43','2019-05-23 03:31:43'),
(16,6,2,'2019-05-23 11:31:43','2019-05-23 03:31:43','2019-05-23 03:31:43'),
(17,6,1,'2019-05-23 11:31:55','2019-05-23 03:31:55','2019-05-23 03:31:55'),
(18,6,2,'2019-05-23 11:31:55','2019-05-23 03:31:55','2019-05-23 03:31:55'),
(19,6,1,'2019-05-23 14:59:12','2019-05-23 06:59:12','2019-05-23 06:59:12'),
(20,6,2,'2019-05-23 14:59:12','2019-05-23 06:59:12','2019-05-23 06:59:12'),
(21,6,1,'2019-05-23 15:05:46','2019-05-23 07:05:46','2019-05-23 07:05:46'),
(22,6,2,'2019-05-23 15:05:46','2019-05-23 07:05:46','2019-05-23 07:05:46'),
(23,6,1,'2019-05-23 22:46:46','2019-05-23 14:46:46','2019-05-23 14:46:46'),
(24,6,2,'2019-05-23 22:46:46','2019-05-23 14:46:46','2019-05-23 14:46:46'),
(25,7,1,'2019-05-24 12:34:38','2019-05-24 04:34:38','2019-05-24 04:34:38'),
(26,7,2,'2019-05-24 12:34:38','2019-05-24 04:34:38','2019-05-24 04:34:38'),
(27,7,10,'2019-05-24 12:34:38','2019-05-24 04:34:38','2019-05-24 04:34:38'),
(28,7,11,'2019-05-24 12:34:38','2019-05-24 04:34:38','2019-05-24 04:34:38'),
(29,8,1,'2019-05-24 12:35:40','2019-05-24 04:35:40','2019-05-24 04:35:40'),
(30,8,2,'2019-05-24 12:35:40','2019-05-24 04:35:40','2019-05-24 04:35:40'),
(31,8,10,'2019-05-24 12:35:40','2019-05-24 04:35:40','2019-05-24 04:35:40'),
(32,8,11,'2019-05-24 12:35:40','2019-05-24 04:35:40','2019-05-24 04:35:40'),
(33,9,12,'2019-05-24 12:36:24','2019-05-24 04:36:24','2019-05-24 04:36:24'),
(34,9,13,'2019-05-24 12:36:24','2019-05-24 04:36:24','2019-05-24 04:36:24'),
(35,10,12,'2019-05-24 12:36:45','2019-05-24 04:36:45','2019-05-24 04:36:45'),
(36,10,13,'2019-05-24 12:36:45','2019-05-24 04:36:45','2019-05-24 04:36:45'),
(37,11,1,'2019-05-24 12:37:08','2019-05-24 04:37:08','2019-05-24 04:37:08'),
(38,11,2,'2019-05-24 12:37:08','2019-05-24 04:37:08','2019-05-24 04:37:08'),
(39,11,10,'2019-05-24 12:37:08','2019-05-24 04:37:08','2019-05-24 04:37:08'),
(40,11,11,'2019-05-24 12:37:08','2019-05-24 04:37:08','2019-05-24 04:37:08'),
(41,6,1,'2019-05-23 22:47:05','2019-05-23 14:47:05','2019-05-23 14:47:05'),
(42,6,2,'2019-05-23 22:47:05','2019-05-23 14:47:05','2019-05-23 14:47:05'),
(43,6,10,'2019-05-23 22:47:05','2019-05-23 14:47:05','2019-05-23 14:47:05'),
(44,6,11,'2019-05-23 22:47:05','2019-05-23 14:47:05','2019-05-23 14:47:05'),
(45,6,1,'2019-05-23 22:47:27','2019-05-23 14:47:27','2019-05-23 14:47:27'),
(46,6,2,'2019-05-23 22:47:27','2019-05-23 14:47:27','2019-05-23 14:47:27'),
(47,6,10,'2019-05-23 22:47:27','2019-05-23 14:47:27','2019-05-23 14:47:27'),
(48,6,11,'2019-05-23 22:47:27','2019-05-23 14:47:27','2019-05-23 14:47:27'),
(49,6,1,'2019-05-23 22:48:22','2019-05-23 14:48:22','2019-05-23 14:48:22'),
(50,6,2,'2019-05-23 22:48:22','2019-05-23 14:48:22','2019-05-23 14:48:22'),
(51,6,10,'2019-05-23 22:48:22','2019-05-23 14:48:22','2019-05-23 14:48:22'),
(52,6,11,'2019-05-23 22:48:22','2019-05-23 14:48:22','2019-05-23 14:48:22'),
(53,6,1,'2019-05-24 12:34:20','2019-05-24 04:34:20','2019-05-24 04:34:20'),
(54,6,2,'2019-05-24 12:34:20','2019-05-24 04:34:20','2019-05-24 04:34:20'),
(55,6,10,'2019-05-24 12:34:20','2019-05-24 04:34:20','2019-05-24 04:34:20'),
(56,6,11,'2019-05-24 12:34:20','2019-05-24 04:34:20','2019-05-24 04:34:20'),
(57,6,1,'2019-05-24 12:34:51','2019-05-24 04:34:51','2019-05-24 04:34:51'),
(58,6,2,'2019-05-24 12:34:51','2019-05-24 04:34:51','2019-05-24 04:34:51'),
(59,6,10,'2019-05-24 12:34:51','2019-05-24 04:34:51','2019-05-24 04:34:51'),
(60,6,11,'2019-05-24 12:34:51','2019-05-24 04:34:51','2019-05-24 04:34:51'),
(61,7,1,'2019-05-24 12:35:14','2019-05-24 04:35:14','2019-05-24 04:35:14'),
(62,7,2,'2019-05-24 12:35:14','2019-05-24 04:35:14','2019-05-24 04:35:14'),
(63,7,10,'2019-05-24 12:35:14','2019-05-24 04:35:14','2019-05-24 04:35:14'),
(64,7,11,'2019-05-24 12:35:14','2019-05-24 04:35:14','2019-05-24 04:35:14'),
(65,6,1,'2019-05-24 04:34:51','2019-05-24 04:34:51',NULL),
(66,6,2,'2019-05-24 04:34:51','2019-05-24 04:34:51',NULL),
(67,6,10,'2019-05-24 04:34:51','2019-05-24 04:34:51',NULL),
(68,6,11,'2019-05-24 04:34:51','2019-05-24 04:34:51',NULL),
(69,7,1,'2019-05-24 04:35:14','2019-05-24 04:35:14',NULL),
(70,7,2,'2019-05-24 04:35:14','2019-05-24 04:35:14',NULL),
(71,7,10,'2019-05-24 04:35:14','2019-05-24 04:35:14',NULL),
(72,7,11,'2019-05-24 04:35:14','2019-05-24 04:35:14',NULL),
(73,8,1,'2019-05-24 04:35:40','2019-05-24 04:35:40',NULL),
(74,8,2,'2019-05-24 04:35:40','2019-05-24 04:35:40',NULL),
(75,8,10,'2019-05-24 04:35:40','2019-05-24 04:35:40',NULL),
(76,8,11,'2019-05-24 04:35:40','2019-05-24 04:35:40',NULL),
(77,9,12,'2019-05-24 04:36:24','2019-05-24 04:36:24',NULL),
(78,9,13,'2019-05-24 04:36:24','2019-05-24 04:36:24',NULL),
(79,10,12,'2019-05-24 04:36:45','2019-05-24 04:36:45',NULL),
(80,10,13,'2019-05-24 04:36:45','2019-05-24 04:36:45',NULL),
(81,11,1,'2019-05-24 04:37:08','2019-05-24 04:37:08',NULL),
(82,11,2,'2019-05-24 04:37:08','2019-05-24 04:37:08',NULL),
(83,11,10,'2019-05-24 04:37:08','2019-05-24 04:37:08',NULL),
(84,11,11,'2019-05-24 04:37:08','2019-05-24 04:37:08',NULL),
(85,12,1,'2019-05-24 08:35:15','2019-05-24 08:35:15',NULL),
(86,12,2,'2019-05-24 08:35:15','2019-05-24 08:35:15',NULL),
(87,12,10,'2019-05-24 08:35:15','2019-05-24 08:35:15',NULL),
(88,12,11,'2019-05-24 08:35:15','2019-05-24 08:35:15',NULL);

/*Table structure for table `product_images` */

DROP TABLE IF EXISTS `product_images`;

CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_images` */

insert  into `product_images`(`id`,`product_id`,`image_name`,`created_at`,`updated_at`) values 
(4,3,'facebook-f-letter-logo-logotype-256.png','2019-05-13 03:19:13','2019-05-13 03:19:13'),
(6,4,'download.png','2019-05-14 10:18:01','2019-05-14 10:18:01'),
(7,5,'hadiah.png','2019-05-21 13:30:23','2019-05-21 13:30:23'),
(9,6,'kisspng-nike-free-sneakers-nike-air-max-shoe-fuk-upper-and-lower-ends-shading-5b0cf6ab875339.7290534915275762355543.png','2019-05-23 06:59:13','2019-05-23 06:59:13'),
(10,7,'Sneakers-PNG-Picture.png','2019-05-23 07:09:35','2019-05-23 07:09:35'),
(11,8,'kisspng-nike-air-max-nike-free-sneakers-shoe-nike-running-shoes-png-picture-png-arts-5b75415bbb73b6.4382015415344110997678.png','2019-05-23 07:10:21','2019-05-23 07:10:21'),
(12,9,'Baju Hut 55.jpg','2019-05-23 09:39:52','2019-05-23 09:39:52'),
(13,10,'Baju Dekorasi Hijau Lumut.jpg','2019-05-23 09:41:43','2019-05-23 09:41:43'),
(14,11,'kisspng-nike-free-sneakers-nike-air-max-shoe-fuk-upper-and-lower-ends-shading-5b0cf6ab875339.7290534915275762355543.png','2019-05-23 14:45:24','2019-05-23 14:45:24'),
(16,6,'Sneakers-PNG-Picture.png','2019-05-23 14:48:22','2019-05-23 14:48:22'),
(17,12,'kisspng-adidas-stan-smith-sneakers-adidas-originals-shoe-adidas-originals-5b522172e3b439.4050640115321091709327.png','2019-05-24 08:35:16','2019-05-24 08:35:16');

/*Table structure for table `product_reviews` */

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rate` int(1) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `rate_id` (`rate`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `product_reviews_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_reviews` */

insert  into `product_reviews`(`id`,`product_id`,`user_id`,`rate`,`content`,`created_at`,`updated_at`) values 
(1,8,6,5,'mantap','2019-05-24 07:58:33','2019-05-24 07:58:33'),
(2,6,6,5,'Mantap','2019-05-24 08:07:16','2019-05-24 08:07:16'),
(3,11,6,1,'aruh','2019-05-24 08:07:17','2019-05-24 08:07:17');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_rate` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`product_name`,`price`,`description`,`product_rate`,`created_at`,`updated_at`,`stock`,`deleted_at`) values 
(3,'Baju Facebook',100000,'Baju Facebook',NULL,'2019-05-13 03:19:11','2019-05-23 03:27:05',12,'2019-05-23 03:27:05'),
(4,'Baju Line',100000,'Baju Line',NULL,'2019-05-14 10:17:58','2019-05-21 06:44:43',12,'2019-05-21 06:44:43'),
(5,'Baju',25000,'Baju',NULL,'2019-05-21 13:30:22','2019-05-23 03:27:08',2,'2019-05-23 03:27:08'),
(6,'Nike 1005',650000,'READY UKURAN : 39 dan 40, BARANG 100% BARU<br>Sepatu Nike Tipe 1005',5,'2019-05-23 03:30:56','2019-05-24 08:07:17',10,NULL),
(7,'Nike 1012',700000,'READY UKURAN : 38,39 dan 40, BARANG 100% BARU Sepatu Nike Tipe 1012',NULL,'2019-05-23 07:09:34','2019-05-24 04:35:14',21,NULL),
(8,'Nike 204',750000,'READY UKURAN : 39, 40 dan 41, BARANG 100% BARU<br>Sepatu Nike Tipe 204',5,'2019-05-23 07:10:20','2019-05-24 07:58:33',12,NULL),
(9,'Baju Nostrum White Edition',120000,'READY UKURAN : S,M,L dan XL BARANG 100% BARU Baju Nostrum White Edition',NULL,'2019-05-23 09:39:50','2019-05-24 04:36:24',30,NULL),
(10,'Baju Nostrum 105',125000,'READY UKURAN : S,M,L dan XL&nbsp;BARANG 100% BARU&nbsp;Baju Nostrum 105',NULL,'2019-05-23 09:41:41','2019-05-24 04:36:45',10,NULL),
(11,'Nike 12',650000,'READY UKURAN : 40 BARANG 100% BARU&nbsp;Sepatu Nike tipe 12',1,'2019-05-23 14:45:23','2019-05-24 08:07:17',21,NULL),
(12,'Adidas 922',325000,'Sepatu Adidas Tipe 922 , Tersedia Ukuran 39 - 42',NULL,'2019-05-24 08:35:15','2019-05-24 08:35:15',5,NULL);

/*Table structure for table `response` */

DROP TABLE IF EXISTS `response`;

CREATE TABLE `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`),
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `response` */

/*Table structure for table `transaction_details` */

DROP TABLE IF EXISTS `transaction_details`;

CREATE TABLE `transaction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` int(3) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_transaction` (`transaction_id`),
  KEY `id_product` (`product_id`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction_details` */

insert  into `transaction_details`(`id`,`transaction_id`,`product_id`,`qty`,`discount`,`selling_price`,`created_at`,`updated_at`) values 
(15,13,3,1,NULL,100000,'2019-05-20 14:21:20','2019-05-20 14:21:20'),
(16,13,4,1,10,90000,'2019-05-20 14:21:20','2019-05-20 14:21:20'),
(17,14,8,1,10,675000,'2019-05-23 07:19:27','2019-05-23 07:19:27'),
(18,15,6,1,10,585000,'2019-05-23 14:50:43','2019-05-23 14:50:43'),
(19,16,6,1,10,585000,'2019-05-24 07:09:03','2019-05-24 07:09:03'),
(20,16,11,1,10,585000,'2019-05-24 07:09:03','2019-05-24 07:09:03');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timeout` datetime NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(12,2) NOT NULL,
  `shipping_cost` double(12,2) NOT NULL,
  `sub_total` double(12,2) NOT NULL,
  `user_id` int(20) unsigned NOT NULL,
  `courier_id` int(10) unsigned NOT NULL,
  `proof_of_payment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('unverified','verified','delivered','success','expired') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courier_id` (`courier_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transactions` */

insert  into `transactions`(`id`,`timeout`,`address`,`regency`,`province`,`total`,`shipping_cost`,`sub_total`,`user_id`,`courier_id`,`proof_of_payment`,`created_at`,`updated_at`,`status`) values 
(13,'2019-05-23 14:21:20','123','Aceh Besar','Nanggroe Aceh Darussalam (NAD)',234000.00,44000.00,190000.00,1,3,NULL,'2019-05-20 14:21:20','2019-05-23 06:58:24','verified'),
(14,'2019-05-24 07:19:26','Tabanan','Tabanan','Bali',686000.00,11000.00,675000.00,6,4,'Sneakers-PNG-Picture.png','2019-05-23 07:19:26','2019-05-23 09:29:44','success'),
(15,'2019-05-24 14:50:43','tabanan','Aceh Barat','Nanggroe Aceh Darussalam (NAD)',648000.00,63000.00,585000.00,8,4,'Sneakers-PNG-Picture.png','2019-05-23 14:50:43','2019-05-23 14:51:25','verified'),
(16,'2019-05-25 07:09:03','Tabanan','Denpasar','Bali',1181000.00,11000.00,1170000.00,6,4,'Nivedita 1516 Tosca.jpg','2019-05-24 07:09:03','2019-05-24 08:06:59','success');

/*Table structure for table `user_notifications` */

DROP TABLE IF EXISTS `user_notifications`;

CREATE TABLE `user_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(11) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `user_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_notifications` */

insert  into `user_notifications`(`id`,`type`,`notifiable_type`,`notifiable_id`,`data`,`read_at`,`created_at`,`updated_at`) values 
('08026d3c-fe5c-469c-b384-0b25104be5bd','App\\Notifications\\UserNotification','App\\User',6,'<a href = \'/transaction/16\'>Transaksi anda sudah Delivered</a>',NULL,'2019-05-24 07:11:16','2019-05-24 07:11:16'),
('d9818f7a-67f8-49d5-a298-df7063f3ea1c','App\\Notifications\\UserNotification','App\\User',6,'<a href = \'/transaction/16\'>Transaksi anda sudah Verified</a>',NULL,'2019-05-24 07:09:49','2019-05-24 07:09:49');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'widiana','widianaputraa@gmail.com','NULL','NULL','2019-05-05 12:04:21','$2y$10$fSvZoNT1bXbAKxdH1D.OBedAIw2bITZR43K8CysO50PiktFr70PNa',NULL,'2019-05-05 12:04:08','2019-05-05 12:04:21'),
(2,'widianaputra','widianaputraa1@gmail.com','NULL','NULL','2019-05-14 11:30:36','$2y$10$SEBrUIVv/tsyPAYlOh7VluDzcCPFEfnLUdIw4Iju3snC6F9zWq63m',NULL,'2019-05-14 11:30:20','2019-05-14 11:30:36'),
(6,'adim','adimertap@gmail.com','NULL','NULL','2019-05-23 06:54:33','$2y$10$zwZULQoHydJR.5ArOjOP5enyI7G1ize3XKiVK0OIeZBBRPHYqy6Ha',NULL,'2019-05-23 06:54:03','2019-05-23 06:54:33'),
(8,'santi','santiari.desakmade@gmail.com','NULL','NULL','2019-05-23 14:22:48','$2y$10$mlRYa9WYgHXe6bY0ISWwu.HgkNWZXfaFfhHjwVpO8I71uc9A/zqle',NULL,'2019-05-23 14:21:03','2019-05-23 14:22:48');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
