-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: beibe
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Higiene','2022-08-30 13:34:25'),(2,'Pele','2022-08-31 18:16:54');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamado`
--

DROP TABLE IF EXISTS `chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `texto` text NOT NULL,
  `cliente_id` int NOT NULL,
  `finalizado` timestamp NULL DEFAULT NULL,
  `criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `PRODUTO_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CHAMAD_CLIENTE` (`cliente_id`),
  CONSTRAINT `FK_CHAMAD_CLIENTE` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado`
--

LOCK TABLES `chamado` WRITE;
/*!40000 ALTER TABLE `chamado` DISABLE KEYS */;
INSERT INTO `chamado` VALUES (11,'Atraso na entrega dos meus produtos','Comprei o Shampoo a cerca de 16 dias e o prazo de entrega era 7, gostaria que me respondessem a razão da demora!',3,'2022-09-15 20:27:12','2022-09-15 20:24:25',22),(12,'Pomada de Pele com Defeito','Olá, a pomada de pele que comprei com vocês não trouxe nenhum resultado positivo, gostaria de receber meu dinheiro de volta!',4,NULL,'2022-09-15 20:28:55',27),(13,'Pedido Incompleto','Olá, solicitei a entrega de 2 frascos de ômega 3, entretanto vieram 3. A cobrança foi feita sobre os dois que eu pedi somente, gostaria de saber oq devo fazer com o que veio a mais!',5,'2022-09-15 21:36:09','2022-09-15 20:32:27',25),(14,'Desodorante ótimo','Este desodorante é muito bom, parabéns pelo produto!',4,NULL,'2022-09-15 22:02:23',23),(15,'Shampoo muito oleoso','Não gostei do shampoo, achei ele muito oleoso!',6,NULL,'2022-09-16 00:00:21',22);
/*!40000 ALTER TABLE `chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `sobrenome` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `senha` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,'Anderson','Silva','silva@email.com','35b4a90f8fc290069416e6860a0a16d590276522574b9f7805e7e0e1c4025cfb'),(4,'Alessandra','Vieira','ale@email.com','46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5'),(5,'Gabriel','Esqueci','gabi@email.com','46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5'),(6,'Fernando','Dias','dias@email.com','46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `sobrenome` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (6,'Ricardo','Filho','ricardo@email.com','46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5',1),(7,'Felipe','Kazuo','kazuo@email.com','46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5',1),(8,'Teste','Cobaia','teste@email.com','46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5',0);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `preco` decimal(10,0) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `validade` date NOT NULL,
  `saldo` int NOT NULL,
  `categoria_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (22,'Shampoo',12,'2022-09-15 20:19:25','2022-09-15',150,1),(23,'Desodorante',9,'2022-09-15 20:19:57','2022-09-15',500,1),(24,'Óleo de cocô',15,'2022-09-15 20:20:50','2022-09-15',500,2),(25,'Ômega 3',16,'2022-09-15 20:21:14','2022-09-15',500,1),(26,'Mantega de Cacau',2,'2022-09-15 20:21:34','2022-09-15',500,1),(27,'Pomada de Pele',4,'2022-09-15 20:22:07','2022-09-15',100,2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resposta`
--

DROP TABLE IF EXISTS `resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resposta` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `texto` text NOT NULL,
  `funcionario_id` int DEFAULT NULL,
  `criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `chamado_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RESP_FUNC` (`funcionario_id`),
  KEY `chamado_id` (`chamado_id`),
  CONSTRAINT `FK_RESP_FUNC` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`ID`),
  CONSTRAINT `resposta_ibfk_1` FOREIGN KEY (`chamado_id`) REFERENCES `chamado` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resposta`
--

LOCK TABLES `resposta` WRITE;
/*!40000 ALTER TABLE `resposta` DISABLE KEYS */;
INSERT INTO `resposta` VALUES (54,'Aguardo a Resposta!',NULL,'2022-09-15 20:24:34',11),(55,'Olá Anderson, isso é um problema com a trasnportadora, entraremos em contato para ver se conseguimos solucionar da melhor forma possível!',6,'2022-09-15 20:26:08',11),(56,'Se devo devolver ou não. Não quero pagar pelo que veio a mais!',NULL,'2022-09-15 20:32:47',13),(57,'Aguardando a resposta!',NULL,'2022-09-15 20:50:59',12),(58,'Olá Gabriel, fique tranquilo, como foi nossa falha poderá ficar com o produto e não precisará pagar a diferença!',8,'2022-09-15 21:36:06',13),(59,'Olá, ficamos muito tristes de você não ter gostado de nosso produto, infelizmente já passou o prazo para devolvermos seu dinheiro!',8,'2022-09-15 23:24:50',12);
/*!40000 ALTER TABLE `resposta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-15 21:06:47
