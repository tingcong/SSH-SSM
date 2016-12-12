/*
Navicat MySQL Data Transfer

Source Server         : users
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : rbac

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2016-11-29 10:18:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbk
-- ----------------------------
DROP TABLE IF EXISTS `bbk`;
CREATE TABLE `bbk` (
  `ordNum` int(30) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `borrowTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ordNum`)
) ENGINE=InnoDB AUTO_INCREMENT=113453 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbk
-- ----------------------------
INSERT INTO `bbk` VALUES ('113435', '2', '三国演义', '2016-10-23 21:05:36');
INSERT INTO `bbk` VALUES ('113436', '1', 'WWWW', '2016-10-23 21:43:28');
INSERT INTO `bbk` VALUES ('113437', '5', 'AA', '2016-11-08 14:21:35');
INSERT INTO `bbk` VALUES ('113438', '1', 'WWWW', '2016-11-08 14:35:47');
INSERT INTO `bbk` VALUES ('113439', '1', 'WWWW', '2016-11-08 14:41:10');
INSERT INTO `bbk` VALUES ('113440', '5', 'AA', '2016-11-09 09:53:40');
INSERT INTO `bbk` VALUES ('113441', '5', 'AA', '2016-11-09 14:44:39');
INSERT INTO `bbk` VALUES ('113442', '9', 'EE', '2016-11-09 14:48:17');
INSERT INTO `bbk` VALUES ('113443', '9', 'EE', '2016-11-09 14:48:27');
INSERT INTO `bbk` VALUES ('113444', '9', 'EE', '2016-11-09 14:48:30');
INSERT INTO `bbk` VALUES ('113445', '9', 'EE', '2016-11-09 14:48:32');
INSERT INTO `bbk` VALUES ('113446', '9', 'EE', '2016-11-09 14:48:36');
INSERT INTO `bbk` VALUES ('113447', '9', 'EE', '2016-11-09 14:48:39');
INSERT INTO `bbk` VALUES ('113448', '8', 'DD', '2016-11-09 14:48:41');
INSERT INTO `bbk` VALUES ('113449', '9', 'EE', '2016-11-09 14:48:45');
INSERT INTO `bbk` VALUES ('113450', '9', 'EE', '2016-11-09 14:48:47');
INSERT INTO `bbk` VALUES ('113451', '9', 'EE', '2016-11-09 14:48:50');
INSERT INTO `bbk` VALUES ('113452', '9', 'EE', '2016-11-09 14:48:52');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `price` double(10,3) NOT NULL,
  `pdate` date DEFAULT NULL,
  `genre` varchar(20) DEFAULT '计算机',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'WWWW', 'R4', '41', '20', '50.000', '2016-10-05', '影视');
INSERT INTO `book` VALUES ('2', '三国演义', 'A02', '18', '50', '30.000', '2016-10-06', '文学类');
INSERT INTO `book` VALUES ('4', '红楼梦', 'A04', '15', '50', '55.200', '2016-10-05', '文学类');
INSERT INTO `book` VALUES ('5', 'AA', 'L4', '-3', '50', '20.300', '2016-10-04', '计算机技术');
INSERT INTO `book` VALUES ('8', 'DD', 'W2', '24', '50', '20.600', '2016-10-18', '期刊 ');
INSERT INTO `book` VALUES ('9', 'EE', 'E8', '-1', '50', '61.000', '2016-10-17', '法律类');
INSERT INTO `book` VALUES ('10', 'DD', 'D89', '16', '50', '28.990', '2016-10-18', '军事类');
INSERT INTO `book` VALUES ('11', 'FF', 'T5', '13', '50', '35.500', '2016-10-04', '军事类');
INSERT INTO `book` VALUES ('12', 'YYY', 'E96', '36', '50', '36.660', '2016-10-11', '数理化学');
INSERT INTO `book` VALUES ('13', 'QQQ', 'Q9', '25', '50', '38.230', '2016-10-17', '数理化学');
INSERT INTO `book` VALUES ('14', 'YW', 'W8', '6', '50', '26.320', '2016-10-24', '数理化学');
INSERT INTO `book` VALUES ('333', 'asd', '3222', '234', '234', '234.000', null, '计算机');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `iconSkin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '菜单管理', '0', null, null);
INSERT INTO `menu` VALUES ('2', '用户管理', '1', 'home/getur', null);
INSERT INTO `menu` VALUES ('3', '图书管理', '1', 'home/blist', null);
INSERT INTO `menu` VALUES ('4', '增加', '2', 'home/info', null);
INSERT INTO `menu` VALUES ('5', '增加', '3', 'home/bblist', null);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `pubdate` datetime NOT NULL,
  `publisher` varchar(50) NOT NULL COMMENT '发布者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '哈哈哈', '<p><img title=\"1477193308360008971.jpg\" alt=\"3.jpg\" src=\"/rbac1/ueditor/jsp/upload/image/20161023/1477193308360008971.jpg\"/><img title=\"1477074787977033719.jpg\" alt=\"1.jpg\" src=\"d://java//ueimg//rbac1ueditor/jsp/upload/image/20161022/1477074787977033719.jpg\"/><img src=\"http://img.baidu.com/hi/jx2/j_0005.gif\"/>人然而<img src=\"http://img.baidu.com/hi/jx2/j_0014.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0048.gif\"/><img title=\"1477074792767016632.jpg\" alt=\"3.jpg\" src=\"d://java//ueimg//rbac1ueditor/jsp/upload/image/20161022/1477074792767016632.jpg\"/><img src=\"http://img.baidu.com/hi/jx2/j_0046.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0025.gif\"/><img title=\"1477074797447076579.jpg\" alt=\"2.jpg\" src=\"d://java//ueimg//rbac1ueditor/jsp/upload/image/20161022/1477074797447076579.jpg\"/>1</p>', '2016-10-20 21:57:30', '管理员');
INSERT INTO `notice` VALUES ('2', '标题1', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0025.gif\"/>发热</p>', '2016-10-20 23:41:03', '管理员');
INSERT INTO `notice` VALUES ('3', '标题2222', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0026.gif\"/> 人</p>', '2016-10-20 23:41:21', '管理员');
INSERT INTO `notice` VALUES ('15', '标题。。。。。。。。', '<p><img src=\"/rbac1/ueditor/jsp/upload/image/20161022/1477075582569077004.jpg\" title=\"1477075582569077004.jpg\" alt=\"1.jpg\" width=\"190\" height=\"194\"/> &nbsp;<img src=\"http://img.baidu.com/hi/youa/y_0037.gif\"/></p>', '2016-10-22 02:46:25', '');
INSERT INTO `notice` VALUES ('16', '一个附件。。', '<p style=\"line-height: 16px;\"><img src=\"http://han:8080/rbac1/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/ueditor/jsp/upload/file/20161022/1477076011692036381.rar\" title=\"ace.rar\">ace.rar</a></p><p style=\"line-height: 16px;\"><img src=\"http://han:8080/rbac1/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/ueditor/jsp/upload/file/20161022/1477076011717079701.zip\" title=\"FrontWeb.zip\">FrontWeb.zip</a></p><p><br/></p>', '2016-10-22 02:51:08', '');
INSERT INTO `notice` VALUES ('17', '1111', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/></p>', '2016-10-22 19:54:34', '');
INSERT INTO `notice` VALUES ('18', '111', '<p>22<img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0039.gif\"/></p>', '2016-10-23 01:02:06', '');
INSERT INTO `notice` VALUES ('19', '哈哈哈', '<p><img src=\"/rbac1/ueditor/jsp/upload/image/20161023/1477193308360008971.jpg\" title=\"1477193308360008971.jpg\" alt=\"3.jpg\"/><img src=\"d://java//ueimg//rbac1ueditor/jsp/upload/image/20161022/1477074787977033719.jpg\" title=\"1477074787977033719.jpg\" alt=\"1.jpg\"/><img src=\"http://img.baidu.com/hi/jx2/j_0005.gif\"/>人然而<img src=\"http://img.baidu.com/hi/jx2/j_0014.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0048.gif\"/><img src=\"d://java//ueimg//rbac1ueditor/jsp/upload/image/20161022/1477074792767016632.jpg\" title=\"1477074792767016632.jpg\" alt=\"3.jpg\"/><img src=\"http://img.baidu.com/hi/jx2/j_0046.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0025.gif\"/><img src=\"d://java//ueimg//rbac1ueditor/jsp/upload/image/20161022/1477074797447076579.jpg\" title=\"1477074797447076579.jpg\" alt=\"2.jpg\"/>1</p>', '2016-10-23 11:42:35', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pms_id` int(11) NOT NULL,
  `pms_name` varchar(255) NOT NULL,
  `pms_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '用户管理', '用户管理');
INSERT INTO `permission` VALUES ('2', '角色管理', '角色管理');
INSERT INTO `permission` VALUES ('3', '权限管理', '权限管理');
INSERT INTO `permission` VALUES ('4', '图书管理', '');
INSERT INTO `permission` VALUES ('5', '图书借阅', null);
INSERT INTO `permission` VALUES ('6', '图书浏览', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `role_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '管理所有');
INSERT INTO `role` VALUES ('2', '普通用户', '最多可借书10本');
INSERT INTO `role` VALUES ('3', '经理', '管理图书，普通用户');
INSERT INTO `role` VALUES ('4', '高级用户', '最多可借书100本');
INSERT INTO `role` VALUES ('5', '游客', '浏览网站');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL,
  `pms_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '3', '3');
INSERT INTO `role_permission` VALUES ('2', '5', '4');
INSERT INTO `role_permission` VALUES ('3', '5', '7');
INSERT INTO `role_permission` VALUES ('4', '5', '9');
INSERT INTO `role_permission` VALUES ('1', '4', '12');
INSERT INTO `role_permission` VALUES ('1', '5', '13');
INSERT INTO `role_permission` VALUES ('1', '6', '14');
INSERT INTO `role_permission` VALUES ('2', '6', '21');
INSERT INTO `role_permission` VALUES ('3', '6', '22');
INSERT INTO `role_permission` VALUES ('4', '6', '24');
INSERT INTO `role_permission` VALUES ('5', '6', '25');
INSERT INTO `role_permission` VALUES ('1', '1', '30');
INSERT INTO `role_permission` VALUES ('1', '2', '31');
INSERT INTO `role_permission` VALUES ('2', '1', '32');
INSERT INTO `role_permission` VALUES ('2', '3', '33');
INSERT INTO `role_permission` VALUES ('2', '2', '34');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `user_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '李四', '222', '暂无描述2');
INSERT INTO `user` VALUES ('3', '王五', '333', '暂无描述');
INSERT INTO `user` VALUES ('4', '哈哈', '1', '暂无描述');
INSERT INTO `user` VALUES ('6', '鹅鹅', '呃呃呃', '暂无描述');
INSERT INTO `user` VALUES ('12', '1', '1', '暂无描述');
INSERT INTO `user` VALUES ('55', '55', '55', '55');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('2', '1');
INSERT INTO `user_role` VALUES ('3', '4');
INSERT INTO `user_role` VALUES ('4', '3');
INSERT INTO `user_role` VALUES ('6', '2');
INSERT INTO `user_role` VALUES ('12', '2');
INSERT INTO `user_role` VALUES ('55', '1');

-- ----------------------------
-- Table structure for xbook
-- ----------------------------
DROP TABLE IF EXISTS `xbook`;
CREATE TABLE `xbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `auther` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xbook
-- ----------------------------
INSERT INTO `xbook` VALUES ('1', '1', 'wwww', 'ww', 'www');
INSERT INTO `xbook` VALUES ('2', '2', '三国演义', '人', '《三国演义》，中国古典四大名著之首，清代作家曹雪芹创作的章回体长篇小说[1]  ，又名《石头记》《金玉缘》。此书分为120回“程本”和80回“脂本”两种版本系统。新版通行本前80回据脂本汇校，后40回据程本汇校，署名“曹雪芹著，无名氏续，程伟元、高鹗整理”[2]  。后40回作者尚有争议，但是对于矮化甚至腰斩后40回的极端倾向也应保持警惕。');
INSERT INTO `xbook` VALUES ('3', '4', '红楼梦', '啊', '《红楼梦》，中国古典四大名著之首，清代作家曹雪芹创作的章回体长篇小说[1]  ，又名《石头记》《金玉缘》。此书分为120回“程本”和80回“脂本”两种版本系统。新版通行本前80回据脂本汇校，后40回据程本汇校，署名“曹雪芹著，无名氏续，程伟元、高鹗整理”[2]  。后40回作者尚有争议，但是对于矮化甚至腰斩后40回的极端倾向也应保持警惕。');
INSERT INTO `xbook` VALUES ('4', '8', 'DD', '2', null);
INSERT INTO `xbook` VALUES ('5', '5', 'AA', '323', '23');
INSERT INTO `xbook` VALUES ('6', '9', 'EE', '打算', '水水');
INSERT INTO `xbook` VALUES ('7', '10', 'DD', '啊啊啊啊啊', '啊啊');
INSERT INTO `xbook` VALUES ('8', '11', 'FF', '啊', '啊');
DROP TRIGGER IF EXISTS `tg1`;
DELIMITER ;;
CREATE TRIGGER `tg1` AFTER INSERT ON `bbk` FOR EACH ROW begin

	UPDATE book SET amount=(amount-1) WHERE id=new.id;
	end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tg2`;
DELIMITER ;;
CREATE TRIGGER `tg2` AFTER DELETE ON `bbk` FOR EACH ROW begin
update book set  amount=amount+1 where id=old.id;
end
;;
DELIMITER ;
