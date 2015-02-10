/*
Navicat MySQL Data Transfer

Source Server         : shuwo
Source Server Version : 50541
Source Host           : www.shuwow.com:3306
Source Database       : shuwo

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-02-10 23:16:40
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
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------
INSERT INTO `orderproduct` VALUES ('1', '2015020448529748', '1', '6', '1320', '14.52');
INSERT INTO `orderproduct` VALUES ('2', '2015020448529748', '2', '1', '180', '1.80');
INSERT INTO `orderproduct` VALUES ('3', '2015020454499953', '1', '4', '900', '9.90');
INSERT INTO `orderproduct` VALUES ('4', '2015020454499953', '2', '4', '4448', '44.48');
INSERT INTO `orderproduct` VALUES ('5', '2015020448985697', '4', '9', '0', '6.30');
INSERT INTO `orderproduct` VALUES ('6', '2015020448985697', '3', '12', '0', '4.32');
INSERT INTO `orderproduct` VALUES ('7', '2015020410250985', '4', '13', '0', '9.10');
INSERT INTO `orderproduct` VALUES ('8', '2015020410250985', '3', '3', '0', '1.08');
INSERT INTO `orderproduct` VALUES ('9', '2015020455559949', '2', '6', '861', '8.61');
INSERT INTO `orderproduct` VALUES ('10', '2015020455559949', '1', '4', '780', '8.58');
INSERT INTO `orderproduct` VALUES ('11', '2015020457499848', '4', '11', '0', '7.70');
INSERT INTO `orderproduct` VALUES ('12', '2015020457499848', '3', '19', '0', '6.84');
INSERT INTO `orderproduct` VALUES ('13', '2015020454100995', '4', '10', '0', '7.00');
INSERT INTO `orderproduct` VALUES ('14', '2015020454100995', '3', '9', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('15', '2015020497519897', '3', '30', '0', '10.80');
INSERT INTO `orderproduct` VALUES ('16', '2015020498101495', '3', '30', '0', '10.80');
INSERT INTO `orderproduct` VALUES ('17', '2015020452101545', '4', '15', '0', '10.50');
INSERT INTO `orderproduct` VALUES ('18', '2015020450549910', '4', '1', '0', '0.70');
INSERT INTO `orderproduct` VALUES ('19', '2015020450549910', '3', '30', '0', '10.80');
INSERT INTO `orderproduct` VALUES ('20', '2015020451971025', '3', '29', '0', '10.44');
INSERT INTO `orderproduct` VALUES ('21', '2015020499505210', '3', '9', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('22', '2015020499505210', '4', '20', '0', '14.00');
INSERT INTO `orderproduct` VALUES ('23', '2015020410056975', '3', '28', '0', '10.08');
INSERT INTO `orderproduct` VALUES ('24', '2015020499579799', '1', '8', '5', '0.06');
INSERT INTO `orderproduct` VALUES ('25', '2015020499579799', '2', '1', '2', '0.02');
INSERT INTO `orderproduct` VALUES ('26', '2015020510051975', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('27', '2015020510051975', '14', '5', '0', '24.64');
INSERT INTO `orderproduct` VALUES ('28', '2015020557485754', '16', '5', '0', '18.72');
INSERT INTO `orderproduct` VALUES ('29', '2015020557485754', '20', '3', '0', '7.92');
INSERT INTO `orderproduct` VALUES ('30', '2015020557485754', '23', '1', '0', '2.58');
INSERT INTO `orderproduct` VALUES ('31', '2015020557485754', '22', '1', '0', '2.70');
INSERT INTO `orderproduct` VALUES ('32', '2015020549995510', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('33', '2015020549995510', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('34', '2015020549995510', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('35', '2015020549995510', '16', '1', '0', '3.74');
INSERT INTO `orderproduct` VALUES ('36', '2015020510150535', '13', '5', '0', '41.30');
INSERT INTO `orderproduct` VALUES ('37', '2015020510150535', '14', '4', '0', '19.71');
INSERT INTO `orderproduct` VALUES ('38', '2015020510150535', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('39', '2015020597100494', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('40', '2015020597100494', '14', '4', '0', '19.71');
INSERT INTO `orderproduct` VALUES ('41', '2015020597100494', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('42', '2015020510255975', '13', '1', '22', '0.52');
INSERT INTO `orderproduct` VALUES ('43', '2015020510255975', '14', '1', '15', '0.26');
INSERT INTO `orderproduct` VALUES ('44', '2015020510255975', '15', '1', '14', '0.16');
INSERT INTO `orderproduct` VALUES ('45', '2015020510255975', '16', '4', '15', '0.23');
INSERT INTO `orderproduct` VALUES ('46', '2015020598525051', '13', '5', '0', '41.30');
INSERT INTO `orderproduct` VALUES ('47', '2015020598525051', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('48', '2015020598525051', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('49', '2015020598525051', '16', '1', '0', '3.74');
INSERT INTO `orderproduct` VALUES ('50', '2015020550100575', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('51', '2015020550100575', '14', '3', '0', '14.78');
INSERT INTO `orderproduct` VALUES ('52', '2015020554525350', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('53', '2015020554525350', '14', '3', '0', '14.78');
INSERT INTO `orderproduct` VALUES ('54', '2015020510156544', '14', '3', '0', '14.78');
INSERT INTO `orderproduct` VALUES ('55', '2015020510156544', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('56', '2015020597975097', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('57', '2015020597975097', '14', '3', '0', '14.78');
INSERT INTO `orderproduct` VALUES ('58', '2015020548101571', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('59', '2015020548101571', '14', '3', '0', '14.78');
INSERT INTO `orderproduct` VALUES ('60', '2015020553525210', '14', '3', '0', '14.78');
INSERT INTO `orderproduct` VALUES ('61', '2015020553525210', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('62', '2015020553525210', '17', '1', '0', '6.62');
INSERT INTO `orderproduct` VALUES ('63', '2015020553525210', '16', '1', '0', '3.74');
INSERT INTO `orderproduct` VALUES ('64', '2015020553525210', '18', '1', '0', '4.70');
INSERT INTO `orderproduct` VALUES ('65', '2015020553501009', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('66', '2015020553501009', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('67', '2015020553501009', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('68', '2015020553501009', '17', '1', '0', '6.62');
INSERT INTO `orderproduct` VALUES ('69', '2015020549102511', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('70', '2015020549102511', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('71', '2015020549102511', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('72', '2015020810153995', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('73', '2015020810153995', '16', '2', '0', '7.49');
INSERT INTO `orderproduct` VALUES ('74', '2015020810153995', '20', '2', '0', '5.28');
INSERT INTO `orderproduct` VALUES ('75', '2015020854521015', '17', '4', '0', '26.50');
INSERT INTO `orderproduct` VALUES ('76', '2015020854521015', '16', '2', '0', '7.49');
INSERT INTO `orderproduct` VALUES ('77', '2015020955544910', '19', '4', '0', '12.96');
INSERT INTO `orderproduct` VALUES ('78', '2015020955544910', '14', '4', '0', '19.71');
INSERT INTO `orderproduct` VALUES ('79', '2015020999534899', '13', '5', '1780', '42.01');
INSERT INTO `orderproduct` VALUES ('80', '2015021051511025', '13', '2', '0', '16.52');
INSERT INTO `orderproduct` VALUES ('81', '2015021051511025', '14', '3', '0', '14.78');
INSERT INTO `orderproduct` VALUES ('82', '2015021051511025', '15', '3', '0', '8.70');
INSERT INTO `orderproduct` VALUES ('83', '2015021048525350', '13', '2', '0', '16.52');
INSERT INTO `orderproduct` VALUES ('84', '2015021048525350', '14', '2', '0', '9.86');
INSERT INTO `orderproduct` VALUES ('85', '2015021048525350', '15', '2', '0', '5.80');
INSERT INTO `orderproduct` VALUES ('86', '2015021048525350', '16', '2', '0', '7.49');
INSERT INTO `orderproduct` VALUES ('87', '2015021057995653', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('88', '2015021057995653', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('89', '2015021057995653', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('90', '2015021057995653', '16', '1', '0', '3.74');
INSERT INTO `orderproduct` VALUES ('91', '2015021057995653', '17', '1', '0', '6.62');
INSERT INTO `orderproduct` VALUES ('92', '2015021057995653', '18', '1', '0', '4.70');
INSERT INTO `orderproduct` VALUES ('93', '2015021057995653', '19', '1', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('94', '2015021057495510', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('95', '2015021057495510', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('96', '2015021057495510', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('97', '2015021057495510', '16', '1', '0', '3.74');
INSERT INTO `orderproduct` VALUES ('98', '2015021057495510', '17', '1', '0', '6.62');
INSERT INTO `orderproduct` VALUES ('99', '2015021057495510', '18', '1', '0', '4.70');
INSERT INTO `orderproduct` VALUES ('100', '2015021054511009', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('101', '2015021054511009', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('102', '2015021054511009', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('103', '2015021054511009', '17', '1', '0', '6.62');
INSERT INTO `orderproduct` VALUES ('104', '2015021054511009', '16', '1', '0', '3.74');
INSERT INTO `orderproduct` VALUES ('105', '2015021054511009', '18', '1', '0', '4.70');
INSERT INTO `orderproduct` VALUES ('106', '2015021054511009', '19', '1', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('107', '2015021054511009', '20', '1', '0', '2.64');
INSERT INTO `orderproduct` VALUES ('108', '2015021054511009', '21', '1', '0', '3.71');
INSERT INTO `orderproduct` VALUES ('109', '2015021054511009', '22', '1', '0', '2.70');
INSERT INTO `orderproduct` VALUES ('110', '2015021098994854', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('111', '2015021098994854', '14', '3', '0', '14.78');
INSERT INTO `orderproduct` VALUES ('112', '2015021098994854', '15', '4', '0', '11.60');
INSERT INTO `orderproduct` VALUES ('113', '2015021098994854', '19', '3', '0', '9.72');
INSERT INTO `orderproduct` VALUES ('114', '2015021098994854', '20', '1', '0', '2.64');
INSERT INTO `orderproduct` VALUES ('115', '2015021098994854', '21', '1', '0', '3.71');
INSERT INTO `orderproduct` VALUES ('116', '2015021098994854', '18', '1', '0', '4.70');
INSERT INTO `orderproduct` VALUES ('117', '2015021098994854', '16', '1', '0', '3.74');
INSERT INTO `orderproduct` VALUES ('118', '2015021098994854', '17', '1', '0', '6.62');
INSERT INTO `orderproduct` VALUES ('119', '2015021056525253', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('120', '2015021056525253', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('121', '2015021056525253', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('122', '2015021056525253', '17', '1', '0', '6.62');
INSERT INTO `orderproduct` VALUES ('123', '2015021056525253', '16', '1', '0', '3.74');
INSERT INTO `orderproduct` VALUES ('124', '2015021056525253', '18', '1', '0', '4.70');
INSERT INTO `orderproduct` VALUES ('125', '2015021056525253', '19', '1', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('126', '2015021056525253', '21', '1', '0', '3.71');
INSERT INTO `orderproduct` VALUES ('127', '2015021056525253', '20', '1', '0', '2.64');
INSERT INTO `orderproduct` VALUES ('128', '2015021056525253', '22', '1', '0', '2.70');
INSERT INTO `orderproduct` VALUES ('129', '2015021056525253', '23', '1', '0', '2.58');
INSERT INTO `orderproduct` VALUES ('130', '2015021056525253', '24', '1', '0', '1.39');
INSERT INTO `orderproduct` VALUES ('131', '2015021099101491', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('132', '2015021099101491', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('133', '2015021099101491', '15', '1', '0', '2.90');
INSERT INTO `orderproduct` VALUES ('134', '2015021099101491', '16', '1', '0', '3.74');
INSERT INTO `orderproduct` VALUES ('135', '2015021099101491', '17', '1', '0', '6.62');
INSERT INTO `orderproduct` VALUES ('136', '2015021099101491', '18', '1', '0', '4.70');
INSERT INTO `orderproduct` VALUES ('137', '2015021099101491', '19', '1', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('138', '2015021099101491', '20', '1', '0', '2.64');
INSERT INTO `orderproduct` VALUES ('139', '2015021099101491', '21', '1', '0', '3.71');
INSERT INTO `orderproduct` VALUES ('140', '2015021099489898', '13', '1', '5', '0.12');
INSERT INTO `orderproduct` VALUES ('141', '2015021099489898', '14', '1', '5', '0.09');
INSERT INTO `orderproduct` VALUES ('142', '2015021099489898', '15', '1', '5', '0.06');
INSERT INTO `orderproduct` VALUES ('143', '2015021099489898', '16', '1', '5', '0.08');
INSERT INTO `orderproduct` VALUES ('144', '2015021099489898', '17', '1', '5', '0.14');
INSERT INTO `orderproduct` VALUES ('145', '2015021099489898', '18', '1', '5', '0.10');
INSERT INTO `orderproduct` VALUES ('146', '2015021099489898', '19', '1', '5', '0.11');
INSERT INTO `orderproduct` VALUES ('147', '2015021099489898', '20', '1', '5', '0.09');
INSERT INTO `orderproduct` VALUES ('148', '2015021099489898', '21', '1', '5', '0.06');
INSERT INTO `orderproduct` VALUES ('149', '2015021054499952', '13', '3', '25', '0.59');
INSERT INTO `orderproduct` VALUES ('150', '2015021054499952', '14', '2', '23', '0.40');
INSERT INTO `orderproduct` VALUES ('151', '2015021098981025', '13', '5', '0', '41.30');
INSERT INTO `orderproduct` VALUES ('152', '2015021098981025', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('153', '2015021051971021', '13', '4', '0', '33.04');
INSERT INTO `orderproduct` VALUES ('154', '2015021055561011', '13', '5', '0', '41.30');
INSERT INTO `orderproduct` VALUES ('155', '2015021097101545', '13', '4', '1550', '36.58');
INSERT INTO `orderproduct` VALUES ('156', '2015021010198575', '13', '6', '4224', '99.69');
INSERT INTO `orderproduct` VALUES ('157', '2015021097561019', '14', '7', '1980', '34.85');
INSERT INTO `orderproduct` VALUES ('158', '2015021053545456', '13', '4', '1500', '35.40');
INSERT INTO `orderproduct` VALUES ('159', '2015021053545456', '19', '1', '150', '3.24');
INSERT INTO `orderproduct` VALUES ('160', '2015021053545456', '14', '1', '260', '4.58');
INSERT INTO `orderproduct` VALUES ('161', '2015021053545456', '21', '1', '320', '3.71');
INSERT INTO `orderproduct` VALUES ('162', '2015021053545456', '22', '1', '300', '2.70');
INSERT INTO `orderproduct` VALUES ('163', '2015021053545456', '20', '1', '158', '2.78');
INSERT INTO `orderproduct` VALUES ('164', '2015021051545755', '4', '12', '0', '8.40');
INSERT INTO `orderproduct` VALUES ('165', '2015021051545755', '3', '13', '0', '4.68');
INSERT INTO `orderproduct` VALUES ('166', '2015021097999956', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('167', '2015021097999956', '19', '1', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('168', '2015021097999956', '20', '1', '0', '2.64');
INSERT INTO `orderproduct` VALUES ('169', '2015021097999956', '21', '1', '0', '3.71');
INSERT INTO `orderproduct` VALUES ('170', '2015021097999956', '22', '1', '0', '2.70');
INSERT INTO `orderproduct` VALUES ('171', '2015021097999956', '23', '1', '0', '2.58');
INSERT INTO `orderproduct` VALUES ('172', '2015021097999956', '24', '1', '0', '1.39');
INSERT INTO `orderproduct` VALUES ('173', '2015021097999956', '25', '1', '0', '1.96');
INSERT INTO `orderproduct` VALUES ('174', '2015021097999956', '27', '1', '0', '4.40');
INSERT INTO `orderproduct` VALUES ('175', '2015021097999956', '28', '1', '0', '3.40');
INSERT INTO `orderproduct` VALUES ('176', '2015021054515797', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('177', '2015021054515797', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('178', '2015021054515797', '19', '1', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('179', '2015021054515797', '22', '1', '0', '2.70');
INSERT INTO `orderproduct` VALUES ('180', '2015021054515797', '21', '1', '0', '3.71');
INSERT INTO `orderproduct` VALUES ('181', '2015021054515797', '20', '1', '0', '2.64');
INSERT INTO `orderproduct` VALUES ('182', '2015021054515797', '44', '1', '0', '4.50');
INSERT INTO `orderproduct` VALUES ('183', '2015021054515797', '45', '1', '0', '6.90');
INSERT INTO `orderproduct` VALUES ('184', '2015021054515797', '46', '1', '0', '39.60');
INSERT INTO `orderproduct` VALUES ('185', '2015021054515797', '49', '1', '0', '4.40');
INSERT INTO `orderproduct` VALUES ('186', '2015021054515797', '48', '1', '0', '16.00');
INSERT INTO `orderproduct` VALUES ('187', '2015021054515797', '47', '1', '0', '27.84');
INSERT INTO `orderproduct` VALUES ('188', '2015021057575610', '13', '3', '0', '24.78');
INSERT INTO `orderproduct` VALUES ('189', '2015021057575610', '14', '2', '0', '9.86');
INSERT INTO `orderproduct` VALUES ('190', '2015021010152509', '14', '1', '0', '4.93');
INSERT INTO `orderproduct` VALUES ('191', '2015021010152509', '13', '1', '0', '8.26');
INSERT INTO `orderproduct` VALUES ('192', '2015021010152509', '20', '1', '0', '2.64');
INSERT INTO `orderproduct` VALUES ('193', '2015021010152509', '21', '1', '0', '3.71');
INSERT INTO `orderproduct` VALUES ('194', '2015021010152509', '19', '1', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('195', '2015021010152509', '22', '1', '0', '2.70');
INSERT INTO `orderproduct` VALUES ('196', '2015021010152509', '23', '1', '0', '2.58');
INSERT INTO `orderproduct` VALUES ('197', '2015021010152509', '24', '1', '0', '1.39');
INSERT INTO `orderproduct` VALUES ('198', '2015021010152509', '25', '1', '0', '1.96');
INSERT INTO `orderproduct` VALUES ('199', '2015021010152509', '28', '1', '0', '3.40');
INSERT INTO `orderproduct` VALUES ('200', '2015021010152509', '27', '1', '0', '4.40');
INSERT INTO `orderproduct` VALUES ('201', '2015021010152509', '26', '1', '0', '1.56');
INSERT INTO `orderproduct` VALUES ('202', '2015021099101545', '14', '1', '280', '4.93');
INSERT INTO `orderproduct` VALUES ('203', '2015021099101545', '19', '1', '140', '3.02');
INSERT INTO `orderproduct` VALUES ('204', '2015021099101545', '20', '1', '150', '2.64');
INSERT INTO `orderproduct` VALUES ('205', '2015021099101545', '21', '1', '330', '3.83');
INSERT INTO `orderproduct` VALUES ('206', '2015021099101545', '22', '1', '300', '2.70');
INSERT INTO `orderproduct` VALUES ('207', '2015021099101545', '13', '1', '350', '8.26');
INSERT INTO `orderproduct` VALUES ('208', '2015021099101545', '36', '1', '200', '1.71');
INSERT INTO `orderproduct` VALUES ('209', '2015021099101545', '33', '1', '250', '4.90');
INSERT INTO `orderproduct` VALUES ('210', '2015021099101545', '34', '1', '250', '3.90');
INSERT INTO `orderproduct` VALUES ('211', '2015021099101545', '37', '1', '1', '3.33');
INSERT INTO `orderproduct` VALUES ('212', '2015021099101545', '40', '1', '760', '20.98');
INSERT INTO `orderproduct` VALUES ('213', '2015021099101545', '39', '1', '340', '5.98');
INSERT INTO `orderproduct` VALUES ('214', '2015021099101545', '38', '1', '135', '2.92');
INSERT INTO `orderproduct` VALUES ('215', '2015021053979756', '13', '4', '1400', '33.04');
INSERT INTO `orderproduct` VALUES ('216', '2015021053979756', '14', '1', '290', '5.10');
INSERT INTO `orderproduct` VALUES ('217', '2015021097505650', '14', '7', '0', '34.50');
INSERT INTO `orderproduct` VALUES ('218', '2015021097505650', '19', '1', '0', '3.24');
INSERT INTO `orderproduct` VALUES ('219', '2015021051525498', '19', '11', '1600', '34.56');
INSERT INTO `orderproduct` VALUES ('220', '2015021010157579', '13', '4', '0', '33.04');
INSERT INTO `orderproduct` VALUES ('221', '2015021010253565', '13', '2', '0', '16.52');
INSERT INTO `orderproduct` VALUES ('222', '2015021010253565', '14', '2', '0', '9.86');
INSERT INTO `orderproduct` VALUES ('223', '2015021010253565', '19', '2', '0', '6.48');
INSERT INTO `orderproduct` VALUES ('224', '2015021010253565', '22', '2', '0', '5.40');
INSERT INTO `orderproduct` VALUES ('225', '2015021010253565', '21', '2', '0', '7.42');
INSERT INTO `orderproduct` VALUES ('226', '2015021010253565', '20', '2', '0', '5.28');
INSERT INTO `orderproduct` VALUES ('227', '2015021054101100', '13', '4', '0', '33.04');
INSERT INTO `orderproduct` VALUES ('228', '2015021010110152', '13', '5', '0', '41.30');
INSERT INTO `orderproduct` VALUES ('229', '2015021052101999', '2', '9', '0', '13.50');
INSERT INTO `orderproduct` VALUES ('230', '2015021052101999', '1', '1', '0', '2.20');
INSERT INTO `orderproduct` VALUES ('231', '2015021050535555', '14', '7', '0', '34.50');
INSERT INTO `orderproduct` VALUES ('232', '2015021048495750', '14', '7', '0', '34.50');
INSERT INTO `orderproduct` VALUES ('233', '2015021097559753', '14', '7', '0', '34.50');
INSERT INTO `orderproduct` VALUES ('234', '2015021097571029', '13', '5', '0', '41.30');
INSERT INTO `orderproduct` VALUES ('235', '2015021097571029', '14', '8', '0', '39.42');
INSERT INTO `orderproduct` VALUES ('236', '2015021053975250', '14', '7', '0', '34.50');
INSERT INTO `orderproduct` VALUES ('237', '2015021055569950', '14', '7', '0', '34.50');
INSERT INTO `orderproduct` VALUES ('238', '2015021053549750', '14', '9', '0', '44.35');
INSERT INTO `orderproduct` VALUES ('239', '2015021010253102', '14', '7', '0', '34.50');
INSERT INTO `orderproduct` VALUES ('240', '2015021010156554', '4', '17', '0', '11.90');
INSERT INTO `orderproduct` VALUES ('241', '2015021010156554', '3', '1', '0', '0.36');
INSERT INTO `orderproduct` VALUES ('242', '2015021099505454', '2', '8', '0', '12.00');
INSERT INTO `orderproduct` VALUES ('243', '2015021099505454', '1', '1', '0', '2.20');

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
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('2015020410056975', '0', '1', '2', '0', '10.08', '测试地址啊啊啊啊啊', '13524712918', '2015-02-07 21:27:09', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020410250985', '0', '1', '2', '0', '10.18', '测试地址啊啊啊啊啊', '13524712918', '2015-02-07 21:09:51', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020448529748', '1', '1', '1', '0', '14.70', '测试地址啊啊啊啊啊', '13524712918', '2015-02-07 20:58:40', '16.32', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020448985697', '0', '1', '2', '0', '10.62', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:07:28', '0.00', '立即送出', '加油～～', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020450549910', '0', '1', '2', '0', '11.50', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:25:06', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020451971025', '0', '1', '2', '0', '10.44', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:26:27', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020452101545', '0', '1', '2', '0', '10.50', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:20:04', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020454100995', '0', '1', '2', '0', '10.24', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:14:46', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020454499953', '1', '1', '1', '0', '14.80', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:00:06', '54.38', '立即送出', '加油～～', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020455559949', '1', '1', '1', '0', '17.80', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:13:59', '17.19', '16:00-18:00', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020457499848', '0', '1', '2', '0', '14.54', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:14:01', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020497519897', '0', '1', '2', '0', '10.80', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:15:22', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020498101495', '0', '1', '2', '0', '10.80', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:18:19', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020499505210', '0', '1', '2', '0', '17.24', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:27:08', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020499579799', '1', '1', '1', '0', '19.10', '测试地址啊啊啊啊啊', '13524712918', '2015-02-04 21:30:04', '0.08', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020510051975', '0', '4', '12', '0', '32.90', '南翔商务中心705', '13524712918', '2015-02-07 15:21:17', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020510097501', '0', '1', '0', '0', '0.00', '测试地址啊啊啊啊啊', '13524712918', '2015-02-05 19:39:09', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020510150535', '0', '1', '12', '0', '63.91', '测试地址啊啊啊啊啊', '13524712918', '2015-02-07 19:35:10', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020510156544', '0', '4', '12', '0', '39.56', '南翔商务中心705', '13524712918', '2015-02-07 19:41:34', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020510255975', '1', '1', '12', '0', '31.06', '测试地址啊啊啊啊啊', '13524712918', '2015-03-07 19:38:55', '1.18', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020548101571', '0', '4', '12', '0', '39.56', '南翔商务中心705', '13524712918', '2015-02-05 19:48:32', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020549102511', '0', '7', '12', '0', '32.61', '～', '18696168286', '2015-02-05 21:53:05', '0.00', '立即送出', '', '刘志方', '');
INSERT INTO `orders` VALUES ('2015020549995510', '0', '1', '12', '0', '36.35', '测试地址啊啊啊啊啊', '13524712918', '2015-02-07 19:33:37', '0.00', '10:00-12:00', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020550100575', '0', '1', '12', '0', '39.56', '测试地址啊啊啊啊啊', '13524712918', '2015-02-05 19:40:34', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020553501009', '0', '1', '12', '0', '39.23', '测试地址啊啊啊啊啊', '13524712918', '2015-02-07 20:17:57', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020553525210', '0', '1', '12', '0', '32.76', '测试地址啊啊啊啊啊', '13524712918', '2015-02-05 19:51:17', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020554525350', '0', '4', '12', '0', '39.56', '南翔商务中心705', '13524712918', '2015-02-05 19:41:26', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020555575552', '0', '1', '0', '0', '0.00', '测试地址啊啊啊啊啊', '13524712918', '2015-02-05 19:33:59', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020557485754', '0', '1', '12', '0', '31.92', '测试地址啊啊啊啊啊', '13524712918', '2015-02-05 15:27:05', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020597100494', '0', '1', '12', '0', '30.87', '测试地址啊啊啊啊啊', '13524712918', '2015-02-05 19:38:18', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020597975097', '0', '1', '12', '0', '39.56', '测试地址啊啊啊啊啊', '13524712918', '2015-02-05 19:47:22', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020597979910', '0', '1', '0', '0', '0.00', '测试地址啊啊啊啊啊', '13524712918', '2015-02-05 19:34:18', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020598525051', '0', '15', '12', '0', '52.87', '测试地址啊啊啊啊啊', '13524712918', '2015-02-05 19:39:39', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020599974810', '0', '1', '0', '0', '0.00', '测试地址啊啊啊啊啊', '13524712918', '2015-02-07 19:41:00', '0.00', '立即送出', '', '侯西阳', '');
INSERT INTO `orders` VALUES ('2015020810153995', '0', '21', '12', '0', '37.55', '南翔商务中心', '13917638125', '2015-02-08 10:34:22', '0.00', '10:00-12:00', '挑好一些的', '任旺', '');
INSERT INTO `orders` VALUES ('2015020854521015', '2', '21', '12', '0', '33.98', '南翔商务中心', '13917638125', '2015-02-08 18:07:18', '0.00', '12:00-14:00', '', '任旺', '其他');
INSERT INTO `orders` VALUES ('2015020955544910', '0', '21', '12', '0', '32.67', '南翔商务中心', '13917638125', '2015-02-09 17:40:39', '0.00', '立即送出', '', '任旺', '');
INSERT INTO `orders` VALUES ('2015020999534899', '1', '19', '12', '0', '41.30', 'a ba b na ba', '15502187076', '2015-02-09 19:07:40', '42.01', '立即送出', '', 'sjsjs', '');
INSERT INTO `orders` VALUES ('2015021010110152', '0', '35', '12', '0', '41.30', '南翔商务', '15821691728', '2015-02-10 22:49:02', '0.00', '立即送出', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021010152485', '0', '35', '0', '0', '0.00', null, '', '2015-02-10 22:49:34', '0.00', '', '', '', '');
INSERT INTO `orders` VALUES ('2015021010152509', '0', '35', '12', '0', '40.76', '南翔商务', '15821691728', '2015-02-10 22:38:38', '0.00', '立即送出', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021010156554', '0', '37', '2', '0', '12.26', '你哈皮', '15502187076', '2015-02-10 23:14:54', '0.00', '立即送出', '', '戴显示', '');
INSERT INTO `orders` VALUES ('2015021010157579', '0', '21', '12', '0', '33.04', '南翔商务中心', '13917638125', '2015-02-10 22:45:50', '0.00', '立即送出', '', '任旺', '');
INSERT INTO `orders` VALUES ('2015021010198575', '1', '23', '12', '0', '49.56', '中冶翔疼6楼607', '13918210924', '2015-02-10 21:34:38', '99.69', '18:00-20:00', '', '李玉龙', '');
INSERT INTO `orders` VALUES ('2015021010253102', '0', '37', '12', '0', '34.50', '你哈皮', '15502187076', '2015-02-10 23:05:51', '0.00', '立即送出', '', '戴显示', '');
INSERT INTO `orders` VALUES ('2015021010253565', '0', '35', '12', '0', '50.96', '南翔商务', '15821691728', '2015-02-10 22:46:23', '0.00', '14:00-16:00', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021048495750', '0', '35', '12', '0', '34.50', '南翔商务', '15821691728', '2015-02-10 22:58:24', '0.00', '12:00-14:00', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021048525350', '0', '19', '12', '0', '39.66', 'a ba b na ba', '15502187076', '2015-02-10 16:39:12', '0.00', '立即送出', '', 'sjsjs', '');
INSERT INTO `orders` VALUES ('2015021050535555', '0', '35', '12', '0', '34.50', '南翔商务', '15821691728', '2015-02-10 22:51:46', '0.00', '12:00-14:00', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021051511025', '0', '19', '12', '0', '40.00', 'a ba b na ba', '15502187076', '2015-02-10 16:34:27', '0.00', '立即送出', '', 'sjsjs', '');
INSERT INTO `orders` VALUES ('2015021051525498', '1', '21', '12', '0', '35.64', '南翔商务中心', '13917638125', '2015-02-10 22:44:03', '34.56', '立即送出', '', '任旺', '');
INSERT INTO `orders` VALUES ('2015021051545755', '0', '7', '2', '0', '13.08', '威廉公馆', '18696168286', '2015-02-10 22:33:07', '0.00', '8:00-10:00', '', '刘志方', '');
INSERT INTO `orders` VALUES ('2015021051971021', '0', '23', '12', '0', '33.04', '中冶翔疼6楼607', '13918210924', '2015-02-10 21:31:47', '0.00', '18:00-20:00', '', '李玉龙', '');
INSERT INTO `orders` VALUES ('2015021052101999', '0', '7', '1', '0', '15.70', '威廉公馆', '18696168286', '2015-02-10 22:51:16', '0.00', '立即送出', '我要', '刘志方', '');
INSERT INTO `orders` VALUES ('2015021053545456', '1', '35', '12', '0', '50.26', '南翔商务', '15821691728', '2015-02-10 22:29:09', '52.41', '14:00-16:00', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021053549750', '0', '35', '12', '0', '44.35', '南翔商务', '15821691728', '2015-02-10 23:03:01', '0.00', '立即送出', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021053975250', '0', '35', '12', '0', '34.50', '南翔商务', '15821691728', '2015-02-10 23:00:37', '0.00', '立即送出', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021053979756', '1', '21', '12', '0', '37.97', '南翔商务中心', '13917638125', '2015-02-10 22:40:53', '38.14', '立即送出', '', '任旺', '');
INSERT INTO `orders` VALUES ('2015021054101100', '0', '21', '12', '0', '33.04', '南翔商务中心', '13917638125', '2015-02-10 22:48:54', '0.00', '立即送出', '', '任旺', '');
INSERT INTO `orders` VALUES ('2015021054499952', '1', '21', '12', '0', '34.64', '南翔商务中心', '13917638125', '2015-02-10 21:07:18', '0.99', '立即送出', '', '任旺', '');
INSERT INTO `orders` VALUES ('2015021054511009', '0', '19', '12', '0', '43.45', '金地格林世界', '15502187076', '2015-02-10 16:49:26', '0.00', '立即送出', '', '戴先生', '');
INSERT INTO `orders` VALUES ('2015021054515797', '0', '35', '12', '0', '124.72', '南翔商务', '15821691728', '2015-02-10 22:35:02', '0.00', '14:00-16:00', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021055561011', '0', '23', '12', '0', '41.30', '中冶翔疼6楼607', '13918210924', '2015-02-10 21:33:59', '0.00', '立即送出', '', '李玉龙', '');
INSERT INTO `orders` VALUES ('2015021055569950', '0', '35', '12', '0', '34.50', '南翔商务', '15821691728', '2015-02-10 23:01:43', '0.00', '立即送出', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021056525253', '0', '19', '12', '0', '47.41', '金地格林世界', '15502187076', '2015-02-10 16:58:32', '0.00', '立即送出', '', '戴先生', '');
INSERT INTO `orders` VALUES ('2015021057495510', '0', '19', '12', '0', '31.16', '金地格林世界', '15502187076', '2015-02-10 16:44:57', '0.00', '立即送出', '', '戴先生', '');
INSERT INTO `orders` VALUES ('2015021057575610', '0', '21', '12', '0', '34.64', '南翔商务中心', '13917638125', '2015-02-10 22:35:21', '0.00', '14:00-16:00', '', '任旺', '');
INSERT INTO `orders` VALUES ('2015021057995653', '0', '19', '12', '0', '34.40', '金地格林世界', '15502187076', '2015-02-10 16:43:05', '0.00', '立即送出', '', '戴先生', '');
INSERT INTO `orders` VALUES ('2015021097101545', '1', '23', '12', '0', '33.04', '中冶翔疼6楼607', '13918210924', '2015-02-10 21:34:18', '36.58', '18:00-20:00', '', '李玉龙', '');
INSERT INTO `orders` VALUES ('2015021097505650', '0', '35', '12', '0', '37.74', '南翔商务', '15821691728', '2015-02-10 22:43:38', '0.00', '12:00-14:00', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021097559753', '0', '35', '12', '0', '34.50', '南翔商务', '15821691728', '2015-02-10 22:59:06', '0.00', '12:00-14:00', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021097561019', '1', '23', '12', '0', '34.50', '中冶翔疼6楼607', '13918210924', '2015-02-10 21:36:58', '34.85', '立即送出', '', '李玉龙', '');
INSERT INTO `orders` VALUES ('2015021097571029', '0', '35', '12', '0', '80.72', '南翔商务', '15821691728', '2015-02-10 22:59:54', '0.00', '立即送出', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021097999956', '0', '7', '12', '0', '34.27', '威廉公馆', '18696168286', '2015-02-10 22:34:50', '0.00', '立即送出', '', '刘志方', '');
INSERT INTO `orders` VALUES ('2015021098981025', '0', '23', '12', '0', '46.23', '中冶翔疼6楼607', '13918210924', '2015-02-10 21:21:15', '0.00', '立即送出', '', '李玉龙', '');
INSERT INTO `orders` VALUES ('2015021098994854', '0', '19', '12', '0', '82.31', '金地格林世界', '15502187076', '2015-02-10 16:53:47', '0.00', '立即送出', '', '戴先生', '');
INSERT INTO `orders` VALUES ('2015021099101491', '0', '19', '12', '0', '40.75', '金地格林世界', '15502187076', '2015-02-10 17:41:32', '0.00', '12:00-14:00', '', '戴先生', '');
INSERT INTO `orders` VALUES ('2015021099101545', '1', '35', '12', '0', '68.99', '南翔商务', '15821691728', '2015-02-10 22:40:44', '69.10', '12:00-14:00', '', '王立', '');
INSERT INTO `orders` VALUES ('2015021099489898', '1', '19', '12', '0', '40.75', '金地格林世界', '15502187076', '2015-02-10 21:05:32', '0.83', '立即送出', '', '戴先生', '');
INSERT INTO `orders` VALUES ('2015021099505454', '2', '37', '1', '0', '14.20', '你哈皮', '15502187076', '2015-02-10 23:15:24', '0.00', '立即送出', '', '戴显示', '信息有误');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '陕西红富士（大）', '', '1', '100', '5.80', '5.50', '1', '1', '个', '200', '1');
INSERT INTO `product` VALUES ('2', '秦冠苹果\r\n\r\n', '', '1', '256', '5.20', '5.00', '1', '1', '个', '150', '1');
INSERT INTO `product` VALUES ('3', '青苹果', '', '1', '198', '1.50', '1.20', '1', '1', '斤', '150', '2');
INSERT INTO `product` VALUES ('4', '嘎啦果', '', '1', '519', '2.50', '2.00', '1', '1', '斤', '175', '2');
INSERT INTO `product` VALUES ('5', '黄金帅苹果 ', '', '1', '520', '5.80', '5.20', '1', '1', '个', '164', '3');
INSERT INTO `product` VALUES ('6', '雪梨', '', '1', '624', '2.80', '2.50', '1', '1', '个', '200', '4');
INSERT INTO `product` VALUES ('7', '蜜梨（皇冠梨）', '', '1', '629', '2.00', '0.00', '1', '1', '个', '200', '4');
INSERT INTO `product` VALUES ('8', '水晶梨1', '', '1', '263', '2.00', '0.00', '1', '1', '个', '182', '4');
INSERT INTO `product` VALUES ('9', '芦柑', '', '1', '851', '5.80', '5.50', '4', '4', '根', '0', '3');
INSERT INTO `product` VALUES ('10', '海南菠萝', '', '0', '562', '2.50', '0.00', '1', '6', '个', '700', '5');
INSERT INTO `product` VALUES ('11', '台湾橄榄', '', '1', '8555', '15.00', '0.00', '3', '6', '盒', '0', '5');
INSERT INTO `product` VALUES ('12', '砂糖桔', '', '1', '7415', '6.80', '6.20', '2', '6', '克', '50', '5');
INSERT INTO `product` VALUES ('13', '新疆阿克苏', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dmqmovsdgf1jvg1c33113t3sb9.jpg', '1', '0', '11.80', '11.80', '1', '1', '斤', '350', '12');
INSERT INTO `product` VALUES ('14', '洛川红富士（拉丝）', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dmqo56d1f5te2l7ulcja128al.jpg', '1', '0', '8.80', '8.80', '1', '1', '斤', '280', '12');
INSERT INTO `product` VALUES ('15', '陕西红富士', '', '0', '0', '5.80', '5.80', '1', '1', '斤', '250', '12');
INSERT INTO `product` VALUES ('16', '黄蕉苹果', '', '0', '0', '7.80', '7.80', '1', '1', '斤', '240', '12');
INSERT INTO `product` VALUES ('17', '红蛇果（进口）', '', '0', '0', '13.80', '13.80', '1', '1', '斤', '240', '12');
INSERT INTO `product` VALUES ('18', '红蛇果（国产）', '', '0', '0', '9.80', '9.80', '1', '1', '斤', '240', '12');
INSERT INTO `product` VALUES ('19', '库尔勒香梨', '', '1', '0', '10.80', '10.80', '1', '2', '斤', '150', '12');
INSERT INTO `product` VALUES ('20', '香梨王', '', '1', '0', '8.80', '8.80', '1', '2', '斤', '150', '12');
INSERT INTO `product` VALUES ('21', '天山雪梨', '', '1', '0', '5.80', '5.80', '1', '2', '斤', '320', '12');
INSERT INTO `product` VALUES ('22', '天津鸭梨', '', '1', '0', '4.50', '4.50', '1', '1', '斤', '300', '12');
INSERT INTO `product` VALUES ('23', '砀山梨（大）', '', '1', '0', '2.80', '2.80', '1', '2', '斤', '460', '12');
INSERT INTO `product` VALUES ('24', '砀山梨（小）', '', '1', '0', '1.98', '1.98', '1', '2', '斤', '350', '12');
INSERT INTO `product` VALUES ('25', '皇帝贡柑', '', '1', '0', '9.80', '9.80', '1', '4', '', '100', '12');
INSERT INTO `product` VALUES ('26', '帝皇贡柑', '', '1', '0', '7.80', '7.80', '1', '4', '斤', '100', '12');
INSERT INTO `product` VALUES ('27', '砂糖桔（精品）', '', '1', '0', '8.80', '8.80', '2', '4', '斤', '0', '12');
INSERT INTO `product` VALUES ('28', '砂糖桔（促销）', '', '1', '0', '6.80', '6.80', '2', '4', '斤', '0', '12');
INSERT INTO `product` VALUES ('29', '芦柑（大）', '', '1', '0', '5.80', '5.80', '1', '4', '斤', '150', '12');
INSERT INTO `product` VALUES ('30', '蜜柚（红心）', '', '1', '0', '6.80', '6.80', '1', '4', '斤', '1350', '12');
INSERT INTO `product` VALUES ('31', '蜜柚（白心）', '', '1', '0', '3.33', '3.33', '1', '4', '斤', '1350', '12');
INSERT INTO `product` VALUES ('32', '美国西柚', '', '1', '0', '11.80', '11.80', '1', '4', '斤', '400', '12');
INSERT INTO `product` VALUES ('33', '桂林金桔（大）', '', '1', '0', '9.80', '9.80', '2', '4', '斤', '0', '12');
INSERT INTO `product` VALUES ('34', '桂林金桔（小）', '', '1', '0', '7.80', '7.80', '2', '4', '斤', '0', '12');
INSERT INTO `product` VALUES ('35', '精品脐橙', '', '1', '0', '5.80', '5.80', '1', '4', '斤', '210', '12');
INSERT INTO `product` VALUES ('36', '江西赣南橙', '', '1', '0', '4.28', '4.28', '1', '4', '', '200', '12');
INSERT INTO `product` VALUES ('37', '黄心猕猴桃', '', '1', '0', '3.33', '3.33', '3', '5', '个', '0', '12');
INSERT INTO `product` VALUES ('38', '鸡蛋芒', '', '1', '0', '10.80', '10.80', '1', '6', '斤', '130', '12');
INSERT INTO `product` VALUES ('39', '澳芒', '', '1', '0', '8.80', '8.80', '1', '1', '斤', '350', '12');
INSERT INTO `product` VALUES ('40', '红肉火龙果', '', '1', '0', '13.80', '13.80', '1', '6', '斤', '750', '12');
INSERT INTO `product` VALUES ('41', '红提', '', '1', '0', '15.80', '15.80', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('42', '车厘子（大）', '', '1', '0', '48.00', '48.00', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('43', '车厘子（精品）', '', '1', '0', '39.80', '39.80', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('44', '新西兰奇异果', '', '1', '0', '4.50', '4.50', '3', '5', '个', '0', '12');
INSERT INTO `product` VALUES ('45', '桂圆', '', '1', '0', '13.80', '13.80', '2', '1', '斤', '0', '12');
INSERT INTO `product` VALUES ('46', '西瓜', '', '1', '0', '5.50', '5.50', '1', '3', '斤', '3600', '12');
INSERT INTO `product` VALUES ('47', '哈密瓜', '', '1', '0', '5.80', '5.80', '1', '3', '斤', '2400', '12');
INSERT INTO `product` VALUES ('48', '智利蓝莓', '', '1', '0', '16.00', '16.00', '3', '1', '盒', '0', '12');
INSERT INTO `product` VALUES ('49', '海南千禧圣女果', '', '1', '0', '8.80', '8.80', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('50', '红肉木瓜', '', '1', '0', '5.50', '5.50', '1', '3', '斤', '900', '12');
INSERT INTO `product` VALUES ('51', '柿饼', '', '1', '0', '2.00', '2.00', '3', '6', '个', '0', '12');
INSERT INTO `product` VALUES ('52', '台湾橄榄', '', '1', '0', '15.00', '15.00', '3', '6', '盒', '0', '12');
INSERT INTO `product` VALUES ('53', '草莓（大）', '', '1', '0', '15.80', '15.80', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('54', '草莓（小）', '', '1', '0', '10.80', '10.80', '2', '6', '斤', '0', '12');
INSERT INTO `product` VALUES ('55', '元祖牛油果', '', '1', '0', '9.00', '9.00', '3', '6', '个', '0', '12');
INSERT INTO `product` VALUES ('56', '柠檬', '', '1', '0', '11.80', '11.80', '1', '6', '斤', '200', '12');
INSERT INTO `product` VALUES ('57', '海南菠萝（大）', '', '1', '0', '3.33', '3.33', '1', '6', '斤', '1200', '12');
INSERT INTO `product` VALUES ('58', '海南菠萝（小）', '', '1', '0', '2.50', '2.50', '1', '6', '斤', '950', '12');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shippingaddress
-- ----------------------------
INSERT INTO `shippingaddress` VALUES ('1', '1', '侯西阳', '上海', '上海市区', '', '测试地址啊啊啊啊啊', '13524712918', '1');
INSERT INTO `shippingaddress` VALUES ('2', '4', '侯西阳', '上海', '上海市区', '', '南翔商务中心705', '13524712918', '1');
INSERT INTO `shippingaddress` VALUES ('3', '7', '刘志方', '上海', '上海市区', '', '威廉公馆', '18696168286', '1');
INSERT INTO `shippingaddress` VALUES ('4', '21', '任旺', '上海', '上海市区', '', '南翔商务中心', '13917638125', '1');
INSERT INTO `shippingaddress` VALUES ('5', '21', '曾妮', '上海', '上海市区', '', '中冶祥腾', '15221008096', '0');
INSERT INTO `shippingaddress` VALUES ('6', '19', '戴先生', '上海', '上海市区', '', '金地格林世界', '15502187076', '1');
INSERT INTO `shippingaddress` VALUES ('7', '23', '李玉龙', '上海', '上海市区', '', '中冶翔疼6楼607', '13918210924', '1');
INSERT INTO `shippingaddress` VALUES ('8', '35', '王立', '上海', '上海市区', '', '南翔商务', '15821691728', '1');
INSERT INTO `shippingaddress` VALUES ('9', '37', '戴显示', '上海', '上海市区', '', '你哈皮', '15502187076', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', 'ab1', '南翔镇古猗园东北方向民主东街78-80', '', '佳远水果店', '李大牛', '15821691728', '31.300663', '121.323178', 'wtw60f0gdfqret9nn', '上海', '嘉定区', '南翔镇', '本店绝对值得关注', '12', '1');
INSERT INTO `shop` VALUES ('2', 'ji2', '德华社区德华路332号', '', '德华水果店', '李二牛', '13838137911', '31.301179', '121.319461', 'wtw60dnns6dv8rwgd', '上海', '嘉定区', '南翔镇', '相信我们绝对是首选', '10', '1');
INSERT INTO `shop` VALUES ('3', '', '德园社区德华路456', '', '乡巴佬水果店(德华路店)', '媚娘', '18239260081', '31.300153', '121.317207', 'wtw60dh2xg6j3vjeq', '上海', '嘉定区', '南翔镇', '我们值得信赖', '16', '0');
INSERT INTO `shop` VALUES ('4', '', '德园社区德园路337号', '', '小郭水果超市', '小郭', '15537618477', '31.300408', '121.315492', 'wtw60d54pfgq83mus', '上海', '嘉定区', '南翔镇', '凸比难保完', '6', '0');
INSERT INTO `shop` VALUES ('5', '', '翔华社区靠近南翔镇火车站路108号', '', '翔华水果店', '啊翔', '13838137911', '31.291413', '121.313805', 'wtw6086j8w1m70cmr', '上海', '嘉定区', '南翔镇', '维瑞古德', '9', '0');
INSERT INTO `shop` VALUES ('6', '', '上海市普陀区宜川路街道中远两湾城第一西方向靠近中潭路65号', '', '中潭水果店', '倪三妮', '15000933310', '31.25852', '121.449285', 'wtw3gdkwj6qwcu82n', '上海', '普陀区', '宜川路', '吼吼吼', '8', '1');
INSERT INTO `shop` VALUES ('7', '', '上海市虹口区曲阳路街道上农一西南方向靠近中山北一路652-3临', '', '胖子精品水果店 ', '胖纸', '13162344458', '31.289122', '121.489802', 'wtw6h840me44zjc3d', '上海', '虹口区', '曲阳路', '胖纸都是潜力股', '8', '1');
INSERT INTO `shop` VALUES ('8', '', '上海市普陀区桃浦镇李子园六村东方向靠近真南路215', '', '绿缘水果店', '媛媛', '13761902139', '31.27437', '121.402472', 'wtw3ft6d6th7b467m', '上海', '普陀区', '桃浦镇李子园六村', '缘来是你', '12', '1');
INSERT INTO `shop` VALUES ('12', 'ji12', '南翔镇民主东街370号', 'http://7u2out.com1.z0.glb.clouddn.com/o_19dc3l3kq16d2i70bonj891f49l.jpg', '美鲜鲜果业', '林总', '15859285082', '31.301074', '121.324587', 'wtw60f1vgz0g', '上海', '嘉定', '上海', '美鲜鲜，鲜美美！', '30', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', '', '侯小猴', '', '', '1', '闵行', '上海', '中国', '2015-02-05 14:24:15', 'oeRy5s13e_lsBdouHjP6X-642xTE', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAgCebUIXHT6AibyV4MTibebEdonicZ3iaxAS5d3KFk5NWqlkIn99KB6XrtMuY8iasuxsB6xbGmj1UzRMA/0', '0', '0');
INSERT INTO `user` VALUES ('5', '', '差不多先森。', '', '', '1', '嘉定', '上海', '中国', '2015-02-05 19:52:16', 'oeRy5s2-u-euFwsUwUXjj-8Yiejs', 'http://wx.qlogo.cn/mmopen/ibwFHvvnm5FokMI7ZwHJMW5rIUrajy255obVucdxnm4rhdSqib8CfkLUib50J5s8etcT2ia3Re7iaiaGtRpbqa9JgVGSk7RwqB7MSC/0', '0', '0');
INSERT INTO `user` VALUES ('6', '', '阿Q果园子', '', '', '2', '嘉定', '上海', '中国', '2015-02-05 20:21:36', 'oeRy5s_BZs2STYC8x6ncnE3Kcrmo', 'http://wx.qlogo.cn/mmopen/JnkugDHhW4jD0tAQ3ib04G9lwTCZqibEQ1pNHDTucibeoJNskhdviapnhrddNOepEhZcLNE8FiauQvZCFK71eZxuiaQKAad0EhFW0q/0', '0', '0');
INSERT INTO `user` VALUES ('7', '', 'Moriarty', '', '', '1', '嘉定', '上海', '中国', '2015-02-05 21:52:03', 'oeRy5s4uJCDs3dAGOfXN5Q-XWSZo', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELt10xv6MzibFHKKIHZ6r2s5zOhENDBTviadzHdibNZJ3VcciaGYxYqOd65Ey6t0pibA9kMZrJTQKJvdtg/0', '0', '0');
INSERT INTO `user` VALUES ('10', '', 'Ekey-任明星', '', '', '1', '杨浦', '上海', '中国', '2015-02-06 22:39:59', 'oeRy5s9rwKGg9hEYJKPvduZMG2gw', 'http://wx.qlogo.cn/mmopen/V52btXJKaLPiaZAwItXlp8eicVkUiasWksv2MxDuvJFvJbpCymuxrEFOeBEoKjQVzqhkb46cAIWQ1zJ0MxqWdKWR1ibt5ywr9DRV/0', '0', '0');
INSERT INTO `user` VALUES ('21', '', 'Federic-任旺', '', '', '1', '嘉定', '上海', '中国', '2015-02-08 10:32:52', 'oeRy5s2-cKzB9bQVHkO950ofmOR0', 'http://wx.qlogo.cn/mmopen/JnkugDHhW4jD0tAQ3ib04G8sfo9g07AdRbnPqIrRAgCzFiaD7rgGWLuyDWjMsU3xdqfcAC9aqUzK2hKOfSMD89qr1MXDjGZkOX/0', '0', '0');
INSERT INTO `user` VALUES ('22', '', '狗老大（宝贝它-余明坤）', '', '', '1', '浦东新区', '上海', '中国', '2015-02-08 18:09:14', 'oeRy5s68av3nA7NEyqNrhfU-dj-I', 'http://wx.qlogo.cn/mmopen/ibwFHvvnm5FokMI7ZwHJMWwxBO2WAMG0zSE8PCdX9IHzqYFd6txNUVhoZb2ZwUEYVmhSdMLyqibfYuq7zOp0Wicv7icxp4aDCg6j/0', '0', '0');
INSERT INTO `user` VALUES ('23', '', '李玉龙', '', '', '1', '浦东新区', '上海', '中国', '2015-02-09 10:30:19', 'oeRy5sxofVCaRVf-BGL-QqCmAkuM', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBFrX63GvfiaJkVSBwsaV5nI3dDqQ41iaz8uKOSFjfRHX74JDhm7oLgSqL7hTzTeQqLYhmAxr5tIwoA/0', '0', '0');
INSERT INTO `user` VALUES ('24', '', '王康', '', '', '1', '嘉定', '上海', '中国', '2015-02-09 17:35:39', 'oeRy5s5OJhI5ELA-E6cHW64kDV_Y', 'http://wx.qlogo.cn/mmopen/JnkugDHhW4jD0tAQ3ib04G8hwv4bhecmbBhxDUWJAxrN6WsKjtFSsRh4sV19mY7MvguCeSWnoT1RIX6PHsuicpoxPjeadsXawY/0', '0', '0');
INSERT INTO `user` VALUES ('25', '', '2.Zn', '', '', '2', '嘉定', '上海', '中国', '2015-02-09 17:36:03', 'oeRy5s8CeCq0OvXa9vjUeYtq3qjw', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDTfwLAoSMVIcHwLUEibgvrm7Kq7cAviaMP14htlpAdcVsg2Qia50ht2ZzUFz3RmxzoHGianrGtEwgDIg/0', '0', '0');
INSERT INTO `user` VALUES ('26', '', '雨天', '', '', '2', '嘉定', '上海', '中国', '2015-02-09 18:01:17', 'oeRy5s6_OXcrMJcq286Zumw-FLGM', 'http://wx.qlogo.cn/mmopen/PXt4diamKdwsdt0KD3ahAS3L968icsJhRdJpaJ20upmrSd2fEcIs8pdR3jpib60GpfRYzeZniaIuPfuTnghgrHaYhHA7KWtOIedc/0', '0', '0');
INSERT INTO `user` VALUES ('27', '', 'Elaine琳', '', '', '2', '嘉兴', '浙江', '中国', '2015-02-09 18:01:54', 'oeRy5sxIAMEBndk40ROOisCnfkn0', 'http://wx.qlogo.cn/mmopen/JnkugDHhW4jD0tAQ3ib04G2ndloLDN5nadvQGHU0BDlmp788J2DUyJ2vvyHBvnyw0MvdZnGr74VRu9GOAR1mmcSpd0PGavsth/0', '0', '0');
INSERT INTO `user` VALUES ('28', '', 'Candy Ting', '', '', '2', '徐汇', '上海', '中国', '2015-02-09 18:02:43', 'oeRy5s_d7Pbp6AdU_vulek4RbNMo', 'http://wx.qlogo.cn/mmopen/V52btXJKaLOSvAHPias9qrm2XfSEyuBv0TP1Pbh3BnF4DJecicU5hy7ibQrOqUlhsrzEOUZF229zss39Z3K4UQdDnNZuGfBXuib7/0', '0', '0');
INSERT INTO `user` VALUES ('29', '', '白艺冲', '', '', '1', '', '北京', '中国', '2015-02-10 10:58:03', 'oeRy5s7lIcZ7ysBm4kherq3iENvQ', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6QntTX3A0RnqYVYPIpUJlr5YeibWIIUYH1cBzuRCjATLRZRfR7jNnxGDxVqC4C7xUqMgKqGzGDHtA/0', '0', '0');
INSERT INTO `user` VALUES ('30', '', '蓓蓓酱', '', '', '2', '黄浦', '上海', '中国', '2015-02-10 21:10:07', 'oeRy5s7ZFBbeOzDXrTTp9iCnOMFg', 'http://wx.qlogo.cn/mmopen/O5IB5rptd1oq8ckQ3XK12PU2fhkUDSfdWGdptSXELdnjsVzjpicLVtsy1lEAYiciaJvWtGF5bqDlMISZd20ufLM7Q/0', '0', '0');
INSERT INTO `user` VALUES ('34', '', 'DX', '', '', '1', '长宁', '上海', '中国', '2015-02-10 22:59:03', 'oR-0TuJI-tC6c33qgzf2ifIrudB8', 'http://wx.qlogo.cn/mmopen/If3ZbnEIQIVRR2R9AvL8FT8YJyK8gxiaqbZB7HCba2pVlX39xEZy3JLs1xHiaHECibxlWjg0EzsEptRYcVkzSTFcYW6btTQYEHs/0', '1', '12');
INSERT INTO `user` VALUES ('35', '', '繁华背后的落寂', '', '', '1', '徐汇', '上海', '中国', '2015-02-10 22:28:04', 'oeRy5swrmPEtbgBlTcwQNclz3EXE', 'http://wx.qlogo.cn/mmopen/dPZZs3TeVU8tJaC6fvAFdlU2P2ic3yQicsoMe0PbLRZG1z25zBFUIrQR37dRibu7yC04XW9T6ibWmXxXSibgntBmyF769w9I4mezG/0', '0', '0');
INSERT INTO `user` VALUES ('36', '', '繁华背后的落寂', '', '', '1', '徐汇', '上海', '中国', '2015-02-10 22:39:48', 'oR-0TuBMFVWqAjTrRjKFmyCbMxyA', 'http://wx.qlogo.cn/mmopen/KBbJvqzrmBeRn9FZbNWMNxg7DW29o4yuZY8DicylBWpAvlyTtsWNUzlfT58G9xXObHFEPbSn90t1cLusS6HW8HOeMNic3pKt3p/0', '1', '2');
INSERT INTO `user` VALUES ('37', '', 'DX', '', '', '1', '长宁', '上海', '中国', '2015-02-10 22:50:52', 'oeRy5s_WYCNDwfjpP7rmGhNpsMHE', 'http://wx.qlogo.cn/mmopen/V52btXJKaLPiaZAwItXlp8cKFVhBAQ2Xldz7u0KJKy102A735URM5EVL1bYwzjwoZgfAZV91HeL3S9DwtDmv0hibntUL4Ndw2e/0', '0', '0');
INSERT INTO `user` VALUES ('38', '', 'Moriarty', '', '', '1', '嘉定', '上海', '中国', '2015-02-10 23:13:21', 'oR-0TuMrwHJvpDBg79wMeIkujvrM', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK3dAiaiakKnebibQpVwbY58CMj4sxTPFjPGu1m3vaybHj22dB7EC7HbUFiafyOhvVrOALTDdiavJSxicicg/0', '1', '1');

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
-- Records of weixinshop
-- ----------------------------
INSERT INTO `weixinshop` VALUES ('wx17a8c83f5b2f6540', '432fb4827de4de9c2038ebcd2c5f064a', 'Qj4ut0Hey70Y70Z_AzGu6tAE0jcy1idJVRhu_gezknoZ7cDxziJIbt5DMKE84u5PDoX_ywvGqkSDiULqYBKfVl36VuFw7lnLP-1rjxRdE2A', '', '1423585357', 'wxshop');

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
-- Records of weixinuser
-- ----------------------------
INSERT INTO `weixinuser` VALUES ('wx17a029b44c383634', '0f0d1caf3e84edbf61fc28fecf0c74b9', 'lyl2MUI1W-\r\n EdxLlQdvSYu9gQbxmw70LLVM5URbRlKWA1KbuPUVZimDofsbG49bvhIMHvLcwfg45uFI80avlWF4B2Il4-\r\n XNJFboFgdHsaJic', '', '1423154550', 'wxuser');

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
