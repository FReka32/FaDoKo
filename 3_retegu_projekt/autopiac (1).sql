-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Jan 31. 16:22
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
-- Adatbázis: `autopiac`
--
CREATE DATABASE IF NOT EXISTS `autopiac` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `autopiac`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `ID` int(7) NOT NULL,
  `FelhasznaloNeve` varchar(30) NOT NULL,
  `TeljesNev` varchar(40) NOT NULL,
  `Salt` varchar(64) NOT NULL,
  `Hash` varchar(64) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Jogosultsag` int(1) NOT NULL,
  `Aktiv` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`ID`, `FelhasznaloNeve`, `TeljesNev`, `Salt`, `Hash`, `Email`, `Jogosultsag`, `Aktiv`) VALUES
(1, 'a', 'Adminisztrátor', 'hyD7KTz06AdOpATFk7KWycl2NRYH0AQuTmoEfFdcsyiZki1xysuMLmPoBBH52rR6', '7fdfcacc1bbc99a48778a18770ae72321a12e54417a05f1f8296368f4265e35d', 'kerenyir@kkszki.hu', 9, 1),
(2, 'b', 'bb', 'xlEcgNVuNLNTD3Vcfz4SJ8Foa2sM5dqpgDwTsUx63tRo6eirwPIF3AbygZCneIzu', '835a33b68c19e7294f234d9e2742dc21adb3874791c3dfdaa18a64ac5a8ef5e1', 'b@b.hu', 9, 0),
(3, 'Józsi', 'József', '3yd1AL5x4ga6ciUl7mTCm3dPw5KSHOy8SPCKSJqg07tbp6o9BpiLXFJAUOFEAmqq', 'f8aeb4965c964709347032db6267b80e093367ef8bafc7a41aafebaed589ec21', 'asdfasdff', 1, 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `FelhasznaloNeve` (`FelhasznaloNeve`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
