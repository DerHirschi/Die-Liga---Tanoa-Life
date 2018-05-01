/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : support_log

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-01 06:36:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `banlist`
-- ----------------------------
DROP TABLE IF EXISTS `banlist`;
CREATE TABLE `banlist` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `SteamID` varchar(60) NOT NULL,
  `GUID` varchar(60) DEFAULT '0',
  `Name` varchar(60) NOT NULL DEFAULT '0',
  `SteamName` varchar(60) DEFAULT '0',
  `Dauer` int(16) DEFAULT '-1',
  `Bantyp` varchar(20) NOT NULL DEFAULT '0',
  `Grund` varchar(100) NOT NULL DEFAULT '0',
  `Notizen` varchar(200) DEFAULT NULL,
  `SupID` varchar(8) DEFAULT '0',
  `aufgehoben` int(8) DEFAULT '0',
  `Datum` tinyint(8) DEFAULT NULL,
  `Zeit` tinyint(8) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banlist
-- ----------------------------

-- ----------------------------
-- Table structure for `connectionlog`
-- ----------------------------
DROP TABLE IF EXISTS `connectionlog`;
CREATE TABLE `connectionlog` (
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
-- Records of connectionlog
-- ----------------------------

-- ----------------------------
-- Table structure for `geldlog`
-- ----------------------------
DROP TABLE IF EXISTS `geldlog`;
CREATE TABLE `geldlog` (
  `ID` int(64) NOT NULL AUTO_INCREMENT,
  `von` varchar(50) NOT NULL,
  `zu` varchar(50) NOT NULL,
  `betrag` int(100) NOT NULL,
  `curatm` int(100) NOT NULL,
  `curcash` int(100) NOT NULL,
  `type` text NOT NULL,
  `vonname` varchar(50) NOT NULL,
  `zuname` varchar(50) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of geldlog
-- ----------------------------

-- ----------------------------
-- Table structure for `gewinnlog`
-- ----------------------------
DROP TABLE IF EXISTS `gewinnlog`;
CREATE TABLE `gewinnlog` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `Ereigniss` varchar(50) NOT NULL,
  `UID` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `SteamName` varchar(50) NOT NULL,
  `Betrag` int(255) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gewinnlog
-- ----------------------------

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `ID` int(128) NOT NULL AUTO_INCREMENT,
  `Von` varchar(50) NOT NULL,
  `Ereigniss` varchar(50) NOT NULL,
  `Details` text,
  `Output1` text,
  `Output2` text,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of syslog
-- ----------------------------

-- ----------------------------
-- Procedure structure for `geldlog!!!Zeilenwert eintragen!!!`
-- ----------------------------
DROP PROCEDURE IF EXISTS `geldlog!!!Zeilenwert eintragen!!!`;
DELIMITER ;;
CREATE DEFINER=`ligaadmin`@`` PROCEDURE `geldlog!!!Zeilenwert eintragen!!!`()
BEGIN



	DELETE FROM `geldlog` WHERE `id` <238000;



END
;;
DELIMITER ;
