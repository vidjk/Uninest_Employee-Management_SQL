-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (x86_64)
--
-- Host: localhost    Database: UniNest
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (511,'Present'),(512,'Leave'),(513,'Earned Leave'),(514,'Sick Leave'),(515,'Business Trip'),(516,'Present'),(517,'Leave'),(518,'Earned Leave'),(519,'Sick Leave'),(520,'Business Trip');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'People and Culture'),(2,'Sales'),(3,'Retail Design and Merchandising'),(4,'Customer Relations'),(5,'Logistics'),(6,'IT');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_businesstrip_view`
--

DROP TABLE IF EXISTS `employee_businesstrip_view`;
/*!50001 DROP VIEW IF EXISTS `employee_businesstrip_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_businesstrip_view` AS SELECT 
 1 AS `employee_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `manager_name`,
 1 AS `attendance_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_department_view`
--

DROP TABLE IF EXISTS `employee_department_view`;
/*!50001 DROP VIEW IF EXISTS `employee_department_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_department_view` AS SELECT 
 1 AS `employee_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `department_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee_salary`
--

DROP TABLE IF EXISTS `employee_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_salary` (
  `salary_id` int NOT NULL,
  `salary_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salary`
--

LOCK TABLES `employee_salary` WRITE;
/*!40000 ALTER TABLE `employee_salary` DISABLE KEYS */;
INSERT INTO `employee_salary` VALUES (301,60000.00),(302,80000.00),(303,50000.00),(304,90000.00),(305,45000.00),(306,85000.00),(307,55000.00),(308,75000.00),(309,47000.00),(310,95000.00);
/*!40000 ALTER TABLE `employee_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `salary_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `attendance_id` int DEFAULT NULL,
  `months_worked` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `role_id` (`role_id`),
  KEY `manager_id` (`manager_id`),
  KEY `salary_id` (`salary_id`),
  KEY `attendance_id` (`attendance_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`manager_id`),
  CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`salary_id`) REFERENCES `employee_salary` (`salary_id`),
  CONSTRAINT `employees_ibfk_5` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (11001,'John','Doe',1,'People and Culture',101,31,301,'2023-01-15','2023-12-31',511,11),(11002,'Jane','Smith',3,'Retail Design and Merchandising',102,32,302,'2023-01-20','2023-10-31',512,10),(11003,'Alice','Johnson',1,'People and Culture',103,33,303,'2023-04-01','2023-12-31',513,6),(11004,'Bob','Brown',6,'IT',104,34,304,'2023-07-01','2023-12-31',514,5),(11005,'Charlie','Davis',5,'Logistics',105,35,305,'2023-06-01','2023-12-31',515,4),(11006,'Dana','Evans',4,'Customer Relations',105,36,306,'2023-04-01','2023-12-31',516,6),(11007,'Eve','Foster',3,'Retail Design and Merchandising',106,37,307,'2023-02-15','2023-12-31',517,8),(11008,'Frank','Green',2,'Sales',106,38,308,'2023-03-01','2023-12-31',518,7),(11009,'Gina','Harris',5,'Logistics',107,39,309,'2023-01-20','2023-12-31',519,11),(11010,'Hank','Ives',2,'Sales',108,40,310,'2023-02-15','2023-12-31',520,10);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employeestatus`
--

DROP TABLE IF EXISTS `employeestatus`;
/*!50001 DROP VIEW IF EXISTS `employeestatus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeestatus` AS SELECT 
 1 AS `employee_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `department_name`,
 1 AS `manager_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(100) NOT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `managers_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (31,'John Doe',1),(32,'Jane Smith',3),(33,'Alice Johnson',1),(34,'Bob Brown',6),(35,'Charlie Davis',5),(36,'Dana Evans',4),(37,'Eve Foster',3),(38,'Frank Green',2),(39,'Gina Harris',5),(40,'Hank Ives',2);
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (101,'PC Manager'),(102,'RD Manager'),(103,'Talent Specialist'),(104,'IT Project Manager'),(105,'Logistics Manager'),(106,'CR Manager'),(107,'Retail Designer'),(108,'Sales Coworker'),(109,'Inventory Coworker'),(110,'Loyalty Commercial Leader');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `employee_businesstrip_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_businesstrip_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_businesstrip_view` AS select `e`.`employee_id` AS `employee_id`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`m`.`manager_name` AS `manager_name`,`a`.`status` AS `attendance_status` from ((`employees` `e` join `managers` `m` on((`e`.`manager_id` = `m`.`manager_id`))) join `attendance` `a` on((`e`.`attendance_id` = `a`.`attendance_id`))) where (`a`.`status` = 'Business Trip') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_department_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_department_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_department_view` AS select `e`.`employee_id` AS `employee_id`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`d`.`department_name` AS `department_name` from (`employees` `e` join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeestatus`
--

/*!50001 DROP VIEW IF EXISTS `employeestatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeestatus` AS select `e`.`employee_id` AS `employee_id`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`d`.`department_name` AS `department_name`,`m`.`manager_name` AS `manager_name` from (((`employees` `e` join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) join `managers` `m` on((`e`.`manager_id` = `m`.`manager_id`))) join `attendance` `a` on((`e`.`attendance_id` = `a`.`attendance_id`))) where (`a`.`status` = 'Present') */;
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

-- Dump completed on 2024-05-26 22:34:40
