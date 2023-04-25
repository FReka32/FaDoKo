-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 29. 18:43
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
-- Adatbázis: `pizzavizsgaremek2`
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
  `Active` varchar(2) NOT NULL,
  `Salt` varchar(40) NOT NULL,
  `Hash` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `commodity`
--

CREATE TABLE `commodity` (
  `CoId` int(11) NOT NULL,
  `CoName` varchar(40) NOT NULL,
  `CoUnit` int(10) NOT NULL,
  `CoOther` varchar(40) NOT NULL,
  `CoPrice` int(10) NOT NULL,
  `CoActive` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `commodity`
--

INSERT INTO `commodity` (`CoId`, `CoName`, `CoUnit`, `CoOther`, `CoPrice`, `CoActive`) VALUES
(1, 'sonka', 1, '', 12, ''),
(2, 'sajt', 1, '', 34, ''),
(3, 'szalámi', 1, '', 56, ''),
(4, 'polip', 1, '', 67, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `customer`
--

CREATE TABLE `customer` (
  `CuId` int(11) NOT NULL,
  `CuName` varchar(20) NOT NULL,
  `CuFullName` varchar(40) NOT NULL,
  `CuAddress` varchar(40) NOT NULL,
  `CuPhone` varchar(20) NOT NULL,
  `CuEmail` varchar(40) NOT NULL,
  `Salt` varchar(40) NOT NULL,
  `Hash` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `employee`
--

CREATE TABLE `employee` (
  `EmId` int(11) NOT NULL,
  `EmName` varchar(20) NOT NULL,
  `EmFullName` varchar(40) NOT NULL,
  `EmAddress` varchar(40) NOT NULL,
  `EmPhone` varchar(20) NOT NULL,
  `EmEmail` varchar(40) NOT NULL,
  `Salt` varchar(40) NOT NULL,
  `Hash` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `invoices`
--

CREATE TABLE `invoices` (
  `InId` int(11) NOT NULL,
  `EmID` int(11) NOT NULL,
  `SumPrice` int(11) NOT NULL,
  `Time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `OrId` int(11) NOT NULL,
  `CuId` int(11) NOT NULL,
  `EmId` int(11) NOT NULL,
  `Delivery` varchar(10) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Courier` varchar(44) NOT NULL,
  `InvoiceId` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `LogDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `product`
--

CREATE TABLE `product` (
  `PrId` int(11) NOT NULL,
  `PrName` varchar(40) NOT NULL,
  `PrSize` varchar(10) NOT NULL,
  `PrOther` varchar(80) NOT NULL,
  `PrUrl` varchar(40) NOT NULL,
  `PrActive` varchar(2) NOT NULL,
  `PrPrice` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `product`
--

INSERT INTO `product` (`PrId`, `PrName`, `PrSize`, `PrOther`, `PrUrl`, `PrActive`, `PrPrice`) VALUES
(1, 'Sonkás pizza', '25', 'Sonka, sajt', '', '', 1500),
(2, 'szalámis pizza', '25', 'szalámi, sajt', '', '', 1600),
(3, 'tenger gyümölcsei', '', 'kagyló, rák, polip', '', '', 2000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `receiptconn`
--

CREATE TABLE `receiptconn` (
  `PrId` int(11) NOT NULL,
  `CoId` int(11) NOT NULL,
  `Quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `receiptconn`
--

INSERT INTO `receiptconn` (`PrId`, `CoId`, `Quantity`) VALUES
(1, 1, 2),
(1, 2, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tetelconn`
--

CREATE TABLE `tetelconn` (
  `OrId` int(11) NOT NULL,
  `PrId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

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
-- A tábla indexei `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CuId`);

--
-- A tábla indexei `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmId`);

--
-- A tábla indexei `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`InId`);

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrId`),
  ADD KEY `CuId` (`CuId`),
  ADD KEY `InvoiceId` (`InvoiceId`),
  ADD KEY `EmId` (`EmId`);

--
-- A tábla indexei `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PrId`);

--
-- A tábla indexei `receiptconn`
--
ALTER TABLE `receiptconn`
  ADD PRIMARY KEY (`PrId`,`CoId`),
  ADD KEY `CoId` (`CoId`);

--
-- A tábla indexei `tetelconn`
--
ALTER TABLE `tetelconn`
  ADD PRIMARY KEY (`OrId`),
  ADD KEY `PrId` (`PrId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `admin`
--
ALTER TABLE `admin`
  MODIFY `AdId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `commodity`
--
ALTER TABLE `commodity`
  MODIFY `CoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `invoices`
--
ALTER TABLE `invoices`
  MODIFY `InId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `OrId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tetelconn`
--
ALTER TABLE `tetelconn`
  MODIFY `OrId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CuId`) REFERENCES `customer` (`CuId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`InvoiceId`) REFERENCES `invoices` (`InId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`EmId`) REFERENCES `employee` (`EmId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `receiptconn`
--
ALTER TABLE `receiptconn`
  ADD CONSTRAINT `receiptconn_ibfk_1` FOREIGN KEY (`CoId`) REFERENCES `commodity` (`CoId`),
  ADD CONSTRAINT `receiptconn_ibfk_2` FOREIGN KEY (`PrId`) REFERENCES `product` (`PrId`);

--
-- Megkötések a táblához `tetelconn`
--
ALTER TABLE `tetelconn`
  ADD CONSTRAINT `tetelconn_ibfk_1` FOREIGN KEY (`OrId`) REFERENCES `orders` (`OrId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tetelconn_ibfk_2` FOREIGN KEY (`PrId`) REFERENCES `product` (`PrId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
