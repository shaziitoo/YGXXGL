/*
Navicat MySQL Data Transfer

Source Server         : yggl
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : rlzy

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2025-06-15 13:41:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(55) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'aa');
INSERT INTO `t_admin` VALUES ('2', 'admin', 'admin');

-- ----------------------------
-- Table structure for `t_chuqin`
-- ----------------------------
DROP TABLE IF EXISTS `t_chuqin`;
CREATE TABLE `t_chuqin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yuefen` varchar(55) DEFAULT NULL,
  `tianshu` int(11) DEFAULT NULL,
  `yuangong_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_chuqin
-- ----------------------------

-- ----------------------------
-- Table structure for `t_gongzi`
-- ----------------------------
DROP TABLE IF EXISTS `t_gongzi`;
CREATE TABLE `t_gongzi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yuefen` varchar(55) DEFAULT NULL,
  `jine` int(11) DEFAULT NULL,
  `yuangong_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gongzi
-- ----------------------------

-- ----------------------------
-- Table structure for `t_organization`
-- ----------------------------
DROP TABLE IF EXISTS `t_organization`;
CREATE TABLE `t_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_organization
-- ----------------------------
INSERT INTO `t_organization` VALUES ('1', '后勤部', '后勤部', '0', 'no');
INSERT INTO `t_organization` VALUES ('2', '生产部', '生产部', '0', 'no');
INSERT INTO `t_organization` VALUES ('3', '生产一部', '生产一部', '2', 'no');
INSERT INTO `t_organization` VALUES ('4', '生产二部', '生产二部', '2', 'no');
INSERT INTO `t_organization` VALUES ('5', '人事部', '人事部', '0', 'yes');
INSERT INTO `t_organization` VALUES ('6', '组织部', '组织部', '0', 'yes');
INSERT INTO `t_organization` VALUES ('7', '后勤一部', '后勤一部', '1', 'no');
INSERT INTO `t_organization` VALUES ('8', '后勤二部', '后勤二部', '1', 'no');
INSERT INTO `t_organization` VALUES ('10', '人事一部', '人事一部', '5', 'yes');
INSERT INTO `t_organization` VALUES ('11', '11', '11', '4', 'no');
INSERT INTO `t_organization` VALUES ('12', '生产三部', '生产三部', '2', 'yes');
INSERT INTO `t_organization` VALUES ('13', '22', '22', '4', 'no');
INSERT INTO `t_organization` VALUES ('14', '生产三部', '', '0', 'yes');
INSERT INTO `t_organization` VALUES ('15', '33', '', '4', 'yes');
INSERT INTO `t_organization` VALUES ('16', '生产三部', '', '0', 'yes');
INSERT INTO `t_organization` VALUES ('17', '33', '', '4', 'yes');
INSERT INTO `t_organization` VALUES ('18', '人事部', '', '0', 'no');
INSERT INTO `t_organization` VALUES ('19', '人事部', '', '0', 'yes');
INSERT INTO `t_organization` VALUES ('20', '人事部', '', '0', 'yes');
INSERT INTO `t_organization` VALUES ('21', '财务部', '', '0', 'yes');
INSERT INTO `t_organization` VALUES ('22', '财务一部', '', '21', 'no');
INSERT INTO `t_organization` VALUES ('23', '人事一部', '', '18', 'yes');
INSERT INTO `t_organization` VALUES ('24', '财务部', '', '0', 'yes');
INSERT INTO `t_organization` VALUES ('25', '财务一部', '', '24', 'yes');
INSERT INTO `t_organization` VALUES ('26', '财务部', '', '0', 'yes');
INSERT INTO `t_organization` VALUES ('27', '财务一部', '', '26', 'yes');
INSERT INTO `t_organization` VALUES ('28', 'a', '', '0', 'yes');
INSERT INTO `t_organization` VALUES ('29', 'a', '', '26', 'yes');
INSERT INTO `t_organization` VALUES ('30', '23', '', '0', 'yes');
INSERT INTO `t_organization` VALUES ('31', '23', '', '26', 'no');
INSERT INTO `t_organization` VALUES ('32', '财务部', '', '0', 'no');
INSERT INTO `t_organization` VALUES ('33', '13', '', '32', 'yes');
INSERT INTO `t_organization` VALUES ('34', '人事一部', '人事一部', '18', 'yes');
INSERT INTO `t_organization` VALUES ('35', 'test1', 'test1', '0', 'no');
INSERT INTO `t_organization` VALUES ('36', 'test1-test1', 'test1-test1', '35', 'no');

-- ----------------------------
-- Table structure for `t_qingjiashenqing`
-- ----------------------------
DROP TABLE IF EXISTS `t_qingjiashenqing`;
CREATE TABLE `t_qingjiashenqing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kaishishijian` varchar(50) DEFAULT NULL,
  `jieshushijian` varchar(50) DEFAULT NULL,
  `beizhu` varchar(5000) DEFAULT NULL,
  `yuangong_id` int(11) DEFAULT NULL,
  `shenhezhuangtai` varchar(50) DEFAULT NULL,
  `huifuxinxi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_qingjiashenqing
-- ----------------------------

-- ----------------------------
-- Table structure for `t_yuangong`
-- ----------------------------
DROP TABLE IF EXISTS `t_yuangong`;
CREATE TABLE `t_yuangong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `bianhao` varchar(55) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `zhiwei` varchar(50) DEFAULT NULL,
  `shifoubumenlingdao` varchar(50) DEFAULT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpw` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_yuangong
-- ----------------------------
INSERT INTO `t_yuangong` VALUES ('19', '5', '202501', '张三', '男', '33', '员工', 'fou', '202501', '000000', 'no');
