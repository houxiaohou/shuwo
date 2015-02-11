/*
Navicat MySQL Data Transfer

Source Server         : shuwo
Source Server Version : 50541
Source Host           : www.shuwow.com:3306
Source Database       : shuwo

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-02-11 14:35:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) DEFAULT '',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderproduct
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(32) DEFAULT '',
  `productid` int(11) DEFAULT '0',
  `quantity` int(11) DEFAULT '0',
  `realweight` int(10) DEFAULT '0',
  `realprice` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` varchar(32) NOT NULL,
  `orderstatus` int(3) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  `shopid` int(11) NOT NULL DEFAULT '0',
  `paystatus` int(11) DEFAULT '0',
  `totalprice` decimal(10,2) DEFAULT '0.00',
  `address` text,
  `phone` varchar(255) DEFAULT '',
  `createdtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rtotalprice` decimal(10,2) DEFAULT '0.00',
  `dltime` varchar(32) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT '',
  `ordernotes` varchar(255) DEFAULT '',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) DEFAULT '',
  `pimgurl` varchar(255) DEFAULT '',
  `issale` tinyint(2) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `price` decimal(5,2) DEFAULT '0.00',
  `discount` decimal(5,2) DEFAULT '0.00',
  `attribute` int(3) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `unit` varchar(255) DEFAULT '',
  `unitweight` int(6) DEFAULT '0',
  `shopid` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shippingaddress
-- ----------------------------
DROP TABLE IF EXISTS `shippingaddress`;
CREATE TABLE `shippingaddress` (
  `said` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(16) DEFAULT '',
  `province` varchar(32) DEFAULT '',
  `city` varchar(32) DEFAULT '',
  `district` varchar(32) DEFAULT '',
  `address` varchar(64) DEFAULT '',
  `mobile` varchar(16) DEFAULT '',
  `isdefault` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`said`),
  KEY `shippingaddress_ibfk_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shopid` int(11) NOT NULL AUTO_INCREMENT,
  `shopsn` varchar(16) NOT NULL DEFAULT '',
  `spadr` varchar(255) DEFAULT '',
  `simgurl` varchar(255) DEFAULT '',
  `spn` varchar(32) DEFAULT '',
  `contacts` varchar(8) DEFAULT '',
  `phone` varchar(16) DEFAULT '',
  `lat` double NOT NULL DEFAULT '0',
  `lng` double NOT NULL DEFAULT '0',
  `geohash` varchar(32) NOT NULL DEFAULT '',
  `city` varchar(16) DEFAULT '',
  `district` varchar(16) DEFAULT '',
  `province` varchar(16) DEFAULT '',
  `notice` text,
  `dlprice` int(3) DEFAULT '0',
  `isopen` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `unionid` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(32) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `mobile` varchar(16) DEFAULT '',
  `sex` tinyint(1) unsigned zerofill DEFAULT '0',
  `city` varchar(16) DEFAULT '',
  `province` varchar(16) DEFAULT '',
  `country` varchar(16) DEFAULT '',
  `createdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `openid` varchar(255) DEFAULT '',
  `headimgurl` varchar(255) DEFAULT NULL,
  `roles` tinyint(2) DEFAULT '0',
  `shopid` int(11) DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weixinshop
-- ----------------------------
DROP TABLE IF EXISTS `weixinshop`;
CREATE TABLE `weixinshop` (
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `accesstoken` text,
  `weiid` varchar(255) DEFAULT '',
  `expires` int(11) DEFAULT '0',
  `id` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weixinuser
-- ----------------------------
DROP TABLE IF EXISTS `weixinuser`;
CREATE TABLE `weixinuser` (
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `accesstoken` text,
  `weiid` varchar(255) DEFAULT '',
  `expires` int(11) DEFAULT '0',
  `id` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Function structure for GETDISTANCE
-- ----------------------------
DROP FUNCTION IF EXISTS `GETDISTANCE`;
DELIMITER ;;

;;
DELIMITER ;

-- ----------------------------
-- Function structure for NewProc
-- ----------------------------
DROP FUNCTION IF EXISTS `NewProc`;
DELIMITER ;;

;;
DELIMITER ;
