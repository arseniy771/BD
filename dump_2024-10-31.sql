ng data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (201,'Павел','Москва',300,105),(202,'Мария','Новосибирск',100,101),(203,'Анна','Пермь',100,NULL),(204,'Михаил','Курск',200,104),(205,'Никита','Казань',300,109),(206,'Олег','Барнаул',100,106),(208,'Николай','Тула',200,101),(209,'Виктор','Иркутск',100,104);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (101,'202','2024-09-12',531.10),(101,'205','2024-09-12',1050.99),(101,'206','2024-10-01',35.00),(102,'202','2024-05-22',3455.11),(102,'209','2024-03-25',54.99),(104,'203','2024-05-26',101.90),(104,'205','2024-03-12',743.10),(104,'208','2024-02-25',990.99),(105,'202','2024-07-13',1500.23),(105,'203','2024-02-27',133.11),(106,'208','2024-08-19',30000.10),(109,'203','2024-04-15',1600.76),(109,'205','2024-08-22',1323.11);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `salespeople`
--

LOCK TABLES `salespeople` WRITE;
/*!40000 ALTER TABLE `salespeople` DISABLE KEYS */;
INSERT INTO `salespeople` VALUES (101,'Иванов','Москва',0.10),(102,'Смирнов','Новосибирск',0.09),(104,'Кузнецов','Алматы',0.09),(105,'Попов','Омск',0.11),(106,'Васильев','Сочи',0.11),(109,'Петров','Владивосток',0.07);
/*!40000 ALTER TABLE `salespeople` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-31 10:27:49
