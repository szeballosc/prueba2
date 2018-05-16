-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2018 a las 21:26:16
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdprueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `codigo_producto` varchar(6) NOT NULL,
  `codigo_pedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `codigo` int(11) NOT NULL,
  `monto` int(11) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `entrega` tinyint(1) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` varchar(6) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio` int(6) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `precio`, `descripcion`) VALUES
('ATU001', 'ALAN MAGURO', 6700, 'Camarón y palta'),
('ATU002', 'DANI MAGURO', 6700, 'Salmón normal o ahumado y palta'),
('ATU003', 'DON ROLL', 7100, 'Unagui y pepino con salsa unagui'),
('ATU004', 'LA PARVA CALIENTE', 6700, 'Queso crema y cebollin'),
('BEB001', 'BEBIDA LATA', 950, 'Bebidita rica y deliciosa'),
('BEB002', 'JUGO (FRUTA NATURAL)', 1800, 'Juguito rico y deliciosa'),
('BEB003', 'TEA GREEN GINSENG DIET', 2800, 'Tecito rico y delicioso'),
('CAL001', 'MAGURO ROLL', 6200, 'Kanikama y palta'),
('CAL002', 'SAIKO MAGURO', 6700, 'Camarón tempura y palta con salsa de unagui'),
('CAL003', 'TAKI MAGURO', 7100, 'Unagui y palta con salsa unagui'),
('PAL001', 'EDU ROLL', 6400, 'Salmon normal o ahumado y queso crema'),
('PAL002', 'ISHI ROLL', 6200, 'Camarón tempura, pepino y masago'),
('PAL003', 'MEMO ROLL TEMPURA', 6500, 'Camarón tempura con salsa spicy'),
('PAL004', 'MIKEY ROLL', 6100, 'Camarón picado y salsa spicy');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD KEY `codigo_pedido` (`codigo_producto`),
  ADD KEY `codigo_producto` (`codigo_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo` (`codigo`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo` (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
