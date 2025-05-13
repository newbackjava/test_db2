CREATE DATABASE  IF NOT EXISTS `shopdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shopdb`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: shopdb
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `deletedmembertbl`
--

DROP TABLE IF EXISTS `deletedmembertbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletedmembertbl` (
  `memberID` char(8) DEFAULT NULL,
  `memberName` char(5) DEFAULT NULL,
  `memberAddress` char(20) DEFAULT NULL,
  `deletedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedmembertbl`
--

LOCK TABLES `deletedmembertbl` WRITE;
/*!40000 ALTER TABLE `deletedmembertbl` DISABLE KEYS */;
INSERT INTO `deletedmembertbl` VALUES ('Dang','당탕이','경기 부천시 중동','2019-08-18');
/*!40000 ALTER TABLE `deletedmembertbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indextbl`
--

DROP TABLE IF EXISTS `indextbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indextbl` (
  `first_name` varchar(14) DEFAULT NULL,
  `last_name` varchar(16) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  KEY `idx_indexTBL_firstname` (`first_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indextbl`
--

LOCK TABLES `indextbl` WRITE;
/*!40000 ALTER TABLE `indextbl` DISABLE KEYS */;
INSERT INTO `indextbl` VALUES ('Georgi','Facello','1986-06-26'),('Bezalel','Simmel','1985-11-21'),('Parto','Bamford','1986-08-28'),('Chirstian','Koblick','1986-12-01'),('Kyoichi','Maliniak','1989-09-12'),('Anneke','Preusig','1989-06-02'),('Tzvetan','Zielinski','1989-02-10'),('Saniya','Kalloufi','1994-09-15'),('Sumant','Peac','1985-02-18'),('Duangkaew','Piveteau','1989-08-24'),('Mary','Sluis','1990-01-22'),('Patricio','Bridgland','1992-12-18'),('Eberhardt','Terkki','1985-10-20'),('Berni','Genin','1987-03-11'),('Guoxiang','Nooteboom','1987-07-02'),('Kazuhito','Cappelletti','1995-01-27'),('Cristinel','Bouloucos','1993-08-03'),('Kazuhide','Peha','1987-04-03'),('Lillian','Haddadi','1999-04-30'),('Mayuko','Warwick','1991-01-26'),('Ramzi','Erde','1988-02-10'),('Shahaf','Famili','1995-08-22'),('Bojan','Montemayor','1989-12-17'),('Suzette','Pettey','1997-05-19'),('Prasadram','Heyers','1987-08-17'),('Yongqiao','Berztiss','1995-03-20'),('Divier','Reistad','1989-07-07'),('Domenick','Tempesti','1991-10-22'),('Otmar','Herbst','1985-11-20'),('Elvis','Demeyer','1994-02-17'),('Karsten','Joslin','1991-09-01'),('Jeong','Reistad','1990-06-20'),('Arif','Merlo','1987-03-18'),('Bader','Swan','1988-09-21'),('Alain','Chappelet','1988-09-05'),('Adamantios','Portugali','1992-01-03'),('Pradeep','Makrucki','1990-12-05'),('Huan','Lortz','1989-09-20'),('Alejandro','Brender','1988-01-19'),('Weiyi','Meriste','1993-02-14'),('Uri','Lenart','1989-11-12'),('Magy','Stamatiou','1993-03-21'),('Yishay','Tzvieli','1990-10-20'),('Mingsen','Casley','1994-05-21'),('Moss','Shanbhogue','1989-09-02'),('Lucien','Rosenbaum','1992-06-20'),('Zvonko','Nyanchama','1989-03-31'),('Florian','Syrotiuk','1985-02-24'),('Basil','Tramer','1992-05-04'),('Yinghua','Dredge','1990-12-25'),('Hidefumi','Caine','1992-10-15'),('Heping','Nitsch','1988-05-21'),('Sanjiv','Zschoche','1986-02-04'),('Mayumi','Schueller','1995-03-13'),('Georgy','Dredge','1992-04-27'),('Brendon','Bernini','1990-02-01'),('Ebbe','Callaway','1992-01-15'),('Berhard','McFarlin','1987-04-13'),('Alejandro','McAlpine','1991-06-26'),('Breannda','Billingsley','1987-11-02'),('Tse','Herber','1985-09-17'),('Anoosh','Peyn','1991-08-30'),('Gino','Leonhardt','1989-04-08'),('Udi','Jansch','1985-11-20'),('Satosi','Awdeh','1988-05-18'),('Kwee','Schusler','1986-02-26'),('Claudi','Stavenow','1987-03-04'),('Charlene','Brattka','1987-08-07'),('Margareta','Bierman','1989-11-05'),('Reuven','Garigliano','1985-10-14'),('Hisao','Lipner','1987-10-01'),('Hironoby','Sidou','1988-07-21'),('Shir','McClurg','1991-12-01'),('Mokhtar','Bernatsky','1990-08-13'),('Gao','Dolinsky','1987-03-19'),('Erez','Ritzmann','1985-07-09'),('Mona','Azuma','1990-03-02'),('Danel','Mondadori','1987-05-26'),('Kshitij','Gils','1986-03-27'),('Premal','Baek','1985-11-19'),('Zhongwei','Rosen','1986-10-30'),('Parviz','Lortz','1990-01-03'),('Vishv','Zockler','1987-03-31'),('Tuval','Kalloufi','1995-12-15'),('Kenroku','Malabarba','1994-04-09'),('Somnath','Foote','1990-02-16'),('Xinglin','Eugenio','1986-09-08'),('Jungsoon','Syrzycki','1988-09-02'),('Sudharsan','Flasterstein','1986-08-12'),('Kendra','Hofting','1986-03-14'),('Amabile','Gomatam','1992-11-18'),('Valdiodio','Niizuma','1989-09-22'),('Sailaja','Desikan','1996-11-05'),('Arumugam','Ossenbruggen','1987-04-18'),('Hilari','Morton','1986-07-15'),('Jayson','Mandell','1990-01-14'),('Remzi','Waschkowski','1990-09-15'),('Sreekrishna','Servieres','1985-05-13'),('Valter','Sullins','1988-10-18'),('Hironobu','Haraldson','1987-09-21'),('Perla','Heyers','1992-12-28'),('Paraskevi','Luby','1994-01-26'),('Akemi','Birch','1986-12-02'),('Xinyu','Warwick','1987-04-16'),('Hironoby','Piveteau','1999-03-23'),('Eben','Aingworth','1990-12-19'),('Dung','Baca','1994-03-22'),('Lunjin','Giveon','1986-10-02'),('Mariusz','Prampolini','1993-06-16'),('Xuejia','Ullian','1986-08-22'),('Hugo','Rosis','1988-06-19'),('Yuichiro','Swick','1985-10-08'),('Jaewon','Syrzycki','1989-12-24'),('Munir','Demeyer','1992-07-17'),('Chikara','Rissland','1986-01-23'),('Dayanand','Czap','1985-05-28'),('Kiyotoshi','Blokdijk','1990-05-28'),('Zhonghui','Zyda','1990-09-13'),('Domenick','Peltason','1986-03-14'),('Armond','Fairtlough','1996-07-06'),('Guoxiang','Ramsay','1989-05-03'),('Ohad','Esposito','1992-12-23'),('Hinrich','Randi','1993-01-15'),('Geraldo','Marwedel','1991-09-05'),('Syozo','Hiltgen','1990-10-26'),('Kayoko','Valtorta','1985-09-08'),('Subir','Baja','1989-01-14'),('Babette','Lamba','1988-06-06'),('Armond','Peir','1985-12-10'),('Nishit','Casperson','1988-06-21'),('Magdalena','Eldridge','1994-11-17'),('Ayakannu','Skrikant','1994-10-30'),('Giri','Isaak','1985-12-15'),('Diederik','Siprelle','1987-12-12'),('Nathan','Monkewich','1988-02-19'),('Zissis','Pintelas','1986-02-11'),('Maren','Hutton','1985-02-18'),('Perry','Shimshoni','1986-09-18'),('Ewing','Foong','1998-03-15'),('Yucel','Auria','1991-03-14'),('Shahaf','Ishibashi','1993-05-06'),('Tzvetan','Hettesheimer','1993-10-28'),('Sakthirel','Bakhtari','1988-09-30'),('Marla','Brendel','1985-10-14'),('Akemi','Esposito','1987-08-01'),('Chenyi','Syang','1988-06-28'),('Kazuhito','Encarnacion','1986-08-21'),('Douadi','Azumi','1995-10-10'),('Xiadong','Perry','1986-11-05'),('Zhenbing','Perng','1986-11-16'),('Itzchak','Lichtner','1990-04-10'),('Jaques','Munro','1986-01-27'),('Heekeun','Majewski','1987-04-08'),('Abdulah','Thibadeau','1990-12-12'),('Adas','Nastansky','1990-01-05'),('Sumali','Fargier','1985-03-10'),('Nigel','Aloisi','1985-11-02'),('Khedija','Mitsuhashi','1986-01-29'),('Serif','Buescher','1991-05-29'),('Debatosh','Khasidashvili','1989-01-30'),('Hairong','Mellouli','1988-04-03'),('Florina','Eugenio','1991-05-01'),('Karsten','Szmurlo','1989-07-19'),('Jagoda','Braunmuhl','1985-11-12'),('Miyeon','Macedo','1988-05-17'),('Samphel','Siegrist','1993-01-01'),('Duangkaew','Rassart','1992-04-04'),('Dharmaraja','Stassinopoulos','1986-12-06'),('Sampalli','Snedden','1992-07-24'),('Kasturi','Jenevein','1986-01-02'),('Herbert','Trachtenberg','1989-07-22'),('Shigeu','Matzen','1995-10-13'),('Shrikanth','Mahmud','1992-03-21'),('Badri','Furudate','1987-06-01'),('Aleksandar','Ananiadou','1988-01-11'),('Brendon','Lenart','1994-12-22'),('Pragnesh','Iisaka','1993-02-06'),('Valery','Litvinov','1986-10-07'),('Deniz','Duclos','1990-10-04'),('Shaw','Wendorf','1986-02-25'),('Sibyl','Nooteboom','1988-06-22'),('Moriyoshi','Merey','1990-09-02'),('Mechthild','Bonifati','1996-08-11'),('Mihalis','Lowrie','1987-10-29'),('Duro','Sidhu','1986-03-01'),('Shigehito','Kropatsch','1986-03-28'),('Tommaso','Narwekar','1991-06-01'),('Christ','Muchinsky','1987-08-27'),('Khalid','Erva','1989-10-05'),('Arve','Fairtlough','1986-06-23'),('Zdislav','Nastansky','1986-04-10'),('Mohua','Falck','1988-06-13'),('Masaru','Cheshire','1991-07-28'),('Josyula','Hofmeyr','1989-05-15'),('Annemarie','Redmiles','1985-02-15'),('Marc','Hellwagner','1994-11-16'),('Kasidit','Krzyzanowski','1993-11-22'),('Pranav','Furedi','1985-08-31'),('Kazuhisa','Ranta','1997-04-29'),('Vidya','Awdeh','1985-10-16'),('Idoia','Kavraki','1986-11-22'),('Greger','Lichtner','1991-10-06'),('Steen','Escriba','1989-04-06'),('Nevio','Ritcey','1986-12-04'),('Mabhin','Leijenhorst','1993-08-23'),('Alassane','Iwayama','1988-04-19'),('Girolamo','Anandan','1992-10-11'),('Xiping','Klerer','1991-12-23'),('Yolla','Ellozy','1991-11-23'),('Yuping','Alpin','1994-05-10'),('Vishu','Strehl','1989-11-18'),('Divier','Esteva','1990-07-11'),('Jackson','Kakkad','1992-11-06'),('Tadahiko','Ciolek','1988-02-29'),('Xiaobin','Duclos','1987-10-19'),('Amstein','Ghemri','1987-10-30'),('Yongmin','Roison','1986-05-12'),('Zhenhua','Magalhaes','1997-01-15'),('Genta','Kolvik','1993-03-31'),('Kish','Fasbender','1992-06-25'),('Yucai','Granlund','1988-06-08'),('Tze','Nourani','1986-06-08'),('Carrsten','Schmiedel','1985-11-18'),('Leon','Trogemann','1988-01-09'),('Kellie','Chinen','1986-06-19'),('Xinglin','Plessier','1989-10-27'),('Anneli','Kaiser','1994-04-24'),('Karoline','Cesareni','1991-08-26'),('Ulises','Takanami','1987-11-22'),('Clyde','Vernadat','1996-06-16'),('Shaowen','Desikan','1996-04-13'),('Marko','Auria','1992-06-04'),('Lein','Vendrig','1985-07-05'),('Arunachalam','Bakhtari','1990-11-19'),('Susanta','Roccetti','1995-04-06'),('Susumu','Bade','1996-08-30'),('Yannis','Mandell','1989-08-11'),('Mototsugu','Gire','1986-11-19'),('Nikolaos','Llado','1995-05-08'),('Remko','Maccarone','1998-10-06'),('Ortrud','Murillo','1988-06-12'),('Lunjin','Ozeri','1988-01-18'),('Wonhee','Pouyioutas','1985-11-24'),('Foong','Flasterstein','1985-12-23'),('Ramalingam','Gente','1985-04-26'),('Basem','Teitelbaum','1987-07-12'),('Heon','Riefers','1992-08-14'),('Frederique','Tempesti','1991-08-13'),('Marie','Boreale','1991-12-08'),('Serap','Etalle','1992-08-30'),('Alair','Rosenbaum','1992-06-25'),('Shirish','Wegerle','1990-11-08'),('Zsolt','Salinas','1985-02-21'),('Shen','Brattka','1990-06-14'),('Roddy','Garnick','1993-05-12'),('Irene','Radhakrishnan','1985-10-12'),('Aiman','Riexinger','1986-08-05'),('Basil','Ishibashi','1985-05-17'),('Susanna','Vesel','1986-06-25'),('Alper','Suomi','1991-04-13'),('Mang','Erie','1993-10-20'),('Mahendra','Maraist','1992-07-27'),('Takahiro','Waterhouse','1994-02-05'),('Nalini','Kawashimo','1997-07-16'),('Ramalingam','Muniz','1989-07-13'),('Sukumar','Rassart','1990-05-25'),('Shaunak','Cullers','1996-12-11'),('Nishit','Siochi','1986-12-17'),('Taizo','Oxman','1988-07-24'),('Bedir','Hartvigsen','1990-04-26'),('Sham','Eastman','1986-05-23'),('Yishai','Cannane','1988-05-23'),('Baocai','Lieblein','1985-11-06'),('Dmitri','Pearson','1991-04-21'),('Marek','Luck','1987-09-08'),('Xuejun','Hempstead','1985-07-21'),('Isaac','Schwartzbauer','1985-06-16'),('Lubomir','Nitsch','1991-05-17'),('Barton','Jumpertz','1994-12-20'),('Stabislas','Delgrange','1988-03-18'),('Moty','Kusakari','1994-12-03'),('Hercules','Benzmuller','1986-06-04'),('Kauko','Birjandi','1988-05-25'),('Masali','Murrill','1997-07-02'),('Zhonghui','Preusig','1995-02-27'),('Saddek','Gopalakrishnan','1988-03-21'),('Marie','Pietracaprina','1992-12-28'),('Selwyn','Perri','1994-08-29'),('Shay','Poulakidas','1990-06-06'),('Yongmao','Pleszkun','1991-09-18'),('Dipayan','Seghrouchni','1986-09-29'),('Yucel','Ghelli','1989-06-05'),('Mihalis','Avouris','1992-12-12'),('Rutger','Miara','1996-04-08'),('Kristine','Velardi','1990-08-27'),('Petter','Lorho','1989-09-16'),('Narain','Oaver','1986-05-28'),('Dietrich','DuCasse','1999-03-30'),('Ipke','Stentiford','1990-01-10'),('Tadahiko','Ulupinar','1991-05-17'),('Lucien','Staudhammer','1988-05-23'),('Faiza','Baer','1986-07-22'),('Marlo','Zschoche','1990-02-05'),('Bernt','Erie','1992-11-16'),('Hirochika','Piancastelli','1988-10-31'),('Heng','Kilgour','1993-09-06'),('Nikolaos','Leaver','1991-04-10'),('Dzung','Holburn','1992-12-29'),('Prodip','Schusler','1985-06-20'),('Aksel','Alencar','1990-10-24'),('Hsiangchu','Molenkamp','1991-04-01'),('Rasiah','Deyuan','1986-08-28'),('Subbu','Riexinger','1994-10-10'),('Christfried','Apsitis','1986-01-16'),('Maris','Angelopoulos','1987-08-28'),('Christoper','Schwaller','1987-09-04'),('Arie','Birge','1986-12-10'),('Mototsugu','Beilner','1985-06-29'),('Mechthild','Miyakawa','1985-08-15'),('Uinam','Stasinski','1988-11-03'),('Guenter','Ravishankar','1991-09-24'),('Isamu','Dahlbom','1990-01-29'),('Kankanahalli','Hinsberger','1991-06-06'),('Bernardo','Rouquie','1988-03-19'),('Arunachalam','Badr','1990-09-20'),('Masali','Czap','1985-05-13'),('Roded','Facello','1987-09-18'),('Serenella','Kawashima','1994-01-16'),('Remko','Shigei','1986-01-20'),('Kasturi','Bellmore','1985-06-12'),('Arto','Binkley','1985-04-06'),('Masanao','Bain','1988-06-08'),('Snehasis','Dymetman','1993-01-16'),('Falguni','Erie','1996-12-28'),('Toshimori','Bahi','1992-04-06'),('Goa','Rothe','1992-01-07'),('Jeong','Sadowsky','1995-08-06'),('Heon','Ranai','1988-09-01'),('Teunis','Liedekerke','1989-11-30'),('Djelloul','Laventhal','1987-06-05'),('Wilmer','Greenaway','1987-04-29'),('Stella','Hiroyama','1987-07-25'),('Dinah','Syrzycki','1993-10-14'),('Uwe','Garnier','1994-06-25'),('Arra','Ratnakar','1993-11-08'),('Aamod','Radwan','1987-01-27'),('Pradeep','Kaminger','1985-12-12'),('Mahendra','Picco','1995-10-22'),('Oksana','Brodie','1991-09-28'),('Kristen','Kavvadias','1990-08-19'),('Tadahiko','Strehl','1985-03-07'),('Erzsebet','Ohori','1996-01-21'),('Phule','Hammerschmidt','1989-08-24'),('Moto','Kusakari','1996-03-26'),('Satyanarayana','Cochrane','1987-11-15'),('Vasilis','Standera','1988-08-06'),('Hausi','Sidhu','1994-04-04'),('Qunsheng','Tagansky','1991-02-19'),('Heekeun','Sambasivam','1991-05-09'),('Irene','Munck','1996-09-04'),('Seshu','Sidou','1986-10-23'),('Shalesh','dAstous','1988-08-24'),('Toshiki','Muniz','1985-09-11'),('Nakhoon','Dengi','1985-11-14'),('Rosine','Granlund','1987-06-02'),('Morrie','Piazza','1994-04-11'),('Hyuckchul','Gini','1991-06-24'),('Hatim','Koshiba','1991-04-05'),('Qunsheng','Toyoshima','1986-05-17'),('Clyde','Fandrianto','1992-04-04'),('Ioana','Kirkerud','1989-11-28'),('Anneli','Frijda','1985-07-30'),('Hongzue','Heijenga','1997-04-26'),('Willard','Rosin','1993-12-08'),('Dante','Kalafatis','1994-05-29'),('Fai','Bale','1989-01-14'),('Marl','Grospietsch','1990-05-07'),('Takahira','Lichtner','1990-12-30'),('Mikhail','Rosis','1996-07-15'),('Alejandro','Kamble','1985-03-19'),('Jiong','Parfitt','1991-12-04'),('Shirish','Dredge','1990-07-04'),('Leucio','Aumann','1991-06-19'),('Feiyu','Luft','1986-01-16'),('Khatoun','Imataki','1992-12-20'),('Eishiro','Miyakawa','1985-08-02'),('Parto','Wrigley','1987-02-19'),('Hironoby','Kaiser','1996-03-24'),('Make','Peir','1995-10-31'),('Wanqing','Bratten','1989-05-17'),('Hongzue','Akaboshi','1989-12-24'),('Jiann','Hainaut','1992-03-01'),('Yagil','DasSarma','1989-06-23'),('Shawna','Meriste','1991-03-14'),('Takahiro','Deverell','1987-02-04'),('Sibyl','Rahier','1986-01-11'),('Irena','Reutenauer','1993-05-21'),('Shooichi','Escriba','1990-10-12'),('Guenter','Marchegay','1985-05-07'),('Ortrud','Nitto','1993-10-17'),('Eckart','Barriga','1991-04-05'),('Volkmar','Ebeling','1987-01-02'),('Atreyi','Mungall','1991-09-13'),('Prodip','Rosti','1988-08-28'),('Hilary','Budinsky','1985-11-04'),('Sigeru','Wynblatt','1987-03-11'),('Ulf','Siepmann','1990-03-08'),('Martijn','Kaiser','1998-10-07'),('Mario','Straney','1997-07-09'),('Takahito','Gecsei','1993-10-16'),('Lidong','Klerer','1989-09-02'),('Masoud','Fabrizio','1986-05-06'),('Danel','Impagliazzo','1990-03-26'),('Yinlin','Alpin','1990-05-30'),('Mark','Coorg','1993-10-25'),('Uli','Keustermans','1989-03-24'),('Bingning','Bakhtari','1992-03-12'),('Candida','Porotnikoff','1989-04-20'),('Maria','Bauknecht','1992-04-25'),('Kaijung','Riesenhuber','1988-01-17'),('Divine','Marzano','1989-09-12'),('Greger','Rubsam','1990-12-07'),('Dante','Cronin','1998-09-06'),('Babette','Straney','1989-08-07'),('Sashi','Osgood','1991-10-29'),('Arunas','Luce','1985-07-06'),('Khosrow','Sudbeck','1991-11-01'),('Cathie','Brlek','1992-06-04'),('Martien','Improta','1986-03-09'),('Ferdinand','Chenney','1990-11-16'),('Patricio','Bugrara','1987-10-08'),('Hisao','Tiemann','1985-04-30'),('Reuven','Dengi','1989-02-14'),('Dzung','Peltason','1995-06-27'),('Marsha','Tagansky','1986-12-19'),('Yahiko','Lammel','1988-01-30'),('Narain','Reeker','1996-04-12'),('Evgueni','Srimani','1990-01-19'),('Jolita','Jarecki','1990-01-11'),('Akeel','Narahara','1994-03-31'),('Adel','Perfilyeva','1988-07-12'),('Volkmar','Unno','1988-03-13'),('Shichao','Litvinov','1989-08-01'),('Kazuhira','Rosis','1993-03-31'),('Junichi','Kavanagh','1987-11-04'),('Ebru','Chepyzhov','1994-11-17'),('Ronghao','Yavatkar','1988-12-29'),('Phule','Oxenboll','1992-03-12'),('Aleksandar','Sudkamp','1987-03-28'),('Khun','Harbusch','1990-01-17'),('Bodh','Ranta','1988-03-12'),('Werner','Hasham','1988-09-05'),('Tsvetan','Matzel','1985-04-02'),('Wonhee','Badr','1987-04-10'),('Sverrir','Streng','1989-02-14'),('Stepehn','Hardjono','1995-12-25'),('Oddvar','Schlenzig','1991-11-23'),('Gina','Engelmann','1988-07-23'),('Ennio','Trogemann','1997-06-28'),('Shushma','VanScheik','1994-07-01'),('Gal','Karcich','1987-08-03'),('Sumali','Schlenzig','1996-03-25'),('Ung','Zaiane','1987-12-25'),('Mang','Maginnis','1989-10-09'),('Claudi','Shackel','1987-09-01'),('Jiakeng','Himler','1985-09-29'),('Dipayan','Suomi','1988-07-14'),('Yoshimitsu','Shobatake','1991-05-28'),('Munehiko','Ananiadou','1985-06-05'),('Peternela','Iwayama','1988-06-01'),('Jouko','Yamaashi','1990-11-18'),('Salvador','Lodder','1996-07-29'),('Przemyslawa','Oskamp','1987-10-30'),('Kenton','Garnham','1985-09-28'),('Mario','Rodite','1987-01-19'),('Kokou','Iisaka','1987-09-20'),('Guoxiang','Trogemann','1989-03-04'),('Maik','Ushiama','1992-06-09'),('Duro','Coney','1987-02-28'),('Make','Baba','1988-05-18'),('Yongmao','Pintelas','1988-10-06'),('Goa','Pleszkun','1991-07-20'),('Zhiwei','Anick','1992-11-08'),('Nirmal','Varley','1995-10-31'),('Teruyuki','Sundgren','1985-10-27'),('Amstein','Kossowski','1987-10-08'),('Perla','Middleton','1992-08-14'),('Mihalis','Heering','1994-06-09'),('Elvia','Homond','1989-09-10'),('Huiqun','Vuskovic','1992-10-07'),('Garnik','Narahari','1990-01-17'),('Lobel','Kumaresan','1988-04-24'),('Maris','Haraldson','1992-05-16'),('Yakkov','Servieres','1986-01-18'),('Anyuan','Zhiwei','1985-09-29'),('Gretta','Baig','1987-02-26'),('Pramod','Rabehasaina','1992-01-22'),('Valter','Cappelletti','1988-02-01'),('Maik','Luft','1989-11-23'),('Vojin','Narwekar','1996-12-16');
/*!40000 ALTER TABLE `indextbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membertbl`
--

DROP TABLE IF EXISTS `membertbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membertbl` (
  `memberID` char(8) NOT NULL,
  `memberName` char(5) NOT NULL,
  `memberAddress` char(20) DEFAULT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membertbl`
--

LOCK TABLES `membertbl` WRITE;
/*!40000 ALTER TABLE `membertbl` DISABLE KEYS */;
INSERT INTO `membertbl` VALUES ('Han','한주연','인천 남구 주안동'),('Jee','지운이','서울 은평구 증산동'),('Sang','상길이','경기 성남시 분당구');
/*!40000 ALTER TABLE `membertbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_deletedMemberTBL` AFTER DELETE ON `membertbl` FOR EACH ROW -- 각 행마다 적용시킴
BEGIN 
	-- OLD 테이블의 내용을 백업테이블에 삽입
	INSERT INTO deletedMemberTBL 
		VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE() ); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producttbl`
--

DROP TABLE IF EXISTS `producttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producttbl` (
  `productName` char(4) NOT NULL,
  `cost` int(11) NOT NULL,
  `makeDate` date DEFAULT NULL,
  `company` char(5) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`productName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttbl`
--

LOCK TABLES `producttbl` WRITE;
/*!40000 ALTER TABLE `producttbl` DISABLE KEYS */;
INSERT INTO `producttbl` VALUES ('냉장고',5,'2023-02-01','대우',22),('세탁기',20,'2022-09-01','LG',3),('컴퓨터',10,'2021-01-01','삼성',17);
/*!40000 ALTER TABLE `producttbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `uv_membertbl`
--

DROP TABLE IF EXISTS `uv_membertbl`;
/*!50001 DROP VIEW IF EXISTS `uv_membertbl`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `uv_membertbl` AS SELECT 
 1 AS `memberName`,
 1 AS `memberAddress`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'shopdb'
--

--
-- Dumping routines for database 'shopdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `myProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `myProc`()
BEGIN
	SELECT * FROM memberTBL WHERE memberName = '당탕이' ;
	SELECT * FROM productTBL WHERE productName = '냉장고' ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `uv_membertbl`
--

/*!50001 DROP VIEW IF EXISTS `uv_membertbl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `uv_membertbl` AS select `membertbl`.`memberName` AS `memberName`,`membertbl`.`memberAddress` AS `memberAddress` from `membertbl` */;
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

-- Dump completed on 2019-08-18 20:10:45
