/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : shuwo

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-01-22 10:54:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) NOT NULL,
  `attribute` int(11) NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` varchar(32) NOT NULL DEFAULT '',
  `orderstatus` int(10) unsigned zerofill NOT NULL,
  `userid` int(11) NOT NULL,
  `createdtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `paystatus` int(11) DEFAULT NULL,
  `totalprice` decimal(10,0) DEFAULT NULL,
  `shopid` int(11) NOT NULL,
  `useraddresss` varchar(255) DEFAULT NULL,
  `userphone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderid`,`ordernum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `orderproduct`
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `quanlity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `discountprice` float DEFAULT NULL,
  `issale` tinyint(4) DEFAULT NULL,
  `num` int(32) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for `productcategory`
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
-- Records of productcategory
-- ----------------------------

-- ----------------------------
-- Table structure for `shippingaddress`
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
  CONSTRAINT `shippingaddress_ibfk_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shippingaddress
-- ----------------------------

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(16) NOT NULL DEFAULT '',
  `shopunionid` varchar(255) NOT NULL DEFAULT '',
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
  `notice` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------

-- ----------------------------
-- Table structure for `shopproduct`
-- ----------------------------
DROP TABLE IF EXISTS `shopproduct`;
CREATE TABLE `shopproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopproduct
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
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
  `createdtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
