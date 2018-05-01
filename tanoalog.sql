/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : tanoalog

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-01 06:34:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `Ereigniss` varchar(50) NOT NULL,
  `UID` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `NetID` int(16) NOT NULL,
  `Notiz` varchar(300) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of adminlog
-- ----------------------------

-- ----------------------------
-- Table structure for `ahlog`
-- ----------------------------
DROP TABLE IF EXISTS `ahlog`;
CREATE TABLE `ahlog` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `Spieler` varchar(50) NOT NULL,
  `UID` varchar(50) NOT NULL,
  `Grund` varchar(300) DEFAULT NULL,
  `Details` varchar(300) DEFAULT NULL,
  `Output2` varchar(300) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ahlog
-- ----------------------------

-- ----------------------------
-- Table structure for `bismp`
-- ----------------------------
DROP TABLE IF EXISTS `bismp`;
CREATE TABLE `bismp` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `1` varchar(3000) DEFAULT NULL,
  `2` varchar(3000) DEFAULT NULL,
  `3` varchar(3000) DEFAULT NULL,
  `4` varchar(3000) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bismp
-- ----------------------------

-- ----------------------------
-- Table structure for `brett`
-- ----------------------------
DROP TABLE IF EXISTS `brett`;
CREATE TABLE `brett` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `fromID` varchar(50) NOT NULL,
  `fromName` text NOT NULL,
  `Header` text NOT NULL,
  `message` text NOT NULL,
  `active` varchar(2) NOT NULL DEFAULT '1',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brett
-- ----------------------------

-- ----------------------------
-- Table structure for `diagserver`
-- ----------------------------
DROP TABLE IF EXISTS `diagserver`;
CREATE TABLE `diagserver` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `beschr` varchar(100) DEFAULT NULL,
  `aSQF` varchar(10) DEFAULT NULL,
  `FPS` varchar(20) DEFAULT NULL,
  `minFPS` varchar(20) DEFAULT NULL,
  `Spieler` varchar(10) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diagserver
-- ----------------------------

-- ----------------------------
-- Table structure for `displaylog`
-- ----------------------------
DROP TABLE IF EXISTS `displaylog`;
CREATE TABLE `displaylog` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `Ereigniss` varchar(50) NOT NULL,
  `UID` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `SteamName` varchar(50) NOT NULL,
  `Betrag` varchar(500) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of displaylog
-- ----------------------------

-- ----------------------------
-- Table structure for `ebay`
-- ----------------------------
DROP TABLE IF EXISTS `ebay`;
CREATE TABLE `ebay` (
  `ID` int(16) NOT NULL,
  `bayarray` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ebay
-- ----------------------------

-- ----------------------------
-- Table structure for `lifemp`
-- ----------------------------
DROP TABLE IF EXISTS `lifemp`;
CREATE TABLE `lifemp` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `fnc1` varchar(300) DEFAULT NULL,
  `par1` varchar(3000) DEFAULT NULL,
  `to1` varchar(3000) DEFAULT NULL,
  `log1` varchar(3000) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lifemp
-- ----------------------------

-- ----------------------------
-- Table structure for `supplog`
-- ----------------------------
DROP TABLE IF EXISTS `supplog`;
CREATE TABLE `supplog` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `Ereigniss` varchar(50) NOT NULL,
  `UIDsupp` varchar(50) NOT NULL,
  `NameSupp` varchar(50) NOT NULL,
  `SteamNameSupp` varchar(50) DEFAULT NULL,
  `UIDspieler` varchar(50) NOT NULL,
  `NameSpieler` varchar(50) NOT NULL,
  `SteamNameSp` varchar(50) DEFAULT NULL,
  `Zusatz` varchar(50) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplog
-- ----------------------------

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `Von` varchar(50) NOT NULL,
  `Ereigniss` varchar(50) NOT NULL,
  `Details` varchar(300) DEFAULT NULL,
  `Output1` varchar(300) DEFAULT NULL,
  `Output2` varchar(300) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of syslog
-- ----------------------------

-- ----------------------------
-- Procedure structure for `supplog !!!Zeilenwert eintragen!!!`
-- ----------------------------
DROP PROCEDURE IF EXISTS `supplog !!!Zeilenwert eintragen!!!`;
DELIMITER ;;
CREATE DEFINER=`arma3`@`%` PROCEDURE `supplog !!!Zeilenwert eintragen!!!`()
BEGIN



	DELETE FROM `supplog` WHERE `id` <4902;



END
;;
DELIMITER ;
