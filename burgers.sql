-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 15 2018 г., 10:34
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `burgers`
--

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `home` int(11) NOT NULL,
  `part` varchar(255) NOT NULL,
  `appt` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `comment` text NOT NULL,
  `payment` varchar(255) NOT NULL,
  `callback` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `user_id`, `street`, `home`, `part`, `appt`, `floor`, `comment`, `payment`, `callback`) VALUES
(1, 1, 'Коммуистическая', 6, '', 48, 5, 'Привет', 'yes', 'no'),
(2, 1, 'Коммуистическая', 6, '', 48, 5, 'Привет', 'yes', 'no'),
(3, 1, 'Коммуистическая', 6, '', 48, 5, 'Привет', 'yes', 'no'),
(4, 1, 'Коммуистическая', 6, '', 48, 5, 'Привет', 'yes', 'no'),
(5, 2, 'Восстания', 99, '2', 34, 3, 'Ничего нет', 'no', 'no'),
(6, 2, 'Восстания', 99, '2', 34, 3, 'Ничего нет', 'yes', 'Yes'),
(7, 3, 'Новаторов', 9, '1', 89, 7, 'Большой коментарий', 'no', 'yes');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `email` varchar(24) NOT NULL,
  `phone` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`) VALUES
(1, 'Алена', 'qwerty@mail.ru', '8800200600'),
(2, 'Вова', 'weadawd@mail.ru', '12345678904'),
(3, 'Николай', 'fgsdgsdgd@mail.ru', '64563423568'),
(4, 'Иван', 'ukuilyuk@mail.ru', '14565432347'),
(5, 'Оля', 'bvxvcv@mail.ru', '53664564564'),
(6, 'Олег', 'oiloiulo@mail.ru', '89676856547');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
