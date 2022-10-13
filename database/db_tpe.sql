-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2022 a las 16:26:13
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tpe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `industry` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`, `industry`, `category`) VALUES
(1, 'Rei Verde', 'Brasilera', 'Yerbas'),
(2, 'Canarias', 'Uruguaya', 'Yerbas'),
(3, 'Sara', 'Uruguaya', 'Yerbas'),
(4, 'Stanley', 'EEUU', 'Accesorios'),
(5, 'un mate', 'Argentina', 'Accesorios'),
(34, 'Marca de prueba 2', 'Argentina', 'Prueba'),
(35, 'Marca de prueba 1', 'Argentina', 'Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `id_brand`, `description`, `price`, `img`) VALUES
(2, 'Yerba Rei Verde Tradicional', 1, 'Rendimiento: Alta duración de sabor durante su consumo.Sabor: Por su composición asegura un sabor amargo e intenso.', 700, 'img/63476a99a57ef.jpg'),
(3, 'Yerba Rei Verde Premium', 1, 'Sabor: Esta marca ofrece al paladar del consumidor un moderado sabor amargo.', 900, 'img/63476aa0203af.jpg'),
(4, 'Yerba Rei Verde Compuesta', 1, 'Composición: Cedrón, Anís, Manzanilla, Hinojo y Carqueja.  Sabor: Su composición ofrece un sabor predominante a yerba mate con un leve gusto a hierbas', 850, 'img/63476aa6a7222.jpg'),
(5, 'Yerba Rei Verde Classica', 1, 'Sabor: Moderadamente intenso, fino aroma, levemente ahumado y parejo, que perdura durante el tiempo de la infusión.', 780, 'img/63476aae97e88.jpg'),
(6, 'Yerba Rei Verde Padron Argentino', 1, 'Elaborada con blend de hojas gruesas que brindadn equilibrio y rendimineto, hojas finas proporcionando intensidad y sabor, polvo para generar cuerpo y un agregado de 20% de palo que estructura la ceba', 820, 'img/63476ab5c263f.jpg'),
(7, 'Yerba Canarias 1KG', 2, 'Sabor: Por su composición asegura un sabor amargo e intenso, propio de la yerba mate CANARIAS.', 1000, 'img/63476abfefe3e.jpg'),
(8, 'Yerba Canarias 500GR', 2, 'Sabor: Por su composición asegura un sabor amargo e intenso, propio de la yerba mate CANARIAS.', 600, 'img/63476ac5c7d32.jpg'),
(9, 'Yerba Sara Tradicional 1KG', 3, 'Alta durabilidad en espuma y consistente en sabor.', 780, 'img/63476ad0b2675.jpg'),
(10, 'Yerba Sara Compuesta 1KG', 3, 'Está compuesta por Yerba Sara, Melisa, Manzanilla y Jengibre. Esta sumatoria de yuyos, es una combinación perfecta que ayuda a prevenir y reparar inconvenientes digestivos.', 810, 'img/63476ad8b9420.jpg'),
(11, 'Yerba Sara Extra Suave 1KG', 3, 'La Yerba con el mejor perfil de sabor, que también tiene durabilidad en el mate. Bajo porcentaje de mateína.', 850, 'img/63476aec35cdd.jpg'),
(12, 'Termo Stanley Clasico 1 L verde', 4, 'Diseño elegante, construcción robusta y una actitud indescriptible. Totalmente a prueba de fugas y capaz de mantener las bebidas calientes o frías durante 24 horas o con hielo durante 120 horas', 10300, ''),
(13, 'Termo Stanley Clasico 1 L verde', 4, 'Diseño elegante, construcción robusta y una actitud indescriptible. Totalmente a prueba de fugas y capaz de mantener las bebidas calientes o frías durante 24 horas o con hielo durante 120 horas', 10300, ''),
(14, 'Termo Stanley Clasico 1.4 L negro', 4, 'Diseño elegante, construcción robusta y una actitud indescriptible. Totalmente a prueba de fugas y capaz de mantener las bebidas calientes o frías durante 24 horas o con hielo durante 120 horas', 12300, ''),
(15, 'Termo Stanley Adventure 739 ML blanco', 4, 'Diseño elegante, construcción robusta y una actitud indescriptible. Totalmente a prueba de fugas y capaz de mantener las bebidas calientes o frías durante 24 horas o con hielo durante 120 horas,', 7000, ''),
(16, 'Mate Stanley negro 236 ML', 4, 'El mate Stanley mantiene la temperatura durante toda la cebada. Es práctico e higiénico. Dimensiones: 11cm de alto x 10cm de diametro. Color: negro', 3000, 'img/63476b340f995.jpg'),
(17, 'Mate Stanley verde 236 ML', 4, 'El mate Stanley mantiene la temperatura durante toda la cebada. Es práctico e higiénico. Dimensiones: 11cm de alto x 10cm de diametro Color: verde', 3000, 'img/63476b3c40a57.jpg'),
(18, 'Mate Stanley rojo 236 ML', 4, 'El mate Stanley mantiene la temperatura durante toda la cebada. Es práctico e higiénico. Dimensiones: 11cm de alto x 10cm de diametro Color: rojo', 3000, 'img/63476b44042a2.jpg'),
(19, 'Bombilla Spoon verde', 4, 'Su diseño fue pensado para garantizar la mejor filtración de la yerba y su boquilla más ancha para garantizar un mejor flujo y comodidad al beber. Largo: 18,9 cm', 2500, 'img/63476b4baeda9.jpg'),
(20, 'Bombilla Spring verde', 4, 'Su diseño fue pensado para garantizar la mejor filtración de la yerba y su boquilla más ancha para garantizar un mejor flujo y comodidad al beber. Largo: 18,9 cm', 2500, 'img/63476b5328a53.jpg'),
(21, 'Set matero', 5, 'Incluye: Mate de Acero Inoxidable, Bombilla de Acero Inoxidable, Bolso Matero y Yerbera', 18000, 'img/63476b83b096b.jpg'),
(22, 'Bolso matero Militar', 5, 'Material: Cordura. Dimensiones: 39 cm x 29 cm x 15 cm', 10000, 'img/63476b6bef3f0.jpg'),
(23, 'Bolso matero Black', 5, 'Material: Cordura. Dimensiones: 39 cm x 29 cm x 15 cm', 10000, 'img/63476b76c6cc9.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'admin@admin.com', '$2a$12$DvsTDLzjxueyPWfbszgIM.OscyNZaPEVYCa4LKC8duchmL4EVYJQ6'),
(2, 'hola@hola.com', '$2a$12$Fj3eHsuwYUg8JTtEzRwQH.I1EIlswLXPRXE7IeFgkshrs2OQ8GxqC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_brand` (`id_brand`) USING BTREE;

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `brands` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
