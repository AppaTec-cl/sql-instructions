-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 34.176.56.6:3306
-- Tiempo de generación: 24-07-2024 a las 11:05:06
-- Versión del servidor: 8.0.31-google
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `GestorContrato`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CONTENIDO_CONTRATO`
--

CREATE TABLE `CONTENIDO_CONTRATO` (
  `ID_CC` varchar(6) NOT NULL,
  `ID_CONTRATO` varchar(6) NOT NULL,
  `NOMBRES` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `ESTADO_CIVIL` varchar(20) DEFAULT NULL,
  `FECHA_NACIMIENTO` varchar(50) DEFAULT NULL,
  `RUT` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MAIL` varchar(100) DEFAULT NULL,
  `NACIONALIDAD` varchar(30) DEFAULT NULL,
  `SISTEMA_SALUD` varchar(10) DEFAULT NULL,
  `AFP` varchar(30) DEFAULT NULL,
  `NOMBRE_EMPLEADOR` varchar(100) DEFAULT NULL,
  `RUT_EMPLEADOR` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CARGO` varchar(50) DEFAULT NULL,
  `FECHA_INICIO` varchar(50) DEFAULT NULL,
  `FECHA_FINAL` varchar(50) DEFAULT NULL,
  `INDEFINIDO` tinyint(1) DEFAULT NULL,
  `SUELDO_BASE` decimal(10,0) DEFAULT NULL,
  `ASIGNACIO_COLACION` decimal(10,0) DEFAULT NULL,
  `BONO_ASISTENCIA` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `CONTENIDO_CONTRATO`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CONTRATO`
--

CREATE TABLE `CONTRATO` (
  `ID_CONTRATO` varchar(6) NOT NULL,
  `TIPO_CONTRATO` varchar(50) DEFAULT NULL,
  `FECHA_INICIO` varchar(50) DEFAULT NULL,
  `FECHA_EXPIRACION` varchar(50) DEFAULT NULL,
  `COMENTARIO` varchar(500) DEFAULT NULL,
  `ESTADO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `REVISION_GERENTE` tinyint(1) DEFAULT NULL,
  `REVISION_GERENTE_GENERAL` tinyint(1) DEFAULT NULL,
  `ULTIMO_REVISOR` varchar(50) DEFAULT NULL,
  `FECHA_ULTIMA_REVISION` varchar(50) DEFAULT NULL,
  `CONTRATO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `CONTRATO`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CREA`
--

CREATE TABLE `CREA` (
  `ID_CONTRATO` varchar(6) NOT NULL,
  `ID_USUARIO` varchar(6) NOT NULL,
  `FECHA_CREACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `CREA`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `ID_USUARIO` varchar(6) NOT NULL,
  `NOMBRES` varchar(40) DEFAULT NULL,
  `APELLIDO_P` varchar(20) DEFAULT NULL,
  `APELLIDO_M` varchar(20) DEFAULT NULL,
  `RUT` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PASSWORD` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MAIL` varchar(100) DEFAULT NULL,
  `ROL` varchar(50) DEFAULT NULL,
  `FIRMA` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `USUARIO`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CONTENIDO_CONTRATO`
--
ALTER TABLE `CONTENIDO_CONTRATO`
  ADD PRIMARY KEY (`ID_CC`),
  ADD KEY `FK_CONTENID_CONTIENE_CONTRATO` (`ID_CONTRATO`);

--
-- Indices de la tabla `CONTRATO`
--
ALTER TABLE `CONTRATO`
  ADD PRIMARY KEY (`ID_CONTRATO`);

--
-- Indices de la tabla `CREA`
--
ALTER TABLE `CREA`
  ADD KEY `FK_CREA_CREA_CONTRATO` (`ID_CONTRATO`),
  ADD KEY `FK_CREA_CREA2_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CONTENIDO_CONTRATO`
--
ALTER TABLE `CONTENIDO_CONTRATO`
  ADD CONSTRAINT `FK_CONTENID_CONTIENE_CONTRATO` FOREIGN KEY (`ID_CONTRATO`) REFERENCES `CONTRATO` (`ID_CONTRATO`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `CREA`
--
ALTER TABLE `CREA`
  ADD CONSTRAINT `FK_CREA_CREA2_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `USUARIO` (`ID_USUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_CREA_CREA_CONTRATO` FOREIGN KEY (`ID_CONTRATO`) REFERENCES `CONTRATO` (`ID_CONTRATO`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CO
