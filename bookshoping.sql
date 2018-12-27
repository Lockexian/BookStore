/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : bookshoping

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-12-26 23:20:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` varchar(255) NOT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `adminname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'password', 'manager');

-- ----------------------------
-- Table structure for basket
-- ----------------------------
DROP TABLE IF EXISTS `basket`;
CREATE TABLE `basket` (
  `userid` varchar(255) NOT NULL,
  `bookid` varchar(255) DEFAULT NULL,
  `ordercount` varchar(255) DEFAULT NULL,
  `addtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basket
-- ----------------------------

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookid` int(11) NOT NULL,
  `typeid` int(11) DEFAULT NULL,
  `bookname` varchar(255) DEFAULT NULL,
  `ISBN` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publishdata` varchar(255) DEFAULT NULL,
  `pagenum` int(11) DEFAULT NULL,
  `saleprice` decimal(10,0) DEFAULT NULL,
  `storeprice` decimal(10,0) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `buycount` int(11) DEFAULT NULL,
  `storecount` int(11) DEFAULT NULL,
  `imagefile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', '2', '三国演义', '9787504752086', '(CHISO)', '罗贯中', '1985', '690', '150', '140', '字数: 260000\r\n正文语种: 汉语', '461', '5', 'bookimages/100001.jpg');
INSERT INTO `books` VALUES ('2', '2', '红楼梦', '9787544545495', '作家出版社', '曹雪芹', '1985', '1211', '169', '155', '原名《石头记》', '673', '6', 'bookimages/100002.jpg');
INSERT INTO `books` VALUES ('3', '2', '西游记', '9787802204423 ', '中国画报出版社', '吴承恩', ' 2012', '852', '145', '145', '根据历史真实故事改编', '433', '7', 'bookimages/100003.jpg');
INSERT INTO `books` VALUES ('4', '2', '水浒传', ' 9787806042465', '长春出版社', '施耐庵', '2001-03', '1244', '150', '145', '原版本', '64', '2', 'bookimages/100004.jpg');
INSERT INTO `books` VALUES ('5', '1', '三体', '9787201108926', '天津人民出版社', '詹琰 路姜波', ' 2016-11', '196', '78', '50', '平装', '2', '9', 'bookimages/100005.jpg');
INSERT INTO `books` VALUES ('6', '1', '老人与海', '9787532777983', '上海译文', '海明威', '2018-06', '196', '87', '65', '译本', '124', '5', 'bookimages/100006.jpg');
INSERT INTO `books` VALUES ('7', '4', '孤独深处', '9787568253703', '北京理工大学', '老舍', ' 2018-05', '285', '81', '73', '平装', '213', '4', 'bookimages/100007.jpg');
INSERT INTO `books` VALUES ('8', '1', '摆渡人', '9787550724112', '海天出版社', '徐扬生', '2018-06', '264', '68', '61', '平装', '31', '3', 'bookimages/100008.jpg');
INSERT INTO `books` VALUES ('9', '2', '平凡的世界', '9787510650437', '现代教育', '常汝吉', '2017-04 ', '506', '50', '43', '平装', '314', '2', 'bookimages/100009.jpg');
INSERT INTO `books` VALUES ('10', '2', '百年孤独', '9787544251891', ' 南海出版', '加西亚', '2012-01', '452', '95', '90', '平装', '123', '4', 'bookimages/100010.jpg');
INSERT INTO `books` VALUES ('11', '1', '冰与火之歌', '9787229056797', '重庆出版社', '乔治', ' 2012-09', '304', '34', '21', '平装', '211', '3', 'bookimages/100011.jpg');
INSERT INTO `books` VALUES ('12', '14', '毛泽东选集', '？', '中国人民解放军', '中国人民解放军', '1967', '1545', '150', '150', '原版', '331', '16', 'bookimages/100012.jpg');
INSERT INTO `books` VALUES ('13', '3', '李开复自传', '？', '中信出版社', '李开复', ' 2009-09', '334', '25', '25', '原版', '89', '20', 'bookimages/100013.jpg');
INSERT INTO `books` VALUES ('14', '14', '毛泽东文集', '？', '人民出版社', '毛泽东', '1996-06', '32', '109', '99', '原版', '94', '15', 'bookimages/100014.jpg');
INSERT INTO `books` VALUES ('15', '3', '梵高传', '7200005843', '北京出版社', '欧文·斯通', ' 1983-10', '554', '32', '22', '精装', '63', '16', 'bookimages/100015.jpg');
INSERT INTO `books` VALUES ('16', '3', '李嘉诚传', '9787512508958', '国际文化', '李忠海', '2016-12', '281', '40', '24', '全新', '213', '2', 'bookimages/100016.jpg');
INSERT INTO `books` VALUES ('17', '3', '这就是马云', '9787213064838', '浙江人民', '陈伟', '2015-01', '284', '45', '35', '九品', '24', '5', 'bookimages/100017.jpg');
INSERT INTO `books` VALUES ('18', '3', '普京传', '9787300236902', '中国人民', '弗拉基米尔', '2017-03', '248', '27', '17', '全新', '21', '4', 'bookimages/100018.jpg');
INSERT INTO `books` VALUES ('19', '3', '邓小平传', '？', '解放军', '巴拉奇', '1988-05', '259', '70', '65', '国际版', '241', '4', 'bookimages/100019.jpg');
INSERT INTO `books` VALUES ('20', '3', '希特勒传', '9787501254439', ' 世界知识', '伊恩·克肖', '2018-01', '704', '128', '84', '全新', '214', '2', 'bookimages/100020.jpg');
INSERT INTO `books` VALUES ('21', '3', '我的一生', '9787506098816', '东方', '？', '2018-01', '826', '59', '54', '九品', '124', '4', 'bookimages/100021.jpg');
INSERT INTO `books` VALUES ('22', '3', '曼德拉传', '9787535490322', '  长江文艺', '安东尼', '2016-11', '400', '45', '31', '轻型纸', '21', '5', 'bookimages/100022.jpg');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `typeid` int(11) NOT NULL,
  `typename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '小说');
INSERT INTO `booktype` VALUES ('2', '文学');
INSERT INTO `booktype` VALUES ('3', '传记');
INSERT INTO `booktype` VALUES ('4', '青春文学');
INSERT INTO `booktype` VALUES ('5', '动漫');
INSERT INTO `booktype` VALUES ('6', '艺术');
INSERT INTO `booktype` VALUES ('7', '摄影');
INSERT INTO `booktype` VALUES ('8', '书法');
INSERT INTO `booktype` VALUES ('9', '音乐');
INSERT INTO `booktype` VALUES ('10', '绘画');
INSERT INTO `booktype` VALUES ('11', '偶像');
INSERT INTO `booktype` VALUES ('12', '宗教哲学');
INSERT INTO `booktype` VALUES ('13', '历史');
INSERT INTO `booktype` VALUES ('14', '政治军事');
INSERT INTO `booktype` VALUES ('15', '文化');
INSERT INTO `booktype` VALUES ('16', '社会科学');
INSERT INTO `booktype` VALUES ('17', '心理学');
INSERT INTO `booktype` VALUES ('18', '古籍');
INSERT INTO `booktype` VALUES ('19', '法律');
INSERT INTO `booktype` VALUES ('20', '中国儿童文学');
INSERT INTO `booktype` VALUES ('21', '外国儿童文学');
INSERT INTO `booktype` VALUES ('22', '政治军事');
INSERT INTO `booktype` VALUES ('23', '精装图书');
INSERT INTO `booktype` VALUES ('24', '平装图书');
INSERT INTO `booktype` VALUES ('25', '科普百科');
INSERT INTO `booktype` VALUES ('26', '婴儿读物');
INSERT INTO `booktype` VALUES ('27', '幼儿启蒙');
INSERT INTO `booktype` VALUES ('28', '益智游戏');
INSERT INTO `booktype` VALUES ('29', '玩具书');

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `ordernumber` varchar(255) NOT NULL,
  `bookid` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `ordertime` varchar(255) DEFAULT NULL,
  `orderstate` varchar(255) DEFAULT NULL,
  `ordercount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ordernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` varchar(255) NOT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '000000', '000000', '男', '东土大唐', '29178@163.com', '00000000000');
