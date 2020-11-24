create database if not exists `TrainSchedule`;
use `TrainSchedule`;

DROP TABLE IF EXISTS `train`;
CREATE TABLE train(
`trainId` varchar(5) NOT NULL,
primary key(`trainId`));

DROP TABLE IF EXISTS `origin`;
CREATE TABLE origin(

`uniqueId` varchar(20),
`state` varchar(12),
`name` varchar(21),
`city` varchar(15),
primary key(`uniqueId`));


DROP TABLE IF EXISTS `stop`;
CREATE TABLE stop(

`uniqueId` varchar(20),
`state` varchar(12),
`name` varchar(21),
`city` varchar(15),
primary key(`uniqueId`));

DROP TABLE IF EXISTS `destination`;
CREATE TABLE destination(

`uniqueId` varchar(20),
`state` varchar(12),
`name` varchar(21),
`city` varchar(15),
primary key(`uniqueId`));

DROP TABLE IF EXISTS `trainStartsAt`;
CREATE TABLE trainStartsAt(
`trainId` int,
`uniqueId` varchar(20),
`state` varchar(12),
`name` varchar(21),
`city` varchar(15),
primary key(`uniqueId`),
foreign Key (`trainId`) References TrainScedule.train(`trainId`),
foreign Key (`uniqueId`) References TrainScedule.origin(`uniqueId`));

DROP TABLE IF EXISTS `trainEndsAt`;
CREATE TABLE trainEndsAt(
`trainId` int,
`uniqueId` varchar(20),
`state` varchar(12),
`name` varchar(21),
`city` varchar(15),
primary key(`uniqueId`),
foreign Key (`trainId`) References TrainScedule.train(`trainId`),
foreign Key (`uniqueId`) References TrainScedule.destination(`uniqueId`));

DROP TABLE IF EXISTS `trainRunsOn`;
CREATE TABLE trainRunsOn(
`trainId` int,
`name` varchar(20),
`fixed fare` float,
`fare` float,
`noStops` int,
primary key(`name`),
primary key(`trainId`),
foreign Key (`trainId`) References TrainScedule.train(`trainId`));


















DROP TABLE IF EXISTS `users`;
create table users(
`username` varchar(50) not null,
`password` varchar(50) not null,
primary key(`username`));





insert into `users` VALUES ('newtest', 'newtest1'), ('newtest2', 'newtest22');

