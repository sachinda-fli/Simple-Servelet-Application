-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.52-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema expo
--

CREATE DATABASE IF NOT EXISTS expo;
USE expo;

--
-- Definition of table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `idadminlog` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `type` varchar(45) NOT NULL,
  `status` varchar(5) NOT NULL,
  PRIMARY KEY (`idadminlog`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminlog`
--

/*!40000 ALTER TABLE `adminlog` DISABLE KEYS */;
INSERT INTO `adminlog` (`idadminlog`,`email`,`password`,`full_name`,`gender`,`mobile`,`address`,`type`,`status`) VALUES 
 (1,'anushka.shan7@gmail.com','shan','Shan Anushka Ranasinghe','Male','0715781663','Sanadakelum,Aluthnuwara,Udalamataa,Galle','Admin','1'),
 (2,'abc@gmail.com','abc','Thanuri Geeganage','Male','0715781663','Sanadakelum,Aluthnuwara,Udalamataa,Galle','User','1'),
 (3,'vindy@gmail.com','123','Vindya Geeganage','Female','0713343256','Beliatta','User','1');
/*!40000 ALTER TABLE `adminlog` ENABLE KEYS */;


--
-- Definition of table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `idcart` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total_product_in_cart` int(10) unsigned NOT NULL,
  `total_amount` double NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcart`),
  KEY `FK_cart_1` (`user_id`),
  CONSTRAINT `FK_cart_1` FOREIGN KEY (`user_id`) REFERENCES `user_reg` (`iduser_reg`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`idcart`,`total_product_in_cart`,`total_amount`,`user_id`) VALUES 
 (6,2,2700,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


--
-- Definition of table `cart_has_product`
--

DROP TABLE IF EXISTS `cart_has_product`;
CREATE TABLE `cart_has_product` (
  `idcart_has_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_idcart` int(10) unsigned NOT NULL,
  `product_idproduct` int(10) unsigned NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  `price` double NOT NULL,
  `is_purchase` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_deliver` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcart_has_product`),
  KEY `FK_cart_has_product_1` (`product_idproduct`),
  KEY `FK_cart_has_product_2` (`cart_idcart`),
  CONSTRAINT `FK_cart_has_product_1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`pr_id`),
  CONSTRAINT `FK_cart_has_product_2` FOREIGN KEY (`cart_idcart`) REFERENCES `cart` (`idcart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_has_product`
--

/*!40000 ALTER TABLE `cart_has_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_has_product` ENABLE KEYS */;


--
-- Definition of table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `idcategories` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  PRIMARY KEY (`idcategories`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`idcategories`,`cat_name`) VALUES 
 (1,'Batik'),
 (2,'Gems'),
 (3,'Handloom'),
 (4,'Bathware'),
 (5,'Accessories'),
 (6,'Soft Toys'),
 (7,'Bags & Pouches'),
 (8,'Furniture'),
 (9,'Ceramics'),
 (10,'Jewellery Sets'),
 (11,'Necklaces & Pendants'),
 (12,'Bangles & Bracelets'),
 (13,'Earrings'),
 (15,'Wood'),
 (16,'Paper Mache'),
 (17,'Brass'),
 (18,'Oxidised'),
 (19,'Silver'),
 (20,'Copper'),
 (21,'Tea'),
 (22,'Spices'),
 (23,'Cashew'),
 (24,'Rush & Reedware');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
CREATE TABLE `menu_item` (
  `idmenu_item` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idmenu_item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_item`
--

/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` (`idmenu_item`,`name`) VALUES 
 (1,'Leather & Ceramic'),
 (2,'Gem & Jewellery'),
 (3,'Arts & Crafts'),
 (4,'Tea & Spices'),
 (5,'Batiks & Handlooms');
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`pr_id`,`name`,`description`,`price`,`url`,`category`,`qty`) VALUES 
 (31,'Brass Vas','Beautifull brass vas','1000.00','images/Traditional-Items.jpg','Brass',110),
 (32,'Traditional Shoes','Specially for tradition lovers','1500.00','images/shoes.jpg','Rush & Reedware',10),
 (33,'Dilmah Tea','Best tea ever','1000.00','images/tea1.jpg','Tea',9),
 (34,'Pupet','Group of pupets furniture','1500.00','images/pupet.jpg','Furniture',20),
 (35,'Hand Bag','Black and Red bag','1200.00','images/blackandredhandbag_small.jpg','Bags & Pouches',99),
 (36,'Ceramic Plate','Ceramic plate for all','100.00','images/Ceramic-Porcelain.png','Ceramics',50),
 (37,'Spices','Original Spices','200.00','images/1.png','Spices',20),
 (38,'Cashew nut','original cashew nut','2000.00','images/sdfsadf.png','Cashew',20),
 (39,'Bathik Frock','Hand made Bathick frock','3000.00','images/womenswear.png','Batik',10),
 (40,'Womens Hand Bag','Hand made','990.00','images/leatherhandbag_small.jpg','Bags & Pouches',19),
 (41,'Gem Set','Original cuted gem set','10000.00','images/gems(1).png','Gems',100),
 (42,'Gems','Original Gems','1000.00','images/gems(1).png','Gems',100),
 (43,'Bath Towel','Different kind of bathware','150.00','images/bath_towel_large.png','Bathware',100),
 (44,'Handloom','Hand made loom','400.00','images/menscloth.png','Handloom',30),
 (45,'Set of accessories','Hand Made ','200.00','images/jewel.png','Accessories',20),
 (46,'Plastic soft toys','set of toys','300.00','images/fdhdgh.png','Soft Toys',40),
 (47,'Jewellery Set','set of jewelleries','5000.00','images/jewel.png','Jewellery Sets',10),
 (48,'Wood Pupet','wood pupet made by hand','300.00','images/pupet.jpg','Wood',20),
 (49,'Red bag','mens bag','2400.00','images/handbag_small.jpg','Bags & Pouches',28),
 (50,'Leather Wallet','Crocadile Leather Wallet','1000.00','images/blackwallet_small.jpg','Bags & Pouches',9),
 (51,'Test Product','Test Description','2000.00','images/Windows_7_7076_Background_by_Z08_Styles.jpg','Jewellery Sets',100);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `ship_cost`
--

DROP TABLE IF EXISTS `ship_cost`;
CREATE TABLE `ship_cost` (
  `idship_cost` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`idship_cost`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ship_cost`
--

/*!40000 ALTER TABLE `ship_cost` DISABLE KEYS */;
INSERT INTO `ship_cost` (`idship_cost`,`city`,`amount`) VALUES 
 (1,'Galle',150),
 (2,'Colombo',100),
 (3,'Matara',200),
 (4,'Moratuwa',50),
 (5,'Sri Jayawardenapura Kotte',100),
 (6,'Negombo',300),
 (7,'Kandy',400),
 (8,'Kalmunai',200),
 (9,'Vavuniya',1000),
 (10,'Trincomalee',1200),
 (11,'Batticaloa',1300),
 (12,'Jaffna',1500),
 (13,'Katunayake',500),
 (14,'Matale',800),
 (15,'Hambantota',250),
 (16,'Mathugama',130);
/*!40000 ALTER TABLE `ship_cost` ENABLE KEYS */;


--
-- Definition of table `sub_menu_items`
--

DROP TABLE IF EXISTS `sub_menu_items`;
CREATE TABLE `sub_menu_items` (
  `idsub_menu_items` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `menu_item_idmenu_item` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idsub_menu_items`),
  KEY `fk_sub_menu_items_menu_item` (`menu_item_idmenu_item`),
  CONSTRAINT `fk_sub_menu_items_menu_item` FOREIGN KEY (`menu_item_idmenu_item`) REFERENCES `menu_item` (`idmenu_item`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_menu_items`
--

/*!40000 ALTER TABLE `sub_menu_items` DISABLE KEYS */;
INSERT INTO `sub_menu_items` (`idsub_menu_items`,`name`,`menu_item_idmenu_item`,`url`) VALUES 
 (1,'Bags & Pouches',1,'cattest.jsp'),
 (2,'Furniture',1,'cattest.jsp'),
 (3,'Ceramics',1,'cattest.jsp'),
 (4,'Gems',2,'cattest.jsp'),
 (5,'Jewellery Sets',2,'cattest.jsp'),
 (6,'Necklaces & Pendants',2,'cattest.jsp'),
 (7,'Bangles & Bracelets',2,'cattest.jsp'),
 (8,'Earrings',2,'cattest.jsp'),
 (10,'Rush & Reedware',3,'cattest.jsp'),
 (11,'Wood',3,'cattest.jsp'),
 (12,'Paper Mache',3,'cattest.jsp'),
 (13,'Brass',3,'cattest.jsp'),
 (14,'Oxidised',3,'cattest.jsp'),
 (15,'Silver',3,'cattest.jsp'),
 (16,'Copper',3,'cattest.jsp'),
 (17,'Tea',4,'cattest.jsp'),
 (18,'Spices',4,'cattest.jsp'),
 (19,'Cashew',4,'cattest.jsp'),
 (20,'Batik',5,'cattest.jsp'),
 (21,'Handloom',5,'cattest.jsp'),
 (22,'Bathware',5,'cattest.jsp'),
 (23,'Accessories',5,'cattest.jsp'),
 (24,'Soft Toys',5,'cattest.jsp');
/*!40000 ALTER TABLE `sub_menu_items` ENABLE KEYS */;


--
-- Definition of table `user_reg`
--

DROP TABLE IF EXISTS `user_reg`;
CREATE TABLE `user_reg` (
  `iduser_reg` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `fax` varchar(25) NOT NULL,
  `address_one` text NOT NULL,
  `address_two` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `post_code` varchar(30) NOT NULL,
  `country` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser_reg`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_reg`
--

/*!40000 ALTER TABLE `user_reg` DISABLE KEYS */;
INSERT INTO `user_reg` (`iduser_reg`,`first_name`,`last_name`,`email`,`telephone`,`fax`,`address_one`,`address_two`,`city`,`post_code`,`country`,`password`,`status`) VALUES 
 (1,'Shan','Anushka','anushka.shan7@gmail.com','0715781663','0913782716','Sandakelum','Aluthnuwara Udalamatta','Galle','8080','Sri Lanka','shan','1'),
 (2,'Thanuri','Dilhara','thanurig@gmail.com','0000000000','1111111111','No 24,Pangiriwatta,','Pilimathalawa','Hambantota','10370','Sri Lanka','123','1'),
 (3,'Tharindu','Randunu','tharindu@gmail.com','0715781663','0715781663','Madampe','Katukurunda','Matale','10108','Sri Lanka','12345','1'),
 (4,'Shehara','Jayashan','sheharajayashanfb@gmail.com','0343440558','0783979367','No-86','Kandewattha','Mathugama','KT - 1223','Sri Lanka','123','1');
/*!40000 ALTER TABLE `user_reg` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
