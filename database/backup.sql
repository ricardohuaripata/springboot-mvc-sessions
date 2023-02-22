-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2022 a las 14:17:36
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendavirtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `idPedido`, `idProducto`, `cantidad`) VALUES
(1, 1, 2, 2),
(2, 1, 6, 1),
(3, 2, 1, 2),
(4, 2, 4, 3),
(5, 2, 5, 1),
(6, 3, 3, 4),
(7, 4, 1, 1),
(8, 4, 4, 1),
(9, 4, 5, 1),
(10, 4, 6, 1),
(11, 5, 1, 1),
(12, 5, 2, 1),
(13, 5, 3, 1),
(14, 5, 4, 1),
(15, 5, 5, 1),
(16, 5, 6, 3),
(17, 6, 3, 1),
(18, 6, 4, 5),
(19, 7, 2, 1),
(20, 8, 1, 3),
(21, 9, 4, 5),
(22, 10, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `direccion` varchar(1000) NOT NULL,
  `municipio` varchar(250) NOT NULL,
  `provincia` varchar(250) NOT NULL,
  `codigopostal` varchar(5) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `total` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `idUsuario`, `direccion`, `municipio`, `provincia`, `codigopostal`, `telefono`, `fecha`, `total`) VALUES
(1, 2, 'Martinez de Irala, numero 2, bajo b', 'Sevilla', 'Sevilla', '41010', '622742749', '2022-12-09 19:54:07', '115.97'),
(2, 3, 'Martinez de Irala, numero 2, bajo b', 'Sevilla', 'Sevilla', '41010', '662569749', '2022-12-09 19:57:38', '159.94'),
(3, 3, 'Martinez de Irala, numero 2, bajo b', 'Sevilla', 'Sevilla', '41010', '622742749', '2022-12-09 20:02:33', '319.96'),
(4, 2, 'Martinez de Irala, numero 2, bajo b', 'Sevilla', 'Sevilla', '41010', '622742749', '2022-12-09 20:04:21', '139.96'),
(5, 4, 'Juan Diaz de Solis, numero 13, 1ºA', 'Sevilla', 'Sevilla', '41010', '615549949', '2022-12-10 03:19:25', '352.92'),
(6, 5, 'Isacc Newton, numero 13, 2ºb', 'Sevilla', 'Sevilla', '41010', '699644749', '2022-12-10 03:26:36', '179.94'),
(7, 5, 'Isacc Newton, numero 13, 2ºb', 'Sevilla', 'Sevilla', '41010', '699644749', '2022-12-10 03:39:35', '32.99'),
(8, 2, 'Martinez de Irala, numero 2, bajo b', 'Sevilla', 'Sevilla', '41010', '722549749', '2022-12-10 15:21:19', '89.97'),
(9, 2, 'Martinez de Irala, numero 2, bajo b', 'Sevilla', 'Sevilla', '41010', '722549749', '2022-12-10 15:26:17', '99.95'),
(10, 2, 'Martinez de Irala, numero 2, bajo b', 'Sevilla', 'Sevilla', '41010', '722549749', '2022-12-10 15:32:36', '39.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `tittle` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `imageLink` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `tittle`, `description`, `price`, `imageLink`) VALUES
(1, 'Realme Buds Air 3 Neo', 'Auriculares Inalambricos, Controlador dinámico de Graves de 10 mm, Dolby Atmos Calidad de Sonido Superior, Cancelación de Ruido ENC con IA,Resistencia al Agua IPX5', '29.99', 'https://m.media-amazon.com/images/I/51Fi0gfNoeL._AC_SL1500_.jpg'),
(2, 'TOZO T10', 'Auriculares Bluetooth IPX8 Impermeable Bluetooth 5.3 In Ear inalámbricos con Estuche de Carga y micrófono, Sonido Premium con Graves Profundos para Correr y Hacer Deporte', '32.99', 'https://m.media-amazon.com/images/I/61NknmwhtXL._AC_SL1500_.jpg'),
(3, 'JBL TUNE 230NC TWS', 'Auriculares inalámbricos In Ear True Wireless Bluetooth IPX4 con micrófono incorporado para música, deportes y llamadas, hasta 40h de batería', '79.99', 'https://m.media-amazon.com/images/I/61nan8OOchL._AC_SL1500_.jpg'),
(4, 'Xiaomi Redmi Buds 3 Lite', 'Seguro y cómodo | Duración de la batería hasta 18 horas | Conexión simplificada al dispositivo | Bluetooth 5.2 | Calidad de sonido superior | Tecnología IP54 y resistencia al agua y al polvo', '19.99', 'https://m.media-amazon.com/images/I/51nuFLJDCvL._AC_SL1500_.jpg'),
(5, 'HUAWEI FreeBuds SE Semi-In-Ear', 'Auriculares Bluetooth 5.2 inalámbricos, Cómodos de Llevar, Diseño Premium, Sonido, 24 Horas de batería, Cancelación de Ruido en Llamadas por 2 micrófonos, Blanco', '39.99', 'https://m.media-amazon.com/images/I/41kvcHkVwsL._AC_SL1200_.jpg'),
(6, 'Jabra Elite 3', 'Auriculares inalámbricos con aislamiento de ruido, Bluetooth, 4 micrófonos integrados para un sonido personalizable y modo mono, Gris Oscuro', '49.99', 'https://m.media-amazon.com/images/I/51dxQxlMy+L._AC_SL1400_.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `birthdate` date NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `lastname`, `birthdate`, `isAdmin`) VALUES
(1, 'ricardohuaripata', 'ricardohuaripata', 'RICARDO', 'HUARIPATA', '2002-05-18', 1),
(2, 'jdanix16', 'jdanix16', 'JOSE DANIEL', 'HUARIPATA PALACIOS', '2020-08-23', 0),
(3, 'wikidot', 'wikidotwikidot', 'WIKI', 'DOT', '1992-06-04', 0),
(4, 'bernat13', 'bernat13', 'BERNAT', 'COSTA', '2022-12-07', 0),
(5, 'goyo16', 'goyo16goyo16', 'GREGORIO', 'ROMERO', '2022-12-19', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkDetallePedido` (`idPedido`),
  ADD KEY `fkProductoPedido` (`idProducto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkUsuarioPedido` (`idUsuario`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fkDetallePedido` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `fkProductoPedido` FOREIGN KEY (`idProducto`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fkUsuarioPedido` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
