/*
Navicat MySQL Data Transfer

Source Server         : VirtualBox-192.168.2.191
Source Server Version : 50556
Source Host           : 192.168.2.191:3306
Source Database       : my_java

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2018-02-26 11:22:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rs_department
-- ----------------------------
DROP TABLE IF EXISTS `rs_department`;
CREATE TABLE `rs_department` (
  `departmentid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL DEFAULT '',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `path` varchar(60) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '10',
  `disabled` enum('1','0') NOT NULL DEFAULT '0',
  `isparent` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`departmentid`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_department
-- ----------------------------
INSERT INTO `rs_department` VALUES ('1', 'ROOT', '0', '1', '1000', '0', '1');
INSERT INTO `rs_department` VALUES ('70', '苏州分公司', '56', '1-55-56-70', '10', '0', '0');
INSERT INTO `rs_department` VALUES ('69', '111', '56', '1-55-56-69', '10', '1', '0');
INSERT INTO `rs_department` VALUES ('68', '客服部', '56', '1-55-56-68', '10', '0', '0');
INSERT INTO `rs_department` VALUES ('67', '研发部', '66', '1-55-56-66-67', '10', '1', '0');
INSERT INTO `rs_department` VALUES ('66', '研发部', '56', '1-55-56-66', '1000', '1', '1');
INSERT INTO `rs_department` VALUES ('65', '客服部', '62', '1-55-56-62-65', '1000', '1', '0');
INSERT INTO `rs_department` VALUES ('64', '东南亚', '62', '1-55-56-62-64', '1000', '1', '0');
INSERT INTO `rs_department` VALUES ('63', '国内', '62', '1-55-56-62-63', '1000', '1', '0');
INSERT INTO `rs_department` VALUES ('62', '客服部', '56', '1-55-56-62', '1000', '1', '1');
INSERT INTO `rs_department` VALUES ('61', 'IT', '56', '1-55-56-61', '1000', '1', '0');
INSERT INTO `rs_department` VALUES ('60', '销售部', '56', '1-55-56-60', '1000', '0', '0');
INSERT INTO `rs_department` VALUES ('59', '客服部', '57', '1-55-57-59', '1000', '0', '1');
INSERT INTO `rs_department` VALUES ('58', '销售部', '57', '1-55-57-58', '1000', '0', '1');
INSERT INTO `rs_department` VALUES ('57', '河南分公司', '55', '1-55-57', '1000', '0', '1');
INSERT INTO `rs_department` VALUES ('56', '苏州分公司', '55', '1-55-56', '1000', '0', '1');
INSERT INTO `rs_department` VALUES ('55', '总公司', '1', '1-55', '1000', '0', '1');
INSERT INTO `rs_department` VALUES ('71', '客服部', '59', '1-55-57-59-71', '10', '1', '0');
INSERT INTO `rs_department` VALUES ('72', '销售部', '58', '1-55-57-58-72', '10', '0', '0');
INSERT INTO `rs_department` VALUES ('73', '112', '56', '1-55-56-73', '10', '0', '0');

-- ----------------------------
-- Table structure for rs_manager
-- ----------------------------
DROP TABLE IF EXISTS `rs_manager`;
CREATE TABLE `rs_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `roleid` tinyint(2) unsigned DEFAULT NULL COMMENT '角色',
  `email` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `status` enum('0','1') DEFAULT '1' COMMENT '1：正常；0：禁用',
  `addtime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_manager
-- ----------------------------
INSERT INTO `rs_manager` VALUES ('1', 'admin', 'd2168d104fecae8ca3511996984202a7', '1', '2801151629@qq.com', '13913297253', '1', '1445936050');
INSERT INTO `rs_manager` VALUES ('9', 'admin888', 'd2168d104fecae8ca3511996984202a7', '1', 'tangmeicun@rshui.cn', '13913297253', '1', '1508308336');

-- ----------------------------
-- Table structure for rs_menu
-- ----------------------------
DROP TABLE IF EXISTS `rs_menu`;
CREATE TABLE `rs_menu` (
  `menuid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(120) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `icons` varchar(40) NOT NULL DEFAULT 'fa-table',
  PRIMARY KEY (`menuid`),
  UNIQUE KEY `menuid` (`menuid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_menu
-- ----------------------------
INSERT INTO `rs_menu` VALUES ('1', '首页', '0', 'index-index', '0', '1', 'icon-dashboard');
INSERT INTO `rs_menu` VALUES ('2', '射击小游戏管理', '0', 'sheji-index', '0', '1', 'icon-briefcase');
INSERT INTO `rs_menu` VALUES ('3', '游戏奖池列表管理', '2', 'sheji-prizelist', '0', '1', '');
INSERT INTO `rs_menu` VALUES ('4', '系统管理', '0', 'manager-userlist', '0', '1', 'icon-comment');
INSERT INTO `rs_menu` VALUES ('5', '用户管理', '4', 'manager-userlist', '0', '1', '');
INSERT INTO `rs_menu` VALUES ('6', '角色管理', '4', 'manager-rolelist', '0', '1', '');
INSERT INTO `rs_menu` VALUES ('24', '菜单管理', '4', 'manager-menulist', '0', '1', '');
INSERT INTO `rs_menu` VALUES ('25', '用户获奖记录', '2', 'sheji-recordlist', '0', '1', '');

-- ----------------------------
-- Table structure for rs_role
-- ----------------------------
DROP TABLE IF EXISTS `rs_role`;
CREATE TABLE `rs_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`),
  KEY `roleid_2` (`roleid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_role
-- ----------------------------
INSERT INTO `rs_role` VALUES ('1', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `rs_role` VALUES ('2', '管理员', '管理员', '1', '0');
INSERT INTO `rs_role` VALUES ('7', '运营专员', '运营专员', '0', '0');
INSERT INTO `rs_role` VALUES ('8', '查看专员', '查看专员', '0', '0');

-- ----------------------------
-- Table structure for rs_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `rs_role_menu`;
CREATE TABLE `rs_role_menu` (
  `roleid` tinyint(3) unsigned NOT NULL,
  `menuid` smallint(6) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_role_menu
-- ----------------------------
INSERT INTO `rs_role_menu` VALUES ('1', '6');
INSERT INTO `rs_role_menu` VALUES ('1', '5');
INSERT INTO `rs_role_menu` VALUES ('1', '4');
INSERT INTO `rs_role_menu` VALUES ('1', '25');
INSERT INTO `rs_role_menu` VALUES ('1', '3');
INSERT INTO `rs_role_menu` VALUES ('1', '2');
INSERT INTO `rs_role_menu` VALUES ('1', '1');
INSERT INTO `rs_role_menu` VALUES ('2', '4');
INSERT INTO `rs_role_menu` VALUES ('2', '25');
INSERT INTO `rs_role_menu` VALUES ('2', '3');
INSERT INTO `rs_role_menu` VALUES ('2', '2');
INSERT INTO `rs_role_menu` VALUES ('7', '3');
INSERT INTO `rs_role_menu` VALUES ('7', '2');
INSERT INTO `rs_role_menu` VALUES ('1', '24');
INSERT INTO `rs_role_menu` VALUES ('2', '24');
INSERT INTO `rs_role_menu` VALUES ('7', '25');
INSERT INTO `rs_role_menu` VALUES ('8', '2');
INSERT INTO `rs_role_menu` VALUES ('8', '3');

-- ----------------------------
-- Table structure for rs_sheji_prize
-- ----------------------------
DROP TABLE IF EXISTS `rs_sheji_prize`;
CREATE TABLE `rs_sheji_prize` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL COMMENT '奖品标题',
  `description` varchar(200) DEFAULT NULL COMMENT '奖品描述',
  `percent` int(2) DEFAULT '0' COMMENT '百分百，和为100',
  `prize` int(5) unsigned DEFAULT '0' COMMENT '奖励值',
  KEY `roleid` (`id`),
  KEY `roleid_2` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_sheji_prize
-- ----------------------------
INSERT INTO `rs_sheji_prize` VALUES ('1', '消灭了一个敌人，您获得15积分奖励！', '消灭了一个敌人，您获得15积分奖励！', '30', '15');
INSERT INTO `rs_sheji_prize` VALUES ('2', '一箭双雕！您获得20积分奖励，再来一局吧！\r\n', '一箭双雕！您获得20积分奖励，再来一局吧!', '10', '20');
INSERT INTO `rs_sheji_prize` VALUES ('4', '火药太多，炮弹被怼飞了！真遗憾，再来一局吧！', '火药太多，炮弹被怼飞了！真遗憾，再来一局吧！', '10', '0');
INSERT INTO `rs_sheji_prize` VALUES ('3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '50', '5');

-- ----------------------------
-- Table structure for rs_sheji_record
-- ----------------------------
DROP TABLE IF EXISTS `rs_sheji_record`;
CREATE TABLE `rs_sheji_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户呢称',
  `prizeclassid` int(5) unsigned DEFAULT NULL,
  `prizename` varchar(50) DEFAULT NULL COMMENT '奖品名称',
  `prizenum` int(5) unsigned DEFAULT NULL COMMENT '扣除或者扣除的积分数',
  `status` enum('2','1') DEFAULT '1' COMMENT '状态：1-扣积分；2-获积分',
  `datetime` int(10) unsigned DEFAULT NULL,
  KEY `roleid` (`id`),
  KEY `roleid_2` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=519 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_sheji_record
-- ----------------------------
INSERT INTO `rs_sheji_record` VALUES ('60', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305282');
INSERT INTO `rs_sheji_record` VALUES ('61', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305282');
INSERT INTO `rs_sheji_record` VALUES ('62', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('63', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('64', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('65', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('66', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('67', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('68', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('69', '369369', '小燕子', '2', '打中2个人,获得奖励20积分', '20', '2', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('70', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('71', '369369', '小燕子', '2', '打中2个人,获得奖励20积分', '20', '2', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('72', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('73', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305283');
INSERT INTO `rs_sheji_record` VALUES ('74', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('75', '369369', '小燕子', '2', '打中2个人,获得奖励20积分', '20', '2', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('76', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('77', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('78', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('79', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('80', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('81', '369369', '小燕子', '2', '打中2个人,获得奖励20积分', '20', '2', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('82', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('83', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305284');
INSERT INTO `rs_sheji_record` VALUES ('84', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('85', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('86', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('87', '369369', '小燕子', '2', '打中2个人,获得奖励20积分', '20', '2', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('88', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('89', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('90', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('91', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('92', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('93', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('94', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('95', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305285');
INSERT INTO `rs_sheji_record` VALUES ('96', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305286');
INSERT INTO `rs_sheji_record` VALUES ('97', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305286');
INSERT INTO `rs_sheji_record` VALUES ('98', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305286');
INSERT INTO `rs_sheji_record` VALUES ('99', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305286');
INSERT INTO `rs_sheji_record` VALUES ('100', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305310');
INSERT INTO `rs_sheji_record` VALUES ('101', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305310');
INSERT INTO `rs_sheji_record` VALUES ('102', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305311');
INSERT INTO `rs_sheji_record` VALUES ('103', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305311');
INSERT INTO `rs_sheji_record` VALUES ('104', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305311');
INSERT INTO `rs_sheji_record` VALUES ('105', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305311');
INSERT INTO `rs_sheji_record` VALUES ('106', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305311');
INSERT INTO `rs_sheji_record` VALUES ('107', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305311');
INSERT INTO `rs_sheji_record` VALUES ('108', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305311');
INSERT INTO `rs_sheji_record` VALUES ('109', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305311');
INSERT INTO `rs_sheji_record` VALUES ('110', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305313');
INSERT INTO `rs_sheji_record` VALUES ('111', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305313');
INSERT INTO `rs_sheji_record` VALUES ('112', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305313');
INSERT INTO `rs_sheji_record` VALUES ('113', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305313');
INSERT INTO `rs_sheji_record` VALUES ('114', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('115', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('116', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('117', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('118', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('119', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('120', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('121', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('122', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('123', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305314');
INSERT INTO `rs_sheji_record` VALUES ('124', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305315');
INSERT INTO `rs_sheji_record` VALUES ('125', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305315');
INSERT INTO `rs_sheji_record` VALUES ('126', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305315');
INSERT INTO `rs_sheji_record` VALUES ('127', '369369', '小燕子', '2', '打中2个人,获得奖励20积分', '20', '2', '1508305315');
INSERT INTO `rs_sheji_record` VALUES ('128', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305315');
INSERT INTO `rs_sheji_record` VALUES ('129', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305315');
INSERT INTO `rs_sheji_record` VALUES ('130', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305315');
INSERT INTO `rs_sheji_record` VALUES ('131', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305315');
INSERT INTO `rs_sheji_record` VALUES ('132', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('133', '369369', '小燕子', '2', '打中2个人,获得奖励20积分', '20', '2', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('134', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('135', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('136', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('137', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('138', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('139', '369369', '小燕子', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('140', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('141', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305316');
INSERT INTO `rs_sheji_record` VALUES ('142', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508305317');
INSERT INTO `rs_sheji_record` VALUES ('143', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508305317');
INSERT INTO `rs_sheji_record` VALUES ('144', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508308951');
INSERT INTO `rs_sheji_record` VALUES ('145', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508308951');
INSERT INTO `rs_sheji_record` VALUES ('146', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508310426');
INSERT INTO `rs_sheji_record` VALUES ('147', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508310426');
INSERT INTO `rs_sheji_record` VALUES ('148', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508311350');
INSERT INTO `rs_sheji_record` VALUES ('149', '369369', '小燕子', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508311350');
INSERT INTO `rs_sheji_record` VALUES ('150', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508311356');
INSERT INTO `rs_sheji_record` VALUES ('151', '369369', '小燕子', '3', '炮弹掉地上，返还5积分', '5', '2', '1508311356');
INSERT INTO `rs_sheji_record` VALUES ('152', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508311400');
INSERT INTO `rs_sheji_record` VALUES ('153', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508311400');
INSERT INTO `rs_sheji_record` VALUES ('154', '369369', '小燕子', null, '发射一枚炮弹需10积分', '10', '1', '1508311413');
INSERT INTO `rs_sheji_record` VALUES ('155', '369369', '小燕子', '1', '打中1个人,获得奖励15积分', '15', '2', '1508311413');
INSERT INTO `rs_sheji_record` VALUES ('156', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508315019');
INSERT INTO `rs_sheji_record` VALUES ('157', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508315019');
INSERT INTO `rs_sheji_record` VALUES ('158', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508315081');
INSERT INTO `rs_sheji_record` VALUES ('159', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508315082');
INSERT INTO `rs_sheji_record` VALUES ('160', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508315100');
INSERT INTO `rs_sheji_record` VALUES ('161', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508315101');
INSERT INTO `rs_sheji_record` VALUES ('162', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508315136');
INSERT INTO `rs_sheji_record` VALUES ('163', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508315136');
INSERT INTO `rs_sheji_record` VALUES ('164', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508315319');
INSERT INTO `rs_sheji_record` VALUES ('165', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508315319');
INSERT INTO `rs_sheji_record` VALUES ('166', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508315459');
INSERT INTO `rs_sheji_record` VALUES ('167', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508315459');
INSERT INTO `rs_sheji_record` VALUES ('168', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508315481');
INSERT INTO `rs_sheji_record` VALUES ('169', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508315481');
INSERT INTO `rs_sheji_record` VALUES ('170', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508315498');
INSERT INTO `rs_sheji_record` VALUES ('171', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508315499');
INSERT INTO `rs_sheji_record` VALUES ('172', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508316392');
INSERT INTO `rs_sheji_record` VALUES ('173', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508316393');
INSERT INTO `rs_sheji_record` VALUES ('174', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508316467');
INSERT INTO `rs_sheji_record` VALUES ('175', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508316468');
INSERT INTO `rs_sheji_record` VALUES ('176', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508316477');
INSERT INTO `rs_sheji_record` VALUES ('177', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508316477');
INSERT INTO `rs_sheji_record` VALUES ('178', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508316492');
INSERT INTO `rs_sheji_record` VALUES ('179', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508316492');
INSERT INTO `rs_sheji_record` VALUES ('180', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508316502');
INSERT INTO `rs_sheji_record` VALUES ('181', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508316502');
INSERT INTO `rs_sheji_record` VALUES ('182', '632332', '', null, '发射一枚炮弹需100积分', '100', '1', '1508378191');
INSERT INTO `rs_sheji_record` VALUES ('183', '632332', '', null, '发射一枚炮弹需100积分', '100', '1', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('184', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('185', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('186', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('187', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('188', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('189', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('190', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('191', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('192', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('193', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508378737');
INSERT INTO `rs_sheji_record` VALUES ('194', '632332', '', null, '发射一枚炮弹需100积分', '100', '1', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('195', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('196', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('197', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('198', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('199', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('200', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('201', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('202', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('203', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('204', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379495');
INSERT INTO `rs_sheji_record` VALUES ('205', '632332', '', null, '发射一枚炮弹需100积分', '100', '1', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('206', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('207', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('208', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('209', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('210', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('211', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('212', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('213', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('214', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('215', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508379518');
INSERT INTO `rs_sheji_record` VALUES ('216', '632332', '', null, '发射一枚炮弹需100积分', '100', '1', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('217', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('218', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('219', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('220', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('221', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('222', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('223', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('224', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('225', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('226', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379549');
INSERT INTO `rs_sheji_record` VALUES ('227', '632332', '', null, '发射一枚炮弹需100积分', '100', '1', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('228', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('229', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('230', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('231', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('232', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('233', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('234', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('235', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('236', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('237', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508379571');
INSERT INTO `rs_sheji_record` VALUES ('238', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('239', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('240', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('241', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('242', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('243', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('244', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('245', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('246', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('247', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('248', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508379615');
INSERT INTO `rs_sheji_record` VALUES ('249', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508390976');
INSERT INTO `rs_sheji_record` VALUES ('250', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508390976');
INSERT INTO `rs_sheji_record` VALUES ('251', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391009');
INSERT INTO `rs_sheji_record` VALUES ('252', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508391010');
INSERT INTO `rs_sheji_record` VALUES ('253', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391021');
INSERT INTO `rs_sheji_record` VALUES ('254', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391021');
INSERT INTO `rs_sheji_record` VALUES ('255', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391031');
INSERT INTO `rs_sheji_record` VALUES ('256', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391031');
INSERT INTO `rs_sheji_record` VALUES ('257', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391040');
INSERT INTO `rs_sheji_record` VALUES ('258', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391041');
INSERT INTO `rs_sheji_record` VALUES ('259', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391048');
INSERT INTO `rs_sheji_record` VALUES ('260', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391049');
INSERT INTO `rs_sheji_record` VALUES ('261', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391108');
INSERT INTO `rs_sheji_record` VALUES ('262', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391108');
INSERT INTO `rs_sheji_record` VALUES ('263', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391117');
INSERT INTO `rs_sheji_record` VALUES ('264', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391118');
INSERT INTO `rs_sheji_record` VALUES ('265', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391125');
INSERT INTO `rs_sheji_record` VALUES ('266', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391126');
INSERT INTO `rs_sheji_record` VALUES ('267', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391134');
INSERT INTO `rs_sheji_record` VALUES ('268', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391135');
INSERT INTO `rs_sheji_record` VALUES ('269', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('270', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('271', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('272', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('273', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('274', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('275', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('276', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('277', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('278', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('279', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391143');
INSERT INTO `rs_sheji_record` VALUES ('280', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('281', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('282', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('283', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('284', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('285', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('286', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('287', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('288', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('289', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('290', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391286');
INSERT INTO `rs_sheji_record` VALUES ('291', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('292', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('293', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('294', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('295', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('296', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('297', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('298', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('299', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('300', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('301', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391308');
INSERT INTO `rs_sheji_record` VALUES ('302', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391324');
INSERT INTO `rs_sheji_record` VALUES ('303', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391325');
INSERT INTO `rs_sheji_record` VALUES ('304', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391330');
INSERT INTO `rs_sheji_record` VALUES ('305', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391331');
INSERT INTO `rs_sheji_record` VALUES ('306', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391338');
INSERT INTO `rs_sheji_record` VALUES ('307', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391339');
INSERT INTO `rs_sheji_record` VALUES ('308', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391345');
INSERT INTO `rs_sheji_record` VALUES ('309', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391346');
INSERT INTO `rs_sheji_record` VALUES ('310', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391352');
INSERT INTO `rs_sheji_record` VALUES ('311', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391352');
INSERT INTO `rs_sheji_record` VALUES ('312', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391360');
INSERT INTO `rs_sheji_record` VALUES ('313', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391360');
INSERT INTO `rs_sheji_record` VALUES ('314', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('315', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('316', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('317', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('318', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('319', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('320', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('321', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('322', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('323', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('324', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391420');
INSERT INTO `rs_sheji_record` VALUES ('325', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391538');
INSERT INTO `rs_sheji_record` VALUES ('326', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391538');
INSERT INTO `rs_sheji_record` VALUES ('327', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391546');
INSERT INTO `rs_sheji_record` VALUES ('328', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391547');
INSERT INTO `rs_sheji_record` VALUES ('329', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391559');
INSERT INTO `rs_sheji_record` VALUES ('330', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391559');
INSERT INTO `rs_sheji_record` VALUES ('331', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391567');
INSERT INTO `rs_sheji_record` VALUES ('332', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508391567');
INSERT INTO `rs_sheji_record` VALUES ('333', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391574');
INSERT INTO `rs_sheji_record` VALUES ('334', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391628');
INSERT INTO `rs_sheji_record` VALUES ('335', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391629');
INSERT INTO `rs_sheji_record` VALUES ('336', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391640');
INSERT INTO `rs_sheji_record` VALUES ('337', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391640');
INSERT INTO `rs_sheji_record` VALUES ('338', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391650');
INSERT INTO `rs_sheji_record` VALUES ('339', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391650');
INSERT INTO `rs_sheji_record` VALUES ('340', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391662');
INSERT INTO `rs_sheji_record` VALUES ('341', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391663');
INSERT INTO `rs_sheji_record` VALUES ('342', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391726');
INSERT INTO `rs_sheji_record` VALUES ('343', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391727');
INSERT INTO `rs_sheji_record` VALUES ('344', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391734');
INSERT INTO `rs_sheji_record` VALUES ('345', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391735');
INSERT INTO `rs_sheji_record` VALUES ('346', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391746');
INSERT INTO `rs_sheji_record` VALUES ('347', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391747');
INSERT INTO `rs_sheji_record` VALUES ('348', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391754');
INSERT INTO `rs_sheji_record` VALUES ('349', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391755');
INSERT INTO `rs_sheji_record` VALUES ('350', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391762');
INSERT INTO `rs_sheji_record` VALUES ('351', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391763');
INSERT INTO `rs_sheji_record` VALUES ('352', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391838');
INSERT INTO `rs_sheji_record` VALUES ('353', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391838');
INSERT INTO `rs_sheji_record` VALUES ('354', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508391868');
INSERT INTO `rs_sheji_record` VALUES ('355', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391869');
INSERT INTO `rs_sheji_record` VALUES ('356', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('357', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('358', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('359', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('360', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('361', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('362', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('363', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('364', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('365', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('366', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508391961');
INSERT INTO `rs_sheji_record` VALUES ('367', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('368', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('369', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('370', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('371', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('372', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('373', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('374', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('375', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('376', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('377', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392852');
INSERT INTO `rs_sheji_record` VALUES ('378', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('379', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('380', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('381', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('382', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('383', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('384', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('385', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('386', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('387', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('388', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508392861');
INSERT INTO `rs_sheji_record` VALUES ('389', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('390', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('391', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('392', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('393', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('394', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('395', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('396', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('397', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('398', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('399', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508392869');
INSERT INTO `rs_sheji_record` VALUES ('400', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508400186');
INSERT INTO `rs_sheji_record` VALUES ('401', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405537');
INSERT INTO `rs_sheji_record` VALUES ('402', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405605');
INSERT INTO `rs_sheji_record` VALUES ('403', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405606');
INSERT INTO `rs_sheji_record` VALUES ('404', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405614');
INSERT INTO `rs_sheji_record` VALUES ('405', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405615');
INSERT INTO `rs_sheji_record` VALUES ('406', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405625');
INSERT INTO `rs_sheji_record` VALUES ('407', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405625');
INSERT INTO `rs_sheji_record` VALUES ('408', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405632');
INSERT INTO `rs_sheji_record` VALUES ('409', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405632');
INSERT INTO `rs_sheji_record` VALUES ('410', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405639');
INSERT INTO `rs_sheji_record` VALUES ('411', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508405639');
INSERT INTO `rs_sheji_record` VALUES ('412', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405648');
INSERT INTO `rs_sheji_record` VALUES ('413', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405649');
INSERT INTO `rs_sheji_record` VALUES ('414', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('415', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('416', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('417', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('418', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('419', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('420', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('421', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('422', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('423', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('424', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405655');
INSERT INTO `rs_sheji_record` VALUES ('425', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405664');
INSERT INTO `rs_sheji_record` VALUES ('426', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405665');
INSERT INTO `rs_sheji_record` VALUES ('427', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('428', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('429', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('430', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('431', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('432', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('433', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('434', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('435', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('436', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('437', '632332', '', '4', '打偏，炮弹没了，失去所有积分', '0', '2', '1508405670');
INSERT INTO `rs_sheji_record` VALUES ('438', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405867');
INSERT INTO `rs_sheji_record` VALUES ('439', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405868');
INSERT INTO `rs_sheji_record` VALUES ('440', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405876');
INSERT INTO `rs_sheji_record` VALUES ('441', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508405877');
INSERT INTO `rs_sheji_record` VALUES ('442', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405882');
INSERT INTO `rs_sheji_record` VALUES ('443', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405883');
INSERT INTO `rs_sheji_record` VALUES ('444', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405890');
INSERT INTO `rs_sheji_record` VALUES ('445', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405891');
INSERT INTO `rs_sheji_record` VALUES ('446', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405896');
INSERT INTO `rs_sheji_record` VALUES ('447', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405905');
INSERT INTO `rs_sheji_record` VALUES ('448', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405906');
INSERT INTO `rs_sheji_record` VALUES ('449', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405912');
INSERT INTO `rs_sheji_record` VALUES ('450', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405912');
INSERT INTO `rs_sheji_record` VALUES ('451', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405918');
INSERT INTO `rs_sheji_record` VALUES ('452', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405919');
INSERT INTO `rs_sheji_record` VALUES ('453', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405925');
INSERT INTO `rs_sheji_record` VALUES ('454', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405925');
INSERT INTO `rs_sheji_record` VALUES ('455', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508405931');
INSERT INTO `rs_sheji_record` VALUES ('456', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508405932');
INSERT INTO `rs_sheji_record` VALUES ('457', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508406599');
INSERT INTO `rs_sheji_record` VALUES ('458', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508406600');
INSERT INTO `rs_sheji_record` VALUES ('459', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508406607');
INSERT INTO `rs_sheji_record` VALUES ('460', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508406608');
INSERT INTO `rs_sheji_record` VALUES ('461', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508406613');
INSERT INTO `rs_sheji_record` VALUES ('462', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508406613');
INSERT INTO `rs_sheji_record` VALUES ('463', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508406619');
INSERT INTO `rs_sheji_record` VALUES ('464', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508406619');
INSERT INTO `rs_sheji_record` VALUES ('465', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508406626');
INSERT INTO `rs_sheji_record` VALUES ('466', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407201');
INSERT INTO `rs_sheji_record` VALUES ('467', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407215');
INSERT INTO `rs_sheji_record` VALUES ('468', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508407215');
INSERT INTO `rs_sheji_record` VALUES ('469', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407221');
INSERT INTO `rs_sheji_record` VALUES ('470', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508407222');
INSERT INTO `rs_sheji_record` VALUES ('471', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407228');
INSERT INTO `rs_sheji_record` VALUES ('472', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508407228');
INSERT INTO `rs_sheji_record` VALUES ('473', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407235');
INSERT INTO `rs_sheji_record` VALUES ('474', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508407236');
INSERT INTO `rs_sheji_record` VALUES ('475', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407435');
INSERT INTO `rs_sheji_record` VALUES ('476', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508407436');
INSERT INTO `rs_sheji_record` VALUES ('477', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407445');
INSERT INTO `rs_sheji_record` VALUES ('478', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508407445');
INSERT INTO `rs_sheji_record` VALUES ('479', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407451');
INSERT INTO `rs_sheji_record` VALUES ('480', '632332', '', '2', '打中2个人,获得奖励20积分', '20', '2', '1508407451');
INSERT INTO `rs_sheji_record` VALUES ('481', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407458');
INSERT INTO `rs_sheji_record` VALUES ('482', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508407458');
INSERT INTO `rs_sheji_record` VALUES ('483', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407464');
INSERT INTO `rs_sheji_record` VALUES ('484', '632332', '', '3', '炮弹掉地上，返还5积分', '5', '2', '1508407464');
INSERT INTO `rs_sheji_record` VALUES ('485', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407471');
INSERT INTO `rs_sheji_record` VALUES ('486', '632332', '', '1', '打中1个人,获得奖励15积分', '15', '2', '1508407471');
INSERT INTO `rs_sheji_record` VALUES ('487', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1508407478');
INSERT INTO `rs_sheji_record` VALUES ('488', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1510888555');
INSERT INTO `rs_sheji_record` VALUES ('489', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1510888556');
INSERT INTO `rs_sheji_record` VALUES ('490', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1511163192');
INSERT INTO `rs_sheji_record` VALUES ('491', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511163193');
INSERT INTO `rs_sheji_record` VALUES ('492', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1511163215');
INSERT INTO `rs_sheji_record` VALUES ('493', '632332', '', '2', '一箭双雕！您获得20积分奖励，再来一局吧！\r\n', '20', '2', '1511163216');
INSERT INTO `rs_sheji_record` VALUES ('494', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1511163227');
INSERT INTO `rs_sheji_record` VALUES ('495', '632332', '', '1', '消灭了一个敌人，您获得15积分奖励！', '15', '2', '1511163228');
INSERT INTO `rs_sheji_record` VALUES ('496', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1511163237');
INSERT INTO `rs_sheji_record` VALUES ('497', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511163238');
INSERT INTO `rs_sheji_record` VALUES ('498', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1511163357');
INSERT INTO `rs_sheji_record` VALUES ('499', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511163358');
INSERT INTO `rs_sheji_record` VALUES ('500', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1511163365');
INSERT INTO `rs_sheji_record` VALUES ('501', '632332', '', '2', '一箭双雕！您获得20积分奖励，再来一局吧！\r\n', '20', '2', '1511163367');
INSERT INTO `rs_sheji_record` VALUES ('502', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1511163568');
INSERT INTO `rs_sheji_record` VALUES ('503', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511163570');
INSERT INTO `rs_sheji_record` VALUES ('504', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1511163576');
INSERT INTO `rs_sheji_record` VALUES ('505', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511163578');
INSERT INTO `rs_sheji_record` VALUES ('506', '632332', '', null, '发射十枚炮弹需100积分', '100', '1', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('507', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('508', '632332', '', '1', '消灭了一个敌人，您获得15积分奖励！', '15', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('509', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('510', '632332', '', '1', '消灭了一个敌人，您获得15积分奖励！', '15', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('511', '632332', '', '1', '消灭了一个敌人，您获得15积分奖励！', '15', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('512', '632332', '', '2', '一箭双雕！您获得20积分奖励，再来一局吧！\r\n', '20', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('513', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('514', '632332', '', '2', '一箭双雕！您获得20积分奖励，再来一局吧！\r\n', '20', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('515', '632332', '', '4', '火药太多，炮弹被怼飞了！真遗憾，再来一局吧！', '0', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('516', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511163600');
INSERT INTO `rs_sheji_record` VALUES ('517', '632332', '', null, '发射一枚炮弹需10积分', '10', '1', '1511166398');
INSERT INTO `rs_sheji_record` VALUES ('518', '632332', '', '3', '火药太少了，炮弹没有发射。返还您5积分，再接再厉吧！', '5', '2', '1511166399');

-- ----------------------------
-- Table structure for slide_cat
-- ----------------------------
DROP TABLE IF EXISTS `slide_cat`;
CREATE TABLE `slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of slide_cat
-- ----------------------------
INSERT INTO `slide_cat` VALUES ('1', '首页bannerAndroid', 'portal_index', '首页', '1');
INSERT INTO `slide_cat` VALUES ('2', '首页中部广告位Android', 'portal_index2', '轮播下方', '1');
INSERT INTO `slide_cat` VALUES ('3', '首页bannerIOS', 'portal_indexIOS', '首页顶部bannerIOS', '1');
INSERT INTO `slide_cat` VALUES ('4', '首页底部广告位Android', 'portal_index3', '首页底部广告位', '1');
INSERT INTO `slide_cat` VALUES ('5', '游戏列表Android中部广告位H5', 'active_aindex2_', '游戏列表Android中部广告位H5', '1');
INSERT INTO `slide_cat` VALUES ('6', '首页中部广告位IOS', 'index_ios', '首页中部广告位IOS', '1');
INSERT INTO `slide_cat` VALUES ('7', '首页底部广告位IOS', 'index_diIOS', '首页底部广告位IOS', '1');
INSERT INTO `slide_cat` VALUES ('8', '游戏列表IOS中部广告位H5', 'active_ios2', '游戏列表IOS中部广告位H5', '1');
INSERT INTO `slide_cat` VALUES ('9', '活动页banner', 'active_banner', '活动页banner', '1');
INSERT INTO `slide_cat` VALUES ('10', '游戏列表Android中部广告位客户端', 'index_gameindex2', '游戏列表Android中部广告位客户端', '1');
INSERT INTO `slide_cat` VALUES ('11', '游戏列表IOS中部广告位客户端', 'idnex_gameindex4', '游戏列表IOS中部广告位客户端', '1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `age` int(11) unsigned DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('5', 'tangmeicun', '11', '13913297253', 'abc', ' 噶个啊 啊个', '2017-12-18 14:22:00');
INSERT INTO `student` VALUES ('28', '还挺热', null, '', '', '', '2017-12-18 14:21:40');
INSERT INTO `student` VALUES ('29', 'bbb', null, '', '', '', '2017-12-14 00:00:00');
INSERT INTO `student` VALUES ('30', ' 个问题', null, '', '', '', '2017-12-18 14:21:29');
INSERT INTO `student` VALUES ('31', ' 高铁', null, '', '', '', '2017-12-18 14:21:22');
INSERT INTO `student` VALUES ('32', '个回事', null, '', '', '', '2017-12-18 14:21:16');
INSERT INTO `student` VALUES ('33', '就有人特', null, '', '', '', '2017-12-18 14:21:11');
INSERT INTO `student` VALUES ('36', '金裕陶人', null, '13913297253', '发射', '发', '2017-12-18 14:20:58');
INSERT INTO `student` VALUES ('37', '金凤凰', '23', '', '', '', '2017-12-18 14:20:43');
INSERT INTO `student` VALUES ('40', '大风', null, '', '', '', '2017-12-18 14:20:29');
INSERT INTO `student` VALUES ('41', '安丰', null, '', '', '', '2017-12-18 14:20:34');
INSERT INTO `student` VALUES ('46', '阿斯顿', '33', '13913297253', '相城产业园', '备注信息：afds', '2017-12-18 00:00:00');
INSERT INTO `student` VALUES ('47', '富士达213', null, '', 'fasd', 'fsda ', '2017-12-18 00:00:00');
INSERT INTO `student` VALUES ('48', '唐美存', '11', '13913297253', '相城区ABC', '备注信息惺惺惜惺惺想', '2017-12-15 00:00:00');
INSERT INTO `student` VALUES ('49', '张三', '23', '13913297253', '相城文化产业园', '备注：张三', '2017-12-18 16:23:24');
