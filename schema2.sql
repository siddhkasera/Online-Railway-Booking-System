CREATE DATABASE IF NOT EXISTS `schema` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `schema`;

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
  `customeruser` varchar(30) NOT NULL, 
  `totalFare` double DEFAULT NULL,
  `discount_group` enum('Senior', 'Child', 'Disabled', 'Normal') NOT NULL,
  primary key(`reservation no.`),
  foreign key(`customeruser`) References `customer`(`customeruser`)
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

DROP TABLE IF EXISTS `Transit_line_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  `Transit_line_route`(
	`routeId` int NOT NULL,
    `tlName` varchar(30) NOT NULL,
	`origin` int NOT NULL,
	`dest` int NOT NULL,
	primary key(`routeId`),
	foreign key (`origin`) References `station`(`stationId`),
	foreign key (`dest`) References `station`(`stationId`),
	foreign key (`tlName`) References `transitLine`(`tlName`)
)ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `trainHasSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;		
/*!40101 SET character_set_client = utf8 */;		
CREATE TABLE `trainHasSchedule` (
	`schedId` int NOT NULL,
    `trainId` int NOT NULL,
    primary key(`schedId`),
    foreign key(`trainId`) references `train`(`trainId`)
)ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `buildScheduleWithTimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;		
/*!40101 SET character_set_client = utf8 */;	
CREATE TABLE `buildScheduleWithTimes` (
	`schedId` int NOT NULL,
    `routeId` int NOT NULL,
    `dept_time` time NOT NULL,
    `arrv_time` time NOT NULL,
    primary key(`schedId`, `routeId`),
    foreign key (`schedId`) references `trainHasSchedule`(`schedId`),
    foreign key (`routeId`) references `transit_line_route`(`routeId`)
)ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `messages`;		
/*!40101 SET @saved_cs_client     = @@character_set_client */;		
/*!40101 SET character_set_client = utf8 */;		
 CREATE TABLE `messages`(		
 	`messageId` int NOT NULL AUTO_INCREMENT,		
 	`customeruser` varchar(30) NOT NULL,		
     `repuser` varchar(30) DEFAULT NULL,		
     `subject` varchar(150) NOT NULL,		
     `content` varchar(500) DEFAULT NULL,		
     `answer` varchar(500) DEFAULT NULL,		
     primary key(`messageId`),		
     foreign key (`customeruser`) References `customer`(`customeruser`),		
     foreign key(`repuser`) References `customerrep`(`repuser`)		
 ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
('admin1', 'admin2', '111-11111', 'Mia','Jones'),
('hp909', 'had990','222-22222', 'Harper','Brown'),
('vy888', 'vicy888', '333-33333','Victoria', 'Young');
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

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train`(trainId) VALUES 
(100),
(101),
(102),
(103),
(104),
(105);
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

LOCK TABLES `transitLine` WRITE;
/*!40000 ALTER TABLE `transitLine` DISABLE KEYS */;
INSERT INTO `transitLine`(`tlName`, `origin`, `destination`, `fixed fare`) VALUES
('Northeast Corridor', 11, 14, 2.0),
('Raritan Valley Line', 15, 18, 3.0),
('Keystone Service', 19, 22, 5.0),
('North Jersey Coastline', 23, 25,3.0);
/*!40000 ALTER TABLE `transitLine` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Train_line` WRITE;
/*!40000 ALTER TABLE `Train_line` DISABLE KEYS */;
INSERT INTO `Train_line` (`trainId`, `tlName`) VALUES 
(101, 'Northeast Corridor'),
(102, 'Northeast Corridor'),
(103, 'Raritan Valley Line'),
(104, 'Keystone Service'),
(105, 'Keystone Service');
/*!40000 ALTER TABLE `Train_line` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `trainHasSchedule` WRITE;
/*!40000 ALTER TABLE `trainHasSchedule` DISABLE KEYS */;
INSERT INTO `trainHasSchedule` (`schedId`, `trainId`) VALUES 
(1001, 101), #nec
(1002, 101), #nec
(1003, 102), #nec
(1004, 102), #nec
(1005, 103), #rvl
(1006, 103), #rvl
(1007, 104), #ksc
(1008, 105), #ksc
(1009, 105); #ksc
/*!40000 ALTER TABLE `trainHasSchedule` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `buildScheduleWithTimes` WRITE; #a train has schedules which correspond to a transit line route and each schedule has diff times
/*!40000 ALTER TABLE `buildScheduleWithTimes` DISABLE KEYS */;
INSERT INTO `buildScheduleWithTimes` (`schedId`,`routeId`, `dept_time`, `arrv_time`) VALUES
(1001, 1, '22:00', '22:15'),
(1001, 2, '22:15', '22:30'),
(1001, 3, '22:30', '22:45'),
(1001, 4, '22:45', '23:00'),
(1001, 5, '23:00', '23:15'),
(1001, 6, '23:15', '23:50'),

(1002, 1, '2:00', '2:15'),
(1002, 2, '2:15', '2:30'),
(1002, 3, '2:30', '2:45'),
(1002, 4, '2:45', '3:00'),
(1002, 5, '3:00', '3:15'),
(1002, 6, '3:15', '3:50'),

(1003, 1, '12:00', '12:15'),
(1003, 2, '12:15', '12:30'),
(1003, 3, '12:30', '12:45'),
(1003, 4, '12:45', '1:00'),
(1003, 5, '1:00', '1:15'),
(1003, 6, '1:15', '1:50'),

(1004, 1, '15:00', '15:15'),
(1004, 2, '15:15', '15:30'),
(1004, 3, '15:30', '15:45'),
(1004, 4, '15:45', '16:00'),
(1004, 5, '16:00', '16:15'),
(1004, 6, '16:15', '16:50'),

(1005, 7, '18:00', '18:20'),
(1005, 8, '18:20', '18:40'),
(1005, 9, '18:40', '19:00'),
(1005, 10, '19:00', '19:20'),
(1005, 11, '19:20', '19:40'),
(1005, 12, '19:40', '20:00'),

(1006, 7, '14:00', '14:20'),
(1006, 8, '14:20', '14:40'),
(1006, 9, '14:40', '15:00'),
(1006, 10, '15:00', '15:20'),
(1006, 11, '15:20', '15:40'),
(1006, 12, '15:40', '16:00'),

(1007, 13, '7:00', '7:15'),
(1007, 14, '7:15', '7:25'),
(1007, 15, '7:25', '7:45'),
(1007, 16, '7:45', '8:00'),
(1007, 17, '8:00', '8:10'),
(1007, 18, '8:10', '8:30'),
(1007, 19, '8:30', '8:45'),
(1007, 20, '8:45', '8:55'),
(1007, 21, '8:55', '9:15'),
(1007, 22, '9:15', '9:30'),

(1008, 13, '4:00', '4:15'),
(1008, 14, '4:15', '4:25'),
(1008, 15, '4:25', '4:45'),
(1008, 16, '4:45', '5:00'),
(1008, 17, '5:00', '5:10'),
(1008, 18, '5:10', '5:30'),
(1008, 19, '5:30', '5:45'),
(1008, 20, '5:45', '5:55'),
(1008, 21, '6:55', '6:15'),
(1008, 22, '6:15', '6:30'),

(1009, 13, '9:00', '9:15'),
(1009, 14, '9:15', '9:25'),
(1009, 15, '9:25', '9:45'),
(1009, 16, '9:45', '10:00'),
(1009, 17, '10:00', '10:10'),
(1009, 18, '10:10', '10:30'),
(1009, 19, '10:30', '10:45'),
(1009, 20, '10:45', '10:55'),
(1009, 21, '11:55', '11:15'),
(1009, 22, '11:15', '11:30');
/*!40000 ALTER TABLE `buildScheduleWithTimes` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES`Transit_line_route` WRITE;
/*!40000 ALTER TABLE `Transit_line_route` DISABLE KEYS */;
INSERT INTO `Transit_line_route`(`routeId`, `tlName`,`origin`,`dest`) VALUES
(1, 'Northeast Corridor', 11, 12),
(2, 'Northeast Corridor', 12, 13),
(3, 'Northeast Corridor', 13, 14),
(4, 'Northeast Corridor', 14, 13),
(5, 'Northeast Corridor', 13, 12),
(6, 'Northeast Corridor', 12, 11),

(7, 'Raritan Valley Line', 15, 16),
(8, 'Raritan Valley Line', 16, 17),
(9, 'Raritan Valley Line', 17, 18),
(10, 'Raritan Valley Line',18, 17),
(11, 'Raritan Valley Line', 17, 16),
(12, 'Raritan Valley Line', 16, 15),

(13, 'Keystone Service', 19, 11),
(14, 'Keystone Service', 11, 14),
(15, 'Keystone Service', 14, 20),
(16, 'Keystone Service', 20, 21),
(17, 'Keystone Service', 21, 22),
(18, 'Keystone Service', 22, 21),
(19, 'Keystone Service', 21, 20),
(20, 'Keystone Service', 20, 14),
(21, 'Keystone Service', 14, 11),
(22, 'Keystone Service', 11, 19);
/*!40000 ALTER TABLE `Transit_line_route` ENABLE KEYS */;
UNLOCK TABLES;
 
LOCK TABLES `messages` WRITE;		
 /*!40000 ALTER TABLE `messages` DISABLE KEYS */;		
 INSERT INTO `messages`(`messageId`, `customeruser`, `repuser`, `subject`, `content`, `answer`) VALUES		
 	('1', 'siddhik', 'ma343','Make a reseravtion', 'Not able to make a registration', 'Specific Issue?'),		
     ('2', 'heeraln', 'ma343','Unable to search', 'Why is search not working?', NULL),		
     ('3', 'siddhik', 'hp009','Login not working', 'I am unable to log into my account.', NULL);		
 /*!40000 ALTER TABLE `messages` ENABLE KEYS */;		
 UNLOCK TABLES;
 
LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
Insert into `reservation` (`reservation no.`, `tripType`, `date`, `customeruser`,`totalFare`, `discount_group`) VALUES
(111, 'oneway', '2020-10-08', 'emilyj', 12.0, 'Normal'),
(222, 'oneway', '2020-11-09', 'heeraln', 34.0, 'Normal'),
(333, 'roundtrip', '2020-12-21','jackw', 24.0, 'Senior'),
(555, 'oneway', '2020-11-10', 'heeraln', 10.0, 'Normal'),
(444, 'roundtrip', '2020-12-22', 'siddhik', 17.0, 'Child');
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

