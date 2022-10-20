-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 192.168.1.139    Database: ejercicio2_UD14
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `clave_autor` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`clave_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `clave_editorial` smallint NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`clave_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplar`
--

DROP TABLE IF EXISTS `ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejemplar` (
  `clave_ejemplar` int NOT NULL,
  `clave_libro` int DEFAULT NULL,
  `numero_orden` smallint DEFAULT NULL,
  `edicion` smallint DEFAULT NULL,
  `ubicacion` varchar(15) DEFAULT NULL,
  `categoria` char(1) DEFAULT NULL,
  PRIMARY KEY (`clave_ejemplar`),
  KEY `clave_libro` (`clave_libro`),
  CONSTRAINT `ejemplar_ibfk_1` FOREIGN KEY (`clave_libro`) REFERENCES `libro` (`clave_libro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplar`
--

LOCK TABLES `ejemplar` WRITE;
/*!40000 ALTER TABLE `ejemplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escrito_por`
--

DROP TABLE IF EXISTS `escrito_por`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escrito_por` (
  `clave_libro` int NOT NULL,
  `clave_autor` int NOT NULL,
  KEY `clave_libro` (`clave_libro`),
  KEY `clave_autor` (`clave_autor`),
  CONSTRAINT `escrito_por_ibfk_1` FOREIGN KEY (`clave_libro`) REFERENCES `libro` (`clave_libro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `escrito_por_ibfk_2` FOREIGN KEY (`clave_autor`) REFERENCES `autor` (`clave_autor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escrito_por`
--

LOCK TABLES `escrito_por` WRITE;
/*!40000 ALTER TABLE `escrito_por` DISABLE KEYS */;
/*!40000 ALTER TABLE `escrito_por` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `clave_libro` int NOT NULL,
  `titulo` varchar(60) DEFAULT NULL,
  `idioma` varchar(15) DEFAULT NULL,
  `formato` varchar(15) DEFAULT NULL,
  `clave_editorial` smallint DEFAULT NULL,
  PRIMARY KEY (`clave_libro`),
  KEY `clave_editorial` (`clave_editorial`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`clave_editorial`) REFERENCES `editorial` (`clave_editorial`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `clave_socio` int DEFAULT NULL,
  `clave_ejemplar` int DEFAULT NULL,
  `numero_orden` smallint DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `notas` blob,
  KEY `clave_socio` (`clave_socio`),
  KEY `clave_ejemplar` (`clave_ejemplar`),
  CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`clave_socio`) REFERENCES `socio` (`clave_socio`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`clave_ejemplar`) REFERENCES `ejemplar` (`clave_ejemplar`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `clave_socio` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `categoria` char(1) DEFAULT NULL,
  PRIMARY KEY (`clave_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarata_sobre`
--

DROP TABLE IF EXISTS `tarata_sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarata_sobre` (
  `clave_libro` int DEFAULT NULL,
  `clave_tema` smallint DEFAULT NULL,
  KEY `clave_libro` (`clave_libro`),
  KEY `clave_tema` (`clave_tema`),
  CONSTRAINT `tarata_sobre_ibfk_1` FOREIGN KEY (`clave_libro`) REFERENCES `libro` (`clave_libro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tarata_sobre_ibfk_2` FOREIGN KEY (`clave_tema`) REFERENCES `tema` (`clave_tema`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarata_sobre`
--

LOCK TABLES `tarata_sobre` WRITE;
/*!40000 ALTER TABLE `tarata_sobre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarata_sobre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema` (
  `clave_tema` smallint NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`clave_tema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-18 15:51:12
