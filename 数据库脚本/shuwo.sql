/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shuwo

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-03-05 14:34:21
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
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'f38292831df4b230cb982bd44d3e7bef');

-- ----------------------------
-- Table structure for bd
-- ----------------------------
DROP TABLE IF EXISTS `bd`;
CREATE TABLE `bd` (
  `bdid` int(11) NOT NULL AUTO_INCREMENT,
  `unionid` varchar(255) NOT NULL,
  `nickname` varchar(32) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `mobile` varchar(16) DEFAULT '',
  `sex` tinyint(1) DEFAULT '0',
  `city` varchar(16) DEFAULT '',
  `province` varchar(16) DEFAULT '',
  `country` varchar(16) DEFAULT '',
  `createdtime` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `openid` varchar(255) DEFAULT '',
  `headimgurl` varchar(255) DEFAULT '',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bd
-- ----------------------------

-- ----------------------------
-- Table structure for bdshop
-- ----------------------------
DROP TABLE IF EXISTS `bdshop`;
CREATE TABLE `bdshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bdid` int(11) NOT NULL DEFAULT '0',
  `shopid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdshop
-- ----------------------------

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
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '苹果类');
INSERT INTO `category` VALUES ('2', '梨类');
INSERT INTO `category` VALUES ('3', '瓜类');
INSERT INTO `category` VALUES ('4', '柑橘橙类');
INSERT INTO `category` VALUES ('5', '桃李类');
INSERT INTO `category` VALUES ('6', '其他');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------

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
  `isfirst` int(3) DEFAULT '0',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('51awd1a5w1d', '1', '2', '1', '0', '888.00', '地址', '15821691728', '2015-02-06 14:03:42', '0.00', '规定的时间', '留言', '用户名称', '原因', '0');
INSERT INTO `orders` VALUES ('58da6w5d4a65wd', '0', '2', '1', '0', '100.00', '地址', '1821742225', '2015-02-06 16:03:48', '0.00', 'awd', 'awd', 'awd', 'sasada', '0');
INSERT INTO `orders` VALUES ('a58wd46a5dadwa', '0', '2', '1', '0', '98.00', '地址', '1521742225', '2015-03-01 15:11:23', '0.00', '规定的时间', '留言', '客户名称', '理由', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '陕西红富士（大）', '', '1', '100', '5.80', '5.50', '1', '1', '个', '200', '1');
INSERT INTO `product` VALUES ('2', '秦冠苹果\r\n\r\n', '', '1', '256', '5.20', '5.00', '1', '1', '个', '150', '1');
INSERT INTO `product` VALUES ('3', '青苹果', '', '1', '198', '1.50', '1.20', '1', '1', '个', '150', '2');
INSERT INTO `product` VALUES ('4', '嘎啦果', '', '1', '519', '2.50', '2.20', '1', '1', '个', '175', '2');
INSERT INTO `product` VALUES ('5', '黄金帅苹果 ', '', '1', '520', '5.80', '5.20', '1', '1', '个', '164', '3');
INSERT INTO `product` VALUES ('6', '雪梨', '', '1', '624', '2.80', '2.50', '1', '1', '个', '200', '4');
INSERT INTO `product` VALUES ('7', '蜜梨（皇冠梨）', '', '1', '629', '2.00', '1.80', '1', '1', '个', '200', '4');
INSERT INTO `product` VALUES ('8', '水晶梨1', '', '1', '263', '2.00', '1.80', '1', '1', '个', '182', '4');
INSERT INTO `product` VALUES ('9', '芦柑', '', '1', '851', '5.80', '5.50', '4', '4', '根', '0', '3');
INSERT INTO `product` VALUES ('10', '海南菠萝', '', '0', '562', '2.50', '0.00', '1', '6', '个', '700', '5');
INSERT INTO `product` VALUES ('11', '台湾橄榄', '', '1', '8555', '15.00', '0.00', '3', '6', '盒', '0', '5');
INSERT INTO `product` VALUES ('12', '砂糖桔', '', '1', '7415', '6.80', '6.20', '2', '6', '克', '50', '5');

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
-- Records of shippingaddress
-- ----------------------------
INSERT INTO `shippingaddress` VALUES ('6', '1', 'wnag', '', '', '', '', '', '0');
INSERT INTO `shippingaddress` VALUES ('7', '1', 'wang', '', '', '', '', '', '0');
INSERT INTO `shippingaddress` VALUES ('8', '1', 'wang', '上海', '', '', '', '', '0');
INSERT INTO `shippingaddress` VALUES ('9', '1', 'wang', '上海', '上海', '', '', '', '0');
INSERT INTO `shippingaddress` VALUES ('10', '1', 'wang', '上海', '上海', '上海', '', '', '0');
INSERT INTO `shippingaddress` VALUES ('11', '1', 'wang', '南翔', '上海', '广州', '南翔', '15821691728\r\n', '1');
INSERT INTO `shippingaddress` VALUES ('12', '1', 'wang', '南翔', '上海', '上海', '南翔', '15821691728\r\n', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '', '南翔镇古猗园东北方向民主东街78-80', '', '佳远水果店', '李大牛', '15821691728', '31.300663', '121.323178', 'wtw60f0gdfqret9nn', '上海', '嘉定区', '南翔镇', '本店绝对值得关注', '12', '1');
INSERT INTO `shop` VALUES ('2', '', '德华社区德华路332号', '', '德华水果店', '李二牛', '13838137911', '31.301179', '121.319461', 'wtw60dnns6dv8rwgd', '上海', '嘉定区', '南翔镇', '相信我们绝对是首选', '10', '1');
INSERT INTO `shop` VALUES ('3', '', '德园社区德华路456', '', '乡巴佬水果店(德华路店)', '媚娘', '18239260081', '31.300153', '121.317207', 'wtw60dh2xg6j3vjeq', '上海', '嘉定区', '南翔镇', '我们值得信赖', '16', '0');
INSERT INTO `shop` VALUES ('4', '', '德园社区德园路337号', '', '小郭水果超市', '小郭', '15537618477', '31.300408', '121.315492', 'wtw60d54pfgq83mus', '上海', '嘉定区', '南翔镇', '凸比难保完', '6', '0');
INSERT INTO `shop` VALUES ('5', '', '翔华社区靠近南翔镇火车站路108号', '', '翔华水果店', '啊翔', '13838137911', '31.291413', '121.313805', 'wtw6086j8w1m70cmr', '上海', '嘉定区', '南翔镇', '维瑞古德', '9', '0');
INSERT INTO `shop` VALUES ('6', '', '上海市普陀区宜川路街道中远两湾城第一西方向靠近中潭路65号', '', '中潭水果店', '倪三妮', '15000933310', '31.25852', '121.449285', 'wtw3gdkwj6qwcu82n', '上海', '普陀区', '宜川路', '吼吼吼', '8', '1');
INSERT INTO `shop` VALUES ('7', '', '上海市虹口区曲阳路街道上农一西南方向靠近中山北一路652-3临', '', '胖子精品水果店 ', '胖纸', '13162344458', '31.289122', '121.489802', 'wtw6h840me44zjc3d', '上海', '虹口区', '曲阳路', '胖纸都是潜力股', '8', '1');
INSERT INTO `shop` VALUES ('8', '', '上海市普陀区桃浦镇李子园六村东方向靠近真南路215', '', '绿缘水果店', '媛媛', '13761902139', '31.27437', '121.402472', 'wtw3ft6d6th7b467m', '上海', '普陀区', '桃浦镇李子园六村', '缘来是你', '12', '1');

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
  `openid` varchar(255) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `roles` tinyint(2) DEFAULT '0',
  `shopid` int(11) DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'uninonid', 'test', '', '', '0', '上海', '上海', '中国', '2015-02-03 17:09:37', 'openid', 'http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46', '0', '0');
INSERT INTO `user` VALUES ('2', 'shopuninonid', 'testshop', '', '', '1', '上海', '上海', '中国', '2015-02-03 17:09:49', 'shopopenid', 'http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46', '1', '1');

-- ----------------------------
-- Table structure for weixinshop
-- ----------------------------
DROP TABLE IF EXISTS `weixinshop`;
CREATE TABLE `weixinshop` (
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `accesstoken` text,
  `weiid` varchar(255) DEFAULT '',
  `expires` varchar(255) DEFAULT '',
  `id` int(11) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixinshop
-- ----------------------------

-- ----------------------------
-- Table structure for weixinuser
-- ----------------------------
DROP TABLE IF EXISTS `weixinuser`;
CREATE TABLE `weixinuser` (
  `appid` varchar(255) DEFAULT '',
  `appsecret` varchar(255) DEFAULT '',
  `accesstoken` text,
  `weiid` varchar(255) DEFAULT '',
  `expires` varchar(255) DEFAULT '',
  `id` int(11) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixinuser
-- ----------------------------

-- ----------------------------
-- Function structure for GETDISTANCE
-- ----------------------------
DROP FUNCTION IF EXISTS `GETDISTANCE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GETDISTANCE`(lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS double
BEGIN
	DECLARE RAD DOUBLE;
 
DECLARE EARTH_RADIUS DOUBLE DEFAULT 6378137;
 
DECLARE radLat1 DOUBLE;
 
DECLARE radLat2 DOUBLE;
 
DECLARE radLng1 DOUBLE;
 
DECLARE radLng2 DOUBLE;
 
DECLARE s INT;
 
SET RAD = PI() / 180.0;
 
SET radLat1 = lat1 * RAD;
 
SET radLat2 = lat2 * RAD;
 
SET radLng1 = lng1 * RAD;
 
SET radLng2 = lng2 * RAD;
 
SET s = ACOS(COS(radLat1)*COS(radLat2)*COS(radLng1-radLng2)+SIN(radLat1)*SIN(radLat2))*EARTH_RADIUS;
 
SET s = ROUND(s * 10000) / 10000;
 
RETURN s;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for NewProc
-- ----------------------------
DROP FUNCTION IF EXISTS `NewProc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `NewProc`(lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS double
BEGIN
	DECLARE RAD DOUBLE;
 
DECLARE EARTH_RADIUS DOUBLE DEFAULT 6378137;
 
DECLARE radLat1 DOUBLE;
 
DECLARE radLat2 DOUBLE;
 
DECLARE radLng1 DOUBLE;
 
DECLARE radLng2 DOUBLE;
 
DECLARE s DOUBLE;
 
SET RAD = PI() / 180.0;
 
SET radLat1 = lat1 * RAD;
 
SET radLat2 = lat2 * RAD;
 
SET radLng1 = lng1 * RAD;
 
SET radLng2 = lng2 * RAD;
 
SET s = ACOS(COS(radLat1)*COS(radLat2)*COS(radLng1-radLng2)+SIN(radLat1)*SIN(radLat2))*EARTH_RADIUS;
 
SET s = ROUND(s * 10000) / 10000;

	RETURN s;
END
;;
DELIMITER ;
