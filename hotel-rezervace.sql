-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pát 28. lis 2025, 11:23
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `hotel-rezervace`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `registered_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email`, `phone`, `birth_date`, `registered_at`) VALUES
(1, 'Nela', 'Havlíčková', 'vcerna@example.com', '00420 603 180 707', '1964-03-08', '2024-04-15 12:05:52'),
(2, 'Tadeáš', 'Liška', 'mahulenakucerova@example.org', '00420 705 411 403', '1945-05-31', '2023-06-18 06:33:17'),
(3, 'Alexandra', 'Pospíšilová', 'moravcovakristina@example.com', '+420 722 446 454', '1995-05-23', '2025-04-21 18:35:29'),
(4, 'Dorota', 'Marek', 'estastna@example.net', '+420 607 363 812', '1995-03-01', '2024-12-30 22:08:43'),
(5, 'Ctirad', 'Moravec', 'bilekmarcel@example.org', '+420 771 458 079', '1976-06-02', '2025-02-23 21:53:55'),
(6, 'Matyáš', 'Žáková', 'bblazkova@example.com', '+420 705 928 197', '1992-02-23', '2024-02-08 17:30:53'),
(7, 'Andrea', 'Marková', 'denisajelinkova@example.org', '+420 608 415 143', '1993-11-23', '2025-02-08 16:16:28'),
(8, 'Dita', 'Bláhová', 'adela28@example.net', '+420 739 204 433', '1968-12-05', '2022-12-18 03:41:26'),
(9, 'Radim', 'Bártová', 'mariabenesova@example.org', '+420 603 732 850', '1954-03-04', '2025-04-19 13:33:16'),
(10, 'Kateřina', 'Ševčík', 'kovarlumir@example.net', '00420 602 825 456', '1979-03-13', '2024-07-13 08:55:53'),
(11, 'Filip', 'Štěpánková', 'andelahorakova@example.net', '+420 703 762 934', '2006-10-30', '2023-04-01 18:55:59'),
(12, 'Viktorie', 'Fiala', 'jarmilahorvathova@example.com', '00420 601 068 189', '1962-02-01', '2023-11-11 19:33:56'),
(13, 'Matěj', 'Švec', 'krizovamartina@example.com', '00420 779 903 828', '1956-02-03', '2023-01-13 10:24:18'),
(14, 'Vít', 'Dvořáková', 'dostalovasabina@example.net', '00420 702 358 747', '1992-08-04', '2023-10-08 02:46:46'),
(15, 'Štefan', 'Hrubý', 'horakovazdenka@example.net', '00420 705 738 133', '1967-09-03', '2023-05-09 13:59:08'),
(16, 'Albert', 'Brož', 'tesarludvik@example.com', '00420 607 523 083', '1983-07-10', '2024-05-30 02:04:20'),
(17, 'Bohumila', 'Valenta', 'fiserovalenka@example.net', '00420 799 968 718', '1977-03-25', '2024-04-10 16:54:07'),
(18, 'Jindřiška', 'Tůma', 'jandovajulie@example.net', '+420 607 802 589', '1971-10-03', '2024-02-08 03:13:03'),
(19, 'Jan', 'Bárta', 'sedlakovazofie@example.org', '+420 603 862 702', '1984-12-13', '2024-02-05 15:57:07'),
(20, 'Alice', 'Matoušková', 'nelakrausova@example.net', '00420 608 704 363', '1998-06-12', '2024-05-21 23:44:23');

-- --------------------------------------------------------

--
-- Struktura tabulky `paymentmethod`
--

CREATE TABLE `paymentmethod` (
  `payment_method_id` int(11) NOT NULL,
  `name` enum('card','cash','transfer') NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `paymentmethod`
--

INSERT INTO `paymentmethod` (`payment_method_id`, `name`, `description`) VALUES
(1, 'card', 'Platba kartou'),
(2, 'cash', 'Platba v hotovosti'),
(3, 'transfer', 'Bankovní převod');

-- --------------------------------------------------------

--
-- Struktura tabulky `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `reservation_status` enum('pending','confirmed','cancelled') NOT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `customer_id`, `room_id`, `check_in`, `check_out`, `total_price`, `reservation_status`, `payment_method_id`, `created_at`) VALUES
(1, 8, 3, '2026-05-18', '2024-12-16', 0.00, 'confirmed', 2, '2025-08-11 19:50:11'),
(2, 9, 15, '2026-01-21', '2024-12-26', 0.00, 'cancelled', 3, '2025-03-28 15:57:31'),
(3, 18, 4, '2025-02-27', '2025-01-19', 0.00, 'cancelled', 2, '2025-04-20 12:27:12'),
(4, 2, 4, '2026-11-19', '2024-12-25', 0.00, 'pending', 2, '2025-05-27 19:08:21'),
(5, 13, 5, '2025-11-24', '2025-06-23', 0.00, 'pending', 1, '2025-09-03 01:34:17'),
(6, 19, 15, '2026-01-05', '2026-03-04', 0.00, 'cancelled', 2, '2025-02-12 02:28:30'),
(7, 7, 11, '2026-11-07', '2025-03-23', 0.00, 'confirmed', 2, '2024-12-29 03:09:01'),
(8, 15, 3, '2026-05-26', '2025-06-11', 0.00, 'confirmed', 1, '2025-07-31 09:08:57'),
(9, 8, 12, '2025-10-15', '2026-03-04', 0.00, 'cancelled', 3, '2024-12-01 05:18:20'),
(10, 9, 12, '2026-08-26', '2026-06-24', 0.00, 'cancelled', 2, '2025-01-02 04:29:24'),
(11, 19, 7, '2025-06-01', '2024-12-24', 0.00, 'confirmed', 1, '2025-10-30 23:54:09'),
(12, 5, 9, '2026-06-26', '2025-05-22', 0.00, 'confirmed', 1, '2025-07-17 02:47:57'),
(13, 2, 14, '2025-03-29', '2025-09-18', 0.00, 'pending', 1, '2025-01-20 10:51:10'),
(14, 6, 13, '2025-12-27', '2025-07-26', 0.00, 'cancelled', 2, '2025-08-13 11:24:05'),
(15, 20, 2, '2025-08-24', '2025-05-03', 0.00, 'confirmed', 2, '2025-05-10 08:19:08'),
(16, 20, 8, '2026-04-24', '2025-07-23', 0.00, 'cancelled', 2, '2025-04-25 23:22:24'),
(17, 18, 14, '2025-12-10', '2025-01-29', 0.00, 'pending', 3, '2025-05-01 16:19:27'),
(18, 4, 11, '2025-01-21', '2026-03-01', 0.00, 'cancelled', 2, '2025-08-06 22:30:03'),
(19, 11, 2, '2026-09-02', '2025-12-05', 0.00, 'confirmed', 2, '2025-08-24 18:22:52'),
(20, 6, 8, '2026-03-27', '2025-04-28', 0.00, 'pending', 3, '2025-06-10 07:58:04'),
(21, 9, 9, '2025-06-11', '2024-11-29', 0.00, 'pending', 3, '2024-12-15 19:52:29'),
(22, 4, 14, '2025-11-01', '2025-06-23', 0.00, 'cancelled', 2, '2025-01-09 04:45:18'),
(23, 17, 10, '2026-10-01', '2025-08-21', 0.00, 'pending', 1, '2025-02-26 17:07:16'),
(24, 12, 13, '2025-07-26', '2026-06-20', 0.00, 'pending', 3, '2025-07-28 19:51:50'),
(25, 17, 15, '2026-09-10', '2026-04-20', 0.00, 'pending', 3, '2025-02-22 18:19:52'),
(26, 11, 8, '2026-06-07', '2026-02-26', 0.00, 'pending', 1, '2025-05-30 03:10:04'),
(27, 12, 15, '2025-01-05', '2026-03-15', 0.00, 'confirmed', 1, '2025-01-20 15:07:09'),
(28, 2, 4, '2025-01-07', '2025-11-23', 0.00, 'cancelled', 1, '2025-09-07 06:51:00'),
(29, 3, 12, '2025-02-14', '2025-07-23', 0.00, 'confirmed', 1, '2025-09-24 00:44:26'),
(30, 18, 13, '2024-12-23', '2026-10-27', 0.00, 'pending', 1, '2025-10-21 15:03:03');

-- --------------------------------------------------------

--
-- Struktura tabulky `reservation_service`
--

CREATE TABLE `reservation_service` (
  `reservation_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `reservation_service`
--

INSERT INTO `reservation_service` (`reservation_id`, `service_id`, `quantity`) VALUES
(2, 7, 3),
(2, 9, 1),
(2, 10, 4),
(3, 1, 2),
(3, 3, 1),
(3, 4, 2),
(3, 6, 1),
(3, 7, 5),
(4, 2, 4),
(4, 4, 2),
(5, 4, 3),
(5, 5, 4),
(5, 10, 5),
(6, 5, 5),
(6, 7, 1),
(7, 1, 5),
(7, 4, 5),
(7, 7, 1),
(7, 9, 2),
(8, 5, 4),
(8, 10, 5),
(10, 7, 5),
(11, 2, 1),
(11, 5, 2),
(12, 7, 4),
(13, 2, 5),
(13, 5, 4),
(14, 8, 4),
(15, 1, 1),
(15, 3, 4),
(15, 4, 1),
(15, 9, 1),
(15, 10, 5),
(16, 4, 4),
(17, 4, 3),
(17, 9, 2),
(18, 4, 5),
(19, 4, 1),
(19, 9, 2),
(20, 2, 2),
(22, 6, 4),
(22, 8, 5),
(23, 5, 4),
(24, 6, 1),
(24, 9, 1),
(26, 2, 2),
(26, 7, 2),
(28, 6, 1),
(28, 10, 4),
(29, 9, 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `room_type` enum('single','double','suite') NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `room`
--

INSERT INTO `room` (`room_id`, `room_number`, `capacity`, `price_per_night`, `room_type`, `description`) VALUES
(1, 427, 1, 612.55, 'double', 'Skromný strčit kritizovat obecný.'),
(2, 225, 2, 1127.92, 'single', 'Zoo vzhledem částka zabezpečení.'),
(3, 446, 1, 3157.22, 'single', 'Pravidelný tah vyprávět povaha vézt.'),
(4, 115, 1, 1483.87, 'suite', 'Víceméně hodnota elektrický jádro opozice dokončení.'),
(5, 408, 1, 3025.60, 'suite', 'Mez lžíce typ vzniknout rychlost nevinný chlad.'),
(6, 432, 4, 1491.98, 'suite', 'Likvidace síla stávající nervový odchod.'),
(7, 242, 1, 3914.63, 'single', 'Manželka kritický již měsíčně Brusel šedý respekt Austrálie.'),
(8, 457, 4, 2031.13, 'single', 'Nejistota páska prodejce princ spojenec cela zranit.'),
(9, 210, 3, 959.95, 'double', 'Dodávat EU zajímavost hájit seznámit.'),
(10, 149, 3, 4313.72, 'suite', 'Sobotka spolupráce společenský jenomže mnohokrát pokud vzhlédnout.'),
(11, 235, 1, 3783.79, 'suite', 'Velikost stálý cyklista ruka.'),
(12, 163, 4, 854.60, 'double', 'Mnich směs chování respektovat.'),
(13, 421, 3, 3098.08, 'suite', 'Video strážník ukázat příležitost příbuzný větrný nejistota.'),
(14, 135, 1, 3475.68, 'double', 'Obyvatel daň klepnout těhotenství trvale keř jeden.'),
(15, 140, 2, 4399.18, 'double', 'Obyvatelstvo volant Vídeň.');

-- --------------------------------------------------------

--
-- Struktura tabulky `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `service`
--

INSERT INTO `service` (`service_id`, `name`, `price`, `description`) VALUES
(1, 'Přispět', 628.15, 'Pěkně vyhnat četný filmový.'),
(2, 'Krvavý', 1307.80, 'Ostrý vězení slunce Slavia házet křižovatka.'),
(3, 'Položit', 793.18, 'Mozkový emoce stadión světlo týž.'),
(4, 'Nakonec', 803.34, 'Zábava čtyři Labe obtěžovat večer předpokládat zarazit.'),
(5, 'Vánoční', 498.06, 'Průvodce vloni poslanec riziko.'),
(6, 'Sehnat', 607.26, 'Zbraň tudíž zvyšovat hledět.'),
(7, 'Zklamání', 1879.64, 'Smrtelný falešný nebo prominout opak vystoupení.'),
(8, 'Zadržet', 1331.27, 'Skála hovor senátor Brod lékař.'),
(9, 'Popadnout', 1257.35, 'Teda pes krajina zdravý.'),
(10, 'Vydělat', 425.16, 'Trik česnek dovnitř hodlat emise.');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `Customer_index_0` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `Customer_index_1` (`phone`);

--
-- Indexy pro tabulku `paymentmethod`
--
ALTER TABLE `paymentmethod`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexy pro tabulku `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `Reservation_index_2` (`check_in`),
  ADD KEY `Reservation_index_3` (`check_out`),
  ADD KEY `Reservation_index_4` (`check_in`,`check_out`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `payment_method_id` (`payment_method_id`);

--
-- Indexy pro tabulku `reservation_service`
--
ALTER TABLE `reservation_service`
  ADD PRIMARY KEY (`reservation_id`,`service_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexy pro tabulku `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Indexy pro tabulku `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pro tabulku `paymentmethod`
--
ALTER TABLE `paymentmethod`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pro tabulku `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pro tabulku `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`payment_method_id`) REFERENCES `paymentmethod` (`payment_method_id`);

--
-- Omezení pro tabulku `reservation_service`
--
ALTER TABLE `reservation_service`
  ADD CONSTRAINT `reservation_service_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `reservation_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
