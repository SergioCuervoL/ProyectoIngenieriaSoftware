-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-09-2019 a las 20:36:15
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `phplogin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_documentos`
--

CREATE TABLE `tbl_documentos` (
  `id_documento` int(10) UNSIGNED NOT NULL,
  `Titulo` varchar(150) DEFAULT NULL,
  `Descripcion` mediumtext,
  `Tamanio` int(10) UNSIGNED DEFAULT NULL,
  `Tipo` varchar(150) DEFAULT NULL,
  `Nombre_archivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_documentos`
--

INSERT INTO `tbl_documentos` (`id_documento`, `Titulo`, `Descripcion`, `Tamanio`, `Tipo`, `Nombre_archivo`) VALUES
(4, 'prueba', 'esta es una prueba', 171758, 'application/pdf', 'EJEMPLO.pdf'),
(5, 'ejemplo 2', 'segundo ejemplo', 100152, 'application/pdf', 'php.pdf'),
(6, '', '', 100152, 'application/pdf', 'php.pdf'),
(7, 'Ejemplo', 'HOLA', 100152, 'application/pdf', 'php.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `Id` mediumint(8) NOT NULL,
  `Name` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(128) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`Id`, `Name`, `Email`, `Password`) VALUES
(1, 'Santiaguito', 'mxsmxslx@gmail.com', '$2y$10$laYdo68EfJZ1SP7bFLbSouBYy.6KdWybqv.nxUOAtNIrUBwcsAAbu'),
(2, 'Estefania Moreno', 'emorenocorr@alas.com', '$2y$10$QU.KEhzbX3lqk.X9sSId7eythrSwxych84a.GV4FWsiVy.rzPvV2i');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_documentos`
--
ALTER TABLE `tbl_documentos`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_documentos`
--
ALTER TABLE `tbl_documentos`
  MODIFY `id_documento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `Id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
