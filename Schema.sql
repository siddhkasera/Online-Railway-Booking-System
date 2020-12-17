CREATE DATABASE IF NOT EXISTS `Schema` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Schema`;

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

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin`(
  `adminuser` varchar(30) NOT NULL,
  `adminpass` varchar(30) NOT NULL,
  `ssn` varchar(9) NOT NULL,
  `first name` varchar(25) DEFAULT NULL,
  `last name` varchar(25) DEFAULT NULL,
  primary key(`adminuser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer`(
  `customeruser` varchar(30) NOT NULL,
  `email` varchar(45) DEFAULT NULL, 
  `first name` varchar(25) DEFAULT NULL,
  `last name` varchar(25) DEFAULT NULL, 
  `customerpass` varchar(45) NOT NULL, 
  primary key(`customeruser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `customerrep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerrep`(
	`repuser` varchar(30) NOT NULL,
	`reppass` varchar(30) NOT NULL,
    	`ssn` varchar(9) NOT NULL,
   	`first name` varchar(25) DEFAULT NULL,
	`last name` varchar(25) DEFAULT NULL, 
	primary key(`repuser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train`(
`trainId` int NOT NULL,
primary key(`trainId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station`(
  `stationId` int NOT NULL,
  `state` varchar(12) NOT NULL,
  `name` varchar(21) NOT NULL,
  `city` varchar(15) NOT NULL,
  primary key(`stationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` ( 
  `reservation no.`int NOT NULL, 
  `tripType` enum('oneway', 'roundtrip') NOT NULL,
  `date` date NOT NULL, 
  `passenger`varchar(50), 
  `totalFare` double DEFAULT NULL,
  `discount_group` enum('Senior', 'Child', 'Disabled', 'Normal') NOT NULL,
  primary key(`reservation no.`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserves` (
`customeruser` varchar(30) NOT NULL,
`reservation no.` int NOT NULL,
primary key(`customeruser`, `reservation no.`),
foreign key(`customeruser`) References `customer`(`customeruser`),
foreign key(`reservation no.`) References `reservation`(`reservation no.`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `transitLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transitLine`(
`tlName` varchar(30) NOT NULL,
`origin` int NOT NULL,
`destination` int NOT NULL,
`fixed fare` double NOT NULL,
primary key(`tlName`),
foreign key (`origin`) References `station`(`stationId`),
foreign key (`destination`) References `station`(`stationId`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Transit_line_stations`;
/*!40101 SET @saved_cs_client  = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transit_line_stations`(
`stationId` int NOT NULL,
`tlName` varchar(30) NOT NULL,
primary key(`stationId`, `tlName`),
foreign key (`stationId`) References `station` (`stationId`),
foreign key (`tlName`) References `transitLine` (`tlName`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Train_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Train_line`(
`trainId` int NOT NULL,
`tlName` varchar(30) NOT NULL,
primary key(`trainId`, `tlName`),
foreign key (`trainId`) References `train` (`trainId`),
foreign key (`tlName`) References `transitLine` (`tlName`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  `Schedule`(
`sched_id`  int NOT NULL AUTO_INCREMENT,
`dept_time` datetime NOT NULL,
`arrv_time` datetime NOT NULL,
`trav_time` datetime NOT NULL,
primary key(`sched_id`)
)ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Transit_line_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  `Transit_line_route`(
`tlName` varchar(30) NOT NULL,
`stopNum` int NOT NULL,
`origin` int NOT NULL,
`dest` int NOT NULL,
primary key(`tlName`,`stopNum`),
foreign key (`origin`) References `station`(`stationID`),
foreign key (`dest`) References `station`(`stationID`),
foreign key (`tlName`) References `transitLine`(`tlName`)
)ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Reserve_train_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  `Reserve_train_schedule`(
`reservation no.`int NOT NULL, 
`sched_id`  int NOT NULL,
primary key(`reservation no.`, `sched_id`),
foreign key (`reservation no.`) References `reservation` (`reservation no.`),
foreign key (`sched_id`) References `Schedule` (`sched_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
insert into `customer`(`customeruser`, `email`, `first name`, `last name`, `customerpass`) VALUES
('siddhik', 'siddhi@gmail.com', 'Siddhi', 'Kasera', 'smk345'),
('heeraln', 'heeral@gmail.com', 'Heeral', 'Narkhede', 'nhr43'),
('johns', 'john@gmail.com', 'John', 'Smith', 'js78'),
('JillJ', 'jill@gmail.com', 'Jill', 'Jillaker', 'jj90'),
('jackw', 'jack@gmail.com', 'Jack', 'Williams', 'jw422'),
('emilyj', 'emily@gmail.com', 'Emily', 'Jones', 'ej888');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
Insert into `admin`(`adminuser`, `adminpass`,`ssn`, `first name`, `last name`) VALUES
('mia333', 'ma1122', '111-11111', 'Mia','Jones'),
('hp909', 'had990','222-22222', 'Harper','Brown'),
('vy888', 'vicy888', '333-33333','Victoria', 'Young');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `customerrep` WRITE;
/*!40000 ALTER TABLE `customerrep` DISABLE KEYS */;
INSERT INTO `customerrep` (`repuser`, `reppass`,`ssn`,`first name`, `last name`) VALUES	
('ma343', 'm345', '112-11111', 'Mia1', 'Jones1'),
('hp009', 'h666', '221-22111', 'Harper1', 'Brown1'),
('vy757', 'vyng433', '212-33445', 'Victoria2', 'Young5');
/*!40000 ALTER TABLE `customerrep` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train`(trainId) VALUES (100),(101),(102),(103),(104),(105),(106),(107),(108),(109);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station`(`stationId`,`state`, `name`, `city`) VALUES
(11, 'NJ' ,'Metropark', 'Woodbridge')
,(12,'NJ','Metuchen','Middlesex')
,(13,'NJ','Edison','Edison')
,(14,'NJ','New Brunswick', 'New Brunswick')
,(15,'NJ','Dunellen','Middlesex')
,(16,'NJ','Bound Brook','Somerset')
,(17,'NJ','Bridgewater','Somerset')
,(18,'NJ','Somerville','Somerset')
,(19,'NJ','Newark Intl Airport','Newark')
,(20,'NJ','Princeton Junction','Princeton')
,(21,'NJ','Trenton','Trenton')
,(22,'NJ','Philadelphia','Philadelphia')
,(23,'NJ','Secaucus Junction','Secaucus')
,(24,'NJ','Harrison','Hudson')
,(25,'NJ','Elizabeth','Elizabeth');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

#NOT FINISHED NOT FINISHED
LOCK TABLES `Transit_line_route` WRITE;
/*!40000 ALTER TABLE `Transit_line_route` DISABLE KEYS */;
#basically the path each transit line takes
INSERT INTO `Transit_line_route`(`tlName`,`stopNum`,`origin`,`dest`) VALUES
('Northeast Corridor', 1, 11, 12),
('Northeast Corridor', 2, 12, 13),
('Northeast Corridor', 3, 13, 14),
('Northeast Corridor', 4, 14, 13),
('Northeast Corridor', 5, 13, 12),
('Northeast Corridor', 6, 12, 11);
/*
('Raritan Valley Line', 1, 11, 12),
('Raritan Valley Line', 1, 11, 12),
('Raritan Valley Line', 1, 11, 12),
('Raritan Valley Line', 1, 11, 12),
*/
/*!40000 ALTER TABLE `Transit_line_route` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
INSERT INTO `Schedule`(`sched_id`, `dept_time`, `arrv_time`, `trav_time`) VALUES
 (1001,'8:20','8:41', 21)
,(1002,'8:41','8:55', 14)
,(1003,'8:55','9:35', 40)
,(1004,'9:35','10:00', 25)
,(1005,'11:00','11:25', 25)
,(1006,'11:25','12:05', 40)
,(1007,'12:05','12:19', 24)
,(1008,'12:19','12:40', 19)
,(1009,'15:47','16:11', 17)
,(1010,'16:11','16:22', 11)
,(1011,'16:22','16:55', 33)
,(1012,'16:55','17:27', 28)
,(1013,'20:00','20:22', 22);
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `transitLine` WRITE;
/*!40000 ALTER TABLE `transitLine` DISABLE KEYS */;
INSERT INTO `transitLine`(`tlName`, `origin`, `destination`, `fixed fare`) VALUES
('Northeast Corridor', 11, 14, 2.0),
('Raritan Valley Line', 15, 18, 3.0),
('Keystone Service', 19, 22, 5.0),
('North Jersey Coastline', 23, 25,3.0);
/*!40000 ALTER TABLE `transitLine` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
Insert into `reservation` (`reservation no.`, `tripType`, `date`, `passenger`,`totalFare`, `discount_group`) VALUES
(111, 'oneway', '10-08-2020', 'Siddhi', 12.0, 'Normal'),
(222, 'oneway', '11-09-2020', 'Heeral', 34.0, 'Normal'),
(333, 'roundtrip', '01-09-2020','John', 24.0, 'Senior'),
(444, 'roundtrip', '05-05-2020', 'Jack', 17.0, 'Child');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;


/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
