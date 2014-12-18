/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shuwo

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-12-18 19:22:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banktype
-- ----------------------------
DROP TABLE IF EXISTS `banktype`;
CREATE TABLE `banktype` (
  `BankTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `BankName` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`BankTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `CategoryDescription` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `CouponID` varchar(32) CHARACTER SET utf8 NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderID` varchar(32) CHARACTER SET utf8 NOT NULL,
  `Isvalid` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CouponID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupontype
-- ----------------------------
DROP TABLE IF EXISTS `coupontype`;
CREATE TABLE `coupontype` (
  `CouponTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `CouponType` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CouponTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for express
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `ExpressID` int(11) NOT NULL AUTO_INCREMENT,
  `ExpCompany` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ExpressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `OrderID` varchar(32) CHARACTER SET utf8 NOT NULL,
  `OrderStatus` int(10) unsigned zerofill NOT NULL,
  `UserID` int(11) NOT NULL,
  `PaymentStatus` int(11) unsigned zerofill NOT NULL,
  `CreatedTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderexpress
-- ----------------------------
DROP TABLE IF EXISTS `orderexpress`;
CREATE TABLE `orderexpress` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` varchar(32) CHARACTER SET utf8 NOT NULL,
  `ExpressID` int(11) NOT NULL,
  `ExpressNum` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `orderexpress_ibfk_orderid` (`OrderID`),
  KEY `orderexpress_ibfk_expressid` (`ExpressID`),
  CONSTRAINT `orderexpress_ibfk_expressid` FOREIGN KEY (`ExpressID`) REFERENCES `express` (`ExpressID`) ON DELETE CASCADE,
  CONSTRAINT `orderexpress_ibfk_orderid` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderproduct
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` varchar(32) CHARACTER SET utf8 NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `orderproduct_ibfk_orderid` (`OrderID`),
  KEY `orderproduct_ibfk_productid` (`ProductID`),
  CONSTRAINT `orderproduct_ibfk_productid` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE,
  CONSTRAINT `orderproduct_ibfk_orderid` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(32) CHARACTER SET utf8 NOT NULL,
  `Code` varchar(32) CHARACTER SET utf8 NOT NULL,
  `Description` text,
  `ImagePath` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ImageNum` int(11) DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `SKU` int(11) DEFAULT NULL,
  `IsDesSKU` tinyint(4) unsigned DEFAULT '0',
  `SKUStatus` int(11) unsigned zerofill DEFAULT NULL,
  `CreatedTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for productcategory
-- ----------------------------
DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE `productcategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `productcategory_ibfk_productID` (`ProductID`),
  KEY `productcategory_ibfk_category` (`CategoryID`),
  CONSTRAINT `productcategory_ibfk_category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE,
  CONSTRAINT `productcategory_ibfk_productID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for productcoupontype
-- ----------------------------
DROP TABLE IF EXISTS `productcoupontype`;
CREATE TABLE `productcoupontype` (
  `ID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `CouponTypeID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `productcoupontype_ibfk_productid` (`ProductID`),
  KEY `productcoupontype_ibfk_couptype` (`CouponTypeID`),
  CONSTRAINT `productcoupontype_ibfk_couptype` FOREIGN KEY (`CouponTypeID`) REFERENCES `coupontype` (`CouponTypeID`) ON DELETE CASCADE,
  CONSTRAINT `productcoupontype_ibfk_productid` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shippingaddress
-- ----------------------------
DROP TABLE IF EXISTS `shippingaddress`;
CREATE TABLE `shippingaddress` (
  `SAID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `UserName` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `Province` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `City` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Distinct` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Address` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Mobile` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
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
  `ShopID` varchar(16) CHARACTER SET utf8 NOT NULL,
  `ShopAddress` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ShopName` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `ContactName` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `ContactPhone` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `AlipayNum` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `TenpayNum` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ShopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shopbanktype
-- ----------------------------
DROP TABLE IF EXISTS `shopbanktype`;
CREATE TABLE `shopbanktype` (
  `ID` int(11) NOT NULL,
  `ShopID` varchar(16) CHARACTER SET utf8 NOT NULL,
  `BankTypeID` int(11) NOT NULL,
  `BankNum` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `shopbanktype_ibfk_shopid` (`ShopID`),
  KEY `shopbanktype_ibfk_banktypeid` (`BankTypeID`),
  CONSTRAINT `shopbanktype_ibfk_banktypeid` FOREIGN KEY (`BankTypeID`) REFERENCES `banktype` (`BankTypeID`) ON DELETE CASCADE,
  CONSTRAINT `shopbanktype_ibfk_shopid` FOREIGN KEY (`ShopID`) REFERENCES `shop` (`ShopID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shopcoupon
-- ----------------------------
DROP TABLE IF EXISTS `shopcoupon`;
CREATE TABLE `shopcoupon` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ShopID` varchar(16) CHARACTER SET utf8 NOT NULL,
  `CouponTypeID` int(11) NOT NULL,
  `CouponPrice` float(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `shopcoupon_ibfk_shopid` (`ShopID`),
  KEY `shopcoupon_ibfk_coupontype` (`CouponTypeID`),
  CONSTRAINT `shopcoupon_ibfk_coupontype` FOREIGN KEY (`CouponTypeID`) REFERENCES `coupontype` (`CouponTypeID`) ON DELETE CASCADE,
  CONSTRAINT `shopcoupon_ibfk_shopid` FOREIGN KEY (`ShopID`) REFERENCES `shop` (`ShopID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usedcoupon
-- ----------------------------
DROP TABLE IF EXISTS `usedcoupon`;
CREATE TABLE `usedcoupon` (
  `CouponID` varchar(32) CHARACTER SET utf8 NOT NULL,
  `ShopID` varchar(16) CHARACTER SET utf8 NOT NULL,
  `WorkerID` varchar(32) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`CouponID`),
  KEY `usedcoupon_ibfk_shopid` (`ShopID`),
  CONSTRAINT `usedcoupon_ibfk_shopid` FOREIGN KEY (`ShopID`) REFERENCES `shop` (`ShopID`) ON DELETE CASCADE,
  CONSTRAINT `usedcoupon_ibfk_coupid` FOREIGN KEY (`CouponID`) REFERENCES `coupon` (`CouponID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UnionID` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Name` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Mobile` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `Sex` int(11) unsigned zerofill DEFAULT '00000000000',
  `City` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `Province` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `Country` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `CreatedTime` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker` (
  `WorkerID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkerName` varchar(16) CHARACTER SET utf8 NOT NULL,
  `WorkerMobile` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`WorkerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for workershop
-- ----------------------------
DROP TABLE IF EXISTS `workershop`;
CREATE TABLE `workershop` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ShopID` varchar(16) CHARACTER SET utf8 NOT NULL,
  `WorkerID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `workershop_ibfk_shopid` (`ShopID`),
  KEY `workershop_ibfk_wokerid` (`WorkerID`),
  CONSTRAINT `workershop_ibfk_wokerid` FOREIGN KEY (`WorkerID`) REFERENCES `worker` (`WorkerID`) ON DELETE CASCADE,
  CONSTRAINT `workershop_ibfk_shopid` FOREIGN KEY (`ShopID`) REFERENCES `shop` (`ShopID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
