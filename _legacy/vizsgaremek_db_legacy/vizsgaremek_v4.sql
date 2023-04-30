-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Ápr 20. 17:47
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vizsgaremek_v4`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `admin`
--

CREATE TABLE `admin` (
  `AdId` int(11) NOT NULL,
  `AdName` varchar(40) NOT NULL,
  `AdPermission` varchar(10) NOT NULL,
  `AdEmail` varchar(40) NOT NULL,
  `AdPhone` varchar(20) NOT NULL,
  `Active` int(2) NOT NULL,
  `Salt` varchar(64) NOT NULL,
  `Hash` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `admin`
--

INSERT INTO `admin` (`AdId`, `AdName`, `AdPermission`, `AdEmail`, `AdPhone`, `Active`, `Salt`, `Hash`) VALUES
(1, 'Fazekas Réka', '9', 'f@f.hu', '+3636', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(2, 'a', '9', 'p@p.hu', '+36', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(3, 'Kolyankovszky Gusztáv', '9', 'kg@kg.hu', '+3670', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(4, 'Dömötör Gyula', '9', 'dgy@dgy.hu', '+3670', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(5, 'Kukor Ica', '1', 'kukorica@freemail.hu', '+3670', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(6, 'Piz Zalán', '2', 'pizzalan@gmail.com', '+3630', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(7, 'Olivabogy Olivér', '3', 'olivabogyo@gmail.com', '*3670', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(8, 'Sonk Andrea', '4', 'sonka@citromail.hu', '+3630', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(9, 'Virs Lee', '5', 'virsli@gmail.com', '+3620', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(10, 'Füst Lee', '6', 'fustli@citromail.hu', '+3630', 0, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(11, 'Kif Lee', '7', 'kifli@gmail.com', '+3670', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d'),
(12, 'Bruce Lee', '8', 'brucelee@citromail.hu', '+3630', 1, 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `commodity`
--

CREATE TABLE `commodity` (
  `CoId` int(11) NOT NULL,
  `CoName` varchar(40) NOT NULL,
  `CoUnit` int(10) NOT NULL,
  `CoCat` int(3) NOT NULL,
  `CoPrice` int(10) NOT NULL,
  `CoActive` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `commodity`
--

INSERT INTO `commodity` (`CoId`, `CoName`, `CoUnit`, `CoCat`, `CoPrice`, `CoActive`) VALUES
(1, 'sonka', 1, 2, 12, 0),
(2, 'sajt', 1, 3, 34, 0),
(3, 'szalámi', 1, 2, 56, 0),
(4, 'polip', 1, 2, 67, 1),
(5, 'hagyma', 1, 2, 50, 0),
(6, 'bab', 1, 2, 55, 0),
(7, 'pepperoni paprika', 1, 2, 30, 0),
(8, 'oregánó', 1, 2, 15, 0),
(9, 'bazsalikom', 1, 2, 15, 0),
(10, 'lilahagyma', 1, 2, 10, 0),
(11, 'bacon', 1, 2, 55, 0),
(12, 'mozzarella', 1, 2, 55, 0),
(13, 'kukorica', 1, 2, 20, 0),
(14, 'póréhagyma', 1, 2, 10, 0),
(15, 'kukorica', 1, 2, 20, 0),
(16, 'póréhagyma', 1, 2, 10, 0),
(17, 'kolbász', 1, 2, 35, 0),
(18, 'csirkemell', 1, 2, 45, 0),
(19, 'barbecue-szósz', 1, 2, 15, 0),
(20, 'bolognai ragu', 1, 2, 35, 0),
(21, 'kaliforniai paprika', 1, 2, 20, 0),
(22, 'zöldpaprika', 1, 2, 20, 0),
(23, 'jalapeno', 1, 2, 15, 0),
(24, 'kagyló', 1, 2, 20, 0),
(25, 'rák', 1, 2, 20, 0),
(26, 'gomba', 1, 2, 20, 0),
(27, 'füstölt tarja', 1, 2, 45, 0),
(28, 'feta sajt', 1, 2, 20, 0),
(29, 'cheddar sajt', 1, 2, 35, 0),
(30, 'paradicsom', 1, 2, 20, 0),
(31, 'uborka', 1, 2, 20, 0),
(32, 'zöld olivabogyó', 1, 2, 15, 0),
(33, 'fekete olivabogyó', 1, 2, 20, 0),
(34, 'tonhal', 1, 2, 35, 0),
(35, 'parmezán sajt', 1, 2, 45, 0),
(36, 'márványsajt', 1, 2, 30, 0),
(37, 'sajtkrém', 1, 2, 20, 0),
(38, 'brokkoli', 1, 2, 15, 0),
(39, 'tükörtojás', 1, 2, 35, 0),
(40, 'füstölt csülök', 1, 2, 45, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `OrId` int(11) NOT NULL,
  `OrData` varchar(500) NOT NULL,
  `AdId` int(11) DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Status` int(11) NOT NULL,
  `LogDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `orders`
--

INSERT INTO `orders` (`OrId`, `OrData`, `AdId`, `Name`, `Address`, `Phone`, `Email`, `Status`, `LogDate`) VALUES
(1, '{   \"prId\": 0,   \"prName\": \"string\",   \"prSize\": \"string\",   \"prOther\": \"string\",   \"prUrl\": \"string\",   \"prActive\": 0,   \"prPrice\": 0, }', NULL, 'Rend Elek', '8500 Balatonrendek, József Attila utca 9865.', '+36705555444', 'rendelek@gmail.com', 0, '2023-04-19 01:32:26'),
(2, '', NULL, 'Berend Elek', '8565, Balatonrendes, Rendes utca 5647.', '+36302222888', 'berendelek@freemail.hu', 0, '2023-04-19 01:34:28'),
(3, '', NULL, 'Megrend Elek', '9855, Herend, Megren-dűlő 6587.', '+36206666444', 'megrendelek@citromail.hu', 0, '2023-04-19 01:37:20'),
(4, '', NULL, 'Kirend Elek', '7845, Ököritófülpös, Rendelő köz 456.', '+36701111222', 'kirendelek@gmail.com', 0, '2023-04-19 01:40:14'),
(5, '', NULL, 'Elrend Elek', '6523, Elrendelőháza, Petőfi utca 4562.', '+36209999444', 'elrendelek@citromail.hu', 0, '2023-04-19 01:48:38');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `product`
--

CREATE TABLE `product` (
  `PrId` int(11) NOT NULL,
  `PrName` varchar(40) NOT NULL,
  `PrSize` varchar(500) NOT NULL,
  `PrOther` varchar(80) NOT NULL,
  `CoIds` varchar(100) DEFAULT NULL,
  `PrUrl` varchar(40) NOT NULL,
  `PrActive` int(2) NOT NULL,
  `PrPrice` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `product`
--

INSERT INTO `product` (`PrId`, `PrName`, `PrSize`, `PrOther`, `CoIds`, `PrUrl`, `PrActive`, `PrPrice`) VALUES
(1, 'Sonkás pizza', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Sonka, sajt', '{\"1\",\'2\'}', '', 0, 1500),
(2, 'Szalámis pizza', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'szalámi, sajt', NULL, '', 0, 1600),
(3, 'Tenger gyümölcsei', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'kagyló, rák, polip', NULL, '', 0, 2000),
(4, 'Margherita', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt', NULL, '', 0, 2040),
(5, 'Prosciutto', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, sonka', NULL, '', 0, 2400),
(6, 'Funghi', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, gomba', NULL, '', 0, 2400),
(7, 'Tonno', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, tonhal, lilahagyma, olivabogyó', NULL, '', 0, 2540),
(8, 'Quattro Formaggi', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, négyféle sajt: trappista, füstölt sajt, mozzarella, camembert', NULL, '', 0, 2540),
(9, 'Quattro Stangioni', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, bolognai ragu, gomba, sonka, szalámi', NULL, '', 0, 2540),
(10, 'Hawaii', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, sonka, ananász\r\n', NULL, '', 0, 2540),
(11, 'Giulia', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Tejföl, sajt, tarja, szalámi, hagyma, bacon', NULL, '', 0, 2540),
(12, 'Vegetariana', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, brokkoli, répa, gomba, paradicsom, kukorica', NULL, '', 0, 2540),
(13, 'Grandiosa', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, szalámi, sonka, füstölt tarja, lilahagyma, paradicsom, ba', NULL, '', 0, 2640),
(14, 'Bolognese', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Bolognai ragu, sajt', NULL, '', 0, 2540),
(15, 'Greek', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Kapros tejföl, sajt, gyros hús, olívabogyó, paradicsom, uborka', NULL, '', 0, 2540),
(16, 'Ungherese', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, szalámi, füstölt tarja, paprika, paradicsom, fokhagyma, h', NULL, '', 0, 2540),
(17, 'Mais', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, sonka, szalámi, kukorica', NULL, '', 0, 2540),
(18, 'Carbonara', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Fokhagymás-tejszínes alap,sajt,füstölt sajt, bacon', NULL, '', 0, 2540),
(19, 'Isolana', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Tejföl, füstölt sajt, sajt, sonka, füstölt tarja, ruccola', NULL, '', 0, 2540),
(20, 'Mexicana', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Csípős bolognai ragu, sajt, bab, kukorica\r\n', NULL, '', 0, 2540),
(21, 'Diablo', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, szalámi, füst. tarja, hagyma, juhtúró, bacon, pepperoni', NULL, '', 0, 2640),
(22, 'Barbecue', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Barbecue szósz, sajt csirkemell, füstölt tarja, lilahagyma, bacon', NULL, '', 0, 2640),
(23, 'Gambaretti', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, fokhagyma, garnélarák, ruccola, paradicsom, citrom', NULL, '', 0, 2640),
(24, 'Maffia', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Tejföl, füstölt sajt, sonka, csirkemell', NULL, '', 0, 2540),
(25, 'Gianni', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Csípős tejföl, füstölt tarja, füstölt sajt, csípős pepperoni, lilahagyma', NULL, '', 0, 2540),
(26, 'Roberto', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Kapros tejföl, fokhagyma, sajt, csirkemell, kukorica', NULL, '', 0, 2540),
(27, 'Piedone', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, bacon kocka hagyma, bab, kolbász', NULL, '', 0, 2540),
(28, 'Perfecto', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, négyféle sajt, sonka,szalámi,hagyma, paradicsom karika, uborka', NULL, '', 0, 2640),
(29, 'Milano', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, sonka, gomba, lilahagyma, bacon', NULL, '', 0, 2640),
(30, 'Zingaro', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'csípős paradicsomszósz, fokhagyma, bolognai ragu, sajt, szalámi, lilahagyma, bab', NULL, '', 0, 2640),
(31, 'Brindza', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'tejföl, juhtúró, kapor, sajt, csirkemell, fokhagyma', NULL, '', 0, 2640),
(32, 'Pippo', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Mustáros-tejfölös alap, sajt, füstölt tarja, lilahagyma, csemege uborka', NULL, '', 0, 2640),
(33, 'Angelo', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, ananász, csirkemell, kukorica', NULL, '', 0, 2640),
(34, 'Toscana', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Tejföl, feta, sajt, csirkemell, gomba\r\n', NULL, '', 0, 2640),
(35, 'Songoku', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, sonka, gomba, kukorica', NULL, '', 0, 2640),
(36, 'Ínyenc', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, érlelt Prosciutto sonka, pepperoni, kakukkfüves sajt, füstölt s', NULL, '', 0, 2740),
(37, 'Corleone', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sajt, ropogós csülök, bab, füstölt szalonna, hagyma karika', NULL, '', 0, 2740),
(38, 'Favorito', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Fokhagymás–tejszínes alap, sajt, tarja, lilahagyma, zempléni sajt, füstölt sajt,', NULL, '', 0, 2740),
(39, 'Sajtimádó', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, sonka, kakukkfüves sajt, zempléni füstölt sajt, zempléni sajt, ', NULL, '', 0, 2740),
(40, 'Frutti di Mare', '{\"0\":\"25\",\"1\":\"35\",\"2\":\"45\"}', 'Paradicsomszósz, fokhagyma, sajt, tenger gyümölcsei, citrom', NULL, '', 0, 2740);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdId`);

--
-- A tábla indexei `commodity`
--
ALTER TABLE `commodity`
  ADD PRIMARY KEY (`CoId`);

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrId`),
  ADD KEY `CuId` (`AdId`);

--
-- A tábla indexei `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PrId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `admin`
--
ALTER TABLE `admin`
  MODIFY `AdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `commodity`
--
ALTER TABLE `commodity`
  MODIFY `CoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `OrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `product`
--
ALTER TABLE `product`
  MODIFY `PrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`AdId`) REFERENCES `admin` (`AdId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
