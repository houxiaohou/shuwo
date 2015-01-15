/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shuwo

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-01-15 14:36:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `OrderID` varchar(32) NOT NULL,
  `OrderStatus` int(10) unsigned zerofill NOT NULL,
  `UserID` int(11) NOT NULL,
  `PaymentStatus` int(11) unsigned zerofill NOT NULL,
  `CreatedTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shippingaddress
-- ----------------------------
DROP TABLE IF EXISTS `shippingaddress`;
CREATE TABLE `shippingaddress` (
  `SAID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `UserName` varchar(8) DEFAULT NULL,
  `Province` varchar(32) DEFAULT NULL,
  `City` varchar(32) DEFAULT NULL,
  `Distinct` varchar(32) DEFAULT NULL,
  `Address` varchar(64) DEFAULT NULL,
  `Mobile` varchar(16) DEFAULT NULL,
  `IsDefault` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`SAID`),
  KEY `shippingaddress_ibfk_userid` (`UserID`),
  CONSTRAINT `shippingaddress_ibfk_userid` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `ShopID` varchar(16) NOT NULL,
  `ShopAddress` varchar(255) DEFAULT NULL,
  `ShopName` varchar(32) DEFAULT NULL,
  `ContactName` varchar(8) DEFAULT NULL,
  `ContactPhone` varchar(16) DEFAULT NULL,
  `Latitude` double NOT NULL,
  `Longitude` double NOT NULL,
  `GeoHash` varchar(32) NOT NULL,
  `City` varchar(16) DEFAULT NULL,
  `Distinct` varchar(16) DEFAULT NULL,
  `Province` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ShopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UnionID` varchar(255) NOT NULL,
  `Name` varchar(32) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Mobile` varchar(16) DEFAULT NULL,
  `Sex` int(11) unsigned zerofill DEFAULT '00000000000',
  `City` varchar(8) DEFAULT NULL,
  `Province` varchar(8) DEFAULT NULL,
  `Country` varchar(8) DEFAULT NULL,
  `CreatedTime` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
