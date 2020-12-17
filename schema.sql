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
   	`firstname` varchar(25) DEFAULT NULL,
	`lastname` varchar(25) DEFAULT NULL, 
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
`transit-line-name` varchar(30) NOT NULL,
`origin` int NOT NULL,
`destination` int NOT NULL,
`fixed fare` double NOT NULL,
primary key(`transit-line-name`),
foreign key (`origin`) References `station`(`stationId`),
foreign key (`destination`) References `station`(`stationId`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Transit_line_stations`;
/*!40101 SET @saved_cs_client  = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transit_line_stations`(
`stationId` int NOT NULL,
`transit-line-name` varchar(30) NOT NULL,
primary key(`stationId`, `transit-line-name`),
foreign key (`stationId`) References `station` (`stationId`),
foreign key (`transit-line-name`) References `transitLine` (`transit-line-name`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Train_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Train_line`(
`trainId` int NOT NULL,
`transit-line-name` varchar(30) NOT NULL,
primary key(`trainId`, `transit-line-name`),
foreign key (`trainId`) References `train` (`trainId`),
foreign key (`transit-line-name`) References `transitLine` (`transit-line-name`)
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
`transit-line-name` varchar(30) NOT NULL,
`stopNum` int NOT NULL,
`origin` int NOT NULL,
`dest` int NOT NULL,
`dept_time` datetime NOT NULL,
`arrv_time` datetime NOT NULL,
primary key(`transit-line-name`,`stopNum`),
foreign key (`origin`) References `station`(`stationID`),
foreign key (`dest`) References `station`(`stationID`),
foreign key (`transit-line-name`) References `transitLine`(`transit-line-name`)
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

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages`(
	`messageId` int NOT NULL AUTO_INCREMENT,
	`customeruser` varchar(30) NOT NULL,
    `repuser` varchar(30) NOT NULL,
    `subject` varchar(150) NOT NULL,
    `content` varchar(500) DEFAULT NULL,
    `answer` varchar(500) DEFAULT NULL,
    primary key(`messageId`, `customeruser`, `repuser`),
    foreign key (`customeruser`) References `customer`(`customeruser`),
    foreign key(`repuser`) References `customerrep`(`repuser`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
    
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
Insert into `admin`(`adminuser`, `adminpass`) VALUES
('hi333', 'hi1122');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `customerrep` WRITE;
/*!40000 ALTER TABLE `customerrep` DISABLE KEYS */;
INSERT INTO `customerrep` (`repuser`, `reppass`,`ssn`,`firstname`, `lastname`) VALUES	
('ma343', 'm345', '112-11111', 'Mia1', 'Jones1'),
('hp009', 'h666', '221-22111', 'Harper1', 'Brown1'),
('vy757', 'vyng433', '212-33445', 'Victoria2', 'Young5');
/*!40000 ALTER TABLE `customerrep` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages`(`messageId`, `customeruser`, `repuser`, `subject`, `content`, `answer`) VALUES
	('1', 'siddhik', 'ma343','Make a reseravtion', 'Not able to make a registration', 'Specific Issue?'),
    ('2', 'heeraln', 'ma343','Unable to search', 'Why is search not working?', NULL),
    ('3', 'siddhik', 'hp009','Login not working', 'I am unable to log into my account.', NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train`(trainId) VALUES (161),(251),(113),(152),(184),(244),(291),(313),(253),(287);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station`(`stationId`,`state`, `name`, `city`) VALUES
(11, 'NJ' ,'Atlantic City', 'Atlantic City')
,(12,'NJ','Egg Harbor City','Egg Harbor City')
,(13,'NJ','Hammonton', 'Atlantic County')
,(14,'NJ','Cherry Hill','Camden')
,(15,'NJ','Philadelphia','Philadelphia')
,(16,'NJ','Trenton','Trenton')
,(17,'NJ','Hamilton','Hamilton')
,(18,'NJ','Princeton Junction','Princeton')
,(19,'NJ','Jersey Avenue','New Brunswick')
,(20,'NJ','New Brunswick','New Brunswick')
,(21,'NJ','Edison','Edison')
,(22,'NJ','Metuchen','Metuchen')
,(23,'NJ','Elizabeth','Elizabeth')
,(24,'NJ','Newark Penn Station','Newark')
,(25,'NY','New York','New York')
,(26,'NJ','Teterboro','Hasbrouck Heights')
,(27,'NJ','Secaucus Junction','Secaucus')
,(28,'NJ','Hoboken','Hoboken')
,(29,'NJ','Red Bank','Red Bank')
,(30,'NJ','Woodbridge','Woodbridge')
,(31,'NJ','Linden','Linden');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
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
INSERT INTO `transitLine`(`transit-line-name`, `origin`, `destination`, `fixed fare`) VALUES
('NorthEast Corridor' , 16, 25, 2.0),
('Atlantic City Line' ,11, 15,5.0),
('Raritan Valley Line' , 15, 18, 3.0),
('Princeton Branch' , 18,  24, 10.0),
('North Jersey Coastline',  29,  31,3.0),
('Pascack Valley', 25,28,2.0);
/*!40000 ALTER TABLE `transitLine` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
Insert into `reservation` (`reservation no.`, `tripType`, `date`, `passenger`,`totalFare`, `discount_group`) VALUES
(111, 'oneway', '2020-10-08', 'Siddhi', 12.0, 'Normal'),
(222, 'oneway', '2020-11-09', 'Heeral', 34.0, 'Normal'),
(333, 'roundtrip', '2020-12-21','John', 24.0, 'Senior'),
(444, 'roundtrip', '2020-12-22', 'Jack', 17.0, 'Child');
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

