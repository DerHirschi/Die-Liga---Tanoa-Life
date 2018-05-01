/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : arma3life

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-01 06:30:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `baulog`
-- ----------------------------
DROP TABLE IF EXISTS `baulog`;
CREATE TABLE `baulog` (
  `uid` varchar(50) NOT NULL,
  `spplatten_a5` int(16) NOT NULL,
  `sttraeger_stt` int(16) NOT NULL,
  `cement` int(16) NOT NULL,
  `glass` int(16) NOT NULL,
  `gesamtmenge` text,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of baulog
-- ----------------------------

-- ----------------------------
-- Table structure for `baustelle`
-- ----------------------------
DROP TABLE IF EXISTS `baustelle`;
CREATE TABLE `baustelle` (
  `typ` varchar(12) NOT NULL DEFAULT '0',
  `ist` int(32) DEFAULT NULL,
  `beschreibeung` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of baustelle
-- ----------------------------
INSERT INTO `baustelle` VALUES ('a5', '5', 'Spanplatten');
INSERT INTO `baustelle` VALUES ('cement', '0', 'Zement');
INSERT INTO `baustelle` VALUES ('glass', '11', 'Glass');
INSERT INTO `baustelle` VALUES ('stt', '0', 'StahtrÃ¤ger');

-- ----------------------------
-- Table structure for `gangs`
-- ----------------------------
DROP TABLE IF EXISTS `gangs`;
CREATE TABLE `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gangs
-- ----------------------------

-- ----------------------------
-- Table structure for `houses`
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of houses
-- ----------------------------

-- ----------------------------
-- Table structure for `laden`
-- ----------------------------
DROP TABLE IF EXISTS `laden`;
CREATE TABLE `laden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `preistabelle` text,
  `kassen` text,
  `upgrade` text,
  `owned` tinyint(4) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of laden
-- ----------------------------

-- ----------------------------
-- Table structure for `ligawh`
-- ----------------------------
DROP TABLE IF EXISTS `ligawh`;
CREATE TABLE `ligawh` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `whid` varchar(128) NOT NULL,
  `bestand` varchar(1024) NOT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ligawh
-- ----------------------------
INSERT INTO `ligawh` VALUES ('1', 'liga_wh_1', '[[\"ben\",2311],[\"di\",1382],[\"coffee\",8],[\"apple\",1154],[\"banan\",403],[\"peach\",920],[\"redgull\",1076],[\"stofish\",1121],[\"ghy\",0],[\"a9\",4],[\"a7\",41],[\"c6\",0],[\"a8\",8],[\"mache\",26],[\"salema\",179],[\"ornate\",116],[\"mackerel\",209],[\"mullet\",362],[\"tuna\",388],[\"catshark\",447],[\"oilp\",711],[\"bottledbeer\",348],[\"mull\",536],[\"a0\",200],[\"salt_r\",300],[\"glass\",761],[\"a10\",132],[\"iron_r\",2214],[\"copper_r\",2027],[\"stt\",1030],[\"storagebig\",118],[\"a6\",16],[\"b22\",0],[\"b23\",0],[\"bw\",229],[\"cement\",532],[\"tet\",293],[\"a5\",523],[\"schok\",272],[\"kakap\",335],[\"ggn\",140],[\"gsn\",379],[\"gl\",1406],[\"gsm\",1391],[\"diamondc\",1037],[\"c4\",0],[\"c3\",54],[\"c2\",1190],[\"c1\",575],[\"lockpick\",0],[\"boltcutter\",0],[\"a1t\",0],[\"tutrei\",0],[\"turtlesoup\",125],[\"21\",2752],[\"marijuana\",126],[\"cocainep\",502],[\"heroinp\",251],[\"lsdp\",215],[\"methp\",0],[\"nattee\",394]]', '2016-11-24 13:01:24');
INSERT INTO `ligawh` VALUES ('2', 'liga_wh_2', '[[\"peach\",1047],[\"banan\",0],[\"stofish\",1220],[\"coffee\",49],[\"cofbeap\",92],[\"cofbeas\",380],[\"kaut\",786],[\"corsurv\",1094],[\"corsurvlava\",1040],[\"goatrawfp\",537],[\"turtlesoup\",265],[\"perlp\",1087],[\"a1t\",12],[\"21\",2631],[\"marijuana\",419],[\"cocainep\",499],[\"lsdp\",506],[\"methp\",39],[\"nattee\",1117],[\"hode\",0]]', '2016-11-23 15:02:07');
INSERT INTO `ligawh` VALUES ('3', 'liga_wh_3', '[[\"tet\",0],[\"salt_r\",0],[\"banan\",0],[\"ana\",0],[\"apple\",1393],[\"peach\",0],[\"goatraw\",237],[\"sheepraw\",0],[\"tutrei\",0],[\"turtlesoup\",561],[\"cofbeas\",0],[\"bottledbeer\",130],[\"schok\",0],[\"hode\",0],[\"stofish\",0]]', '2016-11-24 19:01:11');
INSERT INTO `ligawh` VALUES ('4', 'liga_wh_4', '[[\"ben\",1423],[\"di\",0],[\"fassinv\",0],[\"rip\",0]]', '2016-11-24 09:32:42');

-- ----------------------------
-- Table structure for `ligaworld`
-- ----------------------------
DROP TABLE IF EXISTS `ligaworld`;
CREATE TABLE `ligaworld` (
  `StaaKass` int(32) NOT NULL DEFAULT '0',
  `ADACKass` int(32) NOT NULL,
  `DRKKass` int(32) NOT NULL,
  `leim` int(32) NOT NULL,
  `tankstaat` int(32) NOT NULL,
  `tankciv` int(32) NOT NULL,
  `lottopod` int(128) NOT NULL,
  `lottoday` int(32) NOT NULL,
  PRIMARY KEY (`StaaKass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ligaworld
-- ----------------------------
INSERT INTO `ligaworld` VALUES ('1', '2', '3', '241', '5', '6', '11144200', '4');

-- ----------------------------
-- Table structure for `lotto`
-- ----------------------------
DROP TABLE IF EXISTS `lotto`;
CREATE TABLE `lotto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `zahlen` varchar(64) NOT NULL DEFAULT '[]',
  `count` int(8) NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lotto
-- ----------------------------

-- ----------------------------
-- Table structure for `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `fromID` varchar(50) NOT NULL,
  `toID` varchar(50) NOT NULL,
  `message` text,
  `fromName` varchar(32) NOT NULL,
  `toName` varchar(32) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messages
-- ----------------------------

-- ----------------------------
-- Table structure for `players`
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `uid` int(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT '',
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `aliases` text,
  `coplevel` enum('0','1','2','3','4','5','6','7','8','9','10','11') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3','4','5','6','7','8') NOT NULL DEFAULT '0',
  `adaclevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `adminlevel` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `jail_time` int(11) NOT NULL DEFAULT '0',
  `blacklist` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text,
  `med_gear` text,
  `civ_gear` text,
  `adac_gear` text,
  `adac_licenses` text,
  `LastSeen` varchar(128) DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of players
-- ----------------------------

-- ----------------------------
-- Table structure for `tankstell`
-- ----------------------------
DROP TABLE IF EXISTS `tankstell`;
CREATE TABLE `tankstell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` varchar(1024) DEFAULT NULL,
  `preise` text,
  `kasse` int(11) DEFAULT NULL,
  `keysa` varchar(1024) DEFAULT NULL,
  `owned` tinyint(4) DEFAULT '0',
  `mahnungcount` int(16) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tankstell
-- ----------------------------

-- ----------------------------
-- Table structure for `vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `damage` text,
  `tuv` int(16) NOT NULL DEFAULT '0',
  `repcount` int(32) NOT NULL DEFAULT '0',
  `delcount` int(32) NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `inventory` varchar(500) DEFAULT '[]',
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicles
-- ----------------------------

-- ----------------------------
-- Table structure for `wanted`
-- ----------------------------
DROP TABLE IF EXISTS `wanted`;
CREATE TABLE `wanted` (
  `wantedID` varchar(50) NOT NULL,
  `wantedName` varchar(52) NOT NULL,
  `wantedCrimes` varchar(9000) NOT NULL,
  `wantedBounty` int(64) NOT NULL,
  `active` tinyint(8) NOT NULL,
  PRIMARY KEY (`wantedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wanted
-- ----------------------------

-- ----------------------------
-- Procedure structure for `!!!!MainWipe!!!!Achtung!!!!`
-- ----------------------------
DROP PROCEDURE IF EXISTS `!!!!MainWipe!!!!Achtung!!!!`;
DELIMITER ;;
CREATE DEFINER=`arma3`@`%` PROCEDURE `!!!!MainWipe!!!!Achtung!!!!`()
BEGIN



	TRUNCATE TABLE `vehicles`;

	TRUNCATE TABLE `gangs`;

	TRUNCATE TABLE `baulog`;	

	TRUNCATE TABLE `houses`;	

	TRUNCATE TABLE `messages`;

	TRUNCATE TABLE `players`;

	TRUNCATE TABLE `wanted`;



END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `countLigaVehicles`
-- ----------------------------
DROP PROCEDURE IF EXISTS `countLigaVehicles`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `countLigaVehicles`()
BEGIN

UPDATE `vehicles` SET `active` = `active`   + 1 WHERE `active` > 1 ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `countLottoSchein`
-- ----------------------------
DROP PROCEDURE IF EXISTS `countLottoSchein`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `countLottoSchein`()
BEGIN

UPDATE `lotto` SET `count` = `count`  - 1 WHERE `count` > 0 ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteDeadVehicles`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `deleteDeadVehicles`()
BEGIN



	DELETE FROM `vehicles` WHERE `alive` = 0 OR `active` > 7;



END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteLottoSchein`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteLottoSchein`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `deleteLottoSchein`()
BEGIN
	 DELETE FROM `lotto` WHERE `count` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldGangs`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldGangs`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `deleteOldGangs`()
BEGIN

  DELETE FROM `gangs` WHERE `active` = 0;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldHouses`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldHouses`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `deleteOldHouses`()
BEGIN

  DELETE FROM `houses` WHERE `owned` = 0;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldLaden`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldLaden`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `deleteOldLaden`()
BEGIN
	 DELETE FROM `laden` WHERE `owned` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldTanks`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldTanks`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `deleteOldTanks`()
BEGIN
	UPDATE `tankstell` SET `owned` = 0  WHERE `mahnungcount` > 3 ;
	 DELETE FROM `tankstell` WHERE `owned` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldWanted`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldWanted`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `deleteOldWanted`()
BEGIN

  DELETE FROM `wanted` WHERE `active` = 0;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PlayerCount67k`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PlayerCount67k`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PlayerCount67k`()
BEGIN



	SELECT * FROM `players` WHERE `bankacc` < 67000 AND 'cash' < 67000 ORDER BY Timestamp ASC;



END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `resetLigaVehicles`
-- ----------------------------
DROP PROCEDURE IF EXISTS `resetLigaVehicles`;
DELIMITER ;;
CREATE DEFINER=`armaserver`@`` PROCEDURE `resetLigaVehicles`()
BEGIN



UPDATE `vehicles` SET `active`= 0 WHERE `active` < 2 AND `active` != 0;



END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `TestVehicleImpSel`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TestVehicleImpSel`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TestVehicleImpSel`()
BEGIN



	SELECT * FROM `vehicles` WHERE `type` = `I%` ORDER BY Timestamp ASC;



END
;;
DELIMITER ;
