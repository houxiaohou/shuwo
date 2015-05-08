/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shuwo

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-05-08 14:00:43
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
-- Table structure for bag
-- ----------------------------
DROP TABLE IF EXISTS `bag`;
CREATE TABLE `bag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `used` tinyint(2) DEFAULT '0',
  `type` tinyint(2) DEFAULT '0',
  `shop_id` int(11) DEFAULT '0',
  `expires` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bag
-- ----------------------------
INSERT INTO `bag` VALUES ('1', '2', '0', '0', '0', '2015-04-29 14:38:25', '0');
INSERT INTO `bag` VALUES ('2', '2', '1', '0', '0', '2015-04-28 14:27:25', '0');
INSERT INTO `bag` VALUES ('3', '2', '0', '0', '0', '2015-04-29 15:10:12', '0');

-- ----------------------------
-- Table structure for bd
-- ----------------------------
DROP TABLE IF EXISTS `bd`;
CREATE TABLE `bd` (
  `bdid` int(11) NOT NULL AUTO_INCREMENT,
  `unionid` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(32) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `mobile` varchar(16) DEFAULT '',
  `sex` tinyint(1) DEFAULT '0',
  `city` varchar(16) DEFAULT '',
  `province` varchar(16) DEFAULT '',
  `country` varchar(16) DEFAULT '',
  `createdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `openid` varchar(255) DEFAULT '',
  `headimgurl` varchar(255) DEFAULT '',
  `bdname` varchar(255) DEFAULT '',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bd
-- ----------------------------
INSERT INTO `bd` VALUES ('1', '', 'dx', '', '', '0', '', '', '', '2015-03-18 16:09:11', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '苹果类1');
INSERT INTO `category` VALUES ('2', '梨类');
INSERT INTO `category` VALUES ('3', '瓜类');
INSERT INTO `category` VALUES ('4', '柑橘橙类');
INSERT INTO `category` VALUES ('5', '桃李类');
INSERT INTO `category` VALUES ('6', '其他');
INSERT INTO `category` VALUES ('7', '蔬菜');

-- ----------------------------
-- Table structure for categorypic
-- ----------------------------
DROP TABLE IF EXISTS `categorypic`;
CREATE TABLE `categorypic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL DEFAULT '0',
  `imgurl` varchar(255) NOT NULL DEFAULT '',
  `des` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorypic
-- ----------------------------
INSERT INTO `categorypic` VALUES ('1', '1', '123', '用着很方');
INSERT INTO `categorypic` VALUES ('3', '1', 'adw', '是的');
INSERT INTO `categorypic` VALUES ('4', '2', '阿斯达', '谁打我');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------
INSERT INTO `orderproduct` VALUES ('1', '12', '1', '1', '1', '1.00');

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
  `bag_amount` int(11) DEFAULT '0',
  `bag_id` int(11) DEFAULT '0',
  `ispickup` tinyint(2) DEFAULT '0',
  `isdelivery` tinyint(2) DEFAULT '0',
  `discount` int(11) DEFAULT '0',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('51awd1a5w1d', '1', '2', '1', '0', '888.00', '地址', '15821691728', '2015-02-06 14:03:42', '0.00', '规定的时间', '留言', '用户名称', '原因', '0', '0', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('58da6w5d4a65wd', '0', '2', '1', '0', '100.00', '地址', '1821742225', '2015-02-06 16:03:48', '0.00', 'awd', 'awd', 'awd', 'sasada', '0', '0', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('a58wd46a5dadwa', '0', '2', '1', '0', '98.00', '地址', '1521742225', '2015-03-01 15:11:23', '0.00', '规定的时间', '留言', '客户名称', '理由', '0', '0', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

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
INSERT INTO `product` VALUES ('11', '台湾橄榄', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ih5sr4u1iuqsr398d16akalnu.bmp', '1', '8555', '15.00', '0.00', '3', '6', '盒', '0', '15');
INSERT INTO `product` VALUES ('12', '砂糖桔', '', '1', '7415', '6.80', '6.20', '2', '6', '克', '50', '15');
INSERT INTO `product` VALUES ('13', '测试', '', '1', '0', '50.00', '50.00', '1', '1', '个', '10', '15');
INSERT INTO `product` VALUES ('33', '你好', '', '1', '0', '0.00', '0.00', '1', '1', '', '0', '0');
INSERT INTO `product` VALUES ('34', '你好1', '', '1', '0', '0.00', '0.00', '1', '1', '', '0', '15');
INSERT INTO `product` VALUES ('35', '到十分', '', '1', '0', '0.00', '0.00', '1', '1', '', '0', '15');
INSERT INTO `product` VALUES ('36', '代购费', '', '1', '0', '0.00', '0.00', '1', '1', '', '0', '15');
INSERT INTO `product` VALUES ('37', '发给', '', '1', '0', '0.00', '0.00', '1', '1', '', '0', '15');
INSERT INTO `product` VALUES ('38', '梵蒂冈', '', '1', '0', '13.00', '21.00', '1', '1', '个', '50', '15');
INSERT INTO `product` VALUES ('39', '你阿华', '', '1', '0', '15.00', '12.00', '2', '1', '个', '0', '15');
INSERT INTO `product` VALUES ('40', '我去', '', '1', '0', '35.00', '34.00', '1', '1', '盒', '30', '15');
INSERT INTO `product` VALUES ('41', '2', '', '0', '0', '2.00', '2.00', '1', '1', '3', '2', '15');
INSERT INTO `product` VALUES ('42', '天然', '', '1', '0', '3.00', '1.00', '2', '4', '3', '0', '15');
INSERT INTO `product` VALUES ('43', '2', '', '1', '0', '2.00', '12.00', '2', '1', '3', '0', '15');
INSERT INTO `product` VALUES ('44', '3', '', '1', '0', '2.00', '2.00', '1', '1', '', '0', '15');
INSERT INTO `product` VALUES ('45', '3', '', '1', '0', '2.00', '2.00', '1', '1', '2', '30', '15');
INSERT INTO `product` VALUES ('46', '2', '', '1', '0', '50.00', '20.00', '1', '2', '个', '20', '15');
INSERT INTO `product` VALUES ('47', '8', '', '1', '0', '8.00', '8.00', '1', '1', '8', '8', '15');
INSERT INTO `product` VALUES ('48', '9', 'http://7u2out.com1.z0.glb.clouddn.com/o_19irds4ta11391v9422j12qeu1sn.jpg', '1', '0', '9.00', '9.00', '1', '1', '9', '9', '15');
INSERT INTO `product` VALUES ('49', '10', 'http://7u2out.com1.z0.glb.clouddn.com/o_19irdueod8rredt11no970fb19.jpg', '1', '0', '10.00', '10.00', '1', '1', '10', '10', '15');

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
  `isdiscount` tinyint(2) DEFAULT '0',
  `discount` int(3) DEFAULT '0',
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('13', 're13', '德园路616', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dr6qrrc1v22n4vtsk1f27s4v9.jpg', '阿q果园子', '夏老板', '18321940791', '31.304237', '121.313583', 'wtw60dcb7kez', '上海', '嘉定南翔', '上海', '精品水果，味美鲜甜，欢迎新老顾客品尝。价格和实体店同步精品水果，味美鲜甜，欢迎新老顾客品尝。价格和实体店同步精品水果，味美鲜甜，欢迎新老顾客品尝。价格和实体店同步精品水果，味美鲜甜，欢迎新老顾客品尝。价格和实体店同步', '40', '1', '1', '5');
INSERT INTO `shop` VALUES ('14', 'kw14', '栖林路302弄19号', 'http://7u2out.com1.z0.glb.clouddn.com/o_19evs2kl81h3r18pd11el1thj1mo3g.jpg', '宝群果业', '周老板', '18721178165', '31.314935', '121.325683', 'wtw60udwtqfp', '上海', '嘉定南翔', '上海', '本店出售各类精品水果，本店出售各类精品水果，欢迎广大顾客前来品尝。价格和实体店同步本店出售各类精品水果，欢迎广大顾客前来品尝。价格和实体店同步本店出售各类精品水果，欢迎广大顾客前来品尝。价格和实体店同步本店出售各类精品水果，欢迎广大顾客前来品尝。价格和实体店同步本店出售各类精品水果，欢迎广大顾客前来品尝。价格和实体店同步欢迎广大顾客前来品尝。价格和实体店同步本店出售各类精品水果，欢迎广大顾客前来品尝。价格和实体店同步本店出售各类精品水果，欢迎广大顾客前来品尝。价格和实体店同步本店出售各类精品水果，欢迎广大顾客前来品尝。价格和实体店同步本店出售各类精品水果，欢迎广大顾客前来品尝。价格和实体店同步 ', '40', '1', '1', '10');
INSERT INTO `shop` VALUES ('15', 'ls15', '北京市景山前街4号', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dts4l4cce21bgfake1cimu3i9.jpg', '树窝水果直营店', '壁垒', '13918210924', '40.00205', '116.327985', 'wx4ex45kyd86', '北京', '故宫', '北京', '壁垒！', '30', '1', '0', '0');
INSERT INTO `shop` VALUES ('16', 'wu16', '桃浦新村绿杨路76号', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g3tmr8rsck1ive6fhgt9ju19.jpg', '百家乐果园', '蔡老板', '13817715984', '31.289858', '121.352377', 'wtw612nhek69', '上海', '桃浦', '上海', '精品水果，味美鲜甜，欢迎新老顾客品尝，还有干货和小零食噢，价格和实体店同步', '30', '1', '0', '0');
INSERT INTO `shop` VALUES ('17', 'jh17', '南翔', '', '士大夫', '歹', '15502187076', '31.245581', '121.486749', 'wtw3u2pfwqmw', '上海', '嘉定', '上海', '你好', '15', '0', '0', '0');

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
  `id` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixinshop
-- ----------------------------
INSERT INTO `weixinshop` VALUES ('wx17a8c83f5b2f6540', '432fb4827de4de9c2038ebcd2c5f064a', 'dwSIoZz_eXHwp7NLK-xmy9A7Gi7l4e-0iimFySdT4xGFWyID5kBxyfcSNZlZe6MRENI0mrluYhNDs1rvjCzJvbY6O25HHUIvye3ZzZTMLMc', '', '1429089678', 'wxshop');

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
