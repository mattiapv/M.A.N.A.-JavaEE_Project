-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idBuyer` int(11) NOT NULL,
  `buyerName` varchar(90) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idBuyerOrders_idx` (`idBuyer`),
  CONSTRAINT `idBuyerOrders` FOREIGN KEY (`idBuyer`) REFERENCES `USERS` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORDER_PRODUCTS`
--

DROP TABLE IF EXISTS `ORDER_PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_PRODUCTS` (
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderStatus` int(11) NOT NULL DEFAULT '5',
  `buyerReadNot` tinyint(4) NOT NULL DEFAULT '1',
  `sellerReadNot` tinyint(4) NOT NULL DEFAULT '0',
  `adminReadNot` tinyint(4) NOT NULL DEFAULT '0',
  `problemDescription` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`orderid`,`productid`),
  KEY `productid_idx` (`productid`),
  CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `ORDERS` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productid` FOREIGN KEY (`productid`) REFERENCES `PRODUCTS` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PICTURES`
--

DROP TABLE IF EXISTS `PICTURES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PICTURES` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `id_Product` int(11) DEFAULT NULL,
  `id_Owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product_pictures_idx` (`id_Product`),
  KEY `id_product_owner_idx` (`id_Owner`),
  CONSTRAINT `id_product_owner` FOREIGN KEY (`id_Owner`) REFERENCES `USERS` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_product_pictures` FOREIGN KEY (`id_Product`) REFERENCES `PRODUCTS` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRODUCTS`
--

DROP TABLE IF EXISTS `PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(600) NOT NULL,
  `price` double DEFAULT NULL,
  `id_shop` int(11) DEFAULT NULL,
  `categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_shop_idx` (`id_shop`),
  KEY `id_shop_products` (`id_shop`),
  CONSTRAINT `id_shop_products` FOREIGN KEY (`id_shop`) REFERENCES `SHOPS` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REVIEWS`
--

DROP TABLE IF EXISTS `REVIEWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REVIEWS` (
  `id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `id_creator` int(11) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idCreatorReviews_idx` (`id_creator`),
  KEY `idProductReviews_idx` (`id_product`),
  CONSTRAINT `idCreatorReviews` FOREIGN KEY (`id_creator`) REFERENCES `USERS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idProductReviews` FOREIGN KEY (`id_product`) REFERENCES `PRODUCTS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHOPS`
--

DROP TABLE IF EXISTS `SHOPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHOPS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `web_Site_Url` varchar(150) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `id_Owner` int(11) DEFAULT NULL,
  `id_Creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Owner_idx` (`id_Owner`),
  KEY `id_Creator_idx` (`id_Creator`),
  CONSTRAINT `id_Creator` FOREIGN KEY (`id_Creator`) REFERENCES `USERS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_Owner` FOREIGN KEY (`id_Owner`) REFERENCES `USERS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'registrato',
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `USERS_PICTURES`
--

DROP TABLE IF EXISTS `USERS_PICTURES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS_PICTURES` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `id_Product` int(11) NOT NULL,
  `id_Owner` int(11) NOT NULL,
  `nameOwner` varchar(90) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UsersPictutresidProduct_idx` (`id_Product`),
  KEY `UsersPictutresidProduct_idx1` (`id_Owner`),
  CONSTRAINT `UserPicturesOwner` FOREIGN KEY (`id_Owner`) REFERENCES `USERS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UsersPictutresidProduct` FOREIGN KEY (`id_Product`) REFERENCES `PRODUCTS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-24 11:43:04
