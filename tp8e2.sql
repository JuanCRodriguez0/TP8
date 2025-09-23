-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2025 a las 01:31:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tp8e2`
--
CREATE DATABASE IF NOT EXISTS `tp8e2` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `tp8e2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_Cliente` int(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_Cliente`, `nombre`, `direccion`, `email`) VALUES
(1, 'JeremiasS', 'B114M189C18', 'jeremias@gmail.com'),
(2, 'MauricioR', 'B110M51C5', 'mauricio.reta.03@gmail.com'),
(3, 'AgustinM', 'Los zorzales 558', 'agusmazza@gmail.com'),
(4, 'JeremiasH', 'La Escondida km50', 'jeremiashoyo035@gmail.com'),
(5, 'JuanquiR', 'El Escondido km4', 'jcr0@gmail.com'),
(6, 'FacundoC', 'Las mujeres de eña', 'facucozzela0@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `id_Pedido` int(4) NOT NULL,
  `id_Producto` int(4) NOT NULL,
  `cantidad` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`id_Pedido`, `id_Producto`, `cantidad`) VALUES
(11, 2033, 5),
(10, 2057, 3),
(30, 2901, 1),
(35, 3024, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_Pedido` int(4) NOT NULL,
  `fecha` date NOT NULL,
  `id_Cliente` int(4) NOT NULL,
  `estado` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_Pedido`, `fecha`, `id_Cliente`, `estado`) VALUES
(10, '2024-02-21', 3, 1),
(11, '2024-04-30', 5, 0),
(20, '2024-01-11', 2, 1),
(30, '2024-05-07', 4, 1),
(35, '2025-01-02', 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_Producto` int(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `precio` double(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_Producto`, `nombre`, `descripcion`, `precio`) VALUES
(2033, 'escoba', 'barredora', 500),
(2057, 'pala', 'gris plastica', 5000),
(2901, 'secador', 'verde aluminio', 9999),
(3024, 'mopa', 'amarilla', 9999);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_Cliente`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD KEY `id_Pedido` (`id_Pedido`,`id_Producto`),
  ADD KEY `id_Pedido_2` (`id_Pedido`),
  ADD KEY `id_Producto` (`id_Producto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_Pedido`),
  ADD KEY `id_Cliente` (`id_Cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_Producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_Pedido` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_ibfk_1` FOREIGN KEY (`id_Pedido`) REFERENCES `pedidos` (`id_Pedido`),
  ADD CONSTRAINT `detalles_ibfk_2` FOREIGN KEY (`id_Producto`) REFERENCES `productos` (`id_Producto`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`id_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
