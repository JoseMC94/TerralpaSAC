CREATE DATABASE  IF NOT EXISTS `terralpasac` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `terralpasac`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: terralpasac
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistencia` (
  `idAsistencia` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` datetime NOT NULL,
  `Usuarios_dni` int(11) NOT NULL,
  PRIMARY KEY (`idAsistencia`),
  KEY `fk_Asistencia_Usuarios1_idx` (`Usuarios_dni`),
  CONSTRAINT `fk_Asistencia_Usuarios1` FOREIGN KEY (`Usuarios_dni`) REFERENCES `usuarios` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (76543454,'Natalia','Candela Champión','natalia@gmail.com','Mariategui 345',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultacliente`
--

DROP TABLE IF EXISTS `consultacliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultacliente` (
  `idConsulta` int(11) NOT NULL,
  `obs` varchar(120) NOT NULL,
  `Documento_idDocumento` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idConsulta`),
  KEY `fk_consultaCliente_Documento1_idx` (`Documento_idDocumento`),
  CONSTRAINT `fk_consultaCliente_Documento1` FOREIGN KEY (`Documento_idDocumento`) REFERENCES `documento` (`idDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultacliente`
--

LOCK TABLES `consultacliente` WRITE;
/*!40000 ALTER TABLE `consultacliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultacliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `idDocumento` int(11) NOT NULL,
  `nombreProyecto` varchar(45) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Cliente_dni` int(11) NOT NULL,
  `Usuarios_dni` int(11) NOT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `fk_Documento_Cliente1_idx` (`Cliente_dni`),
  KEY `fk_Documento_Usuarios1_idx` (`Usuarios_dni`),
  CONSTRAINT `fk_Documento_Cliente1` FOREIGN KEY (`Cliente_dni`) REFERENCES `cliente` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Documento_Usuarios1` FOREIGN KEY (`Usuarios_dni`) REFERENCES `usuarios` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (0,'Construcción Sol','Construccion Casa',76543454,70905469);
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentoe`
--

DROP TABLE IF EXISTS `documentoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentoe` (
  `idDocumentoE` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  PRIMARY KEY (`idDocumentoE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentoe`
--

LOCK TABLES `documentoe` WRITE;
/*!40000 ALTER TABLE `documentoe` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentoe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentor`
--

DROP TABLE IF EXISTS `documentor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentor` (
  `idDocumentoR` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  PRIMARY KEY (`idDocumentoR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentor`
--

LOCK TABLES `documentor` WRITE;
/*!40000 ALTER TABLE `documentor` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguimiento` (
  `idSeguimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `udestino` varchar(45) NOT NULL,
  `uenvio` varchar(45) NOT NULL,
  `obs` varchar(45) NOT NULL,
  `Documento_nombreDocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`idSeguimiento`),
  KEY `fk_Seguimiento_Documento_idx` (`Documento_nombreDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento`
--

LOCK TABLES `seguimiento` WRITE;
/*!40000 ALTER TABLE `seguimiento` DISABLE KEYS */;
INSERT INTO `seguimiento` VALUES (1,'2005-06-17','Farfan Ochatoma, Maria Magdalena','michael.medrano','holi','Construcción Sol'),(2,'2012-07-17','Farfan Ochatoma, Maria Magdalena','jose.maldonado','pasar atastrodocumento','documeto'),(14,'2005-06-17','Medrano Cardenas, Michael','Maldonado Candela, Jose Antonio','','ConstrucciÃ³n Sol'),(15,'2005-06-17','Medrano Cardenas, Michael','Maldonado Candela, Jose Antonio','','ConstrucciÃ³n Sol'),(16,'2005-06-17','Farfan Ochatoma, Maria Magdalena','Maldonado Candela, Jose Antonio','','ConstrucciÃ³n Sol'),(17,'2005-06-17','Medrano Cardenas, Michael','Maldonado Candela, Jose Antonio','','Construcción Sol'),(18,'2005-06-17','Farfan Ochatoma, Maria Magdalena','Maldonado Candela, Jose Antonio',':C ','Construcción Sol'),(19,'2005-06-17','Medrano Cardenas, Michael','Farfan Ochatoma, Maria Magdalena','','null'),(20,'2005-06-17','Medrano Cardenas, Michael','Maldonado Candela, Jose Antonio','','Construcción Sol'),(21,'2005-06-17','Medrano Cardenas, Michael','Maldonado Candela, Jose Antonio','xxxxxxxxxxxx','Construcción Sol');
/*!40000 ALTER TABLE `seguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `dni` int(11) NOT NULL,
  `nombreApellido` varchar(120) NOT NULL,
  `usuario` varchar(120) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (12121212,'Medrano Cardenas, Michael','michael.medrano','111111','usuario'),(12345673,'Farfan Ochatoma, Maria Magdalena','maria.farfan','123456','usuario'),(70905469,'Maldonado Candela, Jose Antonio','jose.maldonado','123456','administrador');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-26  7:14:47
