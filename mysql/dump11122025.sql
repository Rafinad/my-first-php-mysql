-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_has_form`
--

DROP TABLE IF EXISTS `category_has_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_has_form` (
  `category_category_id` int NOT NULL,
  `form_idform` int NOT NULL,
  PRIMARY KEY (`category_category_id`,`form_idform`),
  KEY `fk_category_has_form_form1_idx` (`form_idform`),
  KEY `fk_category_has_form_category1_idx` (`category_category_id`),
  CONSTRAINT `fk_category_has_form_category1` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `fk_category_has_form_form1` FOREIGN KEY (`form_idform`) REFERENCES `form` (`idform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_has_form`
--

LOCK TABLES `category_has_form` WRITE;
/*!40000 ALTER TABLE `category_has_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_has_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_type`
--

DROP TABLE IF EXISTS `content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_type` (
  `idcontent_type` int NOT NULL,
  `content_type` varchar(45) NOT NULL,
  PRIMARY KEY (`idcontent_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_type`
--

LOCK TABLES `content_type` WRITE;
/*!40000 ALTER TABLE `content_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form` (
  `idform` int NOT NULL,
  `formcol` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `excerpt` varchar(45) DEFAULT NULL,
  `content_body` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `published_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `content_type_idcontent_type` int NOT NULL,
  PRIMARY KEY (`idform`),
  KEY `fk_form_content_type1_idx` (`content_type_idcontent_type`),
  CONSTRAINT `fk_form_content_type1` FOREIGN KEY (`content_type_idcontent_type`) REFERENCES `content_type` (`idcontent_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_has_tag`
--

DROP TABLE IF EXISTS `form_has_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_has_tag` (
  `form_idform` int NOT NULL,
  `tag_idtag` int NOT NULL,
  PRIMARY KEY (`form_idform`,`tag_idtag`),
  KEY `fk_form_has_tag_tag1_idx` (`tag_idtag`),
  KEY `fk_form_has_tag_form1_idx` (`form_idform`),
  CONSTRAINT `fk_form_has_tag_form1` FOREIGN KEY (`form_idform`) REFERENCES `form` (`idform`),
  CONSTRAINT `fk_form_has_tag_tag1` FOREIGN KEY (`tag_idtag`) REFERENCES `tag` (`idtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_has_tag`
--

LOCK TABLES `form_has_tag` WRITE;
/*!40000 ALTER TABLE `form_has_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_has_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_has_user`
--

DROP TABLE IF EXISTS `form_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_has_user` (
  `form_idform` int NOT NULL,
  `user_user_id` int NOT NULL,
  PRIMARY KEY (`form_idform`,`user_user_id`),
  KEY `fk_form_has_user_user1_idx` (`user_user_id`),
  KEY `fk_form_has_user_form1_idx` (`form_idform`),
  CONSTRAINT `fk_form_has_user_form1` FOREIGN KEY (`form_idform`) REFERENCES `form` (`idform`),
  CONSTRAINT `fk_form_has_user_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_has_user`
--

LOCK TABLES `form_has_user` WRITE;
/*!40000 ALTER TABLE `form_has_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group` (
  `group_id` int NOT NULL,
  `name_group` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `post_UNIQUE` (`name_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
INSERT INTO `Group` VALUES (1,'Администраторы'),(4,'Гости'),(2,'Модераторы'),(5,'Писатели'),(3,'Пользователи');
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_has_Permissions`
--

DROP TABLE IF EXISTS `Group_has_Permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group_has_Permissions` (
  `Group_idpriority` int NOT NULL,
  `Permissions_idPermissions` int NOT NULL,
  PRIMARY KEY (`Group_idpriority`,`Permissions_idPermissions`),
  KEY `fk_Group_has_Permissions_Permissions1_idx` (`Permissions_idPermissions`),
  KEY `fk_Group_has_Permissions_Group1_idx` (`Group_idpriority`),
  CONSTRAINT `fk_Group_has_Permissions_Group1` FOREIGN KEY (`Group_idpriority`) REFERENCES `Group` (`group_id`),
  CONSTRAINT `fk_Group_has_Permissions_Permissions1` FOREIGN KEY (`Permissions_idPermissions`) REFERENCES `Permissions` (`idPermissions`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_has_Permissions`
--

LOCK TABLES `Group_has_Permissions` WRITE;
/*!40000 ALTER TABLE `Group_has_Permissions` DISABLE KEYS */;
INSERT INTO `Group_has_Permissions` VALUES (3,1),(4,1),(5,2),(5,3),(2,4),(5,4),(1,5),(3,6),(1,7),(2,7),(1,8),(1,9),(2,10);
/*!40000 ALTER TABLE `Group_has_Permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permissions`
--

DROP TABLE IF EXISTS `Permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Permissions` (
  `idPermissions` int NOT NULL,
  `Permission` varchar(255) NOT NULL,
  PRIMARY KEY (`idPermissions`),
  UNIQUE KEY `Permissionscol_UNIQUE` (`Permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permissions`
--

LOCK TABLES `Permissions` WRITE;
/*!40000 ALTER TABLE `Permissions` DISABLE KEYS */;
INSERT INTO `Permissions` VALUES (7,'Доступ к статистике'),(10,'Модерация контента'),(6,'Написание комментариев'),(8,'Настройки системы'),(3,'Редактирование статей'),(2,'Создание статей'),(4,'Удаление статей'),(9,'Управление категориями'),(5,'Управление пользователями'),(1,'Чтение статей');
/*!40000 ALTER TABLE `Permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `idstatus` int NOT NULL,
  `status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Активный'),(2,'Не активирован'),(3,'Заблокирован'),(4,'Не активный');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `idtag` int NOT NULL,
  `tag_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `surname` varchar(225) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` date NOT NULL,
  `last_login` date DEFAULT NULL,
  `status_idstatus` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login_UNIQUE` (`username`),
  UNIQUE KEY `e-mail_UNIQUE` (`email`),
  KEY `fk_user_status1_idx` (`status_idstatus`),
  CONSTRAINT `fk_user_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ivanov_ai','hashed_password123','Иван','Иванов','ivanov@example.com','2024-01-15','2024-01-15',4),(2,'petrova_ma','secure_pass456','Мария','Петрова','petrova@example.com','2024-02-20','2025-12-07',1),(3,'sidorov_vs','qwerty789','Владимир','Сидоров','sidorov@example.com','2024-03-10',NULL,2),(4,'kuznetsova_ea','password2024','Елена','Кузнецова','kuznetsova@example.com','2024-04-05','2025-03-07',3),(5,'smirnov_di','winter2024','Дмитрий','Смирнов','new.email@mail.ru','2024-05-22','2025-03-08',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_Group`
--

DROP TABLE IF EXISTS `user_has_Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_Group` (
  `user_user_id` int NOT NULL,
  `Group_group_id` int NOT NULL,
  PRIMARY KEY (`user_user_id`,`Group_group_id`),
  KEY `fk_user_has_Group_Group1_idx` (`Group_group_id`),
  KEY `fk_user_has_Group_user1_idx` (`user_user_id`),
  CONSTRAINT `fk_user_has_Group_Group1` FOREIGN KEY (`Group_group_id`) REFERENCES `Group` (`group_id`),
  CONSTRAINT `fk_user_has_Group_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_Group`
--

LOCK TABLES `user_has_Group` WRITE;
/*!40000 ALTER TABLE `user_has_Group` DISABLE KEYS */;
INSERT INTO `user_has_Group` VALUES (1,1),(1,2),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `user_has_Group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-11 16:25:14
