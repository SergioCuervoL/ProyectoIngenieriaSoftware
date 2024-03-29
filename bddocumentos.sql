-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-09-2019 a las 21:20:13
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bddocumentos`
--

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
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUSUARIO` int(11) NOT NULL,
  `nombreUsuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `correoUsuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `contraseĂ±aUsuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`idDocumento`,`USUARIO_idUsuarioOfertante`,`USUARIO_idUsuarioGerente`),
  ADD KEY `fk_DOCUMENTO_USUARIO1_idx` (`USUARIO_idUsuarioOfertante`),
  ADD KEY `fk_DOCUMENTO_USUARIO2_idx` (`USUARIO_idUsuarioGerente`);

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
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUSUARIO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `fk_DOCUMENTO_USUARIO1` FOREIGN KEY (`USUARIO_idUsuarioOfertante`) REFERENCES `usuario` (`idUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DOCUMENTO_USUARIO2` FOREIGN KEY (`USUARIO_idUsuarioGerente`) REFERENCES `usuario` (`idUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `fk_Gerente_USUARIO` FOREIGN KEY (`USUARIO_idUSUARIO`) REFERENCES `usuario` (`idUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `licitacion`
--
ALTER TABLE `licitacion`
  ADD CONSTRAINT `fk_LICITACION_DOCUMENTO` FOREIGN KEY (`DOCUMENTO_idDocumento`,`DOCUMENTO_USUARIO_idUsuarioOfertante`,`DOCUMENTO_USUARIO_idUsuarioGerente`) REFERENCES `documento` (`idDocumento`, `USUARIO_idUsuarioOfertante`, `USUARIO_idUsuarioGerente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD CONSTRAINT `fk_OFERTA_DOCUMENTO1` FOREIGN KEY (`DOCUMENTO_idDocumento`,`DOCUMENTO_USUARIO_idUsuarioOfertante`,`DOCUMENTO_USUARIO_idUsuarioGerente`) REFERENCES `documento` (`idDocumento`, `USUARIO_idUsuarioOfertante`, `USUARIO_idUsuarioGerente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ofertante`
--
ALTER TABLE `ofertante`
  ADD CONSTRAINT `fk_OFERTANTE_USUARIO1` FOREIGN KEY (`USUARIO_idUSUARIO`) REFERENCES `usuario` (`idUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD CONSTRAINT `fk_PRESUPUESTO_DOCUMENTO` FOREIGN KEY (`DOCUMENTO_idDocumento`,`DOCUMENTO_USUARIO_idUsuarioOfertante`,`DOCUMENTO_USUARIO_idUsuarioGerente`) REFERENCES `documento` (`idDocumento`, `USUARIO_idUsuarioOfertante`, `USUARIO_idUsuarioGerente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
