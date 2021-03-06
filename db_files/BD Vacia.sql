-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: empty_dnd
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amigo`
--

DROP TABLE IF EXISTS `amigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amigo` (
  `usuario1` int(10) unsigned NOT NULL,
  `usuario2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`usuario1`,`usuario2`),
  KEY `usuario2_idx` (`usuario2`),
  CONSTRAINT `usuario1` FOREIGN KEY (`usuario1`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario2` FOREIGN KEY (`usuario2`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amigo`
--

LOCK TABLES `amigo` WRITE;
/*!40000 ALTER TABLE `amigo` DISABLE KEYS */;
/*!40000 ALTER TABLE `amigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `bloqueador` int(10) unsigned NOT NULL,
  `bloqueado` int(10) unsigned NOT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`bloqueador`,`bloqueado`),
  KEY `bloqueador_idx` (`bloqueado`),
  CONSTRAINT `bloqueado` FOREIGN KEY (`bloqueado`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bloqueador` FOREIGN KEY (`bloqueador`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias`
--

DROP TABLE IF EXISTS `dias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dias` (
  `dia_id` int(10) unsigned NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias`
--

LOCK TABLES `dias` WRITE;
/*!40000 ALTER TABLE `dias` DISABLE KEYS */;
/*!40000 ALTER TABLE `dias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foro`
--

DROP TABLE IF EXISTS `foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foro` (
  `foro_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` date DEFAULT current_timestamp(),
  `descr` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`foro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foro`
--

LOCK TABLES `foro` WRITE;
/*!40000 ALTER TABLE `foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `foro_info`
--

DROP TABLE IF EXISTS `foro_info`;
/*!50001 DROP VIEW IF EXISTS `foro_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `foro_info` AS SELECT 
 1 AS `foro_id`,
 1 AS `nombre`,
 1 AS `grupo_id`,
 1 AS `grupo_nombre`,
 1 AS `descr`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `friends_score`
--

DROP TABLE IF EXISTS `friends_score`;
/*!50001 DROP VIEW IF EXISTS `friends_score`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `friends_score` AS SELECT 
 1 AS `usuario1`,
 1 AS `usuario2`,
 1 AS `login`,
 1 AS `promedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `g_manual`
--

DROP TABLE IF EXISTS `g_manual`;
/*!50001 DROP VIEW IF EXISTS `g_manual`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `g_manual` AS SELECT 
 1 AS `grupo_id`,
 1 AS `manual_id`,
 1 AS `manual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `group_info`
--

DROP TABLE IF EXISTS `group_info`;
/*!50001 DROP VIEW IF EXISTS `group_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `group_info` AS SELECT 
 1 AS `grupo_id`,
 1 AS `Nombre`,
 1 AS `owner`,
 1 AS `miembros_actuales`,
 1 AS `limite_miembros`,
 1 AS `hora_inicio`,
 1 AS `hora_final`,
 1 AS `zona_horaria`,
 1 AS `descr`,
 1 AS `rules`,
 1 AS `dias`,
 1 AS `modulo_id`,
 1 AS `modulo`,
 1 AS `activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `group_lenght`
--

DROP TABLE IF EXISTS `group_lenght`;
/*!50001 DROP VIEW IF EXISTS `group_lenght`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `group_lenght` AS SELECT 
 1 AS `lenght`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `grupo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dm` int(10) unsigned NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `miembros_actuales` int(11) DEFAULT 0,
  `limite_miembros` int(11) DEFAULT 6,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `zona_horaria` int(11) NOT NULL,
  `dias_por_semana` int(11) NOT NULL,
  `fecha_creacion` date DEFAULT current_timestamp(),
  `modulo` int(10) unsigned NOT NULL,
  `descr` varchar(150) DEFAULT NULL,
  `rules` varchar(300) DEFAULT NULL,
  `activo` int(11) DEFAULT 1,
  PRIMARY KEY (`grupo_id`,`dm`,`zona_horaria`,`modulo`),
  UNIQUE KEY `grupo_id_UNIQUE` (`grupo_id`),
  KEY `dm_idx` (`dm`),
  KEY `zona_horaria_idx` (`zona_horaria`),
  KEY `modulo_idx` (`modulo`),
  CONSTRAINT `dm` FOREIGN KEY (`dm`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `modulo` FOREIGN KEY (`modulo`) REFERENCES `modulo` (`modulo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zona_horaria` FOREIGN KEY (`zona_horaria`) REFERENCES `zona_horaria` (`zona_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_dias`
--

DROP TABLE IF EXISTS `grupo_dias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_dias` (
  `grupo_id` int(10) unsigned NOT NULL,
  `dia` int(10) unsigned NOT NULL,
  PRIMARY KEY (`grupo_id`,`dia`),
  KEY `dia_grupo_id_idx` (`dia`),
  CONSTRAINT `dia_grupo_id` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grupo_id_dia` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`grupo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_dias`
--

LOCK TABLES `grupo_dias` WRITE;
/*!40000 ALTER TABLE `grupo_dias` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_dias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_foro`
--

DROP TABLE IF EXISTS `grupo_foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_foro` (
  `grupo_id` int(10) unsigned NOT NULL,
  `foro_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`grupo_id`,`foro_id`),
  KEY `fk_foro_grupo_idx` (`foro_id`),
  CONSTRAINT `fk_foro_grupo` FOREIGN KEY (`foro_id`) REFERENCES `foro` (`foro_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_grupo_foro` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`grupo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_foro`
--

LOCK TABLES `grupo_foro` WRITE;
/*!40000 ALTER TABLE `grupo_foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `grupo_integrantes`
--

DROP TABLE IF EXISTS `grupo_integrantes`;
/*!50001 DROP VIEW IF EXISTS `grupo_integrantes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `grupo_integrantes` AS SELECT 
 1 AS `grupo_id`,
 1 AS `miembros`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grupo_manual`
--

DROP TABLE IF EXISTS `grupo_manual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_manual` (
  `grupo_id` int(10) unsigned NOT NULL,
  `manual_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`grupo_id`,`manual_id`),
  KEY `manual_grupo_id_idx` (`manual_id`),
  CONSTRAINT `grupo_manual_id` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`grupo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manual_grupo_id` FOREIGN KEY (`manual_id`) REFERENCES `manual` (`manual_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_manual`
--

LOCK TABLES `grupo_manual` WRITE;
/*!40000 ALTER TABLE `grupo_manual` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_manual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_usuario`
--

DROP TABLE IF EXISTS `grupo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_usuario` (
  `grupo_id` int(10) unsigned NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`grupo_id`,`usuario_id`),
  KEY `fk_usuario_grupo_idx` (`usuario_id`),
  CONSTRAINT `fk_grupo_usuario` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`grupo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_grupo` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_usuario`
--

LOCK TABLES `grupo_usuario` WRITE;
/*!40000 ALTER TABLE `grupo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `grupos_y_manuales`
--

DROP TABLE IF EXISTS `grupos_y_manuales`;
/*!50001 DROP VIEW IF EXISTS `grupos_y_manuales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `grupos_y_manuales` AS SELECT 
 1 AS `grupo_id`,
 1 AS `Nombre`,
 1 AS `owner`,
 1 AS `miembros_actuales`,
 1 AS `limite_miembros`,
 1 AS `hora_inicio`,
 1 AS `hora_final`,
 1 AS `zona_horaria`,
 1 AS `descr`,
 1 AS `rules`,
 1 AS `dias`,
 1 AS `modulo_id`,
 1 AS `modulo`,
 1 AS `activo`,
 1 AS `manual_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `grupos_y_manualesf`
--

DROP TABLE IF EXISTS `grupos_y_manualesf`;
/*!50001 DROP VIEW IF EXISTS `grupos_y_manualesf`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `grupos_y_manualesf` AS SELECT 
 1 AS `usuario_id`,
 1 AS `grupo_id`,
 1 AS `Nombre`,
 1 AS `dm`,
 1 AS `owner`,
 1 AS `miembros_actuales`,
 1 AS `limite_miembros`,
 1 AS `hora_inicio`,
 1 AS `hora_final`,
 1 AS `zona_horaria`,
 1 AS `descr`,
 1 AS `rules`,
 1 AS `dias`,
 1 AS `modulo_id`,
 1 AS `usuario1`,
 1 AS `usuario2`,
 1 AS `modulo`,
 1 AS `activo`,
 1 AS `manual_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `manual`
--

DROP TABLE IF EXISTS `manual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual` (
  `manual_id` int(10) unsigned NOT NULL,
  `manual` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`manual_id`),
  UNIQUE KEY `manual_id_UNIQUE` (`manual_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual`
--

LOCK TABLES `manual` WRITE;
/*!40000 ALTER TABLE `manual` DISABLE KEYS */;
INSERT INTO `manual` VALUES (0,'Manual del Jugador'),(1,'Eberron- Rising from the Last War'),(2,'Exolorer\'s Guide to Wildemount'),(3,'Guildmasters\' Guide to Ravnica'),(4,'Acquisitions Incorporated'),(5,'Mordekaninen\'s Tome of Foes'),(6,'Mythic Odysseys of Theros'),(7,'Sword Coast Adventurer\'s Guide'),(8,'Volo\'s Guide to Monsters'),(9,'Xanathar\'s Guide to Everything');
/*!40000 ALTER TABLE `manual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `mensaje_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` int(10) unsigned NOT NULL,
  `foro_id` int(10) unsigned NOT NULL,
  `mensaje` varchar(2000) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`mensaje_id`,`usuario`,`foro_id`),
  KEY `usuario_mensaje_idx` (`usuario`),
  KEY `foro_mensaje_idx` (`foro_id`),
  CONSTRAINT `foro_mensaje` FOREIGN KEY (`foro_id`) REFERENCES `foro` (`foro_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_mensaje` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mensajes_cant`
--

DROP TABLE IF EXISTS `mensajes_cant`;
/*!50001 DROP VIEW IF EXISTS `mensajes_cant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mensajes_cant` AS SELECT 
 1 AS `foro_id`,
 1 AS `mensajes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `miembros`
--

DROP TABLE IF EXISTS `miembros`;
/*!50001 DROP VIEW IF EXISTS `miembros`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `miembros` AS SELECT 
 1 AS `grupo_id`,
 1 AS `usuario_id`,
 1 AS `miembro_login`,
 1 AS `rating`,
 1 AS `Nombre`,
 1 AS `dm`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `modulo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modulo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`modulo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Aventura Propia'),(2,'Baldur\'s Gate -  Descent into Avernus'),(3,'Curse of Strahd'),(4,'Ghost of Saltmarsh'),(5,'Hoard of the Dragon Queen'),(6,'Icewind Dale - Rime of the Frostmaiden'),(7,'Infernal Machine Rebuild'),(8,'Lost Laboratory of Kwalish'),(9,'Out of The Abyss'),(10,'Princes of the Apocalypse'),(11,'Storm\'s King Thunder'),(12,'Tales from The Yawning Portal'),(13,'The Rise of Tiamat'),(14,'Tomb Of Annihilation'),(15,'Tyranny of Dragons'),(16,'Waterdeep - Dragon Heist'),(17,'Waterdeep - Dungeon of the Mad Mage');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `msj_info`
--

DROP TABLE IF EXISTS `msj_info`;
/*!50001 DROP VIEW IF EXISTS `msj_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `msj_info` AS SELECT 
 1 AS `mensaje_id`,
 1 AS `usuario`,
 1 AS `mensaje`,
 1 AS `fecha`,
 1 AS `login`,
 1 AS `foro_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `puntaje_promedio`
--

DROP TABLE IF EXISTS `puntaje_promedio`;
/*!50001 DROP VIEW IF EXISTS `puntaje_promedio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `puntaje_promedio` AS SELECT 
 1 AS `usuario_punteado`,
 1 AS `promedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `puntuaciones`
--

DROP TABLE IF EXISTS `puntuaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntuaciones` (
  `usuario_id` int(10) unsigned NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  CONSTRAINT `fk_usuario_puntuacion` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntuaciones`
--

LOCK TABLES `puntuaciones` WRITE;
/*!40000 ALTER TABLE `puntuaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntuaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `puntuaciones_usuarios`
--

DROP TABLE IF EXISTS `puntuaciones_usuarios`;
/*!50001 DROP VIEW IF EXISTS `puntuaciones_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `puntuaciones_usuarios` AS SELECT 
 1 AS `usuario_id`,
 1 AS `login`,
 1 AS `comment`,
 1 AS `puntuacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_friends`
--

DROP TABLE IF EXISTS `user_friends`;
/*!50001 DROP VIEW IF EXISTS `user_friends`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_friends` AS SELECT 
 1 AS `usuario1`,
 1 AS `count(usuario2)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!50001 DROP VIEW IF EXISTS `user_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_info` AS SELECT 
 1 AS `usuario_id`,
 1 AS `login`,
 1 AS `img`,
 1 AS `promedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `img` blob DEFAULT NULL,
  `promedio` float DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  UNIQUE KEY `mail_UNIQUE` (`mail`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (9,'admin','qweQWE123','soyadmin@gmail.com',NULL,0,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_puntuacion`
--

DROP TABLE IF EXISTS `usuario_puntuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_puntuacion` (
  `usuario_punteador` int(10) unsigned NOT NULL,
  `usuario_punteado` int(10) unsigned NOT NULL,
  `puntaje` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`usuario_punteador`,`usuario_punteado`),
  KEY `usuario_puntuado_idx` (`usuario_punteado`),
  CONSTRAINT `usuario_puntuado` FOREIGN KEY (`usuario_punteado`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_puntuador` FOREIGN KEY (`usuario_punteador`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_puntuacion`
--

LOCK TABLES `usuario_puntuacion` WRITE;
/*!40000 ALTER TABLE `usuario_puntuacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_puntuacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona_horaria`
--

DROP TABLE IF EXISTS `zona_horaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zona_horaria` (
  `zona_id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`zona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona_horaria`
--

LOCK TABLES `zona_horaria` WRITE;
/*!40000 ALTER TABLE `zona_horaria` DISABLE KEYS */;
INSERT INTO `zona_horaria` VALUES (1,' UTC-7 '),(2,' UTC-8'),(3,'UTC-6'),(4,' UTC-5');
/*!40000 ALTER TABLE `zona_horaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'empty_dnd'
--

--
-- Dumping routines for database 'empty_dnd'
--
/*!50003 DROP FUNCTION IF EXISTS `friends_in_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `friends_in_group`(user int,grupo int) RETURNS int(11)
BEGIN
	DECLARE cant int;
    
    select count(usuario_id) INTO cant from grupo_usuario gu inner join amigo a on user = a.usuario1 
    inner join grupo g on grupo = g.grupo_id where a.usuario2 = gu.usuario_id and gu.grupo_id = user;
    
RETURN cant;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_Friend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Friend`(
IN user1 int,
IN user2 int)
BEGIN
	insert into amigo(usuario1,usuario2)
    select * from(select user1,user2) as temp
    where not exists(SELECT * from amigo where (usuario1=temp.user1 and usuario2=temp.user2)or(usuario1=temp.user2 and usuario2=temp.user1));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Blacklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Blacklist`(
IN user1 int,
IN user2 int)
BEGIN
	insert into blacklist(bloqueador,bloqueado)
    select * from(select user1,user2) as temp
    where not exists(SELECT * from amigo where bloquador=temp.user1 and bloqueado=temp.user2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Default_Manual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Default_Manual`(
IN grupo int)
BEGIN
	insert into grupo_manual(grupo_id,manual_id)
	select * from(select grupo,0) as temp
	where not exists(SELECT * from grupo_manual where(grupo_id = temp.grupo and manual_id != 0));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Enviar_mensaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Enviar_mensaje`(
IN usuario int,
IN foro int,
IN mensaje varchar(2000)
)
BEGIN
	INSERT INTO mensaje(usuario,foro_id,mensaje)values(usuario,foro,mensaje);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_friends` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_friends`(
IN user int,
IN grupo int
)
BEGIN
	 select count(usuario_id) as num  from grupo_usuario gu 
	 inner join amigo a on user = a.usuario1 
	 where gu.usuario_id = a.usuario2 and grupo_id=grupo group by grupo_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUD_foro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IUD_foro`(
IN ID int,
IN nombre varchar(45),
IN grupo int,
IN descr varchar(350),
IN instruccion varchar(45)
)
BEGIN
	IF(STRCMP(instruccion,"INSERT")=0) then
		insert into foro(nombre,descr) values(nombre,descr);
		insert into grupo_foro(grupo_id,foro_id) values(grupo,(select foro_id from foro order by foro_id desc limit 1));
		elseif(STRCMP(instruccion,"UPDATE")=0) then
			update foro set
            nombre = nombre
            where foro_id = ID;
            elseif(STRCMP(instruccion,"DELETE")=0)then
				delete from foro where foro_id = ID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUD_grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IUD_grupo`(
IN ID int,
IN DM int,
In nombre varchar(45),
IN limite_miembros int,
IN hora_inicio time,
IN hora_final time,
IN zona_horaria int,
IN dias_semana int,
IN modulo int,
IN descr varchar(150),
IN rules varchar(350),
IN instruccion varchar(10)
)
BEGIN
	IF(STRCMP(instruccion,"INSERT")=0) then
    insert into grupo(dm,Nombre,limite_miembros,hora_inicio,hora_final,zona_horaria,dias_por_semana,modulo,descr,rules)
    values(DM,nombre,limite_miembros,hora_inicio,hora_final,dias_semana,zona_horaria,modulo,descr,rules);
	elseif(STRCMP(instruccion,"UPDATE")=0) then
		update grupo set
        Nombre = nombre,
        limite_miembros = limite_miembros,
        hora_inicio = hora_inicio,
        hora_final = hora_final,
        dias_por_semana = dias_semana,
        zona_horaria = zona_horaria,
        modulo = modulo,
        descr = descr,
        rules = rules
        where grupo_id = ID;
        else
			IF(STRCMP(instruccion,"DELETE")=0)then
					delete from grupo where grupo_id = ID;
					END if;
			END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IUD_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IUD_Usuario`(
IN ID int,
IN login varchar(45),
IN pass varchar(45),
IN mail varchar(45),	
IN img blob,
IN instruccion nvarchar(10))
BEGIN
	IF(STRCMP(instruccion,"INSERT")=0) then
    insert into usuario(login,password,mail,img) values(login,pass,mail,img);
    elseif(STRCMP(instruccion,"UPDATE")=0) then
		update usuario set
        login =login,
        password = pass,
        mail = mail,
        img = img
        where usuario_id=ID;
        else
			IF(STRCMP(instruccion,"DELETE")=0)then
				delete from usuario where usuario_id = ID;
                END if;
		END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Join_Group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Join_Group`(
IN ID int,
IN user int)
BEGIN
	insert into grupo_usuario(grupo_id,usuario_id)
    select * from(select ID,user) as temp
    where not exists(SELECT * from grupo_usuario where grupo_id = temp.ID and usuario_id=temp.user);
    
    update grupo set miembros_actuales=miembros_actuales+1 where grupo_id=ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rate_page` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rate_page`(
IN user int,
IN comment varchar(500),
IN puntuacion int
)
BEGIN
	INSERT INTO puntuaciones(usuario_id,comment,puntuacion)
    values(user,comment,puntuacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Rate_Player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Rate_Player`(
IN user1 int,
IN user2 int,
IN rating int)
BEGIN
	insert into usuario_puntuacion(usuario_punteador,usuario_punteado,puntaje)
    select * from(select user1,user2,rating) as temp
    where not exists(SELECT * from usuario_puntuacion where usuario_punteador=temp.user1 and usuario_punteado=temp.user2);
    
    update usuario set promedio= (select promedio from user_info where usuario_id=user2  limit 1) where usuario_id = user2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `foro_info`
--

/*!50001 DROP VIEW IF EXISTS `foro_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `foro_info` AS select `f`.`foro_id` AS `foro_id`,`f`.`nombre` AS `nombre`,`gf`.`grupo_id` AS `grupo_id`,`g`.`Nombre` AS `grupo_nombre`,`f`.`descr` AS `descr` from ((`grupo_foro` `gf` join `foro` `f` on(`gf`.`foro_id` = `f`.`foro_id`)) join `grupo` `g` on(`gf`.`grupo_id` = `g`.`grupo_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `friends_score`
--

/*!50001 DROP VIEW IF EXISTS `friends_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `friends_score` AS select `a`.`usuario1` AS `usuario1`,`a`.`usuario2` AS `usuario2`,`u`.`login` AS `login`,`u`.`promedio` AS `promedio` from (`amigo` `a` join `usuario` `u` on(`a`.`usuario2` = `u`.`usuario_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `g_manual`
--

/*!50001 DROP VIEW IF EXISTS `g_manual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `g_manual` AS select `gm`.`grupo_id` AS `grupo_id`,`gm`.`manual_id` AS `manual_id`,`m`.`manual` AS `manual` from (`grupo_manual` `gm` join `manual` `m` on(`gm`.`manual_id` = `m`.`manual_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_info`
--

/*!50001 DROP VIEW IF EXISTS `group_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_info` AS select `g`.`grupo_id` AS `grupo_id`,`g`.`Nombre` AS `Nombre`,`u`.`login` AS `owner`,`g`.`miembros_actuales` AS `miembros_actuales`,`g`.`limite_miembros` AS `limite_miembros`,`g`.`hora_inicio` AS `hora_inicio`,`g`.`hora_final` AS `hora_final`,`z`.`region` AS `zona_horaria`,`g`.`descr` AS `descr`,`g`.`rules` AS `rules`,`g`.`dias_por_semana` AS `dias`,`m`.`modulo_id` AS `modulo_id`,`m`.`modulo` AS `modulo`,`g`.`activo` AS `activo` from (((`grupo` `g` join `usuario` `u` on(`g`.`dm` = `u`.`usuario_id`)) join `modulo` `m` on(`g`.`modulo` = `m`.`modulo_id`)) join `zona_horaria` `z` on(`g`.`zona_horaria` = `z`.`zona_id`)) order by `g`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_lenght`
--

/*!50001 DROP VIEW IF EXISTS `group_lenght`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_lenght` AS select count(`group_info`.`grupo_id`) AS `lenght` from `group_info` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grupo_integrantes`
--

/*!50001 DROP VIEW IF EXISTS `grupo_integrantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grupo_integrantes` AS select `m`.`grupo_id` AS `grupo_id`,count(`m`.`usuario_id`) AS `miembros` from `miembros` `m` group by `m`.`grupo_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grupos_y_manuales`
--

/*!50001 DROP VIEW IF EXISTS `grupos_y_manuales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grupos_y_manuales` AS select `gi`.`grupo_id` AS `grupo_id`,`gi`.`Nombre` AS `Nombre`,`gi`.`owner` AS `owner`,`gi`.`miembros_actuales` AS `miembros_actuales`,`gi`.`limite_miembros` AS `limite_miembros`,`gi`.`hora_inicio` AS `hora_inicio`,`gi`.`hora_final` AS `hora_final`,`gi`.`zona_horaria` AS `zona_horaria`,`gi`.`descr` AS `descr`,`gi`.`rules` AS `rules`,`gi`.`dias` AS `dias`,`gi`.`modulo_id` AS `modulo_id`,`gi`.`modulo` AS `modulo`,`gi`.`activo` AS `activo`,`gm`.`manual_id` AS `manual_id` from (`group_info` `gi` join `grupo_manual` `gm` on(`gi`.`grupo_id` = `gm`.`grupo_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grupos_y_manualesf`
--

/*!50001 DROP VIEW IF EXISTS `grupos_y_manualesf`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grupos_y_manualesf` AS select `m`.`usuario_id` AS `usuario_id`,`gi`.`grupo_id` AS `grupo_id`,`gi`.`Nombre` AS `Nombre`,`g`.`dm` AS `dm`,`gi`.`owner` AS `owner`,`gi`.`miembros_actuales` AS `miembros_actuales`,`gi`.`limite_miembros` AS `limite_miembros`,`gi`.`hora_inicio` AS `hora_inicio`,`gi`.`hora_final` AS `hora_final`,`gi`.`zona_horaria` AS `zona_horaria`,`gi`.`descr` AS `descr`,`gi`.`rules` AS `rules`,`gi`.`dias` AS `dias`,`gi`.`modulo_id` AS `modulo_id`,`a`.`usuario1` AS `usuario1`,`a`.`usuario2` AS `usuario2`,`gi`.`modulo` AS `modulo`,`gi`.`activo` AS `activo`,`gm`.`manual_id` AS `manual_id` from ((((`group_info` `gi` join `grupo_manual` `gm` on(`gi`.`grupo_id` = `gm`.`grupo_id`)) join `miembros` `m` on(`gi`.`grupo_id` = `m`.`grupo_id`)) join `amigo` `a` on(`m`.`usuario_id` = `a`.`usuario2`)) join `grupo` `g` on(`gi`.`grupo_id` = `g`.`grupo_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mensajes_cant`
--

/*!50001 DROP VIEW IF EXISTS `mensajes_cant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mensajes_cant` AS select `mensaje`.`foro_id` AS `foro_id`,count(`mensaje`.`mensaje_id`) AS `mensajes` from `mensaje` group by `mensaje`.`foro_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `miembros`
--

/*!50001 DROP VIEW IF EXISTS `miembros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `miembros` AS select `gu`.`grupo_id` AS `grupo_id`,`gu`.`usuario_id` AS `usuario_id`,`u`.`login` AS `miembro_login`,`u`.`promedio` AS `rating`,`g`.`Nombre` AS `Nombre`,`g`.`dm` AS `dm` from ((`grupo_usuario` `gu` join `grupo` `g` on(`gu`.`grupo_id` = `g`.`grupo_id`)) join `usuario` `u` on(`gu`.`usuario_id` = `u`.`usuario_id`)) order by `gu`.`grupo_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msj_info`
--

/*!50001 DROP VIEW IF EXISTS `msj_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msj_info` AS select `m`.`mensaje_id` AS `mensaje_id`,`m`.`usuario` AS `usuario`,`m`.`mensaje` AS `mensaje`,`m`.`fecha` AS `fecha`,`u`.`login` AS `login`,`m`.`foro_id` AS `foro_id` from (`mensaje` `m` join `usuario` `u` on(`m`.`usuario` = `u`.`usuario_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `puntaje_promedio`
--

/*!50001 DROP VIEW IF EXISTS `puntaje_promedio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `puntaje_promedio` AS select `usuario_puntuacion`.`usuario_punteado` AS `usuario_punteado`,avg(`usuario_puntuacion`.`puntaje`) AS `promedio` from `usuario_puntuacion` group by `usuario_puntuacion`.`usuario_punteado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `puntuaciones_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `puntuaciones_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `puntuaciones_usuarios` AS select `p`.`usuario_id` AS `usuario_id`,`u`.`login` AS `login`,`p`.`comment` AS `comment`,`p`.`puntuacion` AS `puntuacion` from (`puntuaciones` `p` join `usuario` `u` on(`p`.`usuario_id` = `u`.`usuario_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_friends`
--

/*!50001 DROP VIEW IF EXISTS `user_friends`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_friends` AS select `amigo`.`usuario1` AS `usuario1`,count(`amigo`.`usuario2`) AS `count(usuario2)` from `amigo` where `amigo`.`usuario1` <> `amigo`.`usuario2` group by `amigo`.`usuario1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_info`
--

/*!50001 DROP VIEW IF EXISTS `user_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_info` AS select `u`.`usuario_id` AS `usuario_id`,`u`.`login` AS `login`,`u`.`img` AS `img`,`p`.`promedio` AS `promedio` from (`usuario` `u` join `puntaje_promedio` `p` on(`u`.`usuario_id` = `p`.`usuario_punteado`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-26 23:13:37
