-- MySQL dump 10.13  Distrib 8.1.0, for macos13 (x86_64)
--
-- Host: 127.0.0.1    Database: wings
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Juan Pérez','555-0101'),(2,'María López','555-0102'),(3,'Carlos Jiménez','555-0103'),(4,'Laura Martínez','555-0104'),(5,'José Rodríguez','555-0105'),(6,'Ana Fernández','555-0106'),(7,'David García','555-0107'),(8,'Carmen Díaz','555-0108'),(9,'Fernando Morales','555-0109'),(10,'Isabel Gutiérrez','555-0110'),(11,'Miguel Ángel Sánchez','555-0111'),(12,'Susana Alonso','555-0112'),(13,'Ricardo Reyes','555-0113'),(14,'Elena Torres','555-0114'),(15,'Pablo Domínguez','555-0115'),(16,'Beatriz Ruiz','555-0116'),(17,'Jorge Navarro','555-0117'),(18,'Sonia Hernández','555-0118'),(19,'Manuel Romero','555-0119'),(20,'Lucía López','555-0120');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetallesDelPedido`
--

DROP TABLE IF EXISTS `DetallesDelPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DetallesDelPedido` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `fk_product_id` (`ProductID`),
  CONSTRAINT `detallesdelpedido_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Pedidos` (`OrderID`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`ProductID`) REFERENCES `InventarioDeAlitas` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetallesDelPedido`
--

LOCK TABLES `DetallesDelPedido` WRITE;
/*!40000 ALTER TABLE `DetallesDelPedido` DISABLE KEYS */;
INSERT INTO `DetallesDelPedido` VALUES (1,1,1,3,0.75),(2,1,2,2,0.80),(3,2,2,1,0.80),(4,2,3,1,0.85),(5,3,1,4,0.75),(6,3,4,1,0.65),(7,4,5,2,0.60),(8,4,1,1,0.75),(9,5,3,2,0.85),(10,5,2,3,0.80),(11,6,5,1,0.60),(12,6,1,2,0.75),(13,7,4,3,0.65),(14,8,2,4,0.80),(15,9,1,1,0.75),(16,9,3,1,0.85),(17,10,4,1,0.65),(18,11,5,2,0.60),(19,12,2,3,0.80),(20,12,1,1,0.75),(21,13,3,2,0.85),(22,14,5,3,0.60),(23,15,4,1,0.65),(24,16,3,2,0.85),(25,17,2,4,0.80),(26,18,1,1,0.75),(27,19,4,1,0.65),(28,20,5,2,0.60);
/*!40000 ALTER TABLE `DetallesDelPedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InventarioDeAlitas`
--

DROP TABLE IF EXISTS `InventarioDeAlitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InventarioDeAlitas` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) DEFAULT NULL,
  `QuantityAvailable` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InventarioDeAlitas`
--

LOCK TABLES `InventarioDeAlitas` WRITE;
/*!40000 ALTER TABLE `InventarioDeAlitas` DISABLE KEYS */;
INSERT INTO `InventarioDeAlitas` VALUES (1,'Alitas Picantes',150,0.75),(2,'Alitas BBQ',200,0.80),(3,'Alitas Teriyaki',120,0.85),(4,'Alitas a la Parrilla',100,0.65),(5,'Alitas Sin Salsa',80,0.60);
/*!40000 ALTER TABLE `InventarioDeAlitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedidos`
--

DROP TABLE IF EXISTS `Pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedidos` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Clientes` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedidos`
--

LOCK TABLES `Pedidos` WRITE;
/*!40000 ALTER TABLE `Pedidos` DISABLE KEYS */;
INSERT INTO `Pedidos` VALUES (1,1,'2024-05-01',22.50),(2,2,'2024-05-01',19.00),(3,3,'2024-05-01',20.95),(4,4,'2024-05-02',25.00),(5,5,'2024-05-02',30.75),(6,6,'2024-05-02',45.50),(7,7,'2024-05-03',22.00),(8,8,'2024-05-03',18.50),(9,9,'2024-05-03',37.00),(10,10,'2024-05-04',15.00),(11,11,'2024-05-04',22.50),(12,12,'2024-05-05',17.25),(13,13,'2024-05-05',34.75),(14,14,'2024-05-06',48.25),(15,15,'2024-05-06',52.00),(16,16,'2024-05-07',26.75),(17,17,'2024-05-07',33.50),(18,18,'2024-05-07',42.00),(19,19,'2024-05-08',28.25),(20,20,'2024-05-08',23.00);
/*!40000 ALTER TABLE `Pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VentasDiarias`
--

DROP TABLE IF EXISTS `VentasDiarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VentasDiarias` (
  `SaleID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `SaleDate` date DEFAULT NULL,
  `TotalSaleAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `ventasdiarias_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Pedidos` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VentasDiarias`
--

LOCK TABLES `VentasDiarias` WRITE;
/*!40000 ALTER TABLE `VentasDiarias` DISABLE KEYS */;
INSERT INTO `VentasDiarias` VALUES (1,1,'2024-05-01',22.50),(2,2,'2024-05-01',19.00),(3,3,'2024-05-01',20.95),(4,4,'2024-05-02',25.00),(5,5,'2024-05-02',30.75),(6,6,'2024-05-02',45.50),(7,7,'2024-05-03',22.00),(8,8,'2024-05-03',18.50),(9,9,'2024-05-03',37.00),(10,10,'2024-05-04',15.00),(11,11,'2024-05-04',22.50),(12,12,'2024-05-05',17.25),(13,13,'2024-05-05',34.75),(14,14,'2024-05-06',48.25),(15,15,'2024-05-06',52.00),(16,16,'2024-05-07',26.75),(17,17,'2024-05-07',33.50),(18,18,'2024-05-07',42.00),(19,19,'2024-05-08',28.25),(20,20,'2024-05-08',23.00);
/*!40000 ALTER TABLE `VentasDiarias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 13:29:45
