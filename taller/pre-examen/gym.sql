CREATE DATABASE  IF NOT EXISTS `gym` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gym`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: gym
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `Clases`
--

DROP TABLE IF EXISTS `Clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clases` (
  `ClaseID` int NOT NULL AUTO_INCREMENT,
  `NombreClase` varchar(100) DEFAULT NULL,
  `Descripcion` text,
  `Capacidad` int DEFAULT NULL,
  PRIMARY KEY (`ClaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clases`
--

LOCK TABLES `Clases` WRITE;
/*!40000 ALTER TABLE `Clases` DISABLE KEYS */;
INSERT INTO `Clases` VALUES (1,'Yoga','Clase de Yoga para todos los niveles',20),(2,'Spinning','Intensa clase de ciclismo indoor',15),(3,'Pilates','Mejora tu flexibilidad y fuerza',10),(4,'Crossfit','Entrenamiento de alta intensidad',12);
/*!40000 ALTER TABLE `Clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Miembros`
--

DROP TABLE IF EXISTS `Miembros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Miembros` (
  `MiembroID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `FechaDeNacimiento` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `FechaDeInicio` date DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MiembroID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Miembros`
--

LOCK TABLES `Miembros` WRITE;
/*!40000 ALTER TABLE `Miembros` DISABLE KEYS */;
INSERT INTO `Miembros` VALUES (1,'Juan','Pérez','1990-03-15','juan.perez@example.com','555-1234','2024-01-01',1),(2,'María','López','1985-07-22','maria.lopez@example.com','555-5678','2024-01-15',1),(3,'Carlos','Martínez','1976-05-30','carlos.martinez@example.com','555-8765','2024-02-01',1),(4,'Laura','Hernández','1995-12-12','laura.hernandez@example.com','555-4321','2024-02-20',1);
/*!40000 ALTER TABLE `Miembros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegistroClases`
--

DROP TABLE IF EXISTS `RegistroClases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RegistroClases` (
  `RegistroID` int NOT NULL AUTO_INCREMENT,
  `ClaseID` int DEFAULT NULL,
  `MiembroID` int DEFAULT NULL,
  `FechaClase` date DEFAULT NULL,
  `Asistio` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RegistroID`),
  KEY `ClaseID` (`ClaseID`),
  KEY `MiembroID` (`MiembroID`),
  CONSTRAINT `registroclases_ibfk_1` FOREIGN KEY (`ClaseID`) REFERENCES `Clases` (`ClaseID`),
  CONSTRAINT `registroclases_ibfk_2` FOREIGN KEY (`MiembroID`) REFERENCES `Miembros` (`MiembroID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegistroClases`
--

LOCK TABLES `RegistroClases` WRITE;
/*!40000 ALTER TABLE `RegistroClases` DISABLE KEYS */;
INSERT INTO `RegistroClases` VALUES (1,1,1,'2024-04-01',1),(2,2,1,'2024-04-03',1),(3,1,2,'2024-04-01',0),(4,3,3,'2024-04-02',1),(5,4,4,'2024-04-03',1),(6,2,2,'2024-04-03',1);
/*!40000 ALTER TABLE `RegistroClases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suscripciones`
--

DROP TABLE IF EXISTS `Suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suscripciones` (
  `SuscripcionID` int NOT NULL AUTO_INCREMENT,
  `MiembroID` int DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Tarifa` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SuscripcionID`),
  KEY `MiembroID` (`MiembroID`),
  CONSTRAINT `suscripciones_ibfk_1` FOREIGN KEY (`MiembroID`) REFERENCES `Miembros` (`MiembroID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suscripciones`
--

LOCK TABLES `Suscripciones` WRITE;
/*!40000 ALTER TABLE `Suscripciones` DISABLE KEYS */;
INSERT INTO `Suscripciones` VALUES (5,1,'2024-01-01','2025-01-01',300.00),(6,2,'2024-01-15','2025-01-15',320.00),(7,3,'2024-02-01','2025-02-01',350.00),(8,4,'2024-02-20','2025-02-20',280.00);
/*!40000 ALTER TABLE `Suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visitas`
--

DROP TABLE IF EXISTS `Visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Visitas` (
  `VisitaID` int NOT NULL AUTO_INCREMENT,
  `MiembroID` int DEFAULT NULL,
  `FechaHoraVisita` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`VisitaID`),
  KEY `MiembroID` (`MiembroID`),
  CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`MiembroID`) REFERENCES `Miembros` (`MiembroID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visitas`
--

LOCK TABLES `Visitas` WRITE;
/*!40000 ALTER TABLE `Visitas` DISABLE KEYS */;
INSERT INTO `Visitas` VALUES (1,1,'2024-04-01 13:00:00'),(2,2,'2024-04-01 13:15:00'),(3,3,'2024-04-01 13:30:00'),(4,1,'2024-04-02 14:00:00'),(5,2,'2024-04-02 14:15:00'),(6,4,'2024-04-02 15:00:00');
/*!40000 ALTER TABLE `Visitas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-24 14:38:14
