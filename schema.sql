CREATE DATABASE IF NOT EXISTS `TrainSchedule` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `TrainSchedule`;

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
	primary key(`repuser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train`(
  `trainId` int NOT NULL,
  primary key(`trainId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origin`(
  `uniqueId` varchar(20) NOT NULL,
  `state` varchar(12) NOT NULL,
  `name` varchar(21) NOT NULL,
  `city` varchar(15) NOT NULL,
  primary key(`uniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stop`(
  `uniqueId` varchar(20) NOT NULL,
  `state` varchar(12) NOT NULL,
  `name` varchar(21) NOT NULL,
  `city` varchar(15) NOT NULL,
  primary key(`uniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination`(
  `uniqueId` varchar(20) NOT NULL,
  `state` varchar(12) NOT NULL,
  `name` varchar(21) NOT NULL,
  `city` varchar(15) NOT NULL,
  primary key(`uniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `trainStartsAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainStartsAt`(
  `trainId` int NOT NULL,
  `uniqueId` varchar(20) NOT NULL,
  `state` varchar(12) NOT NULL,
  `name` varchar(21) NOT NULL,
  `city` varchar(15) NOT NULL,
  primary key(`uniqueId`),
  foreign key(`uniqueId`) References `origin`(`uniqueId`), 
  foreign key(`trainId`) References `train`(`trainId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `trainEndsAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainEndsAt`(
  `trainId` int NOT NULL,
  `uniqueId` varchar(20) NOT NULL,
  `state` varchar(12) NOT NULL,
  `name` varchar(21) NOT NULL,
  `city` varchar(15) NOT NULL,
  primary key(`uniqueId`),
  constraint foreign key(`trainId`) References `train`(`trainId`),
  constraint foreign key(`uniqueId`) References `destination`(`uniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `trainRunsOn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainRunsOn`(
  `trainId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `fixed fare` float NOT NULL,
  `fare` float NOT NULL,
  `noStops` int NOT NULL,
  primary key(`trainId`, `name`),
  foreign key(`trainId`) References `train`(`trainId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ScheduleStartsAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduleStartsAt` ( 
  `trainID` int NOT NULL,
  `name` varchar(20) NOT NULL, 
  `travel time` int NOT NULL, 
  `start time` datetime NOT NULL, 
  `uniqueID` varchar(20) NOT NULL, 
  primary key(`trainID`, `name`), 
  foreign key(`trainID`, `name`) References `trainRunsOn`(`trainID`, `name`), 
  foreign key(`uniqueID`) References `stop`(`uniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ScheduleEndsAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduleEndsAt` ( 
  `trainID` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `travel time` int NOT NULL,
  `end time` datetime NOT NULL,
  `uniqueID` varchar(20) NOT NULL,
  primary key(`trainID`, `name`),
  foreign key(`trainID`, `name`) References `trainRunsOn`(`trainID`, `name`), 
  foreign key(`uniqueID`) References `stop`(`uniqueID`)
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
  primary key(`reservation no.`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserves` ( 
  `customeruser` varchar(30) NOT NULL, 
  `reservation no.` int NOT NULL, 
  primary key(`customeruser`, `reservation no.`),
  foreign key(`customeruser`) References `customer`(`customeruser`),
  foreign key(`reservation no.`) References `reservation`(`reservation no.`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `madeFrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `madeFrom` ( 
  `reservation no.` int NOT NULL, 
  `trainID` int NOT NULL, 
  `name` varchar(20) NOT NULL, 
  primary key(`trainID`, `name`),
  foreign key(`reservation no.`) References `reservation`(`reservation no.`), 
  foreign key(`trainID`, `name`) References `trainRunsOn`(`trainID`, `name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
