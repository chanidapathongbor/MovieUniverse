CREATE DATABASE  IF NOT EXISTS `mediadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mediadb`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mediadb
-- ------------------------------------------------------
-- Server version	26.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '0e5cad34-9a51-11f1-9369-14b5cd1b5088:1-24357';

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `actor_id` int NOT NULL AUTO_INCREMENT,
  `actor_name` varchar(100) NOT NULL,
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Daniel Radcliffe'),(2,'Emma Watson'),(3,'Rupert Grint'),(4,'Tom Felton'),(5,'Alan Rickman'),(6,'Ralph Fiennes'),(7,'Eddie Redmayne'),(8,'Katherine Waterston'),(9,'Dan Fogler'),(10,'Alison Sudol'),(11,'Jude Law'),(12,'Johnny Depp'),(13,'Mads Mikkelsen'),(14,'Leonardo DiCaprio'),(15,'Kate Winslet'),(16,'Billy Zane'),(17,'Millie Bobby Brown'),(18,'Finn Wolfhard'),(19,'Winona Ryder'),(20,'David Harbour'),(21,'Emilia Clarke'),(22,'Kit Harington'),(23,'Peter Dinklage'),(24,'Lena Headey'),(25,'Emma D\'Arcy'),(26,'Matt Smith'),(27,'Olivia Cooke'),(28,'Paddy Considine'),(29,'Robert Downey Jr.'),(30,'Gwyneth Paltrow'),(31,'Don Cheadle'),(32,'Mickey Rourke'),(33,'Guy Pearce'),(34,'Chris Evans'),(35,'Chris Hemsworth'),(36,'Scarlett Johansson'),(37,'Mark Ruffalo'),(38,'Jeremy Renner'),(39,'James Spader'),(40,'Josh Brolin'),(41,'Tom Hiddleston'),(42,'Tom Holland'),(43,'Zendaya'),(44,'Jacob Batalon'),(45,'Michael Keaton'),(46,'Jake Gyllenhaal'),(47,'Benedict Cumberbatch'),(48,'Willem Dafoe'),(49,'Alfred Molina'),(50,'Matthew Broderick'),(51,'James Earl Jones'),(52,'Jeremy Irons'),(53,'Donald Glover'),(54,'Beyonce Knowles-Carter'),(55,'Chiwetel Ejiofor'),(56,'Liu Shishi'),(57,'Nicky Wu'),(58,'Kevin Cheng'),(59,'Lee Joon-gi'),(60,'Lee Ji-eun'),(61,'Kang Ha-neul'),(62,'Cillian Murphy'),(63,'Emily Blunt'),(64,'Florence Pugh'),(65,'Matt Damon'),(66,'Song Kang-ho'),(67,'Choi Woo-shik'),(68,'Park So-dam'),(69,'Lee Sun-kyun'),(70,'Margot Robbie'),(71,'Ryan Gosling'),(72,'America Ferrera'),(73,'Yuki Kaji'),(74,'Yui Ishikawa'),(75,'Marina Inoue'),(76,'Hiroshi Kamiya'),(77,'Tim Robbins'),(78,'Morgan Freeman'),(79,'Bob Gunton'),(80,'Marlon Brando'),(81,'Al Pacino'),(82,'James Caan'),(83,'Robert Duvall'),(84,'Diane Keaton'),(85,'Robert De Niro'),(86,'Christian Bale'),(87,'Heath Ledger'),(88,'Aaron Eckhart'),(89,'Michael Caine'),(90,'Gary Oldman'),(91,'Elijah Wood'),(92,'Ian McKellen'),(93,'Viggo Mortensen'),(94,'Sean Astin'),(95,'Orlando Bloom'),(96,'Cate Blanchett'),(97,'Andy Serkis'),(98,'Tom Hanks'),(99,'Robin Wright'),(100,'Gary Sinise'),(101,'Joseph Gordon-Levitt'),(102,'Elliot Page'),(103,'Tom Hardy'),(104,'Brad Pitt'),(105,'Edward Norton'),(106,'Helena Bonham Carter'),(107,'Mark Hamill'),(108,'Harrison Ford'),(109,'Carrie Fisher'),(110,'Billy Dee Williams'),(111,'Alec Guinness'),(112,'Keanu Reeves'),(113,'Laurence Fishburne'),(114,'Carrie-Anne Moss'),(115,'Hugo Weaving'),(116,'Matthew McConaughey'),(117,'Anne Hathaway'),(118,'Jessica Chastain'),(119,'Arnold Schwarzenegger'),(120,'Linda Hamilton'),(121,'Edward Furlong'),(122,'Robert Patrick'),(123,'Michael J. Fox'),(124,'Christopher Lloyd'),(125,'Lea Thompson'),(126,'Crispin Glover'),(127,'Rumi Hiiragi'),(128,'Miyu Irino'),(129,'Mari Natsuki'),(130,'Russell Crowe'),(131,'Joaquin Phoenix'),(132,'Connie Nielsen'),(133,'Uma Thurman'),(134,'David Carradine'),(135,'Lucy Liu'),(136,'Vivica A. Fox'),(137,'Michael Madsen'),(138,'Daryl Hannah'),(139,'Tsutomu Tatsumi'),(140,'Ayano Shiraishi'),(141,'Shameik Moore'),(142,'Hailee Steinfeld'),(143,'Oscar Isaac'),(144,'Jake Johnson'),(145,'Mahershala Ali'),(146,'Nicolas Cage'),(147,'Sigourney Weaver'),(148,'Tom Skerritt'),(149,'John Hurt'),(150,'Ian Holm'),(151,'Ben Burtt'),(152,'Elissa Knight'),(153,'Jeff Garlin'),(154,'Timothée Chalamet'),(155,'Rebecca Ferguson'),(156,'Javier Bardem'),(157,'Austin Butler'),(158,'Robert Pattinson'),(159,'Lupita Nyong\'o'),(160,'Charlize Theron'),(161,'William Holden'),(162,'Gloria Swanson'),(163,'Erich von Stroheim'),(164,'Anthony Gonzalez'),(165,'Gael García Bernal'),(166,'Benjamin Bratt'),(167,'Tim Allen'),(168,'Don Rickles'),(169,'Joan Cusack'),(170,'Ned Beatty'),(171,'Ryunosuke Kamiki'),(172,'Mone Kamishiraishi'),(173,'Yoji Matsuda'),(174,'Yuriko Ishida'),(175,'Yuko Tanaka'),(176,'Zazie Beetz'),(177,'Frances Conroy'),(178,'Ed Asner'),(179,'Jordan Nagai'),(180,'Christopher Plummer'),(181,'Sam Neill'),(182,'Laura Dern'),(183,'Jeff Goldblum'),(184,'Richard Attenborough'),(185,'Chieko Baisho'),(186,'Takuya Kimura'),(187,'Akihiro Miwa'),(188,'Sandra Hüller'),(189,'Milana Vayntrub'),(190,'Christopher Walken'),(191,'Amy Adams'),(192,'Amy Poehler'),(193,'Phyllis Smith'),(194,'Bill Hader'),(195,'Mindy Kaling'),(196,'Robin Williams'),(197,'Robert Sean Leonard'),(198,'Ethan Hawke'),(199,'Patton Oswalt'),(200,'Brad Garrett'),(201,'Lou Romano'),(202,'Peter O\'Toole'),(203,'Nicholas Hoult'),(204,'Hugh Keays-Byrne'),(205,'Rutger Hauer'),(206,'Sean Young'),(207,'Edward James Olmos'),(208,'Roy Scheider'),(209,'Robert Shaw'),(210,'Richard Dreyfuss');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `accountID` int NOT NULL,
  `contract` varchar(250) NOT NULL,
  PRIMARY KEY (`accountID`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `user` (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Content administrator - manages media data and inspects statistics');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(100) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'J.K. Rowling'),(2,'George R.R. Martin'),(3,'Tong Hua'),(4,'Hajime Isayama'),(5,'Warren Ellis'),(6,'Jim Starlin'),(7,'Kai Bird'),(8,'Brian Michael Bendis'),(9,'Jonathan Hickman'),(10,'Bob Layton'),(11,'Will Corona Pilgrim'),(12,'J. Michael Straczynski'),(13,'Stephen King'),(14,'Mario Puzo'),(15,'J.R.R. Tolkien'),(16,'Winston Groom'),(17,'Chuck Palahniuk'),(18,'Akiyuki Nosaka'),(19,'Frank Herbert'),(20,'Homer'),(21,'Michael Crichton'),(22,'Diana Wynne Jones'),(23,'Andy Weir'),(24,'Frank Abagnale Jr.'),(25,'Philip K. Dick'),(26,'Peter Benchley');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `volume` int NOT NULL,
  `book_type` varchar(50) NOT NULL,
  `publish_date` date NOT NULL,
  `publisher_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `publisher_id` (`publisher_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('9780140449112','The Odyssey',1,'Epic Poem','1946-01-01',14,20),('9780261102354','The Fellowship of the Ring',1,'Novel','1954-07-29',9,15),('9780261102361','The Two Towers',2,'Novel','1954-11-11',9,15),('9780261102378','The Return of the King',3,'Novel','1955-10-20',9,15),('9780375726262','American Prometheus',1,'Biography','2006-04-11',6,7),('9780385046947','Do Androids Dream of Electric Sheep?',1,'Novel','1968-03-01',10,25),('9780385047715','Jaws',1,'Novel','1974-02-01',10,26),('9780385231343','Forrest Gump',1,'Novel','1986-03-01',10,16),('9780393039764','Fight Club',1,'Novel','1996-08-17',11,17),('9780394588162','Jurassic Park',1,'Novel','1990-11-20',15,21),('9780399103421','The Godfather',1,'Novel','1969-03-10',8,14),('9780441172719','Dune',1,'Novel','1965-08-01',13,19),('9780448165387','Catch Me If You Can',1,'Biography','1980-01-01',18,24),('9780553103540','A Game of Thrones',1,'Novel','1996-08-01',2,2),('9780553106633','A Storm of Swords',3,'Novel','2000-08-08',2,2),('9780553108033','A Clash of Kings',2,'Novel','1998-11-16',2,2),('9780553801477','A Dance with Dragons',5,'Novel','2011-07-12',2,2),('9780553801507','A Feast for Crows',4,'Novel','2005-10-17',2,2),('9780593135204','Project Hail Mary',1,'Novel','2021-05-04',17,23),('9780670289030','Rita Hayworth and Shawshank Redemption',1,'Novella','1982-08-27',7,13),('9780688062330','Howl\'s Moving Castle',1,'Novel','1986-04-01',16,22),('9780747532699','Harry Potter and the Philosopher\'s Stone',1,'Novel','1997-06-26',1,1),('9780747538493','Harry Potter and the Chamber of Secrets',2,'Novel','1998-07-02',1,1),('9780747542155','Harry Potter and the Prisoner of Azkaban',3,'Novel','1999-07-08',1,1),('9780747546245','Harry Potter and the Goblet of Fire',4,'Novel','2000-07-08',1,1),('9780747551003','Harry Potter and the Order of the Phoenix',5,'Novel','2003-06-21',1,1),('9780747581086','Harry Potter and the Half-Blood Prince',6,'Novel','2005-07-16',1,1),('9780747591054','Harry Potter and the Deathly Hallows',7,'Novel','2007-07-21',1,1),('9780785126348','Spider-Man: One More Day',1,'Comic','2008-08-01',5,12),('9780785143314','Iron Man: Extremis',1,'Comic','2010-09-01',5,5),('9780785155669','Age of Ultron',1,'Comic','2014-05-06',5,8),('9780785156598','The Infinity Gauntlet',1,'Comic','2011-09-13',5,6),('9780785157137','Ultimate Comics Spider-Man: Who Is Miles Morales?',1,'Comic','2012-03-07',5,8),('9780785184232','Infinity',1,'Comic','2014-09-02',5,9),('9781302905163','Spider-Man: Homecoming Prelude',1,'Comic','2017-06-01',5,11),('9781302917852','Spider-Man: Far From Home Prelude',1,'Comic','2019-06-05',5,11),('9781302918866','Ultimate Spider-Man: Power and Responsibility',1,'Comic','2019-10-22',5,8),('9781302961817','Iron Man: Demon in a Bottle',1,'Comic','2025-09-02',5,10),('9781524796280','Fire & Blood',1,'Novel','2018-11-20',2,2),('9784063842760','Attack on Titan',1,'Manga','2010-03-17',4,4),('9784063843385','Attack on Titan',2,'Manga','2010-07-16',4,4),('9784063844108','Attack on Titan',3,'Manga','2010-12-09',4,4),('9784063844696','Attack on Titan',4,'Manga','2011-04-08',4,4),('9784063845136','Attack on Titan',5,'Manga','2011-08-09',4,4),('9784167112011','Grave of the Fireflies',1,'Short Story','1967-10-01',12,18),('9787539940124','Bu Bu Jing Xin',1,'Novel','2005-01-01',3,3),('9787539940131','Bu Bu Jing Xin',2,'Novel','2005-01-01',3,3);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `accountID` int NOT NULL,
  `contract` varchar(250) NOT NULL,
  PRIMARY KEY (`accountID`),
  CONSTRAINT `developer_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `user` (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
INSERT INTO `developer` VALUES (2,'Project developer - full database access');
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `director_id` int NOT NULL AUTO_INCREMENT,
  `director_name` varchar(100) NOT NULL,
  PRIMARY KEY (`director_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Chris Columbus'),(2,'Alfonso Cuarón'),(3,'Mike Newell'),(4,'David Yates'),(5,'James Cameron'),(6,'Matt Duffer'),(7,'David Nutter'),(8,'Miguel Sapochnik'),(9,'Jon Favreau'),(10,'Joss Whedon'),(11,'Anthony Russo'),(12,'Shane Black'),(13,'Jon Watts'),(14,'Roger Allers'),(15,'Lee Kwok-lap'),(16,'Kim Kyu-tae'),(17,'Christopher Nolan'),(18,'Bong Joon-ho'),(19,'Greta Gerwig'),(20,'Tetsurō Araki'),(21,'Frank Darabont'),(22,'Francis Ford Coppola'),(23,'Peter Jackson'),(24,'Robert Zemeckis'),(25,'David Fincher'),(26,'Irvin Kershner'),(27,'Lana Wachowski'),(28,'George Lucas'),(29,'Hayao Miyazaki'),(30,'Ridley Scott'),(31,'Quentin Tarantino'),(32,'Isao Takahata'),(33,'Joaquim Dos Santos'),(34,'Andrew Stanton'),(35,'Denis Villeneuve'),(36,'Bob Persichetti'),(37,'Billy Wilder'),(38,'Lee Unkrich'),(39,'John Lasseter'),(40,'Makoto Shinkai'),(41,'Todd Phillips'),(42,'Richard Marquand'),(43,'Pete Docter'),(44,'Steven Spielberg'),(45,'Phil Lord'),(46,'Peter Weir'),(47,'Brad Bird'),(48,'George Miller'),(49,'me');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Fantasy'),(2,'Romance'),(3,'Sci-Fi'),(4,'Action'),(5,'Drama'),(6,'Thriller'),(7,'Comedy'),(8,'Adventure'),(9,'Mystery'),(10,'Horror'),(11,'Crime'),(12,'Historical'),(13,'Supernatural'),(14,'Family'),(16,'Biography');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `publish_date` date NOT NULL,
  `age_rating` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `synopsis` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `universe_id` int DEFAULT NULL,
  `director_id` int NOT NULL,
  `main_genre_id` int NOT NULL,
  `sequel_parent_id` int DEFAULT NULL,
  `remake_parent_id` int DEFAULT NULL,
  `visits` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `universe_id` (`universe_id`),
  KEY `director_id` (`director_id`),
  KEY `main_genre_id` (`main_genre_id`),
  KEY `sequel_parent_id` (`sequel_parent_id`),
  KEY `remake_parent_id` (`remake_parent_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`universe_id`) REFERENCES `universe` (`universe_id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `director` (`director_id`),
  CONSTRAINT `media_ibfk_3` FOREIGN KEY (`main_genre_id`) REFERENCES `genre` (`genre_id`),
  CONSTRAINT `media_ibfk_4` FOREIGN KEY (`sequel_parent_id`) REFERENCES `media` (`id`),
  CONSTRAINT `media_ibfk_5` FOREIGN KEY (`remake_parent_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'Harry Potter and the Philosopher\'s Stone','2001-11-16','PG','Completed','Harry begins his first year at Hogwarts and discovers the wizarding world.','Live action','USA',7.6,1,1,1,NULL,NULL,'{\"2026-11-01\": 1}'),(2,'Harry Potter and the Chamber of Secrets','2002-11-15','PG','Completed','Harry returns to Hogwarts and investigates the mysterious Chamber of Secrets.','Live action','USA',7.4,1,1,1,1,NULL,NULL),(3,'Harry Potter and the Prisoner of Azkaban','2004-06-04','PG','Completed','Harry learns about Sirius Black, an escaped prisoner connected to his past.','Live action','USA',7.9,1,2,1,2,NULL,NULL),(4,'Harry Potter and the Goblet of Fire','2005-11-18','PG-13','Completed','Harry is unexpectedly chosen to compete in the dangerous Triwizard Tournament.','Live action','USA',7.7,1,3,1,3,NULL,NULL),(5,'Harry Potter and the Order of the Phoenix','2007-07-11','PG-13','Completed','Harry and his friends prepare to fight against the return of Lord Voldemort.','Live action','USA',7.5,1,4,1,4,NULL,NULL),(6,'Harry Potter and the Half-Blood Prince','2009-07-15','PG','Completed','Harry learns more about Voldemort\'s past and the secret of the Horcruxes.','Live action','USA',7.6,1,4,1,5,NULL,'{\"2026-11-01\": 2.0}'),(7,'Harry Potter and the Deathly Hallows - Part 1','2010-11-19','PG-13','Completed','Harry, Ron, and Hermione search for Horcruxes while Voldemort gains power.','Live action','USA',7.7,1,4,1,6,NULL,NULL),(8,'Harry Potter and the Deathly Hallows - Part 2','2011-07-15','PG-13','Completed','Harry and his friends return to Hogwarts for the final battle against Voldemort.','Live action','USA',8.1,1,4,1,7,NULL,'{\"2026-11-01\": 1.0}'),(9,'Fantastic Beasts and Where to Find Them','2016-11-18','PG-13','Completed','Newt Scamander arrives in New York with a suitcase containing magical creatures.','Live action','USA',7.2,1,4,1,NULL,NULL,'{\"2026-11-01\": 1}'),(10,'Fantastic Beasts: The Crimes of Grindelwald','2018-11-16','PG-13','Completed','Newt Scamander joins Dumbledore in an effort to stop the dark wizard Grindelwald.','Live action','USA',6.5,1,4,1,9,NULL,'{\"2026-11-01\": 2}'),(11,'Fantastic Beasts: The Secrets of Dumbledore','2022-04-15','PG-13','Completed','Dumbledore sends Newt and his allies on a mission against Grindelwald.','Live action','USA',6.2,1,4,1,10,NULL,'{\"2026-11-01\": 2}'),(12,'Titanic','1997-12-19','PG-13','Completed','A young couple from different social classes fall in love aboard the Titanic during its tragic voyage.','Live action','USA',7.9,NULL,5,2,NULL,NULL,'{\"2026-11-01\": 3}'),(13,'Stranger Things','2016-07-15','PG-13','Completed','A group of friends uncover supernatural mysteries and secret experiments in their small town.','Live action','USA',8.6,NULL,6,3,NULL,NULL,NULL),(14,'Game of Thrones','2011-04-17','R','Completed','Noble families fight for control of the Iron Throne while an ancient threat rises.','Live action','USA',9.2,2,7,1,NULL,NULL,'{\"2026-11-05\": 1.0}'),(15,'House of the Dragon','2022-08-21','R','Ongoing','House Targaryen faces an internal struggle for succession to the Iron Throne.','Live action','USA',8.3,2,8,1,NULL,NULL,'{\"2026-11-01\": 1}'),(16,'Iron Man','2008-05-02','PG-13','Completed','Tony Stark builds a powerful armored suit and becomes the superhero Iron Man.','Live action','USA',7.9,3,9,4,NULL,NULL,NULL),(17,'Iron Man 2','2010-05-07','PG-13','Completed','Tony Stark faces new enemies while dealing with pressure surrounding his Iron Man technology.','Live action','USA',6.9,3,9,4,16,NULL,NULL),(18,'Iron Man 3','2013-05-03','PG-13','Completed','Tony Stark faces a powerful enemy while struggling with the consequences of past events.','Live action','USA',7.1,3,12,4,17,NULL,NULL),(19,'The Avengers','2012-05-04','PG-13','Completed','Earth\'s mightiest heroes unite to stop Loki and an alien invasion.','Live action','USA',8.0,3,10,4,NULL,NULL,NULL),(20,'Avengers: Age of Ultron','2015-05-01','PG-13','Completed','The Avengers battle Ultron, an artificial intelligence created to protect the world.','Live action','USA',7.3,3,10,4,19,NULL,NULL),(21,'Avengers: Infinity War','2018-04-27','PG-13','Completed','The Avengers and their allies fight to stop Thanos from collecting the Infinity Stones.','Live action','USA',8.4,3,11,4,20,NULL,NULL),(22,'Avengers: Endgame','2019-04-26','PG-13','Completed','The surviving Avengers attempt to reverse the destruction caused by Thanos.','Live action','USA',8.4,3,11,4,21,NULL,NULL),(23,'Spider-Man: Homecoming','2017-07-07','PG-13','Completed','Peter Parker balances high school life with being Spider-Man while facing the Vulture.','Live action','USA',7.4,3,13,4,NULL,NULL,NULL),(24,'Spider-Man: Far From Home','2019-07-02','PG-13','Completed','Peter Parker travels to Europe and faces new threats while dealing with the loss of Tony Stark.','Live action','USA',7.4,3,13,4,23,NULL,NULL),(25,'Spider-Man: No Way Home','2021-12-17','PG-13','Completed','Peter Parker asks Doctor Strange for help after his identity as Spider-Man is revealed.','Live action','USA',8.2,3,13,4,24,NULL,'{\"2026-11-01\": 2.0, \"2026-11-05\": 3.0}'),(26,'The Lion King','1994-06-24','G','Completed','A young lion prince must overcome tragedy and reclaim his place as king.','Animation 2D','USA',8.5,NULL,14,14,NULL,NULL,NULL),(27,'The Lion King','2019-07-19','PG','Completed','A young lion prince returns to reclaim his kingdom after the death of his father.','Animation 3D','USA',6.8,NULL,9,14,NULL,26,NULL),(28,'Scarlet Heart','2011-09-10','PG-13','Completed','A modern woman travels back to the Qing Dynasty and becomes involved in a struggle among imperial princes.','Live action','China',8.0,NULL,15,2,NULL,NULL,'{\"2026-11-01\": 1}'),(29,'Moon Lovers: Scarlet Heart Ryeo','2016-08-29','PG-13','Completed','A modern woman travels back to the Goryeo era and becomes involved in love and conflict among royal princes.','Live action','South Korea',8.6,NULL,16,2,NULL,28,'{\"2026-11-01\": 1}'),(30,'Oppenheimer','2023-07-21','R','Completed','A physicist leads the development of the atomic bomb during World War II.','Live action','USA',8.2,NULL,17,5,NULL,NULL,'{\"2026-11-01\": 3.0}'),(31,'Parasite','2019-05-30','R','Completed','A struggling family becomes involved with a wealthy household with unexpected consequences.','Live action','South Korea',8.5,NULL,18,6,NULL,NULL,'{\"2026-11-01\": 1}'),(32,'Barbie','2023-07-21','PG-13','Completed','Barbie leaves Barbie Land and enters the real world on a journey of self-discovery.','Live action','USA',6.8,NULL,19,7,NULL,NULL,'{\"2026-11-01\": 2, \"2026-11-05\": 2.0}'),(33,'Attack on Titan','2013-04-07','R','Completed','Humanity fights for survival against giant humanoid creatures known as Titans.','Animation 2D','Japan',9.1,NULL,20,4,NULL,NULL,'{\"2026-11-01\": 2}'),(34,'The Shawshank Redemption','1994-10-14','R','Completed','Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.','Live action','USA',9.3,NULL,21,5,NULL,NULL,'{\"2026-11-05\": 1.0}'),(35,'The Godfather','1972-03-24','R','Completed','The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.','Live action','USA',9.2,4,22,11,NULL,NULL,'{\"2026-11-05\": 3.0}'),(36,'The Dark Knight','2008-07-18','PG-13','Completed','When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests.','Live action','USA',9.0,5,17,4,NULL,NULL,NULL),(37,'The Godfather Part II','1974-12-20','R','Completed','The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.','Live action','USA',9.0,4,22,11,35,NULL,NULL),(38,'The Lord of the Rings: The Return of the King','2003-12-17','PG-13','Completed','Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.','Live action','New Zealand',9.0,6,23,1,40,NULL,'{\"2026-11-05\": 1.0}'),(39,'The Lord of the Rings: The Fellowship of the Ring','2001-12-19','PG-13','Completed','A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.','Live action','New Zealand',8.9,6,23,1,NULL,NULL,'{\"2026-11-05\": 2.0}'),(40,'The Lord of the Rings: The Two Towers','2002-12-18','PG-13','Completed','While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron\'s new ally, Saruman.','Live action','New Zealand',8.8,6,23,1,39,NULL,'{\"2026-11-05\": 1.0}'),(41,'Forrest Gump','1994-07-06','PG-13','Completed','The history of the United States from the 1950s to the \'70s unfolds from the perspective of an Alabama man with an IQ of 75, who yearns to be reunited with his childhood sweetheart.','Live action','USA',8.8,NULL,24,5,NULL,NULL,'{\"2026-11-05\": 2.0}'),(42,'Inception','2010-07-16','PG-13','Completed','A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.','Live action','USA',8.8,NULL,17,3,NULL,NULL,NULL),(43,'Fight Club','1999-10-15','R','Completed','An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.','Live action','USA',8.8,NULL,25,5,NULL,NULL,NULL),(44,'Star Wars: Episode V - The Empire Strikes Back','1980-06-20','PG','Completed','After the Rebels are overpowered by the Empire, Luke Skywalker begins his Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader.','Live action','USA',8.7,7,26,3,49,NULL,NULL),(45,'The Matrix','1999-03-31','R','Completed','When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.','Live action','USA',8.7,8,27,3,NULL,NULL,NULL),(46,'Interstellar','2014-11-07','PG-13','Completed','When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.','Live action','USA',8.7,NULL,17,3,NULL,NULL,'{\"2026-11-05\": 1.0}'),(47,'Terminator 2: Judgment Day','1991-07-03','R','Completed','A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her ten-year-old son John from an even more advanced and powerful cyborg.','Live action','USA',8.6,9,5,3,NULL,NULL,NULL),(48,'Back to the Future','1985-07-03','PG','Completed','Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown.','Live action','USA',8.5,10,24,3,NULL,NULL,NULL),(49,'Star Wars: Episode IV - A New Hope','1977-05-25','PG','Completed','Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire\'s world-destroying battle station.','Live action','USA',8.6,7,28,3,NULL,NULL,NULL),(50,'Spirited Away','2001-07-20','PG','Completed','During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches and spirits, and where humans are changed into beasts.','Animation 2D','Japan',8.6,NULL,29,1,NULL,NULL,NULL),(51,'Gladiator','2000-05-05','R','Completed','A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.','Live action','USA',8.5,NULL,30,4,NULL,NULL,NULL),(52,'Kill Bill: The Whole Bloody Affair','2025-12-05','R','Completed','The Bride wakes from a four-year coma after her jealous ex-lover Bill attempts to murder her on her wedding day, fueling a relentless global quest for vengeance.','Live action','USA',8.8,NULL,31,4,NULL,NULL,'{\"2026-11-05\": 1.0}'),(53,'Grave of the Fireflies','1988-04-16','PG-13','Completed','A young boy and his little sister struggle to survive in Japan during World War II.','Animation 2D','Japan',8.5,NULL,32,5,NULL,NULL,NULL),(54,'Spider-Man: Across the Spider-Verse','2023-06-02','PG','Completed','Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence.','Animation 3D','USA',8.5,11,33,4,58,NULL,'{\"2026-11-05\": 4.0}'),(55,'Alien','1979-06-22','R','Completed','The crew of a commercial spacecraft encounters a deadly lifeform after investigating a mysterious transmission of unknown origin.','Live action','USA',8.5,12,30,10,NULL,NULL,NULL),(56,'WALL-E','2008-06-27','G','Completed','In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.','Animation 3D','USA',8.4,NULL,34,3,NULL,NULL,'{\"2026-11-05\": 1.0}'),(57,'Dune: Part Two','2024-03-01','PG-13','Completed','Paul Atreides unites with Chani and the Fremen while on a warpath of revenge against the conspirators who destroyed his family.','Live action','USA',8.5,13,35,3,NULL,NULL,NULL),(58,'Spider-Man: Into the Spider-Verse','2018-12-14','PG','Completed','Teen Miles Morales becomes the Spider-Man of his universe and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.','Animation 3D','USA',8.4,11,36,4,NULL,NULL,'{\"2026-11-05\": 9.0}'),(59,'The Odyssey','2026-07-17','PG-13','Completed','After the fall of Troy, Greek hero Odysseus embarks on a perilous ten-year voyage across mythical seas to return home to Ithaca and his wife Penelope.','Live action','USA',8.4,NULL,17,8,NULL,NULL,NULL),(60,'Sunset Boulevard','1950-08-10','PG-13','Completed','A screenwriter develops a dangerous relationship with a faded film star determined to make a triumphant return.','Live action','USA',8.4,NULL,37,5,NULL,NULL,NULL),(61,'Coco','2017-11-22','PG','Completed','Aspiring musician Miguel, confronted with his family\'s ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.','Animation 3D','USA',8.4,NULL,38,14,NULL,NULL,NULL),(62,'Toy Story','1995-11-22','G','Completed','A cowboy doll is profoundly threatened and jealous when a new spaceman action figure supplants him as top toy in a boy\'s bedroom.','Animation 3D','USA',8.3,14,39,14,NULL,NULL,NULL),(63,'Your Name.','2016-08-26','PG','Completed','Two teenagers share a profound, magical connection upon discovering they are swapping bodies, and things become even more complicated when they decide to meet in person.','Animation 2D','Japan',8.4,NULL,40,2,NULL,NULL,NULL),(64,'Princess Mononoke','1997-07-12','PG-13','Completed','On a journey to find the cure for a Tatarigami\'s curse, Ashitaka finds himself in the middle of a war between the forest gods and Tatara, a mining colony.','Animation 2D','Japan',8.3,NULL,29,1,NULL,NULL,'{\"2026-11-05\": 1.0}'),(65,'Joker','2019-10-04','R','Completed','During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.','Live action','USA',8.4,NULL,41,11,NULL,NULL,NULL),(66,'Toy Story 3','2010-06-18','G','Completed','The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it\'s up to Woody to convince the other toys to return home.','Animation 3D','USA',8.3,14,38,14,62,NULL,NULL),(67,'Star Wars: Episode VI - Return of the Jedi','1983-05-25','PG','Completed','After rescuing Han Solo from Jabba the Hutt, the Rebels attempt to destroy the second Death Star, while Luke struggles to help Darth Vader back from the dark side.','Live action','USA',8.3,7,42,3,44,NULL,NULL),(68,'Up','2009-05-29','PG','Completed','78-year-old Carl Fredricksen travels to Paradise Falls in his house equipped with balloons, inadvertently taking a young stowaway.','Animation 3D','USA',8.3,NULL,43,14,NULL,NULL,'{\"2026-11-05\": 1.0}'),(69,'Jurassic Park','1993-06-11','PG-13','Completed','A pragmatic paleontologist touring an almost complete theme park on an island in Central America is tasked with protecting a couple of kids after a power failure causes the park\'s cloned dinosaurs to run loose.','Live action','USA',8.2,15,44,3,NULL,NULL,NULL),(70,'Howl\'s Moving Castle','2004-11-20','PG','Completed','When an unconfident young woman is cursed with an old body by a spiteful witch, her only chance of breaking the spell lies with a self-indulgent yet insecure young wizard and his companions in his legged, walking castle.','Animation 2D','Japan',8.2,NULL,29,1,NULL,NULL,NULL),(71,'Project Hail Mary','2026-03-20','PG-13','Completed','A lone astronaut wakes up on a spacecraft light-years from Earth with amnesia and must piece together his past to save humanity from an extinction-level event.','Live action','USA',8.2,NULL,45,3,NULL,NULL,'{\"2026-11-05\": 1.0}'),(72,'Catch Me If You Can','2002-12-25','PG-13','Completed','Barely 21 yet, Frank is a skilled forger who has passed as a doctor, lawyer and pilot. FBI agent Carl becomes obsessed with tracking down the con man, who only revels in the pursuit.','Live action','USA',8.1,NULL,44,16,NULL,NULL,'{\"2026-11-05\": 1.0}'),(73,'Inside Out','2015-06-19','PG','Completed','After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.','Animation 3D','USA',8.1,16,43,14,NULL,NULL,'{\"2026-11-05\": 1.0}'),(74,'Dead Poets Society','1989-06-09','PG','Completed','Maverick teacher John Keating returns in 1959 to the prestigious New England boys\' boarding school where he was once a star student, using poetry to embolden his pupils to new heights of self-expression.','Live action','USA',8.1,NULL,46,5,NULL,NULL,NULL),(75,'Ratatouille','2007-06-29','G','Completed','A rat who can cook makes an unusual alliance with a young kitchen worker at a famous Paris restaurant.','Animation 3D','USA',8.1,NULL,47,14,NULL,NULL,NULL),(76,'Mad Max: Fury Road','2015-05-15','R','Completed','In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search for her homeland with the aid of a group of female prisoners, a psychotic worshiper and a drifter named Max.','Live action','Australia',8.1,17,48,4,NULL,NULL,'{\"2026-11-05\": 2.0}'),(77,'Blade Runner','1982-06-25','R','Completed','A blade runner must pursue and terminate four replicants who stole a ship in space and have returned to Earth to find their creator.','Live action','USA',8.1,18,30,3,NULL,NULL,NULL),(78,'Jaws','1975-06-20','PG','Completed','When a killer shark unleashes chaos on a beach community off Cape Cod, it\'s up to a local sheriff, a marine biologist, and anold seafarer to hunt the beast down.','Live action','USA',8.1,19,44,6,NULL,NULL,NULL),(80,'demo','2026-11-05','G','Upcoming','test','Live action','South Korea',0.0,NULL,49,9,NULL,21,'{\"2026-11-05\": 6.0}');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `media_inherit_universe` BEFORE INSERT ON `media` FOR EACH ROW BEGIN
  IF NEW.universe_id IS NULL AND NEW.sequel_parent_id IS NOT NULL THEN
    SET NEW.universe_id = (SELECT universe_id FROM Media WHERE id = NEW.sequel_parent_id);
  END IF;
  IF NEW.universe_id IS NULL AND NEW.remake_parent_id IS NOT NULL THEN
    SET NEW.universe_id = (SELECT universe_id FROM Media WHERE id = NEW.remake_parent_id);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `media_actor`
--

DROP TABLE IF EXISTS `media_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_actor` (
  `id` int NOT NULL,
  `actor_id` int NOT NULL,
  PRIMARY KEY (`id`,`actor_id`),
  KEY `actor_id` (`actor_id`),
  CONSTRAINT `media_actor_ibfk_1` FOREIGN KEY (`id`) REFERENCES `media` (`id`),
  CONSTRAINT `media_actor_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_actor`
--

LOCK TABLES `media_actor` WRITE;
/*!40000 ALTER TABLE `media_actor` DISABLE KEYS */;
INSERT INTO `media_actor` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(1,4),(2,4),(3,4),(4,4),(6,4),(1,5),(2,5),(3,5),(5,5),(6,5),(7,5),(8,5),(4,6),(5,6),(7,6),(8,6),(9,7),(10,7),(11,7),(9,8),(10,8),(9,9),(11,9),(9,10),(10,11),(11,11),(10,12),(11,13),(12,14),(42,14),(72,14),(12,15),(12,16),(13,17),(13,18),(13,19),(13,20),(14,21),(14,22),(14,23),(14,24),(15,25),(15,26),(15,27),(15,28),(16,29),(17,29),(18,29),(19,29),(20,29),(21,29),(22,29),(23,29),(30,29),(16,30),(17,30),(18,30),(17,31),(18,31),(17,32),(18,33),(19,34),(20,34),(21,34),(22,34),(19,35),(20,35),(21,35),(22,35),(19,36),(20,36),(21,36),(22,36),(19,37),(20,37),(21,37),(22,37),(19,38),(20,38),(22,38),(20,39),(21,40),(22,40),(57,40),(19,41),(21,42),(23,42),(24,42),(25,42),(59,42),(23,43),(24,43),(25,43),(57,43),(59,43),(23,44),(24,44),(25,44),(23,45),(66,45),(24,46),(25,47),(25,48),(25,49),(26,50),(26,51),(27,51),(44,51),(49,51),(67,51),(26,52),(27,53),(27,54),(27,55),(28,56),(28,57),(28,58),(29,59),(29,60),(29,61),(30,62),(36,62),(42,62),(30,63),(30,64),(57,64),(30,65),(46,65),(59,65),(31,66),(31,67),(31,68),(31,69),(32,70),(32,71),(71,71),(32,72),(33,73),(33,74),(33,75),(33,76),(34,77),(34,78),(36,78),(34,79),(35,80),(35,81),(37,81),(35,82),(35,83),(37,83),(35,84),(37,84),(37,85),(65,85),(36,86),(36,87),(36,88),(36,89),(42,89),(46,89),(36,90),(38,91),(39,91),(40,91),(38,92),(39,92),(40,92),(38,93),(39,93),(40,93),(38,94),(39,94),(40,94),(38,95),(39,95),(40,95),(38,96),(39,96),(40,96),(38,97),(40,97),(41,98),(62,98),(66,98),(72,98),(41,99),(41,100),(42,101),(42,102),(42,103),(76,103),(43,104),(43,105),(43,106),(44,107),(49,107),(67,107),(44,108),(49,108),(67,108),(77,108),(44,109),(49,109),(67,109),(44,110),(67,110),(49,111),(45,112),(45,113),(45,114),(45,115),(46,116),(46,117),(59,117),(46,118),(47,119),(47,120),(47,121),(47,122),(48,123),(48,124),(48,125),(48,126),(50,127),(50,128),(50,129),(51,130),(51,131),(65,131),(51,132),(52,133),(52,134),(52,135),(52,136),(52,137),(52,138),(53,139),(53,140),(54,141),(58,141),(54,142),(58,142),(54,143),(54,144),(58,144),(54,145),(58,145),(58,146),(55,147),(56,147),(55,148),(55,149),(39,150),(55,150),(75,150),(56,151),(56,152),(56,153),(57,154),(57,155),(57,156),(57,157),(59,158),(59,159),(59,160),(76,160),(60,161),(60,162),(60,163),(61,164),(61,165),(61,166),(62,167),(66,167),(62,168),(66,168),(66,169),(66,170),(63,171),(63,172),(64,173),(64,174),(64,175),(65,176),(65,177),(68,178),(68,179),(68,180),(69,181),(69,182),(69,183),(69,184),(70,185),(70,186),(70,187),(71,188),(71,189),(72,190),(72,191),(73,192),(73,193),(73,194),(73,195),(74,196),(74,197),(74,198),(75,199),(75,200),(75,201),(75,202),(76,203),(76,204),(77,205),(77,206),(77,207),(78,208),(78,209),(78,210);
/*!40000 ALTER TABLE `media_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_book`
--

DROP TABLE IF EXISTS `media_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_book` (
  `id` int NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`ISBN`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `media_book_ibfk_1` FOREIGN KEY (`id`) REFERENCES `media` (`id`),
  CONSTRAINT `media_book_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_book`
--

LOCK TABLES `media_book` WRITE;
/*!40000 ALTER TABLE `media_book` DISABLE KEYS */;
INSERT INTO `media_book` VALUES (59,'9780140449112'),(39,'9780261102354'),(40,'9780261102361'),(38,'9780261102378'),(30,'9780375726262'),(77,'9780385046947'),(78,'9780385047715'),(41,'9780385231343'),(43,'9780393039764'),(69,'9780394588162'),(35,'9780399103421'),(37,'9780399103421'),(57,'9780441172719'),(72,'9780448165387'),(14,'9780553103540'),(14,'9780553106633'),(14,'9780553108033'),(14,'9780553801477'),(14,'9780553801507'),(71,'9780593135204'),(34,'9780670289030'),(70,'9780688062330'),(1,'9780747532699'),(2,'9780747538493'),(3,'9780747542155'),(4,'9780747546245'),(5,'9780747551003'),(6,'9780747581086'),(7,'9780747591054'),(8,'9780747591054'),(25,'9780785126348'),(16,'9780785143314'),(18,'9780785143314'),(20,'9780785155669'),(21,'9780785156598'),(22,'9780785156598'),(54,'9780785157137'),(58,'9780785157137'),(21,'9780785184232'),(23,'9781302905163'),(24,'9781302917852'),(23,'9781302918866'),(24,'9781302918866'),(25,'9781302918866'),(17,'9781302961817'),(15,'9781524796280'),(33,'9784063842760'),(33,'9784063843385'),(33,'9784063844108'),(33,'9784063844696'),(33,'9784063845136'),(53,'9784167112011'),(28,'9787539940124'),(29,'9787539940124'),(28,'9787539940131'),(29,'9787539940131');
/*!40000 ALTER TABLE `media_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_platform`
--

DROP TABLE IF EXISTS `media_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_platform` (
  `id` int NOT NULL,
  `platform_id` int NOT NULL,
  PRIMARY KEY (`id`,`platform_id`),
  KEY `platform_id` (`platform_id`),
  CONSTRAINT `media_platform_ibfk_1` FOREIGN KEY (`id`) REFERENCES `media` (`id`),
  CONSTRAINT `media_platform_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_platform`
--

LOCK TABLES `media_platform` WRITE;
/*!40000 ALTER TABLE `media_platform` DISABLE KEYS */;
INSERT INTO `media_platform` VALUES (13,1),(23,1),(24,1),(25,1),(31,1),(33,1),(12,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(26,2),(27,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(14,3),(15,3),(30,3),(32,3),(23,4),(24,4),(25,4),(30,4),(31,4),(32,4),(33,4),(12,5),(28,6),(33,6),(28,7),(29,8),(31,8),(80,11);
/*!40000 ALTER TABLE `media_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL,
  `duration` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,152.00),(2,161.00),(3,142.00),(4,157.00),(5,138.00),(6,153.00),(7,146.00),(8,130.00),(9,132.00),(10,134.00),(11,142.00),(12,194.00),(16,126.00),(17,124.00),(18,130.00),(19,143.00),(20,141.00),(21,149.00),(22,181.00),(23,133.00),(24,129.00),(25,148.00),(26,88.00),(27,118.00),(30,180.00),(31,132.00),(32,114.00),(34,142.00),(35,175.00),(36,152.00),(37,202.00),(38,201.00),(39,178.00),(40,179.00),(41,142.00),(42,148.00),(43,139.00),(44,124.00),(45,136.00),(46,169.00),(47,137.00),(48,116.00),(49,121.00),(50,125.00),(51,155.00),(52,247.00),(53,89.00),(54,140.00),(55,117.00),(56,98.00),(57,166.00),(58,117.00),(59,172.00),(60,110.00),(61,105.00),(62,81.00),(63,106.00),(64,134.00),(65,122.00),(66,103.00),(67,131.00),(68,96.00),(69,127.00),(70,119.00),(71,157.00),(72,141.00),(73,95.00),(74,128.00),(75,111.00),(76,120.00),(77,117.00),(78,124.00),(80,100.00);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `normal_user`
--

DROP TABLE IF EXISTS `normal_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normal_user` (
  `accountID` int NOT NULL,
  PRIMARY KEY (`accountID`),
  CONSTRAINT `normal_user_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `user` (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normal_user`
--

LOCK TABLES `normal_user` WRITE;
/*!40000 ALTER TABLE `normal_user` DISABLE KEYS */;
INSERT INTO `normal_user` VALUES (3),(4),(6);
/*!40000 ALTER TABLE `normal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform` (
  `platform_id` int NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(45) NOT NULL,
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (1,'Netflix'),(2,'Disney+'),(3,'HBO Max'),(4,'Amazon Prime Video'),(5,'Apple TV'),(6,'iQIYI'),(7,'WeTV'),(8,'Viu'),(9,'Monomax'),(10,'TrueVisions'),(11,'YouTube');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Bloomsbury'),(2,'Bantam Books'),(3,'Ocean Press'),(4,'Kodansha'),(5,'Marvel Comics'),(6,'Vintage'),(7,'Viking Press'),(8,'G.P. Putnam\'s Sons'),(9,'George Allen & Unwin'),(10,'Doubleday'),(11,'W.W. Norton & Company'),(12,'Bungeishunju'),(13,'Chilton Books'),(14,'Penguin Classics'),(15,'Alfred A. Knopf'),(16,'Greenwillow Books'),(17,'Ballantine Books'),(18,'Grosset & Dunlap');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `id` int NOT NULL,
  `episode_number` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (13,42),(14,73),(15,18),(28,35),(29,20),(33,89);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subgenre`
--

DROP TABLE IF EXISTS `subgenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subgenre` (
  `id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `subgenre_ibfk_1` FOREIGN KEY (`id`) REFERENCES `media` (`id`),
  CONSTRAINT `subgenre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgenre`
--

LOCK TABLES `subgenre` WRITE;
/*!40000 ALTER TABLE `subgenre` DISABLE KEYS */;
INSERT INTO `subgenre` VALUES (32,1),(33,1),(44,1),(49,1),(54,1),(59,1),(61,1),(62,1),(63,1),(66,1),(67,1),(75,1),(6,2),(41,2),(56,2),(70,2),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(54,3),(55,3),(58,3),(76,3),(8,4),(11,4),(14,4),(15,4),(38,4),(39,4),(40,4),(42,4),(44,4),(45,4),(47,4),(49,4),(57,4),(59,4),(64,4),(67,4),(69,4),(5,5),(7,5),(10,5),(12,5),(14,5),(15,5),(21,5),(22,5),(25,5),(26,5),(27,5),(28,5),(29,5),(31,5),(35,5),(36,5),(37,5),(38,5),(39,5),(40,5),(46,5),(51,5),(57,5),(59,5),(63,5),(65,5),(68,5),(71,5),(72,5),(73,5),(77,5),(78,5),(36,6),(42,6),(43,6),(47,6),(52,6),(55,6),(65,6),(69,6),(76,6),(77,6),(23,7),(24,7),(41,7),(48,7),(58,7),(61,7),(62,7),(66,7),(68,7),(72,7),(73,7),(74,7),(75,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(11,8),(14,8),(15,8),(16,8),(17,8),(18,8),(19,8),(20,8),(21,8),(22,8),(23,8),(24,8),(25,8),(26,8),(27,8),(32,8),(38,8),(39,8),(40,8),(42,8),(44,8),(46,8),(48,8),(49,8),(50,8),(51,8),(54,8),(56,8),(57,8),(58,8),(61,8),(62,8),(64,8),(66,8),(67,8),(68,8),(69,8),(70,8),(71,8),(73,8),(75,8),(76,8),(78,8),(2,9),(3,9),(4,9),(6,9),(13,9),(33,9),(60,9),(77,9),(13,10),(33,10),(34,11),(36,11),(43,11),(52,11),(60,11),(72,11),(12,12),(28,12),(29,12),(30,12),(51,12),(53,12),(13,13),(50,13),(63,13),(1,14),(9,14),(50,14),(56,14),(30,16);
/*!40000 ALTER TABLE `subgenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universe`
--

DROP TABLE IF EXISTS `universe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universe` (
  `universe_id` int NOT NULL AUTO_INCREMENT,
  `universe_name` varchar(100) NOT NULL,
  PRIMARY KEY (`universe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universe`
--

LOCK TABLES `universe` WRITE;
/*!40000 ALTER TABLE `universe` DISABLE KEYS */;
INSERT INTO `universe` VALUES (1,'Harry Potter'),(2,'Game of Thrones Universe'),(3,'Marvel Cinematic Universe'),(4,'The Godfather Saga'),(5,'The Dark Knight Trilogy'),(6,'Middle-earth'),(7,'Star Wars'),(8,'The Matrix'),(9,'Terminator'),(10,'Back to the Future'),(11,'Spider-Verse'),(12,'Alien Universe'),(13,'Dune Universe'),(14,'Toy Story'),(15,'Jurassic Park'),(16,'Inside Out'),(17,'Mad Max'),(18,'Blade Runner'),(19,'Jaws');
/*!40000 ALTER TABLE `universe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `accountID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `gmail` varchar(100) NOT NULL,
  PRIMARY KEY (`accountID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `gmail` (`gmail`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$D8hQJ3/vThSDK043xkcyZOW.QzG.GzFPkOfGDSJpjljDBzIgxsiYa','admin@mediauniverse.com'),(2,'developer','$2a$10$rMoUaahK4/ZjjYaM0fkDCuyNWDGNonrn.xGwVlPdTMQ8Nx3JcL1WG','dev@mediauniverse.com'),(3,'tiny','$2a$10$bVwXk7SQUx2sH/hA9NeLPendWj4wzcBrq3yekboqL7TaCg9GCU8qq','efwf@gmail.com'),(4,'john','$2a$10$pU6m414WGJMJxTpMxopJ/.sDZd9vosKdCjUpfufBIq9UEoed4U43S','john@gmail.com'),(6,'may','$2a$10$GeR7q3Qi9uVIhPXDatZBEuPYWf/SjA62BVqy4KDa04KxpBBnND7HO','may@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `accountID` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`accountID`,`id`),
  KEY `id` (`id`),
  CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `normal_user` (`accountID`),
  CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (3,14),(3,17),(4,30),(4,33),(3,41),(3,58);
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mediadb'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_universe_media` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_universe_media`(IN p_universe_id INT)
BEGIN
  SELECT m.id, m.title, m.publish_date, m.age_rating, m.status, m.synopsis,
         m.category, m.country, m.rating,
         CASE WHEN mv.id IS NOT NULL THEN 'Movie'
              WHEN s.id  IS NOT NULL THEN 'Series'
              ELSE 'Other' END AS media_type,
         mv.duration, s.episode_number,
         m.main_genre_id, g.genre_name AS main_genre,
         m.director_id,   d.director_name,
         m.universe_id,   u.universe_name,
         m.sequel_parent_id, m.remake_parent_id
  FROM Media m
  LEFT JOIN Movies mv  ON mv.id = m.id
  LEFT JOIN Series s   ON s.id  = m.id
  LEFT JOIN Genre g    ON g.genre_id    = m.main_genre_id
  LEFT JOIN Director d ON d.director_id = m.director_id
  LEFT JOIN Universe u ON u.universe_id = m.universe_id
  WHERE m.universe_id = p_universe_id
  ORDER BY m.publish_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-05 23:51:42
