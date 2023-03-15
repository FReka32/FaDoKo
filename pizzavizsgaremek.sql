-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 02. 21:06
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `pizzavizsgaremek`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `commodities`
--

CREATE TABLE `commodities` (
  `ComId` int(6) NOT NULL,
  `CommName` varchar(60) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Unit` int(10) NOT NULL,
  `Other` varchar(500) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Price` int(5) NOT NULL,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `customers`
--

CREATE TABLE `customers` (
  `CuId` int(7) NOT NULL,
  `CustName` varchar(40) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Salt` varchar(64) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Hash` varchar(64) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Email` varchar(45) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Phone` int(40) NOT NULL,
  `Address` varchar(150) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `employees`
--

CREATE TABLE `employees` (
  `CuId` int(6) NOT NULL,
  `CustName` varchar(100) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `CustFullName` varchar(100) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Salt` int(64) NOT NULL,
  `Hash` int(64) NOT NULL,
  `Email` varchar(45) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Phone` int(40) NOT NULL,
  `Address` varchar(150) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `invoices`
--

CREATE TABLE `invoices` (
  `InvoiceId` int(50) NOT NULL,
  `UserId` int(6) NOT NULL,
  `ProductId` int(10) NOT NULL,
  `Delivery` varchar(100) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Address` varchar(100) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Phone` int(50) NOT NULL,
  `SumPrice` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `OrderId` int(6) NOT NULL,
  `CuId` int(6) NOT NULL,
  `PrId` int(6) NOT NULL,
  `Delivery` int(1) NOT NULL,
  `Address` varchar(500) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Phone` int(20) NOT NULL,
  `SumPrice` int(6) NOT NULL,
  `Courier` varchar(50) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `InvoiceId` int(50) NOT NULL,
  `Status` int(2) NOT NULL,
  `LogDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `PrId` int(6) NOT NULL,
  `ProductName` varchar(200) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Size` int(2) NOT NULL,
  `Other` varchar(500) CHARACTER SET latin2 COLLATE latin2_hungarian_ci NOT NULL,
  `Price` int(5) NOT NULL,
  `ComId` int(5) NOT NULL,
  `URL` varchar(1000) NOT NULL,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `UsId` int(11) NOT NULL,
  `UserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `FullName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Salt` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Permission` int(1) DEFAULT NULL,
  `Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `commodities`
--
ALTER TABLE `commodities`
  ADD PRIMARY KEY (`ComId`),
  ADD UNIQUE KEY `CommName` (`CommName`);

--
-- A tábla indexei `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CuId`),
  ADD UNIQUE KEY `CustName` (`CustName`,`Email`);

--
-- A tábla indexei `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`CuId`),
  ADD UNIQUE KEY `CustName` (`CustName`,`Email`);

--
-- A tábla indexei `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`InvoiceId`),
  ADD UNIQUE KEY `Users UserId` (`UserId`),
  ADD UNIQUE KEY `Products PrId` (`ProductId`),
  ADD UNIQUE KEY `Orders Delivery Address` (`Delivery`);

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderId`),
  ADD UNIQUE KEY `Employees CuId` (`CuId`),
  ADD UNIQUE KEY `Products Id` (`PrId`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`PrId`),
  ADD UNIQUE KEY `ProductName` (`ProductName`,`ComId`),
  ADD KEY `ComId` (`ComId`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UsId`),
  ADD UNIQUE KEY `UserName` (`UserName`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `commodities`
--
ALTER TABLE `commodities`
  MODIFY `ComId` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `customers`
--
ALTER TABLE `customers`
  MODIFY `CuId` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `employees`
--
ALTER TABLE `employees`
  MODIFY `CuId` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `invoices`
--
ALTER TABLE `invoices`
  MODIFY `InvoiceId` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderId` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `PrId` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `UsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `commodities`
--
ALTER TABLE `commodities`
  ADD CONSTRAINT `commodities_ibfk_1` FOREIGN KEY (`CommName`) REFERENCES `products` (`ProductName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`CuId`) REFERENCES `users` (`UsId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`CustName`) REFERENCES `customers` (`CustName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`InvoiceId`) REFERENCES `orders` (`OrderId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`PrId`) REFERENCES `products` (`PrId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`ComId`) REFERENCES `employees` (`CuId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
