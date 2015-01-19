/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shuwo

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-01-19 09:44:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) NOT NULL,
  `attribute` int(11) NOT NULL,
  PRIMARY KEY (`categoryid`,`categoryname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` varchar(32) NOT NULL,
  `orderstatus` int(10) unsigned zerofill NOT NULL,
  `userid` int(11) NOT NULL,
  `createdtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` int(11) NOT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `discountprice` float DEFAULT NULL,
  `issale` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for productcategory
-- ----------------------------
DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE `productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `unitweight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shippingaddress
-- ----------------------------
DROP TABLE IF EXISTS `shippingaddress`;
CREATE TABLE `shippingaddress` (
  `said` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(8) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `distint` varchar(32) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `isdefault` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`said`),
  KEY `shippingaddress_ibfk_userid` (`userid`),
  CONSTRAINT `shippingaddress_ibfk_userid` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shopid` varchar(16) NOT NULL,
  `shopaddress` varchar(255) DEFAULT NULL,
  `shopname` varchar(32) DEFAULT NULL,
  `contactname` varchar(8) DEFAULT NULL,
  `contactphone` varchar(16) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `geohash` varchar(32) NOT NULL,
  `city` varchar(16) DEFAULT NULL,
  `distinct` varchar(16) DEFAULT NULL,
  `province` varchar(16) DEFAULT NULL,
  `annoucement` text,
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `unionid` varchar(255) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `sex` int(11) unsigned zerofill DEFAULT '00000000000',
  `city` varchar(8) DEFAULT NULL,
  `province` varchar(8) DEFAULT NULL,
  `country` varchar(8) DEFAULT NULL,
  `createdtime` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
