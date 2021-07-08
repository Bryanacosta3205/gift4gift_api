-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2021 a las 05:34:48
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `giftapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `created_at` text DEFAULT current_timestamp(),
  `details` text NOT NULL,
  `image_url` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `article`
--

INSERT INTO `article` (`id`, `title`, `created_at`, `details`, `image_url`, `id_user`) VALUES
(36, 'Playera', '2021-07-07 16:15:37', 'Es nueva', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXSQ8A0Mym9TSxkWEZNMdY9KQ8NlGzgZYAo8srMbEBdNWyzIkS97K1A3zh68qb_v9kMlI&usqp=CAU', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `article_offer`
--

CREATE TABLE `article_offer` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `id_article_offered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` text NOT NULL DEFAULT current_timestamp(),
  `id_userBelongs` int(11) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comment`
--

INSERT INTO `comment` (`id`, `content`, `created_at`, `id_userBelongs`, `id_article`) VALUES
(33, 'Es un buen producto', '2021-07-07 16:16:26', 1, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `created_at` text NOT NULL DEFAULT current_timestamp(),
  `content` text NOT NULL,
  `id_user_maker` int(11) NOT NULL,
  `id_user_receiver` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `offer_article`
--

CREATE TABLE `offer_article` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `id_article_wanted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `image_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `phone`, `pass`, `image_url`) VALUES
(1, 'Bryan Acosta', '3123390638', '12345678', 'https://i.pinimg.com/474x/ee/60/0b/ee600b5178e4f1648fd1e8623f049611.jpg'),
(2, 'Juan Vazquez', '3123398746', '12345678', 'data:image/jpeg;base64,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');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_ibfk_1` (`id_user`);

--
-- Indices de la tabla `article_offer`
--
ALTER TABLE `article_offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_id` (`offer_id`),
  ADD KEY `id_article_offered` (`id_article_offered`);

--
-- Indices de la tabla `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_userBelongs` (`id_userBelongs`),
  ADD KEY `comment_ibfk_2` (`id_article`);

--
-- Indices de la tabla `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_maker` (`id_user_maker`),
  ADD KEY `id_user_receiver` (`id_user_receiver`);

--
-- Indices de la tabla `offer_article`
--
ALTER TABLE `offer_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_id` (`offer_id`),
  ADD KEY `id_article_wanted` (`id_article_wanted`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `article_offer`
--
ALTER TABLE `article_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `offer_article`
--
ALTER TABLE `offer_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `article_offer`
--
ALTER TABLE `article_offer`
  ADD CONSTRAINT `article_offer_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`),
  ADD CONSTRAINT `article_offer_ibfk_2` FOREIGN KEY (`id_article_offered`) REFERENCES `article` (`id`);

--
-- Filtros para la tabla `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_userBelongs`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`id_user_maker`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`id_user_receiver`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `offer_article`
--
ALTER TABLE `offer_article`
  ADD CONSTRAINT `offer_article_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`),
  ADD CONSTRAINT `offer_article_ibfk_2` FOREIGN KEY (`id_article_wanted`) REFERENCES `article` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
