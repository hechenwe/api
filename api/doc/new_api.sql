/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : new_api

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-04-06 16:20:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司编号',
  `COMPANY_NAME` varchar(32) DEFAULT NULL COMMENT '公司名称',
  `LOGO` varchar(128) DEFAULT NULL COMMENT '商标',
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户_公司';

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('2582B1DAF550485980F519096F3ACEC1', '易教空间', 'upload\\image\\201512\\10FAD135A27A42BC8D3EBB2D707C64CC.png');
INSERT INTO `company` VALUES ('506648FA0D344C84852FBDA254EDD2F1', 'SoonCode', null);
INSERT INTO `company` VALUES ('900912481B474A63A3104514E4EE3E22', 'he', null);

-- ----------------------------
-- Table structure for control
-- ----------------------------
DROP TABLE IF EXISTS `control`;
CREATE TABLE `control` (
  `CONTROL_ID` varchar(32) NOT NULL COMMENT '控制编号',
  `PROJECT_ID` varchar(32) DEFAULT NULL COMMENT '项目编号',
  `USER_ID` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `OPERATION_ID` varchar(32) DEFAULT NULL COMMENT '操作编号',
  PRIMARY KEY (`CONTROL_ID`),
  KEY `FK_CONTROL_OPERATION_INDEPENDENT` (`OPERATION_ID`),
  KEY `FK_CONTROL_USER` (`USER_ID`),
  KEY `FK_CONTROL_PROJECT` (`PROJECT_ID`),
  CONSTRAINT `FK_CONTROL_OPERATION_INDEPENDENT` FOREIGN KEY (`OPERATION_ID`) REFERENCES `operation` (`OPERATION_ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_CONTROL_PROJECT` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_CONTROL_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限_控制_中间表';

-- ----------------------------
-- Records of control
-- ----------------------------
INSERT INTO `control` VALUES ('04138FB967774E09BE06A841CCB5C15A', null, 'FAA4BF1DA18C402893F7BB52FAC0B4C3', '8DAF951448FD4B73ADE2D86571F673EB');
INSERT INTO `control` VALUES ('0FD6942C8E44465D938EA32A2903736D', '9B8AACB65185483DAADF914C26703FD9', null, '8DAF951448FD4B73ADE2D86571F673EB');
INSERT INTO `control` VALUES ('2CC497C7FEF44FB896026BA6D7DE93A0', null, null, '643D6526E23F4FF8A241499531144195');
INSERT INTO `control` VALUES ('51E2E6862A0E435FA2BB5E19018E58E9', '543762007CDC4063B787AE4E71C14762', '7F3216402F294A3890836E0EA2A09D07', '8DAF951448FD4B73ADE2D86571F673EB');
INSERT INTO `control` VALUES ('5CBA2D40B2424E42A7C8DCA8D980EFFA', '543762007CDC4063B787AE4E71C14762', null, '8DAF951448FD4B73ADE2D86571F673EB');
INSERT INTO `control` VALUES ('636BB574228545D692F65DE7349C2BB4', '9B8AACB65185483DAADF914C26703FD9', '7F3216402F294A3890836E0EA2A09D07', '8DAF951448FD4B73ADE2D86571F673EB');
INSERT INTO `control` VALUES ('96CF364844584028B72955994FDF54F2', null, null, '8DAF951448FD4B73ADE2D86571F673EB');
INSERT INTO `control` VALUES ('C6452DABC055408CA7B813560C344261', '9B8AACB65185483DAADF914C26703FD9', null, '8DAF951448FD4B73ADE2D86571F673EB');
INSERT INTO `control` VALUES ('DBDB0C592FFB4CA8BC01BB9A3B5C0FD3', '9B8AACB65185483DAADF914C26703FD9', '30FAA95184264F2CB47CDF3911EDCD13', '643D6526E23F4FF8A241499531144195');
INSERT INTO `control` VALUES ('FBB32338614645C8ABDDF3DAA0B29031', '5605C8B8E44540608B0D5CB0CADAA7B7', '0E61AD9A6CAE4B26A3B174021ED27CE4', '643D6526E23F4FF8A241499531144195');

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `verification_id` varchar(32) NOT NULL COMMENT '验证编号',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `code` int(11) DEFAULT NULL COMMENT '验证码',
  PRIMARY KEY (`verification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证_邮箱验证';

-- ----------------------------
-- Records of email
-- ----------------------------
INSERT INTO `email` VALUES ('B0E8F4265558452D86F7840FEF4E0C18', 'hechenwe@gmail.com', '846688');
INSERT INTO `email` VALUES ('E8517FDA0CE94F01BDB80B5C81217ABC', '592794139@qq.com', '497032');

-- ----------------------------
-- Table structure for example
-- ----------------------------
DROP TABLE IF EXISTS `example`;
CREATE TABLE `example` (
  `EXAMPLE_ID` varchar(32) NOT NULL COMMENT '事例编号',
  `INTERFAC_ID` varchar(32) DEFAULT NULL COMMENT '接口_编号',
  `EXAMPLE_TYPE` varchar(32) DEFAULT NULL COMMENT '事例名称',
  `EXAMPLE_CONTENT` text COMMENT '事例内容',
  `CREAT_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`EXAMPLE_ID`),
  KEY `FK_EXAMPLE_INTERFACE` (`INTERFAC_ID`),
  CONSTRAINT `FK_EXAMPLE_INTERFACE` FOREIGN KEY (`INTERFAC_ID`) REFERENCES `interfac` (`INTERFAC_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='返回值_事例';

-- ----------------------------
-- Records of example
-- ----------------------------
INSERT INTO `example` VALUES ('0374881F7E134EB7917E154102255316', '276B85014DCA4347B5C3854862CFEA5A', 'SUCCESS', '{\"message\":1}', '2015-11-11 10:34:26', '1');
INSERT INTO `example` VALUES ('0669AF50419A4513B10882E46916CECC', null, 'FAILURE', 's', '2015-12-15 10:02:35', '2');
INSERT INTO `example` VALUES ('0956022676654E1E9B48BCFD63174981', '7804E28413444AA48C50D6F39706E4DD', 'FAILURE', '{\"message\":404}', '2015-11-18 10:04:31', '2');
INSERT INTO `example` VALUES ('0DF701ABED344ACD8123D54AD238D7D7', 'ADF64C4D8C4D464C9BF2680B5087FC8E', 'SUCCESS', '{\"266ce8b224f740f698f5db2ae5e15b68\":\"1\",\"3f3f3b5a92db4d1ea7467d1750a3d698\":\"1\",\"9596acbff9434160a38f39e951a59b79\":\"1\",\"currency\":300,\"experience\":160,\"rank\":1}', '2015-11-18 09:46:21', '1');
INSERT INTO `example` VALUES ('113C0FA567644B9D95C5565B5F30EE0F', '16AB1249170F470781DB04E4BBA79C9F', 'SUCCESS', '{\"message\":1,\"customsBarrierExercise\":[{\"customsBarrierExercisesId\":1,\"challengeSchooleId\":1,\"customsBarrierId\":1,\"subjectCode\":\"274ea\",\"finishTime\":10,\"starNumber\":3,\"challengeSchoole\":null,\"customsBarrier\":null},{\"customsBarrierExercisesId\":2,\"challengeSchooleId\":1,\"customsBarrierId\":1,\"subjectCode\":\"be6c8\",\"finishTime\":8,\"starNumber\":2,\"challengeSchoole\":null,\"customsBarrier\":null},{\"customsBarrierExercisesId\":3,\"challengeSchooleId\":1,\"customsBarrierId\":1,\"subjectCode\":\"2e426\",\"finishTime\":8,\"starNumber\":2,\"challengeSchoole\":null,\"customsBarrier\":null},{\"customsBarrierExercisesId\":4,\"challengeSchooleId\":1,\"customsBarrierId\":1,\"subjectCode\":\"a7ecc\",\"finishTime\":8,\"starNumber\":2,\"challengeSchoole\":null,\"customsBarrier\":null},{\"customsBarrierExercisesId\":5,\"challengeSchooleId\":1,\"customsBarrierId\":1,\"subjectCode\":\"9c1e0\",\"finishTime\":8,\"starNumber\":2,\"challengeSchoole\":null,\"customsBarrier\":null},{\"customsBarrierExercisesId\":6,\"challengeSchooleId\":1,\"customsBarrierId\":1,\"subjectCode\":\"f43e2\",\"finishTime\":9,\"starNumber\":2,\"challengeSchoole\":null,\"customsBarrier\":null}]}', '2015-11-30 10:30:31', '1');
INSERT INTO `example` VALUES ('12D66502443C47A1A62A65A5D9AEB61F', 'AF335E8F8C4949A685A3FA8F45881FAA', 'SUCCESS', '{\"message\":1}', '2015-11-17 13:30:10', '1');
INSERT INTO `example` VALUES ('166949BF80E34FAEAE9AD80F0A5A1DE1', '799570CB5852421EA592EED4CC5CD700', 'SUCCESS', '{\"smsDayTypeStats\":[{\"type\":\"reset_password\",\"id\":93,\"number\":12,\"date\":1458201780000,\"productId\":\"32bdd1c5-8eef-4843-9a9a-228dc0f3b617\"},{\"type\":\"teacher_certificate\",\"id\":94,\"number\":11,\"date\":1458201780000,\"productId\":\"32bdd1c5-8eef-4843-9a9a-228dc0f3b617\"},{\"type\":\"edit_password\",\"id\":95,\"number\":2,\"date\":1458201780000,\"productId\":\"32bdd1c5-8eef-4843-9a9a-228dc0f3b617\"}],\"hourData\":[{\"number\":10,\"hour\":\"09\",\"type\":\"1\"},{\"number\":5,\"hour\":\"10\",\"type\":\"1\"},{\"number\":9,\"hour\":\"11\",\"type\":\"1\"},{\"number\":1,\"hour\":\"13\",\"type\":\"1\"}]}', '2016-03-17 16:27:21', '1');
INSERT INTO `example` VALUES ('1771AD822DB64D4E85DBFE4C5F23F99F', '939C2627FA604779927259D5AE43BDFA', 'SUCCESS', '{\"message\":1}', '2015-11-11 13:49:22', '1');
INSERT INTO `example` VALUES ('182CB8CF503946C1A4CF8C9845FD35E3', 'A743D5D4D9FA4A359CFE34C52C8F9D9F', 'SUCCESS', '{\"message\":1}', '2015-11-13 09:27:53', '1');
INSERT INTO `example` VALUES ('1921C4B3C7C4447598A3BB56BDB48C86', 'CBC118FCD9A24234A8B7E00371D047C5', 'SUCCESS', '{\"message\":1}', '2015-11-13 09:17:32', '1');
INSERT INTO `example` VALUES ('1A3BF54E5CE14AFAA8E5ACDBEFEB0556', 'F6AE3EF135E54802B8349F7F14DA4380', 'SUCCESS', '{\"smsDayTypeStats\":[{\"id\":93,\"type\":\"reset_password\",\"number\":12,\"date\":1458180200000,\"productId\":\"32bdd1c5-8eef-4843-9a9a-228dc0f3b617\"},{\"id\":94,\"type\":\"teacher_certificate\",\"number\":1,\"date\":1458180200000,\"productId\":\"32bdd1c5-8eef-4843-9a9a-228dc0f3b617\"}],\"smsStat\":{\"statId\":1,\"productId\":\"32bdd1c5-8eef-4843-9a9a-228dc0f3b617\",\"monthSuc\":30,\"threeFal\":1,\"threeSuc\":30,\"sevenFal\":1,\"monthFal\":1,\"yearFal\":1,\"sevenSuc\":30,\"yearSuc\":30,\"todayFal\":0,\"todaySuc\":13,\"halfYearFal\":1,\"halfYearSuc\":30},\"hourData\":[{\"number\":10,\"hour\":\"09\",\"type\":\"1\"},{\"number\":3,\"hour\":\"10\",\"type\":\"1\"}]}', '2016-03-17 10:43:33', '1');
INSERT INTO `example` VALUES ('1B543244FBC04F5895348E6BF7E02422', null, 'SUCCESS', '{\"message\":1}', '2015-11-09 10:15:20', '1');
INSERT INTO `example` VALUES ('1D6E854E4B484E5FB0FED35184306CA5', '733E24FF765645FE8A225D8902CBB48B', 'SUCCESS', '{\"message\":1,\"challengeViewes\":[{\"rankNumber\":1,\"university\":\"清华大学\",\"nickName\":\"嘿嘿\",\"faceImage\":\"upload/image/201512/953936391EF14019A632E420D7FF0CDC.jpg\",\"universityId\":1001},{\"rankNumber\":2,\"university\":\"清华大学\",\"nickName\":\"杨老六\",\"faceImage\":\"upload/image/201512/953936391EF14019A632E420D7FF0CDC.jpg\",\"universityId\":1001},{\"rankNumber\":2,\"university\":\"清华大学\",\"nickName\":\"歌\",\"faceImage\":\"upload/image/201512/953936391EF14019A632E420D7FF0CDC.jpg\",\"universityId\":1001}]}', '2015-12-18 13:30:24', '1');
INSERT INTO `example` VALUES ('203674A6681C4060A401FCA76F984154', '5635376B0DDF43839C976A945863D356', 'SUCCESS', '{\"provinces\":[\"北京\",\"天津\",\"上海\",\"重庆\",\"河北\",\"河南\",\"云南\",\"辽宁\",\"黑龙江\",\"湖南\",\"安徽\",\"山东\",\"新疆\",\"江苏\",\"浙江\",\"江西\",\"湖北\",\"广西\",\"甘肃\",\"山西\",\"内蒙古\",\"陕西\",\"吉林\",\"福建\",\"贵州\",\"广东\",\"青海\",\"西藏\",\"四川\",\"海南\"]}', '2015-11-09 15:12:49', '1');
INSERT INTO `example` VALUES ('232793451FAF40EC96435EB5BAE048FE', 'CBC118FCD9A24234A8B7E00371D047C5', 'FAILURE', '{\"message\":0}', '2015-11-13 09:17:53', '2');
INSERT INTO `example` VALUES ('235478F22A0B40E0BE23BCE91AAFDDB1', 'CBC118FCD9A24234A8B7E00371D047C5', 'EXCEPTION', '{\"message\":404}', '2015-11-13 09:18:30', '3');
INSERT INTO `example` VALUES ('237AFF947EFE42A78FF4AE3258B63170', '340372AF5B2D49659E257FC55D3FB0C7', 'FAILURE', '404', '2015-11-24 12:01:48', '2');
INSERT INTO `example` VALUES ('261444B4DA7F487094B350AE9FD8D458', 'BDFC3407E76A4D79A8529EA9EB56CD58', 'SUCCESS', '{\"message\":1,\"rank\":3,\"experience\":780,\"currency\":2300}', '2015-12-07 11:10:36', '1');
INSERT INTO `example` VALUES ('26D05E337AF244B7A1FE42F4E0F7CADC', '978C62DABEFE4EF5B8E62A35F54D18BB', 'SUCCESS', '{    \"message\": \"1\",    \"phoneNumber\": \"13681004146\",    \"sessionId\": \"DEAECF14B052479CA455BF7F860131AD\"}', '2015-11-09 09:09:00', '1');
INSERT INTO `example` VALUES ('31E9381859E143EAB6D8D11B5D785B0E', '7F056A3482384022B22C10439EC9B369', 'SUCCESS', '{    \"schools\": [        {            \"schoolId\": 1067,            \"schoolName\": \"北京市二十一世纪实验学校\",            \"schoolAddress\": \"北京市海淀区恩济庄46号\",            \"schoolPhone\": \"010-88124903\",            \"schoolPostalcode\": \"100036\",            \"schoolWebsite\": \"http://xuexiao.eol.cn/html4/1100/114003312/index.shtml\",            \"schoolXueduan\": \"小学\",            \"schoolProvince\": \"北京\",            \"schoolQu\": \"海淀\",            \"schoolXian\": null,            \"page\": 4        },        {            \"schoolId\": 1068,            \"schoolName\": \"北京市海淀外国语实验学校\",            \"schoolAddress\": \"北京市海淀区杏石口路20号\",            \"schoolPhone\": \"88430704   88459224\",            \"schoolPostalcode\": \"100095\",            \"schoolWebsite\": \"http://xuexiao.eol.cn/html4/1100/114003472/index.shtml\",            \"schoolXueduan\": \"小学\",            \"schoolProvince\": \"北京\",            \"schoolQu\": \"海淀\",            \"schoolXian\": null,            \"page\": 5        },        {            \"schoolId\": 1069,            \"schoolName\": \"首都师范大学附属育新学校\",            \"schoolAddress\": \"北京市海淀区西三旗育新花园34号\",            \"schoolPhone\": \"01082902204\",            \"schoolPostalcode\": \"100096\",            \"schoolWebsite\": \"http://xuexiao.eol.cn/html4/1100/114003962/index.shtml\",            \"schoolXueduan\": \"小学\",            \"schoolProvince\": \"北京\",            \"schoolQu\": \"海淀\",            \"schoolXian\": null,            \"page\": 6        }    ]}', '2015-11-09 15:30:53', '1');
INSERT INTO `example` VALUES ('47AD40FE78F6444FB3BEB636B5E26A71', 'D7A05F7235AC45CFB17F154B00879B27', 'SUCCESS', '[{\"analyze\":\"[{\\\"analyzeKey\\\":\\\"A\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"B\\\",\\\"analyzeValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/gks201505180938.files/image008.gif\'></img>得<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/gks201505180938.files/image009.gif\'></img>,&nbsp;由Venn图表示集合的包含关系可知表示<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/gks201505180938.files/image010.gif\'></img>的区域在表示<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/gks201505180938.files/image011.gif\'></img>的区域内.所以此选项正确.\\\"},{\\\"analyzeKey\\\":\\\"C\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"D\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"}]\",\"analyzePicture\":\"\",\"answer\":\"B\",\"audio\":\"\",\"code\":\"951a2a7a182345afaa9825dce9657d32\",\"comment\":\"\",\"createAt\":\"1432542125732\",\"create_author\":\"\",\"grade\":\"高三\",\"id\":\"143321\",\"isCheck\":\"false\",\"isCompleted\":\"3\",\"isDel\":\"false\",\"knowledgeCode\":\"\",\"knowledges\":\"集合与常用逻辑用语\",\"option\":\"[{\\\"optionKey\\\":\\\"A\\\",\\\"optionValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/gks201505180938.files/image004.jpg\'></img>\\\"},{\\\"optionKey\\\":\\\"B\\\",\\\"optionValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/gks201505180938.files/image005.jpg\'></img>\\\"},{\\\"optionKey\\\":\\\"C\\\",\\\"optionValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/gks201505180938.files/image006.jpg\'></img>\\\"},{\\\"optionKey\\\":\\\"D\\\",\\\"optionValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/gks201505180938.files/image007.jpg\'></img>\\\"}]\",\"optionPicture\":\"\",\"productionCode\":\"\",\"productions\":\"集合\",\"remark\":\"\",\"source\":\"web\",\"stage\":\"\",\"star\":\"0\",\"stem\":\"已知全集U=R,则正确表示集合M={―1,0,1}和N=<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/gks201505180938.files/image003.gif\'></img>关系的韦恩(Venn)图是(&nbsp;&nbsp;&nbsp;)\",\"stemPicture\":\"\",\"subject\":\"数学\",\"title\":\"GKS03001\",\"type\":\"5\",\"update_at\":\"1432542125735\",\"update_author\":\"\",\"video\":\"\"}]', '2015-11-24 09:21:28', '1');
INSERT INTO `example` VALUES ('480A30BD67B546CA9857077F7FFED700', 'AD8C9A02C1524E5D872ACED339B2E73C', 'SUCCESS', '{\"message\":1}', '2015-12-02 10:29:51', '1');
INSERT INTO `example` VALUES ('53C75EC8273344FDB9BE724594A14B5A', '340372AF5B2D49659E257FC55D3FB0C7', 'SUCCESS', '{\"message\":1,\"image\":\"upload\\\\image\\\\201511\\\\027316B79B0A406A98139268F32004C3.png\"}', '2015-11-24 11:48:30', '1');
INSERT INTO `example` VALUES ('5A2E3928EEE04161A6D64A413FE35614', '06C5E1116C1042B6B8EB104BEA9260D5', 'SUCCESS', '{\"message\":1,\"universities\":[{\"universityId\":1001,\"university\":\"清华大学\",\"provinceId\":1,\"colleges\":null},{\"universityId\":32004,\"university\":\"国立清华大学\",\"provinceId\":32,\"colleges\":null}]}', '2015-11-16 09:41:56', '1');
INSERT INTO `example` VALUES ('6A3717B5F29147959E8CE7C0C61F25D9', '92CF6445FB4D449D9889919A8C63A0B9', 'SUCCESS', '{\"message\":1,\"phoneNumber\":\"13681004142\",\"nickName\":\"哈哈\",\"faceImage\":\"upload\\\\image\\\\201511\\\\E30D5E8F2698432AAEBCE19E55C9CEC8.JPG\"}', '2015-11-13 11:25:25', '1');
INSERT INTO `example` VALUES ('6FB734A64BF74B88924273174A59B878', 'BD50776D9D534189A3DCEABF1470D001', 'SUCCESS', '{\"dayTypeStats\":[{\"number\":1,\"type\":\"login\"}],\"scopeData\":[{\"sucNumber\":1,\"falNumber\":0,\"date\":\"2016-03-21\"}]}', '2016-03-21 11:49:39', '1');
INSERT INTO `example` VALUES ('73E8A55AC68245DCB7D21F04B225249C', 'A743D5D4D9FA4A359CFE34C52C8F9D9F', 'FAILURE', '{\"message\":0}', '2015-11-13 09:28:09', '2');
INSERT INTO `example` VALUES ('7A0FE99A139A48949C4B0C1146D831EA', 'D72C3AB1312D4BE3AF8C5E806FF29F9C', 'SUCCESS', '{\"message\":1,\"provinces\":[{\"provinceId\":1,\"province\":\"北京\",\"universitys\":null},{\"provinceId\":2,\"province\":\"上海\",\"universitys\":null},{\"provinceId\":3,\"province\":\"天津\",\"universitys\":null},{\"provinceId\":4,\"province\":\"重庆\",\"universitys\":null},{\"provinceId\":5,\"province\":\"黑龙江\",\"universitys\":null},{\"provinceId\":6,\"province\":\"吉林\",\"universitys\":null},{\"provinceId\":7,\"province\":\"辽宁\",\"universitys\":null},{\"provinceId\":8,\"province\":\"山东\",\"universitys\":null},{\"provinceId\":9,\"province\":\"山西\",\"universitys\":null},{\"provinceId\":10,\"province\":\"陕西\",\"universitys\":null},{\"provinceId\":11,\"province\":\"河北\",\"universitys\":null},{\"provinceId\":12,\"province\":\"河南\",\"universitys\":null},{\"provinceId\":13,\"province\":\"湖北\",\"universitys\":null},{\"provinceId\":14,\"province\":\"湖南\",\"universitys\":null},{\"provinceId\":15,\"province\":\"海南\",\"universitys\":null},{\"provinceId\":16,\"province\":\"江苏\",\"universitys\":null},{\"provinceId\":17,\"province\":\"江西\",\"universitys\":null},{\"provinceId\":18,\"province\":\"广东\",\"universitys\":null},{\"provinceId\":19,\"province\":\"广西\",\"universitys\":null},{\"provinceId\":20,\"province\":\"云南\",\"universitys\":null},{\"provinceId\":21,\"province\":\"贵州\",\"universitys\":null},{\"provinceId\":22,\"province\":\"四川\",\"universitys\":null},{\"provinceId\":23,\"province\":\"内蒙古\",\"universitys\":null},{\"provinceId\":24,\"province\":\"宁夏\",\"universitys\":null},{\"provinceId\":25,\"province\":\"甘肃\",\"universitys\":null},{\"provinceId\":26,\"province\":\"青海\",\"universitys\":null},{\"provinceId\":27,\"province\":\"西藏\",\"universitys\":null},{\"provinceId\":28,\"province\":\"新疆\",\"universitys\":null},{\"provinceId\":29,\"province\":\"安徽\",\"universitys\":null},{\"provinceId\":30,\"province\":\"浙江\",\"universitys\":null},{\"provinceId\":31,\"province\":\"福建\",\"universitys\":null},{\"provinceId\":32,\"province\":\"台湾\",\"universitys\":null},{\"provinceId\":33,\"province\":\"香港\",\"universitys\":null},{\"provinceId\":34,\"province\":\"澳门\",\"universitys\":null},{\"provinceId\":35,\"province\":\"国外\",\"universitys\":null}]}', '2015-11-16 09:19:37', '1');
INSERT INTO `example` VALUES ('7A56C5966B174ED0BD55E81494CE21F9', 'EF6D1389B8424AE98EDADF74D00D6E5F', 'SUCCESS', '{\"experience\":380,\"rank\":2,\"rightNumber\":10,\"startNumber\":3,\"subjectCode\":\"274ea\"}', '2015-11-26 11:20:52', '1');
INSERT INTO `example` VALUES ('7F5AA4B551E441CEAD0AB80E535C510A', '36052A2420D248F2835985FE7901AE93', 'SUCCESS', '{\"message\":1,\"signTime\":0}', '2015-12-03 09:54:16', '1');
INSERT INTO `example` VALUES ('864F775783DA440EAC5137B624572E79', null, 'FAILURE', 'sf', '2015-11-28 14:54:29', '2');
INSERT INTO `example` VALUES ('8A1C738341D84A64997CD9437A0CF439', '12733182B9164CAFA0A07AB202E96BA7', 'SUCCESS', '{\"message\":1}', '2015-11-11 11:50:14', '1');
INSERT INTO `example` VALUES ('8DA331F5DB774C27B579A2D21BA42C8E', 'B8A72F765D6D4A8DAC3EDDEF7CEB2468', 'SUCCESS', '{\"1\":13,\"2\":18,\"3\":18,\"4\":18,\"5\":3,\"6\":16,\"breakthroughTime\":0,\"challengeDemonTime\":0,\"challengeSchooleId\":1,\"demonAppearTime\":0,\"intelligenceQuestionTime\":0,\"mistakeTime\":0,\"opponentLocation\":15,\"thisSchedule\":\"6\"}', '2015-11-26 15:54:59', '1');
INSERT INTO `example` VALUES ('93EC4CFBEF264A4B8F0ECB0C37572E85', '9F7EE10BB25E436DB144C20891A64D36', 'SUCCESS', '{\"message\":\"Success\",\"result\":null,\"code\":\"Success\",\"requestId\":null,\"httpCode\":\"200\"}', '2016-03-21 09:24:01', '1');
INSERT INTO `example` VALUES ('9760A579DB714C7991202BAFE460305D', 'ACC02C913EC447D481F375C1CB40F99A', 'SUCCESS', '{\"message\":1}', '2015-11-17 11:40:51', '1');
INSERT INTO `example` VALUES ('98E9DEBCFCB343E1918A0C9B6463A39A', null, 'SUCCESS', '{\"message\":1}', '2015-11-11 11:37:37', '1');
INSERT INTO `example` VALUES ('A3A1F2C37B8B4D7DB33060D15C7A8CE7', 'D773BFD06755438283AA3CCEDF890EA4', 'SUCCESS', '{\"message\":1,\"phoneNumber\":\"13681004142\",\"sessionId\":\"B4E017982905478DB4FC58266A7AF0F3\"}', '2015-11-11 13:35:25', '1');
INSERT INTO `example` VALUES ('A3E8E064735F4D82A18EF5D38743E39E', '79FE4387B35749EEAFEA69F1550712D8', 'SUCCESS', '{\"message\":1,\"signAwards\":[{\"signAwardId\":1,\"awardType\":\"GOLD\",\"awardValue\":100,\"signTime\":1},{\"signAwardId\":2,\"awardType\":\"EXP\",\"awardValue\":100,\"signTime\":2},{\"signAwardId\":3,\"awardType\":\"GOLD\",\"awardValue\":200,\"signTime\":3},{\"signAwardId\":4,\"awardType\":\"EXP\",\"awardValue\":200,\"signTime\":4},{\"signAwardId\":5,\"awardType\":\"GOLD\",\"awardValue\":300,\"signTime\":5},{\"signAwardId\":6,\"awardType\":\"EXP\",\"awardValue\":300,\"signTime\":6},{\"signAwardId\":7,\"awardType\":\"GOLD\",\"awardValue\":400,\"signTime\":7},{\"signAwardId\":8,\"awardType\":\"EXP\",\"awardValue\":400,\"signTime\":8},{\"signAwardId\":9,\"awardType\":\"GOLD\",\"awardValue\":500,\"signTime\":9},{\"signAwardId\":10,\"awardType\":\"EXP\",\"awardValue\":500,\"signTime\":10},{\"signAwardId\":11,\"awardType\":\"GOLD\",\"awardValue\":600,\"signTime\":11},{\"signAwardId\":12,\"awardType\":\"EXP\",\"awardValue\":600,\"signTime\":12},{\"signAwardId\":13,\"awardType\":\"GOLD\",\"awardValue\":700,\"signTime\":13},{\"signAwardId\":14,\"awardType\":\"EXP\",\"awardValue\":700,\"signTime\":14},{\"signAwardId\":15,\"awardType\":\"GOLD\",\"awardValue\":800,\"signTime\":15},{\"signAwardId\":16,\"awardType\":\"EXP\",\"awardValue\":800,\"signTime\":16},{\"signAwardId\":17,\"awardType\":\"GOLD\",\"awardValue\":900,\"signTime\":17},{\"signAwardId\":18,\"awardType\":\"EXP\",\"awardValue\":900,\"signTime\":18},{\"signAwardId\":19,\"awardType\":\"GOLD\",\"awardValue\":1000,\"signTime\":19},{\"signAwardId\":20,\"awardType\":\"EXP\",\"awardValue\":1000,\"signTime\":20}]}', '2015-12-03 09:46:36', '1');
INSERT INTO `example` VALUES ('A6205537EAF44D7BB77C632617524A9F', '6549023E7887420EB14736CD95E76DD3', 'SUCCESS', '{\"scopeData\":[{\"sucNumber\":0,\"falNumber\":5,\"date\":\"2016-03-21\"}],\"typeStat\":[{\"number\":5,\"type\":\"log\"}],\"main\":{\"yearSuc\":0,\"monthSuc\":0,\"threeSuc\":0,\"todayFal\":5,\"monthFal\":5,\"sevenSuc\":0,\"threeFal\":5,\"todaySuc\":0,\"halfYearSuc\":0,\"halfYearFal\":5,\"yearFal\":5,\"sevenFal\":5}}', '2016-03-21 14:02:09', '1');
INSERT INTO `example` VALUES ('B3799A1042EE4CCFA1AB13D31E74FAB2', '8A6270EC6105429E84B83E095C9DF141', 'SUCCESS', '{\"message\":1,\"verificationCode\":\"000000\"}', '2015-11-11 10:25:39', '1');
INSERT INTO `example` VALUES ('B4C75B6618814DCF91096064CE83739A', null, 'SUCCESS', 'sdfsd', '2015-11-28 14:53:41', '1');
INSERT INTO `example` VALUES ('BA7ACEC4BC01407AB930E894C0D0C28F', '0B4BF8B8B0A24E16AFFC27E8C5F6276C', 'SUCCESS', '{\"inspirations\":[{\"inspirationId\":1,\"userId\":1,\"coverPicture\":\"upload\\\\image\\\\201511\\\\365562A927784FCF83FC7996E27EEF0A.png\",\"content\":\"减肥还是看使得开发商结婚老师的看法和了似的咖啡碱老师的课了独守空房\",\"illustration\":\"upload\\\\image\\\\201511\\\\F180B410841449B08996733CAB768C9A.jpg\",\"creatDate\":1447723813000,\"isPassCheck\":\"0\",\"isPublish\":\"1\",\"browseTime\":0,\"praiseTime\":0,\"commentTime\":0,\"collectTime\":0,\"isEssence\":null,\"user\":null,\"inspirationComments\":null,\"inspirationUsers\":null}],\"message\":1,\"total\":1,\"totalPages\":1}', '2015-11-17 09:44:53', '1');
INSERT INTO `example` VALUES ('C3948845F3024CF09FE57382E464D80B', '9ACEABFEA17241DC9A07F931D652B6AF', 'SUCCESS', '{\"message\":1,\"universityId\":1001,\"universityName\":\"清华大学\"}', '2015-11-28 10:09:18', '1');
INSERT INTO `example` VALUES ('C6675ACC902244E3AF3CB0D7F5963345', '5127645D562A4E93951C815E59EDA32D', 'SUCCESS', '{\"message\":1}', '2015-12-14 15:38:52', '1');
INSERT INTO `example` VALUES ('C7368773BC064E4CAAD03D532EE7BDA7', '2A599AAC6E94420B8D819D2C6D14DEB0', 'SUCCESS', '{\"challengeSchooleId\":4,\"message\":1,\"opponentLocation\":14,\"thisSchedule\":\"1\"}', '2015-11-26 11:07:41', '1');
INSERT INTO `example` VALUES ('CB13A09027CB464A940B2C3D477E002C', '09D6F3BF8D404293B375918C40E95A05', 'SUCCESS', 'ffff', '2015-12-30 11:52:44', '1');
INSERT INTO `example` VALUES ('CD064D93CDBD486C8C79A979E8AE7B01', '6BAAD463F7A740B9884CBF50C835A05C', 'SUCCESS', '[{\"id\":103855,\"code\":\"93e10b2c16a74276bc214059e272f455\",\"createAt\":1430818821408,\"create_author\":\"admin\",\"update_at\":1430818821408,\"update_author\":null,\"name\":\"集合\",\"lineCode\":\"2ee1c4979f674b468d2faa024bce4b99103855\",\"knowledgeIndex\":\"\",\"parentCode\":\"2ee1c4979f674b468d2faa024bce4b99\",\"isleaf\":true,\"typeCode\":\"0\",\"subjectCode\":\"274ea\",\"gradeCode\":\"83e01\",\"booktype\":\"cec15c81e25040898f5aae9be1dd60ad\",\"isdel\":false,\"startStudyTime\":902,\"endStudyTime\":910,\"version\":1,\"sorts\":103855,\"selfLabel\":false,\"chk\":false},{\"id\":105991,\"code\":\"9ab93965c01149498ad38e7e91534406\",\"createAt\":1430876015189,\"create_author\":\"admin\",\"update_at\":1430876015189,\"update_author\":null,\"name\":\"函数\",\"lineCode\":\"2ee1c4979f674b468d2faa024bce4b99105991\",\"knowledgeIndex\":\"\",\"parentCode\":\"2ee1c4979f674b468d2faa024bce4b99\",\"isleaf\":true,\"typeCode\":\"0\",\"subjectCode\":\"274ea\",\"gradeCode\":\"83e01\",\"booktype\":\"cec15c81e25040898f5aae9be1dd60ad\",\"isdel\":false,\"startStudyTime\":911,\"endStudyTime\":1108,\"version\":1,\"sorts\":105991,\"selfLabel\":false,\"chk\":false}]', '2015-11-11 11:11:16', '1');
INSERT INTO `example` VALUES ('CF6ED19A3CDC42868868900BAFAEBAC8', '6205A4EC8D8945739693FBED1C20C1D2', 'SUCCESS', '[{\"id\":271,\"code\":\"c88ba8a0e85846438937106b17d1282b\",\"createAt\":1430707985129,\"create_author\":\"admin\",\"update_at\":1430707985129,\"bookType\":\"苏教版\",\"subject\":\"a7ecc\",\"grade\":\"83e01\"},{\"id\":275,\"code\":\"8fb417217cd04b35ad561695f734e70a\",\"createAt\":1430708009080,\"create_author\":\"admin\",\"update_at\":1430708009080,\"bookType\":\"鲁科版\",\"subject\":\"a7ecc\",\"grade\":\"83e01\",\"version\":1},{\"id\":279,\"code\":\"0ed8cda6c7b743d789a3137724e09eaf\",\"createAt\":1430708040013,\"create_author\":\"admin\",\"update_at\":1430708040013,\"bookType\":\"人教版\",\"subject\":\"a7ecc\",\"grade\":\"83e01\"}]', '2015-11-11 10:55:24', '1');
INSERT INTO `example` VALUES ('CFB47C6059924DA3B3CABC90D97E9293', 'ABAF572259514DAFB33622C9895F3CF0', 'SUCCESS', '{\"collectExercise\":[{\"subjectCode\":\"274ea\",\"exerciseSize\":5,\"exerciseCodes\":[\"3f3f3b5a92db4d1ea7467d1750a3d698\",\"3f3f3b4a92db4d1ea7467d1750a3d698\",\"3f3f3b4a92db4d1ea7464d1750a3d698\",\"3f3f3b4a92db4d1ea7464d1750a3d690\",\"3f3f3b4a92db4d1ea7464d1750a6d690\"]},{\"subjectCode\":\"be6c8\",\"exerciseSize\":7,\"exerciseCodes\":[\"3f3f3b4a92db4d1ea7464d1750a6d690\",\"4f3f3b4a92db4d1ea7464d1750a6d690\",\"4f3f3b4a92df4d1ea7464d1750a6d690\",\"4f3f3b4a92df4d1ea7464d1750a4d690\",\"4f3f3b4a92df4d1ea7464d1750a4d640\",\"4f3f3b4a92df4d1ea7464d1750a4d641\",\"4f3f3b4a95df4d1ea7464d1750a4d641\"]}]}', '2015-12-02 13:19:45', '1');
INSERT INTO `example` VALUES ('D05FEEE156F64AC78C94060E4395EED8', '3CCEADFD0AF445C8BF68FD3D5DA100C6', 'SUCCESS', '{    \"message\": 1,    \"universities\": [        {            \"universityId\": 1001,            \"university\": \"清华大学\",            \"provinceId\": 1,            \"colleges\": null        },        {            \"universityId\": 1002,            \"university\": \"北京大学\",            \"provinceId\": 1,            \"colleges\": null        },        {            \"universityId\": 1003,            \"university\": \"中国人民大学\",            \"provinceId\": 1,            \"colleges\": null        }]}', '2015-11-16 09:23:13', '1');
INSERT INTO `example` VALUES ('D0DFC671CD76446B8E8E212FBB723AA8', '965EDF63544B4804BE66F1D18518E877', 'SUCCESS', '{\"message\":\"Success\",\"result\":{\"code\":\"482664\"},\"code\":\"Success\",\"requestId\":\"sdfsds2343546546ffsdfw\",\"httpCode\":\"200\"}', '2016-03-17 10:34:01', '1');
INSERT INTO `example` VALUES ('D192940A95854713BF2263AC33A6DECE', '7804E28413444AA48C50D6F39706E4DD', 'SUCCESS', '{\"message\":1}', '2015-11-18 10:04:06', '1');
INSERT INTO `example` VALUES ('D1E285A2A0B541C78610D7CDA14439E6', '92CF6445FB4D449D9889919A8C63A0B9', 'FAILURE', '{\"message\":0}', '2015-11-13 11:25:54', '2');
INSERT INTO `example` VALUES ('D5B141E7A00F4892B20B95B8FEA81607', 'D773BFD06755438283AA3CCEDF890EA4', 'FAILURE', '{\"message\":2}', '2015-11-11 13:34:53', '2');
INSERT INTO `example` VALUES ('D670A0F43ED64723B198631BD543D726', '50891CF5DADC4C07B63214E2B1E25F33', 'SUCCESS', '[{\"id\":103807,\"code\":\"2ee1c4979f674b468d2faa024bce4b99\",\"createAt\":1430818776294,\"create_author\":\"admin\",\"update_at\":1430818776294,\"update_author\":null,\"name\":\"必修一\",\"lineCode\":\"2ee1c4979f674b468d2faa024bce4b99\",\"knowledgeIndex\":\"\",\"parentCode\":\"0\",\"isleaf\":true,\"typeCode\":\"0\",\"subjectCode\":\"274ea\",\"gradeCode\":\"83e01\",\"booktype\":\"cec15c81e25040898f5aae9be1dd60ad\",\"isdel\":false,\"startStudyTime\":902,\"endStudyTime\":1108,\"version\":1,\"sorts\":103807,\"selfLabel\":false,\"chk\":false},{\"id\":109649,\"code\":\"0349a81f4761472aa6a7cdd806394372\",\"createAt\":1430880239703,\"create_author\":\"admin\",\"update_at\":1430880239703,\"update_author\":null,\"name\":\"必修四\",\"lineCode\":\"0349a81f4761472aa6a7cdd806394372\",\"knowledgeIndex\":\"\",\"parentCode\":\"0\",\"isleaf\":true,\"typeCode\":\"0\",\"subjectCode\":\"274ea\",\"gradeCode\":\"83e01\",\"booktype\":\"cec15c81e25040898f5aae9be1dd60ad\",\"isdel\":false,\"startStudyTime\":1109,\"endStudyTime\":1231,\"version\":1,\"sorts\":109649,\"selfLabel\":false,\"chk\":false},{\"id\":114247,\"code\":\"9c2eabc140be4aecba57ff4be88a8f03\",\"createAt\":1430888710593,\"create_author\":\"admin\",\"update_at\":1430888710593,\"update_author\":null,\"name\":\"必修五\",\"lineCode\":\"9c2eabc140be4aecba57ff4be88a8f03\",\"knowledgeIndex\":\"\",\"parentCode\":\"0\",\"isleaf\":true,\"typeCode\":\"0\",\"subjectCode\":\"274ea\",\"gradeCode\":\"83e01\",\"booktype\":\"cec15c81e25040898f5aae9be1dd60ad\",\"isdel\":false,\"startStudyTime\":303,\"endStudyTime\":503,\"version\":1,\"sorts\":114247,\"selfLabel\":false,\"chk\":false},{\"id\":118815,\"code\":\"00647543941e4418985afafbaddb1229\",\"createAt\":1430892845077,\"create_author\":\"admin\",\"update_at\":1430892845077,\"update_author\":null,\"name\":\"必修二\",\"lineCode\":\"00647543941e4418985afafbaddb1229\",\"knowledgeIndex\":\"\",\"parentCode\":\"0\",\"isleaf\":true,\"typeCode\":\"0\",\"subjectCode\":\"274ea\",\"gradeCode\":\"83e01\",\"booktype\":\"cec15c81e25040898f5aae9be1dd60ad\",\"isdel\":false,\"startStudyTime\":504,\"endStudyTime\":630,\"version\":1,\"sorts\":118815,\"selfLabel\":false,\"chk\":false}]', '2015-11-11 11:02:29', '1');
INSERT INTO `example` VALUES ('DB9F037984174A7389841D0BC800C35C', 'B4637C5E9665406D88BBB182E141BDD2', 'SUCCESS', '[{\"id\":1,\"code\":\"ff7d6\",\"createAt\":1413091692952,\"create_author\":\"libh\",\"update_at\":1413091692952,\"gradeName\":\"一年级\",\"stageCode\":\"41935\"},{\"id\":2,\"code\":\"24156\",\"createAt\":1413091828704,\"create_author\":\"libh\",\"update_at\":1413091828704,\"gradeName\":\"二年级\",\"stageCode\":\"41935\"},{\"id\":3,\"code\":\"09520\",\"createAt\":1413091832512,\"create_author\":\"libh\",\"update_at\":1413091832512,\"gradeName\":\"三年级\",\"stageCode\":\"41935\"},{\"id\":4,\"code\":\"4a5e7\",\"createAt\":1413091836631,\"create_author\":\"libh\",\"update_at\":1413091836631,\"gradeName\":\"四年级\",\"stageCode\":\"41935\"},{\"id\":5,\"code\":\"d2325\",\"createAt\":1413091840563,\"create_author\":\"libh\",\"update_at\":1413091840563,\"gradeName\":\"五年级\",\"stageCode\":\"41935\"},{\"id\":6,\"code\":\"fdfaf\",\"createAt\":1413091845197,\"create_author\":\"libh\",\"update_at\":1413091845197,\"gradeName\":\"六年级\",\"stageCode\":\"41935\"},{\"id\":7,\"code\":\"cf5c3\",\"createAt\":1413092008004,\"create_author\":\"libh\",\"update_at\":1413092008004,\"gradeName\":\"初一\",\"stageCode\":\"b2cf3\"},{\"id\":8,\"code\":\"56e93\",\"createAt\":1413092011640,\"create_author\":\"libh\",\"update_at\":1413092011640,\"gradeName\":\"初二\",\"stageCode\":\"b2cf3\"},{\"id\":9,\"code\":\"eaad3\",\"createAt\":1413092017273,\"create_author\":\"libh\",\"update_at\":1413092017273,\"gradeName\":\"初三\",\"stageCode\":\"b2cf3\"},{\"id\":10,\"code\":\"83e01\",\"createAt\":1413092031548,\"create_author\":\"libh\",\"update_at\":1413092031548,\"gradeName\":\"高一\",\"stageCode\":\"947b8\",\"version\":1},{\"id\":11,\"code\":\"34bbc\",\"createAt\":1413092034856,\"create_author\":\"libh\",\"update_at\":1413092034856,\"gradeName\":\"高二\",\"stageCode\":\"947b8\"},{\"id\":12,\"code\":\"7a811\",\"createAt\":1413092039568,\"create_author\":\"libh\",\"update_at\":1413092039568,\"gradeName\":\"高三\",\"stageCode\":\"947b8\"}]', '2015-11-11 10:41:36', '1');
INSERT INTO `example` VALUES ('E052FBD0635B46FDA186134BAF37C82C', '5A2262E7A9E149BC8F80BD45B1D62EEB', 'SUCCESS', '[{\"id\":1,\"code\":\"274ea\",\"createAt\":1413177765142,\"create_author\":\"libh\",\"update_at\":1413177765142,\"subjectName\":\"数学\",\"gradeCode\":\"ff7d6,24156,09520,4a5e7,d2325,fdfaf,cf5c3,56e93,eaad3,83e01,34bbc,7a811\",\"version\":4},{\"id\":2,\"code\":\"be6c8\",\"createAt\":1413177788551,\"create_author\":\"libh\",\"update_at\":1413177788551,\"subjectName\":\"英语\",\"gradeCode\":\"ff7d6,24156,09520,4a5e7,d2325,fdfaf,cf5c3,56e93,eaad3,83e01,34bbc,7a811\"},{\"id\":3,\"code\":\"2e426\",\"createAt\":1413177806760,\"create_author\":\"libh\",\"update_at\":1413177806760,\"subjectName\":\"物理\",\"gradeCode\":\"56e93,eaad3,83e01,34bbc,7a811\"},{\"id\":4,\"code\":\"a7ecc\",\"createAt\":1413177818692,\"create_author\":\"libh\",\"update_at\":1413177818692,\"subjectName\":\"化学\",\"gradeCode\":\"eaad3,83e01,34bbc,7a811\"},{\"id\":7,\"code\":\"9c1e0\",\"createAt\":1422513939679,\"create_author\":\"zp\",\"update_at\":1422513939679,\"subjectName\":\"生物\",\"gradeCode\":\"83e01,34bbc,7a811\"},{\"id\":9,\"code\":\"1b0b2\",\"createAt\":1422514008680,\"create_author\":\"zp\",\"update_at\":1422514008680,\"subjectName\":\"历史\",\"gradeCode\":\"83e01,34bbc,7a811\"},{\"id\":11,\"code\":\"fb413\",\"createAt\":1422514016608,\"create_author\":\"zp\",\"update_at\":1422514016608,\"subjectName\":\"地理\",\"gradeCode\":\"83e01,34bbc,7a811\"},{\"id\":13,\"code\":\"5df22\",\"createAt\":1422514023796,\"create_author\":\"zp\",\"update_at\":1422514023796,\"subjectName\":\"政治\",\"gradeCode\":\"83e01,34bbc,7a811\"},{\"id\":15,\"code\":\"f43e2\",\"createAt\":1422514052075,\"create_author\":\"zp\",\"update_at\":1422514052075,\"subjectName\":\"语文\",\"gradeCode\":\"ff7d6,24156,09520,4a5e7,d2325,fdfaf,cf5c3,56e93,eaad3,83e01,34bbc,7a811\",\"version\":2}]', '2015-11-11 10:45:48', '1');
INSERT INTO `example` VALUES ('E5AC41A9701F46E6BFDAA8990A0F835A', '596059BC01754C96BE8BD95F71D38AE0', 'SUCCESS', ' {\"clozeTest\":[{\"id\":143638,\"code\":\"6caee92c3cbc46ec8556c5ef8ddab79e\",\"createAt\":1432688525555,\"create_author\":null,\"update_at\":1432688525557,\"update_author\":null,\"title\":\"GKS05506\",\"stem\":\"对任意等比数列<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image022.gif\'></img>\'></img>,下列说法一定正确的是(&nbsp;&nbsp;&nbsp;&nbsp;)\",\"stemPicture\":null,\"option\":\"[{\\\"optionKey\\\":\\\"A\\\",\\\"optionValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image040.gif\'></img>\\\"},{\\\"optionKey\\\":\\\"B\\\",\\\"optionValue\\\":\\\"&nbsp;<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image041.gif\'></img>&nbsp;\\\"},{\\\"optionKey\\\":\\\"C\\\",\\\"optionValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image042.gif\'></img>\\\"},{\\\"optionKey\\\":\\\"D\\\",\\\"optionValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image043.gif\'></img>\\\"}]\",\"optionPicture\":null,\"analyze\":\"[{\\\"analyzeKey\\\":\\\"A\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"B\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"C\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"D\\\",\\\"analyzeValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image044.gif\'></img>\\\"}]\",\"analyzePicture\":null,\"knowledgeCode\":null,\"knowledges\":\"数列\",\"productionCode\":null,\"productions\":\"等差数列与等比数列\",\"answer\":\"D\",\"star\":0,\"comment\":null,\"remark\":null,\"audio\":null,\"video\":null,\"source\":\"web\",\"isDel\":false,\"isCheck\":false,\"isCompleted\":3,\"type\":5,\"grade\":\"高三\",\"subject\":\"数学\",\"stage\":null},{\"id\":143640,\"code\":\"25fd2f2f6e234b7dbba24afe3f79a85b\",\"createAt\":1432688550568,\"create_author\":null,\"update_at\":1432688550571,\"update_author\":null,\"title\":\"GKS05507\",\"stem\":\"已知等比数列<img src = \'<img src = \'<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image001.gif\'></img>\'></img>\'></img>\'></img>的公比为正数,且<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image002.gif\'></img>\'></img>,<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image003.gif\'></img>\'></img>,则<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image004.gif\'></img>\'></img>(&nbsp;&nbsp;&nbsp;&nbsp;)\",\"stemPicture\":null,\"option\":\"[{\\\"optionKey\\\":\\\"A\\\",\\\"optionValue\\\":\\\"<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image005.gif\'></img>\'></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"B\\\",\\\"optionValue\\\":\\\"<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image006.gif\'></img>\'></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"C\\\",\\\"optionValue\\\":\\\"&nbsp;<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image007.gif\'></img>\'></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"D\\\",\\\"optionValue\\\":\\\"<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image008.gif\'></img>\'></img>\\\"}]\",\"optionPicture\":null,\"analyze\":\"[{\\\"analyzeKey\\\":\\\"A\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"B\\\",\\\"analyzeValue\\\":\\\"<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image045.gif\'></img>\'></img>\\\"},{\\\"analyzeKey\\\":\\\"C\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"D\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"}]\",\"analyzePicture\":null,\"knowledgeCode\":null,\"knowledges\":\"数列\",\"productionCode\":null,\"productions\":\"等差数列与等比数列\",\"answer\":\"B\",\"star\":0,\"comment\":null,\"remark\":null,\"audio\":null,\"video\":null,\"source\":\"web\",\"isDel\":false,\"isCheck\":false,\"isCompleted\":3,\"type\":5,\"grade\":\"高三\",\"subject\":\"数学\",\"stage\":null},{\"id\":143640,\"code\":\"25fd2f2f6e234b7dbba24afe3f79a85b\",\"createAt\":1432688550568,\"create_author\":null,\"update_at\":1432688550571,\"update_author\":null,\"title\":\"GKS05507\",\"stem\":\"已知等比数列<img src = \'<img src = \'<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image001.gif\'></img>\'></img>\'></img>\'></img>的公比为正数,且<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image002.gif\'></img>\'></img>,<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image003.gif\'></img>\'></img>,则<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image004.gif\'></img>\'></img>(&nbsp;&nbsp;&nbsp;&nbsp;)\",\"stemPicture\":null,\"option\":\"[{\\\"optionKey\\\":\\\"A\\\",\\\"optionValue\\\":\\\"<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image005.gif\'></img>\'></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"B\\\",\\\"optionValue\\\":\\\"<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image006.gif\'></img>\'></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"C\\\",\\\"optionValue\\\":\\\"&nbsp;<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image007.gif\'></img>\'></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"D\\\",\\\"optionValue\\\":\\\"<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image008.gif\'></img>\'></img>\\\"}]\",\"optionPicture\":null,\"analyze\":\"[{\\\"analyzeKey\\\":\\\"A\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"B\\\",\\\"analyzeValue\\\":\\\"<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image045.gif\'></img>\'></img>\\\"},{\\\"analyzeKey\\\":\\\"C\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"D\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"}]\",\"analyzePicture\":null,\"knowledgeCode\":null,\"knowledges\":\"数列\",\"productionCode\":null,\"productions\":\"等差数列与等比数列\",\"answer\":\"B\",\"star\":0,\"comment\":null,\"remark\":null,\"audio\":null,\"video\":null,\"source\":\"web\",\"isDel\":false,\"isCheck\":false,\"isCompleted\":3,\"type\":5,\"grade\":\"高三\",\"subject\":\"数学\",\"stage\":null},{\"id\":143642,\"code\":\"79fa80ee441840a0bbb66605a7c743fe\",\"createAt\":1432688574115,\"create_author\":null,\"update_at\":1432688574127,\"update_author\":null,\"title\":\"GKS05508\",\"stem\":\"已知<img src = \'<img src = \'<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image001.gif\'></img>\'></img>\'></img>\'></img>为等差数列,<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image046.gif\'></img>\'></img>+<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image047.gif\'></img>\'></img>+<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image048.gif\'></img>\'></img>=105,<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image049.gif\'></img>\'></img>=99,以<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image050.gif\'></img>\'></img>表示<img src = \'<img src = \'<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image001.gif\'></img>\'></img>\'></img>\'></img>的前<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image051.gif\'></img>\'></img>项和,则使得<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image050.gif\'></img>\'></img>达到最大值的<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image051.gif\'></img>\'></img>是(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)\",\"stemPicture\":null,\"option\":\"[{\\\"optionKey\\\":\\\"A\\\",\\\"optionValue\\\":\\\"21&nbsp;&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"B\\\",\\\"optionValue\\\":\\\"20&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"C\\\",\\\"optionValue\\\":\\\"19&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"D\\\",\\\"optionValue\\\":\\\"&nbsp;18\\\"}]\",\"optionPicture\":null,\"analyze\":\"[{\\\"analyzeKey\\\":\\\"A\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"B\\\",\\\"analyzeValue\\\":\\\"由<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image046.gif\'></img>\'></img>+<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image047.gif\'></img>\'></img>+<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image048.gif\'></img>\'></img>=105得<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image052.gif\'></img>即<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image053.gif\'></img>,由<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image049.gif\'></img>\'></img>=99得<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image054.gif\'></img>即<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image055.gif\'></img>,∴<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image056.gif\'></img>,<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image057.gif\'></img>,由<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image058.gif\'></img>得<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image059.gif\'></img>,此选项正确.\\\"},{\\\"analyzeKey\\\":\\\"C\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"D\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"}]\",\"analyzePicture\":null,\"knowledgeCode\":null,\"knowledges\":\"数列\",\"productionCode\":null,\"productions\":\"等差数列与等比数列\",\"answer\":\"B\",\"star\":0,\"comment\":null,\"remark\":null,\"audio\":null,\"video\":null,\"source\":\"web\",\"isDel\":false,\"isCheck\":false,\"isCompleted\":3,\"type\":5,\"grade\":\"高三\",\"subject\":\"数学\",\"stage\":null},{\"id\":143634,\"code\":\"27883f04c2cc423799116be57609a938\",\"createAt\":1432688444066,\"create_author\":null,\"update_at\":1432688444069,\"update_author\":null,\"title\":\"GKS05504\",\"stem\":\"等比数列<img src = \'<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image022.gif\'></img>\'></img>中,<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image029.gif\'></img>,则数列<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image030.gif\'></img>的前8项和等于(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)\",\"stemPicture\":null,\"option\":\"[{\\\"optionKey\\\":\\\"A\\\",\\\"optionValue\\\":\\\"6&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"B\\\",\\\"optionValue\\\":\\\"5&nbsp;&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"C\\\",\\\"optionValue\\\":\\\"4&nbsp;&nbsp;\\\"},{\\\"optionKey\\\":\\\"D\\\",\\\"optionValue\\\":\\\"3\\\"}]\",\"optionPicture\":null,\"analyze\":\"[{\\\"analyzeKey\\\":\\\"A\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"B\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"},{\\\"analyzeKey\\\":\\\"C\\\",\\\"analyzeValue\\\":\\\"<img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image031.jpg\'></img><img src = \'http://iwrong.b0.upaiyun.com/resources_v3/GKS201505181119.files/image032.jpg\'></img>此选项正确.\\\"},{\\\"analyzeKey\\\":\\\"D\\\",\\\"analyzeValue\\\":\\\"通过分析,此选项错误.\\\"}]\",\"analyzePicture\":null,\"knowledgeCode\":null,\"knowledges\":\"数列\",\"productionCode\":null,\"productions\":\"等差数列与等比数列\",\"answer\":\"C\",\"star\":0,\"comment\":null,\"remark\":null,\"audio\":null,\"video\":null,\"source\":\"web\",\"isDel\":false,\"isCheck\":false,\"isCompleted\":3,\"type\":5,\"grade\":\"高三\",\"subject\":\"数学\",\"stage\":null}]}', '2015-11-11 11:20:38', '1');
INSERT INTO `example` VALUES ('ED25D3B986C64090B0638E6FDE64B9AE', null, 'SUCCESS', 'g', '2015-12-15 08:49:54', '1');
INSERT INTO `example` VALUES ('FA17FF891CD74BDDA5BC6DCD920CE8D7', 'CCCD3D710F594226A2198693364F5972', 'SUCCESS', '{\"regions\":[\"宣武\",\"朝阳\",\"丰台\",\"海淀\",\"东城\",\"昌平\",\"西城\",\"石景山\",\"崇文\"]}', '2015-11-09 15:27:04', '1');

-- ----------------------------
-- Table structure for interfac
-- ----------------------------
DROP TABLE IF EXISTS `interfac`;
CREATE TABLE `interfac` (
  `INTERFAC_ID` varchar(32) NOT NULL COMMENT '接口编号',
  `MODULE_ID` varchar(32) DEFAULT NULL COMMENT '模块_编号',
  `INTERFAC_NAME` varchar(32) DEFAULT NULL COMMENT '接口名称',
  `INTERFAC_CODE` varchar(32) DEFAULT NULL COMMENT '接口代码',
  `INTERFAC_INTRO` varchar(256) DEFAULT NULL COMMENT '接口简介',
  `URL` varchar(256) DEFAULT NULL COMMENT '接口链接',
  `RETURN_DATA_TYPE` varchar(16) DEFAULT NULL COMMENT '返回数据类型',
  `REQUEST_TYPE` varchar(16) DEFAULT NULL COMMENT '请求方式',
  `STYLE` varchar(16) DEFAULT NULL COMMENT '风格',
  `CREAT_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '权重',
  `PARAMETER_FORMAT` varchar(16) DEFAULT NULL COMMENT '参数格式',
  PRIMARY KEY (`INTERFAC_ID`),
  KEY `FK_INTERFACE_MODULE` (`MODULE_ID`),
  CONSTRAINT `FK_INTERFACE_MODULE` FOREIGN KEY (`MODULE_ID`) REFERENCES `module` (`MODULE_ID`) ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口_接口';

-- ----------------------------
-- Records of interfac
-- ----------------------------
INSERT INTO `interfac` VALUES ('02762319B9244002853367CC2772A223', '5AF98192119F4DECA09E2C8525A73FA7', '注册', 'undefined', 'undefined', 'http://www.docin.com/p-890884029.html', 'JSON', 'POST', 'REST', null, '3', 'JSON');
INSERT INTO `interfac` VALUES ('06C5E1116C1042B6B8EB104BEA9260D5', '9BC45F488F204652A8283069E05AA23B', '关键字查询高校', 'getUniversityByKeyWord', '', 'http://192.168.1.165:8080/goodstudent/universityController/getUniversityByKeyWord.go', 'JSON', 'POST', 'GENERAL', null, '6', 'GENERAL');
INSERT INTO `interfac` VALUES ('09D6F3BF8D404293B375918C40E95A05', '9BA8F917653249DC893D55103861D374', '注册', 'undefined', 'undefined', 'http://', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('0B4BF8B8B0A24E16AFFC27E8C5F6276C', 'D53CD115CE034EBFAE5D97FC305A0F87', '分页查询感悟', 'pagingSelectInspirations', '', 'http://192.168.1.165:8080/goodstudent/inspiration/pagingSelectInspirations.go', 'JSON', 'POST', 'GENERAL', null, '4', 'GENERAL');
INSERT INTO `interfac` VALUES ('0D3DC6671B054FA497BCA7C2DBA30D9A', '56BA2AA2F2104A388671CC8B79BB261A', '注册', 'undefined', 'undefined', 'http://www.docin.com/p-890884029.html', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('12733182B9164CAFA0A07AB202E96BA7', 'DBA947337D4943D688B417A08C8027ED', '删除练习记录', 'deleteExercise', '', 'http://192.168.1.165:8080/goodstudent/answerRecordController/deleteExercise.go', 'JSON', 'POST', 'GENERAL', null, '4', 'GENERAL');
INSERT INTO `interfac` VALUES ('16AB1249170F470781DB04E4BBA79C9F', '03202D02B0B9422381A9FD38153BDD09', '获取关卡信息', 'undefined', 'undefined', 'http://192.168.1.165:8080/goodstudent/challengeSchoolController/getCustomsBarrier.go', 'JSON', 'POST', 'GENERAL', null, '6', 'GENERAL');
INSERT INTO `interfac` VALUES ('27482538BA2B4D2C90F7336510505A20', 'E77899B08FD7484CA1880485943F991B', '推送消息', 'undefined', 'undefined', 'http://127.0.0.1:8080/uutool/jpush/push?', 'JSON', 'POST', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('276B85014DCA4347B5C3854862CFEA5A', '69E4ACCCA83641D984AD02B7D4F88854', '找回密码', 'findPassword', '', 'http://192.168.1.165:8080/goodstudent/loginController/findPassword.go ', 'JSON', 'POST', 'GENERAL', null, '5', 'GENERAL');
INSERT INTO `interfac` VALUES ('2A599AAC6E94420B8D819D2C6D14DEB0', '03202D02B0B9422381A9FD38153BDD09', '保存战名校记录', 'saveChallengingSchool', '', 'http://192.168.1.165:8080/goodstudent/challengeSchoolController/saveChallengingSchool.go', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('340372AF5B2D49659E257FC55D3FB0C7', '69E4ACCCA83641D984AD02B7D4F88854', '上传头像', 'uploadFaceImage', '', 'http://192.168.1.165:8080/goodstudent/uploadPicterController/uploadFaceImage.go', 'JSON', 'POST', 'GENERAL', null, '4', 'FILE');
INSERT INTO `interfac` VALUES ('36052A2420D248F2835985FE7901AE93', '6C6EF692C14540339E98D907732AFAF7', '获取用户签到信息', 'getSign', '', 'http://192.168.1.156:8080/goodstudent/signAwardController/getSign.go', 'JSON', 'POST', 'GENERAL', null, '2', 'GENERAL');
INSERT INTO `interfac` VALUES ('3CCEADFD0AF445C8BF68FD3D5DA100C6', '9BC45F488F204652A8283069E05AA23B', '获取省内大学', 'getUniversity', '', 'http://192.168.1.165:8080/goodstudent/universityController/getUniversity.go', 'JSON', 'POST', 'GENERAL', null, '5', 'GENERAL');
INSERT INTO `interfac` VALUES ('43D35B67CA9748329EDDEE20F4A9B158', '9DE564AB71BB4FC687BC40D566B9422B', '根据习题编号查询习题详情', 'wareHouseController', '', 'http://192.168.1.165:8080/goodstudent/wareHouseController/getExerciseByCode.go', 'JSON', 'POST', 'GENERAL', null, '9', 'GENERAL');
INSERT INTO `interfac` VALUES ('50891CF5DADC4C07B63214E2B1E25F33', '9DE564AB71BB4FC687BC40D566B9422B', '获取顶层知识树', 'getKnowledgeTree', '', 'http://192.168.1.165:8080/goodstudent/wareHouseController/getKnowledgeTree.go', 'JSON', 'GET', 'GENERAL', null, '4', 'GENERAL');
INSERT INTO `interfac` VALUES ('50DCDD2D161043A7A4AC94E7F2524203', '9BC45F488F204652A8283069E05AA23B', '关键字搜索学校', 'getSchoolByKey', '', 'http://192.168.1.165:8080/goodstudent/schoolController/getSchoolByKey.go', 'JSON', 'POST', 'GENERAL', null, '4', 'GENERAL');
INSERT INTO `interfac` VALUES ('5127645D562A4E93951C815E59EDA32D', '69E4ACCCA83641D984AD02B7D4F88854', '问题反馈', 'TicklingController', '', 'http://192.168.1.165:8080/goodstudent/ticklingController/submintTickling.go', 'JSON', 'POST', 'GENERAL', null, '13', 'GENERAL');
INSERT INTO `interfac` VALUES ('5635376B0DDF43839C976A945863D356', '9BC45F488F204652A8283069E05AA23B', '获取省 直辖市', 'getProvince', '根据省 直辖市 获取下面的市和地区', 'http://192.168.1.165:8080/goodstudent/schoolController/getProvince.go', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('596059BC01754C96BE8BD95F71D38AE0', '9DE564AB71BB4FC687BC40D566B9422B', '获取习题', 'getExercises', '', 'http://192.168.1.165:8080/goodstudent/wareHouseController/getExercises.go ', 'JSON', 'POST', 'GENERAL', null, '6', 'GENERAL');
INSERT INTO `interfac` VALUES ('5A2262E7A9E149BC8F80BD45B1D62EEB', '9DE564AB71BB4FC687BC40D566B9422B', '获取学科', 'getSubject', '', 'http://192.168.1.165:8080/goodstudent/wareHouseController/ getSubject.go', 'JSON', 'GET', 'GENERAL', null, '2', 'GENERAL');
INSERT INTO `interfac` VALUES ('6205A4EC8D8945739693FBED1C20C1D2', '9DE564AB71BB4FC687BC40D566B9422B', '获取教材版本', 'getBookType', '', 'http://192.168.1.165:8080/goodstudent/wareHouseController/getBookType.go ', 'JSON', 'GET', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('6549023E7887420EB14736CD95E76DD3', 'E77899B08FD7484CA1880485943F991B', '推送日志主要数据', 'undefined', 'undefined', 'http://127.0.0.1:8080/uutool/jpush/getJpushLogIndex?', 'JSON', 'POST', 'GENERAL', null, '2', 'GENERAL');
INSERT INTO `interfac` VALUES ('6725D744DB1847B5BC341F5BBE6969B8', '700875D5AAED4DC6ADEF0F1E2BC897B5', '第1个接口', 'fist', '第1个接口', 'http://192.169.1.0', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('68CAF36B1DDD4641BDE2977831D48271', 'DBA947337D4943D688B417A08C8027ED', '获取错题集信息', 'getCollectMistake', '', 'http://192.168.1.165:8080/goodstudent/answerRecordController/getCollectMistake.go', 'JSON', 'POST', 'GENERAL', null, '7', 'GENERAL');
INSERT INTO `interfac` VALUES ('6BAAD463F7A740B9884CBF50C835A05C', '9DE564AB71BB4FC687BC40D566B9422B', '获取下级知识树', 'getNextKnowledgeTree', '', 'http://192.168.1.165:8080/goodstudent/wareHouseController/getNextKnowledgeTree.go', 'JSON', 'GET', 'GENERAL', null, '5', 'GENERAL');
INSERT INTO `interfac` VALUES ('716C76310D4546C5921124C8401AE3B3', '69E4ACCCA83641D984AD02B7D4F88854', '完善个人信息', 'perfectUser', '', 'http://192.168.1.165:8080/goodstudent/userController/perfectUser.go', 'JSON', 'POST', 'GENERAL', null, '6', 'GENERAL');
INSERT INTO `interfac` VALUES ('733E24FF765645FE8A225D8902CBB48B', '03202D02B0B9422381A9FD38153BDD09', '获取战名校排行榜', 'getChallengeView', '', 'http://192.168.1.165:8080/goodstudent/challengeSchoolController/getChallengeView.go', 'JSON', 'POST', 'GENERAL', null, '7', 'GENERAL');
INSERT INTO `interfac` VALUES ('77EC98F9230446EDAD57A0A96FBF2CA2', '2306CCB9449C4585AAD38C1B4DC412DF', '获取5周的做题统计', 'getAnswerRecordSizeWeek', 'getAnswerRecordSizeWeek', 'http://192.168.1.165:8080/goodstudent/answerRecordController/getAnswerRecordSizeWeek.go', 'JSON', 'POST', 'GENERAL', null, '2', 'GENERAL');
INSERT INTO `interfac` VALUES ('7804E28413444AA48C50D6F39706E4DD', '69E4ACCCA83641D984AD02B7D4F88854', '验证SessionID', 'verificationSessionID', '', 'http://192.168.1.165:8080/goodstudent/loginController/verificationSessionID.go', 'JSON', 'POST', 'GENERAL', null, '8', 'GENERAL');
INSERT INTO `interfac` VALUES ('799570CB5852421EA592EED4CC5CD700', 'D89E8C10EB4543D0B4C4D607C2BBFB62', '短信日志详情', 'undefined', 'undefined', 'http://127.0.0.1:8080/uutool/sms/getDetail?', 'JSON', 'POST', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('79FE4387B35749EEAFEA69F1550712D8', '6C6EF692C14540339E98D907732AFAF7', '获取签到奖励信息', 'getSignAward', '', 'http://192.168.1.156:8080/goodstudent/signAwardController/getSignAward.go', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('7A09B9CA2CB041AFBD05BE5369CC1B0E', '700875D5AAED4DC6ADEF0F1E2BC897B5', '第2个接口', '', '', '', 'JSON', 'POST', 'GENERAL', null, '2', 'GENERAL');
INSERT INTO `interfac` VALUES ('7F056A3482384022B22C10439EC9B369', '9BC45F488F204652A8283069E05AA23B', '获取中学', 'getSchool', '', 'http://192.168.1.165:8080/goodstudent/schoolController/getSchool.go', 'JSON', 'POST', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('7F564EFB242748939746C2315A668FF9', '2306CCB9449C4585AAD38C1B4DC412DF', '获取5天的做题统计', ' getAnswerRecordSize', '', 'http://192.168.1.165:8080/goodstudent/answerRecordController/getAnswerRecordSize.go', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('800E69B62466412782E2B0E92D5B3161', '69E4ACCCA83641D984AD02B7D4F88854', '退出系统', 'exit', '', 'http://192.168.1.165:8080/goodstudent/loginController/exit.go', 'JSON', 'POST', 'GENERAL', null, '9', 'GENERAL');
INSERT INTO `interfac` VALUES ('8066B6142C7D428D8B1329D152DF013E', '69E4ACCCA83641D984AD02B7D4F88854', '修改密码', 'updatePassword', '', 'http://192.168.1.165:8080/goodstudent/loginController/updatePassword.go', 'JSON', 'POST', 'GENERAL', null, '12', 'GENERAL');
INSERT INTO `interfac` VALUES ('854A7064481C4E65B88CEB0C84AA6E40', '03202D02B0B9422381A9FD38153BDD09', '重新开始战名校', 'deleteChallengingSchool', '', 'http://192.168.1.165:8080/goodstudent/challengeSchoolController/deleteChallengingSchool.go', 'JSON', 'POST', 'GENERAL', null, '5', 'GENERAL');
INSERT INTO `interfac` VALUES ('863FB49D65744256A85518E872D333CC', '8DF4229A16664815B60BC426880AA7C7', '获取更新', 'versionsUpdate', '', 'http://127.0.0.1:8080/goodstudent/versionController/versionsUpdate.go', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('8A6270EC6105429E84B83E095C9DF141', '69E4ACCCA83641D984AD02B7D4F88854', '获取手机验证码', 'verificationCode ', '', 'http://192.168.1.165:8080/goodstudent/loginController/verificationCode.go ', 'JSON', 'POST', 'GENERAL', null, '4', 'GENERAL');
INSERT INTO `interfac` VALUES ('92CF6445FB4D449D9889919A8C63A0B9', '69E4ACCCA83641D984AD02B7D4F88854', '修改个人资料', 'updateUser ', '', 'http://192.168.1.165:8080/goodstudent/userController/updateUser.go', 'JSON', 'POST', 'GENERAL', null, '7', 'GENERAL');
INSERT INTO `interfac` VALUES ('939C2627FA604779927259D5AE43BDFA', 'DBA947337D4943D688B417A08C8027ED', '添加解题心得', 'addSolveQuestionExperience', '', 'http://192.168.1.165:8080/goodstudent/solveQuestionExperienceController/addSolveQuestionExperience.go', 'JSON', 'POST', 'GENERAL', null, '5', 'GENERAL');
INSERT INTO `interfac` VALUES ('965EDF63544B4804BE66F1D18518E877', 'D89E8C10EB4543D0B4C4D607C2BBFB62', '短信发送', 'undefined', 'undefined', 'http://127.0.0.1:8080/uutool/sms/verificationCode?', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('978C62DABEFE4EF5B8E62A35F54D18BB', '69E4ACCCA83641D984AD02B7D4F88854', '用户注册', 'loginController/register.go ', '', 'http://192.168.1.165:8080/goodstudent/loginController/register.go ', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('9ACEABFEA17241DC9A07F931D652B6AF', '03202D02B0B9422381A9FD38153BDD09', '获取正在挑战的名校信息', 'getChallengingSchool', '', 'http://192.168.1.165:8080/goodstudent/challengeSchoolController/getChallengingSchool.go', 'JSON', 'POST', 'GENERAL', null, '4', 'GENERAL');
INSERT INTO `interfac` VALUES ('9D443B2FCA4F40E39981C4D8111C9A6D', 'E77899B08FD7484CA1880485943F991B', '推送日志详情', 'undefined', 'undefined', 'http://127.0.0.1:8080/uutool/jpush/getDetail?', 'JSON', 'POST', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('9F7EE10BB25E436DB144C20891A64D36', '5D8B842C78614B9199F5630EA8195C7E', '发送邮件', 'undefined', 'undefined', ' http://127.0.0.1:8080/uutool/email/sendEmail?', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('A1B3310C3A634692AC7D838B14DD1ED2', '69E4ACCCA83641D984AD02B7D4F88854', '获取用户信息', 'getUser', '', 'http://192.168.1.165:8080/goodstudent/userController/getUser.go', 'JSON', 'POST', 'GENERAL', null, '6', 'GENERAL');
INSERT INTO `interfac` VALUES ('A743D5D4D9FA4A359CFE34C52C8F9D9F', 'D53CD115CE034EBFAE5D97FC305A0F87', '修改感悟', 'updateInspiration', '', 'http://192.168.1.165:8080/goodstudent/inspiration/updateInspiration.go', 'JSON', 'POST', 'GENERAL', null, '2', 'FILE');
INSERT INTO `interfac` VALUES ('A8E443E99CE14CE1A54DBA4F9A5454DC', '5D8B842C78614B9199F5630EA8195C7E', '获取邮件日志主要信息', 'undefined', 'undefined', ' http://127.0.0.1:8080/uutool/email/getEmailLogIndex?', 'JSON', 'POST', 'GENERAL', null, '2', 'GENERAL');
INSERT INTO `interfac` VALUES ('ABAF572259514DAFB33622C9895F3CF0', 'DBA947337D4943D688B417A08C8027ED', '获取收藏习题信息', 'collectExerciseController', '', 'http://192.168.1.165:8080/goodstudent/collectExerciseController/getCollectExercise.go', 'JSON', 'POST', 'GENERAL', null, '6', 'GENERAL');
INSERT INTO `interfac` VALUES ('ACC02C913EC447D481F375C1CB40F99A', 'D53CD115CE034EBFAE5D97FC305A0F87', '感悟点赞', 'praiseInspiration', '', 'http://192.168.1.165:8080/goodstudent/inspiration/praiseInspiration.go', 'JSON', 'POST', 'GENERAL', null, '5', 'GENERAL');
INSERT INTO `interfac` VALUES ('AD8C9A02C1524E5D872ACED339B2E73C', 'DBA947337D4943D688B417A08C8027ED', '收藏习题', 'collectExercise', '', 'http://192.168.1.165:8080/goodstudent/collectExerciseController/collectExercise.go', 'JSON', 'POST', 'GENERAL', null, '5', 'GENERAL');
INSERT INTO `interfac` VALUES ('ADF64C4D8C4D464C9BF2680B5087FC8E', 'DBA947337D4943D688B417A08C8027ED', '提交多个练习', 'submintAnswerRecords', '', 'http://192.168.1.165:8080/goodstudent/answerRecordController/submintAnswerRecords.go', 'JSON', 'POST', 'GENERAL', null, '4', 'JSON');
INSERT INTO `interfac` VALUES ('AF335E8F8C4949A685A3FA8F45881FAA', 'D53CD115CE034EBFAE5D97FC305A0F87', '增加感悟浏览量', 'browseInspiration', '', 'http://192.168.1.165:8080/goodstudent/inspiration/browseInspiration.go', 'JSON', 'POST', 'GENERAL', null, '6', 'GENERAL');
INSERT INTO `interfac` VALUES ('B300AE81C2064669ADED95BDDBB3A580', '80A875A85D854564BFF8B68C7E2582C2', '测试即可', 'undefined', 'undefined', ' http://127.0.0.1:8080/uutool/email/sendEmail?', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('B348C411DD9340F5804A5259E9D6FACE', '745B637C37D24072B85B21658268ED6C', '测试即可', 'undefined', 'undefined', ' http://127.0.0.1:8080/uutool/email/sendEmail?', 'JSON', 'POST', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('B44EAE8E069A48A1B35C02A7C922670D', '6C6EF692C14540339E98D907732AFAF7', '用户签到', 'sign.go', '', 'http://192.168.1.165:8080/goodstudent/signAwardController/sign.go', 'JSON', 'POST', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('B4637C5E9665406D88BBB182E141BDD2', '9DE564AB71BB4FC687BC40D566B9422B', '获取年级', 'getGrade', '', 'http://192.168.1.165:8080/goodstudent/wareHouseController/getGrade.go ', 'JSON', 'GET', 'GENERAL', null, '1', 'GENERAL');
INSERT INTO `interfac` VALUES ('B8A72F765D6D4A8DAC3EDDEF7CEB2468', '03202D02B0B9422381A9FD38153BDD09', '战名校概况', 'initChallengingSchool', '', 'http://192.168.1.165:8080/goodstudent/challengeSchoolController/initChallengingSchool.go', 'JSON', 'POST', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('B91289B8F89F4CFE98AFFF0EA1B61C1B', '2306CCB9449C4585AAD38C1B4DC412DF', '获取某天某周的做题详情', 'getSizeForAllSubject', '', 'http://192.168.1.165:8080/goodstudent/answerRecordController/getSizeForAllSubject.go', 'JSON', 'POST', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('BD50776D9D534189A3DCEABF1470D001', '5D8B842C78614B9199F5630EA8195C7E', '邮件日志详情', 'undefined', 'undefined', 'http://127.0.0.1:8080/uutool/email/getDetail?', 'JSON', 'POST', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('BDFC3407E76A4D79A8529EA9EB56CD58', '69E4ACCCA83641D984AD02B7D4F88854', '获取经验/金币/等级信息', 'getWealthAndExperience', '', 'http://192.168.1.165:8080/goodstudent/answerRecordController/getWealthAndExperience.go', 'JSON', 'POST', 'GENERAL', null, '10', 'GENERAL');
INSERT INTO `interfac` VALUES ('CBC118FCD9A24234A8B7E00371D047C5', 'D53CD115CE034EBFAE5D97FC305A0F87', '删除感悟', 'deleteInspiration', '', 'http://192.168.1.165:8080/goodstudent/inspiration/deleteInspiration.go', 'JSON', 'POST', 'GENERAL', null, '3', 'GENERAL');
INSERT INTO `interfac` VALUES ('CCCD3D710F594226A2198693364F5972', '9BC45F488F204652A8283069E05AA23B', '获取市和区', 'getRegion', '', 'http://192.168.1.165:8080/goodstudent/schoolController/getRegion.go', 'JSON', 'POST', 'GENERAL', null, '2', 'GENERAL');
INSERT INTO `interfac` VALUES ('D47EF272D76E4AB28E2291A317EEC4AD', '9DE564AB71BB4FC687BC40D566B9422B', '组卷', 'combinationExercises', '', 'http://192.168.1.165:8080/goodstudent/wareHouseController/combinationExercises.go', 'JSON', 'POST', 'GENERAL', null, '7', 'JSON');
INSERT INTO `interfac` VALUES ('D72C3AB1312D4BE3AF8C5E806FF29F9C', '9BC45F488F204652A8283069E05AA23B', '全国高校 获取省份', 'getProvince', '', 'http://192.168.1.165:8080/goodstudent/universityController/getProvince.go', 'JSON', 'POST', 'GENERAL', null, '4', 'GENERAL');
INSERT INTO `interfac` VALUES ('D773BFD06755438283AA3CCEDF890EA4', '69E4ACCCA83641D984AD02B7D4F88854', '用户登录', 'login', '', 'http://192.168.1.165:8080/goodstudent/loginController/login.go', 'JSON', 'POST', 'GENERAL', null, '2', 'GENERAL');
INSERT INTO `interfac` VALUES ('D7A05F7235AC45CFB17F154B00879B27', '9DE564AB71BB4FC687BC40D566B9422B', '根据学科,关卡获得习题', 'getExercisesSubject', '', 'http://192.168.1.165:8080/goodstudent/wareHouseController/getExercisesSubject.go', 'JSON', 'POST', 'GENERAL', null, '8', 'GENERAL');
INSERT INTO `interfac` VALUES ('E3793B552185402EBAA7B37C164D6A08', 'D53CD115CE034EBFAE5D97FC305A0F87', '保存感悟', 'saveInspiation', '', 'http://192.168.1.165:8080/goodstudent/inspiration/saveInspiation.go', 'JSON', 'POST', 'GENERAL', null, '1', 'FILE');
INSERT INTO `interfac` VALUES ('E637F5E7F8314572BB80CFE4552384A9', '69E4ACCCA83641D984AD02B7D4F88854', '查看用户的sessionID', 'getSessionID', '调试时使用', 'http://192.168.1.245/goodstudent/loginController/getSessionId.go', 'JSON', 'POST', 'GENERAL', null, '11', 'GENERAL');
INSERT INTO `interfac` VALUES ('EF6D1389B8424AE98EDADF74D00D6E5F', '03202D02B0B9422381A9FD38153BDD09', '提交答卷', 'submintAnswerRecords', '', 'http://192.168.1.165:8080/goodstudent/challengeSchoolController/submintAnswerRecords.go', 'JSON', 'POST', 'GENERAL', null, '2', 'JSON');
INSERT INTO `interfac` VALUES ('F59CBAF03D664B768E5952AF16446E21', '5AF98192119F4DECA09E2C8525A73FA7', '登录', 'undefined', 'undefined', 'http://sooncode.com/api', 'JSON', 'POST', 'REST', null, '0', 'GENERAL');
INSERT INTO `interfac` VALUES ('F6AE3EF135E54802B8349F7F14DA4380', 'D89E8C10EB4543D0B4C4D607C2BBFB62', '短信日志主要数据', 'undefined', 'undefined', 'http://127.0.0.1:8080/uutool/sms/getSmsLogIndex?', 'JSON', 'POST', 'GENERAL', null, '2', 'GENERAL');

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `MODULE_ID` varchar(32) NOT NULL COMMENT '模块编号',
  `PROJECT_ID` varchar(32) DEFAULT NULL COMMENT '项目_编号',
  `MODULE_NAME` varchar(16) DEFAULT NULL COMMENT '模块名称',
  `MODULE_CODE` varchar(32) DEFAULT NULL COMMENT '模块代码',
  `MODULE_INTRO` varchar(256) DEFAULT NULL COMMENT '模块简介',
  `CREAT_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`MODULE_ID`),
  KEY `FK_MODULE_PROJECT` (`PROJECT_ID`),
  CONSTRAINT `FK_MODULE_PROJECT` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块_模块';

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('03202D02B0B9422381A9FD38153BDD09', '9B8AACB65185483DAADF914C26703FD9', '战名校模块', 'challengingSchool', '', '2015-11-24 16:31:09', '9');
INSERT INTO `module` VALUES ('0B8A79E323A24B2685BBB7F2F8444DC7', null, '第5模块', '5', '555', null, '4');
INSERT INTO `module` VALUES ('1B2AF587BBF140BB9DD6734C5B04B791', null, '第6模块', '6', '666', null, '7');
INSERT INTO `module` VALUES ('2306CCB9449C4585AAD38C1B4DC412DF', '9B8AACB65185483DAADF914C26703FD9', '统计模块', 'total', '', null, '6');
INSERT INTO `module` VALUES ('291F9234481C4FB4893E46221696E683', '4FE95D26295846979FC1D07D3393B2C8', '测试模块4', 'undefined', 'undefined', null, '4');
INSERT INTO `module` VALUES ('56BA2AA2F2104A388671CC8B79BB261A', null, '用户模块', 'undefined', 'undefined', null, '1');
INSERT INTO `module` VALUES ('5AF98192119F4DECA09E2C8525A73FA7', null, '用户模块', 'undefined', 'undefined', null, '1');
INSERT INTO `module` VALUES ('5D8B842C78614B9199F5630EA8195C7E', '543762007CDC4063B787AE4E71C14762', '邮件模块', 'undefined', 'undefined', null, '2');
INSERT INTO `module` VALUES ('65BADA8E7D3F4472A14E7BE50D821F4C', null, '第7个模块', '', '', null, '8');
INSERT INTO `module` VALUES ('69E4ACCCA83641D984AD02B7D4F88854', '9B8AACB65185483DAADF914C26703FD9', '用户模块', 'user', '', '2015-11-16 10:56:12', '1');
INSERT INTO `module` VALUES ('6C6EF692C14540339E98D907732AFAF7', '9B8AACB65185483DAADF914C26703FD9', '签到模块', 'sign', '', null, '5');
INSERT INTO `module` VALUES ('700875D5AAED4DC6ADEF0F1E2BC897B5', null, '第1模块', 'user', '1', null, '1');
INSERT INTO `module` VALUES ('745B637C37D24072B85B21658268ED6C', '4FE95D26295846979FC1D07D3393B2C8', '测试模块1', 'undefined', 'undefined', null, '3');
INSERT INTO `module` VALUES ('778799DE21554513AEC8114D72781F77', '4FE95D26295846979FC1D07D3393B2C8', '测试模块3', 'undefined', 'undefined', null, '2');
INSERT INTO `module` VALUES ('80A875A85D854564BFF8B68C7E2582C2', '4FE95D26295846979FC1D07D3393B2C8', '测试模块2', 'undefined', 'undefined', null, '1');
INSERT INTO `module` VALUES ('8DF4229A16664815B60BC426880AA7C7', '9B8AACB65185483DAADF914C26703FD9', '系统模块', 'system', '', null, '8');
INSERT INTO `module` VALUES ('9BA8F917653249DC893D55103861D374', '5605C8B8E44540608B0D5CB0CADAA7B7', '用户模块', 'undefined', 'undefined', null, '1');
INSERT INTO `module` VALUES ('9BC45F488F204652A8283069E05AA23B', '9B8AACB65185483DAADF914C26703FD9', '组件模块', 'subassembly', '是否', '2015-11-16 10:56:16', '8');
INSERT INTO `module` VALUES ('9DE564AB71BB4FC687BC40D566B9422B', '9B8AACB65185483DAADF914C26703FD9', '资源平台模块', '', '', '2015-11-16 10:56:21', '4');
INSERT INTO `module` VALUES ('A69D54065B264FB2917BE5E5DF6650D4', null, '第3模块', '33', '33', null, '3');
INSERT INTO `module` VALUES ('D53CD115CE034EBFAE5D97FC305A0F87', '9B8AACB65185483DAADF914C26703FD9', '感悟模块', 'inspiration', '', '2015-11-16 10:56:25', '2');
INSERT INTO `module` VALUES ('D89E8C10EB4543D0B4C4D607C2BBFB62', '543762007CDC4063B787AE4E71C14762', '短信模块', 'undefined', 'undefined', null, '3');
INSERT INTO `module` VALUES ('DBA947337D4943D688B417A08C8027ED', '9B8AACB65185483DAADF914C26703FD9', '练习模块', 'ex', '', '2015-11-16 10:56:29', '3');
INSERT INTO `module` VALUES ('E77899B08FD7484CA1880485943F991B', '543762007CDC4063B787AE4E71C14762', '推送模块', 'undefined', 'undefined', null, '1');

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `OPERATION_ID` varchar(32) NOT NULL COMMENT '操作编号',
  `OPERATION_NAME` varchar(32) DEFAULT NULL COMMENT '操作名称',
  `OPERATION_CODE` varchar(32) DEFAULT NULL COMMENT '操作代码',
  PRIMARY KEY (`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限_操作';

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('643D6526E23F4FF8A241499531144195', '编辑', 'EDIT');
INSERT INTO `operation` VALUES ('8DAF951448FD4B73ADE2D86571F673EB', '查看', 'LOOK');

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `PARAMETER_ID` varchar(32) NOT NULL COMMENT '参数编号',
  `INTERFAC_ID` varchar(32) DEFAULT NULL COMMENT '接口_编号',
  `PARAMETER_NAME` varchar(32) DEFAULT NULL COMMENT '参数名称',
  `PARAMETER_CODE` varchar(32) DEFAULT NULL COMMENT '参数代码',
  `PARAMETER_DATA_TYPE` varchar(32) DEFAULT NULL COMMENT '参数数据类型',
  `MIN_LENGTH` int(11) DEFAULT NULL COMMENT '最小长度',
  `MAX_LENGTH` int(11) DEFAULT NULL COMMENT '最大长度',
  `PARAMETER_EXAMPLE` text COMMENT '参数实例',
  `PARAMETER_EXPLAIN` varchar(640) DEFAULT NULL COMMENT '参数说明',
  `IS_MUST` varchar(16) DEFAULT NULL COMMENT '是否必须',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '权重',
  `CREAT_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`PARAMETER_ID`),
  KEY `FK_PARAMETER_INTERFACE` (`INTERFAC_ID`),
  CONSTRAINT `FK_PARAMETER_INTERFACE` FOREIGN KEY (`INTERFAC_ID`) REFERENCES `interfac` (`INTERFAC_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数_参数';

-- ----------------------------
-- Records of parameter
-- ----------------------------
INSERT INTO `parameter` VALUES ('0143E4ED4117479EB6F984DB45BEA70B', '716C76310D4546C5921124C8401AE3B3', '性别', 'gender', 'Integer', '1', '1', '1', '', '1', '1', '2015-11-30 13:33:58');
INSERT INTO `parameter` VALUES ('02E22642BC53438C9F32FB9865567A97', 'EF6D1389B8424AE98EDADF74D00D6E5F', 'JSON格式的参数', 'jsonString', 'String', '1', '10000', '{    \"sessionId\": \"55287EC4CDFB42EB9EE83DD2F2DC3B44\",    \"challengeSchoolId\": \"1\",\"customsBarrier\": \"1\",    \"exercises\": [        {            \"exercisesId\": \"3f3f3b5a92db4d1ea7497d1750a3d698\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        },        {            \"exercisesId\": \"266ce8b224f740f608f5db2ae5e15b68\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        },        {            \"exercisesId\": \"9596acbff9434120a38f39e951a59b79\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        },        {            \"exercisesId\": \"266ce8b224f440f698f5db2ae5e15b68\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        },        {            \"exercisesId\": \"266ce8b224f640f698f5db2ae5e15b68\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        },        {            \"exercisesId\": \"266ce8b224f740f698f5db2ae5e15b68\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        },        {            \"exercisesId\": \"266ce8b224f740f698f5db2ae5e15b68\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        },{            \"exercisesId\": \"266ce8b2245740f698f5db2ae5e15b68\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        },{            \"exercisesId\": \"266ce8b224f840f698f5db2ae5e15b68\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        },{            \"exercisesId\": \"266ce8b224f740f698f5db8ae5e15b68\",            \"subjectId\": \"274ea\",            \"gradeId\": \"83e01\",            \"isRight\": \"1\"        }    ]}', '必须保证是标准的JSON格式', '1', '1', '2015-11-26 10:50:53');
INSERT INTO `parameter` VALUES ('03A41EEDF80541908C24BBCF66998232', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '英语科代码', 'englishSubjectCode', 'String', '1', '6', 'be6c8', '', '0', '6', '2015-12-07 10:23:21');
INSERT INTO `parameter` VALUES ('058B7AC2F5384061B66D01A6C126F1BB', '50DCDD2D161043A7A4AC94E7F2524203', '关键字', 'key', 'String', '1', '32', '北京', '', '1', '1', '2015-11-30 09:38:05');
INSERT INTO `parameter` VALUES ('06384714B88842879BF0754FD1008791', 'D773BFD06755438283AA3CCEDF890EA4', '手机号码', 'phoneNumber', 'String', '11', '11', '13878789898', '', '1', '1', '2015-11-07 15:43:21');
INSERT INTO `parameter` VALUES ('08166623DB6142008E92B15D167BE2D3', '36052A2420D248F2835985FE7901AE93', '会话ID', 'sessionId', 'String', '32', '32', 'D2F1407E675143579A43A8E18EEDA3BE', '', '1', '1', '2015-12-03 09:49:48');
INSERT INTO `parameter` VALUES ('0861EFB6D9684FB1A1FC5142D11E48E8', '8066B6142C7D428D8B1329D152DF013E', '旧密码', 'oldPassword', 'String', '6', '16', '000000', '', '1', '2', '2015-12-09 16:33:35');
INSERT INTO `parameter` VALUES ('09C2C083623B4663B5C4E616C06417F7', '9D443B2FCA4F40E39981C4D8111C9A6D', '时间范围类型', 'type', 'String', '1', '32', 'today', '必须保证是标准的JSON格式', '1', '2', '2016-03-21 14:10:59');
INSERT INTO `parameter` VALUES ('0A369F0F7FFE43678BAE2CB66A3ECBEE', '7F056A3482384022B22C10439EC9B369', '市或区', 'region', 'String', '2', '16', '海淀', '市或区的汉字', '1', '2', '2015-11-09 15:25:15');
INSERT INTO `parameter` VALUES ('0B69C11CE0A141138EBBF1EE243975FB', '9F7EE10BB25E436DB144C20891A64D36', '模板类型', 'sendType', 'String', '3', '32', 'login', '必须保证是标准的JSON格式', '1', '7', '2016-03-21 09:49:36');
INSERT INTO `parameter` VALUES ('0C861915670A4742A9E4084A1FFB61F9', 'ACC02C913EC447D481F375C1CB40F99A', '感悟编号', 'inspirationId', 'Long', '1', '1', '1', '', '1', '2', '2015-11-17 11:04:40');
INSERT INTO `parameter` VALUES ('0D691832FC774FB19F999DB972B4090D', '27482538BA2B4D2C90F7336510505A20', '推送内容', 'content', 'String', '1', '128', 'fsfsfsdffsdfsddddddfsdf', '必须保证是标准的JSON格式', '1', '4', '2016-03-21 13:29:17');
INSERT INTO `parameter` VALUES ('10AE094B12664A1C8F507BC98F28AB4E', null, '回话ID', 'sessionId', 'String', '32', '32', 'E20F8481F06B4B1EA7B2AA91E0154A4C', '', '1', '1', '2015-11-09 10:07:16');
INSERT INTO `parameter` VALUES ('119E43BDD7BD487A84C38DB8D1859B33', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '化学代码', 'chemistrySubjectCode', 'String', '1', '6', 'a7ecc', '', '0', '11', '2015-12-07 10:26:34');
INSERT INTO `parameter` VALUES ('12A533F7D44143CE86C941D7425CCC6C', 'B44EAE8E069A48A1B35C02A7C922670D', '会话ID', 'sessionId', 'String', '32', '32', 'D2F1407E675143579A43A8E18EEDA3BE', '', '1', '1', '2015-12-03 11:11:43');
INSERT INTO `parameter` VALUES ('1C0985AFEB6848EB8488049AF056BA4E', 'ABAF572259514DAFB33622C9895F3CF0', '会话ID', 'sessionId', 'String', '32', '32', 'D2F1407E675143579A43A8E18EEDA3BE', '', '1', '1', '2015-12-02 13:05:47');
INSERT INTO `parameter` VALUES ('1F6A12A651E74723BEDE827D03C3C183', '0B4BF8B8B0A24E16AFFC27E8C5F6276C', '每页长度', 'pageSize', 'Integer', '1', '1', '5', '', '1', '3', '2015-11-13 09:30:22');
INSERT INTO `parameter` VALUES ('20D2EF4933DA44DA93D7B49084B0530A', null, 'name', 'name', 'String', '1', '1', '1', '', '1', '2', '2015-11-25 17:42:39');
INSERT INTO `parameter` VALUES ('211CBAF237484DF1A51851FFB4CC5AA7', '716C76310D4546C5921124C8401AE3B3', '语文教材名称', 'chineseTypeName', 'String', '1', '32', '人教版', '', '1', '25', '2015-11-30 14:35:48');
INSERT INTO `parameter` VALUES ('21717A56361641FF96AEF7EAAC92AEE6', '27482538BA2B4D2C90F7336510505A20', '推送对象', 'object', 'String', '1', '1', '13681004142', '必须保证是标准的JSON格式', '1', '1', '2016-03-29 10:05:31');
INSERT INTO `parameter` VALUES ('2184DA10122A4F3596C4A0EF2B69FC4A', 'A743D5D4D9FA4A359CFE34C52C8F9D9F', '封面图片', 'coverPictureFile', 'File', '1', '1', '', '', '1', '4', '2015-11-13 09:21:38');
INSERT INTO `parameter` VALUES ('227664943DD44F9987715357FAD5C365', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '语文科代码', 'chineseSubjectCode', 'String', '1', '6', 'f43e2', '', '0', '4', '2015-12-07 10:21:21');
INSERT INTO `parameter` VALUES ('23D5C3F083F443F5970AB3AA0042170D', '716C76310D4546C5921124C8401AE3B3', '数学教材名称', 'mathTypeName', 'String', '1', '32', '人教版', '', '1', '26', '2015-11-30 14:36:32');
INSERT INTO `parameter` VALUES ('26238622099F418985FF47B9ACDD9D31', '716C76310D4546C5921124C8401AE3B3', '历史科代码', 'historySubjectCode', 'String', '1', '16', '1b0b2', '', '0', '13', '2015-11-30 13:49:42');
INSERT INTO `parameter` VALUES ('265F76A3628C41E38ACC856AF178B7D2', null, '星级', 'start', 'String', '3', '3', '1', '', '1', '6', '2015-11-07 15:04:54');
INSERT INTO `parameter` VALUES ('268D7AF4FE494B4F8C7B9D6B01D49629', '77EC98F9230446EDAD57A0A96FBF2CA2', '会话ID', 'sessionId', 'String', '32', '32', '006FF0209FF34C1C9803A21874CC131D', '', '1', '1', '2015-12-01 09:53:32');
INSERT INTO `parameter` VALUES ('27C7AF67A9804DD5AB0805B6A330B2F0', '77EC98F9230446EDAD57A0A96FBF2CA2', '学科编号', 'subjectCode', 'String', '1', '16', '274ea', '', '0', '3', '2015-12-01 09:59:51');
INSERT INTO `parameter` VALUES ('2AD62B8D3FD841229AA857E1CFE221BD', 'B8A72F765D6D4A8DAC3EDDEF7CEB2468', '战名校编号', 'challengeSchooleId', 'Long', '1', '1', '1', '', '1', '2', '2015-11-26 15:22:11');
INSERT INTO `parameter` VALUES ('2B7BC7F42E2742059351E86B690C4278', null, '学科代码', 'subjectCode', 'String', '16', '16', '274ea ', '', '1', '3', '2015-11-07 15:02:41');
INSERT INTO `parameter` VALUES ('2C9A16F4E75348C987D99BE79A0D9411', '596059BC01754C96BE8BD95F71D38AE0', '每页长度', 'pageSize', 'Integer', '11', '11', '5', '', '1', '2', '2015-11-11 11:14:50');
INSERT INTO `parameter` VALUES ('2D6DE487B3AC4F96A4955A5F9BCE6693', '716C76310D4546C5921124C8401AE3B3', '所在中学编号', 'shoolId', 'Long', '1', '1', '109572', '', '1', '5', '2015-11-30 13:35:39');
INSERT INTO `parameter` VALUES ('2D9A7CBBC0C64542A36BB4E01DE1B240', 'D7A05F7235AC45CFB17F154B00879B27', '学科编号', 'subjectCode', 'String', '16', '16', '274ea', '', '1', '1', '2015-11-23 15:03:27');
INSERT INTO `parameter` VALUES ('2F03906643C24DE4B5022C0155B9B0C9', '0B4BF8B8B0A24E16AFFC27E8C5F6276C', '会话ID', 'sessionId', 'String', '1', '32', '896AC0D30E024D07BCC34A95DE7A16C6', '', '1', '1', '2015-11-13 09:29:10');
INSERT INTO `parameter` VALUES ('32BB7036C5BA4865A66A5BF1858E946D', 'D47EF272D76E4AB28E2291A317EEC4AD', 'JSON格式的参数', 'jsonString', 'String', '1', '10000', '{\r\n    \"customsBarrier\": \"5\",\r\n    \"subjects\": [\r\n        \"274ea\",\r\n        \"f43e2\",\r\n        \"be6c8\",\r\n        \"2e426\",\r\n        \"9c1e0\",\r\n        \"a7ecc\"\r\n    ],\r\n    \"booktypes\": [\r\n        \"f0feb18fb79847e59b12b3797be7ce66\",\r\n        \"f0feb18fb79847e59b12b3797be7ce66\",\r\n        \"f0feb18fb79847e59b12b3797be7ce66\",\r\n        \"b20f9df0c1fe4a1d883bb36c447dac10\",\r\n        \"f0feb18fb79847e59b12b3797be7ce66\",\r\n        \"002770a34b04454fa6626e28ba67fa4c\"\r\n    ]\r\n}', '必须保证是标准的JSON格式', '1', '1', '2015-11-23 11:28:10');
INSERT INTO `parameter` VALUES ('3325A806DB53483D80DD296CB0A7E7B3', '8066B6142C7D428D8B1329D152DF013E', '电话号码', 'phoneNumber', 'String', '11', '11', '13681004142', '', '1', '1', '2015-12-09 16:32:54');
INSERT INTO `parameter` VALUES ('339957160787409CB153A5CDA058F5E2', null, '密码', 'password', 'String', '6', '16', '000000', '', '1', '2', '2015-11-05 17:32:02');
INSERT INTO `parameter` VALUES ('37E654789880409EB1196C4E0030F185', null, '习题编号', 'exNumber', 'String', '1', '1', '1', '习题编号', '1', '1', '2015-11-06 15:18:18');
INSERT INTO `parameter` VALUES ('37F7EFB6D75E49E4B758A3EFECC48C19', '716C76310D4546C5921124C8401AE3B3', '语文教材版本代码', 'chineseBookTypeCode', 'String', '32', '32', 'bd9bfc91c6a540c2bbe0866ebc6df1b8', '', '1', '8', '2015-11-30 13:39:32');
INSERT INTO `parameter` VALUES ('3BC1D0202E874009BD30B204164D672F', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '地理代码', 'geographySubjectCode', 'String', '1', '6', 'fb413', '', '0', '8', '2015-12-07 10:24:41');
INSERT INTO `parameter` VALUES ('3D198D3FED3E4E728A503EAAE669F37F', '716C76310D4546C5921124C8401AE3B3', '数学科代码', 'mathSubjectCode', 'String', '1', '16', '274ea', '', '1', '9', '2015-11-30 13:45:02');
INSERT INTO `parameter` VALUES ('3DE9682B527B41E2BC25EE57AA864FE8', '16AB1249170F470781DB04E4BBA79C9F', '战名校编号', 'challengeSchooleId', 'Long', '32', '32', '1', '', '1', '2', '2015-11-30 10:29:13');
INSERT INTO `parameter` VALUES ('3F44E229AEBE43D89E58A689672B48E1', null, '电话号码', 'phoneNumber', 'String', '11', '11', '13681004142', '', '1', '1', '2015-11-05 17:31:25');
INSERT INTO `parameter` VALUES ('42E975FA6BA648D3A509E9F8B7052E2F', '7F564EFB242748939746C2315A668FF9', '学科编号', 'subjectCode', 'String', '1', '16', '274ea', '', '0', '3', '2015-12-01 10:00:37');
INSERT INTO `parameter` VALUES ('4315598F8E1243C6965601F5D7BB0922', '6205A4EC8D8945739693FBED1C20C1D2', '年级代码', 'gradeCode', 'String', '5', '5', '83e01', '', '1', '2', '2015-11-11 10:53:56');
INSERT INTO `parameter` VALUES ('433420719B2B4BFEBC9D0B8FF9A61657', null, 'ff', 'ff', 'String', '1', '1', 'ff', '必须保证是标准的JSON格式', '1', '1', '2016-03-21 15:54:41');
INSERT INTO `parameter` VALUES ('437F0394B0A94202AE8AE1BA7540A742', '9F7EE10BB25E436DB144C20891A64D36', '应用编号', 'openId', 'String', '32', '64', 'd4ae37ce-24a8-4763-82b5-51b261a416c8', '必须保证是标准的JSON格式', '1', '1', '2016-03-21 09:19:16');
INSERT INTO `parameter` VALUES ('46375B07E5B64C1A96F7FF5AC9FF0845', 'CBC118FCD9A24234A8B7E00371D047C5', '感悟编号', 'inspirationId', 'Long', '1', '1', '1', '', '1', '1', '2015-11-13 09:14:37');
INSERT INTO `parameter` VALUES ('46589FC3E03340848190308E37B5FB4C', '716C76310D4546C5921124C8401AE3B3', '化学教材名称', 'chemistryTypeName', 'String', '1', '32', '人教版', '', '0', '28', '2015-11-30 14:43:41');
INSERT INTO `parameter` VALUES ('46A3D1FF28574048A5284C2C6BAA0E9F', '733E24FF765645FE8A225D8902CBB48B', '当前页', 'pageNumber', 'Integer', '1', '1', '1', '', '1', '2', '2015-12-18 13:17:45');
INSERT INTO `parameter` VALUES ('4A8B2B0B4FDF4A188F628D92FAF19D74', '6BAAD463F7A740B9884CBF50C835A05C', ' 父知识点代码', 'parentcode', 'String', '32', '32', '12925dc1de5e4368a6d5e12fb66dec35   ', '', '1', '1', '2015-11-11 11:10:13');
INSERT INTO `parameter` VALUES ('4B07104F0C4D4517BF4DCF344DC5902B', '716C76310D4546C5921124C8401AE3B3', '地理科代码', 'geographySubjectCode', 'String', '1', '16', 'fb413', '', '0', '15', '2015-11-30 13:54:24');
INSERT INTO `parameter` VALUES ('4D680B8A476047088CD50E20B319680C', '716C76310D4546C5921124C8401AE3B3', '所在地区名称', 'province', 'String', '1', '32', '北京', '', '1', '4', '2015-11-30 13:33:23');
INSERT INTO `parameter` VALUES ('4E79FFD90E664485873169E7D0E201E0', 'AD8C9A02C1524E5D872ACED339B2E73C', '习题编号', 'exercisesCode', 'String', '32', '32', '3f3f3b5a92db4d1ea7467d1750a3d698', '', '1', '2', '2015-12-02 10:15:35');
INSERT INTO `parameter` VALUES ('4ED83728C54344B6ACDA8D418D6294A1', null, 'fff', 'ff', 'String', '1', '1', '', '必须保证是标准的JSON格式', '1', '3', '2016-03-23 16:58:40');
INSERT INTO `parameter` VALUES ('4EFD4F1052404BB696C1CAB64BF18642', 'E3793B552185402EBAA7B37C164D6A08', '封面图片', 'coverPictureFile', 'File', '1', '1', '', '', '1', '2', '2015-11-10 15:09:26');
INSERT INTO `parameter` VALUES ('4FF583A655E4475EA05A0302A0F6ED84', '799570CB5852421EA592EED4CC5CD700', '用户编号', 'productId', 'String', '32', '64', '32bdd1c5-8eef-4843-9a9a-228dc0f3b617', '必须保证是标准的JSON格式', '1', '1', '2016-03-17 16:24:50');
INSERT INTO `parameter` VALUES ('5047B424017A4537A902BE68144A4A95', '716C76310D4546C5921124C8401AE3B3', '地理教材名称', 'geographyTypeName', 'String', '1', '32', '人教版', '', '0', '27', '2015-11-30 14:38:32');
INSERT INTO `parameter` VALUES ('51F8D2A65DF34F908F4C67F3839FAF58', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '历史科代码', 'historySubjectCode', 'String', '1', '6', 'fb413', '', '0', '7', '2015-12-07 10:23:58');
INSERT INTO `parameter` VALUES ('56437CA9B3F84F62A53034CE899E06A9', 'BD50776D9D534189A3DCEABF1470D001', '应用编号', 'productId', 'String', '32', '64', '32bdd1c5-8eef-4843-9a9a-228dc0f3b617', '必须保证是标准的JSON格式', '1', '1', '2016-03-21 11:38:40');
INSERT INTO `parameter` VALUES ('5742E329F6384B2EB8D73B622E3E51C4', null, '习题代码', 'exercisesId', 'String', '32', '32', '3f3f3b5a92db4d1ea7467d1750a3d698', '', '1', '2', '2015-11-09 10:08:48');
INSERT INTO `parameter` VALUES ('574B825B631E4460B02F6B2FDBC1E161', '939C2627FA604779927259D5AE43BDFA', '解题心得内容', 'solveQuestionExperienceContent', 'String', '10', '100', '好哈时间了快递费时来得快上的飞机离开山东时间的李开复受打击了妇科数量的风景', '', '1', '4', '2015-11-11 13:46:41');
INSERT INTO `parameter` VALUES ('596BB3CED2CF4727B48E53BE69BD2705', '939C2627FA604779927259D5AE43BDFA', '练习记录编号', 'exercisesId', 'Long', '11', '11', '22', '', '1', '2', '2015-11-11 13:44:18');
INSERT INTO `parameter` VALUES ('5A7CF93DB3F349C788D2C0973AF3DC95', '716C76310D4546C5921124C8401AE3B3', '政治教材名称', 'politicsTypeName', 'String', '1', '32', '人教版', ' ', '0', '28', '2015-11-30 14:39:15');
INSERT INTO `parameter` VALUES ('5DCBECA0066E481C80CB6751453A37DF', '716C76310D4546C5921124C8401AE3B3', '物理科代码', 'physicsSubjectCode', 'String', '1', '16', '2e426', '', '0', '19', '2015-11-30 14:22:13');
INSERT INTO `parameter` VALUES ('5E26D824A24B459BA0D6951BCA88FC4D', '50891CF5DADC4C07B63214E2B1E25F33', '教材版本代码', 'booktype', 'String', '32', '32', 'cec15c81e25040898f5aae9be1dd60ad', '', '1', '3', '2015-11-11 11:02:10');
INSERT INTO `parameter` VALUES ('5E678337BFF54A9A8D273CE8D3CE6542', '2A599AAC6E94420B8D819D2C6D14DEB0', '会话ID', 'sessionId', 'String', '32', '32', 'AC9182B7D4E8462EB7D6CFC00C62EF3A', '', '1', '1', '2015-11-24 15:00:19');
INSERT INTO `parameter` VALUES ('5E9E1C2C73954B30BE8CAB89491184D6', '27482538BA2B4D2C90F7336510505A20', '密码', 'password', 'String', '16', '64', 'e10adc3949ba59abbe56e057f20f883e', '必须保证是标准的JSON格式', '1', '2', '2016-03-21 13:28:06');
INSERT INTO `parameter` VALUES ('5FA7F3DBBAF641E880C54B1F7EC6B355', '9F7EE10BB25E436DB144C20891A64D36', '邮件主题', 'subject', 'String', '1', '32', '短信验证', '必须保证是标准的JSON格式', '1', '4', '2016-03-21 09:21:17');
INSERT INTO `parameter` VALUES ('6014C95AE8474609B4B28B7E20776640', null, '编号', 'id', 'String', '1', '1', '1', '', '1', '2', '2015-11-28 14:37:35');
INSERT INTO `parameter` VALUES ('61BF775A648C4ED0B7CE600B25E78F36', 'AD8C9A02C1524E5D872ACED339B2E73C', '学科代码', 'subjectCode', 'String', '1', '16', '274ea', '', '1', '3', '2015-12-02 10:20:26');
INSERT INTO `parameter` VALUES ('644FC4D74156463CBF1DF9CC262A2113', '854A7064481C4E65B88CEB0C84AA6E40', '会话ID', 'sessionId', 'String', '32', '32', '006FF0209FF34C1C9803A21874CC131D', '', '1', '1', '2015-11-30 09:16:23');
INSERT INTO `parameter` VALUES ('64B6A1D87CC24644B62316510820CA54', null, 'requestType', 'requestType', 'String', '9', '9', 'POST', 'requestType', '1', '2', '2015-11-07 14:54:29');
INSERT INTO `parameter` VALUES ('64BCBD917C4B4CB49D1A29BBA72CBA64', '978C62DABEFE4EF5B8E62A35F54D18BB', '手机号码', 'phoneNumber', 'String', '11', '11', '13681004142', '支持中国大陆的3网手机号码', '1', '1', '2015-11-06 17:59:37');
INSERT INTO `parameter` VALUES ('662D53AC70DC4A3B8C5967C17833C190', '0B4BF8B8B0A24E16AFFC27E8C5F6276C', '当前页', 'pageNumber', 'Integer', '1', '1', '1', '', '1', '2', '2015-11-13 09:29:45');
INSERT INTO `parameter` VALUES ('6673880401A44EA18D2E1AACE3C66B67', '799570CB5852421EA592EED4CC5CD700', '请求类型', 'type', 'String', '1', '16', 'today', '必须保证是标准的JSON格式', '1', '2', '2016-03-17 16:25:42');
INSERT INTO `parameter` VALUES ('66DF8144311D43C4AC73F9FBF8C277B3', '716C76310D4546C5921124C8401AE3B3', '生物教材版本代码', 'biologyBookTypeCode', 'String', '32', '32', '0ed8cda6c7b743d789a3137724e09eaf', '', '0', '26', '2015-11-30 14:29:47');
INSERT INTO `parameter` VALUES ('68DACEFF498145DAA9E739442B3A1FAB', 'A1B3310C3A634692AC7D838B14DD1ED2', '会话ID', 'sessionId', 'String', '1', '32', '896AC0D30E024D07BCC34A95DE7A16C6', '', '1', '1', '2015-11-13 11:11:21');
INSERT INTO `parameter` VALUES ('68F3A5855DBC4AFAA6E6FCA7C5A98DE0', '5127645D562A4E93951C815E59EDA32D', '会话ID', 'sessionId', 'String', '32', '32', 'D8461C85AC5A4FBB8BC835C95B408CE7', '', '1', '1', '2015-12-14 15:30:23');
INSERT INTO `parameter` VALUES ('69160B749AA74688AA51F3CE75607088', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '政治代码', 'politicsSubjectCode', 'String', '1', '1', '5df22', '', '0', '1', '2015-12-07 10:47:26');
INSERT INTO `parameter` VALUES ('6B496D442A3C48358D47C05F0B33DEE2', null, 's', 's', 'String', '1', '3', 'hr', 's', '1', '1', '2015-12-15 08:57:31');
INSERT INTO `parameter` VALUES ('6BC992DD91964739BEB076C507F344A2', '12733182B9164CAFA0A07AB202E96BA7', '会话ID', 'sessionId', 'String', '32', '32', 'BCB01A60911B4E4CB06455E2753E3C66', '', '1', '1', '2015-11-11 11:48:14');
INSERT INTO `parameter` VALUES ('6C57AEDC1F7A43839811D83D1A836E36', '716C76310D4546C5921124C8401AE3B3', '语文科代码', 'chineseSubjectCode', 'String', '1', '16', 'f43e2', '', '1', '7', '2015-11-30 13:40:51');
INSERT INTO `parameter` VALUES ('6CE75168EA7342B9A4C54659501402A5', 'F6AE3EF135E54802B8349F7F14DA4380', '应用编号', 'productId', 'String', '32', '64', '32bdd1c5-8eef-4843-9a9a-228dc0f3b617', '必须保证是标准的JSON格式', '1', '1', '2016-03-17 10:42:36');
INSERT INTO `parameter` VALUES ('6E1F34F459A54798AE668665A63E5E34', 'CCCD3D710F594226A2198693364F5972', '学段', 'phase', 'String', '11', '11', '1', '', '1', '1', '2015-11-09 15:22:32');
INSERT INTO `parameter` VALUES ('6F51A68F27F54C0DB6D926237D0487BC', null, '是否正确', 'isRight', 'String', '1', '32', '1', '', '1', '5', '2015-11-09 10:11:17');
INSERT INTO `parameter` VALUES ('7068E8A913D740C5BA8C630B6E8084C6', '9F7EE10BB25E436DB144C20891A64D36', '请求编号', 'requestId', 'String', '16', '32', 'sdfsdfsfd232434', '必须保证是标准的JSON格式', '0', '6', '2016-03-21 09:22:38');
INSERT INTO `parameter` VALUES ('70A60AFDBAE543B89B3D36108FA4A84A', null, 'JSON格式的参数', 'jsonString', 'String', '1', '10000', '{  \"sessionId\": \"4708ACE0F1AD44D9A709AB32FABEE010\",  \"exercises\": [{\"exercisesId\":\"3f3f3b5a92db4d1ea7467d1750a3d698\",\"subjectId\":\"274ea\",\"gradeId\":\"83e01\",\"isRight\":\"1\"},{\"exercisesId\":\"266ce8b224f740f698f5db2ae5e15b68\",\"subjectId\":\"274ea\",\"gradeId\":\"83e01\",\"isRight\":\"1\"},{\"exercisesId\":\"9596acbff9434160a38f39e951a59b79\",\"subjectId\":\"274ea\",\"gradeId\":\"83e01\",\"isRight\":\"1\"}]}', '必须保证是标准的JSON格式', '1', '1', '2015-11-09 10:32:00');
INSERT INTO `parameter` VALUES ('7133192ED0314A5BA6996259BBA7E236', '716C76310D4546C5921124C8401AE3B3', '化学教材版本代码', 'chemistryBookTypeCode', 'String', '32', '32', '0ed8cda6c7b743d789a3137724e09eaf', '', '0', '22', '2015-11-30 14:26:47');
INSERT INTO `parameter` VALUES ('713D216EFABC476E89E45E46A44A3DD3', 'A743D5D4D9FA4A359CFE34C52C8F9D9F', '感悟编号', 'inspirationId', 'Long', '1', '1', '1', ' ', '1', '2', '2015-11-13 09:20:27');
INSERT INTO `parameter` VALUES ('71EFEFA1395548DF81AAF479207C83DE', '27482538BA2B4D2C90F7336510505A20', 'appKey', 'appKey', 'String', '1', '1', 'ec86eb0e8ada5b85082cd163', '必须保证是标准的JSON格式', '1', '1', '2016-03-29 10:04:49');
INSERT INTO `parameter` VALUES ('7373F10FD84143258E72D4AE917978C0', null, 'ff', 'ff', 'String', '1', '1', 'f', '必须保证是标准的JSON格式', '1', '2', '2016-03-23 16:58:34');
INSERT INTO `parameter` VALUES ('7443C6DB57F244AB9332CD79792CCF3B', '9ACEABFEA17241DC9A07F931D652B6AF', '会话ID', 'sessionId', 'String', '32', '32', '006FF0209FF34C1C9803A21874CC131D', '', '1', '1', '2015-11-28 10:01:11');
INSERT INTO `parameter` VALUES ('74CB6F501FB149D79891ABF60A455ACA', null, 'f', 'f', 'String', '1', '1', '1', 'f', '1', '1', '2015-11-05 16:34:42');
INSERT INTO `parameter` VALUES ('74E3D95E024B4ED6BB86C05A6449BA92', '596059BC01754C96BE8BD95F71D38AE0', '知识点代码', 'knowledgeCode', 'String', '32', '32', '5febd7fa6ad04104ac5e743f98eae770', '', '1', '5', '2015-11-11 11:16:55');
INSERT INTO `parameter` VALUES ('74EF87D9056142BEA4F3DA9A6EB3945E', 'D773BFD06755438283AA3CCEDF890EA4', '密码', 'password', 'String', '6', '16', '000000', '', '1', '2', '2015-11-07 15:43:57');
INSERT INTO `parameter` VALUES ('773F3A703F1C46FC9F5FF74352C3B107', '716C76310D4546C5921124C8401AE3B3', '地理教材版本', 'geographyBookTypeCode', 'String', '32', '32', '0ed8cda6c7b743d789a3137724e09eaf', '', '0', '16', '2015-11-30 13:54:56');
INSERT INTO `parameter` VALUES ('7814624D7EB74305A044FCD5F8F569D8', '596059BC01754C96BE8BD95F71D38AE0', '当前页数', 'pageNumber', 'Integer', '11', '11', '1', '', '1', '1', '2015-11-11 11:14:18');
INSERT INTO `parameter` VALUES ('785FA8A7A5384C3BA0FF4EC103D80974', null, '会话ID', 'sessionId', 'String', '32', '32', 'BCB01A60911B4E4CB06455E2753E3C66', '', '1', '1', '2015-11-11 11:32:46');
INSERT INTO `parameter` VALUES ('78FAF7C4D23249F78A3F148ADE0C75CE', '276B85014DCA4347B5C3854862CFEA5A', '新密码', 'password', 'String', '6', '16', '000000', '', '1', '2', '2015-11-11 10:33:58');
INSERT INTO `parameter` VALUES ('7A79F02A71E44BF482109B2476C3E1F4', 'CCCD3D710F594226A2198693364F5972', '省或直辖市', 'province', 'String', '2', '16', '北京', '省或直辖市的汉字', '1', '2', '2015-11-09 15:23:39');
INSERT INTO `parameter` VALUES ('7AFD53E12A24422CB11E5F986CD014BC', '733E24FF765645FE8A225D8902CBB48B', '每页大小', 'pageSize', 'Integer', '1', '1', '5', '', '1', '3', '2015-12-18 13:18:13');
INSERT INTO `parameter` VALUES ('7B8ECD0E50A84163A43BD569B2A9F590', 'E3793B552185402EBAA7B37C164D6A08', '内容', 'content', 'String', '20', '100', '新华网北京11月9日电　中共中央总书记、国家主席、中央军委主席、中央全面深化改革领导小组组长习近平11月9日上午主持召开中央全面深化改革领导小组第十八次会议并发表重要讲话。他强调，党的十八届五中全会通过的《中共中央关于制定国民经济和社会发展第十三个五年规划的建议》', '', '1', '1', '2015-11-10 15:08:28');
INSERT INTO `parameter` VALUES ('7B9CEFF13D0246C88E67A0A72F17560F', '716C76310D4546C5921124C8401AE3B3', '英语教材名称', 'englishTypeName', 'String', '1', '32', '人教版', '', '1', '26', '2015-11-30 14:37:14');
INSERT INTO `parameter` VALUES ('7C9A5CD495EE41A3A3571AEAF746F6D8', '43D35B67CA9748329EDDEE20F4A9B158', '习题编号', 'exerciseCode', 'String', '32', '32', '3f3f3b5a92db4d1ea7467d1750a3d698', '', '1', '2', '2015-12-02 10:09:55');
INSERT INTO `parameter` VALUES ('80A98F98D7FE49F595EC59E6D0D08A6F', '716C76310D4546C5921124C8401AE3B3', '物理教材版本', 'physicsBookTypeCode', 'String', '32', '32', '0ed8cda6c7b743d789a3137724e09eaf', '', '0', '20', '2015-11-30 14:22:51');
INSERT INTO `parameter` VALUES ('8307CA1FFE054E3EBA04A576D8383AD6', '9D443B2FCA4F40E39981C4D8111C9A6D', '应用编号', 'productId', 'String', '32', '64', '32bdd1c5-8eef-4843-9a9a-228dc0f3b617', '必须保证是标准的JSON格式', '1', '1', '2016-03-21 14:10:28');
INSERT INTO `parameter` VALUES ('835B367541514851B198C7C6098F60CB', '965EDF63544B4804BE66F1D18518E877', '手机号码', 'phone', 'String', '11', '16', '13281004142', '必须保证是标准的JSON格式', '1', '3', '2016-03-17 10:25:15');
INSERT INTO `parameter` VALUES ('83F7D0FBF1F84692965571AEB1A431C4', 'E3793B552185402EBAA7B37C164D6A08', '会话ID', 'sessionId', 'String', '32', '32', 'E20F8481F06B4B1EA7B2AA91E0154A4C', '', '1', '4', '2015-11-10 15:34:22');
INSERT INTO `parameter` VALUES ('85BF2D1015DA4A90B555F01E50E48D56', '7F564EFB242748939746C2315A668FF9', '最后一天的日期', 'date', 'String', '8', '16', '2015-11-30', '', '1', '2', '2015-11-30 16:53:13');
INSERT INTO `parameter` VALUES ('860117BD21F446D380F36818F654F2E4', '8066B6142C7D428D8B1329D152DF013E', '新密码', 'newPassword', 'String', '6', '16', '123123', '', '1', '3', '2015-12-09 16:34:04');
INSERT INTO `parameter` VALUES ('863FCDE58FDB4801AC28CA0F2551B208', '27482538BA2B4D2C90F7336510505A20', '标题', 'title', 'String', '1', '16', '亿家教', '必须保证是标准的JSON格式', '1', '7', '2016-03-29 10:02:50');
INSERT INTO `parameter` VALUES ('881004E9EAD04C54900FC8B63665019F', '716C76310D4546C5921124C8401AE3B3', '数学教材版本', 'mathBookTypeCode', 'String', '32', '32', '0ed8cda6c7b743d789a3137724e09eaf', '', '1', '10', '2015-11-30 13:46:39');
INSERT INTO `parameter` VALUES ('887130BEDAEF4015850FF6C7E6B72C94', '50DCDD2D161043A7A4AC94E7F2524203', '学段', 'phase', 'Integer', '1', '1', '3', '', '1', '2', '2015-11-30 09:38:50');
INSERT INTO `parameter` VALUES ('8ADEADCD67344EEFBECAED36387418CF', '716C76310D4546C5921124C8401AE3B3', '物理教材名称', 'physicsTypeName', 'String', '1', '32', '人教版', '', '0', '27', '2015-11-30 14:43:05');
INSERT INTO `parameter` VALUES ('8DCF4AC385C1412585D6B917BDC6BAAB', '79FE4387B35749EEAFEA69F1550712D8', '会话ID', 'sessionId', 'String', '32', '32', 'D2F1407E675143579A43A8E18EEDA3BE', '', '1', '1', '2015-12-03 09:39:05');
INSERT INTO `parameter` VALUES ('8F69BC9958F44CB1A07B8A854FA3E0FB', '77EC98F9230446EDAD57A0A96FBF2CA2', '本年的第几周', 'week', 'String', '1', '16', '0000-00', '', '1', '2', '2015-12-01 09:55:18');
INSERT INTO `parameter` VALUES ('90C8D496E4B0417B824E89C4A02E0A12', '939C2627FA604779927259D5AE43BDFA', '年级代码', 'gradeCode', 'String', '5', '5', '83e01', '', '1', '4', '2015-11-11 13:45:40');
INSERT INTO `parameter` VALUES ('91BC319BFE86414D9D42AB72B1DD6E89', '27482538BA2B4D2C90F7336510505A20', '用户编号', 'openId', 'String', '1', '1', 'd4ae37ce-24a8-4763-82b5-51b261a416c8', '必须保证是标准的JSON格式', '1', '1', '2016-03-21 13:36:16');
INSERT INTO `parameter` VALUES ('967A0C65E0214D1EBD85CAF511B59488', 'A743D5D4D9FA4A359CFE34C52C8F9D9F', '插图', 'illustrationFile', 'File', '1', '1', '', '', '1', '5', '2015-11-13 09:23:00');
INSERT INTO `parameter` VALUES ('984110183FE5467C94D6CC140F6BCB91', '7804E28413444AA48C50D6F39706E4DD', '会话ID', 'sessionId', 'String', '1', '1', '64F460689B21456F9EAFF9DE5D7E5B0F', '', '1', '1', '2015-11-18 10:01:11');
INSERT INTO `parameter` VALUES ('988D6D1874664C2DB5A1EF7B21E7CBE0', '596059BC01754C96BE8BD95F71D38AE0', '难易度', 'start', 'Integer', '11', '11', '1', '', '1', '6', '2015-11-11 11:17:42');
INSERT INTO `parameter` VALUES ('9DD60D1B421A41429C23590582F880E8', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '日期', 'date', 'String', '1', '16', '2012-12-05', '', '1', '13', '2015-12-07 10:35:38');
INSERT INTO `parameter` VALUES ('A04B25FFE5E6435285A5231AA3899495', null, 'url', 'url', 'String', '22', '22', 'http://123.56.141.214:38081/iwrong-service-v3/api/find/single-answer.json', '', '1', '1', '2015-11-07 14:53:59');
INSERT INTO `parameter` VALUES ('A2780767622F406C884A9B9701F051BC', '7A09B9CA2CB041AFBD05BE5369CC1B0E', 'a', 'a', 'String', '1', '1', 'a', 'a', '1', '1', '2015-12-05 17:30:00');
INSERT INTO `parameter` VALUES ('A3C683508F6A413CA6C101BA647F64CF', '863FB49D65744256A85518E872D333CC', '客户端版本', 'versions', 'String', '1', '16', '1.0.1', '', '1', '1', '2015-12-15 17:07:17');
INSERT INTO `parameter` VALUES ('A57F2BAD676A4F49ACEB989737A633BF', null, '学科代码', 'subjectId', 'String', '1', '32', '274ea', '', '1', '3', '2015-11-09 10:09:39');
INSERT INTO `parameter` VALUES ('A5E657EC5455462A8C6AF8745100A275', '16AB1249170F470781DB04E4BBA79C9F', '关卡序号', 'customsBarrier', 'Long', '32', '32', '1', '', '1', '3', '2015-11-30 10:29:37');
INSERT INTO `parameter` VALUES ('A8273157A92E4B4DB7860A75B5ACE175', '965EDF63544B4804BE66F1D18518E877', '请求编号', 'requestId', 'String', '32', '32', 'sdfsds2343546546ffsdfw', '必须保证是标准的JSON格式', '0', '5', '2016-03-17 10:26:38');
INSERT INTO `parameter` VALUES ('A8E26FB364A841F3A884A663843157B3', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '会话ID', 'sessionId', 'String', '32', '32', '3B44FB74A9764504B4B4FF0B27F6B62B', '', '1', '1', '2015-12-07 10:17:37');
INSERT INTO `parameter` VALUES ('AA30605BDB6C4735BD98B3912372FE83', '965EDF63544B4804BE66F1D18518E877', '应用密码', 'password', 'String', '32', '32', 'e10adc3949ba59abbe56e057f20f883e', '必须保证是标准的JSON格式', '1', '2', '2016-03-17 10:24:32');
INSERT INTO `parameter` VALUES ('AC5DA1E0B6514888BF1F989CC7F90A37', 'AF335E8F8C4949A685A3FA8F45881FAA', '感悟编号', 'inspirationId', 'Long', '1', '1', '1', '', '1', '2', '2015-11-17 13:28:13');
INSERT INTO `parameter` VALUES ('B2ED3B857D544142BAFF28DDE24CE523', null, 'JSON格式的参数', 'jsonString', 'String', '1', '10000', '{“gradeCode”:”fdfaf”,”subjectCode”:”274ea”,”booktype”:”191bb9fb41a341df861d0d52f6035517”}', '必须保证是标准的JSON格式', '1', '1', '2015-11-18 10:19:30');
INSERT INTO `parameter` VALUES ('B4E23AB54FB54C25898059F9471DF59B', 'A743D5D4D9FA4A359CFE34C52C8F9D9F', '会话Id', 'sessionId', 'String', '32', '32', '896AC0D30E024D07BCC34A95DE7A16C6', '', '1', '1', '2015-11-13 09:19:48');
INSERT INTO `parameter` VALUES ('B5F2785F772F4C7B9857D8C16D54B75B', '2A599AAC6E94420B8D819D2C6D14DEB0', '挑战的高校编号', 'universityId', 'Integer', '1', '1', '1', '', '1', '2', '2015-11-24 15:01:07');
INSERT INTO `parameter` VALUES ('B69514C01AFC4179B73E93D31A65783D', '7F564EFB242748939746C2315A668FF9', '类型', 'type', 'String', '4', '4', 'HOME', '', '0', '4', '2015-12-04 14:26:45');
INSERT INTO `parameter` VALUES ('B88FF6CC140E4CB5AF588663EF11E905', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '生物代码', 'biologySubjectCode', 'String', '1', '6', '9c1e0', '', '0', '12', '2015-12-07 10:27:14');
INSERT INTO `parameter` VALUES ('B8EF9C883E28430D9A0A0339750C276C', '733E24FF765645FE8A225D8902CBB48B', '会话ID', 'sessionId', 'String', '32', '32', '4C9A3975D7AB419BABCB1FA23F371CF5', '', '1', '1', '2015-12-18 13:16:53');
INSERT INTO `parameter` VALUES ('B9971EAE50D34D1687B42B81BDACBA9F', '596059BC01754C96BE8BD95F71D38AE0', '年级代码', 'gradeCode', 'String', '5', '5', '83e01', '', '1', '4', '2015-11-11 11:16:15');
INSERT INTO `parameter` VALUES ('BB2A2EB5DD2448FAB34E4244C9F27EF2', '6549023E7887420EB14736CD95E76DD3', '用户编号', 'productId', 'String', '32', '64', '32bdd1c5-8eef-4843-9a9a-228dc0f3b617', '必须保证是标准的JSON格式', '1', '1', '2016-03-21 14:01:21');
INSERT INTO `parameter` VALUES ('BBC5985DD61F490E8697CC6A4B5477BA', '7F056A3482384022B22C10439EC9B369', '学段', 'phase', 'String', '11', '11', '1', '', '1', '1', '2015-11-09 15:24:09');
INSERT INTO `parameter` VALUES ('BCC450B7DDED43DB9428A35A4FF4C618', null, '年级代码', 'gradeId', 'String', '1', '32', '83e01', '', '1', '3', '2015-11-09 10:10:19');
INSERT INTO `parameter` VALUES ('BCF5FD611E1D42F29EEA6F067FD46383', '9F7EE10BB25E436DB144C20891A64D36', '管理员密码', 'password', 'String', '16', '64', 'e10adc3949ba59abbe56e057f20f883e', '必须保证是标准的JSON格式', '1', '2', '2016-03-21 09:19:55');
INSERT INTO `parameter` VALUES ('BD02A1ECF2164631A6DBE1A6BCDEEBC4', 'E637F5E7F8314572BB80CFE4552384A9', '电话号码', 'phoneNumber', 'String', '1', '11', '13681004142', '', '1', '1', '2015-12-08 11:47:41');
INSERT INTO `parameter` VALUES ('BD790E2EFF3D4F358F22F6B92B4563CE', '27482538BA2B4D2C90F7336510505A20', '类别', 'sendType', 'String', '1', '1', 'log', '必须保证是标准的JSON格式', '1', '1', '2016-03-21 13:37:34');
INSERT INTO `parameter` VALUES ('BFF18B57003A482D8918926A163F1F8E', null, '年级代码', 'gradeCode', 'String', '20', '20', '83e01', '', '1', '4', '2015-11-07 15:03:37');
INSERT INTO `parameter` VALUES ('C03D58B0392A4272A3C662E204B82FB0', '8A6270EC6105429E84B83E095C9DF141', '手机号码', 'phoneNumber', 'String', '11', '11', '13681004142', '', '1', '1', '2015-11-11 10:22:40');
INSERT INTO `parameter` VALUES ('C0410D4466AF450D97C22B998E2DCD7D', '716C76310D4546C5921124C8401AE3B3', '生物教材名称', 'biologyTypeName', 'String', '1', '32', '人教版', '', '0', '28', '2015-11-30 14:44:15');
INSERT INTO `parameter` VALUES ('C283CB802FAB4EE99F6DA487DF76DDEB', '716C76310D4546C5921124C8401AE3B3', '历史教材版本代码', 'historyBookTypeCode', 'String', '32', '32', '0ed8cda6c7b743d789a3137724e09eaf', '', '0', '14', '2015-11-30 13:52:44');
INSERT INTO `parameter` VALUES ('C401434F2EF743D3B7BFF5509C59D129', '9F7EE10BB25E436DB144C20891A64D36', '邮件地址', 'email', 'String', '8', '126', '592794139@qq.com', '必须保证是标准的JSON格式', '1', '3', '2016-03-21 09:20:46');
INSERT INTO `parameter` VALUES ('C460770B8CDE43A38CC6FB8E6FA0A7E7', '27482538BA2B4D2C90F7336510505A20', 'sercet', 'sercet', 'String', '1', '1', '163e261df7d83816273eacc6', '必须保证是标准的JSON格式', '1', '1', '2016-03-29 10:04:24');
INSERT INTO `parameter` VALUES ('C4685D15D9584D57B3545DF6A2249DF3', '6725D744DB1847B5BC341F5BBE6969B8', 'a', 'a', 'String', '1', '1', 'a', 'a', '1', '1', '2015-12-05 17:31:03');
INSERT INTO `parameter` VALUES ('C5096E5827F74C6087C688F46735253C', '939C2627FA604779927259D5AE43BDFA', '会话ID', 'sessionId', 'String', '32', '32', 'E20F8481F06B4B1EA7B2AA91E0154A4C', '', '1', '1', '2015-11-11 13:43:28');
INSERT INTO `parameter` VALUES ('C523692DD2D841EFABE779AD244CF19D', '09D6F3BF8D404293B375918C40E95A05', 'f', 'f', 'String', '1', '2', 'f', '必须保证是标准的JSON格式', '1', '1', '2015-12-30 11:52:34');
INSERT INTO `parameter` VALUES ('C5AB9BF1E74B439FAFDA5177D0782F16', 'D7A05F7235AC45CFB17F154B00879B27', '关卡序号', 'customsBarrier', 'Integer', '1', '1', '1', '', '1', '3', '2015-11-23 15:04:44');
INSERT INTO `parameter` VALUES ('C5D7002BF1BA41DDB154B21EBB855BFF', '716C76310D4546C5921124C8401AE3B3', '昵称', 'nickName', 'String', '1', '16', '哈哈', '', '1', '2', '2015-11-30 13:12:09');
INSERT INTO `parameter` VALUES ('C6036EF7F83A496EA2F8535F7A2718EE', 'ADF64C4D8C4D464C9BF2680B5087FC8E', 'JSON格式的参数', 'jsonString', 'String', '1', '10000', '{  \"sessionId\": \"55287EC4CDFB42EB9EE83DD2F2DC3B44\",  \"currencyNumber\":\"100\",\"exercises\": [{\"exercisesId\":\"3f3f3b5a92db4d1ea7467d1750a3d698\",\"subjectId\":\"274ea\",\"gradeId\":\"83e01\",\"isRight\":\"1\"},{\"exercisesId\":\"266ce8b224f740f698f5db2ae5e15b68\",\"subjectId\":\"274ea\",\"gradeId\":\"83e01\",\"isRight\":\"1\"},{\"exercisesId\":\"9596acbff9434160a38f39e951a59b79\",\"subjectId\":\"274ea\",\"gradeId\":\"83e01\",\"isRight\":\"1\"}]}', '必须保证是标准的JSON格式', '1', '1', '2015-11-07 18:04:14');
INSERT INTO `parameter` VALUES ('C60C7A3177C5461CBAE9F6F55FF69719', null, '当前页', 'pageNumber', 'String', '5', '5', '1', '', '1', '1', '2015-11-07 15:01:12');
INSERT INTO `parameter` VALUES ('C645A9B14A994ABC933F39EAA82CB734', '5635376B0DDF43839C976A945863D356', '学段', 'phase', 'Integer', '11', '11', '1', '', '1', '1', '2015-11-09 14:57:03');
INSERT INTO `parameter` VALUES ('C951CEF6B9E74AEB833C79DF665A604E', '716C76310D4546C5921124C8401AE3B3', '政治科代码', 'politicsSubjectCode', 'String', '1', '16', '', '', '0', '17', '2015-11-30 13:55:55');
INSERT INTO `parameter` VALUES ('C99FA30DD416437EAFB6A825E6032E02', '276B85014DCA4347B5C3854862CFEA5A', '手机号码', 'phoneNumber', 'String', '11', '11', '13681004142', '', '1', '1', '2015-11-11 10:33:22');
INSERT INTO `parameter` VALUES ('CAF00FCB19F943F0B44BF4DC26D940B5', '68CAF36B1DDD4641BDE2977831D48271', '会话ID', 'sessionId', 'String', '32', '32', 'D2F1407E675143579A43A8E18EEDA3BE', '', '1', '1', '2015-12-02 13:59:00');
INSERT INTO `parameter` VALUES ('CBE33A32D2B54786968B11535D81F74C', '12733182B9164CAFA0A07AB202E96BA7', '练习记录编号', 'answerRecordId', 'Long', '11', '11', '21', '', '1', '2', '2015-11-11 11:49:17');
INSERT INTO `parameter` VALUES ('CC2892D4326743A5A76BCF1C5B411C15', '27482538BA2B4D2C90F7336510505A20', '推送对象标识类型', 'type', 'String', '1', '16', 'TAG', '必须保证是标准的JSON格式', '1', '8', '2016-03-29 10:03:58');
INSERT INTO `parameter` VALUES ('CCCE56DE4B714535B36FF062DA8F4E36', '340372AF5B2D49659E257FC55D3FB0C7', '文件', 'file', 'File', '1', '1', '', '', '1', '2', '2015-11-10 10:19:55');
INSERT INTO `parameter` VALUES ('CCE2424A73524EB0A5DB71F4A833D769', 'CBC118FCD9A24234A8B7E00371D047C5', '会话ID', 'sessionId', 'String', '32', '32', '896AC0D30E024D07BCC34A95DE7A16C6', '', '1', '2', '2015-11-13 09:16:38');
INSERT INTO `parameter` VALUES ('CCFD788B72D9439CA55DC6B60055CB5E', '716C76310D4546C5921124C8401AE3B3', '英语教材版本代码', 'englishBookTypeCode', 'String', '1', '1', '0ed8cda6c7b743d789a3137724e09eaf', '', '1', '12', '2015-11-30 13:48:19');
INSERT INTO `parameter` VALUES ('CD2F50B9987F4255ADCC53C276C6B931', 'F59CBAF03D664B768E5952AF16446E21', '用户名', 'userName', 'String', '6', '16', 'hechen', '必须保证是标准的JSON格式', '1', '1', '2016-01-25 09:22:27');
INSERT INTO `parameter` VALUES ('CD3ACD9AF45140E0AADB04A622C874EC', '50891CF5DADC4C07B63214E2B1E25F33', '年级代码', 'gradeCode', 'String', '5', '5', '83e01', '', '1', '1', '2015-11-11 11:01:02');
INSERT INTO `parameter` VALUES ('CD88EBECDF874DE0A70B0429CE51350B', '6205A4EC8D8945739693FBED1C20C1D2', '学科代码', 'subjectCode', 'String', '5', '5', 'a7ecc', '', '1', '1', '2015-11-11 10:53:21');
INSERT INTO `parameter` VALUES ('D044ADBB9010498CAE54BF573360A95C', '5127645D562A4E93951C815E59EDA32D', '内容', 'ticklingContent', 'String', '10', '100', '这个问题很严重 得马上解决 快快 !', '', '1', '1', '2015-12-14 15:32:36');
INSERT INTO `parameter` VALUES ('D254E3D021964253A8CE330FCC9EF3A3', '978C62DABEFE4EF5B8E62A35F54D18BB', '密码', 'password', 'String', '6', '16', '000000', '中间不能存在空格', '1', '2', '2015-11-06 18:00:31');
INSERT INTO `parameter` VALUES ('D2C6BF18FEC54E3A8DE37994BCAF84BA', '50891CF5DADC4C07B63214E2B1E25F33', '学科代码', 'subjectCode', 'String', '5', '5', '274ea', '', '1', '2', '2015-11-11 11:01:29');
INSERT INTO `parameter` VALUES ('D43C20EAFFE04BF3809B609FE159C545', '716C76310D4546C5921124C8401AE3B3', '化学科代码', 'chemistrySubjectCode', 'String', '1', '16', 'a7ecc', '', '0', '21', '2015-11-30 14:23:48');
INSERT INTO `parameter` VALUES ('D68066E37C374CE6861AB1FFC775E4DA', '965EDF63544B4804BE66F1D18518E877', '应用编号', 'openId', 'String', '1', '1', 'd4ae37ce-24a8-4763-82b5-51b261a416c8', '必须保证是标准的JSON格式', '1', '1', '2016-03-17 10:33:10');
INSERT INTO `parameter` VALUES ('D6CFDE95909845DEB5EC16537C2F9910', 'BDFC3407E76A4D79A8529EA9EB56CD58', '会话Id', 'sessionId', 'String', '32', '32', '3B44FB74A9764504B4B4FF0B27F6B62B', '', '1', '1', '2015-12-07 11:07:06');
INSERT INTO `parameter` VALUES ('D7F10EBBAC48427DA558482DA56C2FFF', '716C76310D4546C5921124C8401AE3B3', '文理科类型', 'artsScienceType', 'String', '1', '8', 'SCIENCE', '', '1', '3', '2015-11-30 13:29:32');
INSERT INTO `parameter` VALUES ('D8FE38A11C414077A50D3FA4F5A65D4D', '340372AF5B2D49659E257FC55D3FB0C7', '会话ID', 'sessionId', 'String', '32', '32', 'E20F8481F06B4B1EA7B2AA91E0154A4C', '', '1', '1', '2015-11-10 10:13:43');
INSERT INTO `parameter` VALUES ('DADA297223D94A4089A2B0FD1018A5D3', '965EDF63544B4804BE66F1D18518E877', '短信类型', 'sendType', 'String', '1', '32', 'reset_password', '必须保证是标准的JSON格式', '1', '4', '2016-03-17 10:25:58');
INSERT INTO `parameter` VALUES ('DAFEED86CD9A4A2386A87A1A9DC4B6D4', '9F7EE10BB25E436DB144C20891A64D36', '邮件正文', 'body', 'String', '1', '1024', '你好!', '必须保证是标准的JSON格式', '1', '5', '2016-03-21 09:22:00');
INSERT INTO `parameter` VALUES ('DF21BD4BED024A688CF1BE98DAED0E18', '43D35B67CA9748329EDDEE20F4A9B158', '会话ID', 'sessionId', 'String', '32', '32', '006FF0209FF34C1C9803A21874CC131D', '', '1', '1', '2015-12-02 10:08:11');
INSERT INTO `parameter` VALUES ('DF62EC17EA6E4F5FAFAD62A63BB571C0', '716C76310D4546C5921124C8401AE3B3', '生物科代码', 'biologySubjectCode', 'String', '1', '16', '9c1e0', '', '0', '23', '2015-11-30 14:24:54');
INSERT INTO `parameter` VALUES ('DFCC8B1662284D2EAAD6A3501E0A8457', '596059BC01754C96BE8BD95F71D38AE0', '学科代码', 'subjectCode', 'String', '5', '5', '274ea ', '', '1', '3', '2015-11-11 11:15:43');
INSERT INTO `parameter` VALUES ('E03F304351704DA9918420C77CB1B868', 'D7A05F7235AC45CFB17F154B00879B27', '教材编号', 'booktype', 'String', '32', '32', 'f0feb18fb79847e59b12b3797be7ce66', '', '1', '2', '2015-11-23 15:04:13');
INSERT INTO `parameter` VALUES ('E06F4C2E86C743D2A75D8D2BCD7D40A6', null, 'username', 'username', 'String', '1', '1', '1', '1', '1', '1', '2015-11-06 09:01:31');
INSERT INTO `parameter` VALUES ('E1DDE5BA8DC2471F93D12664BA2C5062', '800E69B62466412782E2B0E92D5B3161', '会话ID', 'sessionId', 'String', '32', '32', '64F460689B21456F9EAFF9DE5D7E5B0F', '', '1', '1', '2015-11-18 10:08:25');
INSERT INTO `parameter` VALUES ('E2DF4BCC19DB4C8CB54AB8455EEF2DD2', null, 'JSON格式的参数', 'jsonString', 'String', '1', '10000', '{  \"binary\": false,  \"floatingPointNumber\": false,  \"missingNode\": false,  \"object\": false,  \"pojo\": false,  \"number\": false,  \"integralNumber\": false,  \"short\": false,  \"int\": false,  \"long\": false,  \"double\": false,  \"bigDecimal\": false,  \"bigInteger\": false,  \"textual\": false,  \"boolean\": false,  \"valueNode\": false,  \"containerNode\": false,  \"nodeType\": \"JsonNodeType\",  \"float\": false,  \"null\": false,  \"array\": false}', '必须保证是标准的JSON格式', '1', '1', '2015-11-07 17:14:54');
INSERT INTO `parameter` VALUES ('E32F963B9BBD4ADA91037D6C9A9567F4', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '类型', 'type', 'String', '1', '8', 'DAY', '', '1', '2', '2015-12-07 10:18:53');
INSERT INTO `parameter` VALUES ('E3B4DBC8588843189FA9C133A080BB8F', '716C76310D4546C5921124C8401AE3B3', '英语科代码', 'englishSubjectCode', 'String', '1', '16', 'be6c8', '', '1', '11', '2015-11-30 13:47:42');
INSERT INTO `parameter` VALUES ('E3E4AA4F583747FA8DF7E4CBA0342D87', '92CF6445FB4D449D9889919A8C63A0B9', '会话ID', 'sessionId', 'String', '1', '32', '896AC0D30E024D07BCC34A95DE7A16C6', '', '1', '1', '2015-11-13 11:12:04');
INSERT INTO `parameter` VALUES ('E436E95EA3E6456CBA89D4832C09AEE1', 'AD8C9A02C1524E5D872ACED339B2E73C', '会话ID', 'sessionId', 'String', '32', '32', '006FF0209FF34C1C9803A21874CC131D', '', '1', '1', '2015-12-02 10:14:31');
INSERT INTO `parameter` VALUES ('E5B72E63008241A98B88F362C5610C17', 'BD50776D9D534189A3DCEABF1470D001', '类型', 'type', 'String', '1', '32', 'today', '必须保证是标准的JSON格式', '1', '2', '2016-03-21 11:39:20');
INSERT INTO `parameter` VALUES ('E5E4815F78544B228BEEF3B63BD52A8E', '7F564EFB242748939746C2315A668FF9', '会话ID', 'sessionId', 'String', '32', '32', '006FF0209FF34C1C9803A21874CC131D', '', '1', '1', '2015-11-30 16:51:36');
INSERT INTO `parameter` VALUES ('E6C4A0DDBDD043B192D5D0DA154D2D6F', '939C2627FA604779927259D5AE43BDFA', '学科代码', 'subjectCode', 'String', '5', '5', '274ea', '', '1', '3', '2015-11-11 13:44:54');
INSERT INTO `parameter` VALUES ('EB0BF8C027C144AEA1EC71F0B8674908', null, 'f', 'f', 'String', '1', '1', 'f', '必须保证是标准的JSON格式', '1', '1', '2016-03-23 16:58:28');
INSERT INTO `parameter` VALUES ('ED2D131CD608406F8D24AB255B28FB57', '716C76310D4546C5921124C8401AE3B3', '会话ID', 'sessionId', 'String', '32', '32', '006FF0209FF34C1C9803A21874CC131D', '', '1', '1', '2015-11-30 13:07:45');
INSERT INTO `parameter` VALUES ('EE44CE08D8284BA7BE8C9C587566D700', null, 'userName', 'userName', 'String', '1', '32', 'fsdfsdfsdfsdfsdfs', '', '1', '1', '2015-12-18 11:48:40');
INSERT INTO `parameter` VALUES ('EED1B71155634EF28FF5C25BE71ACDFD', 'B8A72F765D6D4A8DAC3EDDEF7CEB2468', '会话ID', 'sessionId', 'String', '1', '32', 'AC9182B7D4E8462EB7D6CFC00C62EF3A', '', '1', '1', '2015-11-26 15:21:08');
INSERT INTO `parameter` VALUES ('F0CAE82E802D4C24B8045A35390C6AE7', 'A8E443E99CE14CE1A54DBA4F9A5454DC', '应用编号', 'productId', 'String', '1', '1', '32bdd1c5-8eef-4843-9a9a-228dc0f3b617', '必须保证是标准的JSON格式', '1', '1', '2016-03-21 09:55:34');
INSERT INTO `parameter` VALUES ('F18FE5611F994643B5B71881A5804780', 'ACC02C913EC447D481F375C1CB40F99A', '会话ID', 'sessionId', 'String', '1', '32', '64F460689B21456F9EAFF9DE5D7E5B0F', '', '1', '1', '2015-11-17 11:03:41');
INSERT INTO `parameter` VALUES ('F2D898E49BE740EC945FA743DB7A8440', '5127645D562A4E93951C815E59EDA32D', '用户邮箱', 'userEmail', 'String', '6', '32', '592794139@qq.com', '', '1', '3', '2015-12-14 15:31:55');
INSERT INTO `parameter` VALUES ('F2FBC02986854A0D98DE98EDACFFA936', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '数学科代码', 'mathSubjectCode', 'String', '1', '6', '274ea', '', '0', '5', '2015-12-07 10:22:09');
INSERT INTO `parameter` VALUES ('F4EA68F6B9DC497C834C0EFB23A675FA', '716C76310D4546C5921124C8401AE3B3', '历史教材名称', 'historyTypeName', 'String', '1', '32', '人教版', '', '0', '26', '2015-11-30 14:37:55');
INSERT INTO `parameter` VALUES ('F555E3C50E844427A0068741C429F7F8', 'E3793B552185402EBAA7B37C164D6A08', '插图', 'illustrationFile', 'File', '1', '1', '1', '', '1', '3', '2015-11-10 15:10:04');
INSERT INTO `parameter` VALUES ('F5895315EF5548C9B34E11A8D7E450DC', null, '每页大小', 'pageSize', 'Integer', '3', '3', '5', '', '1', '1', '2015-11-07 15:02:03');
INSERT INTO `parameter` VALUES ('F59603B711AC4D469214B7B59E9D22BC', null, '知识点代码', 'knowledgeCode', 'String', '32', '32', '5febd7fa6ad04104ac5e743f98eae770', '', '1', '5', '2015-11-07 15:04:23');
INSERT INTO `parameter` VALUES ('F5FFCF620BBC4126B35BC8A720A65007', '863FB49D65744256A85518E872D333CC', '客户端类型', 'type', 'String', '1', '1', 'IOS', '', '1', '2', '2015-12-15 17:07:48');
INSERT INTO `parameter` VALUES ('F6EC78A7BCA647EA9A87752455066E59', '16AB1249170F470781DB04E4BBA79C9F', '会话ID', 'sessionId', 'String', '32', '32', '006FF0209FF34C1C9803A21874CC131D', '', '1', '1', '2015-11-30 10:28:03');
INSERT INTO `parameter` VALUES ('F7C38B000AEF46A3A754FB3F2BFB4946', '06C5E1116C1042B6B8EB104BEA9260D5', '关键字', 'keyWord', 'String', '1', '16', '北京大学', '', '1', '1', '2015-11-16 09:40:56');
INSERT INTO `parameter` VALUES ('F8668997103C43B2BBD5B151852C4D6C', '3CCEADFD0AF445C8BF68FD3D5DA100C6', '省直辖市编号', 'provinceId', 'Integer', '1', '1', '1', '', '1', '1', '2015-11-16 09:18:49');
INSERT INTO `parameter` VALUES ('FCF0823F658D4460B42AB4DD7797D91D', 'B91289B8F89F4CFE98AFFF0EA1B61C1B', '物理代码', 'physicsSubjectCode', 'String', '1', '1', '2e426', '', '0', '1', '2015-12-07 10:48:02');
INSERT INTO `parameter` VALUES ('FCFCB10DD7AA42BF8A829EE6342CC80A', '716C76310D4546C5921124C8401AE3B3', '政治教材版本代码', 'politicsBookTypeCode', 'String', '32', '32', '0ed8cda6c7b743d789a3137724e09eaf', '', '0', '18', '2015-11-30 13:56:39');
INSERT INTO `parameter` VALUES ('FF25A2AC323142AE9969D0510A4603C5', 'AF335E8F8C4949A685A3FA8F45881FAA', '会话ID', 'sessionId', 'String', '32', '32', '64F460689B21456F9EAFF9DE5D7E5B0F', '', '1', '1', '2015-11-17 13:27:44');
INSERT INTO `parameter` VALUES ('FF40DBDCE86242D9B778F61143FB02F1', 'A743D5D4D9FA4A359CFE34C52C8F9D9F', '感悟内容', 'content', 'String', '1', '100', '减肥还是看使得开发商结婚老师的看法和了似的咖啡碱老师的课了独守空房', '', '1', '3', '2015-11-13 09:21:08');

-- ----------------------------
-- Table structure for parameter_constraint
-- ----------------------------
DROP TABLE IF EXISTS `parameter_constraint`;
CREATE TABLE `parameter_constraint` (
  `PARAMETER_CONSTRAINT_ID` varchar(32) NOT NULL COMMENT '约束编号',
  `PARAMETER_ID` varchar(32) DEFAULT NULL COMMENT '参数_编号',
  `PARAMETER_CONSTRAINT_NAME` varchar(32) DEFAULT NULL COMMENT '约束名称',
  `PARAMETER_CONSTRAINT_CODE` varchar(32) DEFAULT NULL COMMENT '约束代码',
  `PARAMETER_CONSTRAINT_EXPLAIN` varchar(64) DEFAULT NULL COMMENT '约束说明',
  `CREAT_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`PARAMETER_CONSTRAINT_ID`),
  KEY `FK_PARAMETER_CONSTRAINT__PARAMETER` (`PARAMETER_ID`),
  CONSTRAINT `FK_PARAMETER_CONSTRAINT__PARAMETER` FOREIGN KEY (`PARAMETER_ID`) REFERENCES `parameter` (`PARAMETER_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数_参数约束';

-- ----------------------------
-- Records of parameter_constraint
-- ----------------------------
INSERT INTO `parameter_constraint` VALUES ('08350E609B604617A570139798CC2F25', 'DADA297223D94A4089A2B0FD1018A5D3', null, 'edit_password', '修改密码', null, null);
INSERT INTO `parameter_constraint` VALUES ('0E3909CCDAF944B1B81B6086F45F6985', 'C645A9B14A994ABC933F39EAA82CB734', null, '1', '小学', null, '2');
INSERT INTO `parameter_constraint` VALUES ('16CBEA7552554019B054E02CC7EE85E0', 'E32F963B9BBD4ADA91037D6C9A9567F4', null, 'WEEK', '周', null, '2');
INSERT INTO `parameter_constraint` VALUES ('2D77AC4898D547C9A3574421D923C0F2', '6E1F34F459A54798AE668665A63E5E34', null, '3', '高中', null, '4');
INSERT INTO `parameter_constraint` VALUES ('2EA87A07A69A4761BDA5AF890E2E4561', '6E1F34F459A54798AE668665A63E5E34', null, '1', '小学', null, '2');
INSERT INTO `parameter_constraint` VALUES ('307A069A044647489D2F1701FD10A12F', 'BBC5985DD61F490E8697CC6A4B5477BA', null, '2', '初中', null, '3');
INSERT INTO `parameter_constraint` VALUES ('31645AD588714271A5FF409C75FCE92F', 'BBC5985DD61F490E8697CC6A4B5477BA', null, '0', '幼儿园', null, '1');
INSERT INTO `parameter_constraint` VALUES ('48D600AC5E204F749533096EA64FFB7F', '6F51A68F27F54C0DB6D926237D0487BC', null, '0', '错误', null, '2');
INSERT INTO `parameter_constraint` VALUES ('4AE50C240BBF4AD08F451700D0AF03A7', 'C645A9B14A994ABC933F39EAA82CB734', null, '3', '高中', null, '4');
INSERT INTO `parameter_constraint` VALUES ('4B4E3117FD5540E5933AEDFE3EF634A5', '6E1F34F459A54798AE668665A63E5E34', null, '0', '幼儿园', null, '1');
INSERT INTO `parameter_constraint` VALUES ('4C4E6908204641F6B4637F0FA1219D32', '988D6D1874664C2DB5A1EF7B21E7CBE0', null, '3', '难', null, '3');
INSERT INTO `parameter_constraint` VALUES ('5E8CD922152546C1928E33377D972373', 'E5B72E63008241A98B88F362C5610C17', null, 'day3', '近3天', null, null);
INSERT INTO `parameter_constraint` VALUES ('5F31DED11BAB45DB9F96DB68BEA22DEF', 'BBC5985DD61F490E8697CC6A4B5477BA', null, '3', '高中', null, '4');
INSERT INTO `parameter_constraint` VALUES ('5F3B327F2AE54C74BBF802CF2954E248', null, null, '1', '1', null, '1');
INSERT INTO `parameter_constraint` VALUES ('64580DDC494847BD93685704728BC7D5', '6F51A68F27F54C0DB6D926237D0487BC', null, '2', '未选', null, '3');
INSERT INTO `parameter_constraint` VALUES ('68D28785DA464A50BDD05D587A64274D', 'C645A9B14A994ABC933F39EAA82CB734', null, '0', '幼儿园', null, '1');
INSERT INTO `parameter_constraint` VALUES ('6EC59D1EE937493BAF4EDA9720F961FB', 'E5B72E63008241A98B88F362C5610C17', null, 'day7', '近7天', null, null);
INSERT INTO `parameter_constraint` VALUES ('7349BB1FBA854488AFBBE524395791B8', '6E1F34F459A54798AE668665A63E5E34', null, '2', '初中', null, '3');
INSERT INTO `parameter_constraint` VALUES ('766B24B0CE2740D7AD6CBF05ED68A966', 'F5FFCF620BBC4126B35BC8A720A65007', null, 'IOS', '苹果系统', null, '1');
INSERT INTO `parameter_constraint` VALUES ('7918A8DBD6A740AB954AC48E0290EEF8', 'F5FFCF620BBC4126B35BC8A720A65007', null, 'ANDROID', '安装系统', null, '2');
INSERT INTO `parameter_constraint` VALUES ('7B4AD2415EB9493BAD6A32C07C567116', '6B496D442A3C48358D47C05F0B33DEE2', null, '1', '1', null, '1');
INSERT INTO `parameter_constraint` VALUES ('7BB917C0E3A947759A54F9F6226CE4E5', 'DADA297223D94A4089A2B0FD1018A5D3', null, 'teacher_certificate', '教师认证', null, null);
INSERT INTO `parameter_constraint` VALUES ('7C43830E702148599251133282ADBF17', '988D6D1874664C2DB5A1EF7B21E7CBE0', null, '2', '中', null, '2');
INSERT INTO `parameter_constraint` VALUES ('81E9A5DBB73945079611962A62151C69', 'E5B72E63008241A98B88F362C5610C17', null, 'day183', '近半年', null, null);
INSERT INTO `parameter_constraint` VALUES ('832D70D85852415485A41D6617991732', '6F51A68F27F54C0DB6D926237D0487BC', null, '1', '正确', null, '1');
INSERT INTO `parameter_constraint` VALUES ('8F16E7A03D134946B942DF72A8301383', null, null, 'ARTS', 'æç§', null, '1');
INSERT INTO `parameter_constraint` VALUES ('91783A626735467F819F1A905484D4E3', null, null, 'SCIENCE', 'çç§', null, '1');
INSERT INTO `parameter_constraint` VALUES ('92566A2300044E89BED1D468FF18C2B4', 'BBC5985DD61F490E8697CC6A4B5477BA', null, '1', '小学', null, '2');
INSERT INTO `parameter_constraint` VALUES ('A85ED66621424BE3839631F5353CD540', '37E654789880409EB1196C4E0030F185', null, '2', '2', null, '2');
INSERT INTO `parameter_constraint` VALUES ('AB582A8D6F0E45C99F68D74D2564C324', 'E32F963B9BBD4ADA91037D6C9A9567F4', null, 'DAY', '天', null, '1');
INSERT INTO `parameter_constraint` VALUES ('ACC00B11A9794822BA6135E05F7E0C82', 'D7F10EBBAC48427DA558482DA56C2FFF', null, 'ARTS', '文科', null, '2');
INSERT INTO `parameter_constraint` VALUES ('ADAEC92CC24F48A8B69B4E812DA762AE', 'E5B72E63008241A98B88F362C5610C17', null, 'day365', '近一年', null, null);
INSERT INTO `parameter_constraint` VALUES ('AF25DE51F27A4225B4895108028D40A6', 'DADA297223D94A4089A2B0FD1018A5D3', null, 'reset_password', '重置密码', null, null);
INSERT INTO `parameter_constraint` VALUES ('BBE0DF8AE0E04B0E854361E57995C147', '37E654789880409EB1196C4E0030F185', null, '1', '1', null, '1');
INSERT INTO `parameter_constraint` VALUES ('C4006CEA424A49C8973A6DE50D48E48B', 'C645A9B14A994ABC933F39EAA82CB734', null, '2', '中学', null, '3');
INSERT INTO `parameter_constraint` VALUES ('C91B03A1E1CA4B679370682C4F373833', 'E5B72E63008241A98B88F362C5610C17', null, 'day30', '近一个月', null, null);
INSERT INTO `parameter_constraint` VALUES ('CCD2A58862A24412A82ACB669D7F16C0', null, null, '2015-45', '周', null, '2');
INSERT INTO `parameter_constraint` VALUES ('D19180C71AC141E9A040BC1FCB172894', 'E5B72E63008241A98B88F362C5610C17', null, 'today', '今天', null, null);
INSERT INTO `parameter_constraint` VALUES ('D47C66B0D57E44278C6B60AC0E3B78BD', '988D6D1874664C2DB5A1EF7B21E7CBE0', null, '1', '易', null, '1');
INSERT INTO `parameter_constraint` VALUES ('DC168ABFB0B74B08905AECB89698BA7E', 'D7F10EBBAC48427DA558482DA56C2FFF', null, 'SCIENCE', '理科', null, '1');
INSERT INTO `parameter_constraint` VALUES ('E1530DD5D91C4F61A94454B1DAA82A4B', null, null, 'fs', 'fs', null, '1');
INSERT INTO `parameter_constraint` VALUES ('E899500FDEE945E28E186EAA9498EB37', 'DADA297223D94A4089A2B0FD1018A5D3', null, 'register', '注册', null, null);
INSERT INTO `parameter_constraint` VALUES ('F05873D8BBCE4CE489D0BAF5BFB6AE8D', null, null, '2015-12-07', '日', null, '1');

-- ----------------------------
-- Table structure for parameter_retur
-- ----------------------------
DROP TABLE IF EXISTS `parameter_retur`;
CREATE TABLE `parameter_retur` (
  `PARAMETER_ID` varchar(32) NOT NULL COMMENT '参数编号',
  `EXAMPLE_ID` varchar(32) DEFAULT NULL COMMENT '事例编号',
  `PARAMETER_NAME` varchar(32) DEFAULT NULL COMMENT '参数名称',
  `PARAMETER_CODE` varchar(32) DEFAULT NULL COMMENT '参数代码',
  `PARAMETER_DATA_TYPE` varchar(32) DEFAULT NULL COMMENT '参数数据类型',
  `MIN_LENGTH` int(11) DEFAULT NULL COMMENT '最小长度',
  `MAX_LENGTH` int(11) DEFAULT NULL COMMENT '最大长度',
  `PARAMETER_EXAMPLE` varchar(64) DEFAULT NULL COMMENT '参数实例',
  `PARAMETER_EXPLAIN` varchar(64) DEFAULT NULL COMMENT '参数说明',
  `IS_MUST` varchar(16) DEFAULT NULL COMMENT '是否必须',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '权重',
  `CREAT_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`PARAMETER_ID`),
  KEY `FK_Reference_8` (`EXAMPLE_ID`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`EXAMPLE_ID`) REFERENCES `example` (`EXAMPLE_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='返回值_参数';

-- ----------------------------
-- Records of parameter_retur
-- ----------------------------
INSERT INTO `parameter_retur` VALUES ('081C545A7AC343F7A97BC6543AB86AF9', '0DF701ABED344ACD8123D54AD238D7D7', '经验总量', 'experience', 'int', '1', '11', '300', '', '1', '1', '2015-11-18 17:15:29');
INSERT INTO `parameter_retur` VALUES ('0A42C34AC56E4270A9B0D5618582E0D3', '7A56C5966B174ED0BD55E81494CE21F9', '累计经验', 'experience', 'int', '11', '11', '380', '', '1', '1', '2015-11-26 11:21:55');
INSERT INTO `parameter_retur` VALUES ('0A7347A5844D470FB19118C8E61954F8', 'A3E8E064735F4D82A18EF5D38743E39E', '奖励值', 'awardValue', 'int', '1', '16', '100', '', '1', '2', '2015-12-03 09:56:57');
INSERT INTO `parameter_retur` VALUES ('0FD7D9AA8D1E4D1E86E7D3C16F7178DF', 'C7368773BC064E4CAAD03D532EE7BDA7', '当前战名校编号', 'challengeSchooleId', 'int', '11', '11', '1', '', '1', '1', '2015-11-26 11:11:15');
INSERT INTO `parameter_retur` VALUES ('1104902CDE244665A2DE030078983FCA', 'D670A0F43ED64723B198631BD543D726', '是否是末级', 'selfLabel', 'bool', '1', '1', 'true', '', '1', '5', '2015-11-11 11:05:50');
INSERT INTO `parameter_retur` VALUES ('13BD03ECAA4A4591AF0CAA213E6DF27D', '8A1C738341D84A64997CD9437A0CF439', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-11 11:50:47');
INSERT INTO `parameter_retur` VALUES ('151F23C814074959813CE6588E341250', '98E9DEBCFCB343E1918A0C9B6463A39A', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-11 11:39:35');
INSERT INTO `parameter_retur` VALUES ('192F59A2A5B0466381A3B2E2945630BE', '26D05E337AF244B7A1FE42F4E0F7CADC', '电话号码', 'phoneNumber', 'String', '11', '11', '13681004146', '', '1', '3', '2015-11-09 09:29:14');
INSERT INTO `parameter_retur` VALUES ('1C4E5D82A4F04A69B9376E7BAAF13E88', '8DA331F5DB774C27B579A2D21BA42C8E', '星星数', 'starNumber', 'int', '11', '11', '3', '', '1', '7', '2015-11-26 16:37:56');
INSERT INTO `parameter_retur` VALUES ('1DC9A6127EAB441BA045BE8F4F3EF104', '480A30BD67B546CA9857077F7FFED700', '反馈信息', 'messege', 'String', '1', '1', '1', '', '1', '1', '2015-12-02 10:30:41');
INSERT INTO `parameter_retur` VALUES ('214498C6279341AA8E4DD28808154FA0', '261444B4DA7F487094B350AE9FD8D458', '金币', 'currency', 'int', '1', '11', '123', '', '1', '3', '2015-12-07 11:12:48');
INSERT INTO `parameter_retur` VALUES ('25B78F1D28B84A9285642E88091F29BC', 'ED25D3B986C64090B0638E6FDE64B9AE', 'w', 'w', 'int', '1', '1', '1', 'undefined', '1', '1', '2015-12-15 08:51:57');
INSERT INTO `parameter_retur` VALUES ('25CBBDF504C04046A7AE3C7278712FAC', null, 'user', 'user', 'String', '1', '11', '1', '', '1', '1', '2015-12-10 17:46:16');
INSERT INTO `parameter_retur` VALUES ('264D92BC192E4BE18D294E77A9D818E5', '7A56C5966B174ED0BD55E81494CE21F9', '学科编号', 'subjectCode', 'String', '32', '32', '274ea', '', '1', '5', '2015-11-26 11:23:28');
INSERT INTO `parameter_retur` VALUES ('29EC331C04D14337928E7642FC84A225', 'C6675ACC902244E3AF3CB0D7F5963345', '反馈信息', 'message', 'int', '1', '11', '1', '', '1', '1', '2015-12-14 15:39:26');
INSERT INTO `parameter_retur` VALUES ('31C444EE33564B3EABE77C3E6B54AAFF', 'BA7ACEC4BC01407AB930E894C0D0C28F', '浏览次数', 'browseTime', 'int', '1', '11', '1', '', '1', '10', '2015-11-17 09:52:35');
INSERT INTO `parameter_retur` VALUES ('3873EDAE89DC490C99F5614E62055E26', 'C7368773BC064E4CAAD03D532EE7BDA7', '用户当前进度', 'thisSchedule', 'int', '11', '11', '1', '', '1', '4', '2015-11-26 11:12:32');
INSERT INTO `parameter_retur` VALUES ('3C7E8FF553724F13BF69D5D1E7F277B0', '8DA331F5DB774C27B579A2D21BA42C8E', '关卡序号', 'customsBarrierId', 'int', '11', '11', '1', '', '1', '4', '2015-11-26 16:35:41');
INSERT INTO `parameter_retur` VALUES ('4035A20617844A12A515F73C29372176', '0374881F7E134EB7917E154102255316', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-11 10:35:09');
INSERT INTO `parameter_retur` VALUES ('40E50D6B55944B2AA80B8018DAD0C63C', 'B3799A1042EE4CCFA1AB13D31E74FAB2', '短信验证码', 'verificationCode', 'String', '6', '6', '000000', '', '1', '2', '2015-11-11 10:27:05');
INSERT INTO `parameter_retur` VALUES ('414DAE8237C54233A26B3C2FC39D68E5', 'BA7ACEC4BC01407AB930E894C0D0C28F', '是否为精华', 'isEssence', 'String', '1', '11', '1', '', '1', '14', '2015-11-17 09:55:29');
INSERT INTO `parameter_retur` VALUES ('41FCC4B772BB4ED19A450344B2336668', 'D05FEEE156F64AC78C94060E4395EED8', '高校名称', 'university', 'String', '2', '16', '中国人民大学', '', '1', '3', '2015-11-16 09:24:41');
INSERT INTO `parameter_retur` VALUES ('439572C481D442808F255372BF3BDB6B', '8DA331F5DB774C27B579A2D21BA42C8E', '当前进度', 'thisSchedule', 'int', '11', '11', '1', '', '1', '2', '2015-11-26 16:34:26');
INSERT INTO `parameter_retur` VALUES ('4AC1422D4A284AB3B87818E002FC00AE', '8DA331F5DB774C27B579A2D21BA42C8E', '学科编号', 'subjectCode', 'String', '32', '32', '274ea', '考试关卡没有改参数', '0', '5', '2015-11-26 16:36:34');
INSERT INTO `parameter_retur` VALUES ('4D832BF3DC034E579F9789ABD5098F39', '53C75EC8273344FDB9BE724594A14B5A', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-24 12:00:49');
INSERT INTO `parameter_retur` VALUES ('4F5F174CFCC6425D80CD1CE6AB9CBEFD', 'E052FBD0635B46FDA186134BAF37C82C', '学科名称', 'subjectName', 'String', '2', '3', '物理', '', '1', '2', '2015-11-11 10:46:52');
INSERT INTO `parameter_retur` VALUES ('4FD52FD9BDD24C7DBDA1BE347C4DBA2B', '7A0FE99A139A48949C4B0C1146D831EA', '省直辖市编号', 'provinceId', 'int', '11', '11', '1', '', '1', '2', '2015-11-16 09:20:45');
INSERT INTO `parameter_retur` VALUES ('507E33A41FF0475CA078B1CF750A18BA', 'D670A0F43ED64723B198631BD543D726', ' 知识点代码', 'code', 'String', '32', '32', '2ee1c4979f674b468d2faa024bce4b99', '', '1', '1', '2015-11-11 11:03:13');
INSERT INTO `parameter_retur` VALUES ('51A69DFC43DA4D31802C769BAAC34FFD', 'E052FBD0635B46FDA186134BAF37C82C', '学科代码', 'code', 'String', '5', '5', '274ea', '', '1', '1', '2015-11-11 10:46:23');
INSERT INTO `parameter_retur` VALUES ('52DB36F4514A4C3EA8F7C33C40016297', 'BA7ACEC4BC01407AB930E894C0D0C28F', '感悟内容', 'content', 'String', '16', '1000', ' 开发商结婚老师的看法和了似的咖啡碱老师的课了独守空', '', '1', '6', '2015-11-17 09:50:13');
INSERT INTO `parameter_retur` VALUES ('5394DC283F6D492DA35FC41BA45704C1', '7A56C5966B174ED0BD55E81494CE21F9', '当前等级', 'rank', 'int', '11', '11', '2', '', '1', '2', '2015-11-26 11:22:13');
INSERT INTO `parameter_retur` VALUES ('54773E76D9024A36B204D6F5B0906326', 'C7368773BC064E4CAAD03D532EE7BDA7', '对手所在位置', 'opponentLocation', 'int', '11', '11', '14', '', '1', '2', '2015-11-26 11:12:07');
INSERT INTO `parameter_retur` VALUES ('5AC98A253A824C2290A9962FDC5942FB', '7A56C5966B174ED0BD55E81494CE21F9', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-26 11:25:35');
INSERT INTO `parameter_retur` VALUES ('5B169AA6BC4247EFB00FCF1DA14F78F1', '8DA331F5DB774C27B579A2D21BA42C8E', '对手位置', 'opponentLocation', 'int', '11', '11', '14', '', '1', '3', '2015-11-26 16:34:48');
INSERT INTO `parameter_retur` VALUES ('5B7F48D7C78041359130C4D9A96AFD84', 'C7368773BC064E4CAAD03D532EE7BDA7', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '2', '2015-11-26 11:11:47');
INSERT INTO `parameter_retur` VALUES ('5C19632759F5492EA19F7860D7FBD642', 'BA7ACEC4BC01407AB930E894C0D0C28F', '感悟编号', 'inspirationId', 'int', '1', '11', '1', '', '1', '4', '2015-11-17 09:48:31');
INSERT INTO `parameter_retur` VALUES ('610939240F7F467BB6404C6944F9C276', 'DB9F037984174A7389841D0BC800C35C', '年级代码', 'code', 'String', '5', '5', '24156', '', '1', '1', '2015-11-11 10:42:40');
INSERT INTO `parameter_retur` VALUES ('6219EE43406D47A9A7274A4E5AB521E5', 'D5B141E7A00F4892B20B95B8FEA81607', '反馈信息', 'message', 'int', '11', '11', '0', '', '1', '1', '2015-11-11 13:36:40');
INSERT INTO `parameter_retur` VALUES ('6321389DA9DE4085A0F68BC2CAD8C2E9', 'BA7ACEC4BC01407AB930E894C0D0C28F', '总页数', 'totalPages', 'int', '1', '11', '5', '', '1', '3', '2015-11-17 09:47:48');
INSERT INTO `parameter_retur` VALUES ('642779B657764C83B1697DCD04AE3A59', '1B543244FBC04F5895348E6BF7E02422', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-09 10:16:22');
INSERT INTO `parameter_retur` VALUES ('644684800B3242E3B2BECADE1AD236E8', '26D05E337AF244B7A1FE42F4E0F7CADC', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-09 09:09:51');
INSERT INTO `parameter_retur` VALUES ('6E92E953D42F430A9675620329DA5E21', '7A56C5966B174ED0BD55E81494CE21F9', '获得星星', 'startNumber', 'int', '11', '11', '3', '', '1', '4', '2015-11-26 11:22:56');
INSERT INTO `parameter_retur` VALUES ('6EE11324F93D4A0AA47EBCA2F334264C', '0669AF50419A4513B10882E46916CECC', 'f', 'f', 'String', '1', '1', 'f', 'undefined', '1', '1', '2015-12-15 10:03:29');
INSERT INTO `parameter_retur` VALUES ('7167D6C2114D4444ABF5E0BAAC6CEA1E', 'BA7ACEC4BC01407AB930E894C0D0C28F', '是否发表', 'isPublish', 'int', '1', '11', '1', '', '1', '9', '2015-11-17 09:52:01');
INSERT INTO `parameter_retur` VALUES ('734E83A514384343B3C07C09BE6CE478', 'DB9F037984174A7389841D0BC800C35C', '年级名称', 'gradeName', 'String', '2', '3', '高一', '', '1', '2', '2015-11-11 10:43:33');
INSERT INTO `parameter_retur` VALUES ('787D33F5EE7041B2A8C6262377C324F8', '7A0FE99A139A48949C4B0C1146D831EA', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-16 09:20:17');
INSERT INTO `parameter_retur` VALUES ('78CDF4F45837403F9194300599817186', 'ED25D3B986C64090B0638E6FDE64B9AE', 'q', 'q', 'String', '1', '1', '1', 'undefined', '1', '1', '2015-12-15 08:51:34');
INSERT INTO `parameter_retur` VALUES ('7AED411293C841C0B7F87C9B37F80340', '8DA331F5DB774C27B579A2D21BA42C8E', '答对总题数', 'finishTime', 'int', '11', '11', '10', ' ', '1', '6', '2015-11-26 16:37:20');
INSERT INTO `parameter_retur` VALUES ('83A866A27371407E848B53912A14F388', '261444B4DA7F487094B350AE9FD8D458', '等级', 'rank', 'int', '1', '11', '1', '', '1', '1', '2015-12-07 11:11:54');
INSERT INTO `parameter_retur` VALUES ('87F5C52ED89444E6927D147B307B6BCC', '8DA331F5DB774C27B579A2D21BA42C8E', '战名校编号', 'challengeSchooleId', 'int', '11', '11', '1', '', '1', '1', '2015-11-26 16:34:02');
INSERT INTO `parameter_retur` VALUES ('89A6735E98874012810D5DFA9C0E384B', 'A3E8E064735F4D82A18EF5D38743E39E', '奖励类型', 'awardType', 'String', '1', '16', 'EXP', '', '1', '1', '2015-12-03 09:56:33');
INSERT INTO `parameter_retur` VALUES ('8C0D83BF178E403DB4B22AAA9EA3E398', 'D670A0F43ED64723B198631BD543D726', '知识点名称', 'name', 'String', '1', '32', ' 对象的概念', '', '1', '2', '2015-11-11 11:04:00');
INSERT INTO `parameter_retur` VALUES ('8E8CAA9E920945AB9A58DA13E2CFC5E9', 'BA7ACEC4BC01407AB930E894C0D0C28F', '收藏次数', 'collectTime', 'int', '1', '11', '1', '', '1', '13', '2015-11-17 09:54:50');
INSERT INTO `parameter_retur` VALUES ('8FA02C741EAF4CD9AC3FBA88E142D9AD', 'BA7ACEC4BC01407AB930E894C0D0C28F', '感悟总数', 'total', 'int', '1', '11', '12', '', '1', '2', '2015-11-17 09:47:04');
INSERT INTO `parameter_retur` VALUES ('90FC5FBE57C64662B19DF72D0B066A93', 'BA7ACEC4BC01407AB930E894C0D0C28F', '点赞次数', 'praiseTime', 'int', '1', '11', '1', '', '1', '11', '2015-11-17 09:53:16');
INSERT INTO `parameter_retur` VALUES ('930DCC1006724E199CA271F3F3196FBC', '0DF701ABED344ACD8123D54AD238D7D7', '当前等级', 'rank', 'int', '1', '11', '300', '', '1', '1', '2015-11-18 17:15:48');
INSERT INTO `parameter_retur` VALUES ('976BBE1B5BEA4A659112B75A192F3236', '261444B4DA7F487094B350AE9FD8D458', '经验', 'experience', 'int', '1', '11', '345', '', '1', '2', '2015-12-07 11:12:29');
INSERT INTO `parameter_retur` VALUES ('98D31D281C5948FAB31C5C43E1E5338F', 'B3799A1042EE4CCFA1AB13D31E74FAB2', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-11 10:26:20');
INSERT INTO `parameter_retur` VALUES ('9FD6B3C8D09D4DC682E1CDF433A5F5CF', 'BA7ACEC4BC01407AB930E894C0D0C28F', '评论次数', 'commentTime', 'int', '1', '11', '1', '', '1', '12', '2015-11-17 09:53:44');
INSERT INTO `parameter_retur` VALUES ('A41652E5D815497BB9D520CB896FBCCE', 'D05FEEE156F64AC78C94060E4395EED8', '高校编号', 'universityId', 'int', '11', '11', '1', '', '1', '2', '2015-11-16 09:24:02');
INSERT INTO `parameter_retur` VALUES ('B6720A5BF8684A69A35AA3F92E87312C', 'BA7ACEC4BC01407AB930E894C0D0C28F', '封面图片', 'coverPicture', 'String', '16', '256', 'upload\\\\image\\\\201511\\\\F180B410841449B08996733CAB768C9A.jpg', '', '1', '5', '2015-11-17 09:49:30');
INSERT INTO `parameter_retur` VALUES ('CDBBD76200B24387BB2362D18F198B5F', 'D670A0F43ED64723B198631BD543D726', ' 是否可以取题', 'chk', 'bool', '1', '1', 'true', '', '1', '4', '2015-11-11 11:05:27');
INSERT INTO `parameter_retur` VALUES ('D3487258737D4A6D829841DD7A2CB961', 'A3A1F2C37B8B4D7DB33060D15C7A8CE7', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-11 13:36:05');
INSERT INTO `parameter_retur` VALUES ('D5E3A90D41B3448F8C32856E82A16863', '7A56C5966B174ED0BD55E81494CE21F9', '对题数', 'rightNumber', 'int', '11', '11', '10', '', '1', '3', '2015-11-26 11:22:35');
INSERT INTO `parameter_retur` VALUES ('D7060F3E8CD24AA39B7BFF2FFD3714AA', '26D05E337AF244B7A1FE42F4E0F7CADC', '回话编号', 'sessionId', 'String', '32', '32', 'DEAECF14B052479CA455BF7F860131AD', '', '1', '2', '2015-11-09 09:28:43');
INSERT INTO `parameter_retur` VALUES ('DCF1D59008A44BFD99429BFEFFC11324', 'CF6ED19A3CDC42868868900BAFAEBAC8', '教材版本名称', 'bookType', 'String', '2', '10', '人教版', '', '1', '2', '2015-11-11 10:56:44');
INSERT INTO `parameter_retur` VALUES ('E7AE9B0F7AAD495DB5F98BF729857AF0', '7A0FE99A139A48949C4B0C1146D831EA', '省直辖市名称', 'province', 'String', '2', '16', '广西', '', '1', '3', '2015-11-16 09:21:26');
INSERT INTO `parameter_retur` VALUES ('EAAB9709806A44B8A8047994DF8DC116', '0DF701ABED344ACD8123D54AD238D7D7', '金币总量', 'currency', 'int', '1', '11', '300', '', '1', '1', '2015-11-18 17:15:10');
INSERT INTO `parameter_retur` VALUES ('ECEF3A67EFDD43F08ADE6BF37C141310', 'A3E8E064735F4D82A18EF5D38743E39E', '连续签到次数', 'signTime', 'int', '1', '16', '2', '', '1', '3', '2015-12-03 09:57:26');
INSERT INTO `parameter_retur` VALUES ('F1B20E13A5524323BE5E54A183AA5507', 'D05FEEE156F64AC78C94060E4395EED8', '反馈信息', 'message', 'int', '11', '11', '1', '', '1', '1', '2015-11-16 09:23:42');
INSERT INTO `parameter_retur` VALUES ('F2059A10DE574FCA83E0DDC36EF58574', '7F5AA4B551E441CEAD0AB80E535C510A', '连续签到次数', 'signTime', 'String', '1', '11', '1', '', '1', '1', '2015-12-03 09:54:59');
INSERT INTO `parameter_retur` VALUES ('F5936ACD6D7F4CEFB5F7FBBE66D553ED', 'BA7ACEC4BC01407AB930E894C0D0C28F', '是否通过审核', 'isPassCheck', 'int', '1', '11', '1', '', '1', '8', '2015-11-17 09:51:43');
INSERT INTO `parameter_retur` VALUES ('F725FB815A1747EF827AAE5F995920CE', 'D670A0F43ED64723B198631BD543D726', '是否是末级', 'selfLabel', 'bool', '1', '1', 'false', '', '1', '5', '2015-11-11 11:06:10');
INSERT INTO `parameter_retur` VALUES ('FA9D9138BAD8402ABA718101430DA0EF', 'BA7ACEC4BC01407AB930E894C0D0C28F', '插图', 'illustration', 'String', '16', '256', ' upload\\\\image\\\\201511\\\\F180B410841449B08996733CAB768C9A.jpg', '', '1', '7', '2015-11-17 09:50:55');
INSERT INTO `parameter_retur` VALUES ('FC138D9A18A542C48E2FAE6CCE121E2F', 'D670A0F43ED64723B198631BD543D726', ' 父知识点代码 ', ' parentCode', 'String', '32', '32', '12925dc1de5e4368a6d5e12fb66dec35', '', '1', '3', '2015-11-11 11:04:41');
INSERT INTO `parameter_retur` VALUES ('FCDC7883AF9641E88A516C9DA739B201', 'BA7ACEC4BC01407AB930E894C0D0C28F', '反馈信息', 'message', 'int', '1', '11', '1', '', '1', '1', '2015-11-17 09:46:02');
INSERT INTO `parameter_retur` VALUES ('FCE4649CE36C45AFA5D5838B869A0627', 'CF6ED19A3CDC42868868900BAFAEBAC8', '教材版本代码', 'code', 'String', '32', '32', 'c88ba8a0e85846438937106b17d1282b', '', '1', '1', '2015-11-11 10:56:02');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `PROJECT_ID` varchar(32) NOT NULL COMMENT '项目编号',
  `PROJECT_NAME` varchar(16) DEFAULT NULL COMMENT '项目名称',
  `PROJECT_CODE` varchar(32) DEFAULT NULL COMMENT '项目代码',
  `PROJECT_INTRO` varchar(256) DEFAULT NULL COMMENT '项目简介',
  `CREAT_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '权重',
  `COMPANY_ID` varchar(32) DEFAULT NULL COMMENT '公司编号',
  `AUTHOR_NAME` varchar(32) DEFAULT NULL COMMENT '作者姓名',
  `VERSIONS` varchar(32) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`PROJECT_ID`),
  KEY `FK_PROJECT_COMPANY` (`COMPANY_ID`),
  CONSTRAINT `FK_PROJECT_COMPANY` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目_项目';

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('4FE95D26295846979FC1D07D3393B2C8', '测试API', 'testapi', null, '2016-03-31 17:03:22', '1', '2582B1DAF550485980F519096F3ACEC1', 'hechen', '1.0');
INSERT INTO `project` VALUES ('543762007CDC4063B787AE4E71C14762', 'UUIMS-TOOL', 'UUIMS-TOOL', null, '2016-03-11 16:01:28', '1', '2582B1DAF550485980F519096F3ACEC1', 'hechen', '1.0');
INSERT INTO `project` VALUES ('5605C8B8E44540608B0D5CB0CADAA7B7', '博客', 'bloges', null, '2015-12-30 11:51:26', '1', '900912481B474A63A3104514E4EE3E22', 'nimei', '1.0');
INSERT INTO `project` VALUES ('9B8AACB65185483DAADF914C26703FD9', '好学生', 'goodstudent', '好学生', '2015-11-02 14:35:41', '1', '2582B1DAF550485980F519096F3ACEC1', 'hechen', '1.0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ROLE_ID` varchar(32) NOT NULL,
  `ROLE_NAME` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `ROLE_CODE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限模块_角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('D42465CF64D64BC889770A206C8B0049', '管理员', 'ADMIN');
INSERT INTO `role` VALUES ('E8517FDA0CE94F01BDB80B5C81217ABC', '普通用户', 'GENERAL');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USER_ID` varchar(32) NOT NULL COMMENT '用户编号',
  `USER_NAME` varchar(16) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(32) DEFAULT NULL COMMENT '密码',
  `EMAIL` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `MOBILE_NUMBER` varchar(16) DEFAULT NULL COMMENT '手机号码',
  `REGISTER_DATE` datetime DEFAULT NULL COMMENT '注册时间',
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `COMPANY_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `FK_USER_ROLE` (`ROLE_ID`),
  KEY `FK_USER_COMPANY` (`COMPANY_ID`),
  CONSTRAINT `FK_USER_COMPANY` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_USER_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户_用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('00D25A6CFB68474F891CBF2DA3C58B3F', 'nimei', 'C6F057B86584942E415435FFB1FA93D4', '592794139@qq.com', null, '2015-12-30 11:51:05', 'D42465CF64D64BC889770A206C8B0049', '900912481B474A63A3104514E4EE3E22');
INSERT INTO `user` VALUES ('0E61AD9A6CAE4B26A3B174021ED27CE4', 'tom', 'C6F057B86584942E415435FFB1FA93D4', 'ff', null, '2015-12-30 11:53:25', 'E8517FDA0CE94F01BDB80B5C81217ABC', '900912481B474A63A3104514E4EE3E22');
INSERT INTO `user` VALUES ('7F3216402F294A3890836E0EA2A09D07', 'test', '670B14728AD9902AECBA32E22FA4F6BD', '592794139@qq.com', null, '2015-11-17 17:54:19', 'E8517FDA0CE94F01BDB80B5C81217ABC', '2582B1DAF550485980F519096F3ACEC1');
INSERT INTO `user` VALUES ('B1AD9D8452834E9A958365A42359B825', 'sooncode', 'C6F057B86584942E415435FFB1FA93D4', '592794139@qq.com', null, '2015-12-25 11:25:10', 'D42465CF64D64BC889770A206C8B0049', '506648FA0D344C84852FBDA254EDD2F1');
INSERT INTO `user` VALUES ('EE4D583C3DC24125839CD2C89D5960DC', 'hechen', '9481344B23EDA39902D5DC9646BC4214', '592794139@qq.com', null, '2015-11-24 08:54:18', 'D42465CF64D64BC889770A206C8B0049', '2582B1DAF550485980F519096F3ACEC1');
INSERT INTO `user` VALUES ('FAA4BF1DA18C402893F7BB52FAC0B4C3', 'lishi', 'C6F057B86584942E415435FFB1FA93D4', '592794139@qq.com', null, '2015-12-25 11:36:26', 'E8517FDA0CE94F01BDB80B5C81217ABC', '506648FA0D344C84852FBDA254EDD2F1');

-- ----------------------------
-- Table structure for value_explain
-- ----------------------------
DROP TABLE IF EXISTS `value_explain`;
CREATE TABLE `value_explain` (
  `VALUE_EXPLAIN_ID` varchar(32) NOT NULL COMMENT '参数值说明编号',
  `PARAMETER_ID` varchar(32) DEFAULT NULL COMMENT '参数_编号',
  `VALUE` varchar(32) DEFAULT NULL COMMENT '常数值',
  `VALUE_MEANING` varchar(64) DEFAULT NULL COMMENT '值含义',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`VALUE_EXPLAIN_ID`),
  KEY `FK_VALUE_EXPLAIN_PARAMETER` (`PARAMETER_ID`),
  CONSTRAINT `FK_VALUE_EXPLAIN_PARAMETER` FOREIGN KEY (`PARAMETER_ID`) REFERENCES `parameter_retur` (`PARAMETER_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='返回值_参数值说明';

-- ----------------------------
-- Records of value_explain
-- ----------------------------
INSERT INTO `value_explain` VALUES ('0C9B976AABA14902961A3F670052C981', '78CDF4F45837403F9194300599817186', '1', '1', '1');
INSERT INTO `value_explain` VALUES ('0E070947ED2F47E7A60BE8D9ACBBD3BB', '644684800B3242E3B2BECADE1AD236E8', '2', '验证码错误', '3');
INSERT INTO `value_explain` VALUES ('1DD91D478FB94C4CB84AAD3F49E3C3C4', '13BD03ECAA4A4591AF0CAA213E6DF27D', '404', 'sessionId失效', '4');
INSERT INTO `value_explain` VALUES ('20AC174AD7394207ACA6604076F24D62', '642779B657764C83B1697DCD04AE3A59', '500', '参数错误', '3');
INSERT INTO `value_explain` VALUES ('20FB381DD41C478F92050EC3F2BFFE6D', '98D31D281C5948FAB31C5C43E1E5338F', '0', '手机号码格式错误', '3');
INSERT INTO `value_explain` VALUES ('263808F74BFE42B8A01ABCFA64C4285B', '89A6735E98874012810D5DFA9C0E384B', 'GOLD', '金币', '2');
INSERT INTO `value_explain` VALUES ('27BC0CA12AF5454192CDCBCAB36D0E9B', '787D33F5EE7041B2A8C6262377C324F8', '1', '成功', '1');
INSERT INTO `value_explain` VALUES ('31D4F2468696438189197F2D5D7A2F31', '13BD03ECAA4A4591AF0CAA213E6DF27D', '0', '失败', '1');
INSERT INTO `value_explain` VALUES ('39006371AE9044DFB80C3035C1F528D4', '1DC9A6127EAB441BA045BE8F4F3EF104', '1', '收藏成功', '1');
INSERT INTO `value_explain` VALUES ('3CE9B5526D0C43078CD398BE110F38EE', '29EC331C04D14337928E7642FC84A225', '1', '成功', '1');
INSERT INTO `value_explain` VALUES ('3F98A46138F54D46BC016480E770957C', '1104902CDE244665A2DE030078983FCA', 'false', '否', '2');
INSERT INTO `value_explain` VALUES ('490BCB8163034AF6AAA97071A29DCC93', '5B7F48D7C78041359130C4D9A96AFD84', '2', '存在正在挑战的名校', '2');
INSERT INTO `value_explain` VALUES ('4D949BBD7A4241A596A0E2CCA4944C76', '1104902CDE244665A2DE030078983FCA', 'true', '是', '1');
INSERT INTO `value_explain` VALUES ('54373C7F573A4A6C9C0E8E22798EF738', '1DC9A6127EAB441BA045BE8F4F3EF104', '0', '已经收藏', '2');
INSERT INTO `value_explain` VALUES ('58DC86FAA49D4ABB804804F8C99E43B7', '13BD03ECAA4A4591AF0CAA213E6DF27D', '500', '参数错误', '3');
INSERT INTO `value_explain` VALUES ('5A7F3FA965CB4F3C935D9D90748ADA5D', '6219EE43406D47A9A7274A4E5AB521E5', '2', '手机号未注册', '2');
INSERT INTO `value_explain` VALUES ('639208ACDFEA4A87B9B8BD1D0B05EB2C', '98D31D281C5948FAB31C5C43E1E5338F', '500', '参数错误', '2');
INSERT INTO `value_explain` VALUES ('6401361A3B0B436E8993D8552252D230', '89A6735E98874012810D5DFA9C0E384B', 'EXP', '经验', '1');
INSERT INTO `value_explain` VALUES ('67F0B6CC7E684D43BE1C5F68EAE469D9', '6219EE43406D47A9A7274A4E5AB521E5', '3', '登录异常', '3');
INSERT INTO `value_explain` VALUES ('6896A601235747E1A9792B2F21672C37', 'F725FB815A1747EF827AAE5F995920CE', 'true', '是', '1');
INSERT INTO `value_explain` VALUES ('6BB6DEA4C58644088E3787B43412BB1A', '642779B657764C83B1697DCD04AE3A59', '0', '提交失败', '2');
INSERT INTO `value_explain` VALUES ('6C3AFCB8491E4073B429D0831637ACD5', '151F23C814074959813CE6588E341250', '404', 'sessionId已失效', '4');
INSERT INTO `value_explain` VALUES ('743858749A0B4CD2AB06BD2CCA7FFE23', '644684800B3242E3B2BECADE1AD236E8', '500', '参数错误', '4');
INSERT INTO `value_explain` VALUES ('7485C8B4FA5A4A05A38390581358081D', '644684800B3242E3B2BECADE1AD236E8', '0', '手机号也被注册', '1');
INSERT INTO `value_explain` VALUES ('A1877001B3814FE499746FCC60774F37', '4035A20617844A12A515F73C29372176', '2', '手机号码没有注册', '3');
INSERT INTO `value_explain` VALUES ('A2C742B80FE6413B82DB285A13A4F1CF', '151F23C814074959813CE6588E341250', '500', '参数错误', '3');
INSERT INTO `value_explain` VALUES ('AE581E2AFE4E477FAAB9D2CC7EC7A590', '4035A20617844A12A515F73C29372176', '1', '成功', '2');
INSERT INTO `value_explain` VALUES ('AFA4C4CADC2E43078A34BD7A0F9A4CC1', '98D31D281C5948FAB31C5C43E1E5338F', '1', '成功', '1');
INSERT INTO `value_explain` VALUES ('B3EB2764F2D743C58D55F5D4E9666EDA', '4035A20617844A12A515F73C29372176', '500', '参数错误', '4');
INSERT INTO `value_explain` VALUES ('B7A7128D620B4B4D90B0F32CF2C8EBBB', '151F23C814074959813CE6588E341250', '1', '成功', '2');
INSERT INTO `value_explain` VALUES ('C0FA5DDD2D8147A290EF5DAD818E7532', '4035A20617844A12A515F73C29372176', '0', '失败', '1');
INSERT INTO `value_explain` VALUES ('C97E68784F04499FA6599E0DB3338EE3', 'F725FB815A1747EF827AAE5F995920CE', 'false', '否', '2');
INSERT INTO `value_explain` VALUES ('D273BAD2385449BFB6BDD2013898B53D', '6219EE43406D47A9A7274A4E5AB521E5', '500', '参数错误', '4');
INSERT INTO `value_explain` VALUES ('DBC147FDCFD64553A4DBC87C9EA1D707', '151F23C814074959813CE6588E341250', '0', '失败', '1');
INSERT INTO `value_explain` VALUES ('E58DDB63632A410B85119E3BB19DF3EC', '6219EE43406D47A9A7274A4E5AB521E5', '0', '密码错误', '1');
INSERT INTO `value_explain` VALUES ('E8C00DDC7C8E4B10BA35169CC3594DE6', 'D3487258737D4A6D829841DD7A2CB961', '1', '成功', '1');
INSERT INTO `value_explain` VALUES ('EF7E71B9C45C4E5482186C610568C700', '13BD03ECAA4A4591AF0CAA213E6DF27D', '1', '成功', '2');
INSERT INTO `value_explain` VALUES ('F898AC631AB048BA8A0F5EA917CF97C6', '642779B657764C83B1697DCD04AE3A59', '1', '提交成功', '1');
INSERT INTO `value_explain` VALUES ('FF06DC5A45E7439F9F4E148303C7472F', '644684800B3242E3B2BECADE1AD236E8', '1', '注册成功', '2');
