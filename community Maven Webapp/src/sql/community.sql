/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50721
Source Host           : 127.0.0.1:3306
Source Database       : community

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-06-27 14:38:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '男', '信息学院');
INSERT INTO `admin` VALUES ('5', 'admin2', 'admin2', '女', '文传学院');
INSERT INTO `admin` VALUES ('7', 'admin3', '12345', '女', '信息学院');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `club_name` varchar(11) NOT NULL,
  `reason` tinytext NOT NULL,
  `apply_time` datetime NOT NULL,
  `check` tinyint(1) DEFAULT '-1' COMMENT '-1：待审核，0：未通过，1：通过',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('1', '20140202473', '游戏开发者协会', '非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常喜欢这个社团', '2018-05-02 00:50:02', '1');
INSERT INTO `apply` VALUES ('2', '20140202473', '互联网及交互设计协会', '我非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常喜欢这个社团', '2018-05-02 01:24:24', '0');
INSERT INTO `apply` VALUES ('3', '20140202473', '创客协会', '我非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常喜欢这个社团', '2018-05-02 01:27:41', '-1');
INSERT INTO `apply` VALUES ('4', '20140202473', 'BOBO街舞协会', '我非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常喜欢这个社团', '2018-05-02 01:29:41', '-1');
INSERT INTO `apply` VALUES ('5', '20140202474', '游戏开发者协会', '我非常非常非常非常非常非常非常非常非常非常非常非常非常喜欢这个社团，希望可以让我加入贵社！不胜感激！！！', '2018-05-02 06:59:57', '1');
INSERT INTO `apply` VALUES ('6', '20140202474', '游戏开发者协会', '我真的非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常喜欢这个社团', '2018-05-04 13:21:17', '-1');

-- ----------------------------
-- Table structure for build_apply
-- ----------------------------
DROP TABLE IF EXISTS `build_apply`;
CREATE TABLE `build_apply` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `apply_phone` bigint(20) NOT NULL,
  `introduce` text NOT NULL,
  `check` tinyint(1) DEFAULT '-1' COMMENT '-1：待审核，0：未通过，1：通过',
  `apply_time` datetime NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of build_apply
-- ----------------------------
INSERT INTO `build_apply` VALUES ('1', '日语协会', '语言文化类', '外语学院', '20140202473', '13133660953', '你想拥有第二外语？你想领略东海扶桑的神奇文化？对汉化组的龟速进度忍无可忍，又无可奈何？快来加入日语协会吧！这里有寿司制作活动！日协教你最正宗的寿司做法日语文化讲座！日协带你全面搜罗日本特色文化日语大讲堂！日协带你从零开始掌握日语更多精彩活动绝对不容错过！不论你是否有日语基础，只要你有激情就能加入我们！', '1', '2018-05-03 15:53:06');
INSERT INTO `build_apply` VALUES ('2', '日语协会', '语言文化类', '外语学院', '20140202474', '13133660954', '你想拥有第二外语？你想领略东海扶桑的神奇文化？对汉化组的龟速进度忍无可忍，又无可奈何？快来加入日语协会吧！这里有寿司制作活动！日协教你最正宗的寿司做法日语文化讲座！日协带你全面搜罗日本特色文化日语大讲堂！日协带你从零开始掌握日语更多精彩活动绝对不容错过！不论你是否有日语基础，只要你有激情就能加入我们！', '-1', '2018-05-04 12:50:04');
INSERT INTO `build_apply` VALUES ('3', '游戏协会', '实践类', '信息学院', '20140202474', '13133660954', '测试创建已存在的社团，字数限制用测试补齐\r\n测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测', '-1', '2018-05-04 12:56:31');

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL,
  `builder` varchar(255) NOT NULL,
  `phone` bigint(255) DEFAULT NULL,
  `introduce` mediumtext NOT NULL,
  `create_time` date NOT NULL,
  `num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES ('2', '游戏开发者协会', '实践类', '信息学院', '徐焕鑫', '18924639544', '游戏开发者协会，是将游戏开发爱好者聚集起来，进行学术交流和开发实践，通过交流、沟通、协作，进行创新创业的社团。当下，休闲小游戏开发的门槛较低，游戏开发也容易成为游戏爱好者，特别是计算机、软件技术专业学生进行创新、创业以及其他游戏竞赛活动的选择。近年来国内外很多出色的小游戏都是一些刚毕业或未毕业的小团队制作完成，在强调大众创业、万众创新的今天，游戏开发者协会应运而生。', '2018-03-05', '1');
INSERT INTO `community` VALUES ('56', '互联网及交互设计协会', '科技类', '信息学院', '章横', '15879255549', '互联网及交互设计协会成立的目的主要在于针对工业设计专业范畴内的交互设计方向进行专题研讨、交流和学习，通过活动的形式，组织起一批对交互设计感兴趣的同学，学习相关软件界面设计、网络设计、信息系统设计等一系列基本设计基础及技能，同时，向广大同学推广互联网，教授相对简单的电脑软件，共享软件教程及资源。\r\n由专业指导老师带领，对于低年级的同学，在初期进行交互设计方向的相关专题培训，后期针对具有基本设计技能的高年级同学，通过设计竞赛、设计实例等进行具体的、导向性的指导，帮助其在本科期间能够对交互设计方向有相对具体的了解和把握。\r\n', '2018-04-21', '0');
INSERT INTO `community` VALUES ('57', '创客协会', '实践类', '文传学院', '张子豪', '18720185146', '成立“创客协会”，旨在在校园内宣扬创新创业的理念，努力创造创新创业的环境和氛围。这是很有意义的，因为正如李克强总理所期待的那样，在就业形势依旧严峻的今天，大学生积极创新创业有利于扩大就业、增加国民收入、促进社会公平，另外，年轻人创新创业的过程，同时也是对精神世界和自身价值的追求过程，在此期间所形成的坚韧自立的优秀品格，无论是对个人还是对民族，都是一笔巨大的精神财富。\r\n我们有志于从自身做起，努力响应国家号召，为这960万平方公里上的“万众创新”“人人创新”贡献一份力量，成为年轻“创客”中的一员。\r\n创办理念：积极行动起来践行创新，让知识开花，让思想发光。\r\n', '2018-04-23', '0');
INSERT INTO `community` VALUES ('58', 'BOBO街舞协会', '艺术类', '文传学院', '吴炳', null, '站在这个全新的起点上，BOBO街舞协会以“团结 勤奋 谦虚 友爱”为宗旨，致力于街舞文化的校园传播,全力为学子们提供一个学习街舞、交流街舞，了解街舞文化，丰富课余生活，展现个人魅力，增强个人自信的街舞平台。整个社团会员们同心同力，从大一新生到硕士博士，都在BOBO这一个大家庭里一起欢笑一起成长。BOBO人始终坚信着，学习与舞蹈是生命中不可分割的一部分，相辅相成，台下每一滴汗水每一次伤痛，每一次迷茫每一刻笑容，都将绽放成舞台上最灿烂耀眼的光芒。', '2018-04-18', '0');
INSERT INTO `community` VALUES ('59', '漫画文化研究协会', '艺术类', '外语学院', '李佳诚', null, '漫画作为一种日常休闲的读物，在每天，都会多多少少出现在我们身边。中国漫画的起源也可以追溯到北宋时期。经过如此漫长的发展，我们却说不出我们漫画特定的风格。现今我国的漫画我们能看到的更多是对别国的模仿，我们自己的东西太少了。我们不禁担心，在这种不经心间的文化软实力渗透之下，我们是否会在不知不觉中，记住了别国的文化，甚至被别国文化同化，而忘记我们自己的内容。因此我们想要建立这样一个社团，我们从研究我们的日常入手，将我国特色的服装、饮食、节日、活动地点画在漫画中，探索出属于我国特色的漫画风格。\r\n 一方面我们不断的探索属于我国的漫画风格，另一方面我们也提供一个平台给所有喜欢漫画的同学们提供一个交流，娱乐的平台，充实同学们的课后生活。', '2018-04-12', '0');
INSERT INTO `community` VALUES ('60', 'RoboMasters机器人协会', '科技类', '信息学院', '晏超', null, '充分发挥综合性大学的学科优势，促进多学院同学之间的交流和合作，打造一支协作能力强，创新能力高的机器人创新队伍，为每年的RoboMasters全国机器人大赛输送一批会合作，会创新，有技术的人才。同时，通过协会本身所提供的平台，使得每个对机器人方面有兴趣的同学有一个真正动手实践的机会，让更多有想法的同学来实现自己的梦想，充实同学课外生活、提高学生科研能力、加强学术交流、共同进步。', '2018-04-14', '0');
INSERT INTO `community` VALUES ('61', '排球协会', '体育类', '体育学院', '杨梦洁', null, '排球协会以构建和谐社团、普及排球运动为指导思想。通过举办个人赛、学院赛等排球比赛，传递“快乐排球”理念。排球协会学院联赛面向所有同学，参赛同学代表学院进行比赛，是一个覆盖全校的排球竞技活动，本活动对于排球运动普及与发展具有重要的促进作用。每年春光灿烂之时和落叶缤纷之秋，学院联赛就会如约和全校同学见面，为热爱排球热爱运动的学子们献上一场排球盛宴，留下一段青春飞扬的回忆。', '2018-04-04', '0');
INSERT INTO `community` VALUES ('62', '篮球社团', '体育类', '体育学院', '尹祥', null, '篮球社团以形式多样的活动丰富了学生的课余生活，给予热衷篮球的同学一个展示自我的机会，让他们在自己所热爱的空间里自由发挥，体验比赛与游戏的不同滋味，享受篮球带给他们的无穷欢乐。同时不同班级、不同年级之间的同学能在这个交往的舞台上相互交往、相互沟通，增进了彼此间的了解。', '2018-04-14', '0');
INSERT INTO `community` VALUES ('63', '礼仪文化协会', '语言文化类', '外语学院', '郑志福', null, '礼仪是人际交往中适用的一种艺术，礼仪文化协会旨在和川大学子一起探求在我国源远流长的历史中的礼仪文化，通过研究，归纳，总结，形成一套对我们现在生活有指导意义的礼仪助手。同时也可以结合不同的需要，对有相关方面兴趣的同学做针对性交流。', '2018-04-12', '0');
INSERT INTO `community` VALUES ('64', '青年成就志愿协会', '公益类', '文传学院', '蔡晔', null, '青年成就志愿协会是以培养青少年品格、创造力和领导力为核心的大学生公益组织。 \r\n协会将组建跨专业跨年级协作团队，开展中小学多个项目，与中小学建立联系，在大学招收志愿者去各中小学课堂授课，在中小学教授商业经济知识帮助学生树立正确思想价值观，同时致力于培养当代大学生社会责任感以及思维能力、管理能力、表达能力等综合素质。\r\n', '2018-04-12', '0');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `upload_time` datetime NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('33', '学生社团校庆期间活动申请表.doc', '2018-04-23 02:27:53');
INSERT INTO `file` VALUES ('34', '社团先进个人申请表.doc', '2018-04-23 02:28:15');
INSERT INTO `file` VALUES ('35', '学生社团评比材料.doc', '2018-04-23 02:31:10');
INSERT INTO `file` VALUES ('36', '新生如何加入社团指导.doc', '2018-04-23 02:31:17');
INSERT INTO `file` VALUES ('37', '团委联系人表.doc', '2018-04-23 02:31:22');
INSERT INTO `file` VALUES ('38', '社团注销登记表.doc', '2018-04-23 02:31:27');
INSERT INTO `file` VALUES ('39', '如何成立社团指导.doc', '2018-04-23 02:31:43');
INSERT INTO `file` VALUES ('40', '奖励发放案例.doc', '2018-04-23 02:31:47');
INSERT INTO `file` VALUES ('41', '学生社团校庆期间活动申请表.doc', '2018-05-03 17:41:11');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `creat_time` datetime NOT NULL,
  `writer` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('59', '学生社团校园文化建设精品项目申报的通知', '2018-04-22 23:28:18', '游戏开发者协会', '<div>各学院团委、校院级学生社团：</div><div><br /></div><div>&nbsp; &nbsp; 为深入发掘学生兴趣及特长，提升学生社团活动的品位和层次，进一步加强学生社团品牌项目建设，营造出和谐繁荣的校园文化氛围，校团委将在全校范围内开展学生社团校园文化建设精品项目的申报工作。现将有关事项通知如下：</div><div><br /></div><div>1.学生社团申报的项目原则上是体现社团风采、已长期开展并深受同学们喜爱的，立志打造成社团品牌的特色活动。</div><div><br /></div><div>2.请各学院团委（学校部处）在接到通知后积极根据由本单位指导的学生社团特点，审核其是否为质量良好的学生社团活动及其是否在全校师生中有较高的影响力和覆盖率，要加强对申报项目资格的审查，认真做好初选工作。</div><div><br /></div><div>3.请各学院团委（学校部处）将项目申请表的电子文档统一收集后，做好校、院级社团分类并按校、院级分开建立文件夹，再打包成一个总文件夹，以学院为单位于2017年12月8日24点前发送至社团联公邮scu_sau@163.com，邮件主题命名为“精品项目+指导单位名称+学院社团工作负责人姓名及联系方式”。（注：将附件一申请表的纸质版盖章后于申报期间交到江安校区行政楼407校团委办公室，纸质版申请表还需拍照后将照片附在申请材料里一起发至公邮）</div><div><br /></div><div>4.校团委将对参选项目进行评审，最终评审出一批学生社团的精品项目，并发放经费以鼓励活动开展。</div><div><br /></div><div>5.本次学生社团校园文化建设精品项目的申报依据自愿申报原则，每个社团原则上限报一项，采取本学年内一次性申报的原则执行。</div><div><br /></div><div>&nbsp;</div><div><br /></div><div>注：院团委意见电脑录入即可，校团委意见由社团联财务部统一代办。</div>', 'notice');
INSERT INTO `news` VALUES ('60', '关于清明节放假期间学生社团相关工作的通知', '2018-04-22 23:31:34', '游戏开发者协会', '<div>各学院团委、各校内学生社团：</div><div><br /></div><div>&nbsp; &nbsp; 为加强学生社团的管理，确保清明节放假期间社团学生人身安全以及公共财产安全，维护校园和谐稳定，现根据学校整体安排，对各学生社团作如下要求：</div><div><br /></div><div>&nbsp; &nbsp; 一、清明节假期期间（2018年4月5日至2018年4月7日）以社团名义开展活动须向校团委申请，经批准后方可开展。各社团不能以社团名义开展聚会、旅游、支教等集体外出活动；</div><div><br /></div><div>&nbsp; &nbsp; 二、新闻媒体对学生社团进行采访报道须遵守学校宣传工作的相关要求，学生社团事前须报党委宣传部审批；</div><div><br /></div><div>&nbsp; &nbsp; 三、请学生社团注意防火防盗，在放假前检查活动场地和办公室，确保门窗、水、电关好。</div><div><br /></div><div>&nbsp; &nbsp; 请学生社团认真遵守《学生社团管理办法（试行）》的相关规定，增强安全防范意识，严格遵守以上要求。请学院团委将相关工作要求及时传达给学生社团并做好在假期期间的服务和管理工作。</div><div><br /></div><div>&nbsp;</div><div><br /></div><div>&nbsp;</div><div><br /></div><div style=\"text-align:right;\">校团委</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">校学生社团联合会</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">2018年3月27日</div>', 'notice');
INSERT INTO `news` VALUES ('61', '关于中秋节、国庆节期间学生社团相关工作的通知', '2018-04-22 23:33:09', '游戏开发者协会', '<div>各学院团委、校内学生社团:&nbsp;</div><div><br /></div><div>为加强学生社团的管理，确保中秋节、国庆节放假期间社团学生人身安全以及公共财产安全，维持校园和谐稳定，现根据学校整体安排，对各学生社团作如下要求：</div><div><br /></div><div>一、中秋节、国庆节假期期间（2017年10月1日至2017年10月8日）以社团名义开展活动须向校团委申请，经批准后方可开展。各社团不能以社团名义开展聚会、旅游、支教等集体外出活动；</div><div><br /></div><div>二、新闻媒体对学生社团进行采访报道须遵守学校宣传工作的相关要求，学生社团事前须报党委宣传部审批；</div><div><br /></div><div>三、请学生社团注意防火防盗，在放假前检查活动场地和办公室，确保门窗、水、电关好。</div><div><br /></div><div>请学生社团认真遵守《学生社团管理条例》的相关规定，增强安全防范意识，严格遵守以上要求。请学院团委将相关工作要求及时传达给学生社团并做好在假期期间的管理和服务工作。</div><div><br /></div><div>祝同学们假期愉快！</div><div><br /></div><div>&nbsp; &nbsp;</div><div><br /></div><div>&nbsp;</div><div><br /></div><div>&nbsp;</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">校团委</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">学生社团联合会</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">2017年9月21日</div>', 'notice');
INSERT INTO `news` VALUES ('64', '2017年大学生创业计划项目答辩会志愿者招募通知', '2018-04-22 23:41:29', '游戏开发者协会', '<div>各位同学：</div><div><br /></div><div>大家好！2017年度大学生创新创业训练计划项目答辩会将于3月17日（周五）在江安和望江举行，具体时间是下午13：30。现承办此次答辩会的大创菁英联盟面向全校招募志愿者，负责现场维护、引导、计时及举牌工作。大创菁英联盟是在学校注册、由校教务处指导的学生社团。此次活动的志愿者将零距离接触大创答辩的整个工作流程，有助于同学们未来自己申报大创项目，同时将开具志愿服务时长。望广大同学积极报名！</div><div>&nbsp; 请报名的同学将姓名、学院、学号、年级、志愿校区、联系方式按照附件提供的模板发到邮箱limodachina@gmail.com，截至日期为3月16日（周四）下午14：00。谢谢！</div><div>&nbsp;</div><div><br /></div><div>&nbsp;附件:2017年大创志愿者信息模板</div><div><br /></div><div><br /></div><div><br /></div><div>2017大创答辩志愿者信息</div>', 'notice');
INSERT INTO `news` VALUES ('67', '关于2017年元旦节放假的温馨提示', '2018-04-22 23:44:43', '游戏开发者协会', '<div>元旦将至，为了同学们能愉快地度过这个假期，对各学院团委、各校内学生社团温馨提示如下：</div><div><br /></div><div>一、元旦期间，成都气温较低，提醒同学们注意保暖，根据天气变化及时加减衣物；注意寝室卫生、个人卫生、饮食卫生，预防疾病；</div><div><br /></div><div>二、元旦节假期前后进入考试月，提醒同学们认真复习，努力备考，诚信迎考。学生社团在期末复习及考试阶段（自2016年12月12日至2017年1月14日）原则上不再组织任何校内外活动；</div><div><br /></div><div>三、学生社团如有接受新闻媒体采访报道的需要，请按学校规定报学校党委宣传部审批，同意才可配合开展相应工作；</div><div><br /></div><div>四、同学们要严格遵守学校各项安全管理规定，注意自己的人身、财产安全，离校要严格遵守请销假制度。各学生社团在停止活动后，请各学院团委督促学生社团检查日常使用的社团活动场地，确保安全设施齐备，门窗、水电关好；</div><div><br /></div><div>请学生社团遵守《学生社团管理条例》的相关规定，增强安全防范意识。最后祝同学们节日快乐！</div><div><br /></div><div>&nbsp;</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 校团委</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">学生社团联合会</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">2016年12月15日</div>', 'notice');
INSERT INTO `news` VALUES ('68', '关于2017年寒假的温馨提示', '2018-04-22 23:46:39', '游戏开发者协会', '<div>寒假将至，为了同学们能愉快地度过这个假期，对各学院团委、各校内学生社团温馨提示如下：</div><div><br /></div><div>&nbsp; 一、寒假期间，正逢传统节假日春节，有出入外地旅游或走亲访友的同学，请注意人身和财产安全。同时冬季气温较低，提醒同学们注意保暖，根据天气变化及时加减衣物；注意个人卫生、饮食卫生，预防疾病；</div><div><br /></div><div>&nbsp; 二、在寒假期间(2017.1.14-2017.2.26)原则上不再组织任何社团名义的校内外活动，如有特殊情况请报四川大学学生社团联合会备案。</div><div><br /></div><div>&nbsp; 三、学生社团如有接受新闻媒体采访报道的需要，请按学校规定报学校党委宣传部审批，同意才可配合开展相应工作；</div><div><br /></div><div>&nbsp; 四、同学们要严格遵守学校各项安全管理规定，注意自己的人身、财产安全。各学生社团在停止活动后，请各学院团委督促学生社团在寒假离校前检查日常使用的社团活动场地，确保安全设施齐备，门窗、水电关好；</div><div><br /></div><div>&nbsp; 请学生社团遵守《学生社团管理条例》的相关规定，增强安全防范意识。最后祝同学们假期愉快！</div><div><br /></div><div>&nbsp;</div><div><br /></div><div style=\"text-align:right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 校团委</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">学生社团联合会</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">2016年12月23日</div>', 'notice');
INSERT INTO `news` VALUES ('69', '关于期末复习及考试期间停止学生社团活动的通知', '2018-04-22 23:47:32', '游戏开发者协会', '<div>各学院团委、各校内学生社团：</div><div><br /></div><div>学校各学院将在12月初进入期末复习及考试阶段，据此，为使同学们专注开展复习，现根据学校整体安排，对各校内学生社团作如下要求：</div><div><br /></div><div>一、学生社团在期末复习及考试阶段（自2016年12月12日至2017年1月14日）原则上不再组织任何校内外活动；</div><div><br /></div><div>二、学生社团如有接受新闻媒体采访报道的需要，请按学校规定报学校党委宣传部审批，同意才可配合开展相应工作；</div><div><br /></div><div>三、各学生社团在停止活动后，请各学院团委督促学生社团检查日常使用的社团活动场地，确保安全设施齐备，门窗、水电关好；</div><div><br /></div><div>请校内各学生社团认真遵守《学生社团管理条例》的相关规定，增强安全防范意识。最后祝同学们考试顺利！</div>', 'notice');
INSERT INTO `news` VALUES ('70', '关于五一劳动节放假期间学生社团相关工作的通知', '2018-04-22 23:50:50', '游戏开发者协会', '<div>各学院团委、校内学生社团：</div><div><br /></div><div>&nbsp; <span>	</span>为加强学生社团的管理，确保放假期间社团学生人身安全以及公共财产安全，维护校园和谐稳定，现根据学校整体安排，对各学生社团作如下要求：</div><div><br /></div><div>&nbsp; <span>		</span>一、学生社团在五一劳动节放假期间（2016年4月30日至2016年5月2日）未经学校允许，不得以社团名义举办任何形式的活动，特别是旅游、支教等集体外出活动;</div><div><br /></div><div>&nbsp; <span>		</span>二、新闻媒体对学生社团进行采访报道须遵守学校宣传工作的相关要求，学生社团事前须报党委宣传部审批；</div><div><br /></div><div>&nbsp; <span>		</span>三、请学生社团注意防火防盗，在放假前检查活动场地和办公室，确保门窗、水、电关好。</div><div><br /></div><div>&nbsp; <span>	</span>请学生社团遵守《学生社团管理条例》的相关规定，增强安全防范意识，严格遵守以上要求。请学院团委将相关工作要求及时传达给学生社团并做好在假期期间的服务和管理工作。</div><div><br /></div><div>&nbsp;&nbsp;</div><div><br /></div><div>&nbsp; &nbsp;<span>	</span> 祝同学们假期愉快！</div><div><br /></div><div>&nbsp;</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 校团委</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">学生社团联合会</div><div style=\"text-align:right;\"><br /></div><div style=\"text-align:right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2016年4月27日</div>', 'notice');
INSERT INTO `news` VALUES ('71', '学校召开2018年人才引进工作推进会', '2018-04-22 23:59:05', '游戏开发者协会', '<div>4月8日下午，学校在行政楼四号会议室召开了2018年人才引进工作推进会。副校长查振华，组织人事部、教务处、财务处、国际合作交流处负责人，各二级学院院长、书记，组织人事部相关同志参加了会议。</div><div><br /></div><div><br /></div><div><br /></div><div>　　会上，查副校长指出，我校第三届一次教代会上提出了建设特色鲜明区域领先的综合性大学的办学目标，实现这一目标离不开人才，各部门、二级学院一定要牢固树立人才是第一资源的发展理念，加大人才引进力度，拓宽工作思路和渠道，提高人才引进效率。他就我校2018年高层次人才引进工作提出三点要求。第一，思想上高度重视高层次人才引进工作，要发扬锲而不舍的精神，把人才引进工作做实、做细，扎实推进人才引进工作。第二，明确责任目标，2018年高层次人才引进计划已经公布，要根据人才引进计划保质保量的完成刚性人才引进任务；同时做好其他形式的高层次人才引进工作，各相关部门要相互配合、通力合作，确保引进人才符合要求。第三，改变工作模式，变“守株待兔”式被动等待为主动出击吸引人才，各部门主要领导作为主要责任人要走出去，深入引才工作第一线，亲力亲为，带队参加各类人才招聘会，力争引才工作取得更大的成绩。</div><div><br /></div><div><br /></div><div>　　会议由组织人事部部长王殿元主持，副处级组织员夏英就人才引进的具体工作做了详细布置和说明。</div>', 'news');
INSERT INTO `news` VALUES ('72', '2018年全省高校思想政治工作会议在昌召开', '2018-04-23 00:01:13', '游戏开发者协会', '<div>4月10日，2018年全省高校思想政治工作会议在南昌举行。会议主题是深入贯彻落实全国、全省高校思想政治工作会议精神，总结工作，分析形势，安排部署今年全省高校思想政治工作。省委教育工委副书记肖志华出席并讲话。我校党委副书记魏立平，校党委委员、宣传部长冯健，学生处副处长郭青参加了会议。</div><div><br /></div><div><br /></div><div>　　肖志华指出，2017年，全省高校认真学习宣传贯彻习近平新时代中国特色社会主义思想和党的十九大精神，深入贯彻落实全国高校思想政治工作会议精神，紧紧围绕立德树人这一根本任务，紧扣突出问题提举措，紧扣重大任务抓推进，紧扣重点工作要实效，持续推动思想政治工作在实现高质量发展上不断取得新进展，社会主义办学方向更加，思想政治引领体系更加完备，工作保障体系更加有力，工作队伍素质更加过硬，高校育人环境更加优化，广大师生思想状况主流积极健康，意识形态领域阵地更加稳固。</div><div><br /></div><div>&nbsp;</div><div><br /></div><div>　　肖志华强调，2018年是贯彻党的十九大精神的开局之年，是决胜全面建成小康社会、实施“十三五”规划承上启下的关键一年，高校思想政治工作责任重大。面对新形势新任务，全省高校要牢牢把握习近平新时代中国特色社会主义思想这一灵魂主线，不断在学习培训上下功夫，继续在广泛宣传上下功夫，持续在做实上下功夫，坚决筑牢广大师生的思想根基。要牢牢把握党对高校工作的全面领导这一根本原则，坚决夯实对党绝对忠诚的政治根基，坚持把党的政治建设摆在首位、把质量建设作为重点、把基层党组织建设作为党建工作的基础基石。要牢牢把握新时代意识形态工作主导权领导权这一根本前提，坚决站稳坚持党的领导的坚强阵地，严格落实意识形态工作责任，加强意识形态阵地建设管理，做好网络意识形态阵地宣传引导。要牢牢把握高质量发展这一根本要求，坚决打好打赢高校思想政治工作质量提升持久战攻坚战。要着力构建育人一体化体系，抓好思想政治教育内容建设，加强工作队伍主体能力建设，促进全省高校思想政治工作再上新台阶。</div><div><br /></div><div>&nbsp;</div><div><br /></div><div>　　会议传达学习了全国高校思想政治工作座谈会和全国高校思想政治工作专题研讨班精神，通报了2017年度全省高校落实意识形态工作责任制考核情况。</div><div><br /></div>', 'news');
INSERT INTO `news` VALUES ('73', '校园卫生健康服务队成立暨急救员培训开班', '2018-04-23 00:02:38', '游戏开发者协会', '<p>为了更广泛地在校园内开展和普及应急救护知识与技能培训工作，切实提高我校师生的安全防范意识、防灾避险和自救互救能力，4月12日下午，在学生处、团委、保卫处的支持与配合下，由校医院组织的“校园卫生健康服务队成立暨急救员培训班”开班了。杨耀防副校长到会并讲话，九江市红十字会石金平主任、九江市红十字会救护培训部钱昌琪主任，保卫处张晓明处长、学工部范宇航副部长、校医院贾宗林院长等参加了此次开班仪式，仪式由校医院贾宗林院长主持。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/12/2ar70of7ir.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　在开班仪式上，杨耀防副校长首先对此次校园卫生健康服务队成立暨急救员培训班开班表示热烈的祝贺！对莅临我校指导此次培训的九江市红十字会领导和培训老师表示衷心的感谢！杨副校长从提高认识，加强领导；精心组织，落实责任；严肃纪律，注重实效三方面给此次培训工作提出了要求。他指出，学校是人员最集中、自然灾害、突发事件发生后最容易造成伤亡的场所之一，在学校开展救护知识与技能的普及推广很有必要，不但可以提高在校大学生的自救互救能力，对促进社会安全体系与和谐平安校园建设也具有十分重要的意义。因此，此次应急救护培训组织得非常及时、非常必要。他还要求各位学员大家遵守培训纪律，认真学习，扎实掌握校园应急救护知识，顺利通过考核；培训结束后，要把学到的急救知识正确运用到平时的生活当中，让更多的师生了解急救知识，共同提高我校师生安全防范意识、防灾避险和自救互救能力，为校园安全稳定提供必要的保障。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/12/2sz3kj27iv.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　九江市红十字会石金平主任在开班仪式上指出，在学校与广大市民中广泛开展应急救护培训，弘扬尊重生命、关爱生命理念，传授自救互救技能，是《中华人民共和国红十字会法》赋予各级红十字会的法定职责，也是学校管理和学生安全教育应有的内容，应急救护知识与技能的培训与推广应普及尤为重要。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/12/5p42xj47j1.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　校医院贾宗林院长简单介绍了校园学生卫生健康服务队的组建以及今年学校应急救护员培训的计划，九江市红十字会救护培训部钱昌琪主任针对此次培训工作做出具体的安排并提出要求。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/12/22npwer7jh.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　开班仪式上，杨耀防副校长等还为“学生卫生健康服务队”成员颁发了聘书。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/12/2k2h0ln7j6.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　开班典礼仪式结束后，今年首期急救员培训班将正式开始。本次培训包括部分校辅导员、保卫干事、学生卫生健康服务队员、学生代表共计105人，将分3次共10个学时的紧张培训，考核合格后颁发江西省红十字会救护员证。</p>', 'news');
INSERT INTO `news` VALUES ('74', '校党委书记赵伟同志带队赴江浙地区高校考察学习', '2018-04-23 00:05:16', '游戏开发者协会', '<table class=\"winstyle42295\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"><tbody><tr><td class=\"contentstyle42295\"><div class=\"c42295_content\"><div><p>为学习借鉴外地高校办学经验，进一步加强党的建设和思想政治工作，不断推进改革创新，提升学校内涵建设水平，4月9日至12日，由校党委书记赵伟同志带队，副校长王万山和党委组织人事部、党(院)办主任、马克思主义学院、经济与管理学院、临床医学院(附属医院)、会计学院主要负责同志组成的考察组赴温州大学、南通大学考察学习党建、学科建设、人才引进与培养、干部人事制度改革等成功经验。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/13/5nhlw1lx8l.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　10日上午，温州大学校党委书记林娟娟热情接待了赵书记一行。温州大学党委副书记赵敏就学校概况、历史沿革、办学定位、人才培养、学科建设、科学研究、服务地方、开放办学、党建与思政工作等方面详细介绍了学校的建设与发展现状。温州大学研究生院、人事处、商学院等部门负责人各自就分管学科建设、人才队伍建设等方面分享了经验与做法。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/13/2r4qo7fx8p.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　赵伟书记对温州大学敢闯敢干的改革创新精神表示由衷的敬佩，认为其人才培养、学科建设、科学研究、高层人才引进与培养、国际化办学、政产学研紧密合作和积极服务地方经济社会发展的经验做法值得九江学院学习借鉴。赵伟书记还从地域文化、区位优势、综合实力等方面阐述了九江的历史地位与现状，并着重向对方介绍了九江学院的历史文脉、办学特色定位及发展存在的主要差距。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/13/2qct6uwx8s.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　11日上午，考察组抵达南通大学。南通大学党委书记蒲玉忠对考察组的到来表示了热烈的欢迎，对学校的办学历史、学科地位、校园建设做了概要说明。南通大学副校长董正超详细解读了学校的发展现状与发展目标，该校组织部、宣传部、人事处、学科办负责人分别就党的建设、思想政治工作、人才队伍建设、重点学科建设等交流工作经验与体会。赵伟书记代表考察组感谢了南通大学的周到安排和精心准备，肯定了南通大学的办学成就与经验。双方还就人才政策、重点学科建设、硕士点申报、目标考核、附属医院管理等问题进行了交流与探讨。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/13/25pgr5jx8w.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　此次考察丰富了思路，开拓了视野，将为我校的党建及思政工作、学科建设、人才队伍建设、管理服务和校园建设提供良好的借鉴。<a name=\"_GoBack\"></a></p>\r\n</div></div>\r\n          \r\n           \r\n           \r\n        </td></tr>\r\n        <tr><td class=\"pagestyle42295\" align=\"left\">\r\n        </td></tr>\r\n        <tr><td><div>&nbsp;</div></td></tr>\r\n    <tr><td align=\"left\">\r\n             \r\n             \r\n      </td></tr>\r\n      \r\n      <tr>\r\n         <td align=\"center\">\r\n            \r\n         </td>\r\n      </tr>\r\n\r\n      <tr><td align=\"right\">\r\n              </td></tr></tbody></table>', 'news');
INSERT INTO `news` VALUES ('75', '学校召开2018年度本科教学状态数据填报工作会', '2018-04-23 00:07:03', '游戏开发者协会', '<p>4月16日下午，学校在行政楼一号会议室召开2018年度本科教学基本状态数据填报工作会议。副校长、审核评估评建办公室主任陈春生出席会议并讲话。学校各职能部门、二级学院负责人，以及各部门数据填报人、审核人参加了会议。会议由教务处处长、审核评估评建办公室常务副主任陈小林主持。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/16/2zviu8dvxv.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　陈春生副校长首先对2017年度学校基本状态数据填报工作予以高度认可。他指出，基本状态数据是学校整体办学水平和办学实力的展现，是学校事业发展的证明，也是审核评估专家对学校评估的重要依据，对学校的发展至关重要。对于2018年度学校基本状态数据采集工作，陈副校长要求各单位要高度重视，对填报工作认真负责。各单位数据填报人、审核人、负责人要深入理解数据项内涵说明，准确把握填报要求，确保数据填报的准确性。同时，要站在学校发展、审核评估的高度，在实事求是的基础上主动作为，反复挖掘，反复比较，密切配合，切实做好2018年度本科教学基本状态数据填报各项工作。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/16/2jqe5jyvxy.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　陈小林处长对状态数据填报基本要求、任务分工、时间节点等具体事项进行了详细说明。</p> \r\n<p>&nbsp;</p> \r\n<p>　　审核评估评建办公室副主任黄冬久详细介绍了2017年度学校教学状态数据填报工作情况，并对填报中需要注意的问题进行了分析说明。</p> \r\n<p>&nbsp;</p> \r\n<p>　　全体参会人员共同学习了《九江学院2018年度本科教学基本状态数据采集工作方案》。</p>', 'news');
INSERT INTO `news` VALUES ('76', '我校举行“一对一”帮扶工作阶段性总结会', '2018-04-23 00:08:24', '游戏开发者协会', '<p>4月16日，为总结前阶段“一对一”帮扶工作，我校2016—2017年“一对一”帮扶工作阶段性总结会在定点帮扶单位东山村举行。副校长查振华、官莲乡党委书记李刚出席会议，12个帮扶单位负责同志、包村乡领导、“村两委”、扶贫工作队及贫困户代表共计30余人参加会议。会议由组织人事部副部长、扶贫工作队队长燕红波同志主持。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/17/2gly4nxlx8.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　查副校长作了讲话。他代表学校向支持学校扶贫工作的官莲乡党委政府表示敬意，向付出艰辛劳动的扶贫工作队、驻村第一书记表示慰问，向付出大量心血的各帮扶单位表示感谢。他指出，通过精准扶贫工作，全体帮扶干部熟悉了农村情况，增进了农民感情。他指出，两年多来，全体干部用心、用情、实干赢得了各方面的认可，这得益于学校党委的高度重视、得益于地方党委的紧密配合、得益于有一支好的扶贫干部队伍。他强调，虽然东山村退出贫困村，但依然要深刻分析“帮扶谁、谁来帮、怎么扶”的问题，进一步增强扶贫工作效率，按照省委新的决策部署，做出新作为。针对下阶段精准扶贫工作，他提了三点要求：一是要深入学习贯彻习近平总书记关于精准脱贫、精准扶贫的重要讲话精神；二是要认真总结经验，查找扶贫工作的差距和不足；三是要细心谋划，进一步在扶贫、扶智和扶志上下功夫。\r\n </p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/17/28oqsbglxd.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　官莲乡党委书记李刚对九江学院表达了深深感激之情。他说道，有高位推进扶贫事业的校领导；有真心关注扶贫工作的各帮扶单位；有工作作风踏实的扶贫工作队，你们的付出，老百姓将铭记于心，这份真情将是官莲、是东山的宝贵财富。官莲和东山的全体干部群众也将珍惜这宝贵的机遇，全身心投入到脱贫攻坚的伟大事业中来，为全面建成小康社会努力奋斗！\r\n </p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/17/2f8t2i1lxh.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　会上，驻村第一书记兼村党支部书记谭翊泉就“一对一”帮扶工作做了汇报。外语学院、文传学院、旅游学院、会计学院等单位帮扶干部代表，郭安宁、王凤珠等贫困户代表分别作了交流发言。</p> \r\n<p>&nbsp;</p> \r\n<p>　　会后，各帮扶单位走村入户，给对接户送去了米、面、油等生活用品，并就帮扶干部调整作了解释和说明。化环学院为幼儿园送去了学习生活用品。</p> \r\n<p>&nbsp;</p> \r\n<p>　　据悉，自学校高位推进“一对一”帮扶工作以来，共有会计学院、文传学院、旅游学院、信息学院、机材学院、经管学院、外语学院、药生学院、继续教育学院、后勤管理处等10个二级单位对接了10户重度贫困户。入户110余次，走访人数达600人次，帮扶资金达15.3万元。此外，校团委、旅游学院、化环学院、艺术学院、土建学院、图书馆、附属医院、校医院等8个单位也以不同的形式和方式参与精准扶贫工作。各单位的帮扶工作不仅得到了当地政府百姓的认可，也得到了央视网、大江网、江西日报等中央、省市媒体的广泛关注。</p> \r\n<p>&nbsp;</p> \r\n<p>　　参加会议的帮扶单位纷纷表示，要一如既往的支持扶贫工作，以全新的形式参与新一轮“一对一”帮扶工作。同时一定会按照学校党委的统一部署，在“微产业”、乡村旅游上下功夫，为推进东山村乡村振兴做出更大贡献。&nbsp;</p>', 'news');
INSERT INTO `news` VALUES ('77', '国家外专局项目发展部部长王立社一行来校考察调研 ', '2018-04-23 00:09:07', '游戏开发者协会', '<p>4月11日上午，刘晓东校长到学校竞知楼408教室，随堂听取了旅游与国土资源学院李静老师为该学院人文地理与城乡规划专业旅游A1731班学生讲授的专业必修课《自然地理学》。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/12/2ecdgyu63b.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　课堂上，刘晓东认真听取了李静老师运用PPT讲解“大气圈与气候系统”的教学内容，仔细观察老师与学生教学互动的情况，并全程进行了记录。<a name=\"_GoBack\"></a></p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/12/2549nji63h.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　课后，刘晓东与李静老师进行了现场交流，并对她在教学过程中课程内容讲解熟练、授课思路条理清晰、与学生课堂互动密切等有关情况给予了充分肯定，同时也指出了她在授课内容上的不足，希望她紧密结合理论教学内容，进一步丰富拓展专业知识面；紧跟研究前沿，关注现实热点，力求把专业理论知识讲得更贴近实际、更生动有趣，不断提升课堂教学效果。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/12/2f8srqg63n.jpg\" border=\"0\" /></p> \r\n<p>&nbsp;</p> \r\n<p>　　刘晓东校长还结合自身广博的专业知识和丰富的专业实践经验，从二氧化碳排放、全球气候变化、绿色能源发展以及近期发布的《中国气候变化蓝皮书》等方面，向同学们简要阐述了学好这门课的现实意义；勉励同学们热爱自己的专业，自觉增强专业学习兴趣，脚踏实地学好专业课程，切实以扎实的专业本领更好地报效国家、服务社会。</p>', 'news');
INSERT INTO `news` VALUES ('78', '刘晓东校长带队赴江苏高校考察学习', '2018-04-23 00:10:33', '游戏开发者协会', '<p>4月16日至18日，由校长刘晓东同志带队，九江市政协副主席、化学与环境工程学院院长严平，党委组织人事部部长、学科学位办主任王殿元，图书馆馆长计斌，机械与材料工程学院院长张德勤一行赴江苏理工学院、常州工学院等高校就管理体制机制改革、人才引进、人事管理与考核、内涵建设、本科审核评估、服务地方经济社会发展等工作进行考察学习。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/19/3wvd8wtm1c.jpg\" border=\"0\" /></p> \r\n<p align=\"center\">&nbsp;</p> \r\n<p align=\"center\"><font>在江苏理工学院考察</font></p> \r\n<p>&nbsp;</p> \r\n<p>　　在江苏理工学院，学校党委书记王建华、校长朱林生热情接待了刘晓东校长一行。江苏理工学院副校长周兰珍介绍了学校基本情况，发展规划处、科学技术处、学科办、人事处、图书馆、教务处负责人就学科建设、教学和科研评价机制、人才培养机制、高层次人才引进、科技创新团队建设、本科教学工作审核评估等方面介绍了学校做法和取得的经验。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/19/2jrfs2pm2g.jpg\" border=\"0\" /></p> \r\n<p align=\"center\">&nbsp;</p> \r\n<p align=\"center\"><font>在江苏理工学院考察</font></p> \r\n<p align=\"center\">&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/19/2j4emttm2o.jpg\" border=\"0\" /></p> \r\n<p align=\"center\">&nbsp;</p> \r\n<p align=\"center\"><font>在江苏理工学院考察</font></p> \r\n<p>&nbsp;</p> \r\n<p>　　刘校长感谢江苏理工学院领导的热情接待，认为江苏理工学院在内部管理体制机制改革、学科建设、校园文化建设等方面形成了自身的特色，取得了可喜成绩，有很多成功经验值得我校借鉴和学习。表示希望今后两校能够进一步加强交流合作。座谈会后，刘校长一行还考察了图书馆、ICT产教融合创新基地、生物信息与医药工程研究所、分析测试中心、创新创业学院、校史展览馆等。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/19/2kwdh6hm38.jpg\" border=\"0\" /></p> \r\n<p align=\"center\">&nbsp;</p> \r\n<p align=\"center\"><font>在常州工学院考察</font></p> \r\n<p>&nbsp;</p> \r\n<p>　　在常州工学院，考察组一行受到该校校长李文虎的热情欢迎，李校长首先介绍了常州工学院的办学历史、办学规模、师资队伍等基本情况，人事处、图书馆、数理与化工学院、机械与车辆工程学院、科研处及学科办相关负责人向考察组详细分享了各自工作做法和具体经验。</p> \r\n<p>&nbsp;</p> \r\n<p align=\"center\"><img src=\"http://www.jju.edu.cn/_mediafile/jjxueyuan/2018/04/19/2a5ehu4m4h.jpg\" border=\"0\" /></p> \r\n<p align=\"center\">&nbsp;</p> \r\n<p align=\"center\"><font color=\"#0000ff\" face=\"楷体_GB2312\">在常州工学院考察学习</font></p> \r\n<p>&nbsp;</p> \r\n<p>　　刘校长首先对常州工学院的热情接待表示感谢，并向常州工学院简要介绍了我校基本情况，对常州工学院在特色发展、产教融合、新校区建设等方面所取得的成绩表示钦佩。座谈会后，刘校长一行还考察了常州工学院新校区图书馆、教学楼、体育场馆和学生宿舍等。</p> \r\n<p>&nbsp;</p> \r\n<p>　　通过此次考察，开拓了视野，拓展了思路，查明了学校与经济较发达地区地方本科高校在高层次人才队伍建设、内部管理体制机制、服务地方经济社会发展等方面存在的差距，对推进学校改革发展具<a name=\"_GoBack\"></a>有重要的意义。</p>', 'news');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '实践类');
INSERT INTO `type` VALUES ('2', '艺术类');
INSERT INTO `type` VALUES ('3', '科技类');
INSERT INTO `type` VALUES ('4', '语言文化类');
INSERT INTO `type` VALUES ('5', '公益类');
INSERT INTO `type` VALUES ('6', '体育类');
INSERT INTO `type` VALUES ('7', '科研类');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_sex` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `tel` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `power` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '20140202470', '徐焕鑫', '男', '信息学院', 'A1413', '18924639544', '123456', '1');
INSERT INTO `user` VALUES ('20', '20140202471', '章横', '男', '信息学院', 'A1413', '15879255549', '123456', '1');
INSERT INTO `user` VALUES ('22', '20140202472', '张子豪', '男', '信息学院', 'A1413', '18720185146', '123456', '1');
INSERT INTO `user` VALUES ('23', '20140202473', '钟森阳', '男', '信息学院', 'A1411', '13133660953', '123456', '1');
INSERT INTO `user` VALUES ('24', '20140202474', '古运鹏', '男', '信息学院', 'A1412', '13133660954', '123456', '0');
INSERT INTO `user` VALUES ('25', '20140202475', '张艳芳', '女', '文传学院', 'A1411', '18720185147', '123456', '0');
INSERT INTO `user` VALUES ('26', '20140202475', '赖雅琴', '女', '文传学院', 'A1412', '15879255540', '123456', '0');
INSERT INTO `user` VALUES ('27', '20140202476', '龚晓光', '男', '体育学院', 'A1413', '15879235876', '123456', '0');
INSERT INTO `user` VALUES ('28', '20140202477', ' 张海涛', '男', '信息学院', 'A1411', '13133661356', '123456', '0');
INSERT INTO `user` VALUES ('29', '20140202478', ' 张波轮', '男', '文传学院', 'A1411', '13133662486', '123456', '0');
INSERT INTO `user` VALUES ('30', '20140202479', ' 黄顺', '男', '文传学院', 'A1411', '13133668635', '123456', '0');

-- ----------------------------
-- Table structure for userinclub
-- ----------------------------
DROP TABLE IF EXISTS `userinclub`;
CREATE TABLE `userinclub` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL,
  `club_name` varchar(255) NOT NULL,
  `in_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinclub
-- ----------------------------
INSERT INTO `userinclub` VALUES ('1', '20140202473', '游戏开发者协会', '2018-05-02 01:33:47');
INSERT INTO `userinclub` VALUES ('2', '20140202474', '游戏开发者协会', '2018-05-02 04:59:40');
INSERT INTO `userinclub` VALUES ('4', '20140202476', '游戏开发者协会', '2018-05-02 05:00:08');
INSERT INTO `userinclub` VALUES ('5', '20140202477', '游戏开发者协会', '2018-05-02 05:00:21');
INSERT INTO `userinclub` VALUES ('6', '20140202478', '游戏开发者协会', '2018-05-02 05:00:38');
INSERT INTO `userinclub` VALUES ('7', '20140202479', '游戏开发者协会', '2018-05-02 05:00:54');
INSERT INTO `userinclub` VALUES ('8', '20140202474', '游戏开发者协会', '2018-05-02 07:03:57');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `v_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `v_url` varchar(255) NOT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', 'XMzA4ODcwODQ2MA');
INSERT INTO `video` VALUES ('2', 'XMzA4ODcwODQ2MA');
INSERT INTO `video` VALUES ('3', 'XMzA4ODcwODQ2MA');
