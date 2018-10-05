# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: naturiq
# Generation Time: 2018-10-05 08:39:35 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `street` varchar(64) DEFAULT NULL,
  `zip` varchar(8) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `use` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;

INSERT INTO `addresses` (`id`, `name`, `street`, `zip`, `city`, `country`, `use`)
VALUES
	(38,NULL,NULL,NULL,NULL,NULL,'0'),
	(39,NULL,'Hraničná 75','82105','Bratislava','Slovensko','1'),
	(40,NULL,'Hraničná 75','82105','Bratislava','Slovensko','0'),
	(41,NULL,NULL,NULL,NULL,NULL,'0'),
	(42,NULL,NULL,NULL,NULL,NULL,'0'),
	(43,NULL,NULL,NULL,NULL,NULL,'0');

/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table attribute_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attribute_product`;

CREATE TABLE `attribute_product` (
  `attribute_id` int(11) unsigned NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `attribute_product` WRITE;
/*!40000 ALTER TABLE `attribute_product` DISABLE KEYS */;

INSERT INTO `attribute_product` (`attribute_id`, `product_id`)
VALUES
	(1,4),
	(2,4),
	(1,10),
	(1,1),
	(1,8),
	(1,12),
	(1,15),
	(2,15);

/*!40000 ALTER TABLE `attribute_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table attributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;

INSERT INTO `attributes` (`id`, `name`, `title`, `icon`)
VALUES
	(1,'BIO','EU BIO','attributes/eu_bio.png'),
	(2,'Gluten Free','Gluten Free','attributes/gluten_free.png'),
	(3,'RAW','RAW','attributes/raw.png');

/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table backgrounds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backgrounds`;

CREATE TABLE `backgrounds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table banners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `text` varchar(32) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  `background_id` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `active` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `parent_id`, `name`, `icon`, `slug`, `order`, `active`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'NOVINKY & ČERSTVÝ TOVAR','/images/icons/','novinky-a-cerstvy-tovar',1,'0','2018-09-05 11:44:25','2018-09-12 08:15:48'),
	(2,NULL,'Muesli - bezlepkové','/images/icons/','muesli-bezlepkove',2,'1','2018-09-05 11:44:25','2018-09-12 08:16:39'),
	(3,NULL,'Muesli - Original','/images/icons/','muesli-original',3,'1','2018-09-05 11:44:25','2018-09-12 08:17:08'),
	(4,NULL,'Morušový čaj','/images/icons/','morusovy-caj',4,'1','2018-09-05 11:44:25','2018-09-12 08:17:31'),
	(5,NULL,'Trail Mix','/images/icons/','trail-mix',5,'1','2018-09-05 11:44:25','2018-09-12 08:17:50'),
	(6,NULL,'Sušené ovocie','/images/icons/','susene-ovocie',6,'1','2018-09-12 08:18:33','2018-09-12 08:18:33'),
	(7,NULL,'Orechy','/images/icons/','orechy',7,'1','2018-09-12 08:19:01','2018-09-12 08:19:01'),
	(8,NULL,'Vločky','/images/icons/','vlocky',8,'1','2018-09-12 08:19:22','2018-09-12 08:19:22'),
	(9,NULL,'Semienka','/images/icons/','semienka',9,'1','2018-09-12 08:19:57','2018-09-12 08:19:57');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;

INSERT INTO `cities` (`id`, `name`)
VALUES
	(1,'Bratislava'),
	(2,'Banská Bystrica'),
	(3,'Košice');

/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int(7) DEFAULT NULL,
  `company_id` int(7) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `street` varchar(64) DEFAULT NULL,
  `zip` varchar(8) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `password_reset` varchar(64) DEFAULT NULL,
  `note` text,
  `type` set('0','1','2') DEFAULT '0' COMMENT '0=neregistrovany,1=registrovany,2=velkoobchod',
  `approved` enum('0','1') DEFAULT '0',
  `temp` enum('0','1') DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;

INSERT INTO `clients` (`id`, `address_id`, `company_id`, `name`, `street`, `zip`, `city`, `country`, `phone`, `email`, `password`, `remember_token`, `password_reset`, `note`, `type`, `approved`, `temp`, `created_at`, `updated_at`)
VALUES
	(39,39,39,'Boris Tetřev','Trenčianska 11','82103','Bratislava','Slovensko','0905315251','info@alterweb.sk','$2y$10$UrTNgma5xz8DF/GDeuf03OQVzAfH3NRlabHXucsKXlnMhV9y11yJ2','iq62MhIu5d90YaJIcbQQSBofYgop99NIqehOP5h4vTW1WLIZcKf8nztRUs4Y','$2y$10$Zxlp.Dxf9vyfxqkdpEfqWOkrbN4oC25VyDMM1vxEbelZ165S2o1Oq',NULL,'1','1','0','2018-10-01 20:15:06','2018-10-02 11:00:35'),
	(40,40,40,'Boris Tetřev','Trenčianska 11','82103','Bratislava','Slovensko','0905315251','tetrev@alterweb.sk','$2y$10$nkZv2yCrZkYuFxxw7nJK0u6LrCsEVBSK32kkXgGFkFacxCqs43epm','TjaN1BAiB1FjE98vHhzMkOb9twqhi4m0rwgzh3Y96yKn8QrwvZDhfs4VGd2k','',NULL,'1','1','0','2018-10-01 20:25:39','2018-10-02 10:05:02'),
	(41,41,41,'ALTERWEB STUDIO','Trenčianska 11','82103','Bratislava','Slovensko','0905 315251','exidas@alterweb.sk','$2y$10$2OoV9qe3x7EVGvHU81W21OPNO0rTtmELqo87ppuzvQrSczDR5212m',NULL,'$2y$10$QHbEemerkf0UIhmraRHowuum5Gv.sFjp1fbTUuewc9/W1szhw8NBu',NULL,'2','0','0','2018-10-01 21:34:26','2018-10-02 09:56:43'),
	(42,42,42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','1','2018-10-03 09:48:49','2018-10-03 09:48:49'),
	(43,43,43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','1','2018-10-04 18:41:44','2018-10-04 18:41:44');

/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Delete Address` BEFORE DELETE ON `clients` FOR EACH ROW DELETE FROM `addresses` WHERE `id` = OLD.`address_id` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Delete Order` BEFORE DELETE ON `clients` FOR EACH ROW DELETE FROM `orders` WHERE `client_id` = OLD.`id` */;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Delete Company` AFTER DELETE ON `clients` FOR EACH ROW DELETE FROM `companies` WHERE `id` = OLD.`company_id` */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `ico` varchar(16) DEFAULT NULL,
  `dic` varchar(16) DEFAULT NULL,
  `icdph` varchar(16) DEFAULT NULL,
  `web` varchar(128) DEFAULT NULL,
  `use` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;

INSERT INTO `companies` (`id`, `name`, `ico`, `dic`, `icdph`, `web`, `use`)
VALUES
	(38,NULL,NULL,NULL,NULL,NULL,'0'),
	(39,NULL,NULL,NULL,NULL,NULL,'0'),
	(40,'ALTERWEB, s.r.o.','65131516','65351351377','SK6546876411',NULL,'0'),
	(41,'ALTERWEB, s.r.o.','65131516','65351351377','SK6546876411',NULL,'0'),
	(42,NULL,NULL,NULL,NULL,NULL,'0'),
	(43,NULL,NULL,NULL,NULL,NULL,'0');

/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `name`)
VALUES
	(1,'Slovakia');

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `value` float(5,2) DEFAULT NULL,
  `type` set('AMOUNT','PERCENT') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;

INSERT INTO `coupons` (`id`, `title`, `code`, `value`, `type`)
VALUES
	(1,'Skúšobná zľava na 10,- EUR','123456',10.00,'AMOUNT'),
	(2,'Skúšobná zľava na 10%','654321',10.00,'PERCENT');

/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table data_rows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_rows`;

CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`)
VALUES
	(1,1,'id','number','ID',1,0,0,0,0,0,'',1),
	(2,1,'name','text','Name',1,1,1,1,1,1,'',2),
	(3,1,'email','text','Email',1,1,1,1,1,1,'',3),
	(4,1,'password','password','Password',1,0,0,1,1,0,'',4),
	(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,'',5),
	(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,'',6),
	(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'',7),
	(8,1,'avatar','image','Avatar',0,1,1,1,1,1,'',8),
	(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}',10),
	(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),
	(11,1,'locale','text','Locale',0,1,1,1,1,0,'',12),
	(12,1,'settings','hidden','Settings',0,0,0,0,0,0,'',12),
	(13,2,'id','number','ID',1,0,0,0,0,0,'',1),
	(14,2,'name','text','Name',1,1,1,1,1,1,'',2),
	(15,2,'created_at','timestamp','Created At',0,0,0,0,0,0,'',3),
	(16,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'',4),
	(17,3,'id','number','ID',1,0,0,0,0,0,'',1),
	(18,3,'name','text','Name',1,1,1,1,1,1,'',2),
	(19,3,'created_at','timestamp','Created At',0,0,0,0,0,0,'',3),
	(20,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'',4),
	(21,3,'display_name','text','Display Name',1,1,1,1,1,1,'',5),
	(22,1,'role_id','text','Role',1,1,1,1,1,1,'',9),
	(23,4,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(24,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),
	(25,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),
	(26,4,'name','text','Name',1,1,1,1,1,1,NULL,4),
	(27,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',5),
	(28,4,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),
	(29,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),
	(30,5,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(31,5,'author_id','text','Autor',1,0,1,1,0,1,NULL,2),
	(32,5,'category_id','text','Kategória',0,0,1,1,1,0,NULL,3),
	(33,5,'title','text','Titulok',1,1,1,1,1,1,NULL,4),
	(34,5,'excerpt','text_area','Upútavka',0,0,1,1,1,1,NULL,5),
	(35,5,'body','rich_text_box','Obsah',1,0,1,1,1,1,NULL,6),
	(36,5,'image','image','Fotografia',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),
	(37,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),
	(38,5,'meta_description','text_area','Popis pre vyhľadávače',0,0,1,1,1,1,NULL,9),
	(39,5,'meta_keywords','text_area','Kľúčové slová pre vyhľadávače',0,0,1,1,1,1,NULL,10),
	(40,5,'status','select_dropdown','Aktuálny stav',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),
	(41,5,'created_at','timestamp','Dátum vytvorenia',0,1,1,0,0,0,NULL,12),
	(42,5,'updated_at','timestamp','Dátum aktualizácie',0,0,0,0,0,0,NULL,13),
	(43,5,'seo_title','text','SEO Titulok',0,1,1,1,1,1,NULL,14),
	(44,5,'featured','checkbox','Odporúčaný',1,1,1,1,1,1,NULL,15),
	(45,6,'id','number','ID',1,0,0,0,0,0,'',1),
	(46,6,'author_id','text','Author',1,0,0,0,0,0,'',2),
	(47,6,'title','text','Title',1,1,1,1,1,1,'',3),
	(48,6,'excerpt','text_area','Excerpt',1,0,1,1,1,1,'',4),
	(49,6,'body','rich_text_box','Body',1,0,1,1,1,1,'',5),
	(50,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),
	(51,6,'meta_description','text','Meta Description',1,0,1,1,1,1,'',7),
	(52,6,'meta_keywords','text','Meta Keywords',1,0,1,1,1,1,'',8),
	(53,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),
	(54,6,'created_at','timestamp','Created At',1,1,1,0,0,0,'',10),
	(55,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,'',11),
	(56,6,'image','image','Page Image',0,1,1,1,1,1,'',12),
	(57,7,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(58,7,'name','text','Názov produktu',0,1,1,1,1,1,NULL,3),
	(59,7,'category_id','select_dropdown','Kategória',0,0,0,1,1,1,NULL,5),
	(60,7,'code','text','Kód tovaru',0,1,1,1,1,1,NULL,6),
	(61,7,'price_default','text','Štandardná cena',0,1,1,1,1,1,NULL,8),
	(62,7,'price_action','text','Akciová cena',0,1,1,1,1,1,NULL,9),
	(63,7,'weight','text','Hmotnosť balenia',0,1,1,1,1,1,NULL,10),
	(64,7,'description','rich_text_box','Popis produktu',0,0,1,1,1,1,NULL,11),
	(65,7,'image','image','Hlavná fotografia',0,1,1,1,1,1,'{\"resize\":{\"width\":\"750\",\"height\":null},\"quality\":\"80%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"mini\",\"crop\":{\"width\":\"150\",\"height\":\"220\"}},{\"name\":\"cropped\",\"crop\":{\"width\":\"250\",\"height\":\"250\"}}]}',13),
	(66,7,'gallery','multiple_images','Galéria',0,0,1,1,1,1,'{\"resize\":{\"width\":\"750\",\"height\":null},\"quality\":\"80%\",\"upsize\":false,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"mini\",\"crop\":{\"width\":\"150\",\"height\":\"220\"}},{\"name\":\"cropped\",\"crop\":{\"width\":\"250\",\"height\":\"250\"}}]}',17),
	(67,7,'nutritions','rich_text_box','Nutričné hodnoty',0,0,1,1,1,1,NULL,14),
	(69,7,'active','radio_btn','Stav',0,1,1,1,1,1,'{\"default\":\"yes\",\"options\":{\"no\":\"Neaktívny\",\"yes\":\"Aktívny\"}}',23),
	(70,7,'created_at','timestamp','Dátum vytvorenia',0,0,0,0,0,0,NULL,15),
	(71,7,'updated_at','timestamp','Dátum aktualizácie',0,0,0,0,0,0,NULL,16),
	(72,9,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(73,9,'name','text','Názov',0,1,1,1,1,1,NULL,2),
	(75,9,'class','text','Trieda CSS',0,1,1,1,1,1,NULL,3),
	(77,7,'product_hasmany_tag_relationship','relationship','Tagy',0,0,1,1,1,1,'{\"model\":\"App\\\\Tag\",\"table\":\"tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_tag\",\"pivot\":\"1\",\"taggable\":\"on\"}',19),
	(78,11,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(79,11,'title','text','Titulok',0,1,1,1,1,1,NULL,2),
	(80,11,'excerpt','text_area','Upútavka',0,1,1,1,1,1,NULL,3),
	(81,11,'content','rich_text_box','Postup',0,0,1,1,1,1,NULL,4),
	(82,11,'ingredients','rich_text_box','Ingrediencie',0,0,1,1,1,1,NULL,5),
	(83,11,'created_at','timestamp','Dátum vytvorenia',0,1,1,1,0,1,NULL,6),
	(84,11,'updated_at','timestamp','Dátum aktualizácie',0,0,0,0,0,0,NULL,7),
	(85,11,'recept_hasmany_product_relationship','relationship','Použité produkty',0,0,1,1,1,1,'{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_recept\",\"pivot\":\"1\",\"taggable\":\"on\"}',8),
	(86,9,'tag_belongstomany_product_relationship','relationship','products',0,1,1,1,1,1,'{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_tag\",\"pivot\":\"1\",\"taggable\":\"on\"}',4),
	(87,12,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(88,12,'name','text','Názov',0,1,1,1,1,1,NULL,2),
	(89,12,'title','text','Alt text',0,1,1,1,1,1,NULL,3),
	(90,12,'icon','text','Ikona',0,1,1,1,1,1,NULL,4),
	(91,12,'attribute_belongstomany_product_relationship','relationship','products',0,1,1,1,1,1,'{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"attribute_product\",\"pivot\":\"1\",\"taggable\":null}',5),
	(92,7,'product_belongstomany_attribute_relationship','relationship','Atribúty produktu',0,0,1,1,1,1,'{\"model\":\"App\\\\Attribute\",\"table\":\"attributes\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attribute_product\",\"pivot\":\"1\",\"taggable\":\"0\"}',20),
	(93,7,'product_id','select_dropdown','Nadradený produkt',0,0,1,1,1,1,'{\"default\":0}',2),
	(94,7,'contents','rich_text_box','Zloženie',0,0,1,1,1,1,NULL,12),
	(95,7,'featured','select_dropdown','Propagovať',0,0,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"Štandardné zobrazenie\",\"1\":\"Zaradiť do obľúbených\"}}',18),
	(96,7,'buys','text','Počet zakúpení',0,0,1,1,1,1,NULL,22),
	(97,13,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(98,13,'title','text','Názov',0,1,1,1,1,1,NULL,2),
	(99,13,'code','text','Kód kupónu',0,1,1,1,1,1,NULL,3),
	(100,13,'value','text','Hodnota',0,1,1,1,1,1,NULL,4),
	(101,13,'type','select_dropdown','Typ zľavy',0,1,1,1,1,1,'{\"default\":\"AMOUNT\",\"options\":{\"AMOUNT\":\"Zľava v EUR\",\"PERCENT\":\"Zľava v %\"}}',5),
	(102,14,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(103,14,'address_id','text','Adresa doručenia',0,0,1,1,1,1,NULL,2),
	(104,14,'company_id','text','Firmné údaje',0,0,1,1,1,1,NULL,3),
	(105,14,'name','text','Meno / názov firmy',0,1,1,1,1,1,NULL,4),
	(106,14,'street','text','Ulica',0,0,1,1,1,1,NULL,5),
	(107,14,'zip','text','PSČ',0,0,1,1,1,1,NULL,6),
	(108,14,'city','text','Mesto',0,1,1,1,1,1,NULL,7),
	(109,14,'country','text','Krajina',0,0,1,1,1,1,NULL,8),
	(110,14,'phone','text','Telefón',0,1,1,1,1,1,NULL,9),
	(111,14,'email','text','E-mail',0,1,1,1,1,1,NULL,10),
	(112,14,'password','text','Heslo',0,0,0,0,0,0,NULL,11),
	(113,14,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,12),
	(114,14,'password_reset','text','Password Reset',0,0,0,0,0,0,NULL,13),
	(115,14,'note','text','Poznámka zákazníka',0,0,1,1,1,1,NULL,14),
	(116,14,'type','text','Typ užívateľa',0,1,1,1,1,1,NULL,15),
	(117,14,'approved','text','Schválený',0,1,1,1,1,1,NULL,16),
	(118,14,'temp','text','Dočasné konto',0,0,1,1,1,1,NULL,17),
	(119,14,'created_at','timestamp','Dátum registrácie',0,0,1,1,0,1,NULL,18),
	(120,14,'updated_at','timestamp','Posledná úprava',0,0,0,0,0,0,NULL,19),
	(121,14,'client_belongsto_address_relationship','relationship','Adresa doručenia',0,1,1,1,1,1,'{\"model\":\"App\\\\Address\",\"table\":\"addresses\",\"type\":\"belongsTo\",\"column\":\"address_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',20),
	(122,14,'client_belongsto_company_relationship','relationship','Firemné údaje',0,1,1,1,1,1,'{\"model\":\"App\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',21),
	(123,11,'illustration','image','Ilustračné foto',0,1,1,1,1,1,'{\"resize\":{\"width\":\"850\",\"height\":null},\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"crop\":{\"width\":\"650\",\"height\":\"220\"}}]}',6),
	(124,11,'gallery','multiple_images','Galéria',0,0,1,1,1,1,'{\"resize\":{\"width\":\"850\",\"height\":null},\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"crop\":{\"width\":\"850\",\"height\":\"400\"}},{\"name\":\"thumb\",\"crop\":{\"width\":\"140\",\"height\":\"110\"}}]}',7),
	(125,11,'recept_belongstomany_recept-tag_relationship','relationship','Tagy',0,0,1,1,1,1,'{\"model\":\"App\\\\ReceptTag\",\"table\":\"recept-tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"recept_recept-tag\",\"pivot\":\"1\",\"taggable\":\"on\"}',9),
	(126,15,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(127,15,'name','text','Názov',0,1,1,1,1,1,NULL,2),
	(128,15,'slug','text','Slug',0,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true}}',3),
	(129,15,'class','text','Trieda CSS',0,1,1,1,1,1,NULL,4),
	(130,16,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(131,16,'email','text','E-mailová adresa',0,1,1,1,1,1,NULL,2),
	(132,16,'subscription','radio_btn','Stav odberu',0,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"0\":\"Odhlásený\",\"1\":\"Aktívny\"}}',3),
	(133,16,'created_at','timestamp','Dátum prihlásenia',0,1,1,0,1,1,NULL,4),
	(134,16,'updated_at','timestamp','Posledná úprava',0,0,1,0,0,0,NULL,5),
	(135,18,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(136,18,'city_id','select_dropdown','City id',0,1,1,1,1,1,NULL,2),
	(137,18,'image','image','Ilustračné foto',0,0,1,1,1,1,'{\"resize\":{\"width\":\"500\",\"height\":null},\"quality\":\"70%\",\"upsize\":false,\"thumbnails\":[{\"name\":\"cropped\",\"crop\":{\"width\":\"350\",\"height\":\"250\"}}]}',4),
	(138,18,'name','text','Názov prevádzky',0,1,1,1,1,1,NULL,3),
	(139,18,'street','text','Ulica',0,1,1,1,1,1,NULL,5),
	(140,18,'zip','text','PSČ',0,1,1,1,1,1,NULL,6),
	(141,18,'hours','rich_text_box','Otváracie hodiny',0,0,1,1,1,1,NULL,8),
	(142,18,'active','radio_btn','Stav',0,0,1,1,1,1,'{\"default\":\"1\",\"options\":{\"0\":\"Neaktívna\",\"1\":\"Aktívna\"}}',9),
	(143,18,'store_belongsto_city_relationship','relationship','Mesto',0,1,1,1,1,1,'{\"model\":\"App\\\\City\",\"table\":\"cities\",\"type\":\"belongsTo\",\"column\":\"city_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),
	(144,7,'product_belongsto_product_relationship','relationship','Nadradený produkt',0,0,1,1,1,1,'{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),
	(145,8,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(146,8,'client_id','text','Client Id',0,0,1,0,0,0,NULL,2),
	(147,8,'shipping_id','text','Shipping Id',0,0,1,0,0,0,NULL,3),
	(148,8,'payment_id','text','Payment Id',0,0,1,0,0,0,NULL,4),
	(149,8,'status_id','text','Aktuálny stav',0,0,1,0,0,0,NULL,5),
	(150,8,'discount_id','text','Kupón',0,0,1,0,0,0,NULL,6),
	(151,8,'number','text','Číslo objednávky',0,1,1,0,0,0,NULL,7),
	(152,8,'customer','text','Zákazník',0,1,1,0,0,0,NULL,8),
	(153,8,'shipping_price','text','Cena za dopravu',0,0,1,0,0,0,NULL,9),
	(154,8,'payment_price','text','Cena za spôsob platby',0,0,1,0,0,0,NULL,10),
	(155,8,'total_price','text','Celková hodnota v EUR',0,1,1,0,0,0,NULL,11),
	(156,8,'payment-status_id','text','Stav platby',0,1,1,0,0,0,NULL,12),
	(157,8,'note','text','Poznámka zákazníka',0,0,1,0,0,0,NULL,13),
	(158,8,'note_internal','text','Interná poznámka',0,0,0,0,0,0,NULL,14),
	(159,8,'created_at','timestamp','Dátum vytvorenia',0,1,1,0,0,0,NULL,15),
	(160,8,'updated_at','timestamp','Dátum aktualizácie',0,0,0,0,0,0,NULL,16),
	(161,8,'order_belongsto_client_relationship','relationship','clients',0,0,1,0,0,0,'{\"model\":\"App\\\\Client\",\"table\":\"clients\",\"type\":\"belongsTo\",\"column\":\"client_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',17),
	(162,8,'temp','text','Temp',0,0,0,0,0,0,NULL,15),
	(163,7,'product_belongsto_category_relationship','relationship','Kategória',0,0,1,1,1,1,'{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',4),
	(164,7,'order','number','Poradie v súvisiacich',0,0,0,1,1,1,NULL,21),
	(165,8,'order_belongsto_status_relationship','relationship','Stav objednávky',0,1,1,1,1,1,'{\"model\":\"App\\\\Status\",\"table\":\"statuses\",\"type\":\"belongsTo\",\"column\":\"status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',18);

/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table data_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_types`;

CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`)
VALUES
	(1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,NULL,'2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-05 11:44:24','2018-09-12 08:14:56'),
	(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy',NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-05 11:44:25','2018-09-12 07:59:06'),
	(6,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(7,'products','products','Produkt','Produkty','voyager-bag','App\\Product',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-11 08:53:33','2018-10-04 10:50:47'),
	(8,'orders','orders','Objednávka','Objednávky','voyager-bag','App\\Order',NULL,NULL,NULL,1,0,'{\"order_column\":\"number\",\"order_display_column\":null}','2018-09-13 06:42:39','2018-09-13 07:24:36'),
	(9,'tags','tags','Tag','Tagy','voyager-wallet','App\\Tag',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-11 09:05:57','2018-09-11 09:11:04'),
	(11,'recepts','recepts','Recept','Recepty','voyager-lab','App\\Recept',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-11 09:24:57','2018-09-11 09:24:57'),
	(12,'attributes','attributes','Atribúty produktov','Attributes','tag','App\\Attribute',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-24 08:59:35','2018-09-24 08:59:35'),
	(13,'coupons','coupons','Kupón','Kupóny','voyager-dollar','App\\Coupon',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-24 09:10:18','2018-09-24 09:10:18'),
	(14,'clients','clients','Zákazník','Zákazníci','voyager-user','App\\Client',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-02 11:49:59','2018-10-02 11:49:59'),
	(15,'recept-tags','recept-tags','Tag','Tagy receptov',NULL,'App\\ReceptTag',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-02 21:13:49','2018-10-02 21:13:49'),
	(16,'newsletter','newsletter','Newsletter','Newsletters',NULL,'App\\Newsletter',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-03 07:36:33','2018-10-03 07:36:33'),
	(18,'stores','stores','Predajňa','Predajne',NULL,'App\\Store',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-03 08:28:42','2018-10-03 08:28:42');

/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`)
VALUES
	(1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2018-09-05 11:44:22','2018-09-05 11:44:22','voyager.dashboard',NULL),
	(2,1,'Media','','_self','voyager-images',NULL,NULL,9,'2018-09-05 11:44:22','2018-10-02 12:01:51','voyager.media.index',NULL),
	(3,1,'Užívatelia','','_self','voyager-person','#000000',NULL,8,'2018-09-05 11:44:22','2018-10-02 12:01:51','voyager.users.index','null'),
	(4,1,'Privilégiá','','_self','voyager-lock','#000000',NULL,7,'2018-09-05 11:44:22','2018-10-02 12:01:51','voyager.roles.index','null'),
	(5,1,'Nástroje','','_self','voyager-tools','#000000',NULL,16,'2018-09-05 11:44:22','2018-10-02 12:02:16',NULL,''),
	(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2018-09-05 11:44:22','2018-09-11 08:49:38','voyager.menus.index',NULL),
	(7,1,'Database','','_self','voyager-data',NULL,5,2,'2018-09-05 11:44:22','2018-09-11 08:49:38','voyager.database.index',NULL),
	(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2018-09-05 11:44:22','2018-09-11 08:49:38','voyager.compass.index',NULL),
	(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2018-09-05 11:44:22','2018-09-11 08:49:38','voyager.bread.index',NULL),
	(10,1,'Nastavenia','','_self','voyager-settings','#000000',NULL,17,'2018-09-05 11:44:22','2018-10-02 12:02:16','voyager.settings.index','null'),
	(11,1,'Kategórie','','_self','voyager-categories','#000000',NULL,12,'2018-09-05 11:44:24','2018-10-02 12:01:47','voyager.categories.index','null'),
	(12,1,'Články','','_self','voyager-news','#000000',NULL,10,'2018-09-05 11:44:25','2018-10-02 12:01:51','voyager.posts.index','null'),
	(13,1,'Obsah podstránok','','_self','voyager-file-text','#000000',NULL,11,'2018-09-05 11:44:25','2018-10-02 12:01:47','voyager.pages.index','null'),
	(15,1,'Produkty','/admin/products?order_by=code&sort_order=asc','_self','voyager-bag','#000000',NULL,2,'2018-09-11 08:49:17','2018-10-04 14:09:39',NULL,''),
	(18,1,'Tagy produktov','','_self','voyager-tag','#000000',NULL,13,'2018-09-11 09:05:57','2018-10-02 12:01:47','voyager.tags.index','null'),
	(20,1,'Recepty','','_self','voyager-lab',NULL,NULL,6,'2018-09-11 09:24:57','2018-10-02 12:01:51','voyager.recepts.index',NULL),
	(21,1,'Užívatelia','','_self','voyager-person','#000000',NULL,5,'2018-09-11 11:30:56','2018-10-02 12:01:57','voyager.users.index','null'),
	(22,1,'Privilégiá','','_self','voyager-lock','#000000',NULL,4,'2018-09-11 11:30:56','2018-10-02 12:02:04','voyager.roles.index','null'),
	(25,1,'Atribúty produktov','','_self','voyager-tag','#000000',NULL,14,'2018-09-24 08:59:36','2018-10-02 12:01:47','voyager.attributes.index','null'),
	(26,1,'Kupóny','','_self','voyager-dollar',NULL,NULL,15,'2018-09-24 09:10:19','2018-10-02 12:02:16','voyager.coupons.index',NULL),
	(27,1,'Zákazníci','','_self','voyager-person','#000000',NULL,3,'2018-10-02 11:49:59','2018-10-02 12:03:00','voyager.clients.index','null'),
	(28,1,'Tagy receptov','','_self',NULL,NULL,NULL,18,'2018-10-02 21:13:49','2018-10-02 21:13:49','voyager.recept-tags.index',NULL),
	(29,1,'Newsletters','','_self',NULL,NULL,NULL,19,'2018-10-03 07:36:33','2018-10-03 07:36:33','voyager.newsletter.index',NULL),
	(30,1,'Predajne','','_self',NULL,NULL,NULL,20,'2018-10-03 08:28:43','2018-10-03 08:28:43','voyager.stores.index',NULL),
	(31,1,'Objednávky','','_self','voyager-bag','#000000',NULL,2,'2018-09-13 06:42:40','2018-10-04 09:11:22','voyager.orders.index','null');

/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','2018-09-05 11:44:22','2018-09-05 11:44:22');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_01_01_000000_add_voyager_user_fields',1),
	(4,'2016_01_01_000000_create_data_types_table',1),
	(5,'2016_05_19_173453_create_menu_table',1),
	(6,'2016_10_21_190000_create_roles_table',1),
	(7,'2016_10_21_190000_create_settings_table',1),
	(8,'2016_11_30_135954_create_permission_table',1),
	(9,'2016_11_30_141208_create_permission_role_table',1),
	(10,'2016_12_26_201236_data_types__add__server_side',1),
	(11,'2017_01_13_000000_add_route_to_menu_items_table',1),
	(12,'2017_01_14_005015_create_translations_table',1),
	(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),
	(14,'2017_03_06_000000_add_controller_to_data_types_table',1),
	(15,'2017_04_21_000000_add_order_to_data_rows_table',1),
	(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),
	(17,'2017_08_05_000000_add_group_to_settings_table',1),
	(18,'2017_11_26_013050_add_user_role_relationship',1),
	(19,'2017_11_26_015000_create_user_roles_table',1),
	(20,'2018_03_11_000000_add_user_settings',1),
	(21,'2018_03_14_000000_add_details_to_data_types_table',1),
	(22,'2018_03_16_000000_make_settings_value_nullable',1),
	(23,'2016_01_01_000000_create_pages_table',2),
	(24,'2016_01_01_000000_create_posts_table',2),
	(25,'2016_02_15_204651_create_categories_table',2),
	(26,'2017_04_11_000000_alter_post_nullable_fields_table',2),
	(27,'2018_09_06_084151_create_shoppingcart_table',3),
	(28,'2018_09_26_090749_create_addresses_table',0),
	(29,'2018_09_26_090749_create_attribute_product_table',0),
	(30,'2018_09_26_090749_create_attributes_table',0),
	(31,'2018_09_26_090749_create_categories_table',0),
	(32,'2018_09_26_090749_create_clients_table',0),
	(33,'2018_09_26_090749_create_companies_table',0),
	(34,'2018_09_26_090749_create_countries_table',0),
	(35,'2018_09_26_090749_create_coupons_table',0),
	(36,'2018_09_26_090749_create_data_rows_table',0),
	(37,'2018_09_26_090749_create_data_types_table',0),
	(38,'2018_09_26_090749_create_menu_items_table',0),
	(39,'2018_09_26_090749_create_menus_table',0),
	(40,'2018_09_26_090749_create_order-items_table',0),
	(41,'2018_09_26_090749_create_orders_table',0),
	(42,'2018_09_26_090749_create_pages_table',0),
	(43,'2018_09_26_090749_create_password_resets_table',0),
	(44,'2018_09_26_090749_create_payment-statuses_table',0),
	(45,'2018_09_26_090749_create_payments_table',0),
	(46,'2018_09_26_090749_create_permission_role_table',0),
	(47,'2018_09_26_090749_create_permissions_table',0),
	(48,'2018_09_26_090749_create_posts_table',0),
	(49,'2018_09_26_090749_create_product_tag_table',0),
	(50,'2018_09_26_090749_create_products_table',0),
	(51,'2018_09_26_090749_create_recepts_table',0),
	(52,'2018_09_26_090749_create_roles_table',0),
	(53,'2018_09_26_090749_create_settings_table',0),
	(54,'2018_09_26_090749_create_shipping_payment_table',0),
	(55,'2018_09_26_090749_create_shippings_table',0),
	(56,'2018_09_26_090749_create_shoppingcart_table',0),
	(57,'2018_09_26_090749_create_slideshow_table',0),
	(58,'2018_09_26_090749_create_tags_table',0),
	(59,'2018_09_26_090749_create_translations_table',0),
	(60,'2018_09_26_090749_create_user_roles_table',0),
	(61,'2018_09_26_090749_create_users_table',0),
	(62,'2018_09_26_090751_add_foreign_keys_to_categories_table',0),
	(63,'2018_09_26_090751_add_foreign_keys_to_data_rows_table',0),
	(64,'2018_09_26_090751_add_foreign_keys_to_menu_items_table',0),
	(65,'2018_09_26_090751_add_foreign_keys_to_permission_role_table',0),
	(66,'2018_09_26_090751_add_foreign_keys_to_user_roles_table',0),
	(67,'2018_09_26_090751_add_foreign_keys_to_users_table',0),
	(68,'2018_09_30_213419_create_addresses_table',0),
	(69,'2018_09_30_213419_create_attribute_product_table',0),
	(70,'2018_09_30_213419_create_attributes_table',0),
	(71,'2018_09_30_213419_create_categories_table',0),
	(72,'2018_09_30_213419_create_clients_table',0),
	(73,'2018_09_30_213419_create_companies_table',0),
	(74,'2018_09_30_213419_create_countries_table',0),
	(75,'2018_09_30_213419_create_coupons_table',0),
	(76,'2018_09_30_213419_create_data_rows_table',0),
	(77,'2018_09_30_213419_create_data_types_table',0),
	(78,'2018_09_30_213419_create_menu_items_table',0),
	(79,'2018_09_30_213419_create_menus_table',0),
	(80,'2018_09_30_213419_create_order-items_table',0),
	(81,'2018_09_30_213419_create_orders_table',0),
	(82,'2018_09_30_213419_create_pages_table',0),
	(83,'2018_09_30_213419_create_password_resets_table',0),
	(84,'2018_09_30_213419_create_payment-statuses_table',0),
	(85,'2018_09_30_213419_create_payments_table',0),
	(86,'2018_09_30_213419_create_permission_role_table',0),
	(87,'2018_09_30_213419_create_permissions_table',0),
	(88,'2018_09_30_213419_create_posts_table',0),
	(89,'2018_09_30_213419_create_product_tag_table',0),
	(90,'2018_09_30_213419_create_products_table',0),
	(91,'2018_09_30_213419_create_recepts_table',0),
	(92,'2018_09_30_213419_create_roles_table',0),
	(93,'2018_09_30_213419_create_settings_table',0),
	(94,'2018_09_30_213419_create_shipping_payment_table',0),
	(95,'2018_09_30_213419_create_shippings_table',0),
	(96,'2018_09_30_213419_create_shoppingcart_table',0),
	(97,'2018_09_30_213419_create_slideshow_table',0),
	(98,'2018_09_30_213419_create_statuses_table',0),
	(99,'2018_09_30_213419_create_tags_table',0),
	(100,'2018_09_30_213419_create_translations_table',0),
	(101,'2018_09_30_213419_create_user_roles_table',0),
	(102,'2018_09_30_213419_create_users_table',0),
	(103,'2018_09_30_213420_add_foreign_keys_to_categories_table',0),
	(104,'2018_09_30_213420_add_foreign_keys_to_data_rows_table',0),
	(105,'2018_09_30_213420_add_foreign_keys_to_menu_items_table',0),
	(106,'2018_09_30_213420_add_foreign_keys_to_permission_role_table',0),
	(107,'2018_09_30_213420_add_foreign_keys_to_user_roles_table',0),
	(108,'2018_09_30_213420_add_foreign_keys_to_users_table',0);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table newsletter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletter`;

CREATE TABLE `newsletter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) DEFAULT NULL,
  `subscription` enum('0','1') DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;

INSERT INTO `newsletter` (`id`, `email`, `subscription`, `created_at`, `updated_at`)
VALUES
	(1,'tetrev@alterweb.sk','1','2018-10-03 06:39:13','2018-10-03 07:33:01');

/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order-items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order-items`;

CREATE TABLE `order-items` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `order-items` WRITE;
/*!40000 ALTER TABLE `order-items` DISABLE KEYS */;

INSERT INTO `order-items` (`identifier`, `order_id`, `instance`, `content`, `created_at`, `updated_at`)
VALUES
	('11',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"981a91ad5409ba8310581a9484895c1a\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"981a91ad5409ba8310581a9484895c1a\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:36:\"100 % Bio čaj z morušových listov\";s:5:\"price\";d:20;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:4:\"500g\";s:5:\"image\";s:47:\"products/September2018/t84e5bcni4OvCqzgE9mb.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('12',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";s:2:\"id\";i:3;s:3:\"qty\";i:1;s:4:\"name\";s:36:\"100 % Bio čaj z morušových listov\";s:5:\"price\";d:19;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:5:\"1000g\";s:5:\"image\";s:47:\"products/September2018/t84e5bcni4OvCqzgE9mb.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('20',NULL,'others','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:2:{s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";s:2:\"id\";i:1;s:3:\"qty\";i:1;s:4:\"name\";s:17:\"Slovenská Pošta\";s:5:\"price\";d:3.9;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:63:\"Vaša objednávka vám bude zaslaná balíkom slovenskej pošty\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:12:\"App\\Shipping\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}s:32:\"6914fc176f435fb70f29d78e2479c5a4\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"6914fc176f435fb70f29d78e2479c5a4\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:8:\"Prevodom\";s:5:\"price\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:70:\"Po odoslaní objednávky vám zašleme údaje na uskutočnenie prevodu\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Payment\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('20',NULL,'others','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:2:{s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";s:2:\"id\";i:1;s:3:\"qty\";i:1;s:4:\"name\";s:17:\"Slovenská Pošta\";s:5:\"price\";d:3.9;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:63:\"Vaša objednávka vám bude zaslaná balíkom slovenskej pošty\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:12:\"App\\Shipping\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}s:32:\"6914fc176f435fb70f29d78e2479c5a4\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"6914fc176f435fb70f29d78e2479c5a4\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:8:\"Prevodom\";s:5:\"price\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:70:\"Po odoslaní objednávky vám zašleme údaje na uskutočnenie prevodu\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Payment\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('20',NULL,'others','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:2:{s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";s:2:\"id\";i:1;s:3:\"qty\";i:1;s:4:\"name\";s:17:\"Slovenská Pošta\";s:5:\"price\";d:3.9;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:63:\"Vaša objednávka vám bude zaslaná balíkom slovenskej pošty\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:12:\"App\\Shipping\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}s:32:\"6914fc176f435fb70f29d78e2479c5a4\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"6914fc176f435fb70f29d78e2479c5a4\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:8:\"Prevodom\";s:5:\"price\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:70:\"Po odoslaní objednávky vám zašleme údaje na uskutočnenie prevodu\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Payment\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('21',NULL,'others','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:2:{s:32:\"7411dade304c5b89d7a993e4dd54ee55\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"7411dade304c5b89d7a993e4dd54ee55\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:11:\"Kuriér DPD\";s:5:\"price\";d:4;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:58:\"Vašu objednávku vám zašleme kuriérom spoločnosti DPD\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:12:\"App\\Shipping\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}s:32:\"6914fc176f435fb70f29d78e2479c5a4\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"6914fc176f435fb70f29d78e2479c5a4\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:8:\"Prevodom\";s:5:\"price\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:70:\"Po odoslaní objednávky vám zašleme údaje na uskutočnenie prevodu\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Payment\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('22',NULL,'others','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:2:{s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";s:2:\"id\";i:1;s:3:\"qty\";i:1;s:4:\"name\";s:17:\"Slovenská Pošta\";s:5:\"price\";d:3.9;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:63:\"Vaša objednávka vám bude zaslaná balíkom slovenskej pošty\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:12:\"App\\Shipping\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}s:32:\"6914fc176f435fb70f29d78e2479c5a4\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"6914fc176f435fb70f29d78e2479c5a4\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:8:\"Prevodom\";s:5:\"price\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:70:\"Po odoslaní objednávky vám zašleme údaje na uskutočnenie prevodu\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Payment\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('22',NULL,'others','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:2:{s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";s:2:\"id\";i:1;s:3:\"qty\";i:1;s:4:\"name\";s:17:\"Slovenská Pošta\";s:5:\"price\";d:3.9;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:63:\"Vaša objednávka vám bude zaslaná balíkom slovenskej pošty\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:12:\"App\\Shipping\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}s:32:\"6914fc176f435fb70f29d78e2479c5a4\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"6914fc176f435fb70f29d78e2479c5a4\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:8:\"Prevodom\";s:5:\"price\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:70:\"Po odoslaní objednávky vám zašleme údaje na uskutočnenie prevodu\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Payment\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('23',NULL,'others','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:2:{s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"2f2d43881bb95638ed6258f2d69dd1cd\";s:2:\"id\";i:1;s:3:\"qty\";i:1;s:4:\"name\";s:17:\"Slovenská Pošta\";s:5:\"price\";d:3.9;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:63:\"Vaša objednávka vám bude zaslaná balíkom slovenskej pošty\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:12:\"App\\Shipping\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}s:32:\"f8804e6bf23c8369ddd77692b85acdc6\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"f8804e6bf23c8369ddd77692b85acdc6\";s:2:\"id\";i:3;s:3:\"qty\";i:1;s:4:\"name\";s:11:\"Na faktúru\";s:5:\"price\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:4:\"desc\";s:77:\"Na vaše firemné údaje vystavíme faktúru a bude vám doručená s tovarom\";s:5:\"image\";s:0:\"\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Payment\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('24',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";s:2:\"id\";i:3;s:3:\"qty\";i:1;s:4:\"name\";s:36:\"100 % Bio čaj z morušových listov\";s:5:\"price\";d:19;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:5:\"1000g\";s:5:\"image\";s:47:\"products/September2018/t84e5bcni4OvCqzgE9mb.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('25',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"ddc499b52e00882d4d0a59271a0eb591\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"ddc499b52e00882d4d0a59271a0eb591\";s:2:\"id\";i:8;s:3:\"qty\";s:1:\"2\";s:4:\"name\";s:48:\"100 % Bio čaj z morušových listov + Bio ruža\";s:5:\"price\";d:4.99;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:15:\"32,5g (25x1,3g)\";s:5:\"image\";s:45:\"products/October2018/6w2BTNBKrHunHsDE59BD.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL);

/*!40000 ALTER TABLE `order-items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `shipping_id` smallint(2) DEFAULT NULL,
  `payment_id` smallint(2) DEFAULT NULL,
  `status_id` smallint(2) DEFAULT NULL,
  `discount_id` smallint(3) DEFAULT NULL,
  `number` varchar(16) DEFAULT NULL,
  `customer` varchar(64) DEFAULT NULL,
  `shipping_price` float(5,2) DEFAULT NULL,
  `payment_price` float(5,2) DEFAULT NULL,
  `total_price` float(7,2) DEFAULT NULL,
  `payment-status_id` int(11) DEFAULT NULL,
  `note` text,
  `note_internal` text,
  `temp` enum('0','1') DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `client_id`, `shipping_id`, `payment_id`, `status_id`, `discount_id`, `number`, `customer`, `shipping_price`, `payment_price`, `total_price`, `payment-status_id`, `note`, `note_internal`, `temp`, `created_at`, `updated_at`)
VALUES
	(11,21,2,3,1,NULL,'20180928-11','Boris Tetřev',0.00,0.00,24.00,NULL,NULL,NULL,'0','2018-09-28 08:00:09','2018-09-28 08:17:10'),
	(12,21,3,2,1,NULL,'20180928-12','Boris Tetřev',4.00,0.00,19.00,NULL,NULL,NULL,'0','2018-09-28 08:38:52','2018-09-28 08:42:15'),
	(13,21,4,4,1,NULL,'20180928-13','Boris Tetřev',4.00,0.00,23.00,NULL,NULL,NULL,'0','2018-09-28 09:10:39','2018-09-28 09:10:47'),
	(14,21,3,1,1,NULL,'20180928-14','Boris Tetřev',3.90,0.00,19.00,NULL,NULL,NULL,'0','2018-09-28 09:23:10','2018-09-28 09:23:38'),
	(15,21,3,2,1,NULL,'20180928-15','Boris Tetřev',4.00,0.00,19.00,NULL,NULL,NULL,'0','2018-09-28 09:26:40','2018-09-28 09:27:24'),
	(16,21,3,2,1,NULL,'20180928-16','Boris Tetřev',4.00,0.00,19.00,NULL,NULL,NULL,'0','2018-09-28 09:29:29','2018-09-28 09:29:33'),
	(17,21,3,3,1,NULL,'20180928-17','Boris Tetřev',0.00,0.00,19.00,NULL,NULL,NULL,'0','2018-09-28 09:33:57','2018-09-28 09:34:04'),
	(18,21,3,2,1,NULL,'20180928-18','Boris Tetřev',4.00,0.00,19.00,NULL,NULL,NULL,'0','2018-09-28 09:35:02','2018-09-28 09:35:07'),
	(19,39,2,3,2,NULL,'20180928-19','Boris Tetřev',0.00,0.00,23.00,NULL,NULL,NULL,'0','2018-09-28 09:36:02','2018-09-28 09:36:07'),
	(20,39,1,2,1,NULL,'20181003-20','Boris Tetřev',3.90,0.00,28.68,NULL,NULL,NULL,'0','2018-10-03 09:48:49','2018-10-03 11:33:26'),
	(21,39,2,2,1,NULL,'20181003-21','Boris Tetřev',4.00,0.00,27.60,NULL,NULL,NULL,'0','2018-10-03 11:35:24','2018-10-03 13:26:29'),
	(22,39,1,2,1,NULL,'20181003-22','Boris Tetřev',3.90,0.00,22.68,NULL,NULL,NULL,'0','2018-10-03 13:27:21','2018-10-03 13:33:33'),
	(23,39,1,3,2,NULL,'20181003-23','Boris Tetřev',3.90,0.00,22.68,NULL,NULL,NULL,'0','2018-10-03 13:36:55','2018-10-04 07:15:35'),
	(24,39,2,3,1,NULL,'20181004-24','Boris Tetřev',4.00,0.00,27.60,NULL,NULL,NULL,'0','2018-10-04 07:30:11','2018-10-04 07:30:19'),
	(25,39,1,2,1,NULL,'20181004-25','Boris Tetřev',3.90,0.00,16.66,NULL,NULL,NULL,'0','2018-10-04 18:41:44','2018-10-04 18:46:59');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Delete Order Items` BEFORE DELETE ON `orders` FOR EACH ROW DELETE FROM `order-items` WHERE `identifier` = OLD.`id` */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`)
VALUES
	(1,2,'Reklamačný poriadok','Reklamačný poriadok','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,'reklamacny-poriadok','Reklamačný poriadok Naturiq.sk','reklamacny poriadok','ACTIVE','2018-10-03 09:54:42','2018-10-03 09:54:42'),
	(2,2,'Obchodné podmienky','Obchodné podmienky','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,'obchodne-podmienky','Obchodné podmienky Naturiq.sk','ochodne podmienky','ACTIVE','2018-10-03 09:54:42','2018-10-03 09:54:42'),
	(3,2,'Formulár na odstúpenie','Formulár na odstúpenie','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,'formular-na-odstupenie','Formulár na odstúpenie od zmluvy','formular na odstupenie od zmluvy','ACTIVE','2018-10-03 09:54:42','2018-10-03 09:54:42'),
	(4,2,'Možnosti platby','Možnosti platby','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,'moznosti-platby','Možnosti platby na Naturiq.sk','','ACTIVE','2018-10-03 09:54:42','2018-10-03 09:54:42'),
	(5,2,'Dodacie podmienky','Dodacie podmienky','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,'dodacie-podmienky','Dodacie podmienky Naturiq.sk','dodacie podmienky','ACTIVE','2018-10-03 09:54:42','2018-10-03 09:54:42'),
	(6,2,'Ochrana osobných údajov','Ochrana osobných údajov','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,'ochrana-osobnych-udajov','Ochrana osobných údajov GDPR Naturiq.sk','ochrana osobnych udajov, GDPR','ACTIVE','2018-10-03 09:54:42','2018-10-03 09:54:42');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table payment-statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment-statuses`;

CREATE TABLE `payment-statuses` (
  `id` smallint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `payment-statuses` WRITE;
/*!40000 ALTER TABLE `payment-statuses` DISABLE KEYS */;

INSERT INTO `payment-statuses` (`id`, `name`, `description`)
VALUES
	(1,'Platba úspešná','Platba prebehla v poriadku'),
	(2,'Zrušená platiteľom','Platba bola zrušená počas prevodu'),
	(3,'Čaká na realizáciu','Platba čaká na spracovanie u obchodníka'),
	(4,'Neúspešná','Platba nebola zrealizovaná');

/*!40000 ALTER TABLE `payment-statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` smallint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `identifier` varchar(64) DEFAULT NULL,
  `price` float(5,2) DEFAULT NULL,
  `order` smallint(2) DEFAULT NULL,
  `active` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;

INSERT INTO `payments` (`id`, `name`, `description`, `identifier`, `price`, `order`, `active`)
VALUES
	(1,'Hotovosť','Vašu objednávku uhradíte na pobočke v hotovosti, alebo kartou','CASH',0.00,1,'1'),
	(2,'Prevodom','Po odoslaní objednávky vám zašleme údaje na uskutočnenie prevodu','TRANSFER',0.00,2,'1'),
	(3,'Na faktúru','Na vaše firemné údaje vystavíme faktúru a bude vám doručená s tovarom','INVOICE',0.00,3,'1'),
	(4,'Card Pay','Platbou online kreditnou kartou prostredníctvom brány Tatra Banka','CARDPAY',0.00,4,'1');

/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permission_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;

INSERT INTO `permission_role` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1),
	(41,1),
	(42,1),
	(43,1),
	(44,1),
	(45,1),
	(46,1),
	(47,1),
	(48,1),
	(49,1),
	(50,1),
	(51,1),
	(52,1),
	(53,1),
	(54,1),
	(55,1),
	(56,1),
	(57,1),
	(58,1),
	(59,1),
	(60,1),
	(61,1),
	(62,1),
	(63,1),
	(64,1),
	(65,1),
	(66,1),
	(67,1),
	(68,1),
	(69,1),
	(70,1),
	(71,1),
	(72,1),
	(73,1),
	(74,1),
	(75,1),
	(76,1),
	(77,1),
	(78,1),
	(79,1),
	(80,1),
	(81,1),
	(82,1),
	(83,1),
	(84,1),
	(85,1),
	(86,1),
	(87,1),
	(88,1);

/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`)
VALUES
	(1,'browse_admin',NULL,'2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(2,'browse_bread',NULL,'2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(3,'browse_database',NULL,'2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(4,'browse_media',NULL,'2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(5,'browse_compass',NULL,'2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(6,'browse_menus','menus','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(7,'read_menus','menus','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(8,'edit_menus','menus','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(9,'add_menus','menus','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(10,'delete_menus','menus','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(11,'browse_roles','roles','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(12,'read_roles','roles','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(13,'edit_roles','roles','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(14,'add_roles','roles','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(15,'delete_roles','roles','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(16,'browse_users','users','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(17,'read_users','users','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(18,'edit_users','users','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(19,'add_users','users','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(20,'delete_users','users','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(21,'browse_settings','settings','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(22,'read_settings','settings','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(23,'edit_settings','settings','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(24,'add_settings','settings','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(25,'delete_settings','settings','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(26,'browse_categories','categories','2018-09-05 11:44:24','2018-09-05 11:44:24'),
	(27,'read_categories','categories','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(28,'edit_categories','categories','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(29,'add_categories','categories','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(30,'delete_categories','categories','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(31,'browse_posts','posts','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(32,'read_posts','posts','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(33,'edit_posts','posts','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(34,'add_posts','posts','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(35,'delete_posts','posts','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(36,'browse_pages','pages','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(37,'read_pages','pages','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(38,'edit_pages','pages','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(39,'add_pages','pages','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(40,'delete_pages','pages','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(41,'browse_hooks',NULL,'2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(42,'browse_products','products','2018-09-11 08:53:34','2018-09-11 08:53:34'),
	(43,'read_products','products','2018-09-11 08:53:34','2018-09-11 08:53:34'),
	(44,'edit_products','products','2018-09-11 08:53:34','2018-09-11 08:53:34'),
	(45,'add_products','products','2018-09-11 08:53:34','2018-09-11 08:53:34'),
	(46,'delete_products','products','2018-09-11 08:53:34','2018-09-11 08:53:34'),
	(47,'browse_tags','tags','2018-09-11 09:05:57','2018-09-11 09:05:57'),
	(48,'read_tags','tags','2018-09-11 09:05:57','2018-09-11 09:05:57'),
	(49,'edit_tags','tags','2018-09-11 09:05:57','2018-09-11 09:05:57'),
	(50,'add_tags','tags','2018-09-11 09:05:57','2018-09-11 09:05:57'),
	(51,'delete_tags','tags','2018-09-11 09:05:57','2018-09-11 09:05:57'),
	(52,'browse_recepts','recepts','2018-09-11 09:24:57','2018-09-11 09:24:57'),
	(53,'read_recepts','recepts','2018-09-11 09:24:57','2018-09-11 09:24:57'),
	(54,'edit_recepts','recepts','2018-09-11 09:24:57','2018-09-11 09:24:57'),
	(55,'add_recepts','recepts','2018-09-11 09:24:57','2018-09-11 09:24:57'),
	(56,'delete_recepts','recepts','2018-09-11 09:24:57','2018-09-11 09:24:57'),
	(57,'browse_attributes','attributes','2018-09-24 08:59:36','2018-09-24 08:59:36'),
	(58,'read_attributes','attributes','2018-09-24 08:59:36','2018-09-24 08:59:36'),
	(59,'edit_attributes','attributes','2018-09-24 08:59:36','2018-09-24 08:59:36'),
	(60,'add_attributes','attributes','2018-09-24 08:59:36','2018-09-24 08:59:36'),
	(61,'delete_attributes','attributes','2018-09-24 08:59:36','2018-09-24 08:59:36'),
	(62,'browse_coupons','coupons','2018-09-24 09:10:18','2018-09-24 09:10:18'),
	(63,'read_coupons','coupons','2018-09-24 09:10:18','2018-09-24 09:10:18'),
	(64,'edit_coupons','coupons','2018-09-24 09:10:18','2018-09-24 09:10:18'),
	(65,'add_coupons','coupons','2018-09-24 09:10:18','2018-09-24 09:10:18'),
	(66,'delete_coupons','coupons','2018-09-24 09:10:18','2018-09-24 09:10:18'),
	(67,'browse_clients','clients','2018-10-02 11:49:59','2018-10-02 11:49:59'),
	(68,'read_clients','clients','2018-10-02 11:49:59','2018-10-02 11:49:59'),
	(69,'edit_clients','clients','2018-10-02 11:49:59','2018-10-02 11:49:59'),
	(70,'add_clients','clients','2018-10-02 11:49:59','2018-10-02 11:49:59'),
	(71,'delete_clients','clients','2018-10-02 11:49:59','2018-10-02 11:49:59'),
	(72,'browse_recept-tags','recept-tags','2018-10-02 21:13:49','2018-10-02 21:13:49'),
	(73,'read_recept-tags','recept-tags','2018-10-02 21:13:49','2018-10-02 21:13:49'),
	(74,'edit_recept-tags','recept-tags','2018-10-02 21:13:49','2018-10-02 21:13:49'),
	(75,'add_recept-tags','recept-tags','2018-10-02 21:13:49','2018-10-02 21:13:49'),
	(76,'delete_recept-tags','recept-tags','2018-10-02 21:13:49','2018-10-02 21:13:49'),
	(77,'browse_newsletter','newsletter','2018-10-03 07:36:33','2018-10-03 07:36:33'),
	(78,'read_newsletter','newsletter','2018-10-03 07:36:33','2018-10-03 07:36:33'),
	(79,'edit_newsletter','newsletter','2018-10-03 07:36:33','2018-10-03 07:36:33'),
	(80,'add_newsletter','newsletter','2018-10-03 07:36:33','2018-10-03 07:36:33'),
	(81,'delete_newsletter','newsletter','2018-10-03 07:36:33','2018-10-03 07:36:33'),
	(82,'browse_stores','stores','2018-10-03 08:28:43','2018-10-03 08:28:43'),
	(83,'read_stores','stores','2018-10-03 08:28:43','2018-10-03 08:28:43'),
	(84,'edit_stores','stores','2018-10-03 08:28:43','2018-10-03 08:28:43'),
	(85,'add_stores','stores','2018-10-03 08:28:43','2018-10-03 08:28:43'),
	(86,'delete_stores','stores','2018-10-03 08:28:43','2018-10-03 08:28:43'),
	(87,'browse_orders','orders','2018-09-13 06:42:39','2018-09-13 06:42:39'),
	(88,'read_orders','orders','2018-09-13 06:42:39','2018-09-13 06:42:39'),
	(89,'edit_orders','orders','2018-09-13 06:42:39','2018-09-13 06:42:39'),
	(90,'add_orders','orders','2018-09-13 06:42:39','2018-09-13 06:42:39'),
	(91,'delete_orders','orders','2018-09-13 06:42:39','2018-09-13 06:42:39');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table product_recept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_recept`;

CREATE TABLE `product_recept` (
  `product_id` int(11) unsigned NOT NULL,
  `recept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `product_recept` WRITE;
/*!40000 ALTER TABLE `product_recept` DISABLE KEYS */;

INSERT INTO `product_recept` (`product_id`, `recept_id`)
VALUES
	(1,2),
	(4,2),
	(1,3),
	(8,3);

/*!40000 ALTER TABLE `product_recept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_tag`;

CREATE TABLE `product_tag` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;

INSERT INTO `product_tag` (`product_id`, `tag_id`)
VALUES
	(10,1),
	(9,1),
	(4,3),
	(8,1),
	(1,1),
	(12,1),
	(12,3),
	(15,1);

/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT '0',
  `name` varchar(128) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(11) DEFAULT NULL,
  `price_default` float(7,2) DEFAULT NULL,
  `price_action` float(7,2) DEFAULT NULL,
  `weight` varchar(32) DEFAULT NULL,
  `contents` text,
  `description` text,
  `nutritions` text,
  `image` varchar(255) DEFAULT NULL,
  `gallery` text,
  `buys` int(11) DEFAULT '0',
  `order` smallint(2) DEFAULT '0',
  `featured` set('0','1') DEFAULT '0',
  `active` set('yes','no') DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `product_id`, `name`, `category_id`, `code`, `price_default`, `price_action`, `weight`, `contents`, `description`, `nutritions`, `image`, `gallery`, `buys`, `order`, `featured`, `active`, `created_at`, `updated_at`)
VALUES
	(1,0,'100 % Bio čaj z morušových listov',4,'ASD-1',4.99,0.00,'32,5g (25x1,3g)','<p>Vychutnajte si jeho pln&uacute; chuť v čistej podobe bez pr&iacute;mesi inej rastlinej zložky. Už pri prv&yacute;ch d&uacute;&scaron;koch m&aacute; n&aacute;lev očaruj&uacute;cu, jemne sladkast&uacute;, komplexn&uacute; a harmonick&uacute; chuť, bez akejkoľvek zn&aacute;mky horkosti v dozvuku chuti. Je to z&aacute;roveň jeden z m&aacute;la čajov, ktor&yacute; pon&uacute;ka tak &scaron;irok&yacute; rozsah zdravotn&yacute;ch benefitov. Je doslova nabit&yacute; r&ocirc;znymi zdraviu prospe&scaron;n&yacute;mi l&aacute;tkami:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><strong>DNJ</strong> <strong>(1-deoxynojirimycin)</strong> -&gt; potl&aacute;ča vstreb&aacute;vanie cukru do krvi po jedle. Je vhodn&yacute; pre ľud&iacute; s diabetes mellitus. Pom&aacute;ha pri riaden&iacute; znižovania hmotnosti</li>\r\n<li><strong>GABA</strong> <strong>(gamma aminobutyric acid)</strong>-&gt; pom&aacute;ha optimalizovať krvn&yacute; tlak, predch&aacute;dza hypertenzii a podporuje hlbok&yacute; sp&aacute;no</li>\r\n<li><strong>Fytosteroly</strong> -&gt; pom&aacute;haj&uacute; pri znižovan&iacute; rizika ateroskler&oacute;zy regulovan&iacute;m cholesterol</li>\r\n<li><strong>Flavonoidy</strong> -&gt; &uacute;činn&eacute; antioxidanty, ktor&eacute; br&aacute;nia vzniku krvn&yacute;ch zrazen&iacute;n. Regeneruj&uacute; a spevňuj&uacute; cievy. Pom&aacute;haj&uacute; pri prevencii rakovinov&eacute;ho bujnenia</li>\r\n<li><strong>Vitam&iacute;n A (retinol) </strong>-&gt; pre zdrav&eacute; oči, kosti a zub</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₁</strong> <strong>(tiam&iacute;n)</strong> -&gt; d&ocirc;ležit&yacute; pre metabolizmus cukrov a optim&aacute;lne využitie energi</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₂</strong><strong> (riboflav&iacute;n) </strong>-&gt; d&ocirc;ležit&yacute; pre dobr&yacute; stav kože, oč&iacute; a funkciu srdca. Tiež m&aacute; vplyv na metabolizmus sacharido</li>\r\n<li><strong>Vitam&iacute;n C</strong> -&gt; potrebn&yacute; na regul&aacute;ciu metabolizmu aminokysel&iacute;n, udržiavanie pevnosti cievnych stien a odstraňovanie voľn&yacute;ch radik&aacute;lo</li>\r\n<li><strong>Vysok&yacute; podiel v&aacute;pnika, drasl&iacute;ka, magn&eacute;zia a železa</strong> -&gt; obzvl&aacute;sť d&ocirc;ležit&eacute; miner&aacute;ly pre ľud&iacute; s diabetom, osteopor&oacute;zou, srdcovo-cievnymi chorobami a an&eacute;miou</li>\r\n</ul>','<p>Porciovan&yacute; BIO čaj v 25-tich n&aacute;levov&yacute;ch vreck&aacute;ch (netto v&aacute;ha 32,5g)</p>\r\n<p><strong>100% pr&eacute;miov&yacute; BIO čaj z moru&scaron;ov&yacute;ch listov</strong> v drvenom stave.</p>\r\n<p>Najlep&scaron;&iacute; &uacute;činok je možn&eacute; dosiahnuť pravideln&yacute;m a dlhodob&yacute;m pit&iacute;m čaju.</p>\r\n<p>Moru&scaron;ov&eacute; listy s&uacute; pestovan&eacute; na BIO farme. Je to biologicky čist&eacute; pestovanie, ktor&eacute; vylučuje použ&iacute;vanie ak&yacute;chkoľvek umel&yacute;ch hnoj&iacute;v a pestic&iacute;dov, taktiež antibiot&iacute;k, a v žiadnom pr&iacute;pade nie s&uacute; pr&iacute;pustn&eacute; geneticky modifikovan&eacute; rastliny. Vďaka v&yacute;hradne pr&iacute;rodn&eacute;mu sp&ocirc;sobu pestovania moru&scaron;e a prec&iacute;zne &scaron;etrn&eacute;mu sp&ocirc;sobu zaobch&aacute;dzania s rastlinami pri a po zbere, sa prejavuj&uacute; &uacute;činky tohto čaju v čisto pr&iacute;rodnej forme a sile bez najmen&scaron;ej obavy o svoje zdravie z nežiad&uacute;cich &uacute;činkov cudzorod&yacute;ch l&aacute;tok ako napr&iacute;klad pridan&eacute; farbiv&aacute;, konzervačn&eacute; l&aacute;tky alebo umel&eacute; ochucovadl&aacute; a pridan&yacute; cukor. Jednoducho je to čaj v tej najčistej&scaron;ej forme.</p>\r\n<p><strong>Neobsahuje kofein </strong>-&gt; vhodn&yacute; ako čaj na večer taktiež pre deti a seniorov</p>\r\n<p><em>Marcelov postreh: \"Pre mňa sa tento čaj z čist&yacute;ch listov stal neodmysliteľnou s&uacute;časťou každ&eacute;ho dňa, či sa deň zač&iacute;na alebo konč&iacute;. M&ocirc;žem povedať, že som si vybudoval n&aacute;vyk ho piť denne len preto, že na mňa p&ocirc;sob&iacute; ako voda na oheň. Prosto upokojuj&uacute;ci.\"</em></p>','<p><img src=\"http://localhost:8888/storage/products/October2018/mulberry-nutrition-facts.jpg\" alt=\"\" width=\"159\" height=\"239\" /></p>','products/October2018/IDDVcRfDxeoRaiJs8rVf.png',NULL,9,0,'1','yes',NULL,NULL),
	(8,0,'100 % Bio čaj z morušových listov + Bio ruža',4,'LKJ-1',4.99,NULL,'32,5g (25x1,3g)','<p>Ruža a jej lupene, pestovan&eacute; na tej istej farme ako moru&scaron;ov&eacute; listy, dod&aacute;vaj&uacute; čaju decentn&uacute; a nezameniteľn&uacute; v&ocirc;ňu. Mal&eacute; množstvo v&yacute;znamnej a pr&iacute;ťažlivej silice, ktor&uacute; lupene ruže obsahuj&uacute;, sa po zaliat&iacute; čaju a vyl&uacute;hovan&iacute; extrahuje do n&aacute;poja a ihneď pozmen&iacute; chuť a v&ocirc;ňu moru&scaron;ov&eacute;ho čaju a v&aacute;m zodvihne n&aacute;ladu. Už pri prv&yacute;ch d&uacute;&scaron;koch m&aacute; n&aacute;lev očaruj&uacute;cu, jemne sladkasto-orie&scaron;kov&uacute;, komplexn&uacute; a harmonick&uacute; chuť, bez akejkoľvek zn&aacute;mky horkosti v dozvuku chuti. Je to z&aacute;roveň jeden z m&aacute;la čajov, ktor&yacute; pon&uacute;ka tak &scaron;irok&yacute; rozsah zdravotn&yacute;ch benefitov. Je doslova nabit&yacute; r&ocirc;znymi zdraviu prospe&scaron;n&yacute;mi l&aacute;tkami:</p>\r\n<ul>\r\n<li><strong>DNJ</strong> <strong>(1-deoxynojirimycin)</strong> -&gt; potl&aacute;ča vstreb&aacute;vanie cukru do krvi po jedle. Je vhodn&yacute; pre ľud&iacute; s diabetes mellitus. Pom&aacute;ha pri riaden&iacute; znižovania hmotnosti</li>\r\n<li><strong>GABA</strong> <strong>(gamma aminobutyric acid)</strong>-&gt; pom&aacute;ha optimalizovať krvn&yacute; tlak, predch&aacute;dza hypertenzii a podporuje hlbok&yacute; sp&aacute;no</li>\r\n<li><strong>Fytosteroly</strong> -&gt; pom&aacute;haj&uacute; pri znižovan&iacute; rizika ateroskler&oacute;zy regulovan&iacute;m cholesterol</li>\r\n<li><strong>Flavonoidy</strong> -&gt; &uacute;činn&eacute; antioxidanty, ktor&eacute; br&aacute;nia vzniku krvn&yacute;ch zrazen&iacute;n. Regeneruj&uacute; a spevňuj&uacute; cievy. Pom&aacute;haj&uacute; pri prevencii rakovinov&eacute;ho bujnenia</li>\r\n<li><strong>Vitam&iacute;n A (retinol) </strong>-&gt; pre zdrav&eacute; oči, kosti a zub</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₁</strong> <strong>(tiam&iacute;n)</strong> -&gt; d&ocirc;ležit&yacute; pre metabolizmus cukrov a optim&aacute;lne využitie energi</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₂</strong><strong> (riboflav&iacute;n) </strong>-&gt; d&ocirc;ležit&yacute; pre dobr&yacute; stav kože, oč&iacute; a funkciu srdca. Tiež m&aacute; vplyv na metabolizmus sacharido</li>\r\n<li><strong>Vitam&iacute;n C</strong> -&gt; potrebn&yacute; na regul&aacute;ciu metabolizmu aminokysel&iacute;n, udržiavanie pevnosti cievnych stien a odstraňovanie voľn&yacute;ch radik&aacute;lo</li>\r\n<li><strong>Vysok&yacute; podiel v&aacute;pnika, drasl&iacute;ka, magn&eacute;zia a železa</strong> -&gt; obzvl&aacute;sť d&ocirc;ležit&eacute; miner&aacute;ly pre ľud&iacute; s diabetom, osteopor&oacute;zou, srdcovo-cievnymi chorobami a an&eacute;miou</li>\r\n</ul>','<p>Porciovan&yacute; BIO čaj v 25-tich n&aacute;levov&yacute;ch vreck&aacute;ch (netto v&aacute;ha 32,5g)</p>\r\n<p><strong>Pr&eacute;miov&yacute; BIO čaj z moru&scaron;ov&yacute;ch listov&nbsp;</strong>95% a <strong>BIO ruža</strong> (lupene) 5%, v&scaron;etko v drvenom stave.</p>\r\n<p>Najlep&scaron;&iacute; &uacute;činok je možn&eacute; dosiahnuť pravideln&yacute;m a dlhodob&yacute;m pit&iacute;m čaju.</p>\r\n<p>Moru&scaron;ov&eacute; listy s&uacute; pestovan&eacute; na BIO farme. Je to biologicky čist&eacute; pestovanie, ktor&eacute; vylučuje použ&iacute;vanie ak&yacute;chkoľvek umel&yacute;ch hnoj&iacute;v a pestic&iacute;dov, taktiež antibiot&iacute;k, a v žiadnom pr&iacute;pade nie s&uacute; pr&iacute;pustn&eacute; geneticky modifikovan&eacute; rastliny. Vďaka v&yacute;hradne pr&iacute;rodn&eacute;mu sp&ocirc;sobu pestovania moru&scaron;e a prec&iacute;zne &scaron;etrn&eacute;mu sp&ocirc;sobu zaobch&aacute;dzania s rastlinami pri a po zbere, sa prejavuj&uacute; &uacute;činky tohto čaju v čisto pr&iacute;rodnej forme a sile bez najmen&scaron;ej obavy o svoje zdravie z nežiad&uacute;cich &uacute;činkov cudzorod&yacute;ch l&aacute;tok ako napr&iacute;klad pridan&eacute; farbiv&aacute;, konzervačn&eacute; l&aacute;tky alebo umel&eacute; ochucovadl&aacute; a pridan&yacute; cukor. Jednoducho je to čaj v tej najčistej&scaron;ej forme.</p>\r\n<p><strong>Neobsahuje kofein </strong>-&gt; vhodn&yacute; ako čaj na večer taktiež pre deti a seniorov</p>\r\n<p><em>Na r&aacute;no pr&aacute;ve tento čaj je jemn&yacute; a sviežo vonia. Je to skvel&yacute; n&aacute;poj pre dobr&uacute; n&aacute;ladu a ľah&scaron;ie zvl&aacute;dnut&yacute; deň.</em></p>','<p><img src=\"http://localhost:8888/storage/products/October2018/mulberry-nutrition-facts1.jpg\" alt=\"\" width=\"250\" /></p>','products/October2018/6w2BTNBKrHunHsDE59BD.png',NULL,3,0,'0','yes',NULL,NULL),
	(10,0,'100 % Bio čaj z morušových listov + Požlt farbiarsky',4,'MNB-1',4.99,NULL,'32,5g (25x1,3g)','<p>Požlt farbiarsky je jedna z najstar&scaron;ie pestovan&yacute;ch rastl&iacute;n v&ocirc;bec. Pestuje sa dodnes hlavne pre semen&aacute; a kvety resp. olej zo semien a kvetov. Požlt m&aacute; preuk&aacute;zan&uacute; schopnosť znižovať cholesterol v krvi a najnov&scaron;ie sa potvrdzuje aj vhodnosť rastliny pre diabetikov na zn&iacute;ženie hladiny krvn&eacute;ho cukru. Svojimi vlastnosťami je vhodn&yacute; hlavne pre ľud&iacute; s hypertenziou. Už pri prv&yacute;ch d&uacute;&scaron;koch m&aacute; n&aacute;lev očaruj&uacute;cu, jemne sladkasto-orie&scaron;kov&uacute;, komplexn&uacute; a harmonick&uacute; chuť, bez akejkoľvek zn&aacute;mky horkosti v dozvuku chuti. Jeho sfarbenie je vďaka požltu tmav&scaron;ie - zelenožletej, až oranžovej farby. Je to z&aacute;roveň jeden z m&aacute;la čajov, ktor&yacute; pon&uacute;ka tak &scaron;irok&yacute; rozsah zdravotn&yacute;ch benefitov. Je doslova nabit&yacute; r&ocirc;znymi zdraviu prospe&scaron;n&yacute;mi l&aacute;tkami:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><strong>DNJ</strong> <strong>(1-deoxynojirimycin)</strong> -&gt; potl&aacute;ča vstreb&aacute;vanie cukru do krvi po jedle. Je vhodn&yacute; pre ľud&iacute; s diabetes mellitus. Pom&aacute;ha pri riaden&iacute; znižovania hmotnosti.</li>\r\n<li><strong>GABA</strong> <strong>(gamma aminobutyric acid)</strong>-&gt; pom&aacute;ha optimalizovať krvn&yacute; tlak, predch&aacute;dza hypertenzii a podporuje hlbok&yacute; sp&aacute;nok</li>\r\n<li><strong>Fytosteroly</strong> -&gt; pom&aacute;haj&uacute; pri znižovan&iacute; rizika ateroskler&oacute;zy regulovan&iacute;m cholesterol</li>\r\n<li><strong>Flavonoidy</strong> -&gt; &uacute;činn&eacute; antioxidanty, ktor&eacute; br&aacute;nia vzniku krvn&yacute;ch zrazen&iacute;n. Regeneruj&uacute; a spevňuj&uacute; cievy. Pom&aacute;haj&uacute; pri prevencii rakovinov&eacute;ho bujnenia</li>\r\n<li><strong>Vitam&iacute;n A (retinol) </strong>-&gt; pre zdrav&eacute; oči, kosti a zub</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₁</strong> <strong>(tiam&iacute;n)</strong> -&gt; d&ocirc;ležit&yacute; pre metabolizmus cukrov a optim&aacute;lne využitie energi</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₂</strong><strong> (riboflav&iacute;n) </strong>-&gt; d&ocirc;ležit&yacute; pre dobr&yacute; stav kože, oč&iacute; a funkciu srdca. Tiež m&aacute; vplyv na metabolizmus sacharido</li>\r\n<li><strong>Vitam&iacute;n C</strong> -&gt; potrebn&yacute; na regul&aacute;ciu metabolizmu aminokysel&iacute;n, udržiavanie pevnosti cievnych stien a odstraňovanie voľn&yacute;ch radik&aacute;lo</li>\r\n<li><strong>Vysok&yacute; podiel v&aacute;pnika, drasl&iacute;ka, magn&eacute;zia a železa</strong> -&gt; obzvl&aacute;sť d&ocirc;ležit&eacute; miner&aacute;ly pre ľud&iacute; s diabetom, osteopor&oacute;zou, srdcovo-cievnymi chorobami a an&eacute;miou</li>\r\n</ul>','<p>Porciovan&yacute; BIO čaj v 25-tich n&aacute;levov&yacute;ch vreck&aacute;ch (netto v&aacute;ha 32,5g)</p>\r\n<p><strong>Pr&eacute;miov&yacute; BIO čaj z moru&scaron;ov&yacute;ch listov</strong>&nbsp;95% a <strong>požlt farbiarsky</strong> 5%&nbsp; (Carthamus tinctorius - kvet), v&scaron;etko v drvenom stave.</p>\r\n<p>Najlep&scaron;&iacute; &uacute;činok je možn&eacute; dosiahnuť pravideln&yacute;m a dlhodob&yacute;m pit&iacute;m čaju.</p>\r\n<p>Moru&scaron;ov&eacute; listy s&uacute; pestovan&eacute; na BIO farme. Je to biologicky čist&eacute; pestovanie, ktor&eacute; vylučuje použ&iacute;vanie ak&yacute;chkoľvek umel&yacute;ch hnoj&iacute;v a pestic&iacute;dov, taktiež antibiot&iacute;k, a v žiadnom pr&iacute;pade nie s&uacute; pr&iacute;pustn&eacute; geneticky modifikovan&eacute; rastliny. Vďaka v&yacute;hradne pr&iacute;rodn&eacute;mu sp&ocirc;sobu pestovania moru&scaron;e a prec&iacute;zne &scaron;etrn&eacute;mu sp&ocirc;sobu zaobch&aacute;dzania s rastlinami pri a po zbere, sa prejavuj&uacute; &uacute;činky tohto čaju v čisto pr&iacute;rodnej forme a sile bez najmen&scaron;ej obavy o svoje zdravie z nežiad&uacute;cich &uacute;činkov cudzorod&yacute;ch l&aacute;tok ako napr&iacute;klad pridan&eacute; farbiv&aacute;, konzervačn&eacute; l&aacute;tky alebo umel&eacute; ochucovadl&aacute; a pridan&yacute; cukor. Jednoducho je to čaj v tej najčistej&scaron;ej forme.</p>\r\n<p><strong>Neobsahuje kofein </strong>-&gt; vhodn&yacute; ako čaj na večer taktiež pre deti a seniorov</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/mulberry-nutrition-facts3.jpg\" alt=\"\" width=\"250\" /></p>','products/October2018/7mpytregaq1G7Lx5gfAZ.png','[\"products\\/October2018\\/uGm7sWUAdVS197diINNu.png\"]',NULL,0,'0','yes',NULL,NULL),
	(12,0,'Morušový čaj 100% - sypaný',4,'ABC-1',5.89,NULL,'50g','<p>Vychutnajte si jeho pln&uacute; chuť v najčistej&scaron;ej a najlahodnej&scaron;ej podobe. Voľn&eacute; listy akcentuj&uacute; dokonal&uacute; lahodnosť a sametovosť moru&scaron;ov&eacute;ho čaju. Jeho v&ocirc;ňa v&aacute;m m&ocirc;že pripomen&uacute;ť čerstvo upečen&uacute; vanilkov&uacute; obl&aacute;tku. Už pri prv&yacute;ch d&uacute;&scaron;koch m&aacute; n&aacute;lev očaruj&uacute;cu, jemne sladkast&uacute;, komplexn&uacute; a harmonick&uacute; chuť, bez akejkoľvek zn&aacute;mky horkosti v dozvuku chuti. Je to z&aacute;roveň jeden z m&aacute;la čajov, ktor&yacute; pon&uacute;ka tak &scaron;irok&yacute; rozsah zdravotn&yacute;ch benefitov. Je doslova nabit&yacute; r&ocirc;znymi zdraviu prospe&scaron;n&yacute;mi l&aacute;tkami:</p>\r\n<ul>\r\n<li><strong>DNJ</strong> <strong>(1-deoxynojirimycin)</strong> -&gt; potl&aacute;ča vstreb&aacute;vanie cukru do krvi po jedle. Je vhodn&yacute; pre ľud&iacute; s diabetes mellitus. Pom&aacute;ha pri riaden&iacute; znižovania hmotnosti.</li>\r\n<li><strong>GABA</strong> <strong>(gamma aminobutyric acid)</strong>-&gt; pom&aacute;ha optimalizovať krvn&yacute; tlak, predch&aacute;dza hypertenzii a podporuje hlbok&yacute; sp&aacute;nok</li>\r\n<li><strong>Fytosteroly</strong> -&gt; pom&aacute;haj&uacute; pri znižovan&iacute; rizika ateroskler&oacute;zy regulovan&iacute;m cholesterolu</li>\r\n<li><strong>Flavonoidy</strong> -&gt; &uacute;činn&eacute; antioxidanty, ktor&eacute; br&aacute;nia vzniku krvn&yacute;ch zrazen&iacute;n. Regeneruj&uacute; a spevňuj&uacute; cievy. Pom&aacute;haj&uacute; pri prevencii rakovinov&eacute;ho bujnenia.</li>\r\n<li><strong>Vitam&iacute;n A (retinol) </strong>-&gt; pre zdrav&eacute; oči, kosti a zuby</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₁</strong> <strong>(tiam&iacute;n)</strong> -&gt; d&ocirc;ležit&yacute; pre metabolizmus cukrov a optim&aacute;lne využitie energie</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₂</strong><strong> (riboflav&iacute;n) </strong>-&gt; d&ocirc;ležit&yacute; pre dobr&yacute; stav kože, oč&iacute; a funkciu srdca. Tiež m&aacute; vplyv na metabolizmus sacharidov</li>\r\n<li><strong>Vitam&iacute;n C</strong> -&gt; potrebn&yacute; na regul&aacute;ciu metabolizmu aminokysel&iacute;n, udržiavanie pevnosti cievnych stien a odstraňovanie voľn&yacute;ch radik&aacute;lov</li>\r\n<li><strong>Vysok&yacute; podiel v&aacute;pnika, drasl&iacute;ka, magn&eacute;zia a železa</strong> -&gt; obzvl&aacute;sť d&ocirc;ležit&eacute; miner&aacute;ly pre ľud&iacute; s diabetom, osteopor&oacute;zou, srdcovo-cievnymi chorobami a an&eacute;miou</li>\r\n</ul>','<h3>NOV&Aacute; &Uacute;RODA J&uacute;n 2018 !!!</h3>\r\n<p><strong>100% pr&eacute;miov&yacute; BIO čaj z moru&scaron;ov&yacute;ch listov</strong> - sypan&yacute; / voľn&eacute; listy.</p>\r\n<p>Pr&iacute;prava: 5g čaju na 500ml vriacej vody. L&uacute;hujeme 3-5 minut podľa chuti. Dlh&scaron;ie l&uacute;hovan&yacute; n&aacute;lev m&aacute; intenz&iacute;vnu tmavozelenu farbu a v&yacute;datne hutn&uacute; v&ocirc;ňu podobn&uacute; v&ocirc;ni vianočnej obl&aacute;tky a nasladkast&uacute; chuť.</p>\r\n<p>Najlep&scaron;&iacute; &uacute;činok je možn&eacute; dosiahnuť pravideln&yacute;m a dlhodob&yacute;m pit&iacute;m čaju.</p>\r\n<p>Moru&scaron;ov&eacute; listy s&uacute; pestovan&eacute; na BIO farme. Je to biologicky čist&eacute; pestovanie, ktor&eacute; vylučuje použ&iacute;vanie ak&yacute;chkoľvek umel&yacute;ch hnoj&iacute;v a pestic&iacute;dov, taktiež antibiot&iacute;k, a v žiadnom pr&iacute;pade nie s&uacute; pr&iacute;pustn&eacute; geneticky modifikovan&eacute; rastliny. Vďaka v&yacute;hradne pr&iacute;rodn&eacute;mu sp&ocirc;sobu pestovania moru&scaron;e a prec&iacute;zne &scaron;etrn&eacute;mu sp&ocirc;sobu zaobch&aacute;dzania s rastlinami pri a po zbere, sa prejavuj&uacute; &uacute;činky tohto čaju v čisto pr&iacute;rodnej forme a sile bez najmen&scaron;ej obavy o svoje zdravie z nežiad&uacute;cich &uacute;činkov cudzorod&yacute;ch l&aacute;tok ako napr&iacute;klad pridan&eacute; farbiv&aacute;, konzervačn&eacute; l&aacute;tky alebo umel&eacute; ochucovadl&aacute; a pridan&yacute; cukor. Jednoducho je to čaj v tej najčistej&scaron;ej forme.</p>\r\n<p><strong>Neobsahuje kofein </strong>-&gt; vhodn&yacute; ako čaj na večer taktiež pre deti a seniorov</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/mulberry-nutrition-facts4.jpg\" alt=\"\" width=\"250\" /></p>','products/October2018/DJm7eljUcM04q0F5Jb1Z.png','[\"products\\/October2018\\/nFWkOh1ncFDzZhO4dsO3.png\",\"products\\/October2018\\/QsK8FzlKxFMOSqBKcfwd.jpg\",\"products\\/October2018\\/gGu2OwHvCDcEIdqP6z5W.jpg\"]',NULL,0,'0','yes',NULL,NULL),
	(13,12,NULL,4,'ABC-2',7.59,NULL,'80g',NULL,NULL,NULL,NULL,NULL,NULL,1,'0','yes',NULL,NULL),
	(14,12,NULL,4,'ABC-3',12.99,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,2,'0','yes',NULL,NULL),
	(15,0,'Morušový čaj a jazmín - sypaný',4,'SDF-1',7.49,NULL,'50g','<p>Charakteristick&aacute; v&ocirc;ňa jazm&iacute;nu p&ocirc;sob&iacute; v tomto čaji proti stresu nielen cez zmysly, ale aj vn&uacute;torne na upokojenie tr&aacute;viaceho &uacute;strojenstva, proti nervov&eacute;mu vyp&auml;tiu a kŕčom. Vychutnajte si jeho podmaniv&uacute; upokojuj&uacute;cu pln&uacute; chuť, ide&aacute;lne ako večern&yacute; čaj. Kvety jazm&iacute;nu s&uacute; pestovan&eacute; na priľahl&yacute;ch pol&iacute;čkach v okol&iacute; moru&scaron;ovn&iacute;kov. Už pri prv&yacute;ch d&uacute;&scaron;koch m&aacute; n&aacute;lev očaruj&uacute;cu, jemne sladkasto-orie&scaron;kov&uacute;, komplexn&uacute; a harmonick&uacute; chuť, bez akejkoľvek zn&aacute;mky horkosti v dozvuku chuti. Je to z&aacute;roveň jeden z m&aacute;la čajov, ktor&yacute; pon&uacute;ka tak &scaron;irok&yacute; rozsah zdravotn&yacute;ch benefitov. Je doslova nabit&yacute; r&ocirc;znymi zdraviu prospe&scaron;n&yacute;mi l&aacute;tkami:</p>\r\n<ul>\r\n<li><strong>DNJ</strong> <strong>(1-deoxynojirimycin)</strong> -&gt; potl&aacute;ča vstreb&aacute;vanie cukru do krvi po jedle. Je vhodn&yacute; pre ľud&iacute; s diabetes mellitus. Pom&aacute;ha pri riaden&iacute; znižovania hmotnosti.</li>\r\n<li><strong>GABA</strong> <strong>(gamma aminobutyric acid)</strong>-&gt; pom&aacute;ha optimalizovať krvn&yacute; tlak, predch&aacute;dza hypertenzii a podporuje hlbok&yacute; sp&aacute;nok</li>\r\n<li><strong>Fytosteroly</strong> -&gt; pom&aacute;haj&uacute; pri znižovan&iacute; rizika ateroskler&oacute;zy regulovan&iacute;m cholesterolu</li>\r\n<li><strong>Flavonoidy</strong> -&gt; &uacute;činn&eacute; antioxidanty, ktor&eacute; br&aacute;nia vzniku krvn&yacute;ch zrazen&iacute;n. Regeneruj&uacute; a spevňuj&uacute; cievy. Pom&aacute;haj&uacute; pri prevencii rakovinov&eacute;ho bujnenia.</li>\r\n<li><strong>Vitam&iacute;n A (retinol) </strong>-&gt; pre zdrav&eacute; oči, kosti a zuby</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₁</strong> <strong>(tiam&iacute;n)</strong> -&gt; d&ocirc;ležit&yacute; pre metabolizmus cukrov a optim&aacute;lne využitie energie</li>\r\n<li><strong>Vitam&iacute;n B</strong><strong>₂</strong><strong> (riboflav&iacute;n) </strong>-&gt; d&ocirc;ležit&yacute; pre dobr&yacute; stav kože, oč&iacute; a funkciu srdca. Tiež m&aacute; vplyv na metabolizmus sacharidov</li>\r\n<li><strong>Vitam&iacute;n C</strong> -&gt; potrebn&yacute; na regul&aacute;ciu metabolizmu aminokysel&iacute;n, udržiavanie pevnosti cievnych stien a odstraňovanie voľn&yacute;ch radik&aacute;lov</li>\r\n<li><strong>Vysok&yacute; podiel v&aacute;pnika, drasl&iacute;ka, magn&eacute;zia a železa</strong> -&gt; obzvl&aacute;sť d&ocirc;ležit&eacute; miner&aacute;ly pre ľud&iacute; s diabetom, osteopor&oacute;zou, srdcovo-cievnymi chorobami a an&eacute;miou</li>\r\n</ul>','<h3>NOV&Aacute; &Uacute;RODA J&uacute;n 2018 !!!</h3>\r\n<p>&nbsp;</p>\r\n<p><strong>Pr&eacute;miov&yacute; BIO čaj z moru&scaron;ov&yacute;ch listov 90% + BIO jazm&iacute;nov&eacute; kvety 10%</strong> - sypan&yacute; / voľn&eacute; listy.</p>\r\n<p>&nbsp;</p>\r\n<p>Pr&iacute;prava: 5g čaju na 500ml vriacej vody. L&uacute;hujeme 3-5 minut podľa chuti. Dlh&scaron;ie l&uacute;hovan&yacute; n&aacute;lev m&aacute; intenz&iacute;vnu tmavozelenu farbu a v&yacute;datne hutn&uacute; v&ocirc;ňu podobn&uacute; v&ocirc;ni vianočnej obl&aacute;tky a nasladkast&uacute; chuť.</p>\r\n<p>Najlep&scaron;&iacute; &uacute;činok je možn&eacute; dosiahnuť pravideln&yacute;m a dlhodob&yacute;m pit&iacute;m čaju.</p>\r\n<p>&nbsp;</p>\r\n<p>Moru&scaron;ov&eacute; listy s&uacute; pestovan&eacute; na BIO farme. Je to biologicky čist&eacute; pestovanie, ktor&eacute; vylučuje použ&iacute;vanie ak&yacute;chkoľvek umel&yacute;ch hnoj&iacute;v a pestic&iacute;dov, taktiež antibiot&iacute;k, a v žiadnom pr&iacute;pade nie s&uacute; pr&iacute;pustn&eacute; geneticky modifikovan&eacute; rastliny. Vďaka v&yacute;hradne pr&iacute;rodn&eacute;mu sp&ocirc;sobu pestovania moru&scaron;e a prec&iacute;zne &scaron;etrn&eacute;mu sp&ocirc;sobu zaobch&aacute;dzania s rastlinami pri a po zbere, sa prejavuj&uacute; &uacute;činky tohto čaju v čisto pr&iacute;rodnej forme a sile bez najmen&scaron;ej obavy o svoje zdravie z nežiad&uacute;cich &uacute;činkov cudzorod&yacute;ch l&aacute;tok ako napr&iacute;klad pridan&eacute; farbiv&aacute;, konzervačn&eacute; l&aacute;tky alebo umel&eacute; ochucovadl&aacute; a pridan&yacute; cukor. Jednoducho je to čaj v tej najčistej&scaron;ej forme.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Neobsahuje kofein </strong>-&gt; vhodn&yacute; ako čaj na večer taktiež pre deti a seniorov</p>\r\n<p>&nbsp;</p>\r\n<p><em><span style=\"text-decoration: underline;\">Andrejov postreh</span>: \"Tento čaj mi pripom&iacute;na pr&iacute;jemn&aacute; chv&iacute;le str&aacute;ven&eacute; v Juhov&yacute;chodnej &Aacute;zii. V&ocirc;ňu jazm&iacute;nu milujem, je skutočne upokojuj&uacute;ca. Po n&aacute;ročnom dni mi &scaron;&aacute;lka tohto čaju a kniha zaručia pokojn&yacute; sp&aacute;nok.\"</em></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://www.naturiq.sk/naturiq/Static/img/ENJOY_podpis.png\" alt=\"\" /></p>\r\n<p><br class=\"clear\" /><br /></p>','<p>&nbsp;<img src=\"http://localhost:8888/storage/products/October2018/mulberry-nutrition-facts5.jpg\" alt=\"\" width=\"250\" /></p>','products/October2018/hyq5ECPPOxjuOL9M2ggf.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(16,15,NULL,0,'SDF-2',9.69,NULL,'80g',NULL,NULL,NULL,NULL,NULL,NULL,2,'0','yes',NULL,NULL),
	(17,15,NULL,0,'SDF-3',16.49,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,3,'0','yes',NULL,NULL);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recept_recept-tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recept_recept-tag`;

CREATE TABLE `recept_recept-tag` (
  `recept_tag_id` smallint(3) unsigned NOT NULL,
  `recept_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recept_recept-tag` WRITE;
/*!40000 ALTER TABLE `recept_recept-tag` DISABLE KEYS */;

INSERT INTO `recept_recept-tag` (`recept_tag_id`, `recept_id`)
VALUES
	(1,3),
	(1,2),
	(2,1),
	(2,2),
	(2,3),
	(3,2),
	(4,4),
	(4,2),
	(5,1),
	(5,4);

/*!40000 ALTER TABLE `recept_recept-tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recept-tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recept-tags`;

CREATE TABLE `recept-tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `slug` varchar(32) DEFAULT NULL,
  `class` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recept-tags` WRITE;
/*!40000 ALTER TABLE `recept-tags` DISABLE KEYS */;

INSERT INTO `recept-tags` (`id`, `name`, `slug`, `class`)
VALUES
	(1,'Raňajky','ranajky','blue'),
	(2,'Desiata','desiata','green'),
	(3,'Obed','obed','gold'),
	(4,'Olovrant','olovrant','pink'),
	(5,'Večera','vecera','purple');

/*!40000 ALTER TABLE `recept-tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recepts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recepts`;

CREATE TABLE `recepts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `excerpt` text,
  `content` text,
  `ingredients` text,
  `illustration` varchar(255) DEFAULT NULL,
  `gallery` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recepts` WRITE;
/*!40000 ALTER TABLE `recepts` DISABLE KEYS */;

INSERT INTO `recepts` (`id`, `title`, `excerpt`, `content`, `ingredients`, `illustration`, `gallery`, `created_at`, `updated_at`)
VALUES
	(1,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','recepts/October2018/8O8QEwWHOam1MYmoVVeI.png',NULL,'2018-10-02 15:52:00','2018-10-02 21:56:39'),
	(2,'Lorem ipsum dolor sit amet, consetetur','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<table class=\"table\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>qwe</strong></td>\r\n<td style=\"width: 108.217px;\">qwe</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>wer</strong></td>\r\n<td style=\"width: 108.217px;\">ert</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>rty</strong></td>\r\n<td style=\"width: 108.217px;\">yui</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>uio</strong></td>\r\n<td style=\"width: 108.217px;\">iop</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>iop</strong></td>\r\n<td style=\"width: 108.217px;\">op[</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>dfg</strong></td>\r\n<td style=\"width: 108.217px;\">hhj</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>asd</strong></td>\r\n<td style=\"width: 108.217px;\">asd</td>\r\n</tr>\r\n</tbody>\r\n</table>','recepts/October2018/puoITJOrlwRvTnvu6P6A.png',NULL,'2018-10-02 20:40:00','2018-10-02 22:31:55'),
	(3,'Lorem ipsum dolor sit amet, consetetur','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<table class=\"table table-striped\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>250g</strong></td>\r\n<td style=\"width: 137.95px;\">mlet&yacute;ch orechov</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>1PL</strong></td>\r\n<td style=\"width: 137.95px;\">oleja</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>180g</strong></td>\r\n<td style=\"width: 137.95px;\">pr&aacute;&scaron;kov&eacute;ho cukru</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>250ml</strong></td>\r\n<td style=\"width: 137.95px;\">čerstv&eacute;ho mlieka</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>500g</strong></td>\r\n<td style=\"width: 137.95px;\">su&scaron;en&eacute;ho ovocia</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>1PL</strong></td>\r\n<td style=\"width: 137.95px;\">tuzemsk&eacute;ho rumu</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>1L</strong></td>\r\n<td style=\"width: 137.95px;\">čistej vody</td>\r\n</tr>\r\n</tbody>\r\n</table>','recepts/October2018/0E6UXFEZ6JQdOr9avuYt.jpg','[\"recepts\\/October2018\\/DvlCkOb8vB8n3yImq7gW.jpg\"]','2018-10-02 20:40:00','2018-10-02 22:37:19');

/*!40000 ALTER TABLE `recepts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','Administrator','2018-09-05 11:44:22','2018-09-05 11:44:22'),
	(2,'user','Normal User','2018-09-05 11:44:22','2018-09-05 11:44:22');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`)
VALUES
	(1,'site.title','Site Title','Site Title','','text',1,'Site'),
	(2,'site.description','Site Description','Site Description','','text',2,'Site'),
	(3,'site.logo','Site Logo','','','image',3,'Site'),
	(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),
	(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),
	(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),
	(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),
	(8,'admin.loader','Admin Loader','','','image',3,'Admin'),
	(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),
	(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin'),
	(11,'admin.email','Primary E-mail Address','tetrev@alterweb.sk',NULL,'text',6,'Admin');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shipping_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shipping_payment`;

CREATE TABLE `shipping_payment` (
  `shipping_id` smallint(2) unsigned NOT NULL,
  `payment_id` smallint(2) DEFAULT NULL,
  KEY `shipping_id` (`shipping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shipping_payment` WRITE;
/*!40000 ALTER TABLE `shipping_payment` DISABLE KEYS */;

INSERT INTO `shipping_payment` (`shipping_id`, `payment_id`)
VALUES
	(3,1),
	(3,2),
	(3,3),
	(1,2),
	(1,3),
	(2,2),
	(2,3);

/*!40000 ALTER TABLE `shipping_payment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shippings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shippings`;

CREATE TABLE `shippings` (
  `id` smallint(2) unsigned NOT NULL AUTO_INCREMENT,
  `price` float(5,2) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `order` smallint(2) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `active` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shippings` WRITE;
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;

INSERT INTO `shippings` (`id`, `price`, `name`, `description`, `order`, `icon`, `active`)
VALUES
	(1,3.90,'Slovenská Pošta','Vaša objednávka vám bude zaslaná balíkom slovenskej pošty',2,NULL,'1'),
	(2,4.00,'Kuriér DPD','Vašu objednávku vám zašleme kuriérom spoločnosti DPD',3,NULL,'1'),
	(3,0.00,'Osobný odber','Tovar si môžete vyzdvihnúť osobne na našej pobočke v Bratislave',1,NULL,'1'),
	(4,4.00,'Kuriér GLS','Vašu objednávku vám zašleme kuriérom spoločnosti GLS',4,NULL,'1');

/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table slideshow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `slideshow`;

CREATE TABLE `slideshow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table stores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stores`;

CREATE TABLE `stores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  `zip` varchar(8) DEFAULT NULL,
  `hours` text,
  `active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;

INSERT INTO `stores` (`id`, `city_id`, `image`, `name`, `street`, `zip`, `hours`, `active`)
VALUES
	(1,1,'stores/October2018/poRPCSELtxz5EYleFREx.png','Naturiq Bajkalská','Bajkalská 16','82108','<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>','1'),
	(2,2,'stores/October2018/poRPCSELtxz5EYleFREx.png','Naturiq Banská','Bratislavská 4','65874','<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>','1'),
	(3,3,'stores/October2018/poRPCSELtxz5EYleFREx.png','Naturiq Košice','Ostrovná 65/A','32147','<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>','1'),
	(4,1,'stores/October2018/poRPCSELtxz5EYleFREx.png','Naturiq Romancová','Romancová 11','83526','<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>','1');

/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `statuses`;

CREATE TABLE `statuses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;

INSERT INTO `statuses` (`id`, `name`, `desc`)
VALUES
	(1,'Objednávka prijatá','Objednávka bola odoslaná a čaká na spracovanie'),
	(2,'Spracováva sa','Objednávka bola zaradená medzi spracovávané'),
	(3,'Pripravená k odberu','Objednávka je pripravená k osobnému odberu'),
	(4,'Expedovaná','Objednávka bola expedovaná kuriérskou službou'),
	(5,'Pozastavená','Pri spracovaní objednávky sa vystkytli komplikácie'),
	(6,'Doručená zákazníkovi','Objednávku označil kuriér ako doručenú zákazníkovi'),
	(7,'Ukončená','Objednávka bola uzavretá a označená ako dokončená'),
	(8,'Zrušená','Objednávka bola zrušená a uzavretá administrátorom');

/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `class` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `name`, `class`)
VALUES
	(1,'PREMIUM BIO','bio'),
	(2,'RAW','raw'),
	(3,'JUST ARRIVED','new');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
	(1,'data_types','display_name_singular',5,'pt','Post','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(2,'data_types','display_name_singular',6,'pt','Página','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(3,'data_types','display_name_singular',1,'pt','Utilizador','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(4,'data_types','display_name_singular',4,'pt','Categoria','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(5,'data_types','display_name_singular',2,'pt','Menu','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(6,'data_types','display_name_singular',3,'pt','Função','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(7,'data_types','display_name_plural',5,'pt','Posts','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(8,'data_types','display_name_plural',6,'pt','Páginas','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(9,'data_types','display_name_plural',1,'pt','Utilizadores','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(10,'data_types','display_name_plural',4,'pt','Categorias','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(11,'data_types','display_name_plural',2,'pt','Menus','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(12,'data_types','display_name_plural',3,'pt','Funções','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(13,'categories','slug',1,'pt','categoria-1','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(14,'categories','name',1,'pt','Categoria 1','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(15,'categories','slug',2,'pt','categoria-2','2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(16,'categories','name',2,'pt','Categoria 2','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(17,'pages','title',1,'pt','Olá Mundo','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(18,'pages','slug',1,'pt','ola-mundo','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(20,'menu_items','title',1,'pt','Painel de Controle','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(21,'menu_items','title',2,'pt','Media','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(22,'menu_items','title',12,'pt','Publicações','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(23,'menu_items','title',3,'pt','Utilizadores','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(24,'menu_items','title',11,'pt','Categorias','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(25,'menu_items','title',13,'pt','Páginas','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(26,'menu_items','title',4,'pt','Funções','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(27,'menu_items','title',5,'pt','Ferramentas','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(28,'menu_items','title',6,'pt','Menus','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(29,'menu_items','title',7,'pt','Base de dados','2018-09-05 11:44:26','2018-09-05 11:44:26'),
	(30,'menu_items','title',10,'pt','Configurações','2018-09-05 11:44:26','2018-09-05 11:44:26');

/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`)
VALUES
	(1,1,'Admin','admin@admin.com','users/default.png','$2y$10$FK3BTS3pW69VMBv14zRng.DH/AA3BLUW8rIKzKTKoE8gvVk.Kxd1.','GtiauL0TCiYZkhOr31N12YNZeKnoQHpSzVZfa5UqREBy46eyINYvDX8UFQX2',NULL,'2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(2,1,'exidas','tetrev@alterweb.sk','users/default.png','$2y$10$5bRd2dDmb2h0jbyUYir.Ge/LX2SyphCE0bwztRZECtBbOJf5qW4tC','1PWm0AYxWP2gJs4lgOczLoQaxprKFgeGoZeZ9Vs1NubyI6mDl8MYs2h01jYt',NULL,'2018-09-12 07:52:13','2018-09-12 07:52:13');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
