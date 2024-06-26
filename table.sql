-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 34.176.56.6:3306
-- Tiempo de generación: 26-06-2024 a las 22:36:25
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
-- Base de datos: `gestor-contrato`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anexo`
--

CREATE TABLE `anexo` (
  `id_anexo` int NOT NULL,
  `id_contrato` int NOT NULL,
  `cambio_anexo` varchar(200) NOT NULL,
  `pdf_anexo` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido_contrato`
--

CREATE TABLE `contenido_contrato` (
  `id_cc` int NOT NULL,
  `id_contrato` int DEFAULT NULL,
  `rut` varchar(10) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellido_p` varchar(20) DEFAULT NULL,
  `apellido_m` varchar(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `estado_civil` varchar(15) DEFAULT NULL,
  `tipo_cargo` varchar(25) DEFAULT NULL,
  `inicio_contrato` date DEFAULT NULL,
  `finalizacion_contrato` date DEFAULT NULL,
  `provision_afp` varchar(15) DEFAULT NULL,
  `nacionalidad` varchar(15) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sistema_salud` varchar(15) DEFAULT NULL,
  `sueldo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id_contrato` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_expiracion` date DEFAULT NULL,
  `tipo_contrato` varchar(30) DEFAULT NULL,
  `contenido_contrato` longblob,
  `estado` varchar(15) DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_contrato`
--

CREATE TABLE `historial_contrato` (
  `id_historial_contrato` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `estado_anterior` varchar(15) DEFAULT NULL,
  `estado_nuevo` varchar(15) DEFAULT NULL,
  `fecha_cambio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `rut` varchar(10) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellido_p` varchar(20) DEFAULT NULL,
  `apellido_m` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `rol` varchar(35) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `rut`, `nombres`, `apellido_p`, `apellido_m`, `correo_electronico`, `rol`, `password`) VALUES
(222333, '11222333-4', 'das', 'dsa', 'das', 'das', 'Gerente', 'scrypt:32768:8:1$hYWO1Llm5r5nVyXI$0d9515efc90df4ddfb4db905947fe3ad012410f30b8c617b4c8d5f268b9b95bf16cd3912f72c911ad856929d1b8bbb770504d62c5ea0ebbbd8a7e77ca5c9bdfa'),
(333444, '11333444-6', 'a', 'a', 'a', 'a@a.cl', 'Jefe de Recursos Humanos', 'scrypt:32768:8:1$3jlqUsNZWIPtzGJL$4d41d4c35f45d5adceb9b9660fdf488ddf91cf2808802cc5997c5d89e370ed8a18aadaea958622a6e89f292bb6bb029bad8c39017659fe216e3f889e9eaaf5a7'),
(584130, '21584130-8', 'Bayron', 'Gomez', 'Araya', 'appa@appa.cl', 'Gerente', 'scrypt:32768:8:1$2zNt8JjtlkA4RVE4$9a864de21999043c577af011b2ed4f29302d4b8462d9f255ca4048236c5080b082aa21a58393dad459b906d2b92b43b74d4bdd387faf997ec01d79f2ff482529'),
(751175, '21751175-5', 'Benjamin Miguel', 'Morales', 'Catalan', 'benja.mc12@gmail.com', 'Gerente General', 'scrypt:32768:8:1$uJ9TBtaXYJFzaSch$24a98d2320f855621cc2b7ad355985360ece484553ab0e43c3c4ba233ce5120c37a8fe4343b6e5879459962413b5b63b5dca5c1e10f3a718e78196a848a01bfe');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anexo`
--
ALTER TABLE `anexo`
  ADD PRIMARY KEY (`id_anexo`),
  ADD KEY `id_contrato` (`id_contrato`);

--
-- Indices de la tabla `contenido_contrato`
--
ALTER TABLE `contenido_contrato`
  ADD PRIMARY KEY (`id_cc`),
  ADD KEY `id_contrato` (`id_contrato`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `id_usuario_trabajador` (`id_usuario`);

--
-- Indices de la tabla `historial_contrato`
--
ALTER TABLE `historial_contrato`
  ADD PRIMARY KEY (`id_historial_contrato`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anexo`
--
ALTER TABLE `anexo`
  ADD CONSTRAINT `id_contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `contenido_contrato`
--
ALTER TABLE `contenido_contrato`
  ADD CONSTRAINT `contenido_contrato_ibfk_1` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`);

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `historial_contrato`
--
ALTER TABLE `historial_contrato`
  ADD CONSTRAINT `historial_contrato_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
