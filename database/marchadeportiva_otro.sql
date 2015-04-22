/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.6.16 : Database - marchadeportiva
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`marchadeportiva` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `marchadeportiva`;

/*Table structure for table `categorías` */

DROP TABLE IF EXISTS `categorías`;

CREATE TABLE `categorías` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `categorías` */

/*Table structure for table `clasificacion` */

DROP TABLE IF EXISTS `clasificacion`;

CREATE TABLE `clasificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `liga_id` int(11) NOT NULL,
  `puntos` int(11) DEFAULT NULL,
  `pj` int(11) DEFAULT NULL,
  `pg` int(11) DEFAULT NULL,
  `pe` int(11) DEFAULT NULL,
  `pp` int(11) DEFAULT NULL,
  `gf` int(11) DEFAULT NULL,
  `gc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `liga_id` (`liga_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `clasificacion_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `equipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clasificacion` */

/*Table structure for table `cronicas` */

DROP TABLE IF EXISTS `cronicas`;

CREATE TABLE `cronicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `otros datos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cronicas` */

insert  into `cronicas`(`id`,`otros datos`) values (1,'ccronica del partido 1'),(2,'cronica del partido 2'),(3,'cronica del partido 3'),(4,'cronica del partido 4');

/*Table structure for table `deportes` */

DROP TABLE IF EXISTS `deportes`;

CREATE TABLE `deportes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `deportes_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorías` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deportes` */

/*Table structure for table `equipos` */

DROP TABLE IF EXISTS `equipos`;

CREATE TABLE `equipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `localizacion` int(11) DEFAULT NULL,
  `deporte_id` int(11) DEFAULT NULL,
  `otros datos` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `localizacion` (`localizacion`),
  KEY `deporte_id` (`deporte_id`),
  CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`localizacion`) REFERENCES `localizacion` (`id`),
  CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`deporte_id`) REFERENCES `deportes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `equipos` */

/*Table structure for table `jornada` */

DROP TABLE IF EXISTS `jornada`;

CREATE TABLE `jornada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temporada_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `num_jornada` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `temporada_id` (`temporada_id`),
  CONSTRAINT `jornada_ibfk_1` FOREIGN KEY (`temporada_id`) REFERENCES `temporadas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jornada` */

/*Table structure for table `ligas` */

DROP TABLE IF EXISTS `ligas`;

CREATE TABLE `ligas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deporte` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo_liga_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deporte` (`deporte`),
  KEY `puntuaciones_id` (`tipo_liga_id`),
  CONSTRAINT `ligas_ibfk_1` FOREIGN KEY (`deporte`) REFERENCES `deportes` (`id`),
  CONSTRAINT `ligas_ibfk_2` FOREIGN KEY (`tipo_liga_id`) REFERENCES `tipo_liga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ligas` */

/*Table structure for table `localizacion` */

DROP TABLE IF EXISTS `localizacion`;

CREATE TABLE `localizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `localizacion` */

/*Table structure for table `partido` */

DROP TABLE IF EXISTS `partido`;

CREATE TABLE `partido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jornada_id` int(11) NOT NULL,
  `eq_local_id` int(11) NOT NULL,
  `eq_visitante_id` int(11) NOT NULL,
  `localizacion` int(11) DEFAULT NULL,
  `score_local` int(11) NOT NULL,
  `score_visitante` int(11) NOT NULL,
  `cronica_id` int(11) DEFAULT NULL,
  `otros datos del partido` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `localizacion` (`localizacion`),
  KEY `jornada_id` (`jornada_id`),
  KEY `cronica_id` (`cronica_id`),
  KEY `eq_local_id` (`eq_local_id`),
  KEY `eq_visitante_id` (`eq_visitante_id`),
  CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`jornada_id`) REFERENCES `jornada` (`id`),
  CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`cronica_id`) REFERENCES `cronicas` (`id`),
  CONSTRAINT `partido_ibfk_3` FOREIGN KEY (`eq_local_id`) REFERENCES `equipos` (`id`),
  CONSTRAINT `partido_ibfk_4` FOREIGN KEY (`eq_visitante_id`) REFERENCES `equipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `partido` */

/*Table structure for table `temporadas` */

DROP TABLE IF EXISTS `temporadas`;

CREATE TABLE `temporadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(10) NOT NULL,
  `id_liga` int(11) NOT NULL,
  `id_clasificacion` int(11) DEFAULT NULL,
  `tipo_temporada_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_temporada_id` (`tipo_temporada_id`),
  KEY `id_liga` (`id_liga`),
  KEY `id_clasificacion` (`id_clasificacion`),
  CONSTRAINT `temporadas_ibfk_1` FOREIGN KEY (`tipo_temporada_id`) REFERENCES `tipo_temporada` (`id`),
  CONSTRAINT `temporadas_ibfk_2` FOREIGN KEY (`id_liga`) REFERENCES `ligas` (`id`),
  CONSTRAINT `temporadas_ibfk_3` FOREIGN KEY (`id_clasificacion`) REFERENCES `clasificacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `temporadas` */

/*Table structure for table `tipo_liga` */

DROP TABLE IF EXISTS `tipo_liga`;

CREATE TABLE `tipo_liga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `puntos_ganar` int(1) NOT NULL,
  `puntos_perder` int(1) NOT NULL,
  `puntos_empate` int(1) NOT NULL,
  `ordenamiento` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_liga` */

/*Table structure for table `tipo_temporada` */

DROP TABLE IF EXISTS `tipo_temporada`;

CREATE TABLE `tipo_temporada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `num_jornadas` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_temporada` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
