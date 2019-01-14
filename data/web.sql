/*
Navicat MySQL Data Transfer

Source Server         : 本地测试
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : weblog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-01-14 11:08:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符，不填写数值',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1可用0不可用',
  `last_login_time` datetime NOT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '0' COMMENT '上次登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('6', 'root', 'e10adc3949ba59abbe56e057f20f883e', '1', '2019-01-14 10:41:26', '0.0.0.0', '3', '2018-12-25 14:23:39');

-- ----------------------------
-- Table structure for `admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `useragent` varchar(255) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES ('1', 'yy', 'ss', '193.212.122.112', null, null, null, null, null, null);
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/index/login.html', 'POST', 'html', null, '成功登录系统', '2019-01-11 08:53:04');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/weblog/delete', 'POST', 'html', null, '删除文章', '2019-01-11 08:53:42');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/message/delete', 'POST', 'html', null, '删除留言', '2019-01-11 08:54:09');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/message/delete', 'POST', 'html', null, '删除留言', '2019-01-11 08:54:15');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/index/siteinfo.html', 'POST', 'xml', null, '修改网站信息', '2019-01-11 08:56:21');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/index/login.html', 'POST', 'html', '{\"data\":\"{\\\"username\\\":\\\"root\\\",\\\"password\\\":\\\"123456\\\"}\"}', '成功登录系统', '2019-01-11 09:52:56');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/index/login.html', 'POST', 'html', '{\"data\":\"{\\\"username\\\":\\\"root\\\",\\\"password\\\":\\\"123456\\\"}\"}', '成功登录系统', '2019-01-14 08:59:23');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/index/login.html', 'POST', 'html', '{\"data\":\"{\\\"username\\\":\\\"root\\\",\\\"password\\\":\\\"123456\\\"}\"}', '成功登录系统', '2019-01-14 09:36:35');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/index/login.html', 'POST', 'html', '{\"data\":\"{\\\"username\\\":\\\"root\\\",\\\"password\\\":\\\"123456\\\"}\"}', '成功登录系统', '2019-01-14 10:08:17');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/index/login.html', 'POST', 'html', '{\"data\":\"{\\\"username\\\":\\\"root\\\",\\\"password\\\":\\\"123456\\\"}\"}', '成功登录系统', '2019-01-14 10:38:27');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/index/login.html', 'POST', 'html', '{\"data\":\"{\\\"username\\\":\\\"root\\\",\\\"password\\\":\\\"123456\\\"}\"}', '成功登录系统', '2019-01-14 10:40:10');
INSERT INTO `admin_log` VALUES ('6', 'root', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '0.0.0.0', 'http://localhost:8085/web/public/index.php/admin/index/login.html', 'POST', 'html', '{\"data\":\"{\\\"username\\\":\\\"root\\\",\\\"password\\\":\\\"123456\\\"}\"}', '成功登录系统', '2019-01-14 10:41:26');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weblog_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '2', 'asdasd', 'asddas@qq.com', 'asdasd', '2019-01-10 10:30:55');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '喜羊羊', '1213@qw.com', '666', '2018-12-17 16:13:08');
INSERT INTO `message` VALUES ('2', 'hello', '1122@qqs.com', '3Q', '2019-01-09 08:52:58');

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级标签ID',
  `tag_name` varchar(255) NOT NULL COMMENT '类别',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '0', 'web', null, '2018-12-14 14:00:30');
INSERT INTO `tags` VALUES ('2', '0', 'html', null, '2018-12-14 14:00:44');
INSERT INTO `tags` VALUES ('3', '0', 'js', null, '2018-12-14 14:00:52');
INSERT INTO `tags` VALUES ('4', '0', 'css', null, '2018-12-14 14:00:55');
INSERT INTO `tags` VALUES ('5', '0', 'php', null, '2018-12-14 14:00:59');

-- ----------------------------
-- Table structure for `user_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `ip` varchar(16) NOT NULL,
  `useragent` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_log
-- ----------------------------
INSERT INTO `user_log` VALUES ('0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', 'http://localhost:8085/web/public/index.php', 'xml', 'GET', '2019-01-10 15:39:50');
INSERT INTO `user_log` VALUES ('0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', 'http://localhost:8085/web/public/index.php', 'xml', 'GET', '2019-01-10 15:41:01');
INSERT INTO `user_log` VALUES ('0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', 'http://localhost:8085/web/public/index.php', 'xml', 'GET', '2019-01-10 15:42:42');
INSERT INTO `user_log` VALUES ('0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', 'http://localhost:8085/web/public/index.php/', 'xml', 'GET', '2019-01-11 08:56:50');

-- ----------------------------
-- Table structure for `weblog`
-- ----------------------------
DROP TABLE IF EXISTS `weblog`;
CREATE TABLE `weblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 NOT NULL,
  `author` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `click_count` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weblog
-- ----------------------------
INSERT INTO `weblog` VALUES ('2', '我的测试', '2', '我的测试', '旅途', '1', '0', '2018-12-13 00:00:00', null);
INSERT INTO `weblog` VALUES ('3', '请求', '2', '去去去', '请求', '1', '0', '2018-12-14 15:08:42', null);
INSERT INTO `weblog` VALUES ('6', '12312', '2', '123', '123', '0', '0', '2018-12-14 16:10:38', null);
INSERT INTO `weblog` VALUES ('7', '12312', '3', '123', '123', '0', '0', '2018-12-14 16:10:45', null);
INSERT INTO `weblog` VALUES ('8', '12312', '2', '123', '123', '1', '0', '2018-12-14 16:10:54', null);
INSERT INTO `weblog` VALUES ('12', '标题', '1', '<p>内容</p>', '作者', '0', '0', '2018-12-20 16:56:25', null);
INSERT INTO `weblog` VALUES ('13', '1', '1', '<p>内容</p>', '1', '1', '0', '2018-12-20 16:59:09', null);
INSERT INTO `weblog` VALUES ('14', '1', '1', '<p>111</p>', '11', '1', '0', '2018-12-20 17:00:22', null);
INSERT INTO `weblog` VALUES ('15', '11', '1', '<p>111asdasd</p>', '11', '1', '0', '2018-12-20 17:00:59', null);
INSERT INTO `weblog` VALUES ('17', '11', '1', '<p>111asdg撒的&nbsp; 是啊</p>', '11', '1', '0', '2018-12-21 10:55:48', null);
INSERT INTO `weblog` VALUES ('18', 'aa', '1', '<p>这里有一个公园，在这盛夏时分真是美丽极了，花花草草，树荫缭绕。每天公园里都会有看看往往的人们，他们有的健步如飞，有的呆坐沉思，有的也悠闲的散步。</p><p><br/></p><p>这是一个人们喜欢的公园，因为这里美丽欢乐，气候宜人。宽敞的广场可以供人们娱乐，林间小道也可以满足情侣的浪漫，溪流湖泊让这里变得快乐，何况还时不时听到一些动物的叫声，甚至有时还会看到兔子飞奔。</p><p><br/></p><p>愚蠢的人儿就这样无聊的晃荡在这个公园里，整天无所事事不求上进的。可是我们可不能这个样子，生活压的喘不过气，我们那有这样的闲工夫。我们生活在这个公园里，大我记事起就是这个样子了，可能是上帝的完美安排吧。</p><p><br/></p><p>我是一只小兔子，这个美丽的公园里还有一只小山羊，一只小猪，两只小狗，一只小喜鹊，一只小狐狸。我每天都要去采摘野果，我很厉害，每天都可以采摘一大袋子野果，后每个伙伴分享了;小山羊要种蔬菜，小猪要帮我寻找野果，小狗要负责抓捕老鼠等动物，小喜鹊每天就是叽叽喳喳的。小狐狸可是我们的最高领导了，他整天早出晚归的，有时还会带上小喜鹊和小狗，我可不知道他干些什么。我们的生活非常完善，聪明的我根本不用小猪的帮忙就采摘了很多的野果，而且我还经常会在草丛中睡觉?。小山羊也非常勤劳，每次路过菜园子看他都在忙碌，好像一个小小的菜园就占据了他所有的才华。小喜鹊和我也不熟，看他一天是非常开心幸福。小猪一天应该很不错吧，时不时给小狐狸递上一个野果，有时也会和小狗一起给狐狸送一些肉类。就这样，我一天也算自在，忙碌的小猪小狗狐狸和喜鹊我才懒得管他们呢?</p><p><br/></p><p>幸福的日子总是短暂的，如此美丽的公园里怎么只会养育着一群小动物，他们还想辉煌的生活。小狐狸想要一个办公场所，让我们的生活更上一层楼，跟班的小狗一口就答应了，小猪成为了负责者，小喜鹊也要负责设计布局，事情就这样定下来了。</p><p><br/></p><p>小喜鹊通知了小山羊，让他负责搬运材料，小山羊一口就答应了。小猪咣咣当当的去找我，在一个草丛里遇见了我，他给我说了修办公的事，让我负责搭建。都安排妥当了，就各司其职行动起来吧，我看见小山羊已经开始行动了。</p><p><br/></p><p>晚上，小狐狸批评了我，因为睡觉的事，他说从前就听小猪说你的问题，目中无人，我想着给你点时间会改的，你这是品质问题，希望搭建办公这个事你能给弄好。第二天，我们就各司其职开始行动了，小喜鹊把设计图纸给了我让我照着做。哇，如何下手，这是画画啊，一团糟糕，毫无依据啊，不管怎样得把建筑弄好啊。我决定照着样子做，只是根基和结构得更加稳固些。我去了场所，看着有些许的材料，小山羊还在搬运，我微微一笑也去帮忙了。没几天，就盖好了一切。小狗带着小喜鹊前来验收，小喜鹊看了建筑后吃惊的说这好像有点不一样啊。“什么，这竟然和你设计的不一样，小兔子，看你乖巧老实的竟然敢真的胆大包天啊”，小狗愤怒的说到。我只好一言不发，这冷漠真让人愤怒，愤怒变成了咆哮，咆哮让人看起来像争吵。终于小狐狸派小猪通知我过去，咆哮变成了批斗，我的睡觉，我的胆大，我的自我全部足以表现我的丑陋。真是漂亮的批斗，我竟毫无反抗的头绪，我沉默的走了。</p><p><br/></p><p>我走了，彻底的走了，看着牢固而崭新的建筑，看着色彩斑斓的野果，我还是离开了公园，离开了这个每天都走着一些傻不拉几动物的公园。</p><p><br/></p><p>后来，我被一个好人家捡到了，他们给我洗漱，穿衣服，还吃最好的食物，看着肥硕的四只，我真是困惑，如此美好的生活怎么还会让我这么忧愁呢?我又走了，偷偷的走了，我害怕他们不让我走，我来到了一座大山里。这个真是恐怖至极，有迅速的狼狗，有矫健的老鹰，我艰难的爬上了山顶，真是疲惫不堪啊。在一块岩石底下我安心的睡着了，永远的睡着了。</p><p><br/></p>', 'aaa', '1', '0', '2019-01-05 15:55:25', null);
