# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.38)
# Database: naturiq
# Generation Time: 2018-09-28 10:41:59 +0000
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;

INSERT INTO `addresses` (`id`, `name`, `street`, `zip`, `city`, `country`)
VALUES
	(6,NULL,'Mošovského 11','83525','Bratislava','Slovensko'),
	(20,NULL,'','','','');

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
	(2,4);

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


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `order`, `active`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'NOVINKY & ČERSTVÝ TOVAR','novinky-a-cerstvy-tovar',1,'0','2018-09-05 11:44:25','2018-09-12 08:15:48'),
	(2,NULL,'Muesli - bezlepkové','muesli-bezlepkove',2,'1','2018-09-05 11:44:25','2018-09-12 08:16:39'),
	(3,NULL,'Muesli - Original','muesli-original',3,'1','2018-09-05 11:44:25','2018-09-12 08:17:08'),
	(4,NULL,'Morušový čaj','morusovy-caj',4,'1','2018-09-05 11:44:25','2018-09-12 08:17:31'),
	(5,NULL,'Trail Mix','trail-mix',5,'1','2018-09-05 11:44:25','2018-09-12 08:17:50'),
	(6,NULL,'Sušené ovocie','susene-ovocie',6,'1','2018-09-12 08:18:33','2018-09-12 08:18:33'),
	(7,NULL,'Orechy','orechy',7,'1','2018-09-12 08:19:01','2018-09-12 08:19:01'),
	(8,NULL,'Vločky','vlocky',8,'1','2018-09-12 08:19:22','2018-09-12 08:19:22'),
	(9,NULL,'Semienka','semienka',9,'1','2018-09-12 08:19:57','2018-09-12 08:19:57');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
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
  `type` set('0','1','2') DEFAULT '0' COMMENT '0=neregistrovany,1=registrovany,2=velkoobchod',
  `approved` enum('0','1') DEFAULT '0',
  `temp` enum('0','1') DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;

INSERT INTO `clients` (`id`, `address_id`, `company_id`, `name`, `street`, `zip`, `city`, `country`, `phone`, `email`, `password`, `remember_token`, `type`, `approved`, `temp`, `created_at`, `updated_at`)
VALUES
	(7,6,6,'Boris Tetřev','Trenčianska 5','82103','Bratislava','Bratislava','0905315251','info@alterweb.sk','$2y$10$xOaeRIDiju7ctDDhKjx9zegBwVsGheth9SHi2MQziFP55CrTW.aqu','PfPO8pbwPmMdrA51g5g4A025WHo0uJqnK0Ia1G2xdM9CQ81FEUgJ9nt4hzwn','0','0',NULL,NULL,'2018-09-27 12:46:50'),
	(21,20,20,'Boris Tetřev','Trenčianska 11','82103','Bratislava','Bratislava','0905315251','tetrev@alterweb.sk',NULL,NULL,'0','0','1',NULL,'2018-09-28 07:59:51');

/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Delete Address` BEFORE DELETE ON `clients` FOR EACH ROW DELETE FROM `addresses` WHERE `id` = OLD.`address_id` */;;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;

INSERT INTO `companies` (`id`, `name`, `ico`, `dic`, `icdph`)
VALUES
	(6,'ALTERWEB, s.r.o.','65131516','65351351377','SK6546876411'),
	(20,'','','','');

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
	(59,7,'category_id','select_dropdown','Kategória',0,0,0,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- Vyberte --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',4),
	(60,7,'code','text','Kód tovaru',0,1,1,1,1,1,NULL,5),
	(61,7,'price_default','text','Štandardná cena',0,0,1,1,1,1,NULL,6),
	(62,7,'price_action','text','Akciová cena',0,0,1,1,1,1,NULL,7),
	(63,7,'weight','text','Hmotnosť balenia',0,1,1,1,1,1,NULL,8),
	(64,7,'description','rich_text_box','Popis produktu',0,0,1,1,1,1,NULL,10),
	(65,7,'image','image','Hlavná fotografia',0,1,1,1,1,1,'{\"resize\":{\"width\":\"750\",\"height\":null},\"quality\":\"80%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"250\",\"height\":\"250\"}}]}',11),
	(66,7,'gallery','multiple_images','Galéria',0,0,1,1,1,1,NULL,15),
	(67,7,'nutritions','rich_text_box','Nutričné hodnoty',0,0,1,1,1,1,NULL,12),
	(69,7,'active','checkbox','Aktívny',0,1,1,1,1,1,'{\"0\":\"Nie\",\"1\":\"Áno\",\"checked\":true}',19),
	(70,7,'created_at','timestamp','Dátum vytvorenia',0,0,0,0,0,0,NULL,13),
	(71,7,'updated_at','timestamp','Dátum aktualizácie',0,0,0,0,0,0,NULL,14),
	(72,9,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(73,9,'name','text','Názov',0,1,1,1,1,1,NULL,2),
	(75,9,'class','text','Trieda CSS',0,1,1,1,1,1,NULL,3),
	(77,7,'product_hasmany_tag_relationship','relationship','Tagy a atribúty',0,1,1,1,1,1,'{\"model\":\"App\\\\Tag\",\"table\":\"tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_tag\",\"pivot\":\"1\",\"taggable\":\"on\"}',17),
	(78,11,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(79,11,'title','text','Titulok',0,1,1,1,1,1,NULL,2),
	(80,11,'excerpt','text_area','Upútavka',0,1,1,1,1,1,NULL,3),
	(81,11,'content','rich_text_box','Postup',0,0,1,1,1,1,NULL,4),
	(82,11,'ingredients','rich_text_box','Ingrediencie',0,0,1,1,1,1,NULL,5),
	(83,11,'created_at','timestamp','Dátum vytvorenia',0,1,1,1,0,1,NULL,6),
	(84,11,'updated_at','timestamp','Dátum aktualizácie',0,0,0,0,0,0,NULL,7),
	(85,11,'recept_hasmany_product_relationship','relationship','Použité produkty',0,0,1,1,1,1,'{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"hasMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"addresses\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),
	(86,9,'tag_belongstomany_product_relationship','relationship','products',0,1,1,1,1,1,'{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_tag\",\"pivot\":\"1\",\"taggable\":\"on\"}',4),
	(87,12,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(88,12,'name','text','Názov',0,1,1,1,1,1,NULL,2),
	(89,12,'title','text','Alt text',0,1,1,1,1,1,NULL,3),
	(90,12,'icon','text','Ikona',0,1,1,1,1,1,NULL,4),
	(91,12,'attribute_belongstomany_product_relationship','relationship','products',0,1,1,1,1,1,'{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"attribute_product\",\"pivot\":\"1\",\"taggable\":null}',5),
	(92,7,'product_belongstomany_attribute_relationship','relationship','attributes',0,1,1,1,1,1,'{\"model\":\"App\\\\Attribute\",\"table\":\"attributes\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attribute_product\",\"pivot\":\"1\",\"taggable\":\"0\"}',18),
	(93,7,'product_id','text','Product Id',0,1,1,1,1,1,NULL,2),
	(94,7,'contents','text','Contents',0,1,1,1,1,1,NULL,9),
	(95,7,'featured','text','Featured',0,1,1,1,1,1,NULL,16),
	(96,7,'buys','text','Buys',0,0,1,0,0,0,NULL,20),
	(97,13,'id','text','Id',1,0,0,0,0,0,NULL,1),
	(98,13,'title','text','Názov',0,1,1,1,1,1,NULL,2),
	(99,13,'code','text','Kód kupónu',0,1,1,1,1,1,NULL,3),
	(100,13,'value','text','Hodnota',0,1,1,1,1,1,NULL,4),
	(101,13,'type','select_dropdown','Typ zľavy',0,1,1,1,1,1,'{\"default\":\"AMOUNT\",\"options\":{\"AMOUNT\":\"Zľava v EUR\",\"PERCENT\":\"Zľava v %\"}}',5);

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
	(7,'products','products','Produkt','Produkty','voyager-bag','App\\Product',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-11 08:53:33','2018-09-11 08:53:33'),
	(9,'tags','tags','Tag','Tagy','voyager-wallet','App\\Tag',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-11 09:05:57','2018-09-11 09:11:04'),
	(11,'recepts','recepts','Recept','Recepty','voyager-lab','App\\Recept',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-11 09:24:57','2018-09-11 09:24:57'),
	(12,'attributes','attributes','Atribúty produktov','Attributes','tag','App\\Attribute',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-24 08:59:35','2018-09-24 08:59:35'),
	(13,'coupons','coupons','Kupón','Kupóny','voyager-dollar','App\\Coupon',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-09-24 09:10:18','2018-09-24 09:10:18');

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
	(2,1,'Media','','_self','voyager-images',NULL,NULL,8,'2018-09-05 11:44:22','2018-09-24 09:05:38','voyager.media.index',NULL),
	(3,1,'Užívatelia','','_self','voyager-person','#000000',NULL,7,'2018-09-05 11:44:22','2018-09-24 09:05:38','voyager.users.index','null'),
	(4,1,'Privilégiá','','_self','voyager-lock','#000000',NULL,6,'2018-09-05 11:44:22','2018-09-24 09:05:38','voyager.roles.index','null'),
	(5,1,'Nástroje','','_self','voyager-tools','#000000',NULL,14,'2018-09-05 11:44:22','2018-09-24 09:07:00',NULL,''),
	(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2018-09-05 11:44:22','2018-09-11 08:49:38','voyager.menus.index',NULL),
	(7,1,'Database','','_self','voyager-data',NULL,5,2,'2018-09-05 11:44:22','2018-09-11 08:49:38','voyager.database.index',NULL),
	(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2018-09-05 11:44:22','2018-09-11 08:49:38','voyager.compass.index',NULL),
	(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2018-09-05 11:44:22','2018-09-11 08:49:38','voyager.bread.index',NULL),
	(10,1,'Nastavenia','','_self','voyager-settings','#000000',NULL,15,'2018-09-05 11:44:22','2018-09-24 09:07:00','voyager.settings.index','null'),
	(11,1,'Kategórie','','_self','voyager-categories','#000000',NULL,11,'2018-09-05 11:44:24','2018-09-24 09:05:38','voyager.categories.index','null'),
	(12,1,'Články','','_self','voyager-news','#000000',NULL,9,'2018-09-05 11:44:25','2018-09-24 09:05:38','voyager.posts.index','null'),
	(13,1,'Obsah podstránok','','_self','voyager-file-text','#000000',NULL,10,'2018-09-05 11:44:25','2018-09-24 09:05:38','voyager.pages.index','null'),
	(15,1,'Produkty','/admin/products','_self','voyager-bag','#000000',NULL,2,'2018-09-11 08:49:17','2018-09-11 08:54:11',NULL,''),
	(18,1,'Tagy produktov','','_self','voyager-tag','#000000',NULL,12,'2018-09-11 09:05:57','2018-09-24 09:06:58','voyager.tags.index','null'),
	(20,1,'Recepty','','_self','voyager-lab',NULL,NULL,5,'2018-09-11 09:24:57','2018-09-24 09:05:38','voyager.recepts.index',NULL),
	(21,1,'Users','','_self','voyager-person',NULL,NULL,4,'2018-09-11 11:30:56','2018-09-24 09:05:38','voyager.users.index',NULL),
	(22,1,'Roles','','_self','voyager-lock',NULL,NULL,3,'2018-09-11 11:30:56','2018-09-24 09:05:38','voyager.roles.index',NULL),
	(25,1,'Atribúty produktov','','_self','voyager-tag','#000000',NULL,13,'2018-09-24 08:59:36','2018-09-24 09:07:00','voyager.attributes.index','null'),
	(26,1,'Kupóny','','_self','voyager-dollar',NULL,NULL,16,'2018-09-24 09:10:19','2018-09-24 09:10:19','voyager.coupons.index',NULL);

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
	(67,'2018_09_26_090751_add_foreign_keys_to_users_table',0);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
	('4',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";s:2:\"id\";i:3;s:3:\"qty\";i:1;s:4:\"name\";s:36:\"100 % Bio čaj z morušových listov\";s:5:\"price\";d:19;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:5:\"1000g\";s:5:\"image\";s:47:\"products/September2018/t84e5bcni4OvCqzgE9mb.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('5',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";s:2:\"id\";i:3;s:3:\"qty\";i:2;s:4:\"name\";s:36:\"100 % Bio čaj z morušových listov\";s:5:\"price\";d:19;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:5:\"1000g\";s:5:\"image\";s:47:\"products/September2018/t84e5bcni4OvCqzgE9mb.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('6',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"88373ff16bf94db38906fdb30aa5201b\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"88373ff16bf94db38906fdb30aa5201b\";s:2:\"id\";i:11;s:3:\"qty\";s:1:\"2\";s:4:\"name\";s:23:\"Kešu orechy, pražené\";s:5:\"price\";d:15;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:4:\"200g\";s:5:\"image\";s:47:\"products/September2018/JRXbyHMDICa25n6A52cU.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('7',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"981a91ad5409ba8310581a9484895c1a\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"981a91ad5409ba8310581a9484895c1a\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:36:\"100 % Bio čaj z morušových listov\";s:5:\"price\";d:20;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:4:\"500g\";s:5:\"image\";s:47:\"products/September2018/t84e5bcni4OvCqzgE9mb.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('8',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"981a91ad5409ba8310581a9484895c1a\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"981a91ad5409ba8310581a9484895c1a\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:36:\"100 % Bio čaj z morušových listov\";s:5:\"price\";d:20;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:4:\"500g\";s:5:\"image\";s:47:\"products/September2018/t84e5bcni4OvCqzgE9mb.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('9',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"ce83ca77875591e440c90dfdf92535df\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"ce83ca77875591e440c90dfdf92535df\";s:2:\"id\";i:4;s:3:\"qty\";s:1:\"3\";s:4:\"name\";s:23:\"Kešu orechy, pražené\";s:5:\"price\";d:20;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:4:\"150g\";s:5:\"image\";s:47:\"products/September2018/JRXbyHMDICa25n6A52cU.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('11',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"981a91ad5409ba8310581a9484895c1a\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"981a91ad5409ba8310581a9484895c1a\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:36:\"100 % Bio čaj z morušových listov\";s:5:\"price\";d:20;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:4:\"500g\";s:5:\"image\";s:47:\"products/September2018/t84e5bcni4OvCqzgE9mb.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL),
	('12',NULL,'default','O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":8:{s:5:\"rowId\";s:32:\"245c3cade6719693dd2b494cd8ef7e2e\";s:2:\"id\";i:3;s:3:\"qty\";i:1;s:4:\"name\";s:36:\"100 % Bio čaj z morušových listov\";s:5:\"price\";d:19;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:2:{s:6:\"weight\";s:5:\"1000g\";s:5:\"image\";s:47:\"products/September2018/t84e5bcni4OvCqzgE9mb.png\";}}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:11:\"App\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:20;}}}',NULL,NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `client_id`, `shipping_id`, `payment_id`, `status_id`, `discount_id`, `number`, `customer`, `shipping_price`, `payment_price`, `total_price`, `payment-status_id`, `note`, `note_internal`, `created_at`, `updated_at`)
VALUES
	(3,7,2,2,1,NULL,'20180927-3','Boris Tetřev',4.00,0.00,23.00,NULL,NULL,NULL,'2018-09-27 07:00:01','2018-09-27 12:03:38'),
	(4,7,3,3,1,NULL,'20180927-4','Boris Tetřev',0.00,0.00,17.10,NULL,NULL,NULL,'2018-09-27 12:17:40','2018-09-27 12:24:39'),
	(5,7,1,2,1,NULL,'20180927-5','Boris Tetřev',4.00,0.00,38.10,NULL,NULL,NULL,'2018-09-27 12:31:11','2018-09-27 12:31:17'),
	(6,7,1,1,1,NULL,'20180927-6','Boris Tetřev',3.90,0.00,33.90,NULL,NULL,NULL,'2018-09-27 12:43:19','2018-09-27 12:43:31'),
	(7,7,1,2,1,NULL,'20180927-7','Boris Tetřev',4.00,0.00,23.90,NULL,NULL,NULL,'2018-09-27 12:44:39','2018-09-27 12:44:46'),
	(8,7,3,4,1,NULL,'20180927-8','Boris Tetřev',4.00,0.00,20.00,NULL,NULL,NULL,'2018-09-27 12:46:57','2018-09-27 12:47:10'),
	(9,7,2,4,1,NULL,'20180927-9','Boris Tetřev',4.00,0.00,58.00,NULL,NULL,NULL,'2018-09-27 12:52:13','2018-09-27 12:52:27'),
	(10,20,2,2,0,NULL,NULL,NULL,4.00,0.00,NULL,NULL,NULL,NULL,'2018-09-28 07:36:03','2018-09-28 07:36:03'),
	(11,21,2,3,1,NULL,'20180928-11','Boris Tetřev',0.00,0.00,24.00,NULL,NULL,NULL,'2018-09-28 08:00:09','2018-09-28 08:17:10'),
	(12,21,3,2,1,NULL,'20180928-12','Boris Tetřev',4.00,0.00,19.00,NULL,NULL,NULL,'2018-09-28 08:38:52','2018-09-28 08:42:15'),
	(13,21,4,4,1,NULL,'20180928-13','Boris Tetřev',4.00,0.00,23.00,NULL,NULL,NULL,'2018-09-28 09:10:39','2018-09-28 09:10:47'),
	(14,21,3,1,1,NULL,'20180928-14','Boris Tetřev',3.90,0.00,19.00,NULL,NULL,NULL,'2018-09-28 09:23:10','2018-09-28 09:23:38'),
	(15,21,3,2,1,NULL,'20180928-15','Boris Tetřev',4.00,0.00,19.00,NULL,NULL,NULL,'2018-09-28 09:26:40','2018-09-28 09:27:24'),
	(16,21,3,2,1,NULL,'20180928-16','Boris Tetřev',4.00,0.00,19.00,NULL,NULL,NULL,'2018-09-28 09:29:29','2018-09-28 09:29:33'),
	(17,21,3,3,1,NULL,'20180928-17','Boris Tetřev',0.00,0.00,19.00,NULL,NULL,NULL,'2018-09-28 09:33:57','2018-09-28 09:34:04'),
	(18,21,3,2,1,NULL,'20180928-18','Boris Tetřev',4.00,0.00,19.00,NULL,NULL,NULL,'2018-09-28 09:35:02','2018-09-28 09:35:07'),
	(19,21,2,3,1,NULL,'20180928-19','Boris Tetřev',0.00,0.00,23.00,NULL,NULL,NULL,'2018-09-28 09:36:02','2018-09-28 09:36:07');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2018-09-05 11:44:25','2018-09-05 11:44:25');

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
	(66,1);

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
	(66,'delete_coupons','coupons','2018-09-24 09:10:18','2018-09-24 09:10:18');

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

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`)
VALUES
	(1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2018-09-05 11:44:25','2018-09-05 11:44:25'),
	(4,0,NULL,'Yarr Post',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2018-09-05 11:44:25','2018-09-05 11:44:25');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
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
	(10,2),
	(9,1),
	(1,2),
	(4,3),
	(8,1);

/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
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
  `featured` set('0','1') DEFAULT '0',
  `active` enum('0','1') DEFAULT '1',
  `buys` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `product_id`, `name`, `category_id`, `code`, `price_default`, `price_action`, `weight`, `contents`, `description`, `nutritions`, `image`, `gallery`, `featured`, `active`, `buys`, `created_at`, `updated_at`)
VALUES
	(1,0,'100 % Bio čaj z morušových listov',4,'ASD-1',25.00,15.35,'200g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','products/September2018/t84e5bcni4OvCqzgE9mb.png',NULL,'1','1',NULL,NULL,NULL),
	(2,1,'100 % Bio čaj z morušových listov',4,'ASD-2',23.00,20.00,'500g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>\n\n<p>Nam laoreet sollicitudin libero eget ullamcorper. Suspendisse molestie feugiat tellus, in efficitur nulla ultricies ac. Sed sed nisi ultricies, dignissim sapien sit amet, faucibus lorem. Aliquam pretium, erat vel aliquet laoreet, magna libero lobortis nisl, a porta lectus quam id turpis. Mauris efficitur id justo eu molestie. Phasellus in ex eget dui maximus vestibulum sed eu orci. Nunc eleifend lacinia ligula, non dictum felis venenatis et. Cras vel mi justo. In sed neque neque. Nam a leo eget lacus scelerisque efficitur. Maecenas ultricies lorem odio, non bibendum nulla pulvinar id. Nullam vitae magna congue, mollis ipsum a, sagittis lacus. Morbi lobortis at diam ac tincidunt. Aenean in auctor odio, quis blandit libero.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','',NULL,'1','1',NULL,NULL,NULL),
	(3,1,'100 % Bio čaj z morušových listov',4,'ASD-3',25.00,19.00,'1000g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>\n\n<p>Nam laoreet sollicitudin libero eget ullamcorper. Suspendisse molestie feugiat tellus, in efficitur nulla ultricies ac. Sed sed nisi ultricies, dignissim sapien sit amet, faucibus lorem. Aliquam pretium, erat vel aliquet laoreet, magna libero lobortis nisl, a porta lectus quam id turpis. Mauris efficitur id justo eu molestie. Phasellus in ex eget dui maximus vestibulum sed eu orci. Nunc eleifend lacinia ligula, non dictum felis venenatis et. Cras vel mi justo. In sed neque neque. Nam a leo eget lacus scelerisque efficitur. Maecenas ultricies lorem odio, non bibendum nulla pulvinar id. Nullam vitae magna congue, mollis ipsum a, sagittis lacus. Morbi lobortis at diam ac tincidunt. Aenean in auctor odio, quis blandit libero.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','',NULL,'1','1',NULL,NULL,NULL),
	(4,0,'Kešu orechy, pražené',7,'QWE-1',23.00,20.00,'150g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','products/September2018/JRXbyHMDICa25n6A52cU.png',NULL,'1','1',NULL,NULL,NULL),
	(5,4,'Kešu orechy, pražené',7,'QWE-2',21.00,20.00,'300g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>\n\n<p>Nam laoreet sollicitudin libero eget ullamcorper. Suspendisse molestie feugiat tellus, in efficitur nulla ultricies ac. Sed sed nisi ultricies, dignissim sapien sit amet, faucibus lorem. Aliquam pretium, erat vel aliquet laoreet, magna libero lobortis nisl, a porta lectus quam id turpis. Mauris efficitur id justo eu molestie. Phasellus in ex eget dui maximus vestibulum sed eu orci. Nunc eleifend lacinia ligula, non dictum felis venenatis et. Cras vel mi justo. In sed neque neque. Nam a leo eget lacus scelerisque efficitur. Maecenas ultricies lorem odio, non bibendum nulla pulvinar id. Nullam vitae magna congue, mollis ipsum a, sagittis lacus. Morbi lobortis at diam ac tincidunt. Aenean in auctor odio, quis blandit libero.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','',NULL,'0','1',NULL,NULL,NULL),
	(6,0,'Priadka morušová',5,'POI-1',25.00,20.00,'100g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>\n\n<p>Nam laoreet sollicitudin libero eget ullamcorper. Suspendisse molestie feugiat tellus, in efficitur nulla ultricies ac. Sed sed nisi ultricies, dignissim sapien sit amet, faucibus lorem. Aliquam pretium, erat vel aliquet laoreet, magna libero lobortis nisl, a porta lectus quam id turpis. Mauris efficitur id justo eu molestie. Phasellus in ex eget dui maximus vestibulum sed eu orci. Nunc eleifend lacinia ligula, non dictum felis venenatis et. Cras vel mi justo. In sed neque neque. Nam a leo eget lacus scelerisque efficitur. Maecenas ultricies lorem odio, non bibendum nulla pulvinar id. Nullam vitae magna congue, mollis ipsum a, sagittis lacus. Morbi lobortis at diam ac tincidunt. Aenean in auctor odio, quis blandit libero.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','',NULL,'0','1',NULL,NULL,NULL),
	(7,6,'Priadka morušová',5,'POI-2',24.00,15.00,'150g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>\n\n<p>Nam laoreet sollicitudin libero eget ullamcorper. Suspendisse molestie feugiat tellus, in efficitur nulla ultricies ac. Sed sed nisi ultricies, dignissim sapien sit amet, faucibus lorem. Aliquam pretium, erat vel aliquet laoreet, magna libero lobortis nisl, a porta lectus quam id turpis. Mauris efficitur id justo eu molestie. Phasellus in ex eget dui maximus vestibulum sed eu orci. Nunc eleifend lacinia ligula, non dictum felis venenatis et. Cras vel mi justo. In sed neque neque. Nam a leo eget lacus scelerisque efficitur. Maecenas ultricies lorem odio, non bibendum nulla pulvinar id. Nullam vitae magna congue, mollis ipsum a, sagittis lacus. Morbi lobortis at diam ac tincidunt. Aenean in auctor odio, quis blandit libero.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','',NULL,'0','1',NULL,NULL,NULL),
	(8,0,'Sypaný zelený čaj',2,'LKJ-1',20.00,18.00,'50g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','products/September2018/crKjEDKh9FU2kQ0RB81z.png',NULL,'0','1',NULL,NULL,NULL),
	(9,8,'Sypaný zelený čaj',2,'LKJ-2',22.00,17.00,'75g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>\n\n<p>Nam laoreet sollicitudin libero eget ullamcorper. Suspendisse molestie feugiat tellus, in efficitur nulla ultricies ac. Sed sed nisi ultricies, dignissim sapien sit amet, faucibus lorem. Aliquam pretium, erat vel aliquet laoreet, magna libero lobortis nisl, a porta lectus quam id turpis. Mauris efficitur id justo eu molestie. Phasellus in ex eget dui maximus vestibulum sed eu orci. Nunc eleifend lacinia ligula, non dictum felis venenatis et. Cras vel mi justo. In sed neque neque. Nam a leo eget lacus scelerisque efficitur. Maecenas ultricies lorem odio, non bibendum nulla pulvinar id. Nullam vitae magna congue, mollis ipsum a, sagittis lacus. Morbi lobortis at diam ac tincidunt. Aenean in auctor odio, quis blandit libero.</p>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','products/September2018/LCr30ncb8VFu4xYkIsKs.png',NULL,'0','1',NULL,NULL,NULL),
	(10,0,'Vlašské orechy, solené',7,'MNB-1',23.00,19.00,'250g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\r\n<p>At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','products/September2018/d8d0Hp02pocFDg6wtmZb.png',NULL,'0','1',NULL,NULL,NULL),
	(11,4,'Kešu orechy, pražené',7,'QWE-3',19.00,15.00,'200g','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>\n\n<p>Nam laoreet sollicitudin libero eget ullamcorper. Suspendisse molestie feugiat tellus, in efficitur nulla ultricies ac. Sed sed nisi ultricies, dignissim sapien sit amet, faucibus lorem. Aliquam pretium, erat vel aliquet laoreet, magna libero lobortis nisl, a porta lectus quam id turpis. Mauris efficitur id justo eu molestie. Phasellus in ex eget dui maximus vestibulum sed eu orci. Nunc eleifend lacinia ligula, non dictum felis venenatis et. Cras vel mi justo. In sed neque neque. Nam a leo eget lacus scelerisque efficitur. Maecenas ultricies lorem odio, non bibendum nulla pulvinar id. Nullam vitae magna congue, mollis ipsum a, sagittis lacus. Morbi lobortis at diam ac tincidunt. Aenean in auctor odio, quis blandit libero.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur velit felis, vehicula eu sapien sed, placerat convallis augue. Nullam et leo ligula. Praesent id odio eget felis interdum elementum. In mollis tincidunt augue semper hendrerit. Vestibulum ultrices commodo rhoncus. Morbi elementum tellus sem, non tempus lectus blandit et. Pellentesque at sem eu turpis viverra suscipit eget ut nibh. Donec vitae risus vel est cursus commodo.</p>','',NULL,'0','1',NULL,NULL,NULL);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recepts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recepts`;

CREATE TABLE `recepts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `excerpt` varchar(255) DEFAULT NULL,
  `content` text,
  `ingredients` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
	(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),
	(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),
	(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),
	(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),
	(8,'admin.loader','Admin Loader','','','image',3,'Admin'),
	(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),
	(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');

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


# Dump of table shoppingcart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shoppingcart`;

CREATE TABLE `shoppingcart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table slideshow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `slideshow`;

CREATE TABLE `slideshow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
	(2,1,'exidas','tetrev@alterweb.sk','users/default.png','$2y$10$5bRd2dDmb2h0jbyUYir.Ge/LX2SyphCE0bwztRZECtBbOJf5qW4tC',NULL,NULL,'2018-09-12 07:52:13','2018-09-12 07:52:13');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
