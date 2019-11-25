-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Lis 2019, 18:51
-- Wersja serwera: 10.1.37-MariaDB
-- Wersja PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wetpol`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `doktorzy`
--

CREATE TABLE `doktorzy` (
  `id_doktora` int(11) NOT NULL,
  `imie` varchar(15) COLLATE utf16_polish_ci NOT NULL,
  `nazwisko` varchar(20) COLLATE utf16_polish_ci NOT NULL,
  `nr_telefonu` varchar(11) COLLATE utf16_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `doktorzy`
--

INSERT INTO `doktorzy` (`id_doktora`, `imie`, `nazwisko`, `nr_telefonu`) VALUES
(1, 'Janusz', 'Mikke', '555333666'),
(3, 'Janusz', 'Korwin', '335565425'),
(5, 'Jarosław', 'Cichociemny', '987654321');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id_klienta` int(11) NOT NULL,
  `imie` varchar(20) COLLATE utf16_polish_ci NOT NULL,
  `nazwisko` varchar(20) COLLATE utf16_polish_ci NOT NULL,
  `nr_telefonu` varchar(11) COLLATE utf16_polish_ci NOT NULL,
  `id_doktora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leki`
--

CREATE TABLE `leki` (
  `id_leku` int(11) NOT NULL,
  `nazwa` varchar(20) COLLATE utf16_polish_ci NOT NULL,
  `dawka` varchar(20) COLLATE utf16_polish_ci NOT NULL,
  `id_notatki` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notatki`
--

CREATE TABLE `notatki` (
  `id_notatki` int(11) NOT NULL,
  `tresc` varchar(250) COLLATE utf16_polish_ci NOT NULL,
  `kategoria` varchar(20) COLLATE utf16_polish_ci NOT NULL,
  `id_zwierzaka` int(11) NOT NULL,
  `id_leku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zwierzaki`
--

CREATE TABLE `zwierzaki` (
  `id_zwierzaka` int(11) NOT NULL,
  `imie` varchar(20) COLLATE utf16_polish_ci NOT NULL,
  `id_klienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `doktorzy`
--
ALTER TABLE `doktorzy`
  ADD PRIMARY KEY (`id_doktora`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`),
  ADD KEY `id_doktora` (`id_doktora`);

--
-- Indeksy dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD PRIMARY KEY (`id_leku`),
  ADD KEY `id_notatki` (`id_notatki`);

--
-- Indeksy dla tabeli `notatki`
--
ALTER TABLE `notatki`
  ADD PRIMARY KEY (`id_notatki`),
  ADD KEY `id_zwierzaka` (`id_zwierzaka`),
  ADD KEY `id_leku` (`id_leku`);

--
-- Indeksy dla tabeli `zwierzaki`
--
ALTER TABLE `zwierzaki`
  ADD PRIMARY KEY (`id_zwierzaka`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `doktorzy`
--
ALTER TABLE `doktorzy`
  MODIFY `id_doktora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `leki`
--
ALTER TABLE `leki`
  MODIFY `id_leku` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `notatki`
--
ALTER TABLE `notatki`
  MODIFY `id_notatki` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zwierzaki`
--
ALTER TABLE `zwierzaki`
  MODIFY `id_zwierzaka` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD CONSTRAINT `klienci_ibfk_1` FOREIGN KEY (`id_doktora`) REFERENCES `doktorzy` (`id_doktora`),
  ADD CONSTRAINT `klienci_ibfk_2` FOREIGN KEY (`id_klienta`) REFERENCES `zwierzaki` (`id_klienta`);

--
-- Ograniczenia dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD CONSTRAINT `leki_ibfk_1` FOREIGN KEY (`id_notatki`) REFERENCES `notatki` (`id_notatki`);

--
-- Ograniczenia dla tabeli `notatki`
--
ALTER TABLE `notatki`
  ADD CONSTRAINT `notatki_ibfk_1` FOREIGN KEY (`id_leku`) REFERENCES `leki` (`id_leku`),
  ADD CONSTRAINT `notatki_ibfk_2` FOREIGN KEY (`id_zwierzaka`) REFERENCES `zwierzaki` (`id_zwierzaka`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
