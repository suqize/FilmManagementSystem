/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : film
Target Host     : localhost:3306
Target Database : film
Date: 2022-11-20 14:16:02
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for film
-- ----------------------------
DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `film_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(25) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `other` varchar(300) DEFAULT NULL,
  `ico` varchar(50) DEFAULT NULL,
  `mp4` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`film_id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES ('1', '人事管理系统登录页面 和另外 6 个页面 - 个人 - Microsoft​ Edge 2022-04-20 13-22-20', 'css', '2022.11.15', '人事管理系统登录页面 和另外 6 个页面 - 个人:有关人事管理系统的介绍', '/resources/ico/1.png', '/resources/mp4/人事管理系统登录页面和另外6个页面.mp4');
INSERT INTO `film` VALUES ('2', '四则运算', '陈姗姗', '2022-11-16', '测试', '/resources/ico/error.png', '\\resources\\mp4\\四则运算.mp4');
INSERT INTO `film` VALUES ('3', '演示视频', '甄纪元', '2022-11-24', '测试2', '/resources/ico/error.png', '/resources/mp4/演示视频.mp4');
INSERT INTO `film` VALUES ('4028abf48486744b018486744d2d0000', '测试影片2', '苏启哲2', '2022.10.20', '备注2', 'no2', 'no2');
INSERT INTO `film` VALUES ('4028abf4848676af01848676b0a10000', '测试影片2', '苏启哲2', '2022.10.20', '备注2', 'no2', 'no2');
INSERT INTO `film` VALUES ('4028abf484867a780184867a7a530000', '测试影片2', '苏启哲2', '2022.10.20', '备注2', 'no2', 'no2');
INSERT INTO `film` VALUES ('733', '测试影片', '苏启哲', '2022.10.20', '备注', 'no', 'no');

-- ----------------------------
-- Table structure for filmtotype
-- ----------------------------
DROP TABLE IF EXISTS `filmtotype`;
CREATE TABLE `filmtotype` (
  `id_film` varchar(255) NOT NULL,
  `id_type` int NOT NULL,
  KEY `film_id` (`id_film`),
  KEY `type_id` (`id_type`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of filmtotype
-- ----------------------------
INSERT INTO `filmtotype` VALUES ('1', '1');
INSERT INTO `filmtotype` VALUES ('733', '4');
INSERT INTO `filmtotype` VALUES ('733', '5');
INSERT INTO `filmtotype` VALUES ('733', '4');
INSERT INTO `filmtotype` VALUES ('4028abf48486744b018486744d2d0000', '0');
INSERT INTO `filmtotype` VALUES ('4028abf4848676af01848676b0a10000', '0');
INSERT INTO `filmtotype` VALUES ('4028abf484867a780184867a7a530000', '11');
INSERT INTO `filmtotype` VALUES ('4028abf484867a780184867a7a530000', '12');

-- ----------------------------
-- Table structure for filmtype
-- ----------------------------
DROP TABLE IF EXISTS `filmtype`;
CREATE TABLE `filmtype` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13;

-- ----------------------------
-- Records of filmtype
-- ----------------------------
INSERT INTO `filmtype` VALUES ('1', '动作片');
INSERT INTO `filmtype` VALUES ('3', '剧情片');
INSERT INTO `filmtype` VALUES ('4', '爱情片');
INSERT INTO `filmtype` VALUES ('5', '悬疑片');
INSERT INTO `filmtype` VALUES ('9', '爱情片');
INSERT INTO `filmtype` VALUES ('10', '爱情片');
INSERT INTO `filmtype` VALUES ('11', '爱情片');
INSERT INTO `filmtype` VALUES ('12', '悬疑片');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` varchar(20) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `context` varchar(5000) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `publisher` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('20221115_001', '测试样例1', '这是一条新闻内容', '2022-11-16', 'suqizhe');
INSERT INTO `news` VALUES ('20221115_002', '测试新闻1', '这是一条测试新闻', '2022-11-15', '甄纪元');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小红', '123456');
