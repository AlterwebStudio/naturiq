# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: naturiq
# Generation Time: 2018-10-07 19:06:54 +0000
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
	(2,15),
	(1,18),
	(3,18),
	(1,23),
	(1,28),
	(3,28),
	(1,33),
	(3,33),
	(1,38),
	(3,38),
	(1,44),
	(3,44),
	(1,49),
	(3,49),
	(1,54),
	(3,54),
	(1,55),
	(3,55),
	(1,56),
	(3,56),
	(1,57),
	(3,57),
	(1,58),
	(3,58),
	(3,59),
	(1,60),
	(3,60),
	(1,61),
	(3,61),
	(1,62),
	(3,62),
	(1,63),
	(3,63);

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
  `id` smallint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `backgrounds` WRITE;
/*!40000 ALTER TABLE `backgrounds` DISABLE KEYS */;

INSERT INTO `backgrounds` (`id`, `name`, `image`)
VALUES
	(1,'Purple (fialová)','backgrounds/October2018/lQhSbZ2Ytuft7XSmsHY9.jpg'),
	(2,'Clitoria (modrá)','backgrounds/October2018/nngm9CzBbajNnfHmWWWn.jpg'),
	(3,'Green (zelená)','backgrounds/October2018/r5LpMvKFNeAoVwvXmvid.jpg'),
	(4,'Jasmine (hnedá)','backgrounds/October2018/3JB43xHNomgXj9YMPNdr.jpg'),
	(5,'Pink (ružová)','backgrounds/October2018/R3d23oJx1eIoMS1C4twi.jpg'),
	(6,'Safflower (oranžová)','backgrounds/October2018/SWICItAsNJXtj2C3XSpI.jpg');

/*!40000 ALTER TABLE `backgrounds` ENABLE KEYS */;
UNLOCK TABLES;


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
  `active` set('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'yes',
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
	(1,NULL,'Novinky',NULL,'novinky',1,'','2018-09-05 11:44:25','2018-10-06 20:43:13'),
	(3,NULL,'Muesli','icons/muesli.svg','muesli-original',3,'yes','2018-09-05 11:44:25','2018-09-12 08:17:08'),
	(4,NULL,'Morušový čaj','icons/morusovy-caj.svg','morusovy-caj',4,'yes','2018-09-05 11:44:25','2018-09-12 08:17:31'),
	(5,NULL,'Supersnack','icons/supersnack.svg','supersnack',5,'yes','2018-09-05 11:44:25','2018-09-12 08:17:50'),
	(6,NULL,'Sušené ovocie','icons/susene-ovocie.svg','susene-ovocie',6,'yes','2018-09-12 08:18:33','2018-09-12 08:18:33'),
	(7,NULL,'Orechy','icons/orechy.svg','orechy',7,'yes','2018-09-12 08:19:01','2018-09-12 08:19:01'),
	(8,NULL,'Vločky','icons/vlocky.svg','vlocky',8,'yes','2018-09-12 08:19:22','2018-09-12 08:19:22'),
	(9,NULL,'Semienka','icons/semienka.svg','semienka',9,'yes','2018-09-12 08:19:57','2018-09-12 08:19:57');

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
	(24,4,'parent_id','select_dropdown','Parent',0,0,0,0,0,0,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),
	(25,4,'order','text','Poradie',1,1,1,1,1,1,'{\"default\":1}',3),
	(26,4,'name','text','Názov kategórie',1,1,1,1,1,1,NULL,4),
	(27,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',5),
	(28,4,'created_at','timestamp','Dátum vytvorenia',0,0,1,0,0,0,NULL,6),
	(29,4,'updated_at','timestamp','Posledná úprava',0,0,0,0,0,0,NULL,7),
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
	(45,6,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(46,6,'author_id','text','Autor',1,0,0,0,0,0,NULL,2),
	(47,6,'title','text','Nadpis',1,1,1,1,1,1,NULL,3),
	(48,6,'excerpt','text_area','Upútavka',0,0,1,1,1,1,NULL,4),
	(49,6,'body','rich_text_box','Obsah',0,0,1,1,1,1,NULL,5),
	(50,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),
	(51,6,'meta_description','text','Popis pre vyhľadávače',0,0,1,1,1,1,NULL,7),
	(52,6,'meta_keywords','text','Kľúčové slová pre vyhľadávače',0,0,1,1,1,1,NULL,8),
	(53,6,'status','select_dropdown','Aktuálny stav',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"NEÁKTÍVNA\",\"ACTIVE\":\"AKTÍVNA\"}}',9),
	(54,6,'created_at','timestamp','Dátum vytvorenia',0,1,1,0,0,0,NULL,10),
	(55,6,'updated_at','timestamp','Posledná úprava',0,0,0,0,0,0,NULL,11),
	(56,6,'image','image','Ilustračné foto',0,1,1,1,1,1,NULL,12),
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
	(123,11,'illustration','image','Ilustračné foto',0,1,1,1,1,1,'{\"resize\":{\"width\":\"850\",\"height\":null},\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"crop\":{\"width\":\"850\",\"height\":\"400\"}},{\"name\":\"thumb\",\"crop\":{\"width\":\"140\",\"height\":\"110\"}}]}',6),
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
	(142,18,'active','radio_btn','Stav',0,0,1,1,1,1,'{\"yes\":\"Áno\",\"no\":\"Nie\",\"checked\":true}',9),
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
	(165,8,'order_belongsto_status_relationship','relationship','Stav objednávky',0,1,1,1,1,1,'{\"model\":\"App\\\\Status\",\"table\":\"statuses\",\"type\":\"belongsTo\",\"column\":\"status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',18),
	(166,19,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(167,19,'name','text','Názov pozadia',0,1,1,1,1,1,NULL,2),
	(168,19,'image','image','Pozadie (2560×790px)',0,0,1,1,1,1,NULL,3),
	(169,20,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(170,20,'title','text','Titulok',0,1,1,1,1,1,NULL,2),
	(171,20,'text','text','Text',0,1,1,1,1,1,NULL,3),
	(172,20,'image','image','Verzia pre mobil (na výšku)',0,1,1,1,1,1,NULL,4),
	(173,20,'background_id','text','Background Id',0,0,1,1,1,1,NULL,5),
	(174,20,'banner_belongsto_background_relationship','relationship','Pozadie',0,0,1,1,1,1,'{\"model\":\"App\\\\Background\",\"table\":\"backgrounds\",\"type\":\"belongsTo\",\"column\":\"background_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',6),
	(175,21,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(176,21,'background_id','text','Background Id',0,0,1,1,1,1,NULL,2),
	(177,21,'product_id','text','Product Id',0,1,1,1,1,1,NULL,3),
	(178,21,'order','text','Order',0,1,1,1,1,1,NULL,6),
	(179,21,'slideshow_belongsto_background_relationship','relationship','Pozadie',0,1,1,1,1,1,'{\"model\":\"App\\\\Background\",\"table\":\"backgrounds\",\"type\":\"belongsTo\",\"column\":\"background_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',4),
	(180,21,'slideshow_belongsto_product_relationship','relationship','Produkt',0,1,1,1,1,1,'{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',5),
	(181,4,'icon','image','Ikona',0,1,1,1,1,1,NULL,4),
	(182,4,'active','checkbox','Aktívna',0,0,1,1,1,1,'{\"yes\":\"Áno\",\"no\":\"Nie\",\"checked\":true}',7);

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
	(4,'categories','categories','kategóriu','Kategórie','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-05 11:44:24','2018-10-06 19:03:46'),
	(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy',NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-05 11:44:25','2018-09-12 07:59:06'),
	(6,'pages','pages','podstránku','Podstránky','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-05 11:44:25','2018-10-05 10:02:10'),
	(7,'products','products','Produkt','Produkty','voyager-bag','App\\Product',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-11 08:53:33','2018-10-04 10:50:47'),
	(8,'orders','orders','Objednávka','Objednávky','voyager-bag','App\\Order',NULL,NULL,NULL,1,0,'{\"order_column\":\"number\",\"order_display_column\":null}','2018-09-13 06:42:39','2018-09-13 07:24:36'),
	(9,'tags','tags','Tag','Tagy','voyager-wallet','App\\Tag',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-11 09:05:57','2018-09-11 09:11:04'),
	(11,'recepts','recepts','Recept','Recepty','voyager-lab','App\\Recept',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-11 09:24:57','2018-09-11 09:24:57'),
	(12,'attributes','attributes','Atribúty produktov','Attributes','','App\\Attribute',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-24 08:59:35','2018-09-24 08:59:35'),
	(13,'coupons','coupons','Kupón','Kupóny','voyager-dollar','App\\Coupon',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-24 09:10:18','2018-09-24 09:10:18'),
	(14,'clients','clients','Zákazník','Zákazníci','voyager-user','App\\Client',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-02 11:49:59','2018-10-02 11:49:59'),
	(15,'recept-tags','recept-tags','Tag','Tagy receptov',NULL,'App\\ReceptTag',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-02 21:13:49','2018-10-02 21:13:49'),
	(16,'newsletter','newsletter','Newsletter','Newsletters',NULL,'App\\Newsletter',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-03 07:36:33','2018-10-03 07:36:33'),
	(18,'stores','stores','Predajňa','Predajne',NULL,'App\\Store',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-03 08:28:42','2018-10-03 08:28:42'),
	(19,'backgrounds','backgrounds','Pozadie','Pozadia slideshow',NULL,'App\\Background',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-05 09:12:38','2018-10-05 09:12:38'),
	(20,'banners','banners','Banner','Bannery',NULL,'App\\Banner',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-10-05 09:20:26','2018-10-05 09:20:26'),
	(21,'slideshow','slideshow','Slideshow','Slideshow',NULL,'App\\Slideshow',NULL,NULL,NULL,1,0,'{\"order_column\":\"order\",\"order_display_column\":\"order\"}','2018-10-05 09:21:57','2018-10-05 09:23:40');

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
	(2,1,'Médiá','','_self','voyager-images','#000000',5,7,'2018-09-05 11:44:22','2018-10-05 09:45:37','voyager.media.index','null'),
	(5,1,'Nástroje','','_self','voyager-tools','#000000',NULL,12,'2018-09-05 11:44:22','2018-10-05 09:34:25',NULL,''),
	(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2018-09-05 11:44:22','2018-10-05 09:27:07','voyager.menus.index',NULL),
	(7,1,'Database','','_self','voyager-data',NULL,5,2,'2018-09-05 11:44:22','2018-10-05 09:27:07','voyager.database.index',NULL),
	(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2018-09-05 11:44:22','2018-10-05 09:27:07','voyager.compass.index',NULL),
	(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2018-09-05 11:44:22','2018-10-05 09:27:07','voyager.bread.index',NULL),
	(10,1,'Nastavenia','','_self','voyager-settings','#000000',NULL,11,'2018-09-05 11:44:22','2018-10-05 09:34:31','voyager.settings.index','null'),
	(11,1,'Kategórie','','_self','voyager-categories','#000000',NULL,7,'2018-09-05 11:44:24','2018-10-05 09:05:54','voyager.categories.index','null'),
	(13,1,'Podstránky','','_self','voyager-file-text','#000000',NULL,5,'2018-09-05 11:44:25','2018-10-05 09:05:37','voyager.pages.index','null'),
	(15,1,'Produkty','/admin/products?order_by=code&sort_order=asc','_self','voyager-bag','#000000',NULL,3,'2018-09-11 08:49:17','2018-10-05 09:05:46',NULL,''),
	(18,1,'Tagy produktov','','_self',NULL,'#000000',36,1,'2018-09-11 09:05:57','2018-10-05 09:37:09','voyager.tags.index','null'),
	(20,1,'Recepty','','_self','voyager-lab',NULL,NULL,4,'2018-09-11 09:24:57','2018-10-05 09:05:37','voyager.recepts.index',NULL),
	(21,1,'Užívatelia','','_self','voyager-person','#000000',5,5,'2018-09-11 11:30:56','2018-10-05 09:34:01','voyager.users.index','null'),
	(22,1,'Privilégiá','','_self','voyager-lock','#000000',5,6,'2018-09-11 11:30:56','2018-10-05 09:34:01','voyager.roles.index','null'),
	(25,1,'Atribúty produktov','','_self',NULL,'#000000',36,2,'2018-09-24 08:59:36','2018-10-05 09:37:22','voyager.attributes.index','null'),
	(26,1,'Kupóny','','_self','voyager-dollar',NULL,NULL,6,'2018-09-24 09:10:19','2018-10-05 09:05:51','voyager.coupons.index',NULL),
	(27,1,'Zákazníci','','_self','voyager-person','#000000',NULL,10,'2018-10-02 11:49:59','2018-10-05 09:34:31','voyager.clients.index','null'),
	(28,1,'Tagy receptov','','_self',NULL,NULL,36,3,'2018-10-02 21:13:49','2018-10-05 09:34:04','voyager.recept-tags.index',NULL),
	(29,1,'Newsletter','','_self','voyager-envelope','#000000',NULL,9,'2018-10-03 07:36:33','2018-10-05 09:53:41','voyager.newsletter.index','null'),
	(30,1,'Predajne','','_self','voyager-home','#000000',NULL,8,'2018-10-03 08:28:43','2018-10-05 09:50:23','voyager.stores.index','null'),
	(31,1,'Objednávky','','_self','voyager-bag','#000000',NULL,2,'2018-09-13 06:42:40','2018-10-05 09:05:46','voyager.orders.index','null'),
	(32,1,'Pozadia','','_self',NULL,'#000000',35,3,'2018-10-05 09:12:38','2018-10-05 09:35:04','voyager.backgrounds.index','null'),
	(33,1,'Bannery','','_self',NULL,NULL,35,1,'2018-10-05 09:20:26','2018-10-05 09:34:15','voyager.banners.index',NULL),
	(34,1,'Slideshow','','_self',NULL,NULL,35,2,'2018-10-05 09:21:57','2018-10-05 09:34:15','voyager.slideshow.index',NULL),
	(35,1,'Slideshow','','_self',NULL,'#000000',NULL,14,'2018-10-05 09:28:20','2018-10-05 09:34:25',NULL,''),
	(36,1,'Tagy a atribúty','','_self','voyager-tag','#000000',NULL,13,'2018-10-05 09:33:44','2018-10-05 09:37:15',NULL,'');

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
	(1,2),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(5,2),
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
	(16,2),
	(17,1),
	(17,2),
	(18,1),
	(18,2),
	(19,1),
	(19,2),
	(20,1),
	(20,2),
	(21,1),
	(21,2),
	(22,1),
	(22,2),
	(23,1),
	(23,2),
	(24,1),
	(24,2),
	(25,1),
	(25,2),
	(26,1),
	(26,2),
	(27,1),
	(27,2),
	(28,1),
	(28,2),
	(29,1),
	(29,2),
	(30,1),
	(30,2),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(36,2),
	(37,1),
	(37,2),
	(38,1),
	(38,2),
	(39,1),
	(39,2),
	(40,1),
	(40,2),
	(41,1),
	(42,1),
	(42,2),
	(43,1),
	(43,2),
	(44,1),
	(44,2),
	(45,1),
	(45,2),
	(46,1),
	(46,2),
	(47,1),
	(47,2),
	(48,1),
	(48,2),
	(49,1),
	(49,2),
	(50,1),
	(50,2),
	(51,1),
	(51,2),
	(52,1),
	(52,2),
	(53,1),
	(53,2),
	(54,1),
	(54,2),
	(55,1),
	(55,2),
	(56,1),
	(56,2),
	(57,1),
	(57,2),
	(58,1),
	(58,2),
	(59,1),
	(59,2),
	(60,1),
	(60,2),
	(61,1),
	(61,2),
	(62,1),
	(62,2),
	(63,1),
	(63,2),
	(64,1),
	(64,2),
	(65,1),
	(65,2),
	(66,1),
	(66,2),
	(67,1),
	(67,2),
	(68,1),
	(68,2),
	(69,1),
	(69,2),
	(70,1),
	(70,2),
	(71,1),
	(71,2),
	(72,1),
	(72,2),
	(73,1),
	(73,2),
	(74,1),
	(74,2),
	(75,1),
	(75,2),
	(76,1),
	(76,2),
	(77,1),
	(77,2),
	(78,1),
	(78,2),
	(79,1),
	(79,2),
	(80,1),
	(80,2),
	(81,1),
	(81,2),
	(82,1),
	(82,2),
	(83,1),
	(83,2),
	(84,1),
	(84,2),
	(85,1),
	(85,2),
	(86,1),
	(86,2),
	(87,1),
	(87,2),
	(88,1),
	(88,2),
	(92,1),
	(92,2),
	(93,1),
	(93,2),
	(94,1),
	(94,2),
	(95,1),
	(95,2),
	(96,1),
	(96,2),
	(97,1),
	(97,2),
	(98,1),
	(98,2),
	(99,1),
	(99,2),
	(100,1),
	(100,2),
	(101,1),
	(101,2),
	(102,1),
	(102,2),
	(103,1),
	(103,2),
	(104,1),
	(104,2),
	(105,1),
	(105,2),
	(106,1),
	(106,2);

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
	(91,'delete_orders','orders','2018-09-13 06:42:39','2018-09-13 06:42:39'),
	(92,'browse_backgrounds','backgrounds','2018-10-05 09:12:38','2018-10-05 09:12:38'),
	(93,'read_backgrounds','backgrounds','2018-10-05 09:12:38','2018-10-05 09:12:38'),
	(94,'edit_backgrounds','backgrounds','2018-10-05 09:12:38','2018-10-05 09:12:38'),
	(95,'add_backgrounds','backgrounds','2018-10-05 09:12:38','2018-10-05 09:12:38'),
	(96,'delete_backgrounds','backgrounds','2018-10-05 09:12:38','2018-10-05 09:12:38'),
	(97,'browse_banners','banners','2018-10-05 09:20:26','2018-10-05 09:20:26'),
	(98,'read_banners','banners','2018-10-05 09:20:26','2018-10-05 09:20:26'),
	(99,'edit_banners','banners','2018-10-05 09:20:26','2018-10-05 09:20:26'),
	(100,'add_banners','banners','2018-10-05 09:20:26','2018-10-05 09:20:26'),
	(101,'delete_banners','banners','2018-10-05 09:20:26','2018-10-05 09:20:26'),
	(102,'browse_slideshow','slideshow','2018-10-05 09:21:57','2018-10-05 09:21:57'),
	(103,'read_slideshow','slideshow','2018-10-05 09:21:57','2018-10-05 09:21:57'),
	(104,'edit_slideshow','slideshow','2018-10-05 09:21:57','2018-10-05 09:21:57'),
	(105,'add_slideshow','slideshow','2018-10-05 09:21:57','2018-10-05 09:21:57'),
	(106,'delete_slideshow','slideshow','2018-10-05 09:21:57','2018-10-05 09:21:57');

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
	(1,3),
	(8,3),
	(1,1);

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
	(15,1),
	(18,1),
	(23,1),
	(23,2),
	(28,1),
	(28,2),
	(33,1),
	(33,2),
	(38,1),
	(38,2),
	(44,1),
	(44,2),
	(49,1),
	(49,2),
	(54,1),
	(54,2),
	(55,1),
	(55,2),
	(56,1),
	(56,2),
	(57,1),
	(57,2),
	(58,1),
	(58,2),
	(59,1),
	(59,2),
	(60,1),
	(60,2),
	(61,1),
	(61,2),
	(62,1),
	(62,2),
	(63,1),
	(63,2);

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
  `active` set('yes','no','NA') DEFAULT 'yes',
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
	(17,15,NULL,0,'SDF-3',16.49,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,3,'0','yes',NULL,NULL),
	(18,0,'Bio Marhule',6,'MAR-1',12.99,NULL,'1kg','<p><strong>100% Bio Marhule bez k&ocirc;stky, cel&eacute; - Raw. Krajina p&ocirc;vodu: Turecko</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda. Raw kvalita.</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov. Nes&iacute;ren&eacute;.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> V&yacute;razn&eacute;, veľk&eacute;, sladk&eacute;, &scaron;ťavnat&eacute; a chutn&eacute;.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Skvel&eacute; ako snack, do muesli, jogurtov alebo varenia a pečenia.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> V&yacute;born&yacute; zdroj vl&aacute;kniny, antioxodantov a magn&eacute;zia.<br /> <br /> Potenci&aacute;lna kry&scaron;taliz&aacute;cia cukru na povrchu marh&uacute;ľ nie je z&aacute;vadou, je to ich prirodzen&aacute; vlastnosť. M&ocirc;že sa stať, že bud&uacute; obsahovať k&uacute;sky &scaron;krup&iacute;n.</p>',NULL,'<p><img src=\"http://localhost:8888/storage/products/October2018/nutri_marhule.png\" alt=\"\" width=\"371\" height=\"256\" /></p>','products/October2018/e8w0JpuRZzcjLbVKFQ4r.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(19,18,'',0,'MAR-2',10.49,NULL,'750g',NULL,NULL,NULL,NULL,NULL,NULL,2,'0','yes',NULL,NULL),
	(20,18,'',0,'MAR-3',7.49,NULL,'500g',NULL,NULL,NULL,NULL,NULL,NULL,3,'0','yes',NULL,NULL),
	(21,18,'',0,'MAR-4',3.99,NULL,'250g',NULL,NULL,NULL,NULL,NULL,NULL,4,'0','yes',NULL,NULL),
	(22,18,'',0,'MAR-5',2.49,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,5,'0','yes',NULL,NULL),
	(23,0,'Bio Physalis',6,'POI-1',29.19,NULL,'1kg','<p><strong>100% Premium Bio Machovka peru&aacute;nska RAW - (physalis peruviana). P&ocirc;vod Peru.</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /><strong>&nbsp;Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /><strong>&nbsp;Premiov&aacute; trieda</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Raw kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> m&auml;kk&eacute; na slnku su&scaron;en&eacute; ovocie<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> stredne sladk&eacute;, citusovo kyslast&eacute;<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> zdroj vitam&iacute;nu C<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> bez obsahu konzervantov a bez in&yacute;ch pridan&yacute;ch l&aacute;tok.</p>\r\n<p>S&uacute; zn&aacute;me tiež ako Inca Berry alebo Golden Berry. Mal&eacute; oranžovo sfarben&eacute; ovocie s hladkou kožičkou, naplnen&eacute; semiačkami a &scaron;ťavnat&eacute; s kyslo-sladkou chuťou. Veľmi dobre vyv&aacute;žen&aacute; chuť. Ovocie z najvy&scaron;&scaron;&iacute;m podielom vl&aacute;kniny. Veľmi &scaron;ťavnat&eacute; a m&auml;kk&eacute;.</p>',NULL,NULL,'products/October2018/hKolQRATSHW7TzzGLVqG.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(24,23,'',0,'POI-2',22.99,NULL,'750g',NULL,NULL,NULL,NULL,NULL,NULL,2,'0','yes',NULL,NULL),
	(25,23,'',0,'POI-3',16.19,NULL,'500g',NULL,NULL,NULL,NULL,NULL,NULL,3,'0','yes',NULL,NULL),
	(26,23,'',0,'POI-4',8.69,NULL,'250g',NULL,NULL,NULL,NULL,NULL,NULL,4,'0','yes',NULL,NULL),
	(27,23,'',0,'POI-5',5.59,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,5,'0','yes',NULL,NULL),
	(28,0,'Bio Moruša biela',6,'BIOMOR-1',20.99,NULL,'1kg','<p><strong>100% Premium Bio Moru&scaron;a biela RAW - (morus alba). P&ocirc;vod Uzbekistan.</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /><strong>&nbsp;Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /><strong>&nbsp;Pr&eacute;miov&aacute; trieda</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /><strong>&nbsp;Raw kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> M&auml;kk&eacute; a &scaron;ťavnat&eacute; medovej chuti<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Pr&iacute;rodzen&yacute; zdroj vitam&iacute;nu C<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bohat&yacute; zdroj železa<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&eacute;ho cukru, žiadne konzervanty<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Zvyčajne ako niečo pod zub, alebo pr&iacute;davok do muesli<br /> &nbsp;</p>\r\n<p>Veľk&eacute; a cel&eacute; plody medovo sladk&eacute;. Pomaly su&scaron;en&eacute; na slnku. Plody moru&scaron;e s&uacute; v&yacute;born&aacute; chuťovka vďaka ich sladkosti a medovej ar&oacute;me. Plody s&uacute; mnohostran&yacute; pomocn&iacute;k v liečiteľstve. Plody moru&scaron;e obsahuj&uacute; vysok&yacute; podiel železa, ktor&eacute; je hlavnou &uacute;činnou l&aacute;tkou&nbsp; pri liečbe an&eacute;mie - chudokrvnosť. Nie je v&ocirc;bec bežn&eacute;, aby nejak&eacute; ovocn&eacute; plody obsahovali toľko železa. Tento podiel železa v plodoch moru&scaron;e sa d&aacute; porovnať s podielom železa v hov&auml;dzom m&auml;se. Okrem železa je moru&scaron;a vysoko cenen&aacute; pre obsah vitam&iacute;nu C. Ďal&scaron;ou l&aacute;tkou, ktor&aacute; je v&yacute;znamn&aacute; v dobe civilizačn&yacute;ch ochoren&iacute; je resveratrol. Mnoh&eacute; vedeck&eacute; &scaron;t&uacute;die preuk&aacute;zali, že resveratrol je &uacute;činn&yacute; v boji s rakovinou prsn&iacute;ka, pľ&uacute;c a rakoviny prostaty. Resveratrol obsahuj&uacute; plody moru&scaron;e čiernej.&nbsp; O listoch moru&scaron;e sme si už p&iacute;sali tiež.</p>',NULL,'<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_morusa.png\" width=\"350\" height=\"242\" /></p>','products/October2018/bhvpcyTFCDhpwFQk7hzE.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(29,28,'',0,'BIOMOR-2',16.49,NULL,'750g',NULL,NULL,NULL,NULL,NULL,NULL,2,'0','yes',NULL,NULL),
	(30,28,'',0,'BIOMOR-3',11.99,NULL,'500g',NULL,NULL,NULL,NULL,NULL,NULL,3,'0','yes',NULL,NULL),
	(31,28,'',0,'BIOMOR-4',6.49,NULL,'250g',NULL,NULL,NULL,NULL,NULL,NULL,4,'0','yes',NULL,NULL),
	(32,28,'',0,'BIOMOR-5',2.99,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,5,'0','yes',NULL,NULL),
	(33,0,'Bio Hrozienka - Sultánky',6,'SULTAN-1',8.99,NULL,'1kg','<p><strong>100% Bio Hrozienka - Sult&aacute;nky RAW . NOVINKA!!! -Hrozienka nie s&uacute; olejovan&eacute;. Bez obsahu slnečnicov&eacute;ho oleja. P&ocirc;vod Uzbekistan</strong>.</p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /><strong>&nbsp;Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /><strong>&nbsp;Premiov&aacute; trieda</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /><strong>&nbsp;Raw kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Zlatohned&eacute;, stredne veľk&eacute; bio sult&aacute;nky. M&auml;sit&eacute; &scaron;ťavnat&eacute;. Nie s&uacute; presu&scaron;en&eacute;.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Perfektn&eacute; ako desiata, na varenie a pečenie<span style=\"font-size: small;\">.</span></p>\r\n<p>Na&scaron;e sult&aacute;nky je možn&eacute; vyjedať priamo z vrecka, alebo ich pridajte do pečenia či varenia. &Scaron;etrn&yacute;m pomal&yacute;m su&scaron;en&iacute;m z&iacute;skali jedinečn&uacute; &scaron;ťavnatosť. Plody s&uacute; pln&eacute; skoro guľat&eacute; pln&eacute; medovo sladkej &scaron;ťavy. Existuje veľa receptov, ktor&eacute; volaj&uacute; po sult&aacute;nkach ako napr&iacute;klad&nbsp; couscous alebo viacero marock&yacute;ch receptov na dusen&eacute; m&auml;so.</p>','<p>Novinkou je, že sult&aacute;nky už nie su olejovan&eacute;. Preto s&uacute; vhodn&eacute; aj pre t&iacute;ch z v&aacute;s s&nbsp;histam&iacute;novou intoleranciou.</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_sultanky.png\" alt=\"\" width=\"350\" /></p>','products/October2018/RIzbZrwVRoKtV7ZJWOek.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(34,33,'',0,'SULTAN-2',6.99,NULL,'750g',NULL,NULL,NULL,NULL,NULL,NULL,2,'0','yes',NULL,NULL),
	(35,33,'',0,'SULTAN-3',5.09,NULL,'500g',NULL,NULL,NULL,NULL,NULL,NULL,3,'0','yes',NULL,NULL),
	(36,33,'',0,'SULTAN-4',2.99,NULL,'250g',NULL,NULL,NULL,NULL,NULL,NULL,4,'0','yes',NULL,NULL),
	(37,33,'',0,'SULTAN-5',1.99,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,5,'0','yes',NULL,NULL),
	(38,0,'Bio Brusnice',6,'BIOBRUS-1',55.99,NULL,'3kg','<p><strong>100% Premium Bio Brusnice z Kanady, sladen&eacute; s bio jablkovou &scaron;ťavou + slnečnicov&yacute; olej 1%. </strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Bez konzervantov a bez chemickej &uacute;pravy</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Super &scaron;ťavnat&eacute;<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Pestovan&eacute; organick&yacute;m sp&ocirc;sobom<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Nedosl&aacute;dzan&eacute; bielym alebo trstinov&yacute;m cukrom, ale bio jablkovou &scaron;ťavou<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Vhodn&eacute; na priamy konzum, pečenie alebo varenie</p>','<p>Tieto ekologicky pestovan&eacute; brusnice s&uacute; excelentn&eacute; v pr&eacute;miovej kvalite. Sladen&eacute; s&uacute; len jablkovou &scaron;ťavou, ktor&aacute; ma niž&scaron;&iacute; GI. Vďaka organick&eacute;mu sp&ocirc;sobu pestovania a &scaron;etrn&eacute;mu su&scaron;eniu s&uacute; pocitovo&nbsp; jemne sladk&eacute;, s charakteristick&yacute;m kyselkav&yacute;m podt&oacute;nom jablkovej &scaron;tavy. V&yacute;borne sa hodia ako ingrediencia do r&ocirc;znych receptov alebo na pr&iacute;pravu muesli. Ich chuť sa pr&iacute;jemne vyv&aacute;ži v spojen&iacute; s orechmi alebo r&ocirc;znymi semienkami a jadierkami. Hodia sa do raňajkov&yacute;ch cere&aacute;lnych zmes&iacute; alebo do tzv. trail mixov, čo s&uacute; zmesi r&ocirc;zneho su&scaron;en&eacute;ho ovocia a orechov - ide&aacute;lne na dni naplnen&eacute; akt&iacute;vnym pohybom vonku v pr&iacute;rode - ako zdroj r&yacute;chlej energie, vitam&iacute;nov a miner&aacute;lov. Častokr&aacute;t sa použ&iacute;vaj&uacute; ako n&aacute;hrada hrozienok. Ide&aacute;lne s&uacute; do om&aacute;čok k m&auml;su, obzvl&aacute;sť z diviny. S&uacute; z nich skvel&eacute; mufiny (samozrejme z celozrnnej m&uacute;ky).</p>\r\n<p>Brusnice s&uacute; často už&iacute;van&eacute; so z&aacute;merom prevencie r&ocirc;znych chor&ocirc;b, najzn&aacute;mej&scaron;ie ako napr&iacute;klad z&aacute;pal močov&yacute;ch ciest alebo ochorenia prostaty, obzvl&aacute;&scaron;ť pokiaľ sa opakuj&uacute;. Zmienky o brusniciach a ich prevent&iacute;vnych alebo liečiv&yacute;ch &uacute;činkoch často n&aacute;jdete v diskusn&yacute;ch f&oacute;rach. S&uacute; tak isto hlavnou zložkou množstva liečiv&yacute;ch pr&iacute;pravkov a liekov pre ich blahodarn&eacute; &uacute;činky. Fytochemick&eacute; l&aacute;tky obsiahnut&eacute; v brusniciach maj&uacute; v&scaron;ak aj množstvo in&yacute;ch benefitov pre zdravie:</p>\r\n<p><strong>10 benefitov pre zdravie:</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> pom&aacute;ha pri z&aacute;paloch močov&yacute;ch ciest<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> &uacute;činn&eacute; pri probl&eacute;moch s ľadvinami, predch&aacute;dza tvorbe kameňov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> pln&eacute; vitam&iacute;nov, hlavne vitam&iacute;n C<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> vysok&yacute; obsah železa a v&aacute;pnika<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> znižuje cholesterol<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> ako prevencia rakoviny, hlavne prostaty<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> ako prevencia dent&aacute;lnych prob&eacute;mov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> podporuj&uacute; ment&aacute;lne zdravie<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> zlep&scaron;uj&uacute; kond&iacute;ciu pokožky<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> bohat&eacute; na antioxidanty<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> dobr&eacute; pre respiračn&yacute; syst&eacute;m</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutri_brusnice.png\" alt=\"\" width=\"350\" /></p>','products/October2018/oC50TTDMiJocBUGG6lWh.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(39,38,'',0,'BIOBRUS-2',20.99,NULL,'1kg',NULL,NULL,NULL,NULL,NULL,NULL,2,'0','yes',NULL,NULL),
	(40,38,'',0,'BIOBRUS-3',16.49,NULL,'750g',NULL,NULL,NULL,NULL,NULL,NULL,3,'0','yes',NULL,NULL),
	(41,38,'',0,'BIOBRUS-4',11.99,NULL,'500g',NULL,NULL,NULL,NULL,NULL,NULL,4,'0','yes',NULL,NULL),
	(42,38,'',0,'BIOBRUS-5',6.49,NULL,'250g',NULL,NULL,NULL,NULL,NULL,NULL,5,'0','yes',NULL,NULL),
	(43,38,'',0,'BIOBRUS-6',2.99,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,6,'0','yes',NULL,NULL),
	(44,0,'Bio Mango',6,'MANGO-1',25.49,NULL,'1kg','<h3>NOV&Aacute; &Uacute;RODA 2017!!!&nbsp; Vydaren&aacute;, veľmi &scaron;ťavnat&eacute; k&uacute;sky, sladk&eacute; :-)</h3>\r\n<p><strong>100% Bio Mango Raw - k&uacute;sky extra m&auml;kk&eacute; a &scaron;ťavnat&eacute;. P&ocirc;vod India.</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Raw kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> v&yacute;born&eacute; pre deti ako odmena namiesto cukr&iacute;kov</p>','<p>Tieto k&uacute;sky manga s&uacute; bez pridan&eacute;ho cukru a bez ak&yacute;chkoľvek pridan&yacute;ch l&aacute;tok a taktiež bez konzervantov. Pri ich pestovan&iacute; neboli použit&eacute; žiadne umel&eacute; hnojiv&aacute; ani pestic&iacute;dy. Každy sto gramov&yacute; bal&iacute;ček su&scaron;en&eacute;ho ovocia obsahuje 3 su&scaron;en&eacute; plody narezan&eacute; na 2-3 cm k&uacute;sky manga. Určen&eacute; na priamu konzum&aacute;ciu ako snack alebo desiata, alebo je ho možn&eacute; použiť do r&ocirc;znych receptov vo va&scaron;ej kuchyni pri varen&iacute; orient&aacute;lnej kuchyne alebo tiež prid&aacute;vať do muesli. Pr&eacute;miov&aacute; Bio kvalita na slnku su&scaron;en&eacute;ho ovocia spĺňa podmienky pre skupinu stravn&iacute;kov uprednostňuj&uacute;cich RAW potraviny.</p>\r\n<p>K&uacute;sky manga s&uacute; veľk&eacute; 2-3 cm s&uacute; extr&eacute;mne &scaron;ťavnat&eacute; a m&auml;kk&eacute;, čo z nich rob&iacute; ide&aacute;lne dodanie energie a uspokojenie det&iacute; ako mňamka namiesto sladkost&iacute;. Tiež sa ide&aacute;lne hodia ako snack, alebo sladk&aacute; bodka dňa poobede alebo za večerou.</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_mango.png\" alt=\"\" width=\"350\" /></p>','products/October2018/VOklGcQUAA2o8t0QocIf.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(45,44,'',0,'MANGO-2',19.99,NULL,'750g',NULL,NULL,NULL,NULL,NULL,NULL,2,'0','yes',NULL,NULL),
	(46,44,'',0,'MANGO-3',14.19,NULL,'500g',NULL,NULL,NULL,NULL,NULL,NULL,3,'0','yes',NULL,NULL),
	(47,44,'',0,'MANGO-4',7.59,NULL,'250g',NULL,NULL,NULL,NULL,NULL,NULL,4,'0','yes',NULL,NULL),
	(48,44,'',0,'MANGO-5',3.59,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,5,'0','yes',NULL,NULL),
	(49,0,'Bio Mini figy',6,'BIOFIGY-1',19.99,NULL,'1kg','<p><strong>100% Premium Bio Mini figy Raw. Ekologick&eacute; pestovanie v Ir&aacute;ne.</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Raw kvalita na slnku su&scaron;en&eacute;</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> V&yacute;born&eacute; pre deti ako odmena namiesto cukr&iacute;kov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Použitie ako sladk&yacute; snack bohat&yacute; na vl&aacute;kninu</p>\r\n<p><strong>Čerstv&eacute; figy</strong> obsahuj&uacute; stopov&eacute; množstv&aacute; niekoľk&yacute;ch d&ocirc;ležit&yacute;ch živ&iacute;n, ale prim&aacute;rnou hodnotou je množstvo vl&aacute;kniny, drasl&iacute;ka a ľahko dostupnej energie, ktor&uacute; poskytuj&uacute;.<br /> Figy su excelentn&yacute; zdroj energie, ktor&aacute; poch&aacute;dza z cukru. Je to jednoduch&yacute; cukor, ktor&yacute; je ich prirodzenou s&uacute;časťou, av&scaron;ak vďaka veľk&eacute;mu množstvu pr&iacute;tomnej vl&aacute;kniny je tento cukor uvolňovan&yacute; postupne v mal&yacute;ch bal&iacute;čkoch, č&iacute;m pom&aacute;ha k pomal&eacute;mu d&aacute;vkovaniu do krvi.<br /><br /> <strong>Su&scaron;en&eacute; figy </strong>- viac ako 60% obsiahnutej vody sa pri vys&uacute;&scaron;an&iacute; odparuje na slnku. V&yacute;sledkom je, že su&scaron;en&eacute; figy su koncentrovan&yacute;m zdrojom vl&aacute;kniny, živ&iacute;n a energie ako ich čerstv&yacute; variant. Približne dev&auml;ť su&scaron;en&yacute;ch f&iacute;g v&aacute;m dod&aacute; okolo 190 kal&oacute;ri&iacute;, asi 2,5g prote&iacute;nov, menej ako 1g tuku, a 48g uhľohydr&aacute;tov.<br /> T&yacute;ch ist&yacute;ch dev&auml;ť su&scaron;en&yacute;ch f&iacute;g poskytne približne 29% dennej d&aacute;vky vl&aacute;kniny, 14 percent dennej potrebnej d&aacute;vky vitam&iacute;nu K a tiež tak isto drasl&iacute;ka, po 12 percent dennej hodnoty magn&eacute;zia a v&aacute;pnika, a 8 percent dennej d&aacute;vky železa.</p>','<p>Tieto figy maj&uacute; pr&iacute;jemne žuvačkov&yacute; charakter so sladk&yacute;m b&aacute;ječn&yacute;m vn&uacute;trom. Pestovan&eacute; organick&yacute;m sp&ocirc;sobom, ktor&yacute; v žiadnom pr&iacute;pade neprip&uacute;&scaron;ťa umel&eacute; hnojiv&aacute; alebo konzervanty. Nie su presladen&eacute;.</p>\r\n<p>Baby figy su pripraven&eacute; na priame vyjedanie z vrecka. Nelepia sa. Maj&uacute; hladk&uacute; such&uacute; kožu. Zabezpečia r&yacute;chly pr&iacute;sun energie s vysok&yacute;m podielom vl&aacute;kniny. Jesť sa m&ocirc;žu bez &uacute;pravy, alebo sa m&ocirc;žu e&scaron;te nasekať na drobnej&scaron;ie a vhodiť do va&scaron;ich cere&aacute;lnych raňajok - vločiek, alebo ako s&uacute;časť va&scaron;ich receptov na kol&aacute;če. Ak Vy alebo Va&scaron;e zuby preferuj&uacute; m&auml;kk&scaron;ie figy, je možn&eacute; ich namočiť vo vode na niekoľko min&uacute;t aby ich pokožka zm&auml;kla.</p>\r\n<p>10 benefitov pre zdravie:<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> &uacute;činn&eacute; laxat&iacute;vum<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> znižuj&uacute; krvn&yacute; tlak<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> bohat&eacute; na antioxidanty<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> obsahuj&uacute; \"pomal&yacute;\" cukor vhodn&yacute; pre diabetikov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> ako prevencii rakoviny<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> zlep&scaron;uj&uacute; vitalitu<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> priemern&eacute; GI su&scaron;en&yacute;ch f&iacute;g je 61<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> pom&aacute;haj&uacute; anemikom<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> maj&uacute; vysok&yacute; obsah v&aacute;pnika a drasl&iacute;ka<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> pre zdrav&eacute; srdce<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> čistia telo od tox&iacute;nov</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_mini-figy.png\" alt=\"\" width=\"350\" /></p>','products/October2018/d5oyAFQ2zT1Q2fiwJKM0.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(50,49,'',0,'BIOFIGY-2',15.49,NULL,'750g',NULL,NULL,NULL,NULL,NULL,NULL,2,'0','yes',NULL,NULL),
	(51,49,'',0,'BIOFIGY-3',10.99,NULL,'500g',NULL,NULL,NULL,NULL,NULL,NULL,3,'0','yes',NULL,NULL),
	(52,49,'',0,'BIOFIGY-4',5.99,NULL,'250g',NULL,NULL,NULL,NULL,NULL,NULL,4,'0','yes',NULL,NULL),
	(53,49,'',0,'BIOFIGY-5',3.99,NULL,'150g',NULL,NULL,NULL,NULL,NULL,NULL,5,'0','yes',NULL,NULL),
	(54,0,'Bio Jablkové krúžky',6,'JABLKR-1',16.99,NULL,'1kg','<p><strong>100% Premium Bio Jablkov&eacute; kr&uacute;žky. Krajina p&ocirc;vodu - Bulharsko</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Použitie ako snack bohat&yacute; na vl&aacute;kninu<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> M&auml;kk&eacute; a &scaron;ťavnat&eacute; kr&uacute;žky<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Pln&aacute; sladk jablkov&aacute; chuť<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Ľahko sa trhaj&uacute; preto s&uacute; ide&aacute;lne pre deti, ktor&eacute; ich bud&uacute; milovať</p>','<p>Su&scaron;en&eacute; jablk&aacute; s&uacute; zdravou potravinou poskytuj&uacute;cou dobr&yacute; zdroj karbohydr&aacute;tov a vl&aacute;kniny. Obsahuj&uacute; veľmi m&aacute;lo tuku a absol&uacute;tne žiaden cholesterol. Jablk&aacute; s&uacute; v&yacute;born&yacute; zdroj fytochemik&aacute;li&iacute;, ako s&uacute; flavonoidy a fenolov&eacute; zl&uacute;čeniny vr&aacute;tane quercetinu, epicatechinu (&uacute;činn&aacute; l&aacute;tka v boji s mŕtvicou, podľa niektor&yacute;ch vedcou &uacute;činnej&scaron;ia ako s&uacute;časn&eacute; lieky), a procyanidinu. Tento typ antioxidantu pom&aacute;ha chr&aacute;niť proti niektor&yacute;m typom rakoviny a srdcov&yacute;m ochoreniam t&yacute;m, že zabraňuje po&scaron;kodeniu buniek voľn&yacute;mi radik&aacute;lmi.</p>\r\n<p>Na&scaron;e jablk&aacute; v&aacute;m prines&uacute; chuťov&yacute; z&aacute;žitok ak&yacute; ste možno pri su&scaron;en&yacute;ch jablk&aacute;ch e&scaron;te nezažili. Tieto su&scaron;en&eacute; jablkov&eacute; kr&uacute;žky nie je potrebn&eacute; pred konzum&aacute;ciou nam&aacute;čať. S&uacute; určen&eacute; na priamy konzum, napr&iacute;klad nakr&aacute;jať do jogurtu alebo muesli, tiež je možn&eacute; ich použiť do varenia, kde pridaj&uacute; typicky sladk&uacute; jablkov&uacute; chuť pokrmu. Av&scaron;ak na pr&iacute;pravu jablkov&eacute;ho kol&aacute;ča alebo čatn&iacute; je dobr&eacute; ich namočiť do vody.</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_jablka.png\" alt=\"\" width=\"350\" /></p>','products/October2018/jEEQHi0UasNcJQuhOvEX.png','[\"products\\/October2018\\/1pyh18AIYcSXN8NNYVU5.png\"]',NULL,1,'0','yes',NULL,NULL),
	(55,0,'Bio Kryštalizovaný zázvor',6,'ZAZVOR-1',24.49,NULL,'1kg','<p><strong>100% Premium Kry&scaron;talizovan&yacute; z&aacute;zvor, kocky 8-16 mm, (bio z&aacute;zvor, bio trstinov&yacute; cukor). P&ocirc;vod Fidži.</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Bio kvalita poch&aacute;dzaj&uacute;ca z absol&uacute;tne čistej, priemyslom neznečistenej a panenskej pr&iacute;rody tropick&eacute;ho ostrova Fidži</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda, ten najkvalitne&scaron;&iacute; z&aacute;zvor, ak&yacute; m&ocirc;žete ochutnať</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Fairtrade a ručn&eacute; spracovanie<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> M&auml;kk&eacute;, &scaron;ťavnat&eacute; a jemn&eacute; k&uacute;sky ide&aacute;lnej veľkosti<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Typick&aacute; siln&aacute; chuť a ar&oacute;ma</p>','<p>Z&aacute;zvor je univerz&aacute;lnou potravinou, jedn&yacute;m z naj&uacute;činnej&scaron;&iacute;ch darov pr&iacute;rody na r&ocirc;zne zdravotn&eacute; neduhy a je skvel&yacute;m zdrojom pre obnovenie vitality.<br /><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> P&ocirc;sob&iacute; protiz&aacute;palovo a utlmuje bolesť<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Stimuluje krvn&yacute; obeh a zahrieva<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Je dobr&yacute;m pr&iacute;rodn&yacute;m liekom pri nachladnut&iacute;<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> M&aacute; antibakteri&aacute;lne &uacute;činky<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Redukuje plynatosť čriev</p>\r\n<p>Kry&scaron;talizovan&eacute; kocky z&aacute;zvoru m&ocirc;žete pridať do Va&scaron;ich r&ocirc;znych kulin&aacute;rskych v&yacute;tvorov - od b&aacute;bovky až po z&aacute;zvorn&iacute;ky. Alebo len tak do jogurtu, raňajkov&yacute;ch cere&aacute;li&iacute; alebo vhoďte zop&aacute;r kociek do čaju. Pre t&yacute;ch odv&aacute;žnej&scaron;&iacute;ch s&uacute; samotn&eacute; k&uacute;sky v&yacute;born&yacute; snack. Obsahuje trstinov&yacute; cukor (20%).</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_zazvor.png\" alt=\"\" width=\"350\" /></p>','products/October2018/PfwyrcisLdM1ydpGm3pz.png','[\"products\\/October2018\\/eDoIT5WKSBPsuS2Ogd4L.png\"]',NULL,1,'0','yes',NULL,NULL),
	(56,0,'Bio Arónia',6,'ARONIA-1',12.99,NULL,'1kg','<p><strong>100% Bio Ar&oacute;nia čiernoplod&aacute;. P&ocirc;vod Bulharsko.</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Zdrav&eacute; plody bohat&eacute; na antioxidanty, železo, j&oacute;d.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Upravuje vysok&yacute; krv&yacute; tlak.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Najzdrav&scaron;ie ovocie prirodzene rast&uacute;ce v na&scaron;ich podmienkach<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Použite ju do jogurtov alebo muesli alebo aj ako snack. V&yacute;borne vyvažuje sladk&uacute; chuť.</p>','<p>Stredne sladk&eacute; plody, na počiatku chv&iacute;ľku vyznie kysl&aacute; chuť, ktor&aacute; sa ihneď premen&iacute; na trpkast&yacute; dozvuk. Hoci opis chuti tohto divok&eacute;ho ovocia neznie až tak lahodne, ar&oacute;nia prin&aacute;&scaron;a veľk&eacute; množstvo benefitov, ktor&eacute; sa asi ani nedaj&uacute; zr&aacute;tať. Ar&oacute;nia je zaraden&aacute; medzi superfoods.<br /> Je roz&scaron;&iacute;ren&aacute; hojne po celej severnej Eur&oacute;pe. Krajina najv&auml;č&scaron;ieho producenta bio plodov ar&oacute;nie je Poľsko odkiaľ poch&aacute;dzaj&uacute; najkvalitnej&scaron;ie bobuľky.</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_aronia.png\" alt=\"\" width=\"350\" /></p>','products/October2018/vBtGxiJM002H6UzIYJvd.png','[\"products\\/October2018\\/n8XnECJYVCf4T3U6eoFD.png\"]',NULL,1,'0','yes',NULL,NULL),
	(57,0,'Bio Granátové Jablko',6,'GRAJA-1',44.99,NULL,'1kg','<p><strong>Su&scaron;en&eacute; semienka gran&aacute;tov&eacute;ho jablka z Uzbekistanu, odroda \"Purple Varganza\"</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda - superpotravina</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov, nedosl&aacute;dzan&eacute;<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Použitie ako snack bohat&yacute; na vl&aacute;kninu. Až 18,4g zo 100g tvor&iacute; vl&aacute;knina.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Kr&aacute;sne, plne dozret&eacute;, m&auml;kk&eacute;, ľahko pukaj&uacute;ce &scaron;ťavnat&eacute; semienka<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Pln&aacute;, hutn&aacute; nenapodobiteľn&aacute; chuť<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Zvy&scaron;uju počet červen&yacute;ch krviniek a hemoglob&iacute;nu<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Znižuje tvorbu aterosklerotick&eacute;ho plaku<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bohat&yacute; zdroj vitam&iacute;nu C pokr&yacute;vaj&uacute;ci jeho značn&uacute; denn&uacute; potrebu pre človeka<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Ovocie s extr&eacute;mne vysok&yacute;m obsahom antioxidantov</p>','<p>Gran&aacute;tov&eacute; jablko m&aacute; dlh&uacute; hist&oacute;riu pestovania. Už po tis&iacute;cročia si ľudia už&iacute;vaj&uacute; jeho lahodn&eacute; plody.&nbsp; Veľmi pravdepodobne Eva pon&uacute;kla Adamovi pr&aacute;ve gran&aacute;tov&eacute; jablko. Je symbolom plodnosti a nositeľom života.</p>\r\n<p>&nbsp;</p>\r\n<p>Bio gran&aacute;tov&eacute; jablko z ponuky NATURIQ je delikatesa z Hodv&aacute;bnej cesty pestovan&eacute; FairTrade v &uacute;dol&iacute; Varganza v južnom Uzbekistane na pomedz&iacute; Tadžikistanu a Afganistanu. Pestovanie a zber, tiež aj &scaron;&uacute;panie a su&scaron;enie je v&yacute;lučne ručn&eacute;.</p>\r\n<p>&nbsp;</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_granatove_jablko.png\" alt=\"\" width=\"350\" /></p>','products/October2018/EuXfFCdzvnr2kTlHcmgG.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(58,0,'Bio Slivky',6,'SLIVKY-1',0.00,NULL,'1kg','<p><strong>Bio su&scaron;en&eacute; slivky z &uacute;rody 2017 s&uacute; vypredan&eacute;. Slivky z novej &uacute;rody 2018 bud&uacute; dostupn&eacute; na jeseň.<br /> <br /> Zloženie: 100% Premium Bio su&scaron;en&eacute; Slivky bez k&ocirc;stky (ručne vyk&ocirc;stkovan&eacute;).&nbsp; P&ocirc;vod Bulharsko.</strong><br /> <br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda od &scaron;pičkov&eacute;ho bio pestovateľa.</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov. Nes&iacute;ren&eacute;.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Zdrav&eacute; plody bohat&eacute; na vitam&iacute;ny, miner&aacute;ly a antioxidanty.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Zdroj rozpustnej aj nerozpustnej vl&aacute;kniny.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> N&iacute;zky glykemick&yacute; index GI=29.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Prirodzen&eacute; laxat&iacute;vum, ktor&eacute; funguje a ne&scaron;kod&iacute;.</p>','<p>Su&scaron;en&eacute; bio slivky s&uacute; skvel&aacute; a veľmi dobre dostupn&aacute; aj cenovo prijateľn&aacute; superpotravina. 5 su&scaron;en&yacute;ch sliviek denne V&aacute;m poskytne 3 gramy vl&aacute;kniny (12% dennej potreby), 290 mg drasl&iacute;ka a 16 mg magn&eacute;zia. To v&scaron;etko pri pr&iacute;jme energie men&scaron;ej ako 100 kcal. Obsahuj&uacute; len prirodzene sa vyskytuj&uacute;ci cukor, nie s&uacute; prisladzovan&eacute;. Svoj&iacute;m zložen&iacute;m m&ocirc;žu pom&ocirc;cť pri redukcii hmotnosti. Tiež maj&uacute; pozit&iacute;vny &uacute;činok na kond&iacute;ciu srdca, kost&iacute; a tr&aacute;venia. Preto by su&scaron;en&eacute; bio slivky určite nemali ch&yacute;bať vo Va&scaron;ej kuchyni.</p>\r\n<p>Slivky bez konzervantov m&ocirc;žu postupom času na povrchu vytv&aacute;rať biely povlak z kry&scaron;t&aacute;lov cukru. Tento stav je prirodzen&yacute;. Slivka str&aacute;ca vodu a cukor kry&scaron;talizuje v podobe jemn&yacute;ch kry&scaron;t&aacute;lov.</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_slivky.png\" alt=\"\" width=\"350\" /></p>','products/October2018/Sx7gRTAHOaftuMv4Z4YA.png','[\"products\\/October2018\\/3lYAGyc5WcAQoNLCzhf3.jpg\"]',NULL,1,'0','NA',NULL,NULL),
	(59,0,'Bio Datle Medjool',6,'DATLE-1',21.99,NULL,'1kg',NULL,'<p><strong>100% Bio Datle Medjool.</strong></p>\r\n<p><strong>Krajina p&ocirc;vodu: Izrael</strong></p>',NULL,'products/October2018/uFJSeYoPWSHjCG2uJpag.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(60,0,'Bio Zelené hrozienka',6,'ZELHRO-1',19.99,NULL,'1kg','<p><strong>100% Bio Zelen&eacute; hrozienka - Raw. Krajina p&ocirc;vodu: Uzbekistan</strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda. Raw kvalita.</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov. Nes&iacute;ren&eacute;.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> V&yacute;razn&eacute; a chutn&eacute;, sladk&eacute; s jemnou kyslosťou a s dochuťou po hru&scaron;k&aacute;ch.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Pr&iacute;jemn&yacute; žuvačkov&yacute; charakter, nie s&uacute; v&scaron;ak v&ocirc;bec lepiv&eacute;.</p>','<p>Sl&aacute;vne hrozienka Khorog poch&aacute;dzaj&uacute; z e&scaron;te sl&aacute;vnej&scaron;ej hodv&aacute;bnej cesty. Tieto zelen&eacute; hrozienka sa po tis&iacute;cročia pestuj&uacute; v oblasti Tajikistanu a tiež z&aacute;padnej Č&iacute;ny, oblasť Ujgurska. Hrozienka s&uacute; zn&aacute;me pod menom Khorog podľa starobyl&eacute;ho mesta dne&scaron;n&eacute;ho Tadžikistanu.</p>',NULL,'products/October2018/EC67FUKg8NV9AGwLIkTc.png','[\"products\\/October2018\\/ABuNLTexpjFkI9iNPRab.jpg\"]',NULL,1,'0','yes',NULL,NULL),
	(61,0,'Bio Višne',6,'VISNE-1',29.19,NULL,'1kg','<p><strong>100% Bio Vi&scaron;ne su&scaron;en&eacute; bez k&ocirc;stky, cel&eacute; - Raw. Krajina p&ocirc;vodu: Uzbekistan</strong></p>','<p><strong>Neodolali sme ponuke Bio pr&eacute;miov&yacute;ch su&scaron;en&yacute;ch vi&scaron;n&iacute;. Ich čokol&aacute;dovo laden&aacute; kyslo-sladk&aacute; chuť je veľmi podmaniv&aacute;. Doteraz sme sa e&scaron;te nestretli s takto chutn&yacute;mi plodmi su&scaron;en&yacute;ch vi&scaron;n&iacute;. Presvedče sa o ich pr&eacute;miovosti. Navy&scaron;e su &scaron;etrne su&scaron;en&eacute; - RAW, takže vitam&iacute;ny s&uacute; na mieste. </strong></p>\r\n<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda. Raw kvalita. Bez pr&iacute;dan&eacute;ho cukru.</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov. Nes&iacute;ren&eacute;.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> V&yacute;razn&eacute;, kysl&eacute;, sladk&eacute;, &scaron;ťavnat&eacute; a chutn&eacute;.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Skvel&eacute; ako snack, do muesli, jogurtov alebo varenia a pečenia.<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> V&yacute;born&aacute; chuť s v&yacute;raznou chuťou horkej čokol&aacute;dy v pozad&iacute;.</p>',NULL,'products/October2018/XWelOzwFghbE0fzDdKH4.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(62,0,'Bio Marhuľové jadierka horké',7,'MARJAD-1',14.99,NULL,'1kg','<p><strong>100%&nbsp;</strong><strong> Bio Marhuľov&eacute; jadierka - hork&eacute;.&nbsp; Krajina p&ocirc;vodu: Uzbekistan</strong></p>','<p><em>Hork&eacute; jadr&aacute; marh&uacute;ľ obsahuj&uacute; zv&yacute;&scaron;en&uacute; koncentr&aacute;ciu l&aacute;tky zvanej amygdal&iacute;n vitam&iacute;n B17.</em></p>\r\n<p><br /> <strong>EFSA odpor&uacute;ča konzumovať nie viac ako 1 až 2 marhuľov&eacute; jadierka denne.</strong></p>\r\n<p><strong>Nevhodn&eacute; pre deti. Držte mimo dosahu det&iacute;!!!</strong></p>',NULL,'products/October2018/AaTyGtHgptzODw9gB9CL.png',NULL,NULL,1,'0','yes',NULL,NULL),
	(63,0,'Bio Kokos',7,'KOKOS-1',24.99,NULL,'1kg','<p><strong>100% pr&eacute;mium BIO kokos RAW - pr&uacute;žky.</strong></p>\r\n<p><strong>Organick&eacute; pestovanie Sr&iacute; Lanka.</strong></p>','<p><img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Bio kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Premiov&aacute; trieda - TOP</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> <strong>Raw kvalita</strong><br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Bez pridan&yacute;ch l&aacute;tok a bez konzervantov<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Nepražen&eacute;. Surov&eacute;. Bez pridan&eacute;ho cukru<br /> <img style=\"height: 12px; width: 12px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2tpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NDExN0ZCQTIwMDcxMTY4QTc4OUM0RUQ5Q0U0MjFDRSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QkVBRTMwNDM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QkVBRTMwMzM1RjIxMUU0ODUwNzk5NkEwOTIzMjYzQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozYWY0Y2JmMC1jOWQxLTQ0ZWQtYTdlYy02NzhhMjk2NTU0ODgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMTdGQkEyMDA3MTE2OEE3ODlDNEVEOUNFNDIxQ0UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4G4m8QAAAAxElEQVR42mL8//8/AyWAiYFCQLEBjCAvMDIyElQ47aA8K5DSAWIDJCyM0wCgBpBiWyA2A2JDINYGYhY0ZdNRDABqEgBS2UCcDMSKRPjAA24AULMHUGAREIsS6f3nQCzHArXZDkhtAmJWEsJvRpb9wz+wWOgkUfNnkL3I0WhGYuzVA21/g2zAMxI0bwbiCegJqQSI/xGheRYQhwBt/4+RkIABCfJGARCDAlQCiJmB+BMQ3wHiI0C8AKjxPNaUOLQzE0CAAQCs3DqA3pvrxwAAAABJRU5ErkJggg==\" alt=\"\" /> Chutn&eacute;, chrumkav&eacute;, na slnku su&scaron;en&eacute;<br /> <br /> Pr&eacute;miov&aacute; Bio kvalita na slnku su&scaron;en&eacute;ho kokosu spĺňa podmienky pre skupinu stravn&iacute;kov uprednostňuj&uacute;cich RAW potraviny.</p>\r\n<p>Pr&uacute;žky s&uacute; r&ocirc;zne dlh&eacute; od 1cm až po 6 cm. S&uacute; chrumkav&eacute; a ľahko sa l&aacute;mu. S&uacute; v&yacute;živn&eacute;. Nabit&eacute; pr&iacute;rodn&yacute;m kokosov&yacute;m tukom, ktor&yacute; obsahuje orech na ide&aacute;lne dodanie energie. Tiež sa ide&aacute;lne hodia ako snack, do cere&aacute;li&iacute;, alebo bodka dňa poobede alebo za večerou na zmenu chuti. Zoberte si ich do &scaron;koly alebo do pr&aacute;ce. Vhodn&eacute; su aj na pr&iacute;pravu thajskej kuchyne kde dodaj&uacute; ar&oacute;mu alebo zmierňuj&uacute; chuť chilli. Vo veľkej &scaron;k&aacute;le receptov na pečenie, alebo aj ako ozdoba z&aacute;kuskov.</p>','<p><img src=\"http://localhost:8888/storage/products/October2018/nutric_hodnoty_kokos.png\" alt=\"\" width=\"350\" /></p>','products/October2018/Lpt1QvwSvgmczlSVZXJL.png','[\"products\\/October2018\\/DxCRcrVwtpNJY2KOMKh1.png\"]',NULL,1,'0','yes',NULL,NULL);

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
	(2,3),
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
	(1,'Kamilkový čaj po španielsky','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','recepts/October2018/gWcfE2QqJYncYgd4jfOc.jpg',NULL,'2018-10-02 15:52:00','2018-10-06 20:57:58'),
	(2,'Zázvorový čaj s citrónom','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<table class=\"table\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>qwe</strong></td>\r\n<td style=\"width: 108.217px;\">qwe</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>wer</strong></td>\r\n<td style=\"width: 108.217px;\">ert</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>rty</strong></td>\r\n<td style=\"width: 108.217px;\">yui</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>uio</strong></td>\r\n<td style=\"width: 108.217px;\">iop</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>iop</strong></td>\r\n<td style=\"width: 108.217px;\">op[</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>dfg</strong></td>\r\n<td style=\"width: 108.217px;\">hhj</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 119.783px;\"><strong>asd</strong></td>\r\n<td style=\"width: 108.217px;\">asd</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>','recepts/October2018/mlVtAAFTty6Vrw54EjJu.jpg',NULL,'2018-10-02 20:40:00','2018-10-06 20:56:55'),
	(3,'Anglický čaj pre zdravé ráno','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<table class=\"table table-striped\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>250g</strong></td>\r\n<td style=\"width: 137.95px;\">mlet&yacute;ch orechov</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>1PL</strong></td>\r\n<td style=\"width: 137.95px;\">oleja</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>180g</strong></td>\r\n<td style=\"width: 137.95px;\">pr&aacute;&scaron;kov&eacute;ho cukru</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>250ml</strong></td>\r\n<td style=\"width: 137.95px;\">čerstv&eacute;ho mlieka</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>500g</strong></td>\r\n<td style=\"width: 137.95px;\">su&scaron;en&eacute;ho ovocia</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>1PL</strong></td>\r\n<td style=\"width: 137.95px;\">tuzemsk&eacute;ho rumu</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 73px;\"><strong>1L</strong></td>\r\n<td style=\"width: 137.95px;\">čistej vody</td>\r\n</tr>\r\n</tbody>\r\n</table>','recepts/October2018/XprASKDzoIsuBuHTdJWS.jpg','[\"recepts\\/October2018\\/DvlCkOb8vB8n3yImq7gW.jpg\"]','2018-10-02 20:40:00','2018-10-06 21:08:53');

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
	(2,'user','Užívateľ','2018-09-05 11:44:22','2018-10-05 09:44:37');

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
  `id` smallint(2) unsigned NOT NULL AUTO_INCREMENT,
  `background_id` smallint(2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `slideshow` WRITE;
/*!40000 ALTER TABLE `slideshow` DISABLE KEYS */;

INSERT INTO `slideshow` (`id`, `background_id`, `product_id`, `order`)
VALUES
	(1,4,18,1),
	(2,3,1,2),
	(3,6,10,3);

/*!40000 ALTER TABLE `slideshow` ENABLE KEYS */;
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
  `active` set('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;

INSERT INTO `stores` (`id`, `city_id`, `image`, `name`, `street`, `zip`, `hours`, `active`)
VALUES
	(1,1,'stores/October2018/NjEw2gppxocYCZXDjDqG.jpg','Naturiq Bajkalská','Bajkalská 16','82108','<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>','yes'),
	(2,2,'stores/October2018/poRPCSELtxz5EYleFREx.png','Naturiq Banská','Bratislavská 4','65874','<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>','yes'),
	(3,3,'stores/October2018/poRPCSELtxz5EYleFREx.png','Naturiq Košice','Ostrovná 65/A','32147','<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>','yes'),
	(4,1,'stores/October2018/G3CinDIOxYegGB8sjJED.jpg','Naturiq Romancová','Romancová 11','83526','<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>\r\n<div class=\"store__hours\">\r\n<div class=\"day\">Pon - Pia</div>\r\n<div class=\"hours\">09:00 - 21:00</div>\r\n</div>','yes');

/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
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

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;

INSERT INTO `user_roles` (`user_id`, `role_id`)
VALUES
	(2,1);

/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;


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
	(2,1,'Superadmin','tetrev@alterweb.sk','users/default.png','$2y$10$9Ynl.ouXYVGR2fRHZBw32e38WeyFRvnU185V/HKCJNfBRbvIwG4YS','1PWm0AYxWP2gJs4lgOczLoQaxprKFgeGoZeZ9Vs1NubyI6mDl8MYs2h01jYt','{\"locale\":\"sk\"}','2018-09-12 07:52:13','2018-10-05 09:47:32'),
	(3,2,'Admin','info@naturiq.sk','users/default.png','$2y$10$Iy0Go/VmOHFMTSQDWKr9qud.sZqWOj3zn8KnZl7IbIfA1E9VtlqGm',NULL,'{\"locale\":\"sk\"}','2018-10-05 09:47:12','2018-10-05 09:47:12');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
