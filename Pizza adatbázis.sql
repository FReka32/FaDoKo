-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- PHP Verzió: 5.2.6



--   * * * * * * * * * * * * * * * * * * * * * * *
--   *                                           *
--   *   A fájl karakterkészlete: latin2  !!!    *
--   *                                           *
--   *   EZT MUSZÁJ MANUÁLISAN BEÁLLÍTANI !!!    *
--   *                                           *
--   * * * * * * * * * * * * * * * * * * * * * * *



SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Adatbázis: `pizza`
-- 

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `futar`
-- 

CREATE TABLE `futar` (
  `fazon` int(3) NOT NULL default '0',
  `fnev` varchar(25) collate latin2_hungarian_ci NOT NULL default '',
  `ftel` varchar(12) collate latin2_hungarian_ci NOT NULL default '',
  PRIMARY KEY  (`fazon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- 
-- Tábla adatok: `futar`
-- 

INSERT INTO `futar` VALUES (1, 'Hurrikán', '123456');
INSERT INTO `futar` VALUES (2, 'Gyalogkakukk', '666666');
INSERT INTO `futar` VALUES (3, 'Gömbvillám', '888888');
INSERT INTO `futar` VALUES (4, 'Szélvész', '258369');
INSERT INTO `futar` VALUES (5, 'Imperial', '987654');

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `pizza`
-- 

CREATE TABLE `pizza` (
  `pazon` int(3) NOT NULL default '0',
  `pnev` varchar(15) collate latin2_hungarian_ci NOT NULL default '',
  `par` int(4) NOT NULL default '0',
  PRIMARY KEY  (`pazon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- 
-- Tábla adatok: `pizza`
-- 

INSERT INTO `pizza` VALUES (1, 'Capricciosa', 1050);
INSERT INTO `pizza` VALUES (2, 'Frutti di Mare', 1350);
INSERT INTO `pizza` VALUES (3, 'Hawaii', 850);
INSERT INTO `pizza` VALUES (4, 'Vesuvio', 900);
INSERT INTO `pizza` VALUES (5, 'Sorrento', 1050);

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `rendeles`
-- 

CREATE TABLE `rendeles` (
  `razon` int(8) NOT NULL default '0',
  `vazon` int(6) NOT NULL default '0',
  `fazon` int(3) NOT NULL default '0',
  `idopont` datetime NOT NULL,
  PRIMARY KEY  (`razon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- 
-- Tábla adatok: `rendeles`
-- 

INSERT INTO `rendeles` VALUES (1, 4, 2, '2016-10-01 12:04:11');
INSERT INTO `rendeles` VALUES (2, 7, 2, '2016-10-01 13:18:44');
INSERT INTO `rendeles` VALUES (3, 1, 1, '2016-10-02 10:11:41');
INSERT INTO `rendeles` VALUES (4, 5, 2, '2016-10-02 10:24:59');
INSERT INTO `rendeles` VALUES (5, 2, 3, '2016-10-02 13:19:06');
INSERT INTO `rendeles` VALUES (6, 4, 2, '2016-10-03 13:14:38');
INSERT INTO `rendeles` VALUES (7, 6, 2, '2016-10-04 11:10:35');
INSERT INTO `rendeles` VALUES (8, 7, 4, '2016-10-04 15:34:58');
INSERT INTO `rendeles` VALUES (9, 1, 5, '2016-10-04 17:07:59');
INSERT INTO `rendeles` VALUES (10, 3, 5, '2016-10-04 20:21:51');
INSERT INTO `rendeles` VALUES (11, 2, 1, '2016-10-05 18:52:53');
INSERT INTO `rendeles` VALUES (12, 5, 2, '2016-10-05 19:59:02');
INSERT INTO `rendeles` VALUES (13, 6, 2, '2016-10-06 14:55:03');
INSERT INTO `rendeles` VALUES (14, 4, 3, '2016-10-06 15:01:14');
INSERT INTO `rendeles` VALUES (15, 1, 4, '2016-10-06 18:48:46');
INSERT INTO `rendeles` VALUES (16, 2, 5, '2016-10-06 19:11:03');
INSERT INTO `rendeles` VALUES (17, 7, 2, '2016-10-06 19:56:28');
INSERT INTO `rendeles` VALUES (18, 3, 2, '2016-10-07 12:45:30');
INSERT INTO `rendeles` VALUES (19, 4, 5, '2016-10-07 13:00:56');
INSERT INTO `rendeles` VALUES (20, 1, 1, '2016-10-07 15:42:50');
INSERT INTO `rendeles` VALUES (21, 5, 3, '2016-10-08 18:56:00');

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `tetel`
-- 

CREATE TABLE `tetel` (
  `razon` int(8) NOT NULL default '0',
  `pazon` int(3) NOT NULL default '0',
  `db` int(3) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- 
-- Tábla adatok: `tetel`
-- 

INSERT INTO `tetel` VALUES (1, 1, 2);
INSERT INTO `tetel` VALUES (1, 4, 3);
INSERT INTO `tetel` VALUES (2, 2, 1);
INSERT INTO `tetel` VALUES (3, 1, 2);
INSERT INTO `tetel` VALUES (4, 1, 1);
INSERT INTO `tetel` VALUES (4, 4, 1);
INSERT INTO `tetel` VALUES (5, 2, 4);
INSERT INTO `tetel` VALUES (6, 1, 1);
INSERT INTO `tetel` VALUES (6, 4, 1);
INSERT INTO `tetel` VALUES (6, 5, 1);
INSERT INTO `tetel` VALUES (7, 5, 5);
INSERT INTO `tetel` VALUES (8, 4, 3);
INSERT INTO `tetel` VALUES (9, 2, 1);
INSERT INTO `tetel` VALUES (10, 1, 1);
INSERT INTO `tetel` VALUES (10, 4, 1);
INSERT INTO `tetel` VALUES (11, 1, 1);
INSERT INTO `tetel` VALUES (12, 2, 2);
INSERT INTO `tetel` VALUES (12, 4, 2);
INSERT INTO `tetel` VALUES (13, 4, 1);
INSERT INTO `tetel` VALUES (13, 5, 1);
INSERT INTO `tetel` VALUES (13, 2, 1);
INSERT INTO `tetel` VALUES (14, 2, 2);
INSERT INTO `tetel` VALUES (15, 1, 1);
INSERT INTO `tetel` VALUES (16, 2, 1);
INSERT INTO `tetel` VALUES (16, 4, 1);
INSERT INTO `tetel` VALUES (16, 5, 1);
INSERT INTO `tetel` VALUES (17, 1, 2);
INSERT INTO `tetel` VALUES (17, 2, 3);
INSERT INTO `tetel` VALUES (18, 1, 4);
INSERT INTO `tetel` VALUES (18, 5, 1);
INSERT INTO `tetel` VALUES (19, 1, 1);
INSERT INTO `tetel` VALUES (19, 2, 1);
INSERT INTO `tetel` VALUES (19, 4, 1);
INSERT INTO `tetel` VALUES (19, 5, 1);
INSERT INTO `tetel` VALUES (20, 5, 3);
INSERT INTO `tetel` VALUES (21, 2, 2);
INSERT INTO `tetel` VALUES (21, 4, 1);

-- --------------------------------------------------------

-- 
-- Tábla szerkezet: `vevo`
-- 

CREATE TABLE `vevo` (
  `vazon` int(6) NOT NULL default '0',
  `vnev` varchar(30) collate latin2_hungarian_ci NOT NULL default '',
  `vcim` varchar(30) collate latin2_hungarian_ci NOT NULL default '',
  PRIMARY KEY  (`vazon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- 
-- Tábla adatok: `vevo`
-- 

INSERT INTO `vevo` VALUES (1, 'Hapci', '');
INSERT INTO `vevo` VALUES (2, 'Vidor', '');
INSERT INTO `vevo` VALUES (3, 'Tudor', '');
INSERT INTO `vevo` VALUES (4, 'Kuka', '');
INSERT INTO `vevo` VALUES (5, 'Szende', '');
INSERT INTO `vevo` VALUES (6, 'Szundi', '');
INSERT INTO `vevo` VALUES (7, 'Morgó', '');