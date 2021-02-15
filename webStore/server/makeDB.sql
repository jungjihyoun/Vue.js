  
# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
#
# Host: 192.168.219.100 (MySQL 5.5.5-10.5.8-MariaDB-1:10.5.8+maria~focal)
# Database: d_store
# Generation Time: 2021-02-05 14:39:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table t_category
# ------------------------------------------------------------

-- DROP TABLE IF EXISTS `t_category`;

-- CREATE TABLE `t_category` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
--   `category1` varchar(100) NOT NULL DEFAULT '',
--   `category2` varchar(100) NOT NULL DEFAULT '',
--   `category3` varchar(100) DEFAULT '',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_category` WRITE;
/*!40000 ALTER TABLE `t_category` DISABLE KEYS */;

INSERT INTO `t_category` (`id`, `category1`, `category2`, `category3`)
VALUES
	(1,'완구','카카오','인형'),
	(2,'완구','카카오','학용품'),
	(3,'완구','카카오','차용품'),
	(4,'완구','곰돌이','학용품'),
	(5,'완구','곰돌이','차용품'),
	(6,'생필품','주방용품','조리도구');

/*!40000 ALTER TABLE `t_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_image
# ------------------------------------------------------------

-- DROP TABLE IF EXISTS `t_image`;

-- CREATE TABLE `t_image` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
--   `product_id` int(11) unsigned NOT NULL,
--   `type` int(1) NOT NULL DEFAULT 1 COMMENT '1-썸네일, 2-제품이미지, 3-제품설명이미지',
--   `path` varchar(150) NOT NULL DEFAULT '',
--   PRIMARY KEY (`id`),
--   KEY `product_id` (`product_id`),
--   CONSTRAINT `t_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_image` WRITE;
/*!40000 ALTER TABLE `t_image` DISABLE KEYS */;

INSERT INTO `t_image` (`id`, `product_id`, `type`, `path`)
VALUES
	(10,1,1,'apeach1.png'),
	(11,1,2,'apeach2.png'),
	(12,1,2,'apeach3.png'),
	(14,1,3,'detail.jpg'),
	(15,2,1,'3.png'),
	(16,2,2,'detail1.png'),
	-- (17,2,3,'detail.jpg'),
	-- (18,1,2,'keyboard3.jpg'),
	-- (20,8,1,'mousepad1.jpg'),
	-- (22,8,2,'mousepad1.jpg'),
	-- (23,8,2,'mousepad2.jpg'),
	-- (24,8,2,'mousepad3.jpg'),
	-- (25,8,3,'detail.jpg');

/*!40000 ALTER TABLE `t_image` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_product
# ------------------------------------------------------------

-- DROP TABLE IF EXISTS `t_product`;

-- CREATE TABLE `t_product` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
--   `product_name` varchar(200) NOT NULL DEFAULT '',
--   `product_price` int(11) NOT NULL DEFAULT 0,
--   `delivery_price` int(11) NOT NULL DEFAULT 0,
--   `add_delivery_price` int(11) NOT NULL DEFAULT 0,
--   `tags` varchar(100) DEFAULT NULL,
--   `outbound_days` int(2) NOT NULL DEFAULT 5,
--   `seller_id` int(11) unsigned NOT NULL,
--   `category_id` int(11) unsigned NOT NULL,
--   `active_yn` enum('Y','N') NOT NULL DEFAULT 'Y',
--   `created_date` datetime NOT NULL DEFAULT current_timestamp(),
--   PRIMARY KEY (`id`),
--   KEY `seller_id` (`seller_id`),
--   KEY `category_id` (`category_id`),
--   CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `t_seller` (`id`),
--   CONSTRAINT `t_product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_product` WRITE;
/*!40000 ALTER TABLE `t_product` DISABLE KEYS */;

INSERT INTO `t_product` (`id`, `product_name`, `product_price`, `delivery_price`, `add_delivery_price`, `tags`, `outbound_days`, `seller_id`, `category_id`, `active_yn`, `created_date`)
VALUES
	(1,'Apeach Kakao',219000,2500,5000,'키보드,기계식,게이밍',5,1,1,'Y','2021-01-10 00:00:00'),
	-- (2,'로지텍 MX VERTICAL 인체공학 무선 마우스',11900,2500,5000,'마우스',5,1,1,'Y','2021-01-10 00:00:00'),
	-- (8,'테스트 제품 AAA',23000,5000,2500,'테스트,노트북,악세사리',5,1,1,'Y','2021-01-21 00:41:14'),
	-- (9,'제품 테스트2',30000,5000,5000,'',5,1,6,'Y','2021-01-21 01:19:28');

/*!40000 ALTER TABLE `t_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_seller
# ------------------------------------------------------------

-- DROP TABLE IF EXISTS `t_seller`;

-- CREATE TABLE `t_seller` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
--   `name` varchar(100) NOT NULL DEFAULT '',
--   `email` varchar(100) NOT NULL DEFAULT '',
--   `phone` varchar(20) NOT NULL DEFAULT '',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_seller` WRITE;
/*!40000 ALTER TABLE `t_seller` DISABLE KEYS */;

INSERT INTO `t_seller` (`id`, `name`, `email`, `phone`)
VALUES
	(1,'정지현','jihyoun0602@gmail.com','010-1111-1111');

/*!40000 ALTER TABLE `t_seller` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_user
# ------------------------------------------------------------

-- DROP TABLE IF EXISTS `t_user`;

-- CREATE TABLE `t_user` (
--   `email` varchar(50) NOT NULL DEFAULT '',
--   `type` int(1) NOT NULL DEFAULT 1 COMMENT '1-buyer, 2-seller',
--   `nickname` varchar(50) DEFAULT NULL,
--   PRIMARY KEY (`email`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;

INSERT INTO `t_user` (`email`, `type`, `nickname`)
VALUES
	('wlgus8402@gmail.com',1,'정지정');

/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;