-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2015 a las 11:39:53
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `marchadeportiva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorías`
--

CREATE TABLE IF NOT EXISTS `categorías` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `categorías`
--

INSERT INTO `categorías` (`id`, `nombre`) VALUES
(1, 'Futbol'),
(2, 'Baloncesto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE IF NOT EXISTS `clasificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `liga_id` int(11) NOT NULL,
  `puntos` int(3) DEFAULT NULL,
  `partidos_jugados` int(3) DEFAULT NULL,
  `partidos_ganados` int(3) DEFAULT NULL,
  `partidos_empatados` int(3) DEFAULT NULL,
  `partidos_perdidos` int(3) DEFAULT NULL,
  `goles_fuera` int(4) DEFAULT NULL,
  `goles_en_casa` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `liga_id` (`liga_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id`, `team_id`, `liga_id`, `puntos`, `partidos_jugados`, `partidos_ganados`, `partidos_empatados`, `partidos_perdidos`, `goles_fuera`, `goles_en_casa`) VALUES
(2, 1, 1, 5, 2, 1, 0, 1, 2, 1),
(3, 2, 1, 3, 2, 0, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronicas`
--

CREATE TABLE IF NOT EXISTS `cronicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cronica` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cronicas`
--

INSERT INTO `cronicas` (`id`, `cronica`) VALUES
(1, 'ccronica del partido 1'),
(2, 'cronica del partido 2'),
(3, 'cronica del partido 3'),
(4, 'cronica del partido 4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE IF NOT EXISTS `deportes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`id`, `categoria_id`, `descripcion`) VALUES
(1, 1, 'Futbol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE IF NOT EXISTS `equipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `localizacion` int(11) DEFAULT NULL,
  `deporte_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `localizacion` (`localizacion`),
  KEY `deporte_id` (`deporte_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `localizacion`, `deporte_id`) VALUES
(1, 'puerto cruz', 1, 1),
(2, 'orotaba fc', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE IF NOT EXISTS `jornada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temporada_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `num_jornada` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `temporada_id` (`temporada_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `jornada`
--

INSERT INTO `jornada` (`id`, `temporada_id`, `fecha`, `num_jornada`) VALUES
(1, 2, '2015-04-06 11:37:39', 2),
(2, 2, '2015-04-04 11:37:50', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ligas`
--

CREATE TABLE IF NOT EXISTS `ligas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deporte` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `sistema_puntuacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deporte` (`deporte`),
  KEY `puntuaciones_id` (`sistema_puntuacion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ligas`
--

INSERT INTO `ligas` (`id`, `deporte`, `descripcion`, `sistema_puntuacion_id`) VALUES
(1, 1, 'Liga Cadete', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizacion`
--

CREATE TABLE IF NOT EXISTS `localizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `lon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `localizacion`
--

INSERT INTO `localizacion` (`id`, `descripcion`, `lat`, `lon`) VALUES
(1, 'estadio puerto de la cruz', NULL, NULL),
(2, 'estado la orotaba', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE IF NOT EXISTS `partido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jornada_id` int(11) NOT NULL,
  `eq_local_id` int(11) NOT NULL,
  `eq_visitante_id` int(11) NOT NULL,
  `localizacion` int(11) DEFAULT NULL,
  `score_local` int(4) NOT NULL,
  `score_visitante` int(4) NOT NULL,
  `cronica_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jornada_id` (`jornada_id`),
  KEY `cronica_id` (`cronica_id`),
  KEY `eq_local_id` (`eq_local_id`),
  KEY `eq_visitante_id` (`eq_visitante_id`),
  KEY `localizacion` (`localizacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `partido`
--

INSERT INTO `partido` (`id`, `jornada_id`, `eq_local_id`, `eq_visitante_id`, `localizacion`, `score_local`, `score_visitante`, `cronica_id`) VALUES
(2, 1, 1, 2, NULL, 2, 1, 1),
(3, 2, 2, 1, NULL, 0, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_puntuacion`
--

CREATE TABLE IF NOT EXISTS `sistema_puntuacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `puntos_ganar` int(2) NOT NULL,
  `puntos_perder` int(2) NOT NULL,
  `puntos_empate` int(2) NOT NULL,
  `ordenamiento` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sistema_puntuacion`
--

INSERT INTO `sistema_puntuacion` (`id`, `nombre`, `puntos_ganar`, `puntos_perder`, `puntos_empate`, `ordenamiento`) VALUES
(1, 'sistema uno', 3, 0, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadas`
--

CREATE TABLE IF NOT EXISTS `temporadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `id_liga` int(11) NOT NULL,
  `id_clasificacion` int(11) DEFAULT NULL,
  `num_jornadas` tinyint(2) NOT NULL,
  `num_vueltas` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_temporada_id` (`num_jornadas`),
  KEY `id_liga` (`id_liga`),
  KEY `id_clasificacion` (`id_clasificacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `temporadas`
--

INSERT INTO `temporadas` (`id`, `descripcion`, `id_liga`, `id_clasificacion`, `num_jornadas`, `num_vueltas`) VALUES
(2, '2014/2015', 1, 2, 20, 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD CONSTRAINT `clasificacion_ibfk_3` FOREIGN KEY (`liga_id`) REFERENCES `ligas` (`id`),
  ADD CONSTRAINT `clasificacion_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `equipos` (`id`);

--
-- Filtros para la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD CONSTRAINT `deportes_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorías` (`id`);

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`localizacion`) REFERENCES `localizacion` (`id`),
  ADD CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`deporte_id`) REFERENCES `deportes` (`id`);

--
-- Filtros para la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD CONSTRAINT `jornada_ibfk_1` FOREIGN KEY (`temporada_id`) REFERENCES `temporadas` (`id`);

--
-- Filtros para la tabla `ligas`
--
ALTER TABLE `ligas`
  ADD CONSTRAINT `ligas_ibfk_1` FOREIGN KEY (`deporte`) REFERENCES `deportes` (`id`),
  ADD CONSTRAINT `ligas_ibfk_2` FOREIGN KEY (`sistema_puntuacion_id`) REFERENCES `sistema_puntuacion` (`id`);

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `partido_ibfk_5` FOREIGN KEY (`localizacion`) REFERENCES `localizacion` (`id`),
  ADD CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`jornada_id`) REFERENCES `jornada` (`id`),
  ADD CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`cronica_id`) REFERENCES `cronicas` (`id`),
  ADD CONSTRAINT `partido_ibfk_3` FOREIGN KEY (`eq_local_id`) REFERENCES `equipos` (`id`),
  ADD CONSTRAINT `partido_ibfk_4` FOREIGN KEY (`eq_visitante_id`) REFERENCES `equipos` (`id`);

--
-- Filtros para la tabla `temporadas`
--
ALTER TABLE `temporadas`
  ADD CONSTRAINT `temporadas_ibfk_2` FOREIGN KEY (`id_liga`) REFERENCES `ligas` (`id`),
  ADD CONSTRAINT `temporadas_ibfk_3` FOREIGN KEY (`id_clasificacion`) REFERENCES `clasificacion` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
