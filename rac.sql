-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2019 a las 00:04:58
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rac`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_cargo`
--

CREATE TABLE `cat_cargo` (
  `id_cargo` int(11) NOT NULL,
  `Nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cat_cargo`
--

INSERT INTO `cat_cargo` (`id_cargo`, `Nombre`) VALUES
(1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estado`
--

CREATE TABLE `cat_estado` (
  `id_estado` int(11) NOT NULL,
  `tipo_estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cat_estado`
--

INSERT INTO `cat_estado` (`id_estado`, `tipo_estado`) VALUES
(1, 'ACTIVO'),
(2, 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_adoptante`
--

CREATE TABLE `tbl_adoptante` (
  `id_adoptante` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Apellido` varchar(40) NOT NULL,
  `DPI` int(15) NOT NULL,
  `Profesion` varchar(40) NOT NULL,
  `Empresa` varchar(40) NOT NULL,
  `Fecha` date NOT NULL,
  `Sexo` varchar(10) NOT NULL,
  `Estado` varchar(12) NOT NULL,
  `Correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_adoptante`
--

INSERT INTO `tbl_adoptante` (`id_adoptante`, `Nombre`, `Apellido`, `DPI`, `Profesion`, `Empresa`, `Fecha`, `Sexo`, `Estado`, `Correo`) VALUES
(8, 'ROBERTO', 'FUENTES', 2147483647, 'Ingeniero', 'Gran Gallo', '2019-11-04', 'MASCULINO', 'SOLTERO', 'robert@gmail.com'),
(9, 'CARLOS', 'PEREZ', 123456789, 'Carpintero', 'Gallo', '2019-11-20', 'MASCULINO', 'SOLTERO', 'jp@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_especie`
--

CREATE TABLE `tbl_especie` (
  `id_especie` int(11) NOT NULL,
  `Especie` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_especie`
--

INSERT INTO `tbl_especie` (`id_especie`, `Especie`) VALUES
(1, 'Gato'),
(2, 'Perro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mascota`
--

CREATE TABLE `tbl_mascota` (
  `id_mascota` int(11) NOT NULL,
  `cod_mascota` varchar(40) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `id_especie` int(11) NOT NULL,
  `id_raza` int(11) NOT NULL,
  `Sexo` varchar(40) NOT NULL,
  `Color` varchar(25) NOT NULL,
  `Peso` int(25) NOT NULL,
  `Fecha` date NOT NULL,
  `Caracter` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ocupaciones`
--

CREATE TABLE `tbl_ocupaciones` (
  `id_ocupacion` int(11) NOT NULL,
  `id_adoptante` int(11) NOT NULL,
  `trabajo_actual` varchar(20) NOT NULL,
  `estabilidad_lab` varchar(20) NOT NULL,
  `horario` varchar(20) NOT NULL,
  `hobbie` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_ocupaciones`
--

INSERT INTO `tbl_ocupaciones` (`id_ocupacion`, `id_adoptante`, `trabajo_actual`, `estabilidad_lab`, `horario`, `hobbie`) VALUES
(32, 8, 'wa', 'a', '5', 'a'),
(33, 9, 'a', 's', '1', 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_personal`
--

CREATE TABLE `tbl_personal` (
  `id_personal` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `dpi` varchar(13) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `contrasena` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_personal`
--

INSERT INTO `tbl_personal` (`id_personal`, `nombre`, `apellido`, `dpi`, `id_cargo`, `id_estado`, `usuario`, `contrasena`) VALUES
(1, 'a', 'a', 'a', 1, 1, 'a', 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_raza`
--

CREATE TABLE `tbl_raza` (
  `id_raza` int(11) NOT NULL,
  `Raza` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_raza`
--

INSERT INTO `tbl_raza` (`id_raza`, `Raza`) VALUES
(1, 'Angora');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cat_cargo`
--
ALTER TABLE `cat_cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `cat_estado`
--
ALTER TABLE `cat_estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `tbl_adoptante`
--
ALTER TABLE `tbl_adoptante`
  ADD PRIMARY KEY (`id_adoptante`);

--
-- Indices de la tabla `tbl_especie`
--
ALTER TABLE `tbl_especie`
  ADD PRIMARY KEY (`id_especie`);

--
-- Indices de la tabla `tbl_mascota`
--
ALTER TABLE `tbl_mascota`
  ADD PRIMARY KEY (`id_mascota`),
  ADD KEY `id_raza` (`id_raza`),
  ADD KEY `id_especie` (`id_especie`);

--
-- Indices de la tabla `tbl_ocupaciones`
--
ALTER TABLE `tbl_ocupaciones`
  ADD PRIMARY KEY (`id_ocupacion`),
  ADD KEY `id_adoptante` (`id_adoptante`);

--
-- Indices de la tabla `tbl_personal`
--
ALTER TABLE `tbl_personal`
  ADD PRIMARY KEY (`id_personal`),
  ADD KEY `fk_cargo_idx` (`id_cargo`),
  ADD KEY `fk_estado_idx` (`id_estado`);

--
-- Indices de la tabla `tbl_raza`
--
ALTER TABLE `tbl_raza`
  ADD PRIMARY KEY (`id_raza`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cat_estado`
--
ALTER TABLE `cat_estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_adoptante`
--
ALTER TABLE `tbl_adoptante`
  MODIFY `id_adoptante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbl_especie`
--
ALTER TABLE `tbl_especie`
  MODIFY `id_especie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_mascota`
--
ALTER TABLE `tbl_mascota`
  MODIFY `id_mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_ocupaciones`
--
ALTER TABLE `tbl_ocupaciones`
  MODIFY `id_ocupacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `tbl_raza`
--
ALTER TABLE `tbl_raza`
  MODIFY `id_raza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_mascota`
--
ALTER TABLE `tbl_mascota`
  ADD CONSTRAINT `tbl_mascota_ibfk_1` FOREIGN KEY (`id_raza`) REFERENCES `tbl_raza` (`id_raza`),
  ADD CONSTRAINT `tbl_mascota_ibfk_2` FOREIGN KEY (`id_especie`) REFERENCES `tbl_especie` (`id_especie`);

--
-- Filtros para la tabla `tbl_ocupaciones`
--
ALTER TABLE `tbl_ocupaciones`
  ADD CONSTRAINT `tbl_ocupaciones_ibfk_1` FOREIGN KEY (`id_adoptante`) REFERENCES `tbl_adoptante` (`id_adoptante`);

--
-- Filtros para la tabla `tbl_personal`
--
ALTER TABLE `tbl_personal`
  ADD CONSTRAINT `fk_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cat_cargo` (`id_cargo`),
  ADD CONSTRAINT `fk_estado` FOREIGN KEY (`id_estado`) REFERENCES `cat_estado` (`id_estado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
