-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Czas generowania: 29 Kwi 2022, 19:41
-- Wersja serwera: 10.6.7-MariaDB-1:10.6.7+maria~focal
-- Wersja PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `pricescrapperdb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `last_update_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `price`, `last_update_at`) VALUES
(1, 'test1', 'testownik1', '125.99', '2022-04-29 19:23:03'),
(2, 'test2', 'testownik2', '29.99', '2022-04-29 19:23:03');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Zrzut danych tabeli `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220429191422', '2022-04-29 19:14:32', 2793);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `observed`
--

CREATE TABLE `observed` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `observed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `observed`
--

INSERT INTO `observed` (`id`, `book_id`, `user_id`, `observed`) VALUES
(1, 1, 2, 1),
(2, 1, 3, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `price_history`
--

CREATE TABLE `price_history` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `price_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `price_history`
--

INSERT INTO `price_history` (`id`, `book_id`, `price`, `price_at`) VALUES
(1, 1, '200.00', '2022-04-26 21:24:51'),
(2, 1, '125.99', '2022-04-29 19:24:51');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `last_edit` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `review`
--

INSERT INTO `review` (`id`, `user_id`, `book_id`, `text`, `rating`, `created_at`, `last_edit`) VALUES
(1, 1, 1, 'testowarecenzjahaha', 3, '2022-04-29 19:25:31', NULL),
(2, 2, 1, 'testowarecenzjahaha\r\nedit: hehe', 5, '2022-04-29 19:25:31', '2022-04-29 21:25:32');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(1, 'test1', 'test1test1test1test1test1test1test1', 'test1@test1.test1'),
(2, 'test2', 'test2test2test2test2test2test2', 'test2@test2.test2'),
(3, 'test3', 'test3test3test3test3test3test3test3', 'test3@test3.test3');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `observed`
--
ALTER TABLE `observed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6FBBF1B616A2B381` (`book_id`),
  ADD KEY `IDX_6FBBF1B6A76ED395` (`user_id`);

--
-- Indeksy dla tabeli `price_history`
--
ALTER TABLE `price_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4C9CB81716A2B381` (`book_id`);

--
-- Indeksy dla tabeli `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C6A76ED395` (`user_id`),
  ADD KEY `IDX_794381C616A2B381` (`book_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `observed`
--
ALTER TABLE `observed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `price_history`
--
ALTER TABLE `price_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `observed`
--
ALTER TABLE `observed`
  ADD CONSTRAINT `FK_6FBBF1B616A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `FK_6FBBF1B6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `price_history`
--
ALTER TABLE `price_history`
  ADD CONSTRAINT `FK_4C9CB81716A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Ograniczenia dla tabeli `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C616A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `FK_794381C6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
