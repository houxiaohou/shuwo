/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shuwo

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-04-20 21:29:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
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
-- Table structure for `bd`
-- ----------------------------
DROP TABLE IF EXISTS `bd`;
CREATE TABLE `bd` (
  `bdid` int(11) NOT NULL AUTO_INCREMENT,
  `unionid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `nickname` varchar(32) CHARACTER SET utf8 DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `mobile` varchar(16) CHARACTER SET utf8 DEFAULT '',
  `sex` tinyint(1) DEFAULT '0',
  `city` varchar(16) CHARACTER SET utf8 DEFAULT '',
  `province` varchar(16) CHARACTER SET utf8 DEFAULT '',
  `country` varchar(16) CHARACTER SET utf8 DEFAULT '',
  `createdtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `bdname` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bd
-- ----------------------------
INSERT INTO `bd` VALUES ('2', '', '李玉龙', '', '', '1', '浦东新区', '上海', '中国', '2015-03-06 14:36:01', 'oR-0TuP42xdceesuxsn0GGDH3iuc', '李玉龙');
INSERT INTO `bd` VALUES ('3', '', '繁华背后的落寂', '', '', '1', '徐汇', '上海', '中国', '2015-03-06 20:55:14', 'oR-0TuBMFVWqAjTrRjKFmyCbMxyA', '王磊');
INSERT INTO `bd` VALUES ('4', '', '奔三80', '', '', '1', '娄底', '湖南', '中国', '2015-03-21 15:19:30', 'oR-0TuIdaliZXOtj0cD709cXFkYc', '孙豪泰');
INSERT INTO `bd` VALUES ('5', '', 'Federic-任旺', '', '', '1', '嘉定', '上海', '中国', '2015-03-23 23:42:25', 'oR-0TuFs2bQtxS_nWtLR8Bh_4LdQ', '任旺');
INSERT INTO `bd` VALUES ('6', '', 'Sherlock', '', '', '1', '闵行', '上海', '中国', '2015-03-25 14:14:47', 'oR-0TuHMYMneyVd2RU0zLwbjnY-M', '谢潜');
INSERT INTO `bd` VALUES ('7', '', '胡可明', '', '', '1', '贵港', '广西', '中国', '2015-03-25 15:11:24', 'oR-0TuHTPJnd7nAbzFfDKwjbzPSo', '胡可明');

-- ----------------------------
-- Table structure for `bdshop`
-- ----------------------------
DROP TABLE IF EXISTS `bdshop`;
CREATE TABLE `bdshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bdid` int(11) NOT NULL DEFAULT '0',
  `shopid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bdshop
-- ----------------------------
INSERT INTO `bdshop` VALUES ('2', '2', '12');
INSERT INTO `bdshop` VALUES ('3', '2', '13');
INSERT INTO `bdshop` VALUES ('4', '2', '14');
INSERT INTO `bdshop` VALUES ('6', '3', '15');
INSERT INTO `bdshop` VALUES ('7', '2', '16');
INSERT INTO `bdshop` VALUES ('8', '4', '12');
INSERT INTO `bdshop` VALUES ('9', '4', '13');
INSERT INTO `bdshop` VALUES ('10', '4', '14');
INSERT INTO `bdshop` VALUES ('15', '2', '18');
INSERT INTO `bdshop` VALUES ('16', '4', '18');
INSERT INTO `bdshop` VALUES ('19', '6', '18');

-- ----------------------------
-- Table structure for `category`
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
-- Table structure for `categorypic`
-- ----------------------------
DROP TABLE IF EXISTS `categorypic`;
CREATE TABLE `categorypic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL DEFAULT '0',
  `imgurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `des` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categorypic
-- ----------------------------

-- ----------------------------
-- Table structure for `orderproduct`
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(32) DEFAULT '',
  `productid` int(11) DEFAULT '0',
  `quantity` int(11) DEFAULT '0',
  `realweight` int(10) DEFAULT '0',
  `realprice` decimal(10,1) DEFAULT '0.0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2187 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------
INSERT INTO `orderproduct` VALUES ('465', '2015022653979857', '15', '6', '1760', '20.4');
INSERT INTO `orderproduct` VALUES ('466', '2015022653979857', '35', '6', '1545', '17.9');
INSERT INTO `orderproduct` VALUES ('467', '2015022751541005', '28', '2', '500', '8.8');
INSERT INTO `orderproduct` VALUES ('468', '2015022751541005', '48', '1', '1', '8.0');
INSERT INTO `orderproduct` VALUES ('469', '2015022751541005', '41', '2', '500', '17.8');
INSERT INTO `orderproduct` VALUES ('470', '2015022757529856', '251', '2', '610', '13.2');
INSERT INTO `orderproduct` VALUES ('471', '2015022757529856', '252', '1', '270', '4.2');
INSERT INTO `orderproduct` VALUES ('472', '2015022757529856', '253', '4', '1050', '14.3');
INSERT INTO `orderproduct` VALUES ('473', '2015022748565755', '251', '2', '620', '13.4');
INSERT INTO `orderproduct` VALUES ('474', '2015022748565755', '252', '4', '1100', '17.2');
INSERT INTO `orderproduct` VALUES ('475', '2015022748565755', '253', '3', '860', '11.7');
INSERT INTO `orderproduct` VALUES ('476', '2015022755979852', '13', '2', '0', '13.7');
INSERT INTO `orderproduct` VALUES ('477', '2015022755979852', '14', '2', '0', '9.9');
INSERT INTO `orderproduct` VALUES ('478', '2015022755979852', '15', '3', '0', '8.7');
INSERT INTO `orderproduct` VALUES ('479', '2015022757565510', '49', '4', '1000', '17.6');
INSERT INTO `orderproduct` VALUES ('480', '2015022757565510', '53', '3', '750', '23.7');
INSERT INTO `orderproduct` VALUES ('481', '2015022757565510', '44', '8', '8', '36.0');
INSERT INTO `orderproduct` VALUES ('482', '2015022757565510', '35', '8', '1905', '22.1');
INSERT INTO `orderproduct` VALUES ('483', '2015030197995354', '259', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('484', '2015030197995354', '49', '5', '1250', '22.0');
INSERT INTO `orderproduct` VALUES ('485', '2015030156564854', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('486', '2015030150994948', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('487', '2015030155100525', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('488', '2015030253485355', '256', '4', '0', '25.6');
INSERT INTO `orderproduct` VALUES ('489', '2015030253485355', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('490', '2015030253485754', '57', '1', '1110', '7.4');
INSERT INTO `orderproduct` VALUES ('491', '2015030253485754', '45', '2', '500', '13.8');
INSERT INTO `orderproduct` VALUES ('492', '2015030253485754', '51', '5', '5', '10.0');
INSERT INTO `orderproduct` VALUES ('493', '2015030250485053', '253', '2', '0', '7.6');
INSERT INTO `orderproduct` VALUES ('494', '2015030250485053', '252', '4', '0', '15.6');
INSERT INTO `orderproduct` VALUES ('495', '2015030250485053', '255', '2', '0', '9.0');
INSERT INTO `orderproduct` VALUES ('496', '2015030210010248', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('497', '2015030249559851', '251', '10', '0', '64.8');
INSERT INTO `orderproduct` VALUES ('498', '2015030252534949', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('499', '2015030250579857', '72', '12', '12', '54.0');
INSERT INTO `orderproduct` VALUES ('500', '2015030299495051', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('501', '2015030252991005', '256', '7', '0', '44.8');
INSERT INTO `orderproduct` VALUES ('502', '2015030257555210', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('503', '2015030354101499', '49', '7', '1750', '30.8');
INSERT INTO `orderproduct` VALUES ('504', '2015030350975253', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('505', '2015030350995299', '31', '1', '1385', '9.2');
INSERT INTO `orderproduct` VALUES ('506', '2015030350995299', '262', '6', '850', '6.8');
INSERT INTO `orderproduct` VALUES ('507', '2015030350995299', '43', '2', '500', '28.0');
INSERT INTO `orderproduct` VALUES ('508', '2015030352541029', '92', '1', '6200', '220.7');
INSERT INTO `orderproduct` VALUES ('509', '2015030352541029', '93', '6', '1560', '15.5');
INSERT INTO `orderproduct` VALUES ('510', '2015030352541029', '112', '6', '300', '3.0');
INSERT INTO `orderproduct` VALUES ('511', '2015030351535010', '160', '1', '250', '8.4');
INSERT INTO `orderproduct` VALUES ('512', '2015030351535010', '162', '1', '250', '11.0');
INSERT INTO `orderproduct` VALUES ('513', '2015030351535010', '222', '5', '1850', '40.0');
INSERT INTO `orderproduct` VALUES ('514', '2015030353101541', '251', '7', '21', '0.5');
INSERT INTO `orderproduct` VALUES ('515', '2015030350575752', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('516', '2015030398515010', '256', '3', '750', '19.2');
INSERT INTO `orderproduct` VALUES ('517', '2015030398515010', '251', '3', '365', '7.9');
INSERT INTO `orderproduct` VALUES ('518', '2015030350505649', '251', '12', '0', '77.8');
INSERT INTO `orderproduct` VALUES ('519', '2015030410253511', '256', '6', '0', '38.4');
INSERT INTO `orderproduct` VALUES ('520', '2015030410253511', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('521', '2015030410253511', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('522', '2015030450534855', '251', '4', '500', '10.8');
INSERT INTO `orderproduct` VALUES ('523', '2015030450534855', '256', '2', '500', '12.8');
INSERT INTO `orderproduct` VALUES ('524', '2015030450534855', '252', '2', '1000', '15.6');
INSERT INTO `orderproduct` VALUES ('525', '2015030454579910', '256', '4', '0', '25.6');
INSERT INTO `orderproduct` VALUES ('526', '2015030454579910', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('527', '2015030454579910', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('528', '2015030456505656', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('529', '2015030497100545', '256', '1', '0', '6.4');
INSERT INTO `orderproduct` VALUES ('530', '2015030497100545', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('531', '2015030497100545', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('532', '2015030497100545', '255', '4', '0', '18.0');
INSERT INTO `orderproduct` VALUES ('533', '2015030453989798', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('534', '2015030455975797', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('535', '2015030455515552', '108', '13', '1680', '20.2');
INSERT INTO `orderproduct` VALUES ('536', '2015030455515552', '122', '1', '2395', '21.9');
INSERT INTO `orderproduct` VALUES ('537', '2015030455515552', '115', '4', '1000', '17.6');
INSERT INTO `orderproduct` VALUES ('538', '2015030451549810', '256', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('539', '2015030451549810', '251', '1', '400', '8.6');
INSERT INTO `orderproduct` VALUES ('540', '2015030451549810', '252', '1', '400', '6.2');
INSERT INTO `orderproduct` VALUES ('541', '2015030451549810', '254', '1', '200', '1.5');
INSERT INTO `orderproduct` VALUES ('542', '2015030451549810', '253', '4', '4000', '54.4');
INSERT INTO `orderproduct` VALUES ('543', '2015030410197975', '262', '7', '1200', '9.6');
INSERT INTO `orderproduct` VALUES ('544', '2015030410197975', '13', '2', '630', '12.3');
INSERT INTO `orderproduct` VALUES ('545', '2015030410197975', '23', '4', '1680', '9.4');
INSERT INTO `orderproduct` VALUES ('546', '2015030454991004', '257', '4', '560', '4.5');
INSERT INTO `orderproduct` VALUES ('547', '2015030454991004', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('548', '2015030454991004', '259', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('549', '2015030454991004', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('550', '2015030454991004', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('551', '2015030550489710', '122', '3', '560', '5.1');
INSERT INTO `orderproduct` VALUES ('552', '2015030550489710', '121', '3', '510', '4.1');
INSERT INTO `orderproduct` VALUES ('553', '2015030550489710', '83', '3', '520', '9.9');
INSERT INTO `orderproduct` VALUES ('554', '2015030550489710', '70', '1', '655', '9.8');
INSERT INTO `orderproduct` VALUES ('555', '2015030550489710', '276', '2', '500', '15.0');
INSERT INTO `orderproduct` VALUES ('556', '2015030552529751', '256', '4', '0', '25.6');
INSERT INTO `orderproduct` VALUES ('557', '2015030552529751', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('558', '2015030552529751', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('559', '2015030556975055', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('560', '2015030556975055', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('561', '2015030548989710', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('562', '2015030548505556', '251', '7', '963', '20.8');
INSERT INTO `orderproduct` VALUES ('563', '2015030510152575', '263', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('564', '2015030510152575', '264', '1', '450', '8.8');
INSERT INTO `orderproduct` VALUES ('565', '2015030510152575', '265', '1', '1800', '30.6');
INSERT INTO `orderproduct` VALUES ('566', '2015030510152575', '266', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('567', '2015030555525397', '158', '5', '780', '7.5');
INSERT INTO `orderproduct` VALUES ('568', '2015030555525397', '193', '1', '3400', '37.4');
INSERT INTO `orderproduct` VALUES ('569', '2015030555525397', '196', '2', '2', '5.0');
INSERT INTO `orderproduct` VALUES ('570', '2015030555525397', '212', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('571', '2015030510149545', '36', '2', '540', '5.4');
INSERT INTO `orderproduct` VALUES ('572', '2015030510149545', '14', '4', '1075', '18.9');
INSERT INTO `orderproduct` VALUES ('573', '2015030510149545', '261', '5', '1225', '11.0');
INSERT INTO `orderproduct` VALUES ('574', '2015030553579710', '264', '2', '890', '17.4');
INSERT INTO `orderproduct` VALUES ('575', '2015030553579710', '265', '2', '3600', '61.2');
INSERT INTO `orderproduct` VALUES ('576', '2015030548534957', '258', '2', '280', '6.6');
INSERT INTO `orderproduct` VALUES ('577', '2015030548534957', '262', '2', '315', '2.5');
INSERT INTO `orderproduct` VALUES ('578', '2015030548534957', '14', '5', '1450', '25.5');
INSERT INTO `orderproduct` VALUES ('579', '2015030510248511', '257', '4', '570', '4.5');
INSERT INTO `orderproduct` VALUES ('580', '2015030510248511', '262', '3', '478', '3.8');
INSERT INTO `orderproduct` VALUES ('581', '2015030510248511', '17', '3', '724', '20.0');
INSERT INTO `orderproduct` VALUES ('582', '2015030510248511', '16', '4', '950', '14.8');
INSERT INTO `orderproduct` VALUES ('583', '2015030553102505', '273', '4', '1000', '12.6');
INSERT INTO `orderproduct` VALUES ('584', '2015030553102505', '78', '4', '1000', '33.6');
INSERT INTO `orderproduct` VALUES ('585', '2015030553102505', '123', '1', '125', '2.2');
INSERT INTO `orderproduct` VALUES ('586', '2015030553102505', '121', '4', '595', '4.7');
INSERT INTO `orderproduct` VALUES ('587', '2015030697545356', '54', '4', '1000', '17.6');
INSERT INTO `orderproduct` VALUES ('588', '2015030697545356', '57', '2', '2495', '16.6');
INSERT INTO `orderproduct` VALUES ('589', '2015030652575052', '262', '2', '315', '2.5');
INSERT INTO `orderproduct` VALUES ('590', '2015030652575052', '15', '3', '762', '8.8');
INSERT INTO `orderproduct` VALUES ('591', '2015030652575052', '13', '4', '1500', '29.4');
INSERT INTO `orderproduct` VALUES ('592', '2015030610156975', '256', '3', '0', '19.2');
INSERT INTO `orderproduct` VALUES ('593', '2015030610156975', '251', '4', '0', '25.9');
INSERT INTO `orderproduct` VALUES ('594', '2015030648575010', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('595', '2015030648575010', '254', '1', '0', '1.1');
INSERT INTO `orderproduct` VALUES ('596', '2015030648575010', '253', '11', '0', '41.9');
INSERT INTO `orderproduct` VALUES ('597', '2015030648575010', '256', '1', '0', '6.4');
INSERT INTO `orderproduct` VALUES ('598', '2015030653511001', '256', '4', '0', '25.6');
INSERT INTO `orderproduct` VALUES ('599', '2015030653511001', '251', '8', '0', '51.8');
INSERT INTO `orderproduct` VALUES ('600', '2015030653499710', '256', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('601', '2015030653499710', '254', '10', '50', '0.4');
INSERT INTO `orderproduct` VALUES ('602', '2015030653499710', '255', '11', '11', '49.5');
INSERT INTO `orderproduct` VALUES ('603', '2015030651545410', '256', '16', '0', '102.4');
INSERT INTO `orderproduct` VALUES ('604', '2015030648511005', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('605', '2015030648511005', '251', '5', '0', '32.4');
INSERT INTO `orderproduct` VALUES ('606', '2015030648511005', '253', '2', '0', '7.6');
INSERT INTO `orderproduct` VALUES ('607', '2015030651535751', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('608', '2015030649529752', '256', '6', '0', '38.4');
INSERT INTO `orderproduct` VALUES ('609', '2015030649529752', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('610', '2015030653525454', '256', '7', '0', '44.8');
INSERT INTO `orderproduct` VALUES ('611', '2015030653525454', '254', '1', '0', '1.1');
INSERT INTO `orderproduct` VALUES ('612', '2015030652569757', '256', '2', '500', '12.8');
INSERT INTO `orderproduct` VALUES ('613', '2015030652569757', '251', '3', '800', '17.3');
INSERT INTO `orderproduct` VALUES ('614', '2015030652569757', '252', '1', '240', '3.7');
INSERT INTO `orderproduct` VALUES ('615', '2015030649101489', '256', '6', '0', '38.4');
INSERT INTO `orderproduct` VALUES ('616', '2015030649101489', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('617', '2015030649101489', '253', '1', '0', '3.8');
INSERT INTO `orderproduct` VALUES ('618', '2015030610199491', '256', '7', '0', '44.8');
INSERT INTO `orderproduct` VALUES ('619', '2015030652515510', '256', '6', '1500', '38.4');
INSERT INTO `orderproduct` VALUES ('620', '2015030657574910', '259', '3', '3', '45.0');
INSERT INTO `orderproduct` VALUES ('621', '2015030657574910', '258', '3', '425', '10.0');
INSERT INTO `orderproduct` VALUES ('622', '2015030657574910', '257', '5', '700', '5.6');
INSERT INTO `orderproduct` VALUES ('623', '2015030655515499', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('624', '2015030655515499', '15', '2', '500', '5.8');
INSERT INTO `orderproduct` VALUES ('625', '2015030655515499', '13', '2', '702', '13.8');
INSERT INTO `orderproduct` VALUES ('626', '2015030655515499', '17', '2', '490', '13.5');
INSERT INTO `orderproduct` VALUES ('627', '2015030654981025', '162', '1', '0', '7.9');
INSERT INTO `orderproduct` VALUES ('628', '2015030654981025', '168', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('629', '2015030654981025', '246', '3', '0', '6.6');
INSERT INTO `orderproduct` VALUES ('630', '2015030698545254', '162', '2', '500', '15.8');
INSERT INTO `orderproduct` VALUES ('631', '2015030698545254', '168', '4', '1000', '25.6');
INSERT INTO `orderproduct` VALUES ('632', '2015030698545254', '178', '1', '250', '2.4');
INSERT INTO `orderproduct` VALUES ('633', '2015030698545554', '258', '6', '846', '20.0');
INSERT INTO `orderproduct` VALUES ('634', '2015030698545554', '257', '7', '975', '7.8');
INSERT INTO `orderproduct` VALUES ('635', '2015030698545554', '262', '4', '650', '5.2');
INSERT INTO `orderproduct` VALUES ('636', '2015030654995052', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('637', '2015030652535410', '49', '4', '1000', '17.6');
INSERT INTO `orderproduct` VALUES ('638', '2015030652535410', '53', '2', '500', '15.8');
INSERT INTO `orderproduct` VALUES ('639', '2015030652535410', '42', '2', '500', '48.0');
INSERT INTO `orderproduct` VALUES ('640', '2015030610110110', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('641', '2015030610110110', '258', '1', '145', '3.4');
INSERT INTO `orderproduct` VALUES ('642', '2015030610110110', '262', '1', '160', '1.3');
INSERT INTO `orderproduct` VALUES ('643', '2015030697102484', '180', '5', '1390', '12.5');
INSERT INTO `orderproduct` VALUES ('644', '2015030697102484', '227', '4', '1300', '14.3');
INSERT INTO `orderproduct` VALUES ('645', '2015030697102484', '236', '5', '1350', '14.9');
INSERT INTO `orderproduct` VALUES ('646', '2015030648551025', '15', '2', '500', '5.8');
INSERT INTO `orderproduct` VALUES ('647', '2015030648551025', '14', '4', '1220', '21.5');
INSERT INTO `orderproduct` VALUES ('648', '2015030648551025', '13', '3', '1100', '21.6');
INSERT INTO `orderproduct` VALUES ('649', '2015030649989910', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('650', '2015030649989910', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('651', '2015030649989910', '13', '3', '1100', '21.6');
INSERT INTO `orderproduct` VALUES ('652', '2015030649989910', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('653', '2015030610257535', '15', '3', '760', '8.8');
INSERT INTO `orderproduct` VALUES ('654', '2015030610257535', '13', '3', '1056', '20.7');
INSERT INTO `orderproduct` VALUES ('655', '2015030610257535', '17', '3', '723', '20.0');
INSERT INTO `orderproduct` VALUES ('656', '2015030610257535', '18', '3', '742', '14.5');
INSERT INTO `orderproduct` VALUES ('657', '2015030698995051', '256', '3', '750', '19.2');
INSERT INTO `orderproduct` VALUES ('658', '2015030698995051', '251', '4', '1000', '21.6');
INSERT INTO `orderproduct` VALUES ('659', '2015030699554999', '13', '4', '1405', '27.5');
INSERT INTO `orderproduct` VALUES ('660', '2015030699554999', '16', '1', '245', '3.8');
INSERT INTO `orderproduct` VALUES ('661', '2015030699554999', '261', '1', '145', '1.3');
INSERT INTO `orderproduct` VALUES ('662', '2015030699554999', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('663', '2015030653101535', '258', '1', '148', '3.5');
INSERT INTO `orderproduct` VALUES ('664', '2015030653101535', '259', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('665', '2015030653101535', '260', '1', '1', '12.0');
INSERT INTO `orderproduct` VALUES ('666', '2015030655995699', '260', '1', '1', '12.0');
INSERT INTO `orderproduct` VALUES ('667', '2015030655995699', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('668', '2015030655995699', '38', '1', '135', '3.2');
INSERT INTO `orderproduct` VALUES ('669', '2015030798101991', '256', '3', '0', '19.2');
INSERT INTO `orderproduct` VALUES ('670', '2015030798101991', '252', '2', '0', '7.8');
INSERT INTO `orderproduct` VALUES ('671', '2015030798101991', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('672', '2015030710056101', '183', '3', '920', '10.1');
INSERT INTO `orderproduct` VALUES ('673', '2015030710056101', '160', '2', '500', '16.8');
INSERT INTO `orderproduct` VALUES ('674', '2015030710056101', '166', '4', '910', '11.8');
INSERT INTO `orderproduct` VALUES ('675', '2015030710056101', '164', '2', '500', '12.8');
INSERT INTO `orderproduct` VALUES ('676', '2015030897100525', '261', '6', '1020', '9.2');
INSERT INTO `orderproduct` VALUES ('677', '2015030897100525', '44', '2', '2', '9.0');
INSERT INTO `orderproduct` VALUES ('678', '2015030897100525', '36', '7', '1555', '15.6');
INSERT INTO `orderproduct` VALUES ('679', '2015030898999954', '13', '2', '800', '15.7');
INSERT INTO `orderproduct` VALUES ('680', '2015030898999954', '16', '2', '480', '7.5');
INSERT INTO `orderproduct` VALUES ('681', '2015030898999954', '22', '2', '615', '5.5');
INSERT INTO `orderproduct` VALUES ('682', '2015030898999954', '19', '2', '295', '6.4');
INSERT INTO `orderproduct` VALUES ('683', '2015030848541015', '268', '2', '500', '25.0');
INSERT INTO `orderproduct` VALUES ('684', '2015030848541015', '276', '2', '500', '15.0');
INSERT INTO `orderproduct` VALUES ('685', '2015030848541015', '275', '1', '728', '28.8');
INSERT INTO `orderproduct` VALUES ('686', '2015030855985310', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('687', '2015030898521025', '23', '4', '1405', '7.9');
INSERT INTO `orderproduct` VALUES ('688', '2015030898521025', '15', '4', '1375', '16.0');
INSERT INTO `orderproduct` VALUES ('689', '2015030898521025', '35', '4', '1055', '12.2');
INSERT INTO `orderproduct` VALUES ('690', '2015030898521025', '28', '2', '500', '8.8');
INSERT INTO `orderproduct` VALUES ('691', '2015030850509957', '257', '8', '1120', '9.0');
INSERT INTO `orderproduct` VALUES ('692', '2015030850509957', '261', '3', '460', '4.1');
INSERT INTO `orderproduct` VALUES ('693', '2015030850509957', '13', '3', '1100', '21.6');
INSERT INTO `orderproduct` VALUES ('694', '2015030898495256', '65', '6', '1905', '28.6');
INSERT INTO `orderproduct` VALUES ('695', '2015030898495256', '79', '4', '1035', '6.2');
INSERT INTO `orderproduct` VALUES ('696', '2015030855101505', '13', '3', '1100', '21.6');
INSERT INTO `orderproduct` VALUES ('697', '2015030855101505', '16', '3', '700', '10.9');
INSERT INTO `orderproduct` VALUES ('698', '2015030855101505', '20', '4', '580', '10.2');
INSERT INTO `orderproduct` VALUES ('699', '2015030899565310', '15', '4', '1005', '11.7');
INSERT INTO `orderproduct` VALUES ('700', '2015030899565310', '14', '4', '1125', '19.8');
INSERT INTO `orderproduct` VALUES ('701', '2015030899565310', '13', '3', '1100', '21.6');
INSERT INTO `orderproduct` VALUES ('702', '2015030857989949', '14', '2', '550', '9.7');
INSERT INTO `orderproduct` VALUES ('703', '2015030857989949', '15', '2', '450', '5.2');
INSERT INTO `orderproduct` VALUES ('704', '2015030857989949', '13', '2', '680', '13.3');
INSERT INTO `orderproduct` VALUES ('705', '2015030857989949', '17', '2', '470', '13.0');
INSERT INTO `orderproduct` VALUES ('706', '2015030853101575', '262', '4', '650', '5.2');
INSERT INTO `orderproduct` VALUES ('707', '2015030853101575', '14', '6', '1700', '29.9');
INSERT INTO `orderproduct` VALUES ('708', '2015030850989957', '30', '1', '1358', '18.5');
INSERT INTO `orderproduct` VALUES ('709', '2015030850989957', '33', '4', '1000', '21.6');
INSERT INTO `orderproduct` VALUES ('710', '2015030850971011', '49', '4', '1000', '17.6');
INSERT INTO `orderproduct` VALUES ('711', '2015030850971011', '57', '1', '1280', '8.4');
INSERT INTO `orderproduct` VALUES ('712', '2015030850971011', '48', '1', '1', '8.0');
INSERT INTO `orderproduct` VALUES ('713', '2015030950101971', '15', '2', '510', '5.9');
INSERT INTO `orderproduct` VALUES ('714', '2015030950101971', '14', '3', '845', '14.9');
INSERT INTO `orderproduct` VALUES ('715', '2015030950101971', '18', '3', '710', '13.9');
INSERT INTO `orderproduct` VALUES ('716', '2015030910253974', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('717', '2015030910253974', '262', '3', '460', '3.7');
INSERT INTO `orderproduct` VALUES ('718', '2015030999531015', '273', '8', '2000', '25.2');
INSERT INTO `orderproduct` VALUES ('719', '2015030999531015', '92', '1', '2525', '93.4');
INSERT INTO `orderproduct` VALUES ('720', '2015030950565310', '258', '3', '410', '9.7');
INSERT INTO `orderproduct` VALUES ('721', '2015030950565310', '15', '3', '728', '8.4');
INSERT INTO `orderproduct` VALUES ('722', '2015030950565310', '14', '3', '850', '15.0');
INSERT INTO `orderproduct` VALUES ('723', '2015030950100505', '21', '3', '950', '11.0');
INSERT INTO `orderproduct` VALUES ('724', '2015030950100505', '20', '5', '720', '12.7');
INSERT INTO `orderproduct` VALUES ('725', '2015030950100505', '30', '1', '1200', '16.3');
INSERT INTO `orderproduct` VALUES ('726', '2015030997491005', '18', '2', '480', '9.4');
INSERT INTO `orderproduct` VALUES ('727', '2015030997491005', '15', '4', '1005', '11.7');
INSERT INTO `orderproduct` VALUES ('728', '2015030997491005', '14', '3', '820', '14.4');
INSERT INTO `orderproduct` VALUES ('729', '2015030954515657', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('730', '2015030954515657', '15', '4', '1005', '11.7');
INSERT INTO `orderproduct` VALUES ('731', '2015030954515657', '14', '5', '1280', '22.5');
INSERT INTO `orderproduct` VALUES ('732', '2015030910210197', '15', '4', '1025', '11.9');
INSERT INTO `orderproduct` VALUES ('733', '2015030910210197', '14', '4', '1108', '19.5');
INSERT INTO `orderproduct` VALUES ('734', '2015030910210197', '21', '3', '940', '10.9');
INSERT INTO `orderproduct` VALUES ('735', '2015030998102499', '15', '4', '1175', '13.6');
INSERT INTO `orderproduct` VALUES ('736', '2015030998102499', '35', '4', '1200', '13.9');
INSERT INTO `orderproduct` VALUES ('737', '2015030998102499', '262', '4', '670', '5.4');
INSERT INTO `orderproduct` VALUES ('738', '2015030998102499', '50', '1', '880', '9.7');
INSERT INTO `orderproduct` VALUES ('739', '2015030951985555', '261', '8', '1115', '10.0');
INSERT INTO `orderproduct` VALUES ('740', '2015030951985555', '15', '4', '1225', '14.2');
INSERT INTO `orderproduct` VALUES ('741', '2015030951985555', '23', '4', '1615', '9.0');
INSERT INTO `orderproduct` VALUES ('742', '2015030951985555', '31', '1', '1050', '6.9');
INSERT INTO `orderproduct` VALUES ('743', '2015031097101100', '232', '6', '1500', '22.5');
INSERT INTO `orderproduct` VALUES ('744', '2015031097101100', '236', '6', '1370', '15.1');
INSERT INTO `orderproduct` VALUES ('745', '2015031097101100', '208', '2', '1190', '17.9');
INSERT INTO `orderproduct` VALUES ('746', '2015031097101100', '181', '5', '1300', '11.7');
INSERT INTO `orderproduct` VALUES ('747', '2015031097101100', '174', '1', '870', '10.1');
INSERT INTO `orderproduct` VALUES ('748', '2015031097101100', '158', '6', '1130', '10.8');
INSERT INTO `orderproduct` VALUES ('749', '2015031049100514', '273', '4', '1000', '12.6');
INSERT INTO `orderproduct` VALUES ('750', '2015031049100514', '109', '30', '3890', '25.7');
INSERT INTO `orderproduct` VALUES ('751', '2015031049100514', '121', '33', '4090', '32.7');
INSERT INTO `orderproduct` VALUES ('752', '2015031051100524', '273', '4', '0', '12.6');
INSERT INTO `orderproduct` VALUES ('753', '2015031051100524', '78', '1', '0', '8.4');
INSERT INTO `orderproduct` VALUES ('754', '2015031051100524', '90', '6', '0', '41.4');
INSERT INTO `orderproduct` VALUES ('755', '2015031098515497', '23', '5', '1790', '10.0');
INSERT INTO `orderproduct` VALUES ('756', '2015031098515497', '261', '5', '630', '5.7');
INSERT INTO `orderproduct` VALUES ('757', '2015031098515497', '35', '5', '1295', '15.0');
INSERT INTO `orderproduct` VALUES ('758', '2015031098515497', '29', '5', '795', '9.2');
INSERT INTO `orderproduct` VALUES ('759', '2015031099100525', '167', '1', '0', '6.0');
INSERT INTO `orderproduct` VALUES ('760', '2015031099100525', '166', '6', '0', '19.5');
INSERT INTO `orderproduct` VALUES ('761', '2015031099100525', '189', '2', '0', '19.8');
INSERT INTO `orderproduct` VALUES ('762', '2015031010052521', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('763', '2015031010052521', '19', '1', '150', '3.2');
INSERT INTO `orderproduct` VALUES ('764', '2015031010052521', '30', '1', '1340', '18.2');
INSERT INTO `orderproduct` VALUES ('765', '2015031010052521', '35', '1', '220', '2.6');
INSERT INTO `orderproduct` VALUES ('766', '2015031010052521', '258', '1', '150', '3.5');
INSERT INTO `orderproduct` VALUES ('767', '2015031054491001', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('768', '2015031054491001', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('769', '2015031054491001', '259', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('770', '2015031054491001', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('771', '2015031054491001', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('772', '2015031054491001', '260', '1', '1', '12.0');
INSERT INTO `orderproduct` VALUES ('773', '2015031057995210', '162', '1', '0', '7.9');
INSERT INTO `orderproduct` VALUES ('774', '2015031057995210', '160', '2', '0', '16.8');
INSERT INTO `orderproduct` VALUES ('775', '2015031057995210', '219', '1', '0', '19.0');
INSERT INTO `orderproduct` VALUES ('776', '2015031057565010', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('777', '2015031057565010', '13', '3', '1100', '21.6');
INSERT INTO `orderproduct` VALUES ('778', '2015031057565010', '262', '3', '465', '3.7');
INSERT INTO `orderproduct` VALUES ('779', '2015031049509950', '259', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('780', '2015031049509950', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('781', '2015031049509950', '18', '1', '242', '4.7');
INSERT INTO `orderproduct` VALUES ('782', '2015031049509950', '23', '1', '470', '3.1');
INSERT INTO `orderproduct` VALUES ('783', '2015031049509950', '35', '1', '228', '2.6');
INSERT INTO `orderproduct` VALUES ('784', '2015031053514898', '272', '5', '470', '26.3');
INSERT INTO `orderproduct` VALUES ('785', '2015031053514898', '65', '1', '300', '4.5');
INSERT INTO `orderproduct` VALUES ('786', '2015031053514898', '78', '1', '250', '8.4');
INSERT INTO `orderproduct` VALUES ('787', '2015031050575153', '15', '4', '1001', '11.6');
INSERT INTO `orderproduct` VALUES ('788', '2015031050575153', '20', '5', '760', '13.4');
INSERT INTO `orderproduct` VALUES ('789', '2015031050575153', '23', '4', '1700', '11.2');
INSERT INTO `orderproduct` VALUES ('790', '2015031010056102', '15', '2', '500', '5.8');
INSERT INTO `orderproduct` VALUES ('791', '2015031010056102', '14', '2', '568', '10.0');
INSERT INTO `orderproduct` VALUES ('792', '2015031010056102', '13', '3', '1060', '20.8');
INSERT INTO `orderproduct` VALUES ('793', '2015031050569998', '14', '3', '845', '14.9');
INSERT INTO `orderproduct` VALUES ('794', '2015031050569998', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('795', '2015031050569998', '15', '2', '500', '5.8');
INSERT INTO `orderproduct` VALUES ('796', '2015031098555397', '257', '11', '1540', '12.3');
INSERT INTO `orderproduct` VALUES ('797', '2015031098555397', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('798', '2015031098555397', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('799', '2015031098555397', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('800', '2015031098555397', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('801', '2015031098555397', '19', '1', '150', '3.2');
INSERT INTO `orderproduct` VALUES ('802', '2015031098555397', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('803', '2015031054559710', '21', '4', '1265', '14.7');
INSERT INTO `orderproduct` VALUES ('804', '2015031054559710', '20', '3', '460', '8.1');
INSERT INTO `orderproduct` VALUES ('805', '2015031054559710', '19', '3', '460', '9.9');
INSERT INTO `orderproduct` VALUES ('806', '2015031098101995', '13', '3', '1050', '20.6');
INSERT INTO `orderproduct` VALUES ('807', '2015031098101995', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('808', '2015031098101995', '15', '3', '750', '8.7');
INSERT INTO `orderproduct` VALUES ('809', '2015031099555555', '257', '7', '980', '7.8');
INSERT INTO `orderproduct` VALUES ('810', '2015031099555555', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('811', '2015031099555555', '261', '9', '1350', '12.2');
INSERT INTO `orderproduct` VALUES ('812', '2015031099555555', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('813', '2015031099531025', '15', '4', '1005', '11.7');
INSERT INTO `orderproduct` VALUES ('814', '2015031099531025', '21', '4', '1280', '14.8');
INSERT INTO `orderproduct` VALUES ('815', '2015031099531025', '19', '3', '450', '9.7');
INSERT INTO `orderproduct` VALUES ('816', '2015031054561005', '278', '2', '500', '20.0');
INSERT INTO `orderproduct` VALUES ('817', '2015031054561005', '112', '6', '300', '3.0');
INSERT INTO `orderproduct` VALUES ('818', '2015031054561005', '115', '2', '500', '8.8');
INSERT INTO `orderproduct` VALUES ('819', '2015031054561005', '122', '6', '1065', '9.8');
INSERT INTO `orderproduct` VALUES ('820', '2015031010051101', '15', '3', '750', '8.7');
INSERT INTO `orderproduct` VALUES ('821', '2015031010051101', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('822', '2015031010051101', '13', '3', '1050', '20.6');
INSERT INTO `orderproduct` VALUES ('823', '2015031053102485', '18', '4', '960', '18.8');
INSERT INTO `orderproduct` VALUES ('824', '2015031053102485', '21', '4', '1280', '14.8');
INSERT INTO `orderproduct` VALUES ('825', '2015031053102485', '19', '4', '600', '13.0');
INSERT INTO `orderproduct` VALUES ('826', '2015031149101102', '53', '2', '500', '15.8');
INSERT INTO `orderproduct` VALUES ('827', '2015031149101102', '55', '1', '1', '9.0');
INSERT INTO `orderproduct` VALUES ('828', '2015031149101102', '56', '3', '606', '14.3');
INSERT INTO `orderproduct` VALUES ('829', '2015031154534948', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('830', '2015031154534948', '28', '2', '500', '8.8');
INSERT INTO `orderproduct` VALUES ('831', '2015031154534948', '34', '2', '500', '7.8');
INSERT INTO `orderproduct` VALUES ('832', '2015031156551029', '259', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('833', '2015031156551029', '49', '8', '2000', '31.2');
INSERT INTO `orderproduct` VALUES ('834', '2015031198995353', '78', '2', '500', '12.8');
INSERT INTO `orderproduct` VALUES ('835', '2015031198995353', '109', '35', '4310', '28.4');
INSERT INTO `orderproduct` VALUES ('836', '2015031198995353', '120', '5', '1250', '17.0');
INSERT INTO `orderproduct` VALUES ('837', '2015031198995353', '121', '35', '4550', '36.4');
INSERT INTO `orderproduct` VALUES ('838', '2015031157565498', '18', '3', '720', '14.1');
INSERT INTO `orderproduct` VALUES ('839', '2015031157565498', '20', '3', '450', '7.9');
INSERT INTO `orderproduct` VALUES ('840', '2015031157565498', '23', '4', '1840', '12.1');
INSERT INTO `orderproduct` VALUES ('841', '2015031156985356', '280', '3', '750', '19.2');
INSERT INTO `orderproduct` VALUES ('842', '2015031156985356', '281', '4', '650', '12.7');
INSERT INTO `orderproduct` VALUES ('843', '2015031152555210', '103', '1', '3', '0.0');
INSERT INTO `orderproduct` VALUES ('844', '2015031154575554', '309', '2', '500', '58.0');
INSERT INTO `orderproduct` VALUES ('845', '2015031110248511', '18', '4', '970', '19.0');
INSERT INTO `orderproduct` VALUES ('846', '2015031110248511', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('847', '2015031150545250', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('848', '2015031150545250', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('849', '2015031157519848', '158', '13', '2000', '19.2');
INSERT INTO `orderproduct` VALUES ('850', '2015031157519848', '171', '4', '1800', '27.0');
INSERT INTO `orderproduct` VALUES ('851', '2015031157519848', '231', '13', '3000', '51.0');
INSERT INTO `orderproduct` VALUES ('852', '2015031150565510', '158', '4', '650', '6.2');
INSERT INTO `orderproduct` VALUES ('853', '2015031150565510', '166', '5', '1200', '15.6');
INSERT INTO `orderproduct` VALUES ('854', '2015031150565510', '162', '3', '750', '23.7');
INSERT INTO `orderproduct` VALUES ('855', '2015031154515155', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('856', '2015031154515155', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('857', '2015031154515155', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('858', '2015031154515155', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('859', '2015031154515155', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('860', '2015031154515155', '39', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('861', '2015031149495148', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('862', '2015031149495148', '259', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('863', '2015031151995297', '35', '10', '1850', '21.5');
INSERT INTO `orderproduct` VALUES ('864', '2015031151995297', '44', '8', '8', '36.0');
INSERT INTO `orderproduct` VALUES ('865', '2015031151995297', '49', '6', '1500', '23.4');
INSERT INTO `orderproduct` VALUES ('866', '2015031250102485', '50', '1', '908', '10.5');
INSERT INTO `orderproduct` VALUES ('867', '2015031250102485', '259', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('868', '2015031250102485', '257', '1', '145', '1.2');
INSERT INTO `orderproduct` VALUES ('869', '2015031250102485', '260', '1', '1', '12.0');
INSERT INTO `orderproduct` VALUES ('870', '2015031297545210', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('871', '2015031297545210', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('872', '2015031297545210', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('873', '2015031297545210', '33', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('874', '2015031297545210', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('875', '2015031297555399', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('876', '2015031297555399', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('877', '2015031297555399', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('878', '2015031297555399', '16', '1', '240', '3.7');
INSERT INTO `orderproduct` VALUES ('879', '2015031297555399', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('880', '2015031297555399', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('881', '2015031248565397', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('882', '2015031248565397', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('883', '2015031248565397', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('884', '2015031248565397', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('885', '2015031248565397', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('886', '2015031257999798', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('887', '2015031257999798', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('888', '2015031257999798', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('889', '2015031257999798', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('890', '2015031257999798', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('891', '2015031257999798', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('892', '2015031257999798', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('893', '2015031254494851', '273', '3', '750', '9.5');
INSERT INTO `orderproduct` VALUES ('894', '2015031254494851', '109', '15', '1850', '11.1');
INSERT INTO `orderproduct` VALUES ('895', '2015031254494851', '121', '17', '2545', '20.4');
INSERT INTO `orderproduct` VALUES ('896', '2015031298100545', '58', '2', '2020', '11.3');
INSERT INTO `orderproduct` VALUES ('897', '2015031298100545', '54', '3', '750', '13.2');
INSERT INTO `orderproduct` VALUES ('898', '2015031298100545', '49', '2', '500', '7.8');
INSERT INTO `orderproduct` VALUES ('899', '2015031256495398', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('900', '2015031256495398', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('901', '2015031256535097', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('902', '2015031256535097', '15', '3', '750', '8.7');
INSERT INTO `orderproduct` VALUES ('903', '2015031257100975', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('904', '2015031257100975', '18', '4', '960', '18.8');
INSERT INTO `orderproduct` VALUES ('905', '2015031256515053', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('906', '2015031256515053', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('907', '2015031256515053', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('908', '2015031256515053', '46', '1', '3600', '41.8');
INSERT INTO `orderproduct` VALUES ('909', '2015031299515098', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('910', '2015031299515098', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('911', '2015031210110154', '258', '1', '0', '3.3');
INSERT INTO `orderproduct` VALUES ('912', '2015031210110154', '259', '1', '0', '18.0');
INSERT INTO `orderproduct` VALUES ('913', '2015031210110154', '261', '1', '0', '1.4');
INSERT INTO `orderproduct` VALUES ('914', '2015031210110154', '46', '1', '0', '41.8');
INSERT INTO `orderproduct` VALUES ('915', '2015031254515010', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('916', '2015031254515010', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('917', '2015031254515010', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('918', '2015031254515010', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('919', '2015031254515010', '27', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('920', '2015031254515010', '33', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('921', '2015031252549997', '38', '1', '130', '3.1');
INSERT INTO `orderproduct` VALUES ('922', '2015031252549997', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('923', '2015031252549997', '42', '1', '250', '24.0');
INSERT INTO `orderproduct` VALUES ('924', '2015031210249101', '258', '1', '0', '3.3');
INSERT INTO `orderproduct` VALUES ('925', '2015031210249101', '14', '1', '0', '4.9');
INSERT INTO `orderproduct` VALUES ('926', '2015031210249101', '18', '1', '0', '4.7');
INSERT INTO `orderproduct` VALUES ('927', '2015031210249101', '20', '1', '0', '2.6');
INSERT INTO `orderproduct` VALUES ('928', '2015031210249101', '32', '1', '0', '9.4');
INSERT INTO `orderproduct` VALUES ('929', '2015031210249101', '30', '1', '0', '18.4');
INSERT INTO `orderproduct` VALUES ('930', '2015031210249101', '40', '1', '0', '28.2');
INSERT INTO `orderproduct` VALUES ('931', '2015031210152102', '30', '1', '0', '18.4');
INSERT INTO `orderproduct` VALUES ('932', '2015031210152102', '34', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('933', '2015031210152102', '37', '1', '0', '3.3');
INSERT INTO `orderproduct` VALUES ('934', '2015031210152102', '48', '1', '0', '8.0');
INSERT INTO `orderproduct` VALUES ('935', '2015031210152102', '55', '1', '0', '9.0');
INSERT INTO `orderproduct` VALUES ('936', '2015031210152102', '47', '1', '0', '32.6');
INSERT INTO `orderproduct` VALUES ('937', '2015031210152102', '45', '1', '0', '6.9');
INSERT INTO `orderproduct` VALUES ('938', '2015031210155565', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('939', '2015031210155565', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('940', '2015031210155565', '16', '1', '240', '3.7');
INSERT INTO `orderproduct` VALUES ('941', '2015031210155565', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('942', '2015031399495299', '15', '5', '1445', '16.8');
INSERT INTO `orderproduct` VALUES ('943', '2015031399495299', '258', '3', '510', '12.0');
INSERT INTO `orderproduct` VALUES ('944', '2015031399495299', '16', '4', '1010', '15.8');
INSERT INTO `orderproduct` VALUES ('945', '2015031399495299', '36', '5', '915', '9.2');
INSERT INTO `orderproduct` VALUES ('946', '2015031399495299', '257', '8', '1025', '8.2');
INSERT INTO `orderproduct` VALUES ('947', '2015031398519948', '273', '8', '0', '25.2');
INSERT INTO `orderproduct` VALUES ('948', '2015031398519948', '84', '16', '0', '26.4');
INSERT INTO `orderproduct` VALUES ('949', '2015031397545448', '412', '4', '2800', '22.4');
INSERT INTO `orderproduct` VALUES ('950', '2015031397545448', '49', '2', '500', '7.8');
INSERT INTO `orderproduct` VALUES ('951', '2015031397545448', '45', '2', '500', '13.8');
INSERT INTO `orderproduct` VALUES ('952', '2015031397545448', '22', '2', '600', '5.4');
INSERT INTO `orderproduct` VALUES ('953', '2015031351102495', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('954', '2015031351102495', '39', '3', '1145', '22.4');
INSERT INTO `orderproduct` VALUES ('955', '2015031351102495', '48', '1', '1', '8.0');
INSERT INTO `orderproduct` VALUES ('956', '2015031351102495', '45', '2', '500', '13.8');
INSERT INTO `orderproduct` VALUES ('957', '2015031356484910', '294', '1', '750', '29.7');
INSERT INTO `orderproduct` VALUES ('958', '2015031356484910', '298', '1', '250', '14.9');
INSERT INTO `orderproduct` VALUES ('959', '2015031310197489', '309', '2', '500', '58.0');
INSERT INTO `orderproduct` VALUES ('960', '2015031357505456', '30', '1', '1360', '18.5');
INSERT INTO `orderproduct` VALUES ('961', '2015031357505456', '49', '4', '1000', '15.6');
INSERT INTO `orderproduct` VALUES ('962', '2015031357505456', '412', '1', '560', '4.5');
INSERT INTO `orderproduct` VALUES ('963', '2015031348549752', '299', '2', '500', '26.8');
INSERT INTO `orderproduct` VALUES ('964', '2015031348549752', '305', '1', '250', '5.0');
INSERT INTO `orderproduct` VALUES ('965', '2015031310297575', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('966', '2015031353529810', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('967', '2015031353529810', '39', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('968', '2015031353529810', '46', '1', '360', '4.2');
INSERT INTO `orderproduct` VALUES ('969', '2015031398565156', '311', '4', '1000', '21.6');
INSERT INTO `orderproduct` VALUES ('970', '2015031398565156', '313', '3', '750', '13.2');
INSERT INTO `orderproduct` VALUES ('971', '2015031348485351', '321', '1', '2600', '118.6');
INSERT INTO `orderproduct` VALUES ('972', '2015031353515555', '207', '3', '1', '0.1');
INSERT INTO `orderproduct` VALUES ('973', '2015031353515555', '214', '2', '500', '22.0');
INSERT INTO `orderproduct` VALUES ('974', '2015031353515555', '249', '10', '1', '0.0');
INSERT INTO `orderproduct` VALUES ('975', '2015031353515555', '188', '6', '1', '0.0');
INSERT INTO `orderproduct` VALUES ('976', '2015031357971005', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('977', '2015031357971005', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('978', '2015031399515748', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('979', '2015031348525250', '261', '2', '300', '2.7');
INSERT INTO `orderproduct` VALUES ('980', '2015031348525250', '260', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('981', '2015031348525250', '16', '1', '240', '3.7');
INSERT INTO `orderproduct` VALUES ('982', '2015031355989749', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('983', '2015031355989749', '261', '2', '300', '2.7');
INSERT INTO `orderproduct` VALUES ('984', '2015031397485657', '268', '2', '500', '25.0');
INSERT INTO `orderproduct` VALUES ('985', '2015031397485657', '272', '5', '520', '29.1');
INSERT INTO `orderproduct` VALUES ('986', '2015031357994849', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('987', '2015031357994849', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('988', '2015031357994849', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('989', '2015031356529748', '21', '3', '960', '11.1');
INSERT INTO `orderproduct` VALUES ('990', '2015031356529748', '20', '3', '450', '7.9');
INSERT INTO `orderproduct` VALUES ('991', '2015031356529748', '23', '4', '1840', '12.1');
INSERT INTO `orderproduct` VALUES ('992', '2015031355491011', '99', '4', '870', '17.1');
INSERT INTO `orderproduct` VALUES ('993', '2015031355491011', '104', '3', '755', '13.6');
INSERT INTO `orderproduct` VALUES ('994', '2015031355491011', '101', '2', '500', '9.5');
INSERT INTO `orderproduct` VALUES ('995', '2015031355491011', '100', '1', '235', '4.1');
INSERT INTO `orderproduct` VALUES ('996', '2015031310110148', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('997', '2015031310110148', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('998', '2015031310110148', '18', '3', '720', '14.1');
INSERT INTO `orderproduct` VALUES ('999', '2015031349565610', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1000', '2015031349565610', '258', '4', '560', '13.2');
INSERT INTO `orderproduct` VALUES ('1001', '2015031355555110', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1002', '2015031355555110', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('1003', '2015031355555110', '257', '3', '420', '3.4');
INSERT INTO `orderproduct` VALUES ('1004', '2015031355555110', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1005', '2015031349574957', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1006', '2015031352101995', '21', '4', '1280', '14.8');
INSERT INTO `orderproduct` VALUES ('1007', '2015031352101995', '18', '4', '960', '18.8');
INSERT INTO `orderproduct` VALUES ('1008', '2015031352101995', '16', '3', '720', '11.2');
INSERT INTO `orderproduct` VALUES ('1009', '2015031310048545', '256', '3', '0', '19.2');
INSERT INTO `orderproduct` VALUES ('1010', '2015031310048545', '251', '3', '0', '19.4');
INSERT INTO `orderproduct` VALUES ('1011', '2015031398505652', '14', '3', '840750', '14797.2');
INSERT INTO `orderproduct` VALUES ('1012', '2015031398505652', '15', '3', '750', '8.7');
INSERT INTO `orderproduct` VALUES ('1013', '2015031398505652', '17', '3', '720', '19.9');
INSERT INTO `orderproduct` VALUES ('1014', '2015031448495097', '24', '4', '140', '0.8');
INSERT INTO `orderproduct` VALUES ('1015', '2015031448495097', '27', '3', '750', '16.2');
INSERT INTO `orderproduct` VALUES ('1016', '2015031448495097', '34', '3', '750', '11.7');
INSERT INTO `orderproduct` VALUES ('1017', '2015031498565057', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1018', '2015031498565057', '262', '5', '750', '6.0');
INSERT INTO `orderproduct` VALUES ('1019', '2015031457525356', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1020', '2015031457525356', '258', '4', '560', '13.2');
INSERT INTO `orderproduct` VALUES ('1021', '2015031410197999', '306', '3', '3', '30.0');
INSERT INTO `orderproduct` VALUES ('1022', '2015031457509810', '256', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1023', '2015031457509810', '251', '1', '320', '6.9');
INSERT INTO `orderproduct` VALUES ('1024', '2015031457509810', '254', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1025', '2015031498985152', '261', '5', '750', '6.8');
INSERT INTO `orderproduct` VALUES ('1026', '2015031498985152', '47', '1', '2400', '32.6');
INSERT INTO `orderproduct` VALUES ('1027', '2015031454495152', '309', '2', '500', '58.0');
INSERT INTO `orderproduct` VALUES ('1028', '2015031449481024', '261', '4', '610', '5.5');
INSERT INTO `orderproduct` VALUES ('1029', '2015031449481024', '47', '1', '2365', '32.2');
INSERT INTO `orderproduct` VALUES ('1030', '2015031497554952', '335', '6', '1540', '33.3');
INSERT INTO `orderproduct` VALUES ('1031', '2015031455535650', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1032', '2015031449985754', '306', '3', '3', '30.0');
INSERT INTO `orderproduct` VALUES ('1033', '2015031410010010', '308', '2', '500', '38.0');
INSERT INTO `orderproduct` VALUES ('1034', '2015031455579998', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1035', '2015031450495553', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1036', '2015031455524956', '280', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('1037', '2015031455524956', '281', '1', '130', '2.5');
INSERT INTO `orderproduct` VALUES ('1038', '2015031455524956', '282', '1', '120', '4.5');
INSERT INTO `orderproduct` VALUES ('1039', '2015031455524956', '283', '1', '350', '1.9');
INSERT INTO `orderproduct` VALUES ('1040', '2015031455524956', '284', '2', '385', '9.9');
INSERT INTO `orderproduct` VALUES ('1041', '2015031455524956', '285', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('1042', '2015031455524956', '286', '1', '75', '0.5');
INSERT INTO `orderproduct` VALUES ('1043', '2015031455524956', '287', '1', '76', '0.9');
INSERT INTO `orderproduct` VALUES ('1044', '2015031457975555', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('1045', '2015031455549757', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('1046', '2015031449975552', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('1047', '2015031455995648', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('1048', '2015031448535651', '251', '7', '5798', '125.2');
INSERT INTO `orderproduct` VALUES ('1049', '2015031456561021', '251', '9', '683', '14.8');
INSERT INTO `orderproduct` VALUES ('1050', '2015031452481014', '252', '13', '0', '50.7');
INSERT INTO `orderproduct` VALUES ('1051', '2015031455565510', '251', '6', '686', '14.8');
INSERT INTO `orderproduct` VALUES ('1052', '2015031410210199', '256', '16', '0', '102.4');
INSERT INTO `orderproduct` VALUES ('1053', '2015031450985453', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('1054', '2015031497101102', '23', '2', '0', '6.1');
INSERT INTO `orderproduct` VALUES ('1055', '2015031497101102', '28', '2', '0', '8.8');
INSERT INTO `orderproduct` VALUES ('1056', '2015031497101102', '261', '5', '0', '6.8');
INSERT INTO `orderproduct` VALUES ('1057', '2015031497101102', '54', '2', '0', '8.8');
INSERT INTO `orderproduct` VALUES ('1058', '2015031497515710', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('1059', '2015031498555549', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('1060', '2015031410010051', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1061', '2015031410010051', '15', '5', '1250', '14.5');
INSERT INTO `orderproduct` VALUES ('1062', '2015031455491011', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1063', '2015031455491011', '14', '2', '560', '9.9');
INSERT INTO `orderproduct` VALUES ('1064', '2015031455491011', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('1065', '2015031456545557', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1066', '2015031410256975', '49', '10', '2500', '39.0');
INSERT INTO `orderproduct` VALUES ('1067', '2015031410052505', '291', '20', '20', '70.0');
INSERT INTO `orderproduct` VALUES ('1068', '2015031497565056', '57', '1', '1190', '7.9');
INSERT INTO `orderproduct` VALUES ('1069', '2015031497565056', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1070', '2015031497565056', '412', '2', '1459', '11.7');
INSERT INTO `orderproduct` VALUES ('1071', '2015031451100515', '262', '6', '820', '6.6');
INSERT INTO `orderproduct` VALUES ('1072', '2015031451100515', '15', '2', '505', '5.9');
INSERT INTO `orderproduct` VALUES ('1073', '2015031451100515', '50', '1', '1180', '13.7');
INSERT INTO `orderproduct` VALUES ('1074', '2015031451100515', '412', '2', '1500', '12.0');
INSERT INTO `orderproduct` VALUES ('1075', '2015031451100515', '21', '4', '1275', '14.8');
INSERT INTO `orderproduct` VALUES ('1076', '2015031452101101', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1077', '2015031410010010', '280', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('1078', '2015031452515253', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1079', '2015031456569910', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('1080', '2015031456569910', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('1081', '2015031456569910', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('1082', '2015031410052551', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('1083', '2015031410052551', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('1084', '2015031410052551', '20', '2', '300', '5.3');
INSERT INTO `orderproduct` VALUES ('1085', '2015031454505152', '258', '4', '560', '13.2');
INSERT INTO `orderproduct` VALUES ('1086', '2015031454505152', '16', '4', '960', '15.0');
INSERT INTO `orderproduct` VALUES ('1087', '2015031454505152', '29', '4', '600', '7.0');
INSERT INTO `orderproduct` VALUES ('1088', '2015031548521011', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1089', '2015031548521011', '261', '2', '300', '2.7');
INSERT INTO `orderproduct` VALUES ('1090', '2015031510149519', '258', '2', '280', '6.6');
INSERT INTO `orderproduct` VALUES ('1091', '2015031510149519', '261', '4', '600', '5.4');
INSERT INTO `orderproduct` VALUES ('1092', '2015031510149519', '17', '6', '1440', '39.7');
INSERT INTO `orderproduct` VALUES ('1093', '2015031598101574', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('1094', '2015031598101574', '262', '3', '450', '3.6');
INSERT INTO `orderproduct` VALUES ('1095', '2015031598101574', '17', '2', '480', '13.2');
INSERT INTO `orderproduct` VALUES ('1096', '2015031598555550', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('1097', '2015031598555550', '19', '2', '300', '6.5');
INSERT INTO `orderproduct` VALUES ('1098', '2015031598555550', '27', '3', '750', '16.2');
INSERT INTO `orderproduct` VALUES ('1099', '2015031598100100', '261', '3', '450', '4.1');
INSERT INTO `orderproduct` VALUES ('1100', '2015031598100100', '262', '3', '450', '3.6');
INSERT INTO `orderproduct` VALUES ('1101', '2015031598100100', '14', '5', '1400', '24.6');
INSERT INTO `orderproduct` VALUES ('1102', '2015031549975698', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1103', '2015031549975698', '260', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('1104', '2015031549975698', '258', '2', '280', '6.6');
INSERT INTO `orderproduct` VALUES ('1105', '2015031555504997', '256', '1', '0', '6.4');
INSERT INTO `orderproduct` VALUES ('1106', '2015031555504997', '251', '4', '0', '25.9');
INSERT INTO `orderproduct` VALUES ('1107', '2015031555504997', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('1108', '2015031551541014', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1109', '2015031551541014', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1110', '2015031551541014', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1111', '2015031552565199', '292', '4', '4', '36.0');
INSERT INTO `orderproduct` VALUES ('1112', '2015031552985756', '48', '1', '1', '8.0');
INSERT INTO `orderproduct` VALUES ('1113', '2015031552985756', '34', '1', '250', '3.9');
INSERT INTO `orderproduct` VALUES ('1114', '2015031552985756', '50', '1', '900', '10.4');
INSERT INTO `orderproduct` VALUES ('1115', '2015031552985756', '58', '1', '950', '5.3');
INSERT INTO `orderproduct` VALUES ('1116', '2015031552985756', '407', '1', '1700', '67.3');
INSERT INTO `orderproduct` VALUES ('1117', '2015031554481029', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1118', '2015031554481029', '35', '1', '210', '2.9');
INSERT INTO `orderproduct` VALUES ('1119', '2015031554481029', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('1120', '2015031554481029', '44', '1', '1', '4.5');
INSERT INTO `orderproduct` VALUES ('1121', '2015031554481029', '46', '1', '3600', '41.8');
INSERT INTO `orderproduct` VALUES ('1122', '2015031599514850', '291', '10', '10', '35.0');
INSERT INTO `orderproduct` VALUES ('1123', '2015031553514899', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1124', '2015031551545610', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1125', '2015031599529710', '289', '8', '8', '38.4');
INSERT INTO `orderproduct` VALUES ('1126', '2015031552544810', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1127', '2015031552544810', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('1128', '2015031552544810', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1129', '2015031552544810', '56', '1', '200', '4.7');
INSERT INTO `orderproduct` VALUES ('1130', '2015031552544810', '413', '1', '250', '4.4');
INSERT INTO `orderproduct` VALUES ('1131', '2015031553994856', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1132', '2015031553994856', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('1133', '2015031553994856', '39', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('1134', '2015031553994856', '46', '1', '3600', '41.8');
INSERT INTO `orderproduct` VALUES ('1135', '2015031552101555', '48', '4', '4', '32.0');
INSERT INTO `orderproduct` VALUES ('1136', '2015031552101555', '49', '2', '500', '7.8');
INSERT INTO `orderproduct` VALUES ('1137', '2015031549100995', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1138', '2015031549100995', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1139', '2015031549100995', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1140', '2015031555101100', '14', '4', '1120', '19.7');
INSERT INTO `orderproduct` VALUES ('1141', '2015031555101100', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('1142', '2015031555101100', '28', '3', '750', '13.2');
INSERT INTO `orderproduct` VALUES ('1143', '2015031552569755', '18', '6', '1440', '28.2');
INSERT INTO `orderproduct` VALUES ('1144', '2015031552569755', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('1145', '2015031552569755', '28', '1', '250', '4.4');
INSERT INTO `orderproduct` VALUES ('1146', '2015031597995256', '27', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('1147', '2015031597995256', '23', '3', '1380', '9.1');
INSERT INTO `orderproduct` VALUES ('1148', '2015031597995256', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1149', '2015031553985652', '409', '3', '600', '26.2');
INSERT INTO `orderproduct` VALUES ('1150', '2015031553985652', '411', '2', '480', '24.8');
INSERT INTO `orderproduct` VALUES ('1151', '2015031553100971', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1152', '2015031553100971', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('1153', '2015031553100971', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1154', '2015031553100971', '31', '1', '1350', '8.9');
INSERT INTO `orderproduct` VALUES ('1155', '2015031510150489', '27', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('1156', '2015031510150489', '47', '1', '2400', '32.6');
INSERT INTO `orderproduct` VALUES ('1157', '2015031557499848', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1158', '2015031610098102', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('1159', '2015031610098102', '14', '2', '560', '9.9');
INSERT INTO `orderproduct` VALUES ('1160', '2015031610098102', '15', '4', '1000', '11.6');
INSERT INTO `orderproduct` VALUES ('1161', '2015031699564954', '274', '3', '515', '5.0');
INSERT INTO `orderproduct` VALUES ('1162', '2015031699564954', '67', '2', '295', '7.0');
INSERT INTO `orderproduct` VALUES ('1163', '2015031699564954', '79', '2', '725', '4.4');
INSERT INTO `orderproduct` VALUES ('1164', '2015031699564954', '93', '5', '1610', '16.1');
INSERT INTO `orderproduct` VALUES ('1165', '2015031699564954', '110', '5', '1915', '10.7');
INSERT INTO `orderproduct` VALUES ('1166', '2015031699979954', '292', '5', '5', '45.0');
INSERT INTO `orderproduct` VALUES ('1167', '2015031697515753', '261', '3', '450', '4.1');
INSERT INTO `orderproduct` VALUES ('1168', '2015031697515753', '16', '4', '960', '15.0');
INSERT INTO `orderproduct` VALUES ('1169', '2015031697515753', '28', '2', '500', '8.8');
INSERT INTO `orderproduct` VALUES ('1170', '2015031697515753', '38', '1', '130', '3.1');
INSERT INTO `orderproduct` VALUES ('1171', '2015031652561005', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('1172', '2015031652561005', '32', '1', '4000', '94.4');
INSERT INTO `orderproduct` VALUES ('1173', '2015031652561005', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('1174', '2015031697995049', '14', '2', '560', '9.9');
INSERT INTO `orderproduct` VALUES ('1175', '2015031697995049', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('1176', '2015031697995049', '27', '2', '500', '10.8');
INSERT INTO `orderproduct` VALUES ('1177', '2015031610010053', '17', '3', '720', '19.9');
INSERT INTO `orderproduct` VALUES ('1178', '2015031610010053', '23', '3', '1380', '9.1');
INSERT INTO `orderproduct` VALUES ('1179', '2015031610010053', '29', '2', '300', '3.5');
INSERT INTO `orderproduct` VALUES ('1180', '2015031656575456', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1181', '2015031656575456', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('1182', '2015031655511009', '14', '2', '560', '9.9');
INSERT INTO `orderproduct` VALUES ('1183', '2015031655511009', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('1184', '2015031655511009', '38', '4', '520', '12.3');
INSERT INTO `orderproduct` VALUES ('1185', '2015031652979949', '261', '3', '450', '4.1');
INSERT INTO `orderproduct` VALUES ('1186', '2015031652979949', '258', '9', '1260', '29.7');
INSERT INTO `orderproduct` VALUES ('1187', '2015031649515155', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1188', '2015031610253102', '273', '2', '500', '6.3');
INSERT INTO `orderproduct` VALUES ('1189', '2015031610253102', '73', '3', '3', '16.5');
INSERT INTO `orderproduct` VALUES ('1190', '2015031610253102', '111', '3', '1580', '11.4');
INSERT INTO `orderproduct` VALUES ('1191', '2015031610253102', '112', '10', '500', '5.0');
INSERT INTO `orderproduct` VALUES ('1192', '2015031610253102', '121', '10', '1510', '12.1');
INSERT INTO `orderproduct` VALUES ('1193', '2015031610253102', '92', '1', '2725', '100.8');
INSERT INTO `orderproduct` VALUES ('1194', '2015031654499852', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1195', '2015031653495610', '291', '15', '15', '52.5');
INSERT INTO `orderproduct` VALUES ('1196', '2015031657571029', '257', '8', '1120', '9.0');
INSERT INTO `orderproduct` VALUES ('1197', '2015031657571029', '258', '5', '700', '16.5');
INSERT INTO `orderproduct` VALUES ('1198', '2015031657571029', '261', '4', '600', '5.4');
INSERT INTO `orderproduct` VALUES ('1199', '2015031698495751', '13', '3', '1050', '20.6');
INSERT INTO `orderproduct` VALUES ('1200', '2015031698495751', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('1201', '2015031698495751', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('1202', '2015031710099100', '13', '3', '1050', '20.6');
INSERT INTO `orderproduct` VALUES ('1203', '2015031710099100', '16', '2', '480', '7.5');
INSERT INTO `orderproduct` VALUES ('1204', '2015031710099100', '19', '3', '450', '9.7');
INSERT INTO `orderproduct` VALUES ('1205', '2015031752985054', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1206', '2015031797569910', '292', '4', '4', '36.0');
INSERT INTO `orderproduct` VALUES ('1207', '2015031752555599', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1208', '2015031752555599', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('1209', '2015031752555599', '31', '2', '2700', '17.8');
INSERT INTO `orderproduct` VALUES ('1210', '2015031752555599', '37', '2', '2', '6.6');
INSERT INTO `orderproduct` VALUES ('1211', '2015031748524951', '306', '3', '3', '30.0');
INSERT INTO `orderproduct` VALUES ('1212', '2015031748555254', '15', '3', '750', '8.7');
INSERT INTO `orderproduct` VALUES ('1213', '2015031748555254', '14', '4', '1150', '20.2');
INSERT INTO `orderproduct` VALUES ('1214', '2015031748555254', '262', '5', '760', '6.1');
INSERT INTO `orderproduct` VALUES ('1215', '2015031799554956', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('1216', '2015031799554956', '34', '1', '250', '3.9');
INSERT INTO `orderproduct` VALUES ('1217', '2015031799554956', '40', '1', '740', '27.8');
INSERT INTO `orderproduct` VALUES ('1218', '2015031757495210', '16', '3', '720', '11.2');
INSERT INTO `orderproduct` VALUES ('1219', '2015031757495210', '19', '3', '450', '9.7');
INSERT INTO `orderproduct` VALUES ('1220', '2015031757495210', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1221', '2015031710050555', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1222', '2015031710050555', '262', '11', '1650', '13.2');
INSERT INTO `orderproduct` VALUES ('1223', '2015031798101994', '18', '2', '480', '9.4');
INSERT INTO `orderproduct` VALUES ('1224', '2015031798101994', '16', '3', '720', '11.2');
INSERT INTO `orderproduct` VALUES ('1225', '2015031798101994', '19', '4', '600', '13.0');
INSERT INTO `orderproduct` VALUES ('1226', '2015031755565052', '280', '8', '2000', '51.2');
INSERT INTO `orderproduct` VALUES ('1227', '2015031748575056', '289', '10', '10', '48.0');
INSERT INTO `orderproduct` VALUES ('1228', '2015031797541019', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('1229', '2015031797541019', '31', '1', '1350', '8.9');
INSERT INTO `orderproduct` VALUES ('1230', '2015031797541019', '53', '3', '750', '23.7');
INSERT INTO `orderproduct` VALUES ('1231', '2015031748531009', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('1232', '2015031748531009', '261', '3', '450', '4.1');
INSERT INTO `orderproduct` VALUES ('1233', '2015031748531009', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('1234', '2015031748531009', '37', '3', '3', '9.9');
INSERT INTO `orderproduct` VALUES ('1235', '2015031797505455', '309', '2', '500', '58.0');
INSERT INTO `orderproduct` VALUES ('1236', '2015031710055565', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1237', '2015031710055565', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1238', '2015031710055565', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1239', '2015031710055565', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1240', '2015031710055565', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1241', '2015031710152505', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1242', '2015031710152505', '258', '4', '560', '13.2');
INSERT INTO `orderproduct` VALUES ('1243', '2015031710152505', '257', '2', '280', '2.2');
INSERT INTO `orderproduct` VALUES ('1244', '2015031752975550', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1245', '2015031752975550', '257', '4', '560', '4.5');
INSERT INTO `orderproduct` VALUES ('1246', '2015031752975550', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('1247', '2015031752975550', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('1248', '2015031749505556', '258', '4', '560', '13.2');
INSERT INTO `orderproduct` VALUES ('1249', '2015031749505556', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1250', '2015031749505556', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1251', '2015031753544899', '257', '8', '1120', '9.0');
INSERT INTO `orderproduct` VALUES ('1252', '2015031753544899', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1253', '2015031753544899', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1254', '2015031710156535', '258', '4', '560', '13.2');
INSERT INTO `orderproduct` VALUES ('1255', '2015031710156535', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1256', '2015031710156535', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1257', '2015031710054102', '262', '8', '1200', '9.6');
INSERT INTO `orderproduct` VALUES ('1258', '2015031710054102', '18', '4', '960', '18.8');
INSERT INTO `orderproduct` VALUES ('1259', '2015031710054102', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('1260', '2015031752499754', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1261', '2015031752499754', '53', '4', '1000', '31.6');
INSERT INTO `orderproduct` VALUES ('1262', '2015031753991005', '258', '4', '560', '13.2');
INSERT INTO `orderproduct` VALUES ('1263', '2015031753991005', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1264', '2015031753991005', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1265', '2015031754575354', '261', '2', '300', '2.7');
INSERT INTO `orderproduct` VALUES ('1266', '2015031754575354', '17', '3', '720', '19.9');
INSERT INTO `orderproduct` VALUES ('1267', '2015031754575354', '20', '3', '450', '7.9');
INSERT INTO `orderproduct` VALUES ('1268', '2015031799535055', '16', '2', '480', '7.5');
INSERT INTO `orderproduct` VALUES ('1269', '2015031799535055', '28', '1', '250', '4.4');
INSERT INTO `orderproduct` VALUES ('1270', '2015031799535055', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1271', '2015031898995797', '232', '8', '1600', '24.0');
INSERT INTO `orderproduct` VALUES ('1272', '2015031898995797', '236', '6', '1500', '19.5');
INSERT INTO `orderproduct` VALUES ('1273', '2015031898995797', '249', '4', '600', '5.8');
INSERT INTO `orderproduct` VALUES ('1274', '2015031898995797', '226', '4', '800', '10.4');
INSERT INTO `orderproduct` VALUES ('1275', '2015031898995797', '181', '6', '1350', '12.2');
INSERT INTO `orderproduct` VALUES ('1276', '2015031898995797', '180', '4', '1600', '14.4');
INSERT INTO `orderproduct` VALUES ('1277', '2015031898995797', '164', '2', '500', '12.8');
INSERT INTO `orderproduct` VALUES ('1278', '2015031856101545', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1279', '2015031856101545', '257', '4', '560', '4.5');
INSERT INTO `orderproduct` VALUES ('1280', '2015031855571015', '249', '6', '900', '8.6');
INSERT INTO `orderproduct` VALUES ('1281', '2015031855571015', '239', '5', '950', '10.5');
INSERT INTO `orderproduct` VALUES ('1282', '2015031855571015', '234', '2', '480', '4.3');
INSERT INTO `orderproduct` VALUES ('1283', '2015031855571015', '227', '2', '530', '5.8');
INSERT INTO `orderproduct` VALUES ('1284', '2015031855571015', '225', '2', '460', '6.9');
INSERT INTO `orderproduct` VALUES ('1285', '2015031855571015', '187', '4', '900', '8.1');
INSERT INTO `orderproduct` VALUES ('1286', '2015031855571015', '165', '8', '2800', '18.5');
INSERT INTO `orderproduct` VALUES ('1287', '2015031851100575', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1288', '2015031851100575', '20', '2', '300', '5.3');
INSERT INTO `orderproduct` VALUES ('1289', '2015031851100575', '22', '8', '2400', '21.6');
INSERT INTO `orderproduct` VALUES ('1290', '2015031898984949', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1291', '2015031856511001', '298', '3', '750', '44.7');
INSERT INTO `orderproduct` VALUES ('1292', '2015031898494852', '260', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('1293', '2015031898494852', '261', '3', '450', '4.1');
INSERT INTO `orderproduct` VALUES ('1294', '2015031899539749', '23', '5', '2300', '15.2');
INSERT INTO `orderproduct` VALUES ('1295', '2015031899539749', '29', '1', '150', '1.7');
INSERT INTO `orderproduct` VALUES ('1296', '2015031899539749', '33', '3', '750', '16.2');
INSERT INTO `orderproduct` VALUES ('1297', '2015031849101531', '257', '2', '280', '2.2');
INSERT INTO `orderproduct` VALUES ('1298', '2015031849101531', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1299', '2015031849101531', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1300', '2015031849101531', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('1301', '2015031853999897', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1302', '2015031853999897', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('1303', '2015031853999897', '20', '2', '300', '5.3');
INSERT INTO `orderproduct` VALUES ('1304', '2015031848509797', '268', '2', '500', '25.0');
INSERT INTO `orderproduct` VALUES ('1305', '2015031848509797', '272', '2', '230', '12.9');
INSERT INTO `orderproduct` VALUES ('1306', '2015031848509797', '276', '2', '500', '15.0');
INSERT INTO `orderproduct` VALUES ('1307', '2015031848509797', '278', '1', '250', '10.0');
INSERT INTO `orderproduct` VALUES ('1308', '2015031848509797', '63', '1', '215', '6.8');
INSERT INTO `orderproduct` VALUES ('1309', '2015031848509797', '69', '1', '1', '8.0');
INSERT INTO `orderproduct` VALUES ('1310', '2015031852551011', '268', '2', '500', '25.0');
INSERT INTO `orderproduct` VALUES ('1311', '2015031852551011', '61', '3', '3', '45.0');
INSERT INTO `orderproduct` VALUES ('1312', '2015031898505699', '258', '4', '560', '13.2');
INSERT INTO `orderproduct` VALUES ('1313', '2015031898505699', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1314', '2015031849575410', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1315', '2015031849575410', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1316', '2015031849575410', '14', '2', '560', '9.9');
INSERT INTO `orderproduct` VALUES ('1317', '2015031951551005', '251', '4', '1400', '30.2');
INSERT INTO `orderproduct` VALUES ('1318', '2015031951551005', '256', '2', '500', '12.8');
INSERT INTO `orderproduct` VALUES ('1319', '2015031951551005', '252', '1', '200', '3.1');
INSERT INTO `orderproduct` VALUES ('1320', '2015031956535397', '256', '3', '0', '19.2');
INSERT INTO `orderproduct` VALUES ('1321', '2015031956535397', '251', '3', '0', '19.4');
INSERT INTO `orderproduct` VALUES ('1322', '2015031956535397', '252', '3', '0', '11.7');
INSERT INTO `orderproduct` VALUES ('1323', '2015031997100575', '289', '8', '8', '38.4');
INSERT INTO `orderproduct` VALUES ('1324', '2015031955575250', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1325', '2015031950525254', '306', '5', '5', '50.0');
INSERT INTO `orderproduct` VALUES ('1326', '2015031954489951', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1327', '2015031954525254', '307', '2', '500', '48.0');
INSERT INTO `orderproduct` VALUES ('1328', '2015031910248534', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1329', '2015031957555010', '18', '6', '1440', '28.2');
INSERT INTO `orderproduct` VALUES ('1330', '2015031957555010', '16', '4', '960', '15.0');
INSERT INTO `orderproduct` VALUES ('1331', '2015031953979853', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('1332', '2015031953979853', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1333', '2015031953979853', '13', '4', '1400', '27.4');
INSERT INTO `orderproduct` VALUES ('1334', '2015031951511011', '251', '9', '0', '58.3');
INSERT INTO `orderproduct` VALUES ('1335', '2015031949535498', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1336', '2015031949535498', '22', '3', '900', '8.1');
INSERT INTO `orderproduct` VALUES ('1337', '2015031949535498', '32', '2', '800', '18.9');
INSERT INTO `orderproduct` VALUES ('1338', '2015031956985110', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1339', '2015031956985110', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1340', '2015031951549910', '18', '6', '1440', '28.2');
INSERT INTO `orderproduct` VALUES ('1341', '2015031951549910', '16', '4', '970', '15.1');
INSERT INTO `orderproduct` VALUES ('1342', '2015031954101524', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1343', '2015031954101524', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1344', '2015031954101524', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1345', '2015031954101524', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1346', '2015031954101524', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1347', '2015031954101524', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('1348', '2015031954101524', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1349', '2015031954101524', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('1350', '2015031954101524', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('1351', '2015031954521005', '324', '1', '2300', '35.9');
INSERT INTO `orderproduct` VALUES ('1352', '2015031910298535', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1353', '2015031999534810', '261', '7', '1050', '9.5');
INSERT INTO `orderproduct` VALUES ('1354', '2015031999534810', '17', '3', '720', '19.9');
INSERT INTO `orderproduct` VALUES ('1355', '2015031999534810', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('1356', '2015031910257521', '249', '5', '720', '6.9');
INSERT INTO `orderproduct` VALUES ('1357', '2015031910257521', '250', '12', '3120', '53.0');
INSERT INTO `orderproduct` VALUES ('1358', '2015031910257521', '225', '5', '1150', '17.3');
INSERT INTO `orderproduct` VALUES ('1359', '2015031910257521', '212', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('1360', '2015031910257521', '206', '4', '740', '33.7');
INSERT INTO `orderproduct` VALUES ('1361', '2015031998549951', '338', '21', '6000', '57.6');
INSERT INTO `orderproduct` VALUES ('1362', '2015031957101555', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('1363', '2015031948984956', '256', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1364', '2015031952539810', '322', '1', '1100', '8.4');
INSERT INTO `orderproduct` VALUES ('1365', '2015031952539810', '319', '3', '750', '13.2');
INSERT INTO `orderproduct` VALUES ('1366', '2015031952539810', '280', '2', '500', '12.8');
INSERT INTO `orderproduct` VALUES ('1367', '2015031997985049', '268', '5', '1250', '62.5');
INSERT INTO `orderproduct` VALUES ('1368', '2015031997489999', '268', '3', '750', '37.5');
INSERT INTO `orderproduct` VALUES ('1369', '2015031997489999', '269', '2', '465', '17.5');
INSERT INTO `orderproduct` VALUES ('1370', '2015031951579857', '38', '5', '640', '15.1');
INSERT INTO `orderproduct` VALUES ('1371', '2015031951579857', '50', '1', '917', '10.6');
INSERT INTO `orderproduct` VALUES ('1372', '2015031951579857', '34', '4', '1000', '15.6');
INSERT INTO `orderproduct` VALUES ('1373', '2015031949559956', '303', '3', '750', '12.0');
INSERT INTO `orderproduct` VALUES ('1374', '2015031949559956', '362', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('1375', '2015031949559956', '350', '6', '860', '6.5');
INSERT INTO `orderproduct` VALUES ('1376', '2015031949559956', '341', '4', '1380', '8.3');
INSERT INTO `orderproduct` VALUES ('1377', '2015031956535254', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1378', '2015031956535254', '257', '7', '980', '7.8');
INSERT INTO `orderproduct` VALUES ('1379', '2015031956535254', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1380', '2015031954999810', '256', '1', '0', '6.4');
INSERT INTO `orderproduct` VALUES ('1381', '2015031954999810', '251', '4', '0', '25.9');
INSERT INTO `orderproduct` VALUES ('1382', '2015031910052100', '258', '2', '280', '6.6');
INSERT INTO `orderproduct` VALUES ('1383', '2015031910052100', '13', '3', '1050', '20.6');
INSERT INTO `orderproduct` VALUES ('1384', '2015031910052100', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('1385', '2015031955511015', '261', '2', '300', '2.7');
INSERT INTO `orderproduct` VALUES ('1386', '2015031955511015', '14', '5', '1400', '24.6');
INSERT INTO `orderproduct` VALUES ('1387', '2015031955511015', '19', '2', '300', '6.5');
INSERT INTO `orderproduct` VALUES ('1388', '2015031997551004', '27', '3', '750', '16.2');
INSERT INTO `orderproduct` VALUES ('1389', '2015031997551004', '21', '3', '960', '11.1');
INSERT INTO `orderproduct` VALUES ('1390', '2015031997551004', '19', '3', '450', '9.7');
INSERT INTO `orderproduct` VALUES ('1391', '2015031957565753', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1392', '2015031957565753', '262', '13', '1950', '15.6');
INSERT INTO `orderproduct` VALUES ('1393', '2015031997525353', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1394', '2015031997525353', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1395', '2015031910110251', '261', '5', '750', '6.8');
INSERT INTO `orderproduct` VALUES ('1396', '2015031910110251', '14', '4', '1120', '19.7');
INSERT INTO `orderproduct` VALUES ('1397', '2015031910110251', '17', '3', '720', '19.9');
INSERT INTO `orderproduct` VALUES ('1398', '2015031999100514', '256', '3', '0', '19.2');
INSERT INTO `orderproduct` VALUES ('1399', '2015031999100514', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('1400', '2015031999100514', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('1401', '2015031999100514', '253', '1', '0', '3.8');
INSERT INTO `orderproduct` VALUES ('1402', '2015031999100514', '254', '1', '0', '1.1');
INSERT INTO `orderproduct` VALUES ('1403', '2015031951985456', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1404', '2015032049100100', '256', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('1405', '2015032049100100', '251', '4', '1300', '28.1');
INSERT INTO `orderproduct` VALUES ('1406', '2015032049100100', '252', '2', '450', '7.0');
INSERT INTO `orderproduct` VALUES ('1407', '2015032010054994', '276', '2', '500', '15.0');
INSERT INTO `orderproduct` VALUES ('1408', '2015032010054994', '84', '5', '550', '8.3');
INSERT INTO `orderproduct` VALUES ('1409', '2015032010054994', '90', '2', '500', '13.8');
INSERT INTO `orderproduct` VALUES ('1410', '2015032010054994', '100', '3', '675', '11.9');
INSERT INTO `orderproduct` VALUES ('1411', '2015032010054994', '121', '3', '435', '3.5');
INSERT INTO `orderproduct` VALUES ('1412', '2015032010054994', '123', '3', '389', '6.8');
INSERT INTO `orderproduct` VALUES ('1413', '2015032098555753', '262', '6', '900', '7.2');
INSERT INTO `orderproduct` VALUES ('1414', '2015032098555753', '27', '4', '1000', '21.6');
INSERT INTO `orderproduct` VALUES ('1415', '2015032098555753', '29', '1', '150', '1.7');
INSERT INTO `orderproduct` VALUES ('1416', '2015032057979797', '251', '7', '64835', '1400.4');
INSERT INTO `orderproduct` VALUES ('1417', '2015032054525051', '24', '1', '350', '2.0');
INSERT INTO `orderproduct` VALUES ('1418', '2015032054525051', '34', '4', '1000', '15.6');
INSERT INTO `orderproduct` VALUES ('1419', '2015032054525051', '37', '4', '4', '13.2');
INSERT INTO `orderproduct` VALUES ('1420', '2015032050495752', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1421', '2015032050495752', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('1422', '2015032050495752', '16', '3', '720', '11.2');
INSERT INTO `orderproduct` VALUES ('1423', '2015032057579850', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('1424', '2015032057579850', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1425', '2015032057579850', '262', '3', '450', '3.6');
INSERT INTO `orderproduct` VALUES ('1426', '2015032050514952', '15', '4', '1000', '11.6');
INSERT INTO `orderproduct` VALUES ('1427', '2015032050514952', '19', '3', '450', '9.7');
INSERT INTO `orderproduct` VALUES ('1428', '2015032050514952', '22', '6', '1800', '16.2');
INSERT INTO `orderproduct` VALUES ('1429', '2015032010050100', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1430', '2015032051101579', '20', '4', '600', '10.6');
INSERT INTO `orderproduct` VALUES ('1431', '2015032051101579', '29', '3', '450', '5.2');
INSERT INTO `orderproduct` VALUES ('1432', '2015032051101579', '34', '4', '1000', '15.6');
INSERT INTO `orderproduct` VALUES ('1433', '2015032097545698', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1434', '2015032050100991', '160', '1', '250', '8.4');
INSERT INTO `orderproduct` VALUES ('1435', '2015032050100991', '166', '5', '1250', '16.3');
INSERT INTO `orderproduct` VALUES ('1436', '2015032050100991', '185', '5', '2250', '20.3');
INSERT INTO `orderproduct` VALUES ('1437', '2015032050100991', '227', '5', '1325', '14.6');
INSERT INTO `orderproduct` VALUES ('1438', '2015032050100991', '208', '1', '630', '9.5');
INSERT INTO `orderproduct` VALUES ('1439', '2015032098571015', '306', '5', '5', '50.0');
INSERT INTO `orderproduct` VALUES ('1440', '2015032056535750', '307', '2', '500', '48.0');
INSERT INTO `orderproduct` VALUES ('1441', '2015032054489852', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1442', '2015032050100995', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1443', '2015032050100995', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('1444', '2015032050100995', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1445', '2015032050100995', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1446', '2015032050100995', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1447', '2015032050100995', '15', '1', '258', '3.0');
INSERT INTO `orderproduct` VALUES ('1448', '2015032050100995', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1449', '2015032050100995', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('1450', '2015032050100995', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('1451', '2015032051101554', '251', '3', '58', '1.3');
INSERT INTO `orderproduct` VALUES ('1452', '2015032051101554', '252', '2', '88', '1.4');
INSERT INTO `orderproduct` VALUES ('1453', '2015032051101554', '256', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('1454', '2015032051101554', '255', '1', '1', '4.5');
INSERT INTO `orderproduct` VALUES ('1455', '2015032051101554', '253', '1', '88', '1.2');
INSERT INTO `orderproduct` VALUES ('1456', '2015032051101554', '254', '1', '88', '0.7');
INSERT INTO `orderproduct` VALUES ('1457', '2015032054101995', '251', '6', '6538', '141.2');
INSERT INTO `orderproduct` VALUES ('1458', '2015032155521005', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('1459', '2015032155521005', '262', '14', '2100', '16.8');
INSERT INTO `orderproduct` VALUES ('1460', '2015032155521005', '57', '1', '1200', '7.9');
INSERT INTO `orderproduct` VALUES ('1461', '2015032156102519', '292', '5', '5', '45.0');
INSERT INTO `orderproduct` VALUES ('1462', '2015032110151101', '298', '4', '1000', '59.6');
INSERT INTO `orderproduct` VALUES ('1463', '2015032157531009', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1464', '2015032148519748', '289', '10', '10', '48.0');
INSERT INTO `orderproduct` VALUES ('1465', '2015032153101555', '38', '1', '130', '3.1');
INSERT INTO `orderproduct` VALUES ('1466', '2015032153101555', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('1467', '2015032153535310', '261', '5', '750', '6.8');
INSERT INTO `orderproduct` VALUES ('1468', '2015032153535310', '48', '1', '1', '8.0');
INSERT INTO `orderproduct` VALUES ('1469', '2015032153535310', '27', '2', '500', '10.8');
INSERT INTO `orderproduct` VALUES ('1470', '2015032153535310', '258', '2', '280', '6.6');
INSERT INTO `orderproduct` VALUES ('1471', '2015032154979810', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('1472', '2015032154979810', '259', '3', '3', '54.0');
INSERT INTO `orderproduct` VALUES ('1473', '2015032154979810', '257', '3', '420', '3.4');
INSERT INTO `orderproduct` VALUES ('1474', '2015032154979810', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1475', '2015032154979810', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('1476', '2015032154554857', '262', '3', '450', '3.6');
INSERT INTO `orderproduct` VALUES ('1477', '2015032154554857', '15', '4', '1000', '11.6');
INSERT INTO `orderproduct` VALUES ('1478', '2015032154554857', '14', '5', '1400', '24.6');
INSERT INTO `orderproduct` VALUES ('1479', '2015032110298515', '256', '2', '0', '12.8');
INSERT INTO `orderproduct` VALUES ('1480', '2015032110298515', '254', '16', '0', '18.2');
INSERT INTO `orderproduct` VALUES ('1481', '2015032110151975', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1482', '2015032110151975', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('1483', '2015032110151975', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('1484', '2015032110151975', '16', '1', '240', '3.7');
INSERT INTO `orderproduct` VALUES ('1485', '2015032110151975', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('1486', '2015032110151975', '19', '1', '150', '3.2');
INSERT INTO `orderproduct` VALUES ('1487', '2015032157525552', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1488', '2015032110249555', '291', '10', '10', '35.0');
INSERT INTO `orderproduct` VALUES ('1489', '2015032150505449', '262', '7', '1050', '8.4');
INSERT INTO `orderproduct` VALUES ('1490', '2015032150505449', '15', '7', '1750', '20.3');
INSERT INTO `orderproduct` VALUES ('1491', '2015032150505449', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('1492', '2015032148515050', '33', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('1493', '2015032148515050', '47', '1', '2400', '32.6');
INSERT INTO `orderproduct` VALUES ('1494', '2015032148515050', '42', '1', '250', '24.0');
INSERT INTO `orderproduct` VALUES ('1495', '2015032150100971', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1496', '2015032150100971', '262', '3', '450', '3.6');
INSERT INTO `orderproduct` VALUES ('1497', '2015032150100971', '15', '4', '1000', '11.6');
INSERT INTO `orderproduct` VALUES ('1498', '2015032150100971', '18', '3', '720', '14.1');
INSERT INTO `orderproduct` VALUES ('1499', '2015032157569950', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('1500', '2015032150521009', '256', '2', '0', '12.8');
INSERT INTO `orderproduct` VALUES ('1501', '2015032150521009', '251', '2', '0', '13.0');
INSERT INTO `orderproduct` VALUES ('1502', '2015032150521009', '252', '2', '0', '7.8');
INSERT INTO `orderproduct` VALUES ('1503', '2015032150521009', '255', '2', '0', '9.0');
INSERT INTO `orderproduct` VALUES ('1504', '2015032150521009', '253', '2', '0', '7.6');
INSERT INTO `orderproduct` VALUES ('1505', '2015032150521009', '254', '2', '0', '2.3');
INSERT INTO `orderproduct` VALUES ('1506', '2015032151491011', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('1507', '2015032151491011', '252', '2', '0', '7.8');
INSERT INTO `orderproduct` VALUES ('1508', '2015032151491011', '256', '1', '0', '6.4');
INSERT INTO `orderproduct` VALUES ('1509', '2015032151491011', '255', '1', '0', '4.5');
INSERT INTO `orderproduct` VALUES ('1510', '2015032151491011', '253', '2', '0', '7.6');
INSERT INTO `orderproduct` VALUES ('1511', '2015032151491011', '254', '1', '0', '1.1');
INSERT INTO `orderproduct` VALUES ('1512', '2015032157555298', '251', '4', '65', '1.4');
INSERT INTO `orderproduct` VALUES ('1513', '2015032157555298', '252', '1', '956', '14.9');
INSERT INTO `orderproduct` VALUES ('1514', '2015032157555298', '256', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('1515', '2015032157555298', '255', '1', '1', '4.5');
INSERT INTO `orderproduct` VALUES ('1516', '2015032157555298', '254', '1', '65', '0.5');
INSERT INTO `orderproduct` VALUES ('1517', '2015032157555298', '253', '1', '686', '9.3');
INSERT INTO `orderproduct` VALUES ('1518', '2015032152525310', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1519', '2015032152525310', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1520', '2015032152525310', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1521', '2015032152525310', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('1522', '2015032152525310', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('1523', '2015032110210249', '256', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1524', '2015032110210249', '251', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('1525', '2015032153495049', '15', '3', '750', '8.7');
INSERT INTO `orderproduct` VALUES ('1526', '2015032153495049', '16', '6', '1440', '22.5');
INSERT INTO `orderproduct` VALUES ('1527', '2015032153495049', '24', '1', '350', '2.0');
INSERT INTO `orderproduct` VALUES ('1528', '2015032149575355', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1529', '2015032149575355', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1530', '2015032149575355', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1531', '2015032149575355', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1532', '2015032156555197', '19', '1', '150', '3.2');
INSERT INTO `orderproduct` VALUES ('1533', '2015032156555197', '20', '4', '600', '10.6');
INSERT INTO `orderproduct` VALUES ('1534', '2015032156555197', '29', '10', '1500', '17.4');
INSERT INTO `orderproduct` VALUES ('1535', '2015032150531025', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1536', '2015032197489810', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1537', '2015032197489810', '262', '3', '450', '3.6');
INSERT INTO `orderproduct` VALUES ('1538', '2015032149509751', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('1539', '2015032149509751', '31', '1', '1350', '8.9');
INSERT INTO `orderproduct` VALUES ('1540', '2015032149509751', '35', '7', '1470', '20.0');
INSERT INTO `orderproduct` VALUES ('1541', '2015032110153515', '37', '1', '1', '3.3');
INSERT INTO `orderproduct` VALUES ('1542', '2015032110153515', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('1543', '2015032110153515', '46', '1', '3600', '41.8');
INSERT INTO `orderproduct` VALUES ('1544', '2015032152975654', '18', '4', '960', '18.8');
INSERT INTO `orderproduct` VALUES ('1545', '2015032152975654', '19', '1', '150', '3.2');
INSERT INTO `orderproduct` VALUES ('1546', '2015032152975654', '32', '1', '400', '9.4');
INSERT INTO `orderproduct` VALUES ('1547', '2015032148985557', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1548', '2015032148985557', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1549', '2015032148985557', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1550', '2015032155981009', '257', '11', '1540', '12.3');
INSERT INTO `orderproduct` VALUES ('1551', '2015032155981009', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1552', '2015032155981009', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1553', '2015032198551005', '15', '3', '750', '8.7');
INSERT INTO `orderproduct` VALUES ('1554', '2015032198551005', '17', '3', '720', '19.9');
INSERT INTO `orderproduct` VALUES ('1555', '2015032198551005', '21', '4', '1280', '14.8');
INSERT INTO `orderproduct` VALUES ('1556', '2015032149515750', '42', '1', '250', '24.0');
INSERT INTO `orderproduct` VALUES ('1557', '2015032149515750', '49', '4', '1000', '15.6');
INSERT INTO `orderproduct` VALUES ('1558', '2015032149515750', '53', '2', '500', '15.8');
INSERT INTO `orderproduct` VALUES ('1559', '2015032149515750', '413', '2', '500', '8.8');
INSERT INTO `orderproduct` VALUES ('1560', '2015032149515750', '35', '10', '2100', '28.6');
INSERT INTO `orderproduct` VALUES ('1561', '2015032149515750', '44', '6', '6', '27.0');
INSERT INTO `orderproduct` VALUES ('1562', '2015032149515750', '15', '4', '1000', '11.6');
INSERT INTO `orderproduct` VALUES ('1563', '2015032149549850', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1564', '2015032157535257', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1565', '2015032156975555', '258', '4', '560', '13.2');
INSERT INTO `orderproduct` VALUES ('1566', '2015032156975555', '14', '4', '1120', '19.7');
INSERT INTO `orderproduct` VALUES ('1567', '2015032110097481', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1568', '2015032110097481', '261', '11', '1650', '14.9');
INSERT INTO `orderproduct` VALUES ('1569', '2015032198100100', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1570', '2015032198100100', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('1571', '2015032148555348', '37', '1', '1', '3.3');
INSERT INTO `orderproduct` VALUES ('1572', '2015032148555348', '42', '1', '250', '24.0');
INSERT INTO `orderproduct` VALUES ('1573', '2015032148555348', '47', '1', '2400', '32.6');
INSERT INTO `orderproduct` VALUES ('1574', '2015032110254529', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1575', '2015032110254529', '18', '4', '960', '18.8');
INSERT INTO `orderproduct` VALUES ('1576', '2015032110254529', '16', '2', '480', '7.5');
INSERT INTO `orderproduct` VALUES ('1577', '2015032155574956', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1578', '2015032155574956', '19', '3', '450', '9.7');
INSERT INTO `orderproduct` VALUES ('1579', '2015032155574956', '18', '3', '720', '14.1');
INSERT INTO `orderproduct` VALUES ('1580', '2015032110249531', '46', '1', '3600', '41.8');
INSERT INTO `orderproduct` VALUES ('1581', '2015032110249531', '50', '1', '900', '10.4');
INSERT INTO `orderproduct` VALUES ('1582', '2015032197521015', '162', '3', '750', '17.3');
INSERT INTO `orderproduct` VALUES ('1583', '2015032197521015', '158', '8', '1150', '9.2');
INSERT INTO `orderproduct` VALUES ('1584', '2015032197521015', '166', '5', '1140', '14.8');
INSERT INTO `orderproduct` VALUES ('1585', '2015032197521015', '193', '1', '3200', '30.7');
INSERT INTO `orderproduct` VALUES ('1586', '2015032153101559', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1587', '2015032153101559', '262', '11', '1650', '13.2');
INSERT INTO `orderproduct` VALUES ('1588', '2015032110248541', '263', '4', '1000', '23.6');
INSERT INTO `orderproduct` VALUES ('1589', '2015032110248541', '190', '1', '940', '18.4');
INSERT INTO `orderproduct` VALUES ('1590', '2015032110248541', '168', '2', '500', '11.8');
INSERT INTO `orderproduct` VALUES ('1591', '2015032110254100', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1592', '2015032157981014', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1593', '2015032153494854', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1594', '2015032110253505', '292', '5', '5', '45.0');
INSERT INTO `orderproduct` VALUES ('1595', '2015032150999749', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1596', '2015032150999749', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1597', '2015032150999749', '262', '10', '1500', '12.0');
INSERT INTO `orderproduct` VALUES ('1598', '2015032199975753', '262', '10', '1500', '12.0');
INSERT INTO `orderproduct` VALUES ('1599', '2015032199975753', '58', '2', '1900', '10.6');
INSERT INTO `orderproduct` VALUES ('1600', '2015032199975753', '54', '3', '750', '13.2');
INSERT INTO `orderproduct` VALUES ('1601', '2015032199575398', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1602', '2015032199575398', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1603', '2015032199575398', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('1604', '2015032199575398', '29', '1', '150', '1.7');
INSERT INTO `orderproduct` VALUES ('1605', '2015032248100100', '22', '7', '2030', '18.3');
INSERT INTO `orderproduct` VALUES ('1606', '2015032248100100', '412', '2', '1310', '10.5');
INSERT INTO `orderproduct` VALUES ('1607', '2015032251555748', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1608', '2015032252534810', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1609', '2015032210154531', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1610', '2015032210154531', '17', '2', '480', '13.2');
INSERT INTO `orderproduct` VALUES ('1611', '2015032257975557', '289', '8', '8', '38.4');
INSERT INTO `orderproduct` VALUES ('1612', '2015032254979753', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1613', '2015032254979753', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1614', '2015032254979753', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1615', '2015032257101101', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1616', '2015032257101101', '14', '4', '1120', '19.7');
INSERT INTO `orderproduct` VALUES ('1617', '2015032250549853', '18', '3', '720', '14.1');
INSERT INTO `orderproduct` VALUES ('1618', '2015032250549853', '16', '4', '960', '15.0');
INSERT INTO `orderproduct` VALUES ('1619', '2015032250549853', '21', '3', '960', '11.1');
INSERT INTO `orderproduct` VALUES ('1620', '2015032298551015', '306', '4', '4', '40.0');
INSERT INTO `orderproduct` VALUES ('1621', '2015032253555597', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1622', '2015032252485254', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('1623', '2015032252485254', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1624', '2015032252485254', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('1625', '2015032249535698', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1626', '2015032255511009', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1627', '2015032255511009', '15', '6', '1500', '17.4');
INSERT INTO `orderproduct` VALUES ('1628', '2015032256100102', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1629', '2015032256100102', '262', '10', '1500', '12.0');
INSERT INTO `orderproduct` VALUES ('1630', '2015032256101989', '38', '1', '130', '3.1');
INSERT INTO `orderproduct` VALUES ('1631', '2015032256101989', '35', '6', '1260', '17.1');
INSERT INTO `orderproduct` VALUES ('1632', '2015032256101989', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('1633', '2015032256101989', '24', '1', '350', '2.0');
INSERT INTO `orderproduct` VALUES ('1634', '2015032256101989', '412', '1', '700', '5.6');
INSERT INTO `orderproduct` VALUES ('1635', '2015032254559849', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1636', '2015032254559849', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('1637', '2015032254559849', '32', '2', '800', '18.9');
INSERT INTO `orderproduct` VALUES ('1638', '2015032255545149', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1639', '2015032255545149', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('1640', '2015032255545149', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('1641', '2015032255545149', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('1642', '2015032255545149', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('1643', '2015032255545149', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1644', '2015032255545149', '19', '1', '150', '3.2');
INSERT INTO `orderproduct` VALUES ('1645', '2015032255545149', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1646', '2015032255545149', '38', '1', '130', '3.1');
INSERT INTO `orderproduct` VALUES ('1647', '2015032255545149', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('1648', '2015032254985557', '216', '4', '1000', '15.6');
INSERT INTO `orderproduct` VALUES ('1649', '2015032254985557', '158', '6', '1880', '15.0');
INSERT INTO `orderproduct` VALUES ('1650', '2015032254985557', '172', '5', '1250', '24.5');
INSERT INTO `orderproduct` VALUES ('1651', '2015032257100565', '371', '2', '500', '49.8');
INSERT INTO `orderproduct` VALUES ('1652', '2015032299984952', '257', '2', '280', '2.2');
INSERT INTO `orderproduct` VALUES ('1653', '2015032299984952', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1654', '2015032299984952', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1655', '2015032257541011', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('1656', '2015032257541011', '34', '6', '1500', '23.4');
INSERT INTO `orderproduct` VALUES ('1657', '2015032257541011', '41', '1', '250', '8.9');
INSERT INTO `orderproduct` VALUES ('1658', '2015032251549710', '268', '4', '1000', '50.0');
INSERT INTO `orderproduct` VALUES ('1659', '2015032254554910', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1660', '2015032254554910', '15', '5', '1258', '14.6');
INSERT INTO `orderproduct` VALUES ('1661', '2015032250495656', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1662', '2015032250495656', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('1663', '2015032250495656', '19', '3', '450', '9.7');
INSERT INTO `orderproduct` VALUES ('1664', '2015032257545452', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1665', '2015032257545452', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1666', '2015032257545452', '34', '3', '750', '11.7');
INSERT INTO `orderproduct` VALUES ('1667', '2015032210110055', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('1668', '2015032210110055', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('1669', '2015032210110055', '28', '6', '1500', '26.4');
INSERT INTO `orderproduct` VALUES ('1670', '2015032253495056', '46', '1', '3600', '41.8');
INSERT INTO `orderproduct` VALUES ('1671', '2015032253495056', '48', '1', '1', '8.0');
INSERT INTO `orderproduct` VALUES ('1672', '2015032250525799', '257', '6', '680', '5.4');
INSERT INTO `orderproduct` VALUES ('1673', '2015032250525799', '412', '2', '850', '6.8');
INSERT INTO `orderproduct` VALUES ('1674', '2015032250525799', '50', '1', '915', '10.6');
INSERT INTO `orderproduct` VALUES ('1675', '2015032250525799', '24', '4', '1054', '5.9');
INSERT INTO `orderproduct` VALUES ('1676', '2015032250525799', '15', '2', '810', '9.4');
INSERT INTO `orderproduct` VALUES ('1677', '2015032250525799', '262', '4', '600', '4.8');
INSERT INTO `orderproduct` VALUES ('1678', '2015032248555756', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1679', '2015032253519910', '186', '3', '880', '10.2');
INSERT INTO `orderproduct` VALUES ('1680', '2015032253519910', '235', '12', '3010', '45.2');
INSERT INTO `orderproduct` VALUES ('1681', '2015032253519910', '225', '5', '1330', '20.7');
INSERT INTO `orderproduct` VALUES ('1682', '2015032253519910', '198', '6', '6', '27.0');
INSERT INTO `orderproduct` VALUES ('1683', '2015032249101575', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1684', '2015032210148525', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1685', '2015032210010149', '289', '10', '10', '48.0');
INSERT INTO `orderproduct` VALUES ('1686', '2015032210210110', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1687', '2015032252985656', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1688', '2015032252985656', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('1689', '2015032252985656', '28', '3', '750', '13.2');
INSERT INTO `orderproduct` VALUES ('1690', '2015032310298101', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1691', '2015032310298101', '262', '4', '600', '4.8');
INSERT INTO `orderproduct` VALUES ('1692', '2015032310298101', '16', '6', '1440', '22.5');
INSERT INTO `orderproduct` VALUES ('1693', '2015032351485752', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('1694', '2015032351485752', '28', '1', '250', '4.4');
INSERT INTO `orderproduct` VALUES ('1695', '2015032351485752', '35', '1', '210', '2.9');
INSERT INTO `orderproduct` VALUES ('1696', '2015032351485752', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('1697', '2015032356575610', '22', '1', '300', '2.7');
INSERT INTO `orderproduct` VALUES ('1698', '2015032356575610', '30', '1', '1350', '18.4');
INSERT INTO `orderproduct` VALUES ('1699', '2015032356575610', '32', '1', '400', '9.4');
INSERT INTO `orderproduct` VALUES ('1700', '2015032310252535', '255', '1', '0', '4.5');
INSERT INTO `orderproduct` VALUES ('1701', '2015032310252535', '254', '9', '0', '10.3');
INSERT INTO `orderproduct` VALUES ('1702', '2015032310252535', '256', '1', '0', '6.4');
INSERT INTO `orderproduct` VALUES ('1703', '2015032310252535', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('1704', '2015032310252535', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('1705', '2015032310252535', '253', '1', '0', '3.8');
INSERT INTO `orderproduct` VALUES ('1706', '2015032352504852', '413', '4', '1000', '17.6');
INSERT INTO `orderproduct` VALUES ('1707', '2015032352504852', '34', '4', '1000', '15.6');
INSERT INTO `orderproduct` VALUES ('1708', '2015032310048991', '53', '4', '1000', '31.6');
INSERT INTO `orderproduct` VALUES ('1709', '2015032310048991', '38', '4', '520', '12.3');
INSERT INTO `orderproduct` VALUES ('1710', '2015032357100995', '306', '5', '5', '50.0');
INSERT INTO `orderproduct` VALUES ('1711', '2015032310054485', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('1712', '2015032310054485', '19', '7', '1050', '22.7');
INSERT INTO `orderproduct` VALUES ('1713', '2015032352101102', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1714', '2015032352101102', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('1715', '2015032352101102', '24', '3', '1050', '5.9');
INSERT INTO `orderproduct` VALUES ('1716', '2015032350535510', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1717', '2015032350535510', '261', '3', '450', '4.1');
INSERT INTO `orderproduct` VALUES ('1718', '2015032350535510', '14', '3', '840', '14.8');
INSERT INTO `orderproduct` VALUES ('1719', '2015032350535510', '18', '3', '720', '14.1');
INSERT INTO `orderproduct` VALUES ('1720', '2015032310297485', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1721', '2015032351101981', '46', '1', '3600', '41.8');
INSERT INTO `orderproduct` VALUES ('1722', '2015032351101981', '38', '2', '260', '6.1');
INSERT INTO `orderproduct` VALUES ('1723', '2015032351101981', '34', '2', '500', '7.8');
INSERT INTO `orderproduct` VALUES ('1724', '2015032351515197', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1725', '2015032351515197', '15', '6', '1500', '17.4');
INSERT INTO `orderproduct` VALUES ('1726', '2015032354489910', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1727', '2015032354481011', '289', '8', '8', '38.4');
INSERT INTO `orderproduct` VALUES ('1728', '2015032348565598', '280', '10', '2500', '64.0');
INSERT INTO `orderproduct` VALUES ('1729', '2015032397575049', '289', '10', '10', '48.0');
INSERT INTO `orderproduct` VALUES ('1730', '2015032351555798', '280', '4', '1000', '25.6');
INSERT INTO `orderproduct` VALUES ('1731', '2015032351555798', '281', '1', '250', '4.9');
INSERT INTO `orderproduct` VALUES ('1732', '2015032351555798', '282', '1', '175', '6.6');
INSERT INTO `orderproduct` VALUES ('1733', '2015032310197101', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1734', '2015032399102494', '292', '5', '5', '45.0');
INSERT INTO `orderproduct` VALUES ('1735', '2015032397575550', '32', '2', '800', '18.9');
INSERT INTO `orderproduct` VALUES ('1736', '2015032397575550', '41', '3', '750', '26.7');
INSERT INTO `orderproduct` VALUES ('1737', '2015032350985452', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1738', '2015032355515355', '47', '1', '2400', '32.6');
INSERT INTO `orderproduct` VALUES ('1739', '2015032355515355', '16', '2', '480', '7.5');
INSERT INTO `orderproduct` VALUES ('1740', '2015032350985097', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1741', '2015032350985097', '29', '5', '710', '8.2');
INSERT INTO `orderproduct` VALUES ('1742', '2015032350985097', '261', '5', '835', '7.5');
INSERT INTO `orderproduct` VALUES ('1743', '2015032348505550', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1744', '2015032356569810', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1745', '2015032356519848', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('1746', '2015032356519848', '50', '2', '1800', '20.9');
INSERT INTO `orderproduct` VALUES ('1747', '2015032356519848', '57', '2', '2400', '15.8');
INSERT INTO `orderproduct` VALUES ('1748', '2015032350999810', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1749', '2015032350999810', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('1750', '2015032350999810', '17', '2', '480', '13.2');
INSERT INTO `orderproduct` VALUES ('1751', '2015032348535299', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('1752', '2015032348535299', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('1753', '2015032348535299', '28', '6', '1500', '26.4');
INSERT INTO `orderproduct` VALUES ('1754', '2015032410248514', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('1755', '2015032410248514', '16', '1', '240', '3.7');
INSERT INTO `orderproduct` VALUES ('1756', '2015032410248514', '32', '3', '1200', '28.3');
INSERT INTO `orderproduct` VALUES ('1757', '2015032453525451', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1758', '2015032453525451', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('1759', '2015032453525451', '28', '3', '750', '13.2');
INSERT INTO `orderproduct` VALUES ('1760', '2015032454549910', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('1761', '2015032454549910', '31', '1', '1350', '8.9');
INSERT INTO `orderproduct` VALUES ('1762', '2015032454549910', '37', '5', '5', '16.5');
INSERT INTO `orderproduct` VALUES ('1763', '2015032456100489', '258', '8', '1120', '26.4');
INSERT INTO `orderproduct` VALUES ('1764', '2015032456100489', '261', '2', '300', '2.7');
INSERT INTO `orderproduct` VALUES ('1765', '2015032456100489', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('1766', '2015032453504854', '115', '8', '2000', '31.2');
INSERT INTO `orderproduct` VALUES ('1767', '2015032453504854', '78', '3', '750', '19.2');
INSERT INTO `orderproduct` VALUES ('1768', '2015032448561021', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1769', '2015032448561021', '38', '4', '520', '12.3');
INSERT INTO `orderproduct` VALUES ('1770', '2015032454495550', '450', '2', '500', '7.5');
INSERT INTO `orderproduct` VALUES ('1771', '2015032454495550', '440', '5', '1000', '9.0');
INSERT INTO `orderproduct` VALUES ('1772', '2015032454495550', '435', '5', '1400', '19.0');
INSERT INTO `orderproduct` VALUES ('1773', '2015032456579854', '13', '4', '1400', '27.4');
INSERT INTO `orderproduct` VALUES ('1774', '2015032456579854', '262', '3', '450', '3.6');
INSERT INTO `orderproduct` VALUES ('1775', '2015032449525097', '38', '2', '260', '6.1');
INSERT INTO `orderproduct` VALUES ('1776', '2015032449525097', '39', '3', '1050', '20.6');
INSERT INTO `orderproduct` VALUES ('1777', '2015032449525097', '48', '1', '1', '8.0');
INSERT INTO `orderproduct` VALUES ('1778', '2015032410056525', '416', '2', '460', '10.9');
INSERT INTO `orderproduct` VALUES ('1779', '2015032410056525', '417', '1', '320', '5.0');
INSERT INTO `orderproduct` VALUES ('1780', '2015032410056525', '420', '1', '270', '5.3');
INSERT INTO `orderproduct` VALUES ('1781', '2015032410056525', '419', '1', '270', '3.1');
INSERT INTO `orderproduct` VALUES ('1782', '2015032410056525', '421', '1', '230', '3.1');
INSERT INTO `orderproduct` VALUES ('1783', '2015032410056525', '423', '1', '400', '3.0');
INSERT INTO `orderproduct` VALUES ('1784', '2015032410056525', '422', '1', '100', '2.0');
INSERT INTO `orderproduct` VALUES ('1785', '2015032410056525', '424', '1', '280', '3.2');
INSERT INTO `orderproduct` VALUES ('1786', '2015032410056525', '418', '1', '230', '3.6');
INSERT INTO `orderproduct` VALUES ('1787', '2015032449515457', '420', '4', '1080', '21.2');
INSERT INTO `orderproduct` VALUES ('1788', '2015032449515457', '440', '8', '1200', '10.8');
INSERT INTO `orderproduct` VALUES ('1789', '2015032454499850', '420', '6', '1620', '31.8');
INSERT INTO `orderproduct` VALUES ('1790', '2015032498565556', '419', '4', '4320', '50.1');
INSERT INTO `orderproduct` VALUES ('1791', '2015032498565556', '420', '3', '2430', '47.6');
INSERT INTO `orderproduct` VALUES ('1792', '2015032498565556', '421', '2', '920', '12.5');
INSERT INTO `orderproduct` VALUES ('1793', '2015032449995748', '417', '3', '690', '10.8');
INSERT INTO `orderproduct` VALUES ('1794', '2015032449995748', '418', '3', '690', '10.8');
INSERT INTO `orderproduct` VALUES ('1795', '2015032449995748', '416', '2', '460', '10.9');
INSERT INTO `orderproduct` VALUES ('1796', '2015032450100555', '417', '2', '460', '7.2');
INSERT INTO `orderproduct` VALUES ('1797', '2015032450100555', '418', '2', '460', '7.2');
INSERT INTO `orderproduct` VALUES ('1798', '2015032450100555', '420', '3', '810', '15.9');
INSERT INTO `orderproduct` VALUES ('1799', '2015032454519848', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1800', '2015032454555453', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1801', '2015032454555453', '19', '3', '450', '9.7');
INSERT INTO `orderproduct` VALUES ('1802', '2015032454555453', '21', '3', '960', '11.1');
INSERT INTO `orderproduct` VALUES ('1803', '2015032497515410', '259', '6', '6', '108.0');
INSERT INTO `orderproduct` VALUES ('1804', '2015032497515410', '257', '4', '560', '4.5');
INSERT INTO `orderproduct` VALUES ('1805', '2015032410152534', '307', '2', '500', '48.0');
INSERT INTO `orderproduct` VALUES ('1806', '2015032410051525', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1807', '2015032454101565', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('1808', '2015032454101565', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1809', '2015032454101565', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('1810', '2015032453514810', '417', '9', '2070', '32.3');
INSERT INTO `orderproduct` VALUES ('1811', '2015032452491019', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1812', '2015032452491019', '15', '2', '500', '5.8');
INSERT INTO `orderproduct` VALUES ('1813', '2015032452491019', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('1814', '2015032410199504', '38', '4', '520', '12.3');
INSERT INTO `orderproduct` VALUES ('1815', '2015032410199504', '46', '1', '3600', '41.8');
INSERT INTO `orderproduct` VALUES ('1816', '2015032410252579', '20', '3', '450', '7.9');
INSERT INTO `orderproduct` VALUES ('1817', '2015032410252579', '17', '4', '960', '26.5');
INSERT INTO `orderproduct` VALUES ('1818', '2015032456525299', '417', '10', '230', '3.6');
INSERT INTO `orderproduct` VALUES ('1819', '2015032451974852', '417', '10', '2300', '35.9');
INSERT INTO `orderproduct` VALUES ('1820', '2015032448534950', '417', '9', '2070', '32.3');
INSERT INTO `orderproduct` VALUES ('1821', '2015032453521001', '417', '9', '2070', '32.3');
INSERT INTO `orderproduct` VALUES ('1822', '2015032451101999', '417', '9', '2070', '32.3');
INSERT INTO `orderproduct` VALUES ('1823', '2015032497545555', '419', '9', '2430', '28.2');
INSERT INTO `orderproduct` VALUES ('1824', '2015032497545555', '416', '1', '230', '5.4');
INSERT INTO `orderproduct` VALUES ('1825', '2015032448495156', '418', '1', '230', '3.6');
INSERT INTO `orderproduct` VALUES ('1826', '2015032448495156', '419', '10', '2700', '31.3');
INSERT INTO `orderproduct` VALUES ('1827', '2015032410155100', '418', '9', '2070', '32.3');
INSERT INTO `orderproduct` VALUES ('1828', '2015032497974951', '416', '6', '1380', '32.6');
INSERT INTO `orderproduct` VALUES ('1829', '2015032498551009', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1830', '2015032497485610', '416', '4', '920', '21.7');
INSERT INTO `orderproduct` VALUES ('1831', '2015032497485610', '417', '3', '690', '10.8');
INSERT INTO `orderproduct` VALUES ('1832', '2015032498979897', '53', '4', '1000', '31.6');
INSERT INTO `orderproduct` VALUES ('1833', '2015032450559998', '416', '1', '230', '5.4');
INSERT INTO `orderproduct` VALUES ('1834', '2015032450559998', '417', '1', '230', '3.6');
INSERT INTO `orderproduct` VALUES ('1835', '2015032450559998', '418', '6', '1380', '21.5');
INSERT INTO `orderproduct` VALUES ('1836', '2015032410057101', '416', '5', '1150', '27.1');
INSERT INTO `orderproduct` VALUES ('1837', '2015032410057101', '417', '1', '230', '3.6');
INSERT INTO `orderproduct` VALUES ('1838', '2015032456535753', '422', '8', '1600', '31.4');
INSERT INTO `orderproduct` VALUES ('1839', '2015032410198555', '50', '1', '900', '10.4');
INSERT INTO `orderproduct` VALUES ('1840', '2015032410198555', '45', '1', '250', '6.9');
INSERT INTO `orderproduct` VALUES ('1841', '2015032410198555', '44', '3', '3', '13.5');
INSERT INTO `orderproduct` VALUES ('1842', '2015032499515451', '257', '3', '420', '3.4');
INSERT INTO `orderproduct` VALUES ('1843', '2015032499515451', '19', '9', '1350', '29.2');
INSERT INTO `orderproduct` VALUES ('1844', '2015032499100555', '417', '7', '1610', '25.1');
INSERT INTO `orderproduct` VALUES ('1845', '2015032499100555', '416', '1', '230', '5.4');
INSERT INTO `orderproduct` VALUES ('1846', '2015032453524855', '416', '3', '690', '16.3');
INSERT INTO `orderproduct` VALUES ('1847', '2015032453524855', '417', '4', '920', '14.4');
INSERT INTO `orderproduct` VALUES ('1848', '2015032456569754', '418', '9', '2070', '32.3');
INSERT INTO `orderproduct` VALUES ('1849', '2015032457509910', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1850', '2015032457509910', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('1851', '2015032457509910', '16', '1', '240', '3.7');
INSERT INTO `orderproduct` VALUES ('1852', '2015032457509910', '19', '1', '150', '3.2');
INSERT INTO `orderproduct` VALUES ('1853', '2015032457509910', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1854', '2015032457509910', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('1855', '2015032457509910', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('1856', '2015032449995657', '416', '8', '1840', '43.4');
INSERT INTO `orderproduct` VALUES ('1857', '2015032410099975', '416', '8', '1840', '43.4');
INSERT INTO `orderproduct` VALUES ('1858', '2015032410110198', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1859', '2015032410110198', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1860', '2015032410110198', '16', '4', '960', '15.0');
INSERT INTO `orderproduct` VALUES ('1861', '2015032457101525', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1862', '2015032457101525', '257', '12', '1680', '13.4');
INSERT INTO `orderproduct` VALUES ('1863', '2015032451521004', '430', '31', '4030', '30.6');
INSERT INTO `orderproduct` VALUES ('1864', '2015032450102509', '417', '9', '2070', '32.3');
INSERT INTO `orderproduct` VALUES ('1865', '2015032450101545', '23', '4', '1840', '12.1');
INSERT INTO `orderproduct` VALUES ('1866', '2015032450101545', '28', '3', '750', '13.2');
INSERT INTO `orderproduct` VALUES ('1867', '2015032450101545', '41', '3', '750', '26.7');
INSERT INTO `orderproduct` VALUES ('1868', '2015032410055571', '262', '6', '900', '7.2');
INSERT INTO `orderproduct` VALUES ('1869', '2015032410055571', '57', '3', '3600', '23.8');
INSERT INTO `orderproduct` VALUES ('1870', '2015032498100485', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1871', '2015032498100485', '14', '5', '1400', '24.6');
INSERT INTO `orderproduct` VALUES ('1872', '2015032410056525', '259', '1', '0', '18.0');
INSERT INTO `orderproduct` VALUES ('1873', '2015032410056525', '15', '3', '0', '8.7');
INSERT INTO `orderproduct` VALUES ('1874', '2015032410056525', '14', '2', '0', '9.9');
INSERT INTO `orderproduct` VALUES ('1875', '2015032450102504', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1876', '2015032450102504', '15', '3', '750', '8.7');
INSERT INTO `orderproduct` VALUES ('1877', '2015032450102504', '14', '2', '560', '9.9');
INSERT INTO `orderproduct` VALUES ('1878', '2015032499491024', '435', '10', '2800', '38.1');
INSERT INTO `orderproduct` VALUES ('1879', '2015032499975457', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1880', '2015032499975457', '262', '2', '300', '2.4');
INSERT INTO `orderproduct` VALUES ('1881', '2015032499975457', '14', '2', '560', '9.9');
INSERT INTO `orderproduct` VALUES ('1882', '2015032451491005', '419', '11', '2970', '34.5');
INSERT INTO `orderproduct` VALUES ('1883', '2015032448494954', '422', '8', '1600', '31.4');
INSERT INTO `orderproduct` VALUES ('1884', '2015032456995751', '418', '10', '2300', '35.9');
INSERT INTO `orderproduct` VALUES ('1885', '2015032454974910', '416', '9', '2070', '48.9');
INSERT INTO `orderproduct` VALUES ('1886', '2015032410253531', '419', '13', '3510', '40.7');
INSERT INTO `orderproduct` VALUES ('1887', '2015032410253531', '416', '4', '920', '21.7');
INSERT INTO `orderproduct` VALUES ('1888', '2015032410253531', '420', '3', '810', '15.9');
INSERT INTO `orderproduct` VALUES ('1889', '2015032410148509', '416', '7', '1610', '38.0');
INSERT INTO `orderproduct` VALUES ('1890', '2015032599499955', '420', '7', '1890', '37.0');
INSERT INTO `orderproduct` VALUES ('1891', '2015032550555249', '424', '12', '3360', '39.0');
INSERT INTO `orderproduct` VALUES ('1892', '2015032510097551', '203', '1', '1', '7.0');
INSERT INTO `orderproduct` VALUES ('1893', '2015032510097551', '266', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1894', '2015032510097551', '170', '5', '580', '11.4');
INSERT INTO `orderproduct` VALUES ('1895', '2015032510097551', '227', '4', '790', '9.2');
INSERT INTO `orderproduct` VALUES ('1896', '2015032550505510', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1897', '2015032550505510', '262', '11', '1650', '13.2');
INSERT INTO `orderproduct` VALUES ('1898', '2015032556995010', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1899', '2015032556995010', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1900', '2015032556995010', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('1901', '2015032556995010', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1902', '2015032556995010', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1903', '2015032556995010', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1904', '2015032551999798', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1905', '2015032551999798', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1906', '2015032551999798', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1907', '2015032551999798', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1908', '2015032551999798', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1909', '2015032551999798', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('1910', '2015032551999798', '15', '1', '250', '2.9');
INSERT INTO `orderproduct` VALUES ('1911', '2015032551999798', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('1912', '2015032551999798', '13', '1', '350', '6.9');
INSERT INTO `orderproduct` VALUES ('1913', '2015032599999910', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1914', '2015032599999910', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1915', '2015032599999910', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('1916', '2015032599999910', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('1917', '2015032599999910', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('1918', '2015032599999910', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1919', '2015032554481015', '349', '8', '2180', '13.1');
INSERT INTO `orderproduct` VALUES ('1920', '2015032554481015', '333', '4', '2060', '19.8');
INSERT INTO `orderproduct` VALUES ('1921', '2015032554481015', '303', '2', '500', '8.0');
INSERT INTO `orderproduct` VALUES ('1922', '2015032554481015', '296', '2', '1940', '26.4');
INSERT INTO `orderproduct` VALUES ('1923', '2015032598575754', '416', '5', '1150', '27.1');
INSERT INTO `orderproduct` VALUES ('1924', '2015032598575754', '417', '1', '230', '3.6');
INSERT INTO `orderproduct` VALUES ('1925', '2015032598989751', '416', '6', '1380', '32.6');
INSERT INTO `orderproduct` VALUES ('1926', '2015032555995553', '420', '4', '1080', '21.2');
INSERT INTO `orderproduct` VALUES ('1927', '2015032555995553', '421', '2', '460', '6.3');
INSERT INTO `orderproduct` VALUES ('1928', '2015032555995553', '419', '1', '270', '3.1');
INSERT INTO `orderproduct` VALUES ('1929', '2015032555994898', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1930', '2015032510250100', '256', '4', '0', '25.6');
INSERT INTO `orderproduct` VALUES ('1931', '2015032510250100', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('1932', '2015032510250100', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('1933', '2015032598545150', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('1934', '2015032548101505', '251', '2', '0', '13.0');
INSERT INTO `orderproduct` VALUES ('1935', '2015032548101505', '252', '2', '0', '7.8');
INSERT INTO `orderproduct` VALUES ('1936', '2015032548101505', '255', '2', '0', '9.0');
INSERT INTO `orderproduct` VALUES ('1937', '2015032548101505', '253', '2', '0', '7.6');
INSERT INTO `orderproduct` VALUES ('1938', '2015032548101505', '254', '2', '0', '2.3');
INSERT INTO `orderproduct` VALUES ('1939', '2015032599525656', '251', '8', '0', '51.8');
INSERT INTO `orderproduct` VALUES ('1940', '2015032557541005', '256', '4', '0', '25.6');
INSERT INTO `orderproduct` VALUES ('1941', '2015032557541005', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('1942', '2015032556481005', '15', '5', '1250', '14.5');
INSERT INTO `orderproduct` VALUES ('1943', '2015032556481005', '262', '5', '750', '6.0');
INSERT INTO `orderproduct` VALUES ('1944', '2015032556481005', '23', '5', '2300', '15.2');
INSERT INTO `orderproduct` VALUES ('1945', '2015032510149529', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('1946', '2015032510149529', '256', '1', '0', '6.4');
INSERT INTO `orderproduct` VALUES ('1947', '2015032510149529', '255', '1', '0', '4.5');
INSERT INTO `orderproduct` VALUES ('1948', '2015032510149529', '254', '1', '0', '1.1');
INSERT INTO `orderproduct` VALUES ('1949', '2015032510149529', '253', '1', '0', '3.8');
INSERT INTO `orderproduct` VALUES ('1950', '2015032510149529', '252', '2', '0', '7.8');
INSERT INTO `orderproduct` VALUES ('1951', '2015032510297555', '291', '20', '20', '70.0');
INSERT INTO `orderproduct` VALUES ('1952', '2015032550485748', '420', '6', '1620', '31.8');
INSERT INTO `orderproduct` VALUES ('1953', '2015032551981005', '457', '1', '2700', '118.8');
INSERT INTO `orderproduct` VALUES ('1954', '2015032510152521', '256', '4', '0', '25.6');
INSERT INTO `orderproduct` VALUES ('1955', '2015032510152521', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('1956', '2015032597999799', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('1957', '2015032597999799', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1958', '2015032597999799', '257', '1', '140', '1.1');
INSERT INTO `orderproduct` VALUES ('1959', '2015032597999799', '17', '1', '240', '6.6');
INSERT INTO `orderproduct` VALUES ('1960', '2015032597999799', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('1961', '2015032597999799', '21', '1', '320', '3.7');
INSERT INTO `orderproduct` VALUES ('1962', '2015032549101565', '18', '3', '720', '14.1');
INSERT INTO `orderproduct` VALUES ('1963', '2015032549101565', '24', '3', '1050', '5.9');
INSERT INTO `orderproduct` VALUES ('1964', '2015032549101565', '28', '4', '1000', '17.6');
INSERT INTO `orderproduct` VALUES ('1965', '2015032549515399', '257', '5', '700', '5.6');
INSERT INTO `orderproduct` VALUES ('1966', '2015032549515399', '261', '5', '750', '6.8');
INSERT INTO `orderproduct` VALUES ('1967', '2015032549515399', '258', '7', '980', '23.1');
INSERT INTO `orderproduct` VALUES ('1968', '2015032551101100', '462', '7', '1260', '34.8');
INSERT INTO `orderproduct` VALUES ('1969', '2015032554100101', '20', '1', '150', '2.6');
INSERT INTO `orderproduct` VALUES ('1970', '2015032554100101', '28', '1', '250', '4.4');
INSERT INTO `orderproduct` VALUES ('1971', '2015032554100101', '32', '3', '1200', '28.3');
INSERT INTO `orderproduct` VALUES ('1972', '2015032555991025', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('1973', '2015032555991025', '17', '2', '480', '13.2');
INSERT INTO `orderproduct` VALUES ('1974', '2015032555505357', '251', '5', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('1975', '2015032555101101', '435', '8', '2240', '30.5');
INSERT INTO `orderproduct` VALUES ('1976', '2015032551102519', '431', '20', '2400', '32.6');
INSERT INTO `orderproduct` VALUES ('1977', '2015032551575498', '16', '4', '960', '15.0');
INSERT INTO `orderproduct` VALUES ('1978', '2015032551575498', '23', '4', '1840', '12.1');
INSERT INTO `orderproduct` VALUES ('1979', '2015032551575498', '24', '2', '700', '3.9');
INSERT INTO `orderproduct` VALUES ('1980', '2015032597101571', '418', '9', '2070', '32.3');
INSERT INTO `orderproduct` VALUES ('1981', '2015032551534857', '167', '3', '3970', '27.8');
INSERT INTO `orderproduct` VALUES ('1982', '2015032551534857', '171', '5', '3260', '48.9');
INSERT INTO `orderproduct` VALUES ('1983', '2015032551534857', '249', '18', '2980', '19.1');
INSERT INTO `orderproduct` VALUES ('1984', '2015032551534857', '166', '11', '2620', '35.6');
INSERT INTO `orderproduct` VALUES ('1985', '2015032551534857', '188', '6', '610', '10.7');
INSERT INTO `orderproduct` VALUES ('1986', '2015032510048971', '259', '2', '2', '36.0');
INSERT INTO `orderproduct` VALUES ('1987', '2015032552489950', '256', '4', '0', '25.6');
INSERT INTO `orderproduct` VALUES ('1988', '2015032552489950', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('1989', '2015032552489950', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('1990', '2015032557481025', '445', '3', '450', '14.2');
INSERT INTO `orderproduct` VALUES ('1991', '2015032557481025', '443', '4', '4', '20.0');
INSERT INTO `orderproduct` VALUES ('1992', '2015032598481025', '38', '4', '520', '12.3');
INSERT INTO `orderproduct` VALUES ('1993', '2015032598481025', '44', '4', '4', '18.0');
INSERT INTO `orderproduct` VALUES ('1994', '2015032598481025', '53', '2', '500', '15.8');
INSERT INTO `orderproduct` VALUES ('1995', '2015032552975054', '417', '4', '920', '14.4');
INSERT INTO `orderproduct` VALUES ('1996', '2015032552975054', '454', '2', '1200', '18.7');
INSERT INTO `orderproduct` VALUES ('1997', '2015032553100100', '53', '4', '1000', '31.6');
INSERT INTO `orderproduct` VALUES ('1998', '2015032557101102', '258', '3', '420', '9.9');
INSERT INTO `orderproduct` VALUES ('1999', '2015032557101102', '261', '5', '750', '6.8');
INSERT INTO `orderproduct` VALUES ('2000', '2015032557101102', '20', '6', '900', '15.8');
INSERT INTO `orderproduct` VALUES ('2001', '2015032550555348', '420', '7', '1890', '37.0');
INSERT INTO `orderproduct` VALUES ('2002', '2015032599541025', '418', '10', '2300', '35.9');
INSERT INTO `orderproduct` VALUES ('2003', '2015032553981015', '435', '3', '840', '11.4');
INSERT INTO `orderproduct` VALUES ('2004', '2015032553981015', '454', '2', '1200', '18.7');
INSERT INTO `orderproduct` VALUES ('2005', '2015032556565610', '445', '7', '1050', '33.2');
INSERT INTO `orderproduct` VALUES ('2006', '2015032510297545', '258', '1', '140', '3.3');
INSERT INTO `orderproduct` VALUES ('2007', '2015032510297545', '261', '1', '150', '1.4');
INSERT INTO `orderproduct` VALUES ('2008', '2015032510297545', '262', '1', '150', '1.2');
INSERT INTO `orderproduct` VALUES ('2009', '2015032510297545', '260', '2', '2', '30.0');
INSERT INTO `orderproduct` VALUES ('2010', '2015032597575356', '416', '6', '1380', '32.6');
INSERT INTO `orderproduct` VALUES ('2011', '2015032552535354', '418', '3', '690', '10.8');
INSERT INTO `orderproduct` VALUES ('2012', '2015032552535354', '435', '3', '840', '11.4');
INSERT INTO `orderproduct` VALUES ('2013', '2015032552535354', '450', '3', '750', '11.3');
INSERT INTO `orderproduct` VALUES ('2014', '2015032510198995', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('2015', '2015032553545099', '417', '3', '690', '10.8');
INSERT INTO `orderproduct` VALUES ('2016', '2015032553545099', '418', '6', '1380', '21.5');
INSERT INTO `orderproduct` VALUES ('2017', '2015032549515357', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('2018', '2015032549515357', '23', '1', '460', '3.0');
INSERT INTO `orderproduct` VALUES ('2019', '2015032549515357', '29', '6', '900', '10.4');
INSERT INTO `orderproduct` VALUES ('2020', '2015032597535698', '435', '1', '0', '3.8');
INSERT INTO `orderproduct` VALUES ('2021', '2015032597535698', '436', '10', '0', '26.7');
INSERT INTO `orderproduct` VALUES ('2022', '2015032555100574', '422', '4', '800', '15.7');
INSERT INTO `orderproduct` VALUES ('2023', '2015032555100574', '427', '3', '600', '15.1');
INSERT INTO `orderproduct` VALUES ('2024', '2015032556981011', '426', '1', '420', '5.7');
INSERT INTO `orderproduct` VALUES ('2025', '2015032556981011', '427', '5', '1000', '25.2');
INSERT INTO `orderproduct` VALUES ('2026', '2015032549555554', '259', '1', '1', '18.0');
INSERT INTO `orderproduct` VALUES ('2027', '2015032549555554', '261', '3', '450', '4.1');
INSERT INTO `orderproduct` VALUES ('2028', '2015032549555554', '14', '2', '560', '9.9');
INSERT INTO `orderproduct` VALUES ('2029', '2015032552565397', '418', '10', '0', '35.9');
INSERT INTO `orderproduct` VALUES ('2030', '2015032510055100', '262', '3', '450', '3.6');
INSERT INTO `orderproduct` VALUES ('2031', '2015032510055100', '37', '3', '3', '9.9');
INSERT INTO `orderproduct` VALUES ('2032', '2015032510055100', '45', '2', '500', '13.8');
INSERT INTO `orderproduct` VALUES ('2033', '2015032510055100', '29', '2', '300', '3.5');
INSERT INTO `orderproduct` VALUES ('2034', '2015032550515553', '280', '7', '1750', '44.8');
INSERT INTO `orderproduct` VALUES ('2035', '2015032548561011', '307', '2', '500', '48.0');
INSERT INTO `orderproduct` VALUES ('2036', '2015032549101971', '260', '1', '1', '15.0');
INSERT INTO `orderproduct` VALUES ('2037', '2015032549101971', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('2038', '2015032549101971', '13', '2', '700', '13.7');
INSERT INTO `orderproduct` VALUES ('2039', '2015032597549949', '418', '9', '0', '32.3');
INSERT INTO `orderproduct` VALUES ('2040', '2015032597529753', '302', '2', '500', '5.0');
INSERT INTO `orderproduct` VALUES ('2041', '2015032597529753', '350', '3', '1160', '8.8');
INSERT INTO `orderproduct` VALUES ('2042', '2015032597529753', '300', '2', '500', '12.8');
INSERT INTO `orderproduct` VALUES ('2043', '2015032597529753', '290', '2', '500', '5.8');
INSERT INTO `orderproduct` VALUES ('2044', '2015032597529753', '291', '1', '1', '3.5');
INSERT INTO `orderproduct` VALUES ('2045', '2015032597529753', '319', '2', '500', '8.8');
INSERT INTO `orderproduct` VALUES ('2046', '2015032597529753', '359', '1', '250', '4.4');
INSERT INTO `orderproduct` VALUES ('2047', '2015032510053489', '418', '9', '0', '32.3');
INSERT INTO `orderproduct` VALUES ('2048', '2015032597525699', '45', '1', '250', '6.9');
INSERT INTO `orderproduct` VALUES ('2049', '2015032597525699', '40', '1', '750', '28.2');
INSERT INTO `orderproduct` VALUES ('2050', '2015032597525699', '38', '1', '130', '3.1');
INSERT INTO `orderproduct` VALUES ('2051', '2015032550975057', '436', '12', '2760', '32.0');
INSERT INTO `orderproduct` VALUES ('2052', '2015032554541025', '417', '12', '2760', '43.1');
INSERT INTO `orderproduct` VALUES ('2053', '2015032549489753', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('2054', '2015032555515254', '280', '5', '1250', '32.0');
INSERT INTO `orderproduct` VALUES ('2055', '2015032553535055', '449', '3', '1800', '49.7');
INSERT INTO `orderproduct` VALUES ('2056', '2015032550514948', '14', '1', '280', '4.9');
INSERT INTO `orderproduct` VALUES ('2057', '2015032550514948', '18', '1', '240', '4.7');
INSERT INTO `orderproduct` VALUES ('2058', '2015032550514948', '19', '7', '1050', '22.7');
INSERT INTO `orderproduct` VALUES ('2059', '2015032599579910', '446', '3', '3', '30.0');
INSERT INTO `orderproduct` VALUES ('2060', '2015032553559755', '260', '1', '0', '15.0');
INSERT INTO `orderproduct` VALUES ('2061', '2015032553559755', '13', '5', '0', '34.3');
INSERT INTO `orderproduct` VALUES ('2062', '2015032810257574', '256', '11', '0', '70.4');
INSERT INTO `orderproduct` VALUES ('2063', '2015032810249511', '256', '8', '0', '51.2');
INSERT INTO `orderproduct` VALUES ('2064', '2015032810155981', '256', '8', '0', '51.2');
INSERT INTO `orderproduct` VALUES ('2065', '2015032898999951', '256', '12', '0', '76.8');
INSERT INTO `orderproduct` VALUES ('2066', '2015032810010052', '256', '10', '0', '64.0');
INSERT INTO `orderproduct` VALUES ('2067', '2015032899541024', '256', '8', '0', '51.2');
INSERT INTO `orderproduct` VALUES ('2068', '2015032810199565', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('2069', '2015032857491011', '256', '8', '0', '51.2');
INSERT INTO `orderproduct` VALUES ('2070', '2015032851999853', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('2071', '2015032853515699', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('2072', '2015032853101102', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('2073', '2015032853101102', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('2074', '2015032810055564', '256', '6', '0', '38.4');
INSERT INTO `orderproduct` VALUES ('2075', '2015032857525754', '256', '8', '0', '51.2');
INSERT INTO `orderproduct` VALUES ('2076', '2015032810010251', '256', '7', '0', '44.8');
INSERT INTO `orderproduct` VALUES ('2077', '2015032852555649', '256', '7', '0', '44.8');
INSERT INTO `orderproduct` VALUES ('2078', '2015033010149575', '256', '3', '750', '19.2');
INSERT INTO `orderproduct` VALUES ('2079', '2015033010149575', '251', '3', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2080', '2015033050525456', '256', '6', '1500', '38.4');
INSERT INTO `orderproduct` VALUES ('2081', '2015033050525456', '251', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('2082', '2015040110210198', '256', '4', '0', '25.6');
INSERT INTO `orderproduct` VALUES ('2083', '2015040110210198', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('2084', '2015040150991005', '256', '5', '0', '32.0');
INSERT INTO `orderproduct` VALUES ('2085', '2015040150991005', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('2086', '2015040148535754', '256', '4', '1000', '25.6');
INSERT INTO `orderproduct` VALUES ('2087', '2015040148535754', '251', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('2088', '2015040157994856', '256', '4', '1000', '25.6');
INSERT INTO `orderproduct` VALUES ('2089', '2015040157994856', '251', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('2090', '2015040152995551', '256', '4', '1000', '25.6');
INSERT INTO `orderproduct` VALUES ('2091', '2015040152995551', '251', '1', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2092', '2015040198101575', '256', '4', '1000', '25.6');
INSERT INTO `orderproduct` VALUES ('2093', '2015040198101575', '251', '1', '250', '5.4');
INSERT INTO `orderproduct` VALUES ('2094', '2015040197499851', '256', '2', '500', '12.8');
INSERT INTO `orderproduct` VALUES ('2095', '2015040197499851', '251', '5', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2096', '2015040197499851', '252', '4', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2097', '2015040110049574', '256', '6', '1500', '38.4');
INSERT INTO `orderproduct` VALUES ('2098', '2015040110049574', '251', '1', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2099', '2015040154501024', '251', '10', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2100', '2015040198511001', '251', '8', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2101', '2015040148975249', '256', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('2102', '2015040148975249', '251', '5', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2103', '2015040149521029', '256', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('2104', '2015040149521029', '251', '5', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2105', '2015040154505253', '256', '1', '250', '6.4');
INSERT INTO `orderproduct` VALUES ('2106', '2015040154505253', '251', '4', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2107', '2015040351519750', '256', '10', '0', '64.0');
INSERT INTO `orderproduct` VALUES ('2108', '2015040351519750', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('2109', '2015040899535250', '256', '6', '0', '38.4');
INSERT INTO `orderproduct` VALUES ('2110', '2015040899535250', '251', '1', '0', '6.5');
INSERT INTO `orderproduct` VALUES ('2111', '2015040899535250', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2112', '2015040899979748', '251', '5', '0', '32.4');
INSERT INTO `orderproduct` VALUES ('2113', '2015040899979748', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2114', '2015040810254525', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('2115', '2015040810254525', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2116', '2015040853985397', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('2117', '2015040853985397', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2118', '2015040851975754', '251', '8', '0', '51.8');
INSERT INTO `orderproduct` VALUES ('2119', '2015040851975754', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2120', '2015040899519910', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('2121', '2015040899519910', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2122', '2015040848491001', '251', '5', '0', '32.4');
INSERT INTO `orderproduct` VALUES ('2123', '2015040848491001', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2124', '2015040853525150', '251', '7', '0', '45.4');
INSERT INTO `orderproduct` VALUES ('2125', '2015040853525150', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2126', '2015040851100519', '251', '5', '0', '32.4');
INSERT INTO `orderproduct` VALUES ('2127', '2015040851100519', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2128', '2015040850561005', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('2129', '2015040850561005', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2130', '2015040855545350', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('2131', '2015040855545350', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2132', '2015040848515210', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('2133', '2015040848515210', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2134', '2015040851505353', '251', '5', '0', '32.4');
INSERT INTO `orderproduct` VALUES ('2135', '2015040851505353', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2136', '2015040897514850', '251', '6', '1200', '25.9');
INSERT INTO `orderproduct` VALUES ('2137', '2015040897514850', '252', '1', '200', '3.1');
INSERT INTO `orderproduct` VALUES ('2138', '2015040897101575', '13', '5', '0', '34.3');
INSERT INTO `orderproduct` VALUES ('2139', '2015040897101575', '14', '1', '0', '4.9');
INSERT INTO `orderproduct` VALUES ('2140', '2015040856101494', '251', '6', '1600', '34.6');
INSERT INTO `orderproduct` VALUES ('2141', '2015040856101494', '252', '1', '200', '3.1');
INSERT INTO `orderproduct` VALUES ('2142', '2015040852541025', '13', '5', '0', '0.0');
INSERT INTO `orderproduct` VALUES ('2143', '2015040852541025', '14', '1', '200', '3.5');
INSERT INTO `orderproduct` VALUES ('2144', '2015041110051515', '251', '8', '0', '51.8');
INSERT INTO `orderproduct` VALUES ('2145', '2015041110051515', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2146', '2015041148100989', '251', '9', '0', '58.3');
INSERT INTO `orderproduct` VALUES ('2147', '2015041148100989', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2148', '2015041149102484', '251', '6', '0', '38.9');
INSERT INTO `orderproduct` VALUES ('2149', '2015041149102484', '252', '1', '0', '3.9');
INSERT INTO `orderproduct` VALUES ('2150', '2015041110099521', '13', '14', '0', '96.0');
INSERT INTO `orderproduct` VALUES ('2151', '2015041110099521', '14', '1', '0', '4.9');
INSERT INTO `orderproduct` VALUES ('2152', '2015041251981025', '200', '7', '0', '47.6');
INSERT INTO `orderproduct` VALUES ('2153', '2015041251494999', '13', '9', '0', '61.7');
INSERT INTO `orderproduct` VALUES ('2154', '2015041251494999', '14', '1', '0', '4.9');
INSERT INTO `orderproduct` VALUES ('2155', '2015041699985251', '476', '3', '0', '33.0');
INSERT INTO `orderproduct` VALUES ('2156', '2015041648524998', '476', '3', '0', '33.0');
INSERT INTO `orderproduct` VALUES ('2157', '2015041654545710', '476', '5', '0', '55.0');
INSERT INTO `orderproduct` VALUES ('2158', '2015041657975410', '476', '3', '0', '33.0');
INSERT INTO `orderproduct` VALUES ('2159', '2015041650100501', '476', '9', '0', '99.0');
INSERT INTO `orderproduct` VALUES ('2160', '2015041654569756', '476', '9', '0', '99.0');
INSERT INTO `orderproduct` VALUES ('2161', '2015041652575450', '476', '8', '0', '88.0');
INSERT INTO `orderproduct` VALUES ('2162', '2015041697571015', '476', '9', '0', '99.0');
INSERT INTO `orderproduct` VALUES ('2163', '2015041656521019', '476', '9', '0', '99.0');
INSERT INTO `orderproduct` VALUES ('2164', '2015041699101515', '476', '9', '0', '99.0');
INSERT INTO `orderproduct` VALUES ('2165', '2015041652534910', '476', '9', '0', '99.0');
INSERT INTO `orderproduct` VALUES ('2166', '2015041655485354', '476', '9', '0', '99.0');
INSERT INTO `orderproduct` VALUES ('2167', '2015041656564997', '476', '8', '0', '88.0');
INSERT INTO `orderproduct` VALUES ('2168', '2015041699971025', '476', '5', '0', '55.0');
INSERT INTO `orderproduct` VALUES ('2169', '2015041610010055', '476', '5', '0', '55.0');
INSERT INTO `orderproduct` VALUES ('2170', '2015041699561024', '476', '9', '0', '99.0');
INSERT INTO `orderproduct` VALUES ('2171', '2015041610199535', '476', '6', '0', '66.0');
INSERT INTO `orderproduct` VALUES ('2172', '2015041652102481', '476', '4', '0', '44.0');
INSERT INTO `orderproduct` VALUES ('2173', '2015041610010052', '476', '11', '0', '121.0');
INSERT INTO `orderproduct` VALUES ('2174', '2015041610250555', '476', '14', '0', '154.0');
INSERT INTO `orderproduct` VALUES ('2175', '2015041650985298', '476', '3', '0', '33.0');
INSERT INTO `orderproduct` VALUES ('2176', '2015041654515410', '476', '6', '0', '66.0');
INSERT INTO `orderproduct` VALUES ('2177', '2015041698521015', '476', '4', '0', '44.0');
INSERT INTO `orderproduct` VALUES ('2178', '2015041698501019', '476', '7', '0', '77.0');
INSERT INTO `orderproduct` VALUES ('2179', '2015041653975052', '476', '5', '0', '55.0');
INSERT INTO `orderproduct` VALUES ('2180', '2015041697555754', '476', '7', '0', '77.0');
INSERT INTO `orderproduct` VALUES ('2181', '2015041699509797', '476', '4', '0', '44.0');
INSERT INTO `orderproduct` VALUES ('2182', '2015041653999749', '476', '5', '0', '55.0');
INSERT INTO `orderproduct` VALUES ('2183', '2015041610056505', '476', '7', '0', '77.0');
INSERT INTO `orderproduct` VALUES ('2184', '2015041657541015', '476', '4', '0', '44.0');
INSERT INTO `orderproduct` VALUES ('2185', '2015041652485450', '476', '6', '0', '66.0');
INSERT INTO `orderproduct` VALUES ('2186', '2015041699489810', '476', '6', '1500', '66.0');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` varchar(32) NOT NULL,
  `orderstatus` int(3) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  `shopid` int(11) NOT NULL DEFAULT '0',
  `paystatus` int(11) DEFAULT '0',
  `totalprice` decimal(10,1) DEFAULT '0.0',
  `address` text,
  `phone` varchar(255) DEFAULT '',
  `createdtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rtotalprice` decimal(10,1) DEFAULT '0.0',
  `dltime` varchar(32) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT '',
  `ordernotes` varchar(255) DEFAULT '',
  `isfirst` int(3) DEFAULT '0',
  `discount` decimal(10,1) DEFAULT '0.0',
  `totalpricebefore` decimal(10,1) DEFAULT '0.0',
  `rtotalpricebefore` decimal(10,1) DEFAULT '0.0',
  `lat` double DEFAULT '0',
  `distance` int(11) DEFAULT '0',
  `isdelivery` tinyint(2) DEFAULT '0',
  `lng` double DEFAULT '0',
  `ispickup` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '0', '0', '15', '0', '0.0', null, '', '2015-04-17 17:26:24', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('123123123123123', '0', '0', '15', '0', '0.0', null, '', '2015-04-17 17:26:10', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2', '0', '0', '15', '0', '0.0', null, '', '2015-04-17 17:26:27', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041610056505', '0', '41', '15', '0', '67.0', '撒旦', '15502187076', '2015-04-15 20:36:13', '0.0', '立即送出', '', '戴玺', '', '1', '10.0', '77.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041652485450', '0', '41', '15', '0', '66.0', '撒旦', '15502187076', '2015-04-16 20:36:52', '0.0', '立即送出', '', '戴玺', '', '0', '0.0', '66.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041657541015', '0', '41', '15', '0', '39.0', '撒旦', '15502187723', '2015-04-16 20:36:41', '0.0', '立即送出', '', '戴玺', '', '0', '5.0', '44.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041699489810', '0', '0', '0', '0', '0.0', null, '', '2015-04-17 17:50:02', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041699489811', '1', '41', '15', '0', '66.0', '撒旦', '15502187076', '2015-04-16 20:37:00', '61.0', '立即送出', '', '戴玺', '', '0', '0.0', '66.0', '66.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041699489812', '0', '0', '15', '0', '0.0', null, '', '2015-04-17 17:49:25', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041699489813', '0', '0', '15', '0', '0.0', null, '', '2015-04-17 17:49:31', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041699489814', '0', '0', '15', '0', '0.0', null, '', '2015-04-17 17:49:36', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041699489816', '0', '0', '15', '0', '0.0', null, '', '2015-04-17 17:49:43', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('2015041699489819', '0', '0', '15', '0', '0.0', null, '', '2015-04-17 17:49:51', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('3', '0', '0', '15', '0', '0.0', null, '', '2015-04-17 17:26:34', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('4', '0', '0', '0', '0', '0.0', null, '', '2015-04-17 17:27:07', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('5', '0', '0', '0', '0', '0.0', null, '', '2015-04-17 17:27:13', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('6', '0', '0', '0', '0', '0.0', null, '', '2015-04-17 17:27:18', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);
INSERT INTO `orders` VALUES ('7', '0', '0', '0', '0', '0.0', null, '', '2015-04-17 17:27:23', '0.0', null, null, '', '', '0', '0.0', '0.0', '0.0', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) DEFAULT '',
  `pimgurl` varchar(255) DEFAULT '',
  `issale` tinyint(2) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `price` decimal(5,1) DEFAULT '0.0',
  `discount` decimal(5,1) DEFAULT '0.0',
  `attribute` int(3) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `unit` varchar(255) DEFAULT '',
  `unitweight` int(6) DEFAULT '0',
  `shopid` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=478 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('13', '新疆阿克苏', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dmqmovsdgf1jvg1c33113t3sb9.jpg', '1', '0', '11.8', '9.8', '1', '1', '斤', '350', '12');
INSERT INTO `product` VALUES ('14', '洛川红富士（拉丝）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dmqo56d1f5te2l7ulcja128al.jpg', '1', '0', '8.8', '8.8', '1', '1', '斤', '280', '12');
INSERT INTO `product` VALUES ('15', '陕西红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1e1usbooh11v92lsvpfm2t.jpg', '1', '0', '5.8', '5.8', '1', '1', '斤', '250', '12');
INSERT INTO `product` VALUES ('16', '黄蕉苹果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr23jceld016bm14lfkeoopbat.jpg', '1', '0', '7.8', '7.8', '1', '1', '斤', '240', '12');
INSERT INTO `product` VALUES ('17', '红蛇果（进口）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drs3gofuvk1dbl17i4jdt2tt1f.jpg', '1', '0', '13.8', '13.8', '1', '1', '斤', '240', '12');
INSERT INTO `product` VALUES ('18', '红蛇果（国产）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drs6u2f7hk4g01mjb1evgmm1r.png', '1', '0', '9.8', '9.8', '1', '1', '斤', '240', '12');
INSERT INTO `product` VALUES ('19', '库尔勒香梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drs7ghtdqrkjgmuu1frq1h1n27.jpg', '1', '0', '10.8', '10.8', '1', '2', '斤', '150', '12');
INSERT INTO `product` VALUES ('20', '香梨王', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1bkl91mhdnr12h7n2g1c3120.jpg', '1', '0', '8.8', '8.8', '1', '2', '斤', '150', '12');
INSERT INTO `product` VALUES ('21', '天山雪梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drse042hqdnq61nm71v2ngrl2v.jpg', '1', '0', '5.8', '5.8', '1', '2', '斤', '320', '12');
INSERT INTO `product` VALUES ('22', '天津鸭梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1ca401hqfonk1egqt6i5ut2c.jpg', '1', '0', '4.5', '4.5', '1', '1', '斤', '300', '12');
INSERT INTO `product` VALUES ('23', '砀山梨（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drsj9t91qdv1mts19r710tc1hmo3n.jpg', '1', '0', '2.8', '3.3', '1', '2', '斤', '460', '12');
INSERT INTO `product` VALUES ('24', '砀山梨（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drsjk4dt801i97s6793t17ee43.jpg', '1', '0', '2.0', '2.8', '1', '2', '斤', '350', '12');
INSERT INTO `product` VALUES ('25', '皇帝贡柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drsmq0ctlb1fr7vrttgr1a184f.jpg', '0', '0', '9.8', '9.8', '1', '4', '', '100', '12');
INSERT INTO `product` VALUES ('26', '帝皇贡柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drsn46l1n85189e4ge1phu1ev64r.jpg', '0', '0', '7.8', '7.8', '1', '4', '斤', '100', '12');
INSERT INTO `product` VALUES ('27', '砂糖桔（精品）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1aa50c3c129719gk1uiirqp18.jpg', '1', '0', '8.8', '10.8', '2', '4', '斤', '0', '12');
INSERT INTO `product` VALUES ('28', '砂糖桔（促销）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drst6mv1l9h1no47qm1tu413b05j.jpg', '1', '0', '6.8', '8.8', '2', '4', '斤', '0', '12');
INSERT INTO `product` VALUES ('29', '芦柑（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drsvag91om81hsp15kl168s1scn5v.jpg', '1', '0', '5.8', '5.8', '1', '4', '斤', '150', '12');
INSERT INTO `product` VALUES ('30', '蜜柚（红心）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drt9nbu1bphdif1be8nvb1v6v6b.jpg', '1', '0', '6.8', '6.8', '1', '4', '斤', '1350', '12');
INSERT INTO `product` VALUES ('31', '蜜柚（白心）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drta2kengs1r7o1ssl9v81emi6n.jpg', '1', '0', '3.3', '3.3', '1', '4', '斤', '1350', '12');
INSERT INTO `product` VALUES ('32', '美国西柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drtajuko1b1d0f1h6v1qoj1lbn73.jpg', '1', '0', '11.8', '11.8', '1', '4', '斤', '400', '12');
INSERT INTO `product` VALUES ('33', '桂林金桔（精品）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drtd3u014a01p0dsuc1uq21qdb7f.jpg', '1', '0', '9.8', '10.8', '2', '4', '斤', '0', '12');
INSERT INTO `product` VALUES ('34', '桂林金桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drter565ma1o5dqi8uvd1jbf7r.jpg', '1', '0', '7.8', '7.8', '2', '4', '斤', '0', '12');
INSERT INTO `product` VALUES ('35', '精品脐橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drtgqnm1ntvbc5o67c3o1ul87.jpg', '1', '0', '5.8', '6.8', '1', '4', '斤', '210', '12');
INSERT INTO `product` VALUES ('36', '江西赣南橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drth5do1i555aa1jnrlrb1i18j.jpg', '1', '0', '4.3', '5.0', '1', '4', '', '200', '12');
INSERT INTO `product` VALUES ('37', '黄心猕猴桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drtjdif10so6go1bu9obf1p8h8v.jpg', '1', '0', '3.3', '3.3', '3', '5', '个', '0', '12');
INSERT INTO `product` VALUES ('38', '鸡蛋芒', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drtloq912ru1uoj1lbos3pq2t9b.jpg', '1', '0', '10.8', '11.8', '1', '6', '斤', '130', '12');
INSERT INTO `product` VALUES ('39', '澳芒', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drtnj9g1iqa1o1c195q11is16m99n.jpg', '1', '0', '8.8', '9.8', '1', '1', '斤', '350', '12');
INSERT INTO `product` VALUES ('40', '红肉火龙果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drtpavt17e21op410011lma57a3.jpg', '1', '0', '13.8', '18.8', '1', '6', '斤', '750', '12');
INSERT INTO `product` VALUES ('41', '红提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drtrspooj5ukma2411qjllcaf.jpeg', '1', '0', '15.8', '17.8', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('42', '车厘子（精品）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dru02pp17siukfhdd10tpis5bq.png', '1', '0', '48.0', '48.0', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('43', '车厘子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dru0i5i16kh9pjsed14r1mrlc6.jpg', '0', '0', '39.8', '28.0', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('44', '新西兰奇异果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvv7k865p1q04ku91fmp1nflos.png', '1', '0', '4.5', '4.5', '3', '5', '个', '0', '12');
INSERT INTO `product` VALUES ('45', '桂圆', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dru6f5k1gtnja81fhr11n7oshcu.jpg', '1', '0', '13.8', '13.8', '2', '1', '斤', '0', '12');
INSERT INTO `product` VALUES ('46', '西瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dru8munad6378hs51vvt119eda.jpg', '1', '0', '5.5', '5.8', '1', '3', '斤', '3600', '12');
INSERT INTO `product` VALUES ('47', '哈密瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19druaeg6nepe92bgd7er6eidm.jpg', '1', '0', '5.8', '6.8', '1', '3', '斤', '2400', '12');
INSERT INTO `product` VALUES ('48', '智利蓝莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drv68h6jfvl4g42fbk31u9ejm.png', '1', '0', '16.0', '8.0', '3', '1', '盒', '0', '12');
INSERT INTO `product` VALUES ('49', '海南千禧圣女果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drueugjdkd1u0h3071h6h1l7bee.jpg', '1', '0', '8.8', '7.8', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('50', '红肉木瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drugljs8leqf7epiqbo15ipeq.jpg', '1', '0', '5.5', '5.8', '1', '3', '斤', '900', '12');
INSERT INTO `product` VALUES ('51', '柿饼', 'http://7u2out.com1.z0.glb.clouddn.com/o_19druj07v1bqfrin86ou4s24f6.jpg', '1', '0', '2.0', '2.0', '3', '6', '个', '0', '12');
INSERT INTO `product` VALUES ('52', '台湾橄榄', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drun4371ojd13orf5u1nf419tkfi.jpg', '1', '0', '15.0', '15.0', '3', '6', '盒', '0', '12');
INSERT INTO `product` VALUES ('53', '草莓（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19druqb1k1jhis591i4612sf2bpfu.jpg', '1', '0', '15.8', '15.8', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('54', '草莓（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19druqnaku0u57o1mrl1psdmvuga.jpg', '1', '0', '10.8', '8.8', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('55', '元祖牛油果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drur53dqrduijv371lh11csggm.jpg', '1', '0', '9.0', '9.0', '3', '6', '个', '0', '12');
INSERT INTO `product` VALUES ('56', '柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drusl1b1hgbq8jj3a1fmm1e5h2.jpg', '1', '0', '11.8', '11.8', '1', '6', '斤', '200', '12');
INSERT INTO `product` VALUES ('57', '海南菠萝（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsgmmog1qu61g5b1tn8oo03pph8.jpg', '1', '0', '3.3', '3.3', '1', '6', '斤', '1200', '12');
INSERT INTO `product` VALUES ('58', '海南菠萝（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsgme2sj3c1bdnkr7kv1jcvgs.jpg', '1', '0', '2.5', '2.8', '1', '6', '斤', '950', '12');
INSERT INTO `product` VALUES ('59', '美国大红提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drv2jcr56j16ss11qbeud1s66i6.jpg', '1', '0', '18.5', '13.8', '2', '6', '斤', '1800', '13');
INSERT INTO `product` VALUES ('60', '凤梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drv35g11glg4nj1iar1l931tm7ii.jpg', '1', '0', '7.8', '7.8', '1', '6', '斤', '1800', '13');
INSERT INTO `product` VALUES ('61', '智利蓝莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drv5qnm1omvh56j171ic1308ja.png', '1', '0', '17.0', '10.0', '3', '6', '盒', '0', '13');
INSERT INTO `product` VALUES ('62', '新奇士甜橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvab82t8br9eg8fdc17o5k2.jpg', '1', '0', '14.8', '16.8', '1', '4', '斤', '230', '13');
INSERT INTO `product` VALUES ('63', '美国红蛇果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvbpbglf12v01dui1pv0tk1ke.jpg', '1', '0', '15.8', '15.8', '1', '1', '斤', '220', '13');
INSERT INTO `product` VALUES ('64', '红心火龙果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvch49157i5t1uv89kf1kmckq.jpg', '1', '0', '18.5', '19.5', '1', '6', '斤', '800', '13');
INSERT INTO `product` VALUES ('65', '红心葡萄柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drveb801f2aqu138t1iqd1kf5lb.jpg', '1', '0', '9.9', '7.5', '1', '6', '个', '350', '13');
INSERT INTO `product` VALUES ('66', '泰国椰青', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvgrv1qlf71f1l4d1st8rabln.png', '1', '0', '7.8', '7.8', '1', '6', '斤', '1300', '13');
INSERT INTO `product` VALUES ('67', '国产柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvi9sq1iam18l81e9c12o612n7n0.jpg', '1', '0', '11.8', '11.8', '1', '6', '斤', '140', '13');
INSERT INTO `product` VALUES ('68', '新奇士柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvhq0c1ts41hj91m9c1v2udccmf.jpg', '1', '0', '15.0', '18.8', '1', '6', '斤', '110', '13');
INSERT INTO `product` VALUES ('69', '海南鲜柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvl2ndigk1m00d07aq21g43nc.jpg', '1', '0', '8.0', '8.0', '3', '6', '包', '0', '13');
INSERT INTO `product` VALUES ('70', '越南白肉火龙果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvojkf1f9e1eu6h641pfve9cno.jpg', '1', '0', '7.5', '7.5', '1', '6', '斤', '650', '13');
INSERT INTO `product` VALUES ('71', '牛油果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvp4m91bof1p4u1qgd1k8b1imdo4.jpg', '1', '0', '10.0', '8.0', '3', '1', '个', '0', '13');
INSERT INTO `product` VALUES ('72', '智利奇异果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19drvsfk7kq64so1auf1jq58rcog.jpg', '1', '0', '4.5', '4.5', '3', '5', '个', '0', '13');
INSERT INTO `product` VALUES ('73', '新西兰佳沛绿果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds00orl1ruq1bssm2ttpj1bqmpm.png', '1', '0', '5.5', '5.5', '3', '6', '个', '0', '13');
INSERT INTO `product` VALUES ('74', '车厘子（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds02a5912ubrr2128s1ll918l4q2.jpg', '0', '0', '38.0', '38.0', '2', '6', '斤', '0', '13');
INSERT INTO `product` VALUES ('75', '车厘子（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds02jajshh1nn45srb70rmmqe.jpg', '0', '0', '48.0', '48.0', '2', '6', '斤', '0', '13');
INSERT INTO `product` VALUES ('76', '车厘子（精品）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds02s2fjp012lja5qqp1e54qq.png', '0', '0', '68.0', '68.0', '2', '6', '斤', '0', '13');
INSERT INTO `product` VALUES ('77', '茂谷柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds06fj91grcnja1ag81fqq1rf2r6.png', '1', '0', '18.5', '18.5', '1', '4', '斤', '200', '13');
INSERT INTO `product` VALUES ('78', '龙眼', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds06vvibob1sco1om35itmdri.jpg', '1', '0', '16.8', '12.8', '2', '6', '斤', '0', '13');
INSERT INTO `product` VALUES ('79', '砀山梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds07g13vkqi0qqm5pdb9ru.jpg', '1', '0', '2.9', '3.0', '1', '2', '斤', '450', '13');
INSERT INTO `product` VALUES ('80', '鸭梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1g4c41o9os71h54tc6djl3s.jpg', '1', '0', '4.6', '4.6', '1', '2', '斤', '300', '13');
INSERT INTO `product` VALUES ('81', '贡梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1h2r963l16dl1440ga9aov4f.jpg', '1', '0', '5.0', '5.0', '1', '2', '斤', '400', '13');
INSERT INTO `product` VALUES ('82', '皇冠梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds08m33s4mmvq15jum64a1qt2.jpg', '1', '0', '5.9', '5.9', '1', '2', '斤', '300', '13');
INSERT INTO `product` VALUES ('83', '库尔勒香梨（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds093j8o40ki114va24p1mhmte.jpg', '1', '0', '9.5', '9.5', '1', '2', '斤', '150', '13');
INSERT INTO `product` VALUES ('84', '香梨(小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds0atcc1p211qo28671nfd8ihtq.jpg', '1', '0', '7.5', '7.5', '1', '2', '斤', '110', '13');
INSERT INTO `product` VALUES ('85', '秦岭野生猕猴桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds0cuo31a1915t4pr8c5gns5u6.jpg', '1', '0', '2.5', '3.3', '3', '5', '个', '0', '13');
INSERT INTO `product` VALUES ('86', '周至猕猴桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds0f5k7jo1o9vpv5gq3birui.jpg', '0', '0', '2.0', '2.0', '3', '5', '个', '0', '13');
INSERT INTO `product` VALUES ('87', '手剥橙（优）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds0m65q17b11kl51m71v921895uu.jpg', '0', '0', '11.8', '11.8', '1', '4', '斤', '110', '13');
INSERT INTO `product` VALUES ('88', '手剥橙（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds0mgtm19801hkp92qemr50uva.jpg', '0', '0', '10.8', '10.8', '1', '4', '斤', '90', '13');
INSERT INTO `product` VALUES ('89', '南丰贡桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds0ounlecvvstkc1s91unmvm.png', '0', '0', '5.3', '5.3', '2', '4', '斤', '0', '13');
INSERT INTO `product` VALUES ('90', '马水蜜橘', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1fjmhmke1p4r1uvgpjhtib3g.jpg', '1', '0', '6.5', '8.8', '2', '4', '斤', '0', '13');
INSERT INTO `product` VALUES ('91', '西州密', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds0ump81nps1ct2f5012ll6et10e.jpg', '1', '0', '5.8', '8.8', '1', '3', '斤', '2000', '13');
INSERT INTO `product` VALUES ('92', '榴莲', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds12rphn2p4pu15hu96r1neu10q.jpg', '1', '0', '17.8', '16.5', '1', '6', '斤', '1700', '13');
INSERT INTO `product` VALUES ('93', '陕西冰糖心', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds15qfr3uj1ice34o9eb18je11u.jpg', '1', '0', '5.0', '5.0', '1', '1', '斤', '260', '13');
INSERT INTO `product` VALUES ('94', '陕西红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1hhv72mfq1dmlt1huv1t674r.jpg', '1', '0', '6.8', '6.8', '1', '1', '斤', '250', '13');
INSERT INTO `product` VALUES ('95', '水晶富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1hvv11jq17pn1b571oin10ae57.jpg', '1', '0', '7.5', '7.5', '1', '1', '斤', '250', '13');
INSERT INTO `product` VALUES ('96', '洛川富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds17ndj9m216ka1nonmpe135212p.png', '1', '0', '8.5', '8.5', '1', '1', '斤', '280', '13');
INSERT INTO `product` VALUES ('97', '延安富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds19npg1h8jg5e1un01228a4s135.jpg', '1', '0', '9.5', '9.5', '1', '1', '斤', '310', '13');
INSERT INTO `product` VALUES ('98', '特级红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr262l61she50drhmqp61355bg.jpg', '1', '0', '11.8', '11.8', '1', '1', '斤', '320', '13');
INSERT INTO `product` VALUES ('99', '新疆阿克苏', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1an6n1voe1pqrt7p18eqcco13t.jpg', '0', '0', '9.8', '9.8', '1', '1', '斤', '220', '13');
INSERT INTO `product` VALUES ('100', '黄蕉苹果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1ilvv9501gcf15fi5da1t2c5j.jpg', '1', '0', '8.8', '8.8', '1', '1', '斤', '220', '13');
INSERT INTO `product` VALUES ('101', '红蛇果（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1bonr1c11uup1p9111gphds14l.jpg', '1', '0', '9.5', '9.5', '1', '1', '斤', '250', '13');
INSERT INTO `product` VALUES ('102', '蛇果（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1c3en3la1jgk1r8a5t015do151.png', '1', '0', '8.5', '8.5', '1', '1', '个', '200', '13');
INSERT INTO `product` VALUES ('103', '海南西瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1ck0d1nibv9pvsk11ftmmf15d.jpg', '1', '0', '5.8', '6.8', '1', '3', '斤', '3500', '13');
INSERT INTO `product` VALUES ('104', '赣南有机甜橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1fbt715lo13kvja514f91vej160.jpg', '1', '0', '8.5', '9.0', '1', '4', '斤', '250', '13');
INSERT INTO `product` VALUES ('105', '纽荷尔甜橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1icsi1ef31iof15731no1dq416c.jpg', '1', '0', '7.5', '8.0', '1', '4', '斤', '250', '13');
INSERT INTO `product` VALUES ('106', '天然鲜橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1mg7n326arfgbr1u5m44o16o.jpg', '1', '0', '6.5', '6.5', '1', '4', '斤', '250', '13');
INSERT INTO `product` VALUES ('107', '湖南冰糖橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1mvgp1n9r1efr16hb12p5rj1174.jpg', '1', '0', '4.9', '4.9', '1', '4', '斤', '140', '13');
INSERT INTO `product` VALUES ('108', '永春芦柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1j3sm109r46u5ni350cog5v.jpg', '1', '0', '6.0', '6.3', '1', '4', '斤', '140', '13');
INSERT INTO `product` VALUES ('109', '永春椪柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1qp3c1rl1t7at9i1bfbuop17s.jpg', '1', '0', '3.3', '3.0', '1', '4', '斤', '120', '13');
INSERT INTO `product` VALUES ('110', '常山胡柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1rbdr10kr1ts41k6e1j3hjr9188.jpg', '1', '0', '2.8', '2.8', '1', '6', '斤', '320', '13');
INSERT INTO `product` VALUES ('111', '雪莲果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1tnp11v5i1au11oclgtodnv18k.jpg', '1', '0', '3.6', '3.6', '1', '6', '斤', '250', '13');
INSERT INTO `product` VALUES ('112', '柿饼', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds1ukp61g2i8d813i81ql9e0l19c.jpg', '0', '0', '14.8', '5.0', '1', '6', '6个', '50', '13');
INSERT INTO `product` VALUES ('113', '树上熟木瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds20jg31gaf11as12921k3h1frd19t.jpg', '1', '0', '6.8', '6.8', '1', '6', '斤', '850', '13');
INSERT INTO `product` VALUES ('114', '文旦柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds23h1s1tgq1tg12b0sfo1uck1a9.jpg', '1', '0', '4.5', '4.5', '1', '6', '斤', '2000', '13');
INSERT INTO `product` VALUES ('115', '海南小番茄', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds243kh1t1e1ksicu8ke61t3l1al.jpg', '1', '0', '7.5', '7.8', '2', '6', '斤', '0', '13');
INSERT INTO `product` VALUES ('116', '海南小台农', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds260visuj1nn460g1j1mo9a1b1.jpg', '1', '0', '16.0', '6.8', '1', '6', '斤', '110', '13');
INSERT INTO `product` VALUES ('117', '极品金桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds26kjk1jh4t7o16mjjsgg5q1bd.jpg', '1', '0', '15.8', '15.8', '2', '4', '斤', '0', '13');
INSERT INTO `product` VALUES ('118', '金桔（特大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds28rufr5m1klc1r6s1vgou431bp.jpg', '1', '0', '13.8', '13.8', '2', '4', '斤', '0', '13');
INSERT INTO `product` VALUES ('119', '金桔（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds2973e1a0fnlq1aal7fuhem1c5.jpg', '1', '0', '10.8', '10.8', '2', '4', '斤', '0', '13');
INSERT INTO `product` VALUES ('120', '桂林金桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1k28udd5bnq16he1o5f1lg96b.jpg', '1', '0', '8.8', '6.8', '2', '4', '斤', '0', '13');
INSERT INTO `product` VALUES ('121', '进口芝麻蕉', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds39ur6ajd13d4cnofrm1kvb1d4.jpg', '1', '0', '3.7', '4.0', '1', '4', '斤', '150', '13');
INSERT INTO `product` VALUES ('122', '菲律宾芝麻蕉', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3bdbbespe1r1evom06e5f1dl.jpg', '1', '0', '3.3', '4.6', '1', '6', '斤', '150', '13');
INSERT INTO `product` VALUES ('123', '有机黄瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3corb1p7g1bld1ce2184m1qu61e1.jpg', '1', '0', '8.8', '8.8', '1', '3', '', '120', '13');
INSERT INTO `product` VALUES ('124', '杭浱薄壳大核桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3e974fds18ajvga1d64h691ed.jpg', '1', '0', '35.0', '35.0', '1', '6', '斤', '60', '13');
INSERT INTO `product` VALUES ('125', '鲜榨果汁（番茄+苹果）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3g3d4qh91qtd1b464etfuo1ep.jpg', '1', '0', '10.0', '10.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('126', '鲜榨果汁（番茄+梨）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3gilm2681j3a8vs1ms19r41f5.jpg', '1', '0', '10.0', '10.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('127', '鲜榨果汁（哈密瓜+梨）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3gu2d6dth53ffg6oj163o1fh.jpg', '1', '0', '12.0', '12.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('128', '鲜榨果汁（哈密瓜+苹果）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3hk664fuo5v19j316rrv2v1g9.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('129', '鲜榨果汁（橙+柠檬）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3kj4lau217qcuvv1o881pfq1k1.jpg', '1', '0', '15.0', '15.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('130', '鲜榨果汁（苹果+柠檬）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3jo1t1mdd1l7tone7i15a71it.jpg', '1', '0', '15.0', '15.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('131', '鲜榨果汁（西柚+梨）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3l87f1ujcfal5g818h21oo51kp.jpg', '1', '0', '15.0', '15.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('132', '鲜榨果汁（西柚+苹果）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3lk489r1t661s5tbhs1cps1l5.jpg', '1', '0', '15.0', '15.0', '3', '1', '杯', '0', '13');
INSERT INTO `product` VALUES ('133', '鲜榨果汁（奇异果+橙）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3lt50jv41dik1frq1nbgt1j1lh.jpg', '1', '0', '16.0', '16.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('134', '鲜榨果汁（梨+橙）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3j83vd3c59k10qh11fq11dn1i5.jpg', '1', '0', '12.0', '12.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('135', '鲜榨果汁（梨+苹果）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3mgn1pk9gon1qad6q21ooe1m9.jpg', '1', '0', '12.0', '12.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('136', '鲜榨果汁（梨+柠檬）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3ivi51btu1k4v17cvkube6u1hp.jpg', '1', '0', '12.0', '12.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('137', '鲜榨果汁（梨+香蕉）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3mtkm11mdhs113n1hg61un41ml.jpg', '1', '0', '12.0', '12.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('138', '鲜榨果汁（梨+火龙果）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3iiasqp91v0deec1vk1fsi1hd.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('139', '鲜榨果汁（梨+木瓜）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3m7i6a3i3871qvdqmf8pn1lt.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('140', '鲜榨果汁（梨+芒果汁）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3jfc319181dth9hm1roe1i2m1ih.jpg', '1', '0', '15.0', '15.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('141', '鲜榨果汁（葡萄+石榴）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3n6o21o207rc6jj1sqm57l1n1.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('142', '西瓜汁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3nhms1145146tktf1bgk16791nd.jpg', '1', '0', '10.0', '10.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('143', '梨汁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3nq01frm1tans09dmg1mrd1np.jpg', '1', '0', '10.0', '10.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('144', '甘蔗汁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3o2021cep1sj5l1s1kih11ke1o5.jpg', '1', '0', '10.0', '10.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('145', '苹果汁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3i93bh681gfci7qcmc1pt41h1.jpg', '1', '0', '12.0', '12.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('146', '葡萄汁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3ktrvftudfc1t1hsvq12uf1kd.jpg', '1', '0', '12.0', '12.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('147', '黄瓜汁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3htii13vqp9i19bo5lfjri1gl.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('148', '石榴汁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3h6tfmst1acrmi51jef1h7q1ft.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('149', '橙汁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3kamg5dso2fr7u1m8n23r1jl.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('150', '火龙果汁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3k0ijmtmqe7nnpa6md7i1j9.jpg', '1', '0', '15.0', '15.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('151', '香蕉+优酸乳', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3pl2181g19iv1cqo1kgr14ks1oh.jpg', '1', '0', '12.0', '12.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('152', '梨+优酸乳', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3ptg79k21cce1unascc8021ot.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('153', '木瓜+优酸乳', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3qe5ml271mp81088m9217ps1pl.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('154', '草莓+优酸乳', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3q6j575k1rj4nq4vks17oc1p9.jpg', '1', '0', '13.0', '13.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('155', '芒果+优酸乳', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3qmg9641bee10v21um718kc1q1.jpg', '1', '0', '15.0', '15.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('156', '火龙果+优酸乳', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3r057lgq1qhb1ld1gun7lk1qd.jpg', '1', '0', '15.0', '15.0', '3', '6', '杯', '0', '13');
INSERT INTO `product` VALUES ('158', '特级进口芝麻蕉', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3rsvg2f7mk1o8m1as01ei21r5.jpg', '1', '0', '4.8', '4.2', '1', '6', '斤', '150', '14');
INSERT INTO `product` VALUES ('160', '泰国特级龙眼', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds3v3pm1hbg9nr1o487e71e011ro.jpg', '1', '0', '16.8', '11.8', '2', '1', '斤', '0', '14');
INSERT INTO `product` VALUES ('161', '美国有机蓝莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds416951ipg11g1hg81pj5omb1s9.png', '1', '0', '10.0', '5.0', '3', '6', '盒', '0', '14');
INSERT INTO `product` VALUES ('162', '青浦奶油草莓（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds41mk0555n7c2912robfe1sl.jpg', '1', '0', '22.0', '11.8', '2', '1', '斤', '0', '14');
INSERT INTO `product` VALUES ('163', '青浦奶油草莓（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds41vdl1k3ma6p1oqo1nor137v1t1.jpg', '1', '0', '10.0', '9.8', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('164', '青浦特甜红颊', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds427pi18hkaik10oe15gr10e41td.jpg', '0', '0', '12.8', '12.8', '2', '1', '斤', '0', '14');
INSERT INTO `product` VALUES ('165', '永春芦柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1kvfgtjq18b45vu1rsa1tii6u.jpg', '1', '0', '2.5', '3.3', '1', '4', '斤', '350', '14');
INSERT INTO `product` VALUES ('166', '江西脐橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds43q5gnunvndd77fvbsua1ua.jpg', '1', '0', '3.5', '6.8', '1', '4', '斤', '250', '14');
INSERT INTO `product` VALUES ('167', '海南菠萝', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds447lq72p122r1rr12161op41um.jpg', '1', '0', '3.5', '3.5', '1', '6', '斤', '850', '14');
INSERT INTO `product` VALUES ('168', '广东砂糖桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1lfonfbr8m416918hc1o887a.jpg', '1', '0', '8.5', '4.8', '2', '4', '斤', '0', '14');
INSERT INTO `product` VALUES ('169', '广东冰糖砂桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1m8m8k50uc8vku1faibjv7m.jpg', '0', '0', '9.8', '15.8', '2', '4', '斤', '0', '14');
INSERT INTO `product` VALUES ('170', '荷兰有机水果黄瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds45okf97n1g84141j1vh3run206.jpg', '1', '0', '9.8', '9.8', '1', '3', '斤', '90', '14');
INSERT INTO `product` VALUES ('171', '越南火龙果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds463mj2p715hjm6g105h1smj20i.jpg', '1', '0', '5.8', '7.5', '1', '6', '斤', '500', '14');
INSERT INTO `product` VALUES ('172', '桂林小金桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1mn6dqjqk2o1coqrdj134u82.jpg', '1', '0', '9.8', '9.8', '2', '4', '斤', '0', '14');
INSERT INTO `product` VALUES ('173', '桂林清山金桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds46pqncqlgmlt05qs6js021a.png', '1', '0', '6.5', '4.8', '2', '4', '斤', '0', '14');
INSERT INTO `product` VALUES ('174', '海南树上熟木瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds477tudn2vdil90h1c83821m.jpg', '1', '0', '5.8', '4.5', '1', '4', '斤', '600', '14');
INSERT INTO `product` VALUES ('175', '桂林金钱桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds47m30khg1fo2j0d189ec83222.jpg', '1', '0', '15.0', '12.8', '2', '4', '斤', '0', '14');
INSERT INTO `product` VALUES ('176', '平和水蜜柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4bda7otenlj18ku12i41d3r22e.jpg', '0', '0', '4.8', '4.8', '1', '6', '', '1650', '14');
INSERT INTO `product` VALUES ('177', '平和琼瑶蜜柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4bm0go62r2vnptf616cc22q.jpg', '1', '0', '6.8', '6.5', '1', '6', '斤', '1600', '14');
INSERT INTO `product` VALUES ('178', '东北大山楂', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4d5bf1pk7elv1go61po71u37236.jpg', '0', '0', '4.8', '4.8', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('179', '优质砀山梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4ee0s1ush1m69s5dc304ub24f.jpg', '1', '0', '2.5', '3.0', '1', '2', '斤', '250', '14');
INSERT INTO `product` VALUES ('180', '特级砀山梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4e4036fpcn10jl1oe516j4243.jpg', '0', '0', '3.5', '4.5', '1', '2', '斤', '400', '14');
INSERT INTO `product` VALUES ('181', '新疆苹果梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4hove1478t4915lgk4em9j25b.jpg', '0', '0', '4.5', '4.5', '1', '2', '斤', '225', '14');
INSERT INTO `product` VALUES ('182', '新疆库尔勒香梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4i7d1fbs673t178go1crr25n.jpg', '1', '0', '8.8', '8.5', '1', '2', '斤', '170', '14');
INSERT INTO `product` VALUES ('183', '新疆皇冠梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4ih9ok771pjl8q4u8613oq263.jpg', '1', '0', '5.5', '5.5', '1', '2', '', '330', '14');
INSERT INTO `product` VALUES ('185', '新疆天山雪梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4jkmj6s2170n1l621nj7m5p26f.jpg', '1', '0', '5.5', '4.5', '1', '2', '斤', '450', '14');
INSERT INTO `product` VALUES ('186', '新疆冰糖雪梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4mqv3k7qvrt3vh16t9pf27m.jpg', '1', '0', '5.8', '5.8', '1', '2', '斤', '325', '14');
INSERT INTO `product` VALUES ('187', '新疆水晶梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4poa93go1bkg72h975mu285.jpg', '1', '0', '4.5', '4.5', '1', '2', '斤', '225', '14');
INSERT INTO `product` VALUES ('188', '海南纸皮芒', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4tha61j2q1bgr1tcl1m30a1q28h.jpg', '1', '0', '13.8', '8.8', '1', '6', '斤', '100', '14');
INSERT INTO `product` VALUES ('189', '海南大台农', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4tsv21f4s3vf11p51gun1up428t.jpg', '1', '0', '18.0', '12.8', '1', '6', '斤', '275', '14');
INSERT INTO `product` VALUES ('190', '海南玉菇', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds4vf7doe411mc1gkdfr31bu1299.jpg', '1', '0', '6.8', '9.8', '1', '6', '斤', '1625', '14');
INSERT INTO `product` VALUES ('191', '新疆哈密瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds505rkmk8dk35f01g3j7gd29s.jpg', '1', '0', '5.8', '8.8', '1', '3', '斤', '1725', '14');
INSERT INTO `product` VALUES ('192', '泰国榴莲', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds50h0f13a3144k1urmsb611u32a8.jpg', '1', '0', '22.8', '18.8', '1', '6', '斤', '2500', '14');
INSERT INTO `product` VALUES ('193', '海南西瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds50tdgn7pkhplv6boictl2ak.jpg', '1', '0', '5.5', '4.8', '1', '3', '斤', '3300', '14');
INSERT INTO `product` VALUES ('194', '台湾特小凤', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds53t881ah71fkl1e753i91n1m2b0.jpg', '0', '0', '5.8', '5.8', '1', '6', '斤', '1300', '14');
INSERT INTO `product` VALUES ('195', '红河杨桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds577infkabt7s5m10t0nod2bc.jpg', '0', '0', '6.0', '6.0', '3', '5', '个', '0', '14');
INSERT INTO `product` VALUES ('196', '佳沛奇异果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5868o1ge8ko81p0f1s9l17ob2bo.png', '1', '0', '2.5', '2.0', '3', '5', '个', '0', '14');
INSERT INTO `product` VALUES ('197', '美国红心血橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds59htfdidndjd7n1b5ng8r2c4.jpg', '1', '0', '18.0', '18.0', '1', '4', '斤', '175', '14');
INSERT INTO `product` VALUES ('198', '新西兰奇异果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5a0d2a6icqh1t0i1jk0ifd2cg.png', '1', '0', '4.5', '4.5', '3', '5', '个', '0', '14');
INSERT INTO `product` VALUES ('199', '美国嘎啦果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5bi171761cbl1u8i1llc15vv2cs.jpg', '0', '0', '12.0', '12.0', '1', '1', '斤', '160', '14');
INSERT INTO `product` VALUES ('200', '新西兰金果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5dccajiu1m1a1qp3k79126o2d8.jpg', '1', '0', '6.8', '6.8', '3', '1', '个', '0', '14');
INSERT INTO `product` VALUES ('201', '法国金果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5f6dpceheac1ltf16d9l1c2dk.jpg', '0', '0', '3.8', '3.8', '3', '1', '个', '0', '14');
INSERT INTO `product` VALUES ('202', '南非柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5hht2taj1hp6prt6741hpu2ec.jpg', '1', '0', '9.8', '10.8', '1', '6', '斤', '150', '14');
INSERT INTO `product` VALUES ('203', '新奇士柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5fm9211j913p111vqio3poc2e0.jpg', '1', '0', '6.0', '7.0', '3', '6', '袋', '0', '14');
INSERT INTO `product` VALUES ('204', '台湾贵妃芒', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5jis61bmvund1hnf4plu7d2eo.jpg', '1', '0', '28.0', '48.0', '3', '6', '个', '0', '14');
INSERT INTO `product` VALUES ('205', '台湾凤梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5ke181e2rpq04l6voh1od32f4.jpg', '1', '0', '6.5', '8.5', '1', '6', '斤', '1740', '14');
INSERT INTO `product` VALUES ('206', '进口油桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5l5no1uia1cnk1su1pm31jj22fg.jpg', '1', '0', '19.8', '18.0', '1', '5', '斤', '185', '14');
INSERT INTO `product` VALUES ('207', '红心火龙果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5mc4qs9bh1s1pda11eh1qpp2g3.jpg', '1', '0', '18.8', '22.0', '1', '6', '斤', '640', '14');
INSERT INTO `product` VALUES ('208', '台湾有机火龙果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5ms6pk00rnn1qi5jbml872gf.jpg', '1', '0', '7.5', '7.5', '1', '6', '斤', '630', '14');
INSERT INTO `product` VALUES ('209', '泰国莲雾', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5nbogv46tv41j0rf08tqh2gr.jpg', '0', '0', '25.8', '25.8', '1', '6', '斤', '115', '14');
INSERT INTO `product` VALUES ('210', '进口黑森林', '', '0', '0', '22.0', '22.0', '1', '6', '斤', '115', '14');
INSERT INTO `product` VALUES ('211', '牛油果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5p1gm16lntir11vvocvf192h7.jpg', '1', '0', '9.0', '9.0', '3', '6', '个', '0', '14');
INSERT INTO `product` VALUES ('212', '法国蓝莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19ds5pk4e1i0v1ge41vofiom1l3j2hj.png', '1', '0', '15.0', '15.0', '3', '6', '盒', '0', '14');
INSERT INTO `product` VALUES ('213', '美国黑提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsbqg5l1f9t5cngvrp90h0k2hv.jpg', '1', '0', '25.0', '25.0', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('214', '法国蓝扣红提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsbsc1516taltk16frl7f1qeu2ib.jpg', '1', '0', '22.0', '11.8', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('215', '美国红西柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsbt03a13pg50t1kf9ta51j5b2in.jpg', '1', '0', '9.5', '9.5', '1', '6', '斤', '340', '14');
INSERT INTO `product` VALUES ('216', '美国红提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsbtkde154tghiou31t2n6982j3.jpeg', '1', '0', '18.0', '7.8', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('217', '法国无籽红提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsc0fnd193sf6j1fmf3e53up2jf.jpg', '1', '0', '29.8', '28.0', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('218', '特级智力车厘子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsc1j2r7iu1i11vo1065rm02jr.png', '0', '0', '68.0', '38.0', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('219', '智力拉宾车厘子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsc1u8818j7m9q4i2kf28q2k7.jpg', '0', '0', '38.0', '25.0', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('220', '日本富士山樱桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dscf1rl18oa1uui7b8gkunrh1m.jpg', '0', '0', '58.0', '58.0', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('221', '精品红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dscgin2ep116mo192k1env26h27.jpg', '1', '0', '11.5', '11.5', '1', '1', '斤', '310', '14');
INSERT INTO `product` VALUES ('222', '特级红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsch14jhudmujovn1gkhkph2j.jpg', '1', '0', '10.8', '10.5', '1', '1', '斤', '370', '14');
INSERT INTO `product` VALUES ('223', '陕西冰糖苹果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dschl2m1n7a1vma5c31gld2vd34.jpg', '0', '0', '9.5', '9.5', '1', '1', '斤', '350', '14');
INSERT INTO `product` VALUES ('224', '陕西高山红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dscifsp1otp1gk57i312g116eg3g.jpg', '1', '0', '8.5', '8.8', '1', '1', '斤', '310', '14');
INSERT INTO `product` VALUES ('225', '特甜陕西富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dscj8cp1cf2l161pav186l12oa3s.jpg', '1', '0', '7.5', '7.8', '1', '1', '斤', '230', '14');
INSERT INTO `product` VALUES ('226', '陕西红玫瑰', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dscldiechp19a1a7bbrridj48.jpg', '0', '0', '6.5', '6.5', '1', '1', '斤', '200', '14');
INSERT INTO `product` VALUES ('227', '特级红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dscql3ft6ccjn120863r12c964.jpg', '1', '0', '5.5', '5.8', '1', '1', '斤', '265', '14');
INSERT INTO `product` VALUES ('228', '新疆阿克苏苹果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dscorph1r7g19b83ep172o1a9j5o.jpg', '1', '0', '9.5', '10.8', '1', '1', '斤', '420', '14');
INSERT INTO `product` VALUES ('229', '新疆冰糖心苹果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dscmie61f1o1nal1r0f7u6den50.jpg', '0', '0', '8.5', '8.5', '1', '1', '斤', '200', '14');
INSERT INTO `product` VALUES ('230', '新疆香蕉苹果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsd0uii1nrhlmplc61afs1atk7d.jpg', '1', '0', '9.5', '9.5', '1', '1', '斤', '280', '14');
INSERT INTO `product` VALUES ('231', '美国特甜花牛', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsctqge172tkh21e3q6k11ah6g.png', '1', '0', '8.5', '9.5', '1', '1', '斤', '240', '14');
INSERT INTO `product` VALUES ('232', '新疆黄蕉苹果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1o84528i1ksr15s61uea798e.jpg', '1', '0', '7.5', '6.8', '1', '1', '斤', '210', '14');
INSERT INTO `product` VALUES ('233', '美国蛇果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsdjgan1sd7m7a1mga1gvkrt0e5.jpg', '1', '0', '10.5', '11.8', '1', '1', '斤', '280', '14');
INSERT INTO `product` VALUES ('234', '陕西阿克苏', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsdki18119hh8to10nr5goieh.jpg', '0', '0', '4.5', '4.5', '1', '1', '斤', '230', '14');
INSERT INTO `product` VALUES ('235', '精品鲜橙皇', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsdhnhdjai8on2d7og16u0dd.jpg', '1', '0', '7.8', '7.5', '1', '4', '斤', '270', '14');
INSERT INTO `product` VALUES ('236', '特甜四川脐橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsdie3nipt1tsol7j1mgr102adp.jpg', '1', '0', '5.5', '6.5', '1', '4', '斤', '250', '14');
INSERT INTO `product` VALUES ('237', '维鲜橄榄橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsddtsl19raeakcs218hu1eepcf.jpg', '1', '0', '6.8', '6.0', '1', '6', '斤', '300', '14');
INSERT INTO `product` VALUES ('238', '广东云冠手剥橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsdbpig5cm1kmo69t1df614gc3.jpg', '0', '0', '15.0', '15.0', '1', '4', '斤', '140', '14');
INSERT INTO `product` VALUES ('239', '广东冰糖橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsdb6lhbna1op36do1gd1r8obn.jpg', '1', '0', '5.5', '5.5', '1', '4', '斤', '190', '14');
INSERT INTO `product` VALUES ('240', '广东冰糖贡柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsdae6o1cu016co1l0m1q4917bcbb.jpg', '0', '0', '10.0', '10.0', '1', '4', '斤', '90', '14');
INSERT INTO `product` VALUES ('241', '特甜广东冰糖橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsd9cjisal1ksv1bpprkq1jpkaq.jpg', '0', '0', '12.0', '12.0', '1', '4', '斤', '130', '14');
INSERT INTO `product` VALUES ('242', '泰国山竹', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsd8q0a84ictgrm51agds1gae.jpg', '1', '0', '28.0', '28.0', '1', '6', '斤', '110', '14');
INSERT INTO `product` VALUES ('243', '法国黄心猕猴桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsd6fed15331e9f194edmh1qgia2.jpg', '0', '0', '15.0', '15.0', '3', '5', '盒', '0', '14');
INSERT INTO `product` VALUES ('244', '泰国肉桂圆', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsd5nus15hp1t3717aaopf1id99h.jpg', '1', '0', '18.0', '18.0', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('245', '砂糖芦柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1ooci180k1bd2mgkn2tdlu8q.jpg', '1', '0', '5.8', '2.5', '1', '4', '斤', '150', '14');
INSERT INTO `product` VALUES ('246', '自然生态芦柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsd4u0e14iqu4cka12ilklc8d.jpg', '1', '0', '6.5', '4.8', '1', '4', '斤', '170', '14');
INSERT INTO `product` VALUES ('249', '菲律宾芝麻香蕉', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dsc9c9119g514bs1ud64en1a8jg.jpg', '1', '0', '3.8', '3.2', '1', '6', '斤', '150', '14');
INSERT INTO `product` VALUES ('250', '江西脐橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dscdpek8d4159ad2b1ho212m1a.jpg', '0', '0', '3.5', '8.5', '1', '4', '斤', '260', '14');
INSERT INTO `product` VALUES ('254', '芝麻蕉', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dtsesas12be1u7nh28p0k12ku1p.jpg', '1', '0', '3.8', '3.8', '1', '6', '斤', '150', '15');
INSERT INTO `product` VALUES ('255', '奇异果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dtsg7e816fnjp8123m1j191o4k25.jpg', '1', '0', '4.5', '4.5', '3', '6', '个', '0', '15');
INSERT INTO `product` VALUES ('256', '草莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dtsh6ittbb16aqcen1bho1o3u2h.jpg', '1', '0', '12.8', '12.8', '2', '6', '斤', '0', '15');
INSERT INTO `product` VALUES ('257', '永春芦柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1atqm1rm81d5du3k1sfq1f7s1k.jpg', '1', '0', '4.0', '4.0', '1', '4', '斤', '140', '12');
INSERT INTO `product` VALUES ('258', '柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19f4sirv5h37ve5ndnpj81fs835.jpg', '1', '0', '11.8', '11.8', '1', '6', '斤', '140', '12');
INSERT INTO `product` VALUES ('259', '甘蔗（特大号）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19f4sen5nn1p1he94a010361tbk1t.jpg', '1', '0', '15.0', '18.0', '3', '6', '根', '0', '12');
INSERT INTO `product` VALUES ('260', '甘蔗（中号）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19f4sk4bf9ehu92njd90j2k73h.png', '1', '0', '12.0', '15.0', '3', '6', '根', '0', '12');
INSERT INTO `product` VALUES ('261', '进口优质香蕉', 'http://7u2out.com1.z0.glb.clouddn.com/o_19f4smtls1s30fdpf40vdlb6k3t.jpg', '1', '0', '4.5', '4.5', '1', '6', '斤', '150', '12');
INSERT INTO `product` VALUES ('262', '进口普通香蕉', 'http://7u2out.com1.z0.glb.clouddn.com/o_19f4sps5h1atpophn3i1g6p18iv4n.jpg', '1', '0', '4.0', '4.0', '1', '6', '斤', '150', '12');
INSERT INTO `product` VALUES ('263', '台湾牛奶枣', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fg2cg9vbbi1slraf7d9k1pu39.jpg', '1', '0', '12.8', '12.8', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('264', '西柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fg2fbd71d1eosf153cj5euag13.jpg', '1', '0', '9.8', '9.8', '1', '4', '斤', '400', '14');
INSERT INTO `product` VALUES ('265', '台湾凤梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fg2jvc8164e197b6vl1e6g1fs1f.jpg', '1', '0', '8.5', '8.5', '1', '6', '斤', '1750', '14');
INSERT INTO `product` VALUES ('266', '甘蔗', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fg2mp2f1t7v1tq71rkm13987gf1r.jpg', '1', '0', '15.0', '15.0', '3', '6', '根', '0', '14');
INSERT INTO `product` VALUES ('267', '法国脾梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fg2sq1lv31phe170s1op1inv27.png', '0', '0', '18.0', '18.0', '1', '2', '斤', '350', '14');
INSERT INTO `product` VALUES ('268', '都乐牌无籽黑提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fhmqe3t1niu1f6s65t1vq5ajbu.jpg', '1', '0', '25.0', '25.0', '2', '6', '斤', '0', '13');
INSERT INTO `product` VALUES ('269', '血橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fhn1p0l84ma5k1a5bo931uda26.jpg', '1', '0', '18.8', '18.8', '1', '4', '斤', '230', '13');
INSERT INTO `product` VALUES ('270', '油桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fhn55o0daj17741538k28kd2p.jpg', '1', '0', '19.8', '19.8', '1', '5', '斤', '200', '13');
INSERT INTO `product` VALUES ('271', '黑布林', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fhnim8lg2q7h16mv1r114gg48.jpg', '1', '0', '20.8', '20.8', '1', '5', '斤', '120', '13');
INSERT INTO `product` VALUES ('272', '山竹', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fhnlmi617941qut77defi6m34k.jpg', '1', '0', '28.0', '28.0', '1', '6', '斤', '100', '13');
INSERT INTO `product` VALUES ('273', '圣女果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fhnt48r1ao0c0k1sq111r81ccr57.jpg', '1', '0', '6.3', '6.3', '2', '6', '斤', '0', '13');
INSERT INTO `product` VALUES ('274', '冰糖橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fhnv2cvs9l1pgm1bq6moe14pc5q.jpg', '1', '0', '4.9', '4.9', '1', '4', '斤', '240', '13');
INSERT INTO `product` VALUES ('275', '特大台农', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fho3hp216pi1oepd6v83o191m66.jpg', '1', '0', '19.8', '19.8', '1', '6', '斤', '300', '13');
INSERT INTO `product` VALUES ('276', '草莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19fhprcb9a3b6mismnavh17al7j.jpg', '1', '0', '15.0', '15.0', '2', '6', '斤', '0', '13');
INSERT INTO `product` VALUES ('277', '雪花李', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g0tus8511dj19bu4r51kea1k2in.jpg', '1', '0', '19.8', '19.8', '1', '1', '斤', '200', '13');
INSERT INTO `product` VALUES ('278', '菠萝蜜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g0u6tn5d451ose1s6i1351s3a1h.jpg', '1', '0', '20.0', '20.0', '2', '6', '斤', '0', '13');
INSERT INTO `product` VALUES ('279', '台湾水仙芒', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g0ud0t06p91bkh1an3b8g1cll1t.jpg', '1', '0', '22.8', '22.8', '1', '6', '斤', '350', '13');
INSERT INTO `product` VALUES ('280', '草莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1gqqkh9o61jkffrh16j91cjpe.jpg', '1', '0', '12.8', '12.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('281', '柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1hslce17i61bgf141gqgoilc1d.jpg', '1', '0', '9.8', '9.8', '1', '4', '斤', '150', '16');
INSERT INTO `product` VALUES ('282', '进口柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1htg1c7cujti1o0k1k9c1us61v.jpg', '1', '0', '18.8', '18.8', '1', '4', '斤', '150', '16');
INSERT INTO `product` VALUES ('283', '常山胡柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1if9ohaua1ejb18p0ajroom33.jpg', '1', '0', '2.7', '2.7', '1', '4', '斤', '380', '16');
INSERT INTO `product` VALUES ('284', '东山枇杷', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1ija9k2s9s5nucd141r99v40.jpg', '1', '0', '12.8', '19.8', '1', '6', '斤', '60', '16');
INSERT INTO `product` VALUES ('285', '太农芒果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1ilvri1kuupkm1cv91pn218pc4c.jpg', '1', '0', '12.8', '12.8', '1', '4', '斤', '300', '16');
INSERT INTO `product` VALUES ('286', '芦柑（普）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1io9v1n061sv41jd1rid1rqn4o.jpg', '1', '0', '3.3', '3.3', '1', '4', '斤', '140', '16');
INSERT INTO `product` VALUES ('287', '芦柑（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1qhke1m4c1lgo42hotlmi29d.jpg', '1', '0', '5.8', '5.8', '1', '4', '斤', '140', '16');
INSERT INTO `product` VALUES ('288', '芦柑（优）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1iugm23g41ou31b9b49dbam6p.jpg', '1', '0', '6.8', '6.8', '1', '4', '斤', '140', '16');
INSERT INTO `product` VALUES ('289', '猕猴桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1j1nm612i7fm0t5f1k6do4m7a.jpg', '1', '0', '4.8', '4.8', '3', '5', '个', '0', '16');
INSERT INTO `product` VALUES ('290', '猕猴桃（优）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1j7bu2sjqlbs1pv61qs13k482.jpg', '1', '0', '5.8', '5.8', '2', '5', '个', '140', '16');
INSERT INTO `product` VALUES ('291', '猕猴桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1jgl7b13id1es8dcl71015og90.jpg', '1', '0', '3.5', '3.5', '3', '5', '个', '0', '16');
INSERT INTO `product` VALUES ('292', '牛油果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1ji14n11bm18s51vcqgii9e89c.jpg', '1', '0', '9.0', '9.0', '3', '6', '个', '0', '16');
INSERT INTO `product` VALUES ('293', '美国橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1jknj11hitpefuoun11u9la6.jpg', '1', '0', '12.8', '12.8', '1', '4', '斤', '230', '16');
INSERT INTO `product` VALUES ('294', '火龙果（红心）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1jr7gc1162988p8b19uu145aal.jpg', '1', '0', '19.8', '19.8', '1', '1', '斤', '700', '16');
INSERT INTO `product` VALUES ('295', '油桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1jsfvr2msa4kroq18ca1od4b1.jpg', '1', '0', '13.8', '19.8', '1', '6', '斤', '100', '16');
INSERT INTO `product` VALUES ('296', '火龙果（白心）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1jtpfhrhb2p91e201mlsvvrbd.jpg', '1', '0', '6.8', '6.8', '1', '1', '斤', '650', '16');
INSERT INTO `product` VALUES ('297', '火龙果（白心）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1junhf16q06e61maf13justlbp.jpg', '1', '0', '9.8', '9.8', '1', '6', '斤', '650', '16');
INSERT INTO `product` VALUES ('298', '黑提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1optul1fsn1gn3je190412chch.jpg', '1', '0', '29.8', '29.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('299', '红提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1otcr08h51fg8gkd11r9102mct.jpeg', '1', '0', '26.8', '26.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('300', '红提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1pd6981kfo1mk318kevgs1efeeo.jpg', '1', '0', '19.8', '12.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('301', '甘蔗', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1pffba16gsh4g5c81st5of6f7.png', '1', '0', '1.8', '1.8', '1', '4', '斤', '4000', '16');
INSERT INTO `product` VALUES ('302', '草莓（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1pid0f1lh91voe2b51mb21lh0fj.jpg', '1', '0', '5.0', '5.0', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('303', '草莓（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1pkcov7tov8g1mv71je57qmgd.jpg', '1', '0', '8.0', '8.0', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('304', '美国油桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1pn1t5s8jotr1hj1t7g5i0gp.jpg', '1', '0', '19.8', '19.8', '2', '5', '斤', '0', '16');
INSERT INTO `product` VALUES ('305', '杨桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1ppalo1bem15oonvgmrhnnhh5.jpg', '1', '0', '10.0', '10.0', '2', '5', '斤', '0', '16');
INSERT INTO `product` VALUES ('306', '蓝莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1prtmoir31okjsp16fh1272hh.png', '1', '0', '10.0', '10.0', '3', '6', '盒', '0', '16');
INSERT INTO `product` VALUES ('307', '车厘子(大)', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1q49461sed1t611jncpoaketii.jpg', '1', '0', '48.0', '48.0', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('308', '车厘子（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1q9hog61tl3q1nnru8916cljq.jpg', '1', '0', '38.0', '38.0', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('309', '特小凤（黄心西瓜）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1qb6t217cm16p9176q3utubok6.png', '1', '0', '58.0', '1000.0', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('310', '龙眼（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1qq84s1vin1r4kfivf7lp4pmd.jpg', '1', '0', '8.8', '8.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('311', '龙眼（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1qra8sdks4t2rcs1kck1mo3n5.jpg', '1', '0', '10.8', '10.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('312', '金桔（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1qu66cicetpqlrr1app3quo2.png', '1', '0', '10.8', '10.8', '2', '4', '斤', '0', '16');
INSERT INTO `product` VALUES ('313', '金桔(小)', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1re7c11sn1nc6fqf2n45r39p.jpg', '1', '0', '8.8', '8.8', '2', '4', '斤', '0', '16');
INSERT INTO `product` VALUES ('314', '山楂', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1r23f53m18nj19pg1cnd1v6apb.jpg', '1', '0', '8.8', '8.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('315', '澳芒', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1r6gbein6ohbd1dmrb19jnpn.jpg', '1', '0', '38.0', '38.0', '1', '6', '斤', '350', '16');
INSERT INTO `product` VALUES ('316', '圣女果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1r8p14lhi18u41i5cchme3aq3.jpg', '1', '0', '7.8', '7.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('317', '贡桔', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1rdqhmmand9l1t7tl8j1hc2qf.jpg', '1', '0', '6.8', '6.8', '2', '4', '斤', '0', '16');
INSERT INTO `product` VALUES ('318', '凤梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1rj97p17fsdtn2b4mjd107br0.jpg', '1', '0', '12.8', '12.8', '1', '4', '斤', '1800', '16');
INSERT INTO `product` VALUES ('319', '砂糖桔（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1rs4r1bjk4n81ftef351hh1a5.jpg', '1', '0', '8.8', '8.8', '2', '4', '斤', '0', '16');
INSERT INTO `product` VALUES ('320', '砂糖桔（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1rrkeamed5tseq61ph3g1ass.jpg', '1', '0', '12.8', '12.8', '2', '4', '斤', '0', '16');
INSERT INTO `product` VALUES ('321', '榴莲', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1ru4v4qoc1vi81dk1d67oqat8.jpg', '1', '0', '22.8', '22.8', '1', '6', '斤', '2500', '16');
INSERT INTO `product` VALUES ('322', '菠萝', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1s0pemlsrlu81kpk1kkdp5htk.jpg', '1', '0', '3.8', '3.8', '1', '6', '斤', '850', '16');
INSERT INTO `product` VALUES ('323', '哈密瓜（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1s5amn1sufaj71pg11g4kh1ku0.jpg', '1', '0', '9.8', '9.8', '1', '3', '斤', '2400', '16');
INSERT INTO `product` VALUES ('324', '哈密瓜（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1s75kr1eh9rcb12fk3vv1roluc.jpg', '1', '0', '7.8', '7.8', '1', '3', '斤', '2400', '16');
INSERT INTO `product` VALUES ('325', '西瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1s8rob176t4s1lku1aad1o5juo.jpg', '1', '0', '6.8', '6.8', '1', '3', '斤', '3600', '16');
INSERT INTO `product` VALUES ('326', '陕西红富士（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1sf0d61hgquagnkc1i6u3urv4.jpg', '1', '0', '5.0', '5.0', '1', '1', '斤', '250', '16');
INSERT INTO `product` VALUES ('327', '陕西红富士（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1sh4m8fn0a0c14gj1s5t4lovg.jpg', '1', '0', '6.8', '6.8', '1', '1', '斤', '250', '16');
INSERT INTO `product` VALUES ('328', '陕西红富士（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1sij6b1h3d4601js4128g167cvs.jpg', '1', '0', '8.8', '8.8', '1', '1', '斤', '250', '16');
INSERT INTO `product` VALUES ('329', '陕西红富士（精品）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1sntob2p0dtkkdf12um1d1s113.jpg', '1', '0', '11.8', '11.8', '1', '1', '斤', '250', '16');
INSERT INTO `product` VALUES ('330', '新疆阿克苏（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1supqq1ntg1nv2231khe1pu312e.jpg', '1', '0', '5.8', '5.8', '1', '1', '斤', '350', '16');
INSERT INTO `product` VALUES ('331', '新疆阿克苏（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1t37h1c31qcr1i461ba87si14g.jpg', '1', '0', '8.8', '8.8', '1', '1', '斤', '350', '16');
INSERT INTO `product` VALUES ('332', '新疆阿克苏（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1t4sjbueugg819j41micg4h153.jpg', '1', '0', '11.8', '11.8', '1', '1', '斤', '350', '16');
INSERT INTO `product` VALUES ('333', '黄蕉（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr1sngd9391h1sqtk2o1m63ah.jpg', '1', '0', '4.8', '4.8', '1', '1', '斤', '240', '16');
INSERT INTO `product` VALUES ('334', '黄蕉（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1t8m5p1f64mo3bt1j4uncv16a.jpg', '1', '0', '7.8', '7.8', '1', '1', '斤', '240', '16');
INSERT INTO `product` VALUES ('335', '蛇果（国产）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1tcb5rqgr1imiv4880l7de16m.png', '1', '0', '10.8', '10.8', '1', '1', '斤', '240', '16');
INSERT INTO `product` VALUES ('336', '蛇果（进口）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1te0q21i031a7813tbkq4146i177.jpg', '1', '0', '12.8', '12.8', '1', '1', '斤', '240', '16');
INSERT INTO `product` VALUES ('337', '库尔勒香梨（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1tg9li56vt8fhn1tre16r717j.jpg', '1', '0', '8.8', '8.8', '1', '2', '斤', '150', '16');
INSERT INTO `product` VALUES ('338', '库尔勒香梨（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1ti45iv9b1bff16mmdcl1it0186.jpg', '1', '0', '4.8', '4.8', '1', '2', '斤', '150', '16');
INSERT INTO `product` VALUES ('339', '库尔勒香梨（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1tkkjk17feoqi1krr18dcu4318u.jpg', '1', '0', '10.8', '10.8', '1', '2', '斤', '150', '16');
INSERT INTO `product` VALUES ('340', '砀山梨（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1tsm731gt2vdqs06fqkqgg19a.jpg', '1', '0', '2.5', '2.5', '1', '2', '斤', '350', '16');
INSERT INTO `product` VALUES ('341', '砀山梨（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1tu29k1umb1jgr8k8jj118r219m.jpg', '1', '0', '3.0', '3.0', '1', '2', '斤', '350', '16');
INSERT INTO `product` VALUES ('342', '天山雪梨（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1u2q8mla51b509u7ss91k7v1bj.jpg', '1', '0', '7.8', '7.8', '1', '2', '斤', '320', '16');
INSERT INTO `product` VALUES ('343', '天山雪梨（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1u4acd1ute413nuhidh7e81bv.jpg', '1', '0', '5.8', '5.8', '1', '2', '斤', '320', '16');
INSERT INTO `product` VALUES ('344', '贡梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1u6mia1mhs1ck3v6s1j421tbi1cb.jpg', '1', '0', '5.8', '5.8', '1', '2', '斤', '400', '16');
INSERT INTO `product` VALUES ('345', '皇冠梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1u8gkq15rs1tr318ov1t0p1oak1cn.jpg', '1', '0', '5.8', '5.8', '1', '2', '斤', '300', '16');
INSERT INTO `product` VALUES ('346', '赣南橙（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1uchc24h17vqeq2dfu1tu31d3.jpg', '1', '0', '6.8', '6.8', '1', '4', '斤', '230', '16');
INSERT INTO `product` VALUES ('347', '赣南橙（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1udtk214somfi18pq20e76h1df.jpg', '1', '0', '5.8', '5.8', '1', '4', '斤', '230', '16');
INSERT INTO `product` VALUES ('348', '赣南橙（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1ufh5716uk1om5jotlj17s31dr.jpg', '1', '0', '3.5', '3.5', '1', '4', '斤', '230', '16');
INSERT INTO `product` VALUES ('349', '香蕉（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1uij8r1bbm1l9o1ifl1ut8sin1ec.jpg', '1', '0', '3.0', '3.0', '1', '6', '斤', '150', '16');
INSERT INTO `product` VALUES ('350', '香蕉（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1uke1c604n8o1t691o3thft1eo.jpg', '1', '0', '3.8', '3.8', '1', '6', '斤', '150', '16');
INSERT INTO `product` VALUES ('351', '香蕉（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1umi8htcobiv2u9gon1jvv1f4.jpg', '1', '0', '4.2', '4.2', '1', '6', '斤', '150', '16');
INSERT INTO `product` VALUES ('352', '红心柚', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1upk6ffd6te2vdh7q71bfi1fg.jpg', '1', '0', '5.8', '5.8', '1', '6', '个', '350', '16');
INSERT INTO `product` VALUES ('353', '白心柚子（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1urist163gknl1ktm43o1g3v1fs.jpg', '1', '0', '7.8', '7.8', '1', '6', '个', '350', '16');
INSERT INTO `product` VALUES ('354', '白心柚子（小）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1utf6g1ond1181qjdlml10jj1g8.jpg', '1', '0', '3.8', '3.8', '1', '6', '个', '350', '16');
INSERT INTO `product` VALUES ('355', '白心柚子（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g1uv79atic3jv1m0qoq41v351gk.jpg', '1', '0', '4.8', '4.8', '1', '6', '个', '350', '16');
INSERT INTO `product` VALUES ('356', '原味瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g20mk581m7e17hedabak5ld21he.jpg', '1', '0', '8.8', '8.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('357', '原味瓜子（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g20nqa11rh3nlahmg17pl6ej1hq.jpg', '1', '0', '10.8', '10.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('358', '原味瓜子（精）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g20ouu416rb16aumfj196l1q191i6.jpg', '1', '0', '13.8', '13.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('359', '五香瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g20qe6ca69tatjkrbel11l01ii.jpg', '1', '0', '8.8', '8.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('360', '红皮花生', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g21fjbb1g6hvvfftj1qru11f01jj.jpg', '1', '0', '8.8', '8.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('361', '咸干花生', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g21jhrcoik194qtp515f91l711jv.jpg', '1', '0', '8.8', '8.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('362', '奶香花生', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g21m16d1un81idq14mg128eg4u1kb.jpg', '1', '0', '10.8', '10.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('363', '蒜香花生', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g21s2al1rom9kinfr12pt1hqg1kn.jpg', '1', '0', '10.8', '10.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('364', '小胡桃仁（250g）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g40bhjm1n3mklttut1dpb3o54.jpg', '1', '0', '38.0', '38.0', '1', '6', '包', '30', '16');
INSERT INTO `product` VALUES ('365', '纸皮核桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g229q6k1p0c3j8137t1oi1c2h1l3.jpg', '1', '0', '26.8', '26.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('366', '南瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g22gmrvopn6e61idfgmvptr1lf.jpg', '1', '0', '19.8', '19.8', '2', '1', '斤', '0', '16');
INSERT INTO `product` VALUES ('367', '小包椒盐西瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g3vton62kv4n97romm418702q.jpg', '1', '0', '16.8', '16.8', '1', '6', '包', '20', '16');
INSERT INTO `product` VALUES ('368', '小包原味花生', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g22jua3pf71qi1ba4kt9m291f.jpg', '1', '0', '13.8', '13.8', '1', '6', '斤', '100', '16');
INSERT INTO `product` VALUES ('369', '糊边南瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g22kai1ep61la1f781re2o4e1lr.png', '1', '0', '20.8', '20.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('370', '巴西松子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g22lqtmfi9nqg19gebq2p2f1m7.jpg', '1', '0', '118.0', '118.0', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('371', '鲜烤肉干', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g413jao19291p3j3oas961jn7o.jpg', '1', '0', '49.8', '49.8', '2', '6', '斤', '100', '16');
INSERT INTO `product` VALUES ('372', '原味松子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g22nf3micp14f6rgbbpq6d91mj.jpg', '1', '0', '46.8', '46.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('373', '手撕肉干', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g3vfvhe12iq16151qj3e6jn961o.jpg', '1', '0', '42.8', '42.8', '1', '6', '包', '30', '16');
INSERT INTO `product` VALUES ('374', '奶油松子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g22p37p17fa26j27r1kh1djh1mv.jpg', '1', '0', '49.8', '49.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('375', '香菇牛肉', '', '0', '0', '59.8', '59.8', '1', '6', '斤', '100', '16');
INSERT INTO `product` VALUES ('376', '鱿鱼丝', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g22uftp3md1be0b4hgk86912q.jpg', '1', '0', '39.8', '39.8', '1', '6', '斤', '100', '16');
INSERT INTO `product` VALUES ('377', '小核桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g22v4fo120i63v19og1gv418vn1ng.jpg', '1', '0', '52.8', '52.8', '2', '1', '斤', '0', '16');
INSERT INTO `product` VALUES ('378', '渔码头鱿鱼干', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g4047f5bhn8lg52n147d6bd40.jpg', '1', '0', '39.8', '39.8', '1', '6', '包', '20', '16');
INSERT INTO `product` VALUES ('379', '渔码头烤鱼片', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g401gvlsevq61ar75smlcr3k.jpg', '1', '0', '49.8', '49.8', '1', '6', '包', '20', '16');
INSERT INTO `product` VALUES ('380', '小核桃（优）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g235l1mtr1128i3orn3i1s681ns.png', '1', '0', '58.8', '58.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('381', '向阳猪肉脯', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g3vkq6h161e6qpg0resev562e.jpg', '1', '0', '42.8', '42.8', '1', '6', '包', '20', '16');
INSERT INTO `product` VALUES ('382', '小胡桃仁', '', '0', '0', '78.0', '78.0', '1', '6', '斤', '100', '16');
INSERT INTO `product` VALUES ('383', '碧根果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g238r0o1io111br1q9kdac11mh1o8.jpeg', '1', '0', '29.8', '29.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('384', '夏威夷果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g23bhvs3qvojs1ea4scq1t811ok.jpg', '1', '0', '29.8', '29.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('385', '吊瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g23dbph1g191c611v8lc4u113f1p0.jpg', '1', '0', '23.8', '23.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('386', '小包开口松子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g407f6n1ji7135k1pgn158419bi4o.jpg', '1', '0', '52.8', '52.8', '1', '6', '包', '30', '16');
INSERT INTO `product` VALUES ('387', '巴旦木', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g23f9638lm1hmoic51tel154k1pc.jpg', '1', '0', '33.8', '33.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('388', '小包开心果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g23h7q21ut91p441l31j7q1aeq4t.jpg', '1', '0', '52.8', '52.8', '1', '6', '斤', '100', '16');
INSERT INTO `product` VALUES ('389', '炭烧腰果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g40ihf01sfqu9i3hql2tvo6k.jpg', '1', '0', '29.8', '29.8', '1', '6', '包', '30', '16');
INSERT INTO `product` VALUES ('390', '美国杏仁', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g23hjgij9d1ngrh01r0dkv41po.jpg', '1', '0', '42.8', '42.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('391', '开心果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g40d63j1fq5160re57asqbhf5g.jpg', '1', '0', '42.8', '42.8', '1', '6', '包', '20', '16');
INSERT INTO `product` VALUES ('392', '带衣烘培腰果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g40ek5hpkeie014p5r1g1h8r5s.jpg', '1', '0', '36.8', '36.8', '1', '6', '包', '40', '16');
INSERT INTO `product` VALUES ('393', '葫芦籽', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g23qvrf3u51dl71kgcp6p1ppa1qq.jpg', '1', '0', '32.8', '32.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('394', '小包奶花生', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g23vebev4c1spr3gbjd5vm261.jpg', '1', '0', '13.8', '13.8', '1', '6', '斤', '100', '16');
INSERT INTO `product` VALUES ('395', '话梅西瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g23tj86126sgpu6g89u814g91rb.jpg', '1', '0', '12.8', '12.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('396', '小包原味瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g244sjg13hh1l0c1klj1utd1slq6d.jpg', '1', '0', '11.8', '11.8', '1', '6', '斤', '100', '16');
INSERT INTO `product` VALUES ('397', '酱油西瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g245v7l11q116651slrhujho11rn.jpg', '1', '0', '12.8', '12.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('398', '吊瓜子（小包装）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g40lhi11br41jjptbjq01ag570.jpg', '1', '0', '26.8', '26.8', '1', '6', '包', '30', '16');
INSERT INTO `product` VALUES ('399', '奶油花生', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g40gkrcgdqevl6e96mte68.jpg', '1', '0', '10.8', '10.8', '1', '6', '包', '60', '16');
INSERT INTO `product` VALUES ('400', '干草西瓜子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g248da810ivbch17qbd8v1ph81sa.jpg', '1', '0', '12.8', '12.8', '2', '6', '斤', '0', '16');
INSERT INTO `product` VALUES ('401', '泡椒凤爪', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g40q8pdn944kquhppga1dfb7c.jpg', '1', '0', '21.8', '21.8', '1', '6', '包', '30', '16');
INSERT INTO `product` VALUES ('402', '法国无籽小红提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g4hjc5j1vs8pfo081r1n8vu1tp.jpeg', '1', '0', '28.0', '28.0', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('403', '美国奶油李子', 'http://7u2out.com1.z0.glb.clouddn.com/o_19gr54m92aif1sud13mo14pi4p79.jpg', '1', '0', '16.8', '16.8', '1', '5', '斤', '200', '14');
INSERT INTO `product` VALUES ('404', '红布林', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g6hn9f3cen14iaffbap1ni2q.jpg', '1', '0', '19.8', '22.0', '1', '6', '斤', '200', '14');
INSERT INTO `product` VALUES ('405', '黑布林', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g6hpjpq12ism9jnq8ap7hao16.jpg', '1', '0', '18.8', '18.8', '1', '6', '斤', '200', '14');
INSERT INTO `product` VALUES ('406', '法国西梅', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g6hrlsvt39hcrv9f1kkn5jv1i.jpg', '1', '0', '23.0', '23.0', '2', '6', '斤', '0', '14');
INSERT INTO `product` VALUES ('407', '榴莲', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g8jifsu1vrnkn6uj1n6u1p1s9.jpg', '1', '0', '19.8', '19.8', '1', '6', '斤', '1700', '12');
INSERT INTO `product` VALUES ('408', '进口油桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g8jn2dg1rs9fpj18btd2t1jq3l.jpg', '1', '0', '19.8', '19.8', '1', '1', '斤', '200', '12');
INSERT INTO `product` VALUES ('409', '进口黑布林', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g8jt39f1nm1avp1tjk1ocm17vd11.jpg', '1', '0', '21.8', '21.8', '1', '6', '斤', '200', '12');
INSERT INTO `product` VALUES ('410', '山竹', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g8k1sgt1iec15fculgtjs1ckh1d.jpg', '1', '0', '21.8', '21.8', '1', '6', '斤', '120', '12');
INSERT INTO `product` VALUES ('411', '水仙芒', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g8k7b40136gsjh8jl189ul0p1p.jpg', '1', '0', '25.8', '25.8', '1', '6', '斤', '240', '12');
INSERT INTO `product` VALUES ('412', '火龙果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g8k958nipn1vnb834i7ntnv25.jpg', '1', '0', '4.0', '4.0', '1', '6', '斤', '700', '12');
INSERT INTO `product` VALUES ('413', '牛奶枣（中）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g8kbtua138ge3ia471mv3165g2h.jpg', '1', '0', '8.8', '8.8', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('414', '富士王', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g8kee784g31j221vr71lqq7dh34.jpg', '1', '0', '9.8', '9.8', '1', '1', '斤', '400', '12');
INSERT INTO `product` VALUES ('415', '新西兰猕猴桃（大）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g8kge6deqvd7tjrb1kqg17mk3g.png', '1', '0', '5.5', '5.5', '3', '6', '个', '0', '12');
INSERT INTO `product` VALUES ('416', '冰糖心红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h52gqvstodbsp1pdlov9kq0g.jpg', '1', '0', '11.8', '11.8', '1', '1', '斤', '230', '18');
INSERT INTO `product` VALUES ('417', '阿克苏苹果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h52lguege61skabap1m1i14g41a.jpg', '1', '0', '7.8', '7.8', '1', '1', '斤', '230', '18');
INSERT INTO `product` VALUES ('418', '陕西精品红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h5gucm71o4o148l169t1t4d4pc24.jpg', '1', '0', '7.8', '7.8', '1', '1', '斤', '230', '18');
INSERT INTO `product` VALUES ('419', '山东红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h52qh2u1i1vpo5p6i12gb17jq22.jpg', '1', '0', '5.8', '5.8', '1', '1', '斤', '270', '18');
INSERT INTO `product` VALUES ('420', '陕西红富士（精品）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h52udt7n7qrjim211n07k8g2e.png', '1', '0', '9.8', '9.8', '1', '1', '斤', '270', '18');
INSERT INTO `product` VALUES ('421', '陕西红富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h5gu0p416qh2b11e391tdis9n1o.jpg', '1', '0', '6.8', '6.8', '1', '1', '斤', '230', '18');
INSERT INTO `product` VALUES ('422', '黄焦苹果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h539rc51jlc87a1g5jt3b11op3p.jpg', '1', '0', '9.8', '9.8', '1', '1', '斤', '200', '18');
INSERT INTO `product` VALUES ('423', '砀山梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h53gnq71pilh7cf8fi5bkop45.jpg', '1', '0', '3.8', '3.8', '1', '2', '斤', '400', '18');
INSERT INTO `product` VALUES ('424', '河北鸭梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h53invd1cvhijtkvtqpj1nt94h.jpg', '1', '0', '5.8', '5.8', '1', '2', '斤', '280', '18');
INSERT INTO `product` VALUES ('425', '新疆雪梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h53l266g21pu71mi1s8r16v64t.jpg', '1', '0', '5.8', '5.8', '1', '2', '280', '280', '18');
INSERT INTO `product` VALUES ('426', '新疆贡梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h53n3ct1mm71v6d1ld1mppfq459.jpg', '1', '0', '6.8', '6.8', '1', '2', '斤', '420', '18');
INSERT INTO `product` VALUES ('427', '新疆香梨（精品）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h54aum3qu71jm4cn71dj82l477.jpg', '1', '0', '12.8', '12.6', '1', '2', '斤', '200', '18');
INSERT INTO `product` VALUES ('428', '新疆香梨', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h545h5nfm61g192aq7bk1np36f.jpg', '1', '0', '5.8', '5.8', '1', '2', '斤', '200', '18');
INSERT INTO `product` VALUES ('429', '海南香水菠萝', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h548slvsn711jem2p36vevm6r.jpg', '1', '0', '3.8', '3.8', '1', '6', '斤', '800', '18');
INSERT INTO `product` VALUES ('430', '芦柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h54fp2c1g2o6q3dol13vbsss7q.jpg', '1', '0', '3.8', '3.8', '1', '4', '斤', '130', '18');
INSERT INTO `product` VALUES ('431', '砂糖芦柑(精品）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h54hn30odjgg011dt1i8gq3486.jpg', '1', '0', '6.8', '6.8', '1', '4', '斤', '120', '18');
INSERT INTO `product` VALUES ('432', '进口蛇果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h54jg4b13uj10b924p1gfg1tva8i.jpg', '1', '0', '14.8', '14.8', '1', '1', '斤', '200', '18');
INSERT INTO `product` VALUES ('433', '新西兰进口猕猴桃（绿芯）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h54nlqfob2vru180r113k15iu8u.png', '1', '0', '4.5', '4.5', '3', '6', '个', '0', '18');
INSERT INTO `product` VALUES ('434', '新西兰进口猕猴桃（黄芯）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h54pl081r88iul185f7jl2cc9a.png', '1', '0', '7.5', '7.5', '3', '6', '个', '0', '18');
INSERT INTO `product` VALUES ('435', '赣南脐橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h54rp627mq13p2gbq1tf24us9m.jpg', '1', '0', '6.8', '6.8', '1', '4', '斤', '280', '18');
INSERT INTO `product` VALUES ('436', '冰糖橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h54udfvtok60o1kf9d4g1vioa2.jpg', '1', '0', '5.8', '5.8', '1', '4', '斤', '230', '18');
INSERT INTO `product` VALUES ('437', '纽荷橙', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h550opi4hi2lggbl6nr3ktae.jpg', '1', '0', '7.8', '7.8', '1', '4', '斤', '270', '18');
INSERT INTO `product` VALUES ('438', '海南麒麟瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h553e0d4df180cs2c1m0l5laq.jpg', '1', '0', '4.8', '4.8', '1', '3', '斤', '4000', '18');
INSERT INTO `product` VALUES ('439', '特小凤（黄芯西瓜）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h555nf730q19kcnf3l5t30b6.jpg', '1', '0', '4.8', '4.8', '1', '3', '斤', '4000', '18');
INSERT INTO `product` VALUES ('440', '香蕉（都乐）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h557t6814hm1imi3ejgqg71cbi.jpg', '1', '0', '4.5', '4.5', '1', '6', '斤', '150', '18');
INSERT INTO `product` VALUES ('441', '进口红提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h55aan25it8ts1od91q951h2ebu.jpg', '1', '0', '23.0', '23.0', '2', '5', '斤', '0', '18');
INSERT INTO `product` VALUES ('442', '进口黑提', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h55bv4e16iv114t12usn6u3inca.jpg', '1', '0', '35.0', '35.0', '2', '5', '斤', '0', '18');
INSERT INTO `product` VALUES ('443', '柠檬', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h55edlftsc1ehtgih1ied1dg6cm.jpg', '1', '0', '5.0', '5.0', '3', '6', '个', '0', '18');
INSERT INTO `product` VALUES ('444', '台湾牛奶枣', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h55kir91aa23cv1u1d1k52uo4dg.jpg', '1', '0', '13.8', '13.8', '1', '6', '斤', '75', '18');
INSERT INTO `product` VALUES ('445', '山竹', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h55m2jm1m8v12531cvpjmcqebds.jpg', '1', '0', '15.8', '15.8', '1', '6', '斤', '150', '18');
INSERT INTO `product` VALUES ('446', '桑果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h55pp641lqrp38m47k6gmque8.png', '1', '0', '10.0', '10.0', '3', '6', '盒', '0', '18');
INSERT INTO `product` VALUES ('447', '桂林金桔王', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h55rfkftj118tk79q1tba1opmek.jpg', '1', '0', '15.8', '15.8', '2', '6', '斤', '0', '18');
INSERT INTO `product` VALUES ('448', '美国蓝莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h55sd8olbnp2d1io9sid14qkf0.png', '1', '0', '10.0', '10.0', '3', '6', '盒', '0', '18');
INSERT INTO `product` VALUES ('449', '台湾水仙芒果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h55v2npokg1d7e1s0r4e152efc.jpg', '1', '0', '13.8', '13.8', '1', '6', '斤', '600', '18');
INSERT INTO `product` VALUES ('450', '奶油草莓', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h565a62hlc15uq1l021tqe1qgefo.png', '1', '0', '7.5', '7.5', '2', '6', '斤', '0', '18');
INSERT INTO `product` VALUES ('451', '海南甜瓜（玉姑）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h56acre18j411cd1tu01krh12tmg4.png', '1', '0', '10.8', '10.8', '1', '3', '斤', '950', '18');
INSERT INTO `product` VALUES ('452', '泰国桂圆', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h56dg1lot81u4ngv61tse28gg.jpg', '1', '0', '14.8', '14.8', '2', '6', '斤', '0', '18');
INSERT INTO `product` VALUES ('453', '甘蔗', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h56fiake6o1m5bdin768599gs.jpg', '1', '0', '15.0', '15.0', '3', '6', '根', '0', '18');
INSERT INTO `product` VALUES ('454', '火龙果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h56mel112ijo8411d31ng31ahbka.jpg', '1', '0', '7.8', '7.8', '1', '6', '斤', '600', '18');
INSERT INTO `product` VALUES ('455', '火龙果（红芯）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h56o2tcmig1i4v1i8aje21e4rkm.jpg', '1', '0', '16.8', '16.8', '1', '6', '斤', '600', '18');
INSERT INTO `product` VALUES ('456', '哈密瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h56pvo0b3g1scqn01e62bvml2.jpg', '1', '0', '8.8', '8.8', '1', '3', '斤', '2100', '18');
INSERT INTO `product` VALUES ('457', '榴莲', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h56sa45s3o1ldam49bfpb6qle.jpg', '1', '0', '22.0', '22.0', '1', '6', '斤', '2700', '18');
INSERT INTO `product` VALUES ('458', '黑布林', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h56u8sm1r5s1s9gkv1n4be54lq.jpg', '1', '0', '26.0', '26.0', '1', '5', '斤', '150', '18');
INSERT INTO `product` VALUES ('459', '红布林', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h56vfkrc7q1kav11od10211d24m6.jpg', '1', '0', '26.0', '26.0', '1', '5', '斤', '150', '18');
INSERT INTO `product` VALUES ('460', '进口木瓜', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h570nnihji1hnqil51mbe1rpami.jpg', '1', '0', '8.8', '8.8', '1', '3', '斤', '750', '18');
INSERT INTO `product` VALUES ('461', '杨桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h5725otd3s14e2637vl03gnmu.jpg', '1', '0', '8.0', '8.0', '3', '5', '个', '0', '18');
INSERT INTO `product` VALUES ('462', '美国新奇士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h575jhm1htn18e7k1ostsp7pna.png', '1', '0', '13.8', '13.8', '1', '4', '斤', '180', '18');
INSERT INTO `product` VALUES ('463', '海南圣女果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h5779ji1ed71r9qocq9rtfgunm.jpg', '1', '0', '6.8', '6.8', '2', '5', '斤', '0', '18');
INSERT INTO `product` VALUES ('464', '国产猕猴桃', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h579qrs1do2odk7r48stophog.jpg', '1', '0', '5.8', '5.8', '1', '3', '斤', '130', '18');
INSERT INTO `product` VALUES ('465', '小台农芒果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h57ba7k1fjar2l1v5k5b010bgos.jpg', '1', '0', '8.8', '8.8', '1', '3', '斤', '120', '18');
INSERT INTO `product` VALUES ('466', '大台农芒果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h57eoi61f94adu2i616mn5tjq5.jpg', '1', '0', '12.8', '12.8', '1', '3', '斤', '280', '18');
INSERT INTO `product` VALUES ('467', '天山雪莲果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h57ea9c19q8jh33or1f7513v1pp.jpg', '1', '0', '4.0', '4.0', '1', '3', '斤', '530', '18');
INSERT INTO `product` VALUES ('468', '陕西富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h8gboggo981hh3175717f0nbfl.jpg', '1', '0', '5.8', '5.8', '1', '1', '斤', '240', '19');
INSERT INTO `product` VALUES ('469', '陕高小富士', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h8geaiajk9jc63ttbnq11jh11.jpg', '1', '0', '7.8', '7.8', '1', '1', '斤', '240', '19');
INSERT INTO `product` VALUES ('470', '新疆阿克苏（促）', '', '1', '0', '3.9', '3.9', '1', '1', '斤', '240', '19');
INSERT INTO `product` VALUES ('471', '陕西富士王', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h8gjhtn1a5f1qpakng1d851l649.jpg', '1', '0', '9.8', '9.8', '1', '1', '斤', '350', '19');
INSERT INTO `product` VALUES ('472', '美国蛇果', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h8gnds11h1m13691b34tl317jeg.jpg', '1', '0', '12.8', '12.8', '1', '1', '斤', '260', '19');
INSERT INTO `product` VALUES ('473', '永春芦柑（精品）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h8grvl51ahg1n6o3t51kf6ct5s.jpg', '1', '0', '3.3', '3.3', '1', '4', '斤', '150', '19');
INSERT INTO `product` VALUES ('474', '永春金牌芦柑', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h8gtqan1ltl160p1mt51sfdjth18.jpg', '1', '0', '5.5', '5.5', '1', '4', '斤', '150', '19');
INSERT INTO `product` VALUES ('475', 'testts', 'http://7u2out.com1.z0.glb.clouddn.com/o_19irud8921g0q80210dm128213kb9.jpg', '1', '0', '21.0', '22.0', '1', '4', '个', '22', '15');
INSERT INTO `product` VALUES ('476', '你好', 'http://7u2out.com1.z0.glb.clouddn.com/o_19irue8llq5i1nli1ftn19v6fcil.jpg', '1', '0', '22.0', '22.0', '2', '1', '23', '0', '15');
INSERT INTO `product` VALUES ('477', '你好', '', '1', '0', '22.0', '213.0', '1', '3', '个4', '0', '15');

-- ----------------------------
-- Table structure for `shippingaddress`
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
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shippingaddress
-- ----------------------------
INSERT INTO `shippingaddress` VALUES ('14', '44', '刘志方', '上海', '上海市区', '上海', '不告诉', '18696168286', '1');
INSERT INTO `shippingaddress` VALUES ('16', '49', '任旺', '上海', '上海市区', '上海', '商务', '13917638125', '1');
INSERT INTO `shippingaddress` VALUES ('19', '45', '侯西阳', '上海', '上海市区', '上海', '测试地址', '13524712918', '1');
INSERT INTO `shippingaddress` VALUES ('21', '51', '任明星l', '上海', '上海市区', '上海', '虹光路181弄东海别墅97号', '13701686599', '1');
INSERT INTO `shippingaddress` VALUES ('22', '47', '任旺', '上海', '上海市区', '上海', '哈哈', '13917638125', '1');
INSERT INTO `shippingaddress` VALUES ('23', '79', '王先生', '上海', '上海市区', '上海', '佳通路31弄3号楼1103室', '13761202404', '1');
INSERT INTO `shippingaddress` VALUES ('24', '63', '曾妮', '上海', '上海市区', '上海', '南翔佳通路31弄2号楼907（中冶翔腾）', '15221008096', '0');
INSERT INTO `shippingaddress` VALUES ('25', '63', '曾妮', '上海', '上海市区', '上海', '南翔佳通路31弄2号楼907（中冶翔腾）', '15221008096', '1');
INSERT INTO `shippingaddress` VALUES ('26', '92', '王s', '上海', '上海市区', '上海', '佳通路31弄3號1113室', '18616738062', '1');
INSERT INTO `shippingaddress` VALUES ('27', '82', '娄丽', '上海', '上海市区', '上海', '南翔中冶祥腾城市广场2号楼10楼1008室', '13020104655', '0');
INSERT INTO `shippingaddress` VALUES ('28', '82', '娄丽', '上海', '上海市区', '上海', '南翔中冶祥腾城市广场2⃣️号楼10楼1008室', '13020104655', '1');
INSERT INTO `shippingaddress` VALUES ('29', '107', '陆春燕', '上海', '上海市区', '上海', '上海市嘉定区南翔镇民主东街151弄23号402室', '13917150297', '1');
INSERT INTO `shippingaddress` VALUES ('30', '108', '蔡欢', '上海', '上海市区', '上海', '嘉定区真南路4889弄18号1402室', '13062750253', '1');
INSERT INTO `shippingaddress` VALUES ('55', '109', '倪', '上海', '上海市区', '上海', '南翔节约街78号', '15921790798', '1');
INSERT INTO `shippingaddress` VALUES ('56', '43', '李玉龙', '上海', '上海市区', '上海', '南翔商务中心706室', '13918210924', '0');
INSERT INTO `shippingaddress` VALUES ('57', '110', '王', '上海', '上海市区', '上海', '槎溪路650弄1号楼923', '18817388708', '1');
INSERT INTO `shippingaddress` VALUES ('58', '114', '王子样', '上海', '上海市区', '上海', '中佳路21号', '13321931717', '1');
INSERT INTO `shippingaddress` VALUES ('59', '137', '娄小利', '上海', '上海市区', '上海', '佳通路31弄2号楼10086', '13918388225', '1');
INSERT INTO `shippingaddress` VALUES ('60', '147', '1111', '上海', '上海市区', '上海', '真如西村84号', '15201798068', '1');
INSERT INTO `shippingaddress` VALUES ('61', '136', '李大伟', '上海', '上海市区', '上海', '槎溪路650弄1号楼820室', '15821718534', '1');
INSERT INTO `shippingaddress` VALUES ('62', '151', '罗先生', '上海', '上海市区', '上海', '宝翔路560弄6号403', '18521523556', '1');
INSERT INTO `shippingaddress` VALUES ('63', '138', '朱明芳', '上海', '上海市区', '上海', '雅翔路288弄17号2002', '18930641335', '1');
INSERT INTO `shippingaddress` VALUES ('64', '159', '韩梅', '上海', '上海市区', '上海', '南翔，民主街115号', '13761325977', '1');
INSERT INTO `shippingaddress` VALUES ('66', '42', '王立', '上海', '上海市区', '上海', '日本', '15502187076', '1');
INSERT INTO `shippingaddress` VALUES ('71', '180', '江薇', '上海', '上海市区', '上海', '民主街190号哥弟', '13584076729', '1');
INSERT INTO `shippingaddress` VALUES ('72', '179', '李琳', '上海', '上海市区', '上海', '民主街190号哥弟', '13913952253', '1');
INSERT INTO `shippingaddress` VALUES ('73', '174', '芮芮', '上海', '上海市区', '上海', '上海市嘉定区沪宜公路1188号南翔智地园3号楼212室', '15026692702', '1');
INSERT INTO `shippingaddress` VALUES ('74', '189', '龚长战', '上海', '上海市区', '上海', '中冶祥腾城市广场3＃楼610室。', '15077148844', '1');
INSERT INTO `shippingaddress` VALUES ('75', '198', '安', '上海', '上海市区', '上海', '民东小区87弄8号楼102室', '18721112235', '1');
INSERT INTO `shippingaddress` VALUES ('76', '205', '李香实', '上海', '上海市区', '上海', '上海嘉定区南翔镇德华路 79弄-12号楼-302', '15216779438', '1');
INSERT INTO `shippingaddress` VALUES ('77', '211', '丁长华', '上海', '上海市区', '上海', '西林路265弄6单元403', '18939801855', '1');
INSERT INTO `shippingaddress` VALUES ('78', '212', '孙小姐', '上海', '上海市区', '上海', '栖林路178弄6号1201', '13801783229', '1');
INSERT INTO `shippingaddress` VALUES ('79', '111', '肖立卫', '上海', '上海市区', '上海', '德华路79弄10号602', '18121002416', '1');
INSERT INTO `shippingaddress` VALUES ('80', '213', '毕元磊', '上海', '上海市区', '上海', '宝翔路191弄7号新城公馆803室', '15692178987', '1');
INSERT INTO `shippingaddress` VALUES ('81', '231', '葛', '上海', '上海市区', '上海', '南翔镇109号', '15201751993', '1');
INSERT INTO `shippingaddress` VALUES ('82', '233', '吴聪明', '上海', '上海市区', '上海', '德力西路198', '13960109776', '1');
INSERT INTO `shippingaddress` VALUES ('83', '234', '金', '上海', '上海市区', '上海', '上海嘉定', '13585532703', '1');
INSERT INTO `shippingaddress` VALUES ('84', '236', '孙梦', '上海', '上海市区', '上海', '上海市嘉定区南翔镇佳通路31弄2号1017室', '15221314746', '1');
INSERT INTO `shippingaddress` VALUES ('85', '101', '赵', '上海', '上海市区', '上海', '佳通路2号楼1085', '13816478058', '1');
INSERT INTO `shippingaddress` VALUES ('86', '242', '孙', '上海', '上海市区', '上海', '中佳路25弄11号楼', '18201978342', '1');
INSERT INTO `shippingaddress` VALUES ('87', '243', '付菲菲', '上海', '上海市区', '上海', '民主东街180号7楼', '13816916418', '1');
INSERT INTO `shippingaddress` VALUES ('88', '195', '张波', '上海', '上海市区', '上海', '栖林路425弄6号1904', '13524458052', '1');
INSERT INTO `shippingaddress` VALUES ('89', '245', '关豫', '上海', '上海市区', '上海', '嘉定南翔镇民主东街151弄', '13611699145', '1');
INSERT INTO `shippingaddress` VALUES ('90', '246', '朱琳', '上海', '上海市区', '上海', '德华路80号，5棟302', '13917520564', '1');
INSERT INTO `shippingaddress` VALUES ('91', '248', '黄', '上海', '上海市区', '上海', '南翔民主街20号', '18516249995', '1');
INSERT INTO `shippingaddress` VALUES ('92', '116', '李晓青', '上海', '上海市区', '上海', '芳林路669弄布鲁斯郡168号', '13817692231', '1');
INSERT INTO `shippingaddress` VALUES ('93', '252', '银', '上海', '上海市区', '上海', '生产街', '13524596489', '1');
INSERT INTO `shippingaddress` VALUES ('94', '253', '顾大平', '上海', '上海市区', '上海', '南翔镇生产街201号', '13795437690', '1');
INSERT INTO `shippingaddress` VALUES ('95', '256', '师', '上海', '上海市区', '上海', '民主东街183号', '18049870331', '1');
INSERT INTO `shippingaddress` VALUES ('97', '257', '马', '上海', '上海市区', '上海', '民主', '15902115637', '1');
INSERT INTO `shippingaddress` VALUES ('98', '258', '张', '上海', '上海市区', '上海', '中佳路66号', '18930773989', '1');
INSERT INTO `shippingaddress` VALUES ('99', '259', '甘盛浩', '上海', '上海市区', '上海', '嘉定区南翔镇民主东街27弄501', '13585933001', '1');
INSERT INTO `shippingaddress` VALUES ('100', '97', '柳晓歌', '上海', '上海市区', '上海', '古漪园路281弄同盛公寓49号302', '13774315745', '1');
INSERT INTO `shippingaddress` VALUES ('101', '277', '甘露', '上海', '上海市区', '上海', '上海市嘉定区南翔镇裕丰路228弄1号501室', '18918569202', '1');
INSERT INTO `shippingaddress` VALUES ('102', '250', '史', '上海', '上海市区', '上海', '古猗园侧门', '15600690086', '1');
INSERT INTO `shippingaddress` VALUES ('103', '279', '庄晓英', '上海', '上海市区', '上海', '宝翔路560弄宏立瑞园16号1104室', '13816623084', '1');
INSERT INTO `shippingaddress` VALUES ('104', '280', '李涵斐', '上海', '上海市区', '上海', '民主东街87弄7号301', '18621795516', '1');
INSERT INTO `shippingaddress` VALUES ('105', '130', '闫志华', '上海', '上海市区', '上海', '德华路80弄威廉公馆5号101', '18017867293', '1');
INSERT INTO `shippingaddress` VALUES ('106', '282', '陶玲', '上海', '上海市区', '上海', '民东公寓12号', '13764555811', '1');
INSERT INTO `shippingaddress` VALUES ('107', '283', '纪', '上海', '上海市区', '上海', '民主东街1580', '13564364876', '1');
INSERT INTO `shippingaddress` VALUES ('108', '286', '尹先生', '上海', '上海市区', '上海', '南翔镇民主东街明东公寓6号', '13422093007', '1');
INSERT INTO `shippingaddress` VALUES ('109', '287', '吴', '上海', '上海市区', '上海', '南翔民主东街12号', '15618665259', '1');
INSERT INTO `shippingaddress` VALUES ('110', '177', '马蕾', '上海', '上海市区', '上海', '上海市嘉定区南翔镇真南路4889弄10号楼1001室', '18616527976', '1');
INSERT INTO `shippingaddress` VALUES ('111', '292', '王茜', '上海', '上海市区', '上海', '嘉定区南翔4368弄5号', '18321778335', '1');
INSERT INTO `shippingaddress` VALUES ('112', '294', '夏', '上海', '上海市区', '上海', '南翔125号', '13764345505', '1');
INSERT INTO `shippingaddress` VALUES ('113', '297', '任红云', '上海', '上海市区', '上海', '南翔民主东街81号', '18901641006', '1');
INSERT INTO `shippingaddress` VALUES ('114', '298', '张亚楠', '上海', '上海市区', '上海', '南翔民主东街147号', '13921782297', '1');
INSERT INTO `shippingaddress` VALUES ('115', '299', '孙诚', '上海', '上海市区', '上海', '上海市嘉定区中佳路28号3号', '18217295620', '1');
INSERT INTO `shippingaddress` VALUES ('116', '301', '宋蓓雯', '上海', '上海市区', '上海', '沪宜公路1111弄越界产业园区213室上海高凡猎头', '13817079627', '1');
INSERT INTO `shippingaddress` VALUES ('117', '238', '曹苗苗', '上海', '上海市区', '上海', '芳林路669弄布鲁斯郡88号101室', '13311695666', '1');
INSERT INTO `shippingaddress` VALUES ('118', '303', '阳丽', '上海', '上海市区', '上海', '陈翔路1588弄8号楼801室', '13651996018', '1');
INSERT INTO `shippingaddress` VALUES ('119', '304', '赵妍', '上海', '上海市区', '上海', '嘉定区沪宜公路1188号南翔智地3号楼212', '15921404902', '1');
INSERT INTO `shippingaddress` VALUES ('120', '305', '陈华杰', '上海', '上海市区', '上海', '佳通路31弄2号楼907室', '13701818905', '1');
INSERT INTO `shippingaddress` VALUES ('121', '217', '李波', '上海', '上海市区', '上海', '南翔镇丰翔路2755号上海臻誉木业有限公司', '18217516912', '1');
INSERT INTO `shippingaddress` VALUES ('122', '306', '叶安丽', '上海', '上海市区', '上海', '南翔镇真南路4368\'弄5号2楼', '15618242622', '1');
INSERT INTO `shippingaddress` VALUES ('123', '307', '刘', '上海', '上海市区', '上海', '嘉定区真南路6348弄2楼', '13166362339', '1');
INSERT INTO `shippingaddress` VALUES ('124', '310', '余容', '上海', '上海市区', '上海', '上海市嘉定区南翔镇辛勤路', '15921359945', '1');
INSERT INTO `shippingaddress` VALUES ('125', '311', '郁', '上海', '上海市区', '上海', '方林路', '13761480883', '1');
INSERT INTO `shippingaddress` VALUES ('126', '251', '陈宜兰', '上海', '上海市区', '上海', '上海市嘉定区南翔镇佳通路31弄5号楼909', '18721875986', '1');
INSERT INTO `shippingaddress` VALUES ('127', '313', '朱媛', '上海', '上海市区', '上海', '嘉定区南翔镇民主东街46号', '18621523951', '1');
INSERT INTO `shippingaddress` VALUES ('128', '314', '冯挺', '上海', '上海市区', '上海', '嘉定区南翔镇德园路1500弄', '13386138889', '1');
INSERT INTO `shippingaddress` VALUES ('129', '318', '西西', '上海', '上海市区', '上海', '民主东街135号', '13564176538', '1');
INSERT INTO `shippingaddress` VALUES ('130', '319', '冯艳', '上海', '上海市区', '上海', '民东公寓8号202', '18788822336', '1');
INSERT INTO `shippingaddress` VALUES ('131', '320', '张', '上海', '上海市区', '上海', '嘉美路1905弄18号2204', '18221580150', '1');
INSERT INTO `shippingaddress` VALUES ('132', '321', '管', '上海', '上海市区', '上海', '民主东街151弄3号201', '13524616344', '1');
INSERT INTO `shippingaddress` VALUES ('133', '322', '夏', '上海', '上海市区', '上海', '南翔民主东街6号201', '18018699428', '1');
INSERT INTO `shippingaddress` VALUES ('134', '323', '林小姐', '上海', '上海市区', '上海', '上海市嘉定区南翔镇真南路4233弄', '15800745303', '1');
INSERT INTO `shippingaddress` VALUES ('135', '324', '金晓兰', '上海', '上海市区', '上海', '宝翔路560弄22号楼604室', '18621776392', '1');
INSERT INTO `shippingaddress` VALUES ('136', '325', '张娜', '上海', '上海市区', '上海', '上海市嘉定区南翔镇德华路威廉公馆二期11号楼702', '18610469820', '1');
INSERT INTO `shippingaddress` VALUES ('137', '326', '任杰', '上海', '上海市区', '上海', '中冶祥腾城市广场三楼08', '18089865627', '1');
INSERT INTO `shippingaddress` VALUES ('138', '328', '刘超', '上海', '上海市区', '上海', '民主东街87弄8#102', '15832179928', '1');
INSERT INTO `shippingaddress` VALUES ('139', '333', '赵妍', '上海', '上海市区', '上海', '沪宜公路1188号南翔置地3号楼212室', '15921404902', '1');
INSERT INTO `shippingaddress` VALUES ('140', '335', '孙雪', '上海', '上海市区', '上海', '南翔镇佳通路3号楼301室', '13816645670', '1');
INSERT INTO `shippingaddress` VALUES ('141', '337', '王康', '上海', '上海市区', '上海', '南翔镇佳通路31弄2号楼907', '15800623405', '1');
INSERT INTO `shippingaddress` VALUES ('142', '336', '蔡', '上海', '上海市区', '上海', '绿杨路68号', '13817715984', '1');
INSERT INTO `shippingaddress` VALUES ('143', '339', '杨萍', '上海', '上海市区', '上海', '人民街100弄27号', '13761034215', '1');
INSERT INTO `shippingaddress` VALUES ('144', '341', '王婷', '上海', '上海市区', '上海', '南翔雅翔路288弄9号502', '13501644565', '1');
INSERT INTO `shippingaddress` VALUES ('145', '272', '王宜俊', '上海', '上海市区', '上海', '陈翔路', '13564198009', '1');
INSERT INTO `shippingaddress` VALUES ('146', '342', '孙', '上海', '上海市区', '上海', '真南路4889弄10号15室', '15221277707', '1');
INSERT INTO `shippingaddress` VALUES ('147', '347', '倪', '上海', '上海市区', '上海', '嘉定区南翔镇南华路7弄12号101', '13564210624', '1');
INSERT INTO `shippingaddress` VALUES ('148', '349', '黄', '上海', '上海市区', '上海', '中佳路28弄10号1404', '15901699270', '1');
INSERT INTO `shippingaddress` VALUES ('149', '350', '马灿', '上海', '上海市区', '上海', '中佳路29弄10号楼1404', '18221617276', '1');
INSERT INTO `shippingaddress` VALUES ('150', '351', '汤暗', '上海', '上海市区', '上海', '真南路4368弄5号2楼', '18321107946', '1');
INSERT INTO `shippingaddress` VALUES ('151', '348', '赵妍', '上海', '上海市区', '上海', '沪宜公路1188号南翔智地3号楼212', '15921404902', '1');
INSERT INTO `shippingaddress` VALUES ('152', '352', '孙', '上海', '上海市区', '上海', '中冶祥腾2号楼1017室', '15221314746', '1');
INSERT INTO `shippingaddress` VALUES ('153', '354', '邵晶晶', '上海', '上海市区', '上海', '同翔医院', '13817310846', '1');
INSERT INTO `shippingaddress` VALUES ('154', '355', '夏', '上海', '上海市区', '上海', '同翔医院', '18655664962', '1');
INSERT INTO `shippingaddress` VALUES ('155', '357', '张', '上海', '上海市区', '上海', '南翔德华路450弄10号203室', '18017805236', '1');
INSERT INTO `shippingaddress` VALUES ('156', '229', '李婷', '上海', '上海市区', '上海', '佳通路31弄3号楼1015', '18930865288', '1');
INSERT INTO `shippingaddress` VALUES ('157', '358', '廖小姐', '上海', '上海市区', '上海', '民主东街民东公寓27弄', '13311669936', '1');
INSERT INTO `shippingaddress` VALUES ('158', '360', '张小姐', '上海', '上海市区', '上海', '民东公寓', '15021141691', '1');
INSERT INTO `shippingaddress` VALUES ('159', '359', '宋', '上海', '上海市区', '上海', '民东公寓12号', '13818141559', '1');
INSERT INTO `shippingaddress` VALUES ('160', '361', '余文', '上海', '上海市区', '上海', '民东公寓\n87弄105室', '18721151254', '1');
INSERT INTO `shippingaddress` VALUES ('161', '237', '李昌元', '上海', '上海市区', '上海', '上海市嘉定区南翔镇佳通路31号5号楼909', '18621226099', '1');
INSERT INTO `shippingaddress` VALUES ('162', '363', '赵妍', '上海', '上海市区', '上海', '沪宜公路1188号南翔智地3号楼212', '15921404902', '1');
INSERT INTO `shippingaddress` VALUES ('163', '365', '吴婷婷', '上海', '上海市区', '上海', '南翔镇佳通路31号5号楼909', '13764431001', '1');
INSERT INTO `shippingaddress` VALUES ('164', '368', '倪嘉', '上海', '上海市区', '上海', '佳通路31弄5号楼909号', '18658555867', '1');
INSERT INTO `shippingaddress` VALUES ('165', '371', '王', '上海', '上海市区', '上海', '桃浦二村20号202', '13524905081', '1');
INSERT INTO `shippingaddress` VALUES ('166', '372', '李', '上海', '上海市区', '上海', '白丽路10号', '13761858873', '1');
INSERT INTO `shippingaddress` VALUES ('167', '377', '娄石玉', '上海', '上海市区', '上海', '嘉定区南翔佳通路31弄2号1008', '13262536609', '1');
INSERT INTO `shippingaddress` VALUES ('168', '378', '周', '上海', '上海市区', '上海', '绿杨路43号', '18101798598', '1');
INSERT INTO `shippingaddress` VALUES ('169', '379', '林', '上海', '上海市区', '上海', '绿杨绿86号', '13120652885', '1');
INSERT INTO `shippingaddress` VALUES ('170', '380', '浦', '上海', '上海市区', '上海', '民主东街87弄1号301', '18721452956', '1');
INSERT INTO `shippingaddress` VALUES ('171', '381', '张', '上海', '上海市区', '上海', '武威路1082弄18号301', '13817450977', '1');
INSERT INTO `shippingaddress` VALUES ('172', '382', '刘丹', '上海', '上海市区', '上海', '郁李路10号', '13984853464', '1');
INSERT INTO `shippingaddress` VALUES ('173', '383', '唐金涛', '上海', '上海市区', '上海', '芳林路951弄15号503', '15316326989', '1');
INSERT INTO `shippingaddress` VALUES ('174', '386', '孙', '上海', '上海市区', '上海', '绿杨路18号', '13761159896', '1');
INSERT INTO `shippingaddress` VALUES ('175', '388', '卢海燕', '上海', '上海市区', '上海', '南翔德园路725弄2号502', '13585781204', '1');
INSERT INTO `shippingaddress` VALUES ('176', '356', '陈平', '上海', '上海市区', '上海', '南翔镇民主东街151号', '18964572209', '1');
INSERT INTO `shippingaddress` VALUES ('177', '389', '汪艳玲', '上海', '上海市区', '上海', '上海市嘉定区南翔镇嘉前路501', '13774477956', '1');
INSERT INTO `shippingaddress` VALUES ('178', '390', '许佳云', '上海', '上海市区', '上海', '和平街150弄', '13816209562', '1');
INSERT INTO `shippingaddress` VALUES ('179', '391', '罗', '上海', '上海市区', '上海', '民主东街27弄401', '13570029090', '1');
INSERT INTO `shippingaddress` VALUES ('180', '393', '刘晶', '上海', '上海市区', '上海', '上海市嘉定区南翔镇真南路4889弄14号楼1402室', '13671615336', '1');
INSERT INTO `shippingaddress` VALUES ('181', '395', '張', '上海', '上海市区', '上海', '绿杨路50号', '13611738275', '1');
INSERT INTO `shippingaddress` VALUES ('182', '394', '张', '上海', '上海市区', '上海', '古漪园路158弄2号702', '13601646702', '1');
INSERT INTO `shippingaddress` VALUES ('183', '394', '张', '上海', '上海市区', '上海', '古漪园路158弄2号702', '13601646702', '0');
INSERT INTO `shippingaddress` VALUES ('184', '396', '李', '上海', '上海市区', '上海', '民主公寓87幢9楼202', '18701760590', '1');
INSERT INTO `shippingaddress` VALUES ('185', '102', '朱', '上海', '上海市区', '上海', '古猗园路281弄44号402', '13391333537', '1');
INSERT INTO `shippingaddress` VALUES ('186', '398', '宋小宝', '上海', '上海市区', '上海', '民主东街170弄16号301', '18016066658', '1');
INSERT INTO `shippingaddress` VALUES ('187', '401', '黄艳', '上海', '上海市区', '上海', '嘉定区德华路79弄10号602', '18616803360', '1');
INSERT INTO `shippingaddress` VALUES ('188', '402', '韩', '上海', '上海市区', '上海', '绿扬路98号', '13661884941', '1');
INSERT INTO `shippingaddress` VALUES ('189', '403', '程', '上海', '上海市区', '上海', '绿杨路51弄22号', '18217150561', '1');
INSERT INTO `shippingaddress` VALUES ('190', '405', '吴', '上海', '上海市区', '上海', '绿杨绿6号', '13816107099', '1');
INSERT INTO `shippingaddress` VALUES ('191', '406', '戎', '上海', '上海市区', '上海', '郁李路1038号', '13651985170', '1');
INSERT INTO `shippingaddress` VALUES ('192', '408', '张', '上海', '上海市区', '上海', '桃浦四村', '13761554642', '1');
INSERT INTO `shippingaddress` VALUES ('193', '411', '郭', '上海', '上海市区', '上海', '民主街495弄4号202', '18221113397', '1');
INSERT INTO `shippingaddress` VALUES ('194', '412', '赵', '上海', '上海市区', '上海', '民主东街125', '13916162718', '1');
INSERT INTO `shippingaddress` VALUES ('195', '414', '朱', '上海', '上海市区', '上海', '白丽路21号', '13162365532', '1');
INSERT INTO `shippingaddress` VALUES ('196', '413', '娄石玉', '上海', '上海市区', '上海', '嘉定区佳通路31弄2号1008室', '18817702785', '1');
INSERT INTO `shippingaddress` VALUES ('197', '415', '刘灌洋', '上海', '上海市区', '上海', '佳通路31弄2号1008室', '15000818166', '1');
INSERT INTO `shippingaddress` VALUES ('198', '417', '周', '上海', '上海市区', '上海', '绿杨路82号', '13761763583', '1');
INSERT INTO `shippingaddress` VALUES ('199', '419', '晟', '上海', '上海市区', '上海', '郁李路1028号', '13482672885', '1');
INSERT INTO `shippingaddress` VALUES ('200', '420', '谭', '上海', '上海市区', '上海', '民主东街59号', '18964770377', '1');
INSERT INTO `shippingaddress` VALUES ('201', '418', '张惠', '上海', '上海市区', '上海', '德华路79弄15号', '18621682996', '1');
INSERT INTO `shippingaddress` VALUES ('202', '421', '赵', '上海', '上海市区', '上海', '民主街86号', '18918614606', '1');
INSERT INTO `shippingaddress` VALUES ('203', '425', '柴立猛', '上海', '上海市区', '上海', '民东公寓87弄8_102', '15833924201', '1');
INSERT INTO `shippingaddress` VALUES ('204', '427', '张小姐', '上海', '上海市区', '上海', '南翔', '18616829226', '1');
INSERT INTO `shippingaddress` VALUES ('205', '428', 'Zhang', '上海', '上海市区', '上海', '南翔中人路388号102', '13701668209', '1');
INSERT INTO `shippingaddress` VALUES ('206', '429', '张静静', '上海', '上海市区', '上海', '德华路80弄10号', '13817469211', '1');
INSERT INTO `shippingaddress` VALUES ('207', '431', '刘', '上海', '上海市区', '上海', '武威路1087弄45号403', '13472609108', '1');
INSERT INTO `shippingaddress` VALUES ('208', '433', '张', '上海', '上海市区', '上海', '上海南翔明洞公寓2号808', '18817274743', '1');
INSERT INTO `shippingaddress` VALUES ('209', '434', '李', '上海', '上海市区', '上海', '南翔镇民东公寓15栋502', '18017120557', '1');
INSERT INTO `shippingaddress` VALUES ('210', '436', '侯', '上海', '上海市区', '上海', '白丽路50弄401', '13764433000', '1');
INSERT INTO `shippingaddress` VALUES ('211', '410', '陈武', '上海', '上海市区', '上海', '民主东街87弄8号102', '18916673770', '1');
INSERT INTO `shippingaddress` VALUES ('212', '438', '秦', '上海', '上海市区', '上海', '翔江公路1185号9门', '18917506029', '1');
INSERT INTO `shippingaddress` VALUES ('213', '173', '古', '上海', '上海市区', '上海', '民主街115弄8号401室', '18502168519', '1');
INSERT INTO `shippingaddress` VALUES ('214', '439', '沈', '上海', '上海市区', '上海', '上海市嘉定区南翔佳通路21弄8号楼1101', '18316036540', '1');
INSERT INTO `shippingaddress` VALUES ('215', '440', '吴', '上海', '上海市区', '上海', '上海南翔中佳路29弄8号楼304', '18817902775', '1');
INSERT INTO `shippingaddress` VALUES ('216', '441', '佘', '上海', '上海市区', '上海', '上海市嘉定南翔明东公寓27弄401', '15216769959', '1');
INSERT INTO `shippingaddress` VALUES ('217', '442', '张银中', '上海', '上海市区', '上海', '上海嘉定区民主东街27弄11号201', '13611899959', '1');
INSERT INTO `shippingaddress` VALUES ('218', '443', '倪', '上海', '上海市区', '上海', '解放街129号304室', '13918016517', '1');
INSERT INTO `shippingaddress` VALUES ('219', '367', '彭丹', '上海', '上海市区', '上海', '上海嘉定南翔德华路80弄6号楼1003', '18717866467', '1');
INSERT INTO `shippingaddress` VALUES ('220', '444', '李', '上海', '上海市区', '上海', '桃浦五村18号401', '15821374702', '1');
INSERT INTO `shippingaddress` VALUES ('221', '445', '李', '上海', '上海市区', '上海', '嘉定南翔中佳路29弄8号楼1101', '15000088552', '1');
INSERT INTO `shippingaddress` VALUES ('222', '446', '邵', '上海', '上海市区', '上海', '南翔镇民主东街176-3', '13120876692', '1');
INSERT INTO `shippingaddress` VALUES ('223', '447', '刘嘉乐', '上海', '上海市区', '上海', '上海市嘉定区南翔\n古猗园路281弄同盛公寓', '15692137792', '1');
INSERT INTO `shippingaddress` VALUES ('224', '448', '蒋', '上海', '上海市区', '上海', '南翔镇古漪园路281弄7号602', '15052389161', '1');
INSERT INTO `shippingaddress` VALUES ('225', '449', '张茜茜', '上海', '上海市区', '上海', '古漪园路281弄7号602', '18895506169', '1');
INSERT INTO `shippingaddress` VALUES ('226', '450', '刘嘉乐', '上海', '上海市区', '上海', '上海市嘉定区南翔古猗园路281弄同盛公寓7号602', '15692137792', '1');
INSERT INTO `shippingaddress` VALUES ('227', '451', '谢', '上海', '上海市区', '上海', '中佳路29弄8号1101室', '13816329217', '1');
INSERT INTO `shippingaddress` VALUES ('228', '452', '王', '上海', '上海市区', '上海', '绿杨路51弄12号201', '13801959638', '1');
INSERT INTO `shippingaddress` VALUES ('229', '453', '徐丹丹', '上海', '上海市区', '上海', '南翔镇 威廉公馆12#804', '18217028462', '1');
INSERT INTO `shippingaddress` VALUES ('230', '456', '刘小姐', '上海', '上海市区', '上海', '民主东街87弄86号103室', '13917443897', '1');
INSERT INTO `shippingaddress` VALUES ('231', '466', '吉', '上海', '上海市区', '上海', '白丽路20号', '13764800519', '1');
INSERT INTO `shippingaddress` VALUES ('232', '467', '孙', '上海', '上海市区', '上海', '绿杨路51弄36号202', '15801801340', '1');
INSERT INTO `shippingaddress` VALUES ('233', '464', '龚', '上海', '上海市区', '上海', '民主街185弄18号', '18817981868', '1');
INSERT INTO `shippingaddress` VALUES ('234', '469', '张小姐', '上海', '上海市区', '上海', '沪宜公路185号', '18016251031', '1');
INSERT INTO `shippingaddress` VALUES ('235', '470', '于', '上海', '上海市区', '上海', '沪宜公路183号', '18016251092', '0');
INSERT INTO `shippingaddress` VALUES ('236', '471', '马玲玲', '上海', '上海市区', '上海', '上海市嘉定区南翔镇真南路4368弄5号2楼', '15121171308', '1');
INSERT INTO `shippingaddress` VALUES ('237', '472', '方晨', '上海', '上海市区', '上海', '古漪园路4弄3号131', '13916349490', '1');
INSERT INTO `shippingaddress` VALUES ('238', '373', '徐', '上海', '上海市区', '上海', '武威路1087弄28号302', '13918698504', '1');
INSERT INTO `shippingaddress` VALUES ('239', '473', '吴', '上海', '上海市区', '上海', '德华路235弄15号101室', '13636598966', '1');
INSERT INTO `shippingaddress` VALUES ('240', '474', '陈', '上海', '上海市区', '上海', '南翔民主路45号401室', '13636358868', '1');
INSERT INTO `shippingaddress` VALUES ('241', '478', '闫楠', '上海', '上海市区', '上海', '沪宜公路185号', '13818369825', '1');
INSERT INTO `shippingaddress` VALUES ('242', '479', '黎', '上海', '上海市区', '上海', '古漪园路32号', '18217209380', '1');
INSERT INTO `shippingaddress` VALUES ('243', '480', '李晓晨', '上海', '上海市区', '上海', '民主东街500', '18321632086', '1');
INSERT INTO `shippingaddress` VALUES ('244', '481', '陈静', '上海', '上海市区', '上海', '德园路325号', '15800818718', '1');
INSERT INTO `shippingaddress` VALUES ('245', '392', '李白', '上海', '上海市区', '上海', '真南路4889弄14号1402室（绿地新翔家园）', '13764259281', '0');
INSERT INTO `shippingaddress` VALUES ('246', '392', '李白', '上海', '上海市区', '上海', '真南路4889弄12号1202室（绿地新翔家园）', '13764259281', '1');
INSERT INTO `shippingaddress` VALUES ('247', '484', '杨小姐', '上海', '上海市区', '上海', '南翔五彩城二楼耐克', '18217707543', '1');
INSERT INTO `shippingaddress` VALUES ('248', '490', '徐英', '上海', '上海市区', '上海', '上海市嘉定区南翔镇古猗园路281弄15号601', '15821618856', '1');
INSERT INTO `shippingaddress` VALUES ('249', '493', '郭', '上海', '上海市区', '上海', '南翔镇民主街495弄4号202室', '15801838199', '1');
INSERT INTO `shippingaddress` VALUES ('250', '492', '刘', '上海', '上海市区', '上海', '南翔民主街495弄502室', '13564486683', '1');
INSERT INTO `shippingaddress` VALUES ('251', '118', '吴亦凡', '上海', '上海市区', '上海', '裕丰路525弄16号502', '13816114206', '1');
INSERT INTO `shippingaddress` VALUES ('252', '497', '孙豪泰', '上海', '上海市区', '上海', '南翔商务中心705', '18692245999', '1');
INSERT INTO `shippingaddress` VALUES ('253', '502', '陈', '上海', '上海市区', '上海', '绿杨路46号', '18317086529', '1');
INSERT INTO `shippingaddress` VALUES ('254', '503', '火', '上海', '上海市区', '上海', '武威路1087弄39号601', '13818026850', '1');
INSERT INTO `shippingaddress` VALUES ('255', '509', '孙', '上海', '上海市区', '上海', '白丽路123号', '18721945165', '1');
INSERT INTO `shippingaddress` VALUES ('256', '512', '强', '上海', '上海市区', '上海', '民主东街46号', '18918001977', '1');
INSERT INTO `shippingaddress` VALUES ('257', '513', '叶', '上海', '上海市区', '上海', '中佳路28弄3号', '13761778633', '1');
INSERT INTO `shippingaddress` VALUES ('258', '514', '强', '上海', '上海市区', '上海', '嘉年路128弄3号1004室', '13524258887', '1');
INSERT INTO `shippingaddress` VALUES ('259', '511', '林耕荒', '上海', '上海市区', '上海', '民东公寓87弄10号502', '13023962449', '1');
INSERT INTO `shippingaddress` VALUES ('260', '519', '张华', '上海', '上海市区', '上海', '德园路687号12号', '18901880108', '1');
INSERT INTO `shippingaddress` VALUES ('261', '518', '张玉龙', '上海', '上海市区', '上海', '绿杨路51弄4号401', '18721710815', '1');
INSERT INTO `shippingaddress` VALUES ('262', '522', '朱', '上海', '上海市区', '上海', '绿杨路62号', '13681977850', '1');
INSERT INTO `shippingaddress` VALUES ('263', '524', '谢树清', '上海', '上海市区', '上海', '宝翔路888弄19号1501室（朗诗）', '13816377995', '1');
INSERT INTO `shippingaddress` VALUES ('264', '526', '吴燕红', '上海', '上海市区', '上海', '上海市普陀区雪松路392弄110号101室', '18018665830', '1');
INSERT INTO `shippingaddress` VALUES ('265', '530', '任', '上海', '上海市区', '上海', '哈哈', '13917638124', '1');
INSERT INTO `shippingaddress` VALUES ('266', '528', '黄健', '上海', '上海市区', '上海', '桃浦镇绿杨路36弄241号203室', '15102137703', '1');
INSERT INTO `shippingaddress` VALUES ('267', '533', '陈璐', '上海', '上海市区', '上海', '安亭吴胜别墅256', '15618977015', '1');
INSERT INTO `shippingaddress` VALUES ('268', '532', '徐小姐', '上海', '上海市区', '上海', '银杏路120弄13号504', '15901977567', '1');
INSERT INTO `shippingaddress` VALUES ('269', '40', '戴西', '上海', '上海市区', '上海', 'a a', '15502187076', '1');
INSERT INTO `shippingaddress` VALUES ('270', '541', '张静静', '上海', '上海市区', '上海', '德华路80弄16号', '18621682996', '1');
INSERT INTO `shippingaddress` VALUES ('271', '542', '陈倩倩', '上海', '上海市区', '上海', '中佳路28弄3号，1103', '18321706289', '1');
INSERT INTO `shippingaddress` VALUES ('272', '544', '吴爱媚', '上海', '上海市区', '上海', '上海市宝山区园泰路399号', '15669857209', '1');
INSERT INTO `shippingaddress` VALUES ('273', '545', '李娴', '上海', '上海市区', '上海', '民主街500弄7号201', '13701878419', '1');
INSERT INTO `shippingaddress` VALUES ('274', '501', '胡可明', '上海', '上海市区', '上海', '嘉定区南翔商务中心', '18268930486', '1');
INSERT INTO `shippingaddress` VALUES ('275', '465', '葛曦', '上海', '上海市区', '上海', '宝翔路191弄7号楼920室', '18616202506', '1');
INSERT INTO `shippingaddress` VALUES ('276', '551', '谢', '上海', '上海市区', '上海', '南翔镇民主东街 民东公寓27 九号  202室', '15386260217', '1');
INSERT INTO `shippingaddress` VALUES ('277', '556', '李', '上海', '上海市区', '上海', '沪宜公路185号', '18016251095', '1');
INSERT INTO `shippingaddress` VALUES ('278', '558', '顾', '上海', '上海市区', '上海', '上海市南翔镇民主东街', '13917957310', '1');
INSERT INTO `shippingaddress` VALUES ('279', '568', '倪', '上海', '上海市区', '上海', '上海市嘉定区南翔镇民主东街151弄18号302室', '18918569665', '1');
INSERT INTO `shippingaddress` VALUES ('280', '570', '小雨', '上海', '上海市区', '上海', '绿杨路51弄36号202', '13671595881', '1');
INSERT INTO `shippingaddress` VALUES ('281', '251', '陈宜兰', '上海', '上海市区', '上海', '上海市嘉定区南翔镇宝翔路宏立瑞园16号401', '18721875986', '0');
INSERT INTO `shippingaddress` VALUES ('282', '572', '朱', '上海', '上海市区', '上海', '郁李路161号', '13816949047', '1');
INSERT INTO `shippingaddress` VALUES ('283', '575', '金', '上海', '上海市区', '上海', '绿杨路51弄36号503', '13032171056', '1');
INSERT INTO `shippingaddress` VALUES ('284', '574', '夏玉', '上海', '上海市区', '上海', '民主东街147号', '13921782297', '1');
INSERT INTO `shippingaddress` VALUES ('285', '552', '余超', '上海', '上海市区', '上海', '南翔', '18721987537', '1');
INSERT INTO `shippingaddress` VALUES ('286', '584', '印丽红', '上海', '上海市区', '上海', '南翔镇翔江公路299弄永乐公寓207号301室', '13916068462', '1');
INSERT INTO `shippingaddress` VALUES ('287', '577', '李乐华', '上海', '上海市区', '上海', '南翔老街人民街13号长亭外咖啡莫家弄内', '18602104821', '1');
INSERT INTO `shippingaddress` VALUES ('288', '586', '噶', '上海', '上海市区', '上海', '民东公寓', '18695542833', '1');
INSERT INTO `shippingaddress` VALUES ('289', '587', '郭飞飞', '上海', '上海市区', '上海', '南华路96号', '13651813465', '1');
INSERT INTO `shippingaddress` VALUES ('290', '591', 'vicci', '上海', '上海市区', '上海', '中佳路29号6号楼', '15221829457', '1');
INSERT INTO `shippingaddress` VALUES ('291', '590', '华进', '上海', '上海市区', '上海', '南翔 民主东街180号602', '15026618441', '1');
INSERT INTO `shippingaddress` VALUES ('292', '593', '任艳艳', '上海', '上海市区', '上海', '南翔民主东街38号02', '18677776549', '1');
INSERT INTO `shippingaddress` VALUES ('293', '592', '张建渊', '上海', '上海市区', '上海', '南翔镇民主东街87弄19号401室', '13801691815', '1');
INSERT INTO `shippingaddress` VALUES ('294', '594', '陈', '上海', '上海市区', '上海', '民主东街81号102', '18990900055', '1');
INSERT INTO `shippingaddress` VALUES ('295', '597', '梁', '上海', '上海市区', '上海', '民东公寓87弄10号楼102', '18321603626', '1');
INSERT INTO `shippingaddress` VALUES ('296', '601', '李文', '上海', '上海市区', '上海', '民主东街24号204', '15201929056', '1');
INSERT INTO `shippingaddress` VALUES ('297', '602', '小虾', '上海', '上海市区', '上海', '嘉宝小区10号102', '13917873164', '1');
INSERT INTO `shippingaddress` VALUES ('298', '603', '朱', '上海', '上海市区', '上海', '南翔镇火车站路151弄10号楼', '13917567276', '1');
INSERT INTO `shippingaddress` VALUES ('299', '604', '陶平', '上海', '上海市区', '上海', '佳同路 3号l', '15707991597', '1');
INSERT INTO `shippingaddress` VALUES ('300', '605', '邹志娟', '上海', '上海市区', '上海', '佳通路南翔镇29弄5号704室', '15800445471', '0');
INSERT INTO `shippingaddress` VALUES ('301', '605', '小娟', '上海', '上海市区', '上海', '佳通路29弄5号楼704室', '15800445471', '1');
INSERT INTO `shippingaddress` VALUES ('302', '607', '张沛公', '上海', '上海市区', '上海', '南翔镇顺丰路389号', '15155255266', '1');
INSERT INTO `shippingaddress` VALUES ('303', '608', '赵', '上海', '上海市区', '上海', '民主街149号', '18939906786', '1');
INSERT INTO `shippingaddress` VALUES ('304', '606', '伍俊霞', '上海', '上海市区', '上海', '宝翔路577弄7号', '13564523102', '1');
INSERT INTO `shippingaddress` VALUES ('305', '609', '王', '上海', '上海市区', '上海', '白丽路285\n号', '13262666799', '1');
INSERT INTO `shippingaddress` VALUES ('306', '610', '李', '上海', '上海市区', '上海', '绿杨路51弄19号', '15618187100', '1');
INSERT INTO `shippingaddress` VALUES ('307', '611', '祝', '上海', '上海市区', '上海', '白丽路68号', '13816549138', '1');
INSERT INTO `shippingaddress` VALUES ('433', '41', '戴玺', '上海', '上海市区', '上海', '撒旦', '15502187076', '1');

-- ----------------------------
-- Table structure for `shop`
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
  `discount` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('12', 'ji12', '南翔镇民主东街131号', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dc3l3kq16d2i70bonj891f49l.jpg', '美鲜鲜果业', '林总', '15859285082', '31.301074', '121.324587', 'wtw60f1vgz0g', '上海', '嘉定', '上海', '以质量求生存、以诚信求发展。价格和实体店同步，支持首单立减10元活动。', '30', '1', '1', '10');
INSERT INTO `shop` VALUES ('13', 're13', '德园路616', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dr6qrrc1v22n4vtsk1f27s4v9.jpg', '阿q果园子', '夏老板', '18321940791', '31.304237', '121.313583', 'wtw60dcb7kez', '上海', '嘉定南翔', '上海', '精品水果，味美鲜甜。价格和实体店同步，支持首单立减10元活动。', '40', '1', '1', '1');
INSERT INTO `shop` VALUES ('14', 'kw14', '栖林路302弄19号', 'http://7u2out.com1.z0.glb.clouddn.com/o_19evs2kl81h3r18pd11el1thj1mo3g.jpg', '宝群果业', '周老板', '18721178165', '31.314935', '121.325683', 'wtw60udwtqfp', '上海', '嘉定南翔', '上海', '各类精品水果，价格优惠。价格和实体店同步，支持首单立减10元活动。', '40', '1', '0', '0');
INSERT INTO `shop` VALUES ('15', 'ls15', '北京市景山前街4号', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dts4l4cce21bgfake1cimu3i9.jpg', '树窝水果直营店', '壁垒', '13918210924', '40.00205', '116.327985', 'wx4ex45kyd86', '北京', '故宫', '北京', '壁垒！', '30', '1', '1', '5');
INSERT INTO `shop` VALUES ('16', 'wu16', '桃浦新村绿杨路76号', 'http://7u2out.com1.z0.glb.clouddn.com/o_19g3tmr8rsck1ive6fhgt9ju19.jpg', '百家乐果园', '蔡老板', '13817715984', '31.289858', '121.352377', 'wtw612nhek69', '上海', '桃浦', '上海', '精品水果，味美鲜甜，还有干货和小零食噢，价格和实体店同步，支持首单立减10元活动。', '30', '1', '0', '0');
INSERT INTO `shop` VALUES ('18', 'le18', '铜川路高陵路十字路口', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h5gmci31v5e5fdqt13fr1uc2g.jpg', '甜果园水果卖场', '姚老板', '15952291867', '31.258969', '121.389159', 'wtw3f68bsqjm', '上海', '普陀区', '上海', '免费送货上门，货到付款，价格和实体店同步，支持首单立减10元活动。', '30', '1', '0', '0');
INSERT INTO `shop` VALUES ('19', 'aq19', '泾阳路370号', 'http://7u2out.com1.z0.glb.clouddn.com/o_19h8fjtncs579lrnqi1b8332p9.jpg', '王氏果业', '王老板', '18601713217', '31.24168', '121.366549', 'wtw39z27vx60', '上海', '普陀区', '上海', '精品水果，味美鲜甜。价格和实体店同步，支持首单立减10元活动。', '30', '0', '0', '0');
INSERT INTO `shop` VALUES ('29', 'fd29', '上海', '', '测试', '带隙', '15502187076', '31.248668', '121.469502', 'wtw3u0ekstcm', '上海', '上海', '上海', '你好', '20', '1', '1', '10');

-- ----------------------------
-- Table structure for `user`
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('40', '', 'DX', '', '', '1', '长宁', '上海', '中国', '2015-04-16 21:25:46', 'oeRy5s_WYCNDwfjpP7rmGhNpsMHE', 'http://wx.qlogo.cn/mmopen/V52btXJKaLPiaZAwItXlp8cKFVhBAQ2Xldz7u0KJKy102A735URM5EVL1bYwzjwoZgfAZV91HeL3S9DwtDmv0hibntUL4Ndw2e/0', '1', '15');
INSERT INTO `user` VALUES ('41', '', 'DX', '', '', '1', '长宁', '上海', '中国', '2015-03-29 23:16:46', 'oeRy5s_WYCNDwfjpP7rmGhNpsMHE', 'http://wx.qlogo.cn/mmopen/V52btXJKaLPiaZAwItXlp8cKFVhBAQ2Xldz7u0KJKy102A735URM5EVL1bYwzjwoZgfAZV91HeL3S9DwtDmv0hibntUL4Ndw2e/0', '0', '0');

-- ----------------------------
-- Table structure for `weixinshop`
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
-- Records of weixinshop
-- ----------------------------
INSERT INTO `weixinshop` VALUES ('wx17a8c83f5b2f6540', '432fb4827de4de9c2038ebcd2c5f064a', '2i_q2L1b8kmtzbwB4hQ09CzHNKAj9ZV81DSboZyOQfFcnhMm9WL_3lxMIU7DIg3vM1oWCzZJ9-6p1y4hqKbzxP2jOyFeJu4WiZWB04cgBAA', '', '1428731624', 'wxshop');

-- ----------------------------
-- Table structure for `weixinuser`
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
-- Records of weixinuser
-- ----------------------------
INSERT INTO `weixinuser` VALUES ('wx17a029b44c383634', '0f0d1caf3e84edbf61fc28fecf0c74b9', 'kjfzfv5OB9Jc9_0qRge0OK_DDTTxAUJEH__dyBk3SaueNf_N-6vuNstlyw2wyYHoTELTnb_AdA23cW2CtBDkeJqhRY0hpzBpHVEn0WIpnzk', '', '1429198360', 'wxuser');

-- ----------------------------
-- Function structure for `GETDISTANCE`
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
-- Function structure for `NewProc`
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
