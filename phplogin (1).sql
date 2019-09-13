-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-09-2019 a las 20:18:04
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
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `ruta` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `size` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `archivos`
--

INSERT INTO `archivos` (`id`, `name`, `description`, `ruta`, `tipo`, `size`) VALUES
(13, 'Carlos', 'PEPITO PEREZ', 'Linuxdoc-Ejemplo.pdf', 'application/pdf', 21124),
(14, 'imjagen', 'mia', '98acb06a-573c-486b-9a43-bca9770f692d.jpg', 'image/jpeg', 191221),
(15, 'imjagen', 'mia', '98acb06a-573c-486b-9a43-bca9770f692d.jpg', 'image/jpeg', 191221),
(16, 'asdas', 'asdasdasd', '02e1cc7d-b00e-4154-9c64-468bf375622f.jpg', 'image/jpeg', 199256),
(17, 'Mierda.', 'Mierda.', 'READINGANDWRITINGdani.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15772),
(18, 'Mierda.', 'Mierda.', 'READINGANDWRITINGdani.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15772),
(19, 'Mierda.', 'Mierda.', 'READINGANDWRITINGdani.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15772),
(20, 'Mierda.', 'Mierda.', 'READINGANDWRITINGdani.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15772),
(21, 'hola.', 'Hola', 'READINGANDWRITINGdani.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15772),
(22, 'hola.', 'Hola', 'READINGANDWRITINGdani.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15772),
(23, 'hola.', 'Hola', 'READINGANDWRITINGdani.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15772),
(24, 'hola.', 'Hola', 'READINGANDWRITINGdani.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15772);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `idDocumento` int(11) NOT NULL,
  `tipoDocumento` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `tipoProceso` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `USUARIO_idUsuarioOfertante` int(11) NOT NULL,
  `USUARIO_idUsuarioGerente` int(11) NOT NULL,
  `archivo` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerente`
--

CREATE TABLE `gerente` (
  `TipoProyecto` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `USUARIO_idUSUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion`
--

CREATE TABLE `licitacion` (
  `empresa` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `bienInmueble` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `DOCUMENTO_idDocumento` int(11) NOT NULL,
  `DOCUMENTO_USUARIO_idUsuarioOfertante` int(11) NOT NULL,
  `DOCUMENTO_USUARIO_idUsuarioGerente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

CREATE TABLE `oferta` (
  `empresa` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `descuento` double NOT NULL,
  `totalPagar` double NOT NULL,
  `DOCUMENTO_idDocumento` int(11) NOT NULL,
  `DOCUMENTO_USUARIO_idUsuarioOfertante` int(11) NOT NULL,
  `DOCUMENTO_USUARIO_idUsuarioGerente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertante`
--

CREATE TABLE `ofertante` (
  `USUARIO_idUSUARIO` int(11) NOT NULL,
  `valorProyecto` double NOT NULL,
  `tipoProducto` varchar(45) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

CREATE TABLE `presupuesto` (
  `cuota` double NOT NULL,
  `intereses` double NOT NULL,
  `totalPagar` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `DOCUMENTO_idDocumento` int(11) NOT NULL,
  `DOCUMENTO_USUARIO_idUsuarioOfertante` int(11) NOT NULL,
  `DOCUMENTO_USUARIO_idUsuarioGerente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
  `Password` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `TipoUsuario` tinytext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`Id`, `Name`, `Email`, `Password`, `TipoUsuario`) VALUES
(1, 'Santiaguito', 'mxsmxslx@gmail.com', '$2y$10$laYdo68EfJZ1SP7bFLbSouBYy.6KdWybqv.nxUOAtNIrUBwcsAAbu', ''),
(2, 'Estefania Moreno', 'emorenocorr@alas.com', '$2y$10$QU.KEhzbX3lqk.X9sSId7eythrSwxych84a.GV4FWsiVy.rzPvV2i', ''),
(3, '', '', '', ''),
(4, 'Andres', 'mxsmxlx@gmail.com', '$2y$10$wtVbagZWm1KIQsiiks0EFelljTA3R6XdkEKhssZsGjf4KUS8GbdqS', ''),
(5, 'Andres', 'mxsmxlxa@gmail.com', '$2y$10$8L9gD8uDTzaqODZuY1r2be4LLTvTngs6YSE3L/vN91T6TpmdKlSKa', 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`TipoProyecto`,`USUARIO_idUSUARIO`),
  ADD KEY `fk_Gerente_USUARIO_idx` (`USUARIO_idUSUARIO`);

--
-- Indices de la tabla `licitacion`
--
ALTER TABLE `licitacion`
  ADD PRIMARY KEY (`DOCUMENTO_idDocumento`,`DOCUMENTO_USUARIO_idUsuarioOfertante`,`DOCUMENTO_USUARIO_idUsuarioGerente`);

--
-- Indices de la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`DOCUMENTO_idDocumento`,`DOCUMENTO_USUARIO_idUsuarioOfertante`,`DOCUMENTO_USUARIO_idUsuarioGerente`);

--
-- Indices de la tabla `ofertante`
--
ALTER TABLE `ofertante`
  ADD PRIMARY KEY (`USUARIO_idUSUARIO`);

--
-- Indices de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD PRIMARY KEY (`DOCUMENTO_idDocumento`,`DOCUMENTO_USUARIO_idUsuarioOfertante`,`DOCUMENTO_USUARIO_idUsuarioGerente`);

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
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tbl_documentos`
--
ALTER TABLE `tbl_documentos`
  MODIFY `id_documento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `Id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
