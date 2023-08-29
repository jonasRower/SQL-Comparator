-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: test2023
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customer (
	`customer_id` int, 
	`cust_name` varchar(255), 
	`city` varchar(255), 
	`grade` int, 
	`salesman_id` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES(3001,"Brad Guzan","London", null,5005);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES(3002,"Nick Rimando","New York",100,5001);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES(3003,"Jozy Altidor","Moscow",200,5007);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES(3004,"Fabian Johnson","Paris",300,5006);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES(3005,"Graham Zusi","California",200,5002);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES(3007,"Brad Davis","New York",200,5001);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES(3008,"Julian Green","London",300,5002);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES(3009,"Geoff Cameron","Berlin",100,5003);

/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `faktury`
--



DROP TABLE IF EXISTS `faktury`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faktury` (
  `cislo` varchar(255) DEFAULT NULL,
  `odberatel` int DEFAULT NULL,
  `vystaveno` date DEFAULT NULL,
  `splatnost` date DEFAULT NULL,
  `castka` float DEFAULT NULL,
  `zaplaceno` varchar(255) DEFAULT NULL,
  `poznamka` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktury`
--

LOCK TABLES `faktury` WRITE;
/*!40000 ALTER TABLE `faktury` DISABLE KEYS */;
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2017/101", 6, "2017-10-02", "2017-11-02", 12616.4, "2017-10-18", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2017/102", 11, "2017-10-22", "2017-11-22", 17185.6, "2017-11-10", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2017/103", 47, "2017-10-27", "2017-11-27", 16145.9, "2017-11-30", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2017/104", 1, "2017-10-27", "2017-11-27", 1867.45, "2017-11-20", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2017/105", 11, "2017-11-01", "2017-11-31", 97108.5, "2018-04-18", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2017/106", 8, "2017-11-08", "2018-00-07", 8747.09, null, "Upomínka 12.1.2018");
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2017/107", 112, "2017-11-12", "2018-01-10", 65341.7, "2017-11-19", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2017/108", 247, "2017-11-19", "2018-01-17", 68637.4, null, null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/1", 47, "2018-00-03", "2018-01-02", 4728.24, null, null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/10", 247, "2018-02-14", "2018-04-13", 16930.3, null, null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/2", 8, "2018-00-10", "2018-01-09", 13008.1, "2018-00-15", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/3", 6, "2018-00-28", "2018-01-27", 4317.19, "2018-02-02", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/4", 47, "2018-00-28", "2018-01-27", 1871.1, "2018-01-20", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/5", 8, "2018-01-08", "2018-02-10", 6146.71, null, null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/6", 6, "2018-01-16", "2018-02-18", 4403.92, null, "Poslána upomínka 30.3.2018");
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/7", 6, "2018-01-21", "2018-02-23", 9981.69, null, null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/8", 12, "2018-01-21", "2018-02-23", 30282.1, "2018-02-06", null);
INSERT INTO faktury(cislo, odberatel, vystaveno, splatnost, castka, zaplaceno, poznamka) VALUES ("2018/9", 112, "2018-02-01", "2018-04-30", 47263.1, "2018-04-08", null);

/*!40000 ALTER TABLE `faktury` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `item_mast`
--

DROP TABLE IF EXISTS `item_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_mast` (
	`PRO_ID` Int, 
	`PRO_NAME` varchar(255), 
	`PRO_PRICE` Int, 
	`PRO_COM` Int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_mast`
--

LOCK TABLES `item_mast` WRITE;
/*!40000 ALTER TABLE `item_mast` DISABLE KEYS */;
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (101, "Mother Board", 3200, 15);
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (102, "Key Board", 450, 16);
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (103, "ZIP drive", 250, 14);
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (104, "Speaker", 550, 16);
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (105, "Monitor", 5000, 11);
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (106, "DVD drive", 900, 12);
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (107, "CD drive", 800, 12);
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (108, "Printer", 2600, 13);
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (109, "Refill cartridge", 350, 13);
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (110, "Mouse", 250, 12);

/*!40000 ALTER TABLE `item_mast` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `nobel_win`
--

DROP TABLE IF EXISTS `nobel_win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nobel_win` (
	`YEAR` Int, 
	`SUBJECT` varchar(255), 
	`WINNER` varchar(255),
	`COUNTRY` varchar(255), 
	`CATEGORY` varchar(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nobel_win`
--

LOCK TABLES `nobel_win` WRITE;
/*!40000 ALTER TABLE `nobel_win` DISABLE KEYS */;
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1970, "Physics", "Hannes Alfven", "Sweden", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1970, "Physics", "Louis Neel", "France", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1970, "Chemistry", "Luis Federico Leloir", "France", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1970, "Physiology", "Ulf von Euler", "Sweden", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1970, "Physiology", "Bernard Katz", "Germany", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1970, "Literature", "Aleksandr Solzhenitsyn", "Russia", "Linguist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1970, "Economics", "Paul Samuelson", "USA", "Economist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1970, "Physiology", "Julius Axelrod", "USA", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1971, "Physics", "Dennis Gabor", "Hungary", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1971, "Chemistry", "Gerhard Herzberg", "Germany", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1971, "Peace", "Willy Brandt", "Germany", "Chancellor");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1971, "Literature", "Pablo Neruda", "Chile", "Linguist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1971, "Economics", "Simon Kuznets", "Russia", "Economist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1978, "Peace", "Anwar al-Sadat", "Egypt", "President");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1978, "Peace", "Menachem Begin", "Israel", "Prime Minister");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1987, "Chemistry", "Donald J. Cram", "USA", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1987, "Chemistry", "Jean-Marie Lehn", "France", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1987, "Physiology", "Susumu Tonegawa", "Japan", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1994, "Economics", "Reinhard Selten", "Germany", "Economist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1994, "Peace", "Yitzhak Rabin", "Israel", "Prime Minister");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1987, "Physics", "Johannes Georg Bednorz", "Germany", "Scientist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1987, "Literature", "Joseph Brodsky", "Russia", "Linguist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1987, "Economics", "Robert Solow", "USA", "Economist");
INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY) VALUES (1994, "Literature", "Kenzaburo Oe", "Japan", "Linguist");

/*!40000 ALTER TABLE `nobel_win` ENABLE KEYS */;
UNLOCK TABLES;





--
-- Table structure for table `obraty`
--

DROP TABLE IF EXISTS `obraty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obraty` (
  `id` int,
  `ucet` varchar(255),
  `datum` varchar(255),
  `obrat` int,
  `VS` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obraty`
--

LOCK TABLES `obraty` WRITE;
/*!40000 ALTER TABLE `obraty` DISABLE KEYS */;
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (1, "0235609/2700", "2018-03-01", 8300, 20181052);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (2, "102203125/0800", "2018-03-02", 5000, 0023154891);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (3, "11-2358756/0100", "2018-03-02", 4590, 4587102);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (4, "11-2358756/0100", "2018-02-18", 1780, 4587102);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (5, "11-2358756/0100", "2018-02-10", 1920, 4587102);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (6, "102203125/0800", "2018-02-01", 2500, 0020514789);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (7, "102203125/0800", "2018-02-06", 3600, 0020514789);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (8, "11-2358756/0100", "2018-03-02", 14590, 4587102);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (9, "40513281/0800", "2018-02-28", 7850, 1023458778);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (10, "11-2358756/0100", "2018-02-22", 8700, 4587102);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (11, "0235609/2700", "2018-02-20", 11400, 4002154889);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (12, "0235609/2700", "2018-02-08", 12540, 2018456);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (13, "40513281/0800", "2018-02-07", 15200, 1023458778);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (14, "0235609/2700", "2018-02-01", 18300, 0235609025);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (15, "40513281/0800", "2018-02-15", 24200, 1023458778);
INSERT INTO obraty(id, ucet, datum, obrat, VS) VALUES (16, "102203125/0800", "2018-02-18", 31540, 502314871);
/*!40000 ALTER TABLE `obraty` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `orders`
--


DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
	`ord_no` Int, 
	`purch_amt` varchar(255), 
	`ord_date` varchar(255), 
	`customer_id` Int, 
	`salesman_id` Int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70001, "150.5", "2012-10-05", 3005, 5002);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70002, "65.26", "2012-10-05", 3002, 5001);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70003, "2480.4", "2012-10-10", 3009, 5003);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70004, "110.5", "2012-08-17", 3009, 5003);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70005, "2400.6", "2012-07-27", 3007, 5001);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70007, "948.5", "2012-09-10", 3005, 5002);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70008, "5760", "2012-09-10", 3002, 5001);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70009, "270.65", "2012-09-10", 3001, 5005);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70010, "1983.43", "2012-10-10", 3004, 5006);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70011, "75.29", "2012-08-17", 3003, 5007);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70012, "250.45", "2012-06-27", 3008, 5002);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70013, "3045.6", "2012-04-25", 3002, 5001);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `testtable`
--

DROP TABLE IF EXISTS `testtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testtable` (
  `col1` varchar(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtable`
--

LOCK TABLES `testtable` WRITE;
/*!40000 ALTER TABLE `testtable` DISABLE KEYS */;
INSERT INTO testtable(col1) VALUES ("A001_DJ-402-2014-2015");
INSERT INTO testtable(col1) VALUES ("A001_DJ-40244_/100/2015");
INSERT INTO testtable(col1) VALUES ("A001/DJ_401");
INSERT INTO testtable(col1) VALUES ("A001/DJ_402%452015/300");
INSERT INTO testtable(col1) VALUES ("A001/DJ_40244");
INSERT INTO testtable(col1) VALUES ("A001/DJ_402442015");
INSERT INTO testtable(col1) VALUES ("A001/DJ_402452015%100");
INSERT INTO testtable(col1) VALUES ("A001/DJ-402%452015/200");
INSERT INTO testtable(col1) VALUES ("A001/DJ-40244");
INSERT INTO testtable(col1) VALUES ("A001/DJ-40244_/100/2015");
INSERT INTO testtable(col1) VALUES ("A002_DJ-401-2014-2015");
/*!40000 ALTER TABLE `testtable` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `salesman`
--


DROP TABLE IF EXISTS `salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE salesman (
	`salesman_id` Int, 
	`name` varchar(255), 
	`city` varchar(255), 
	`commision` Float
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtable`
--

LOCK TABLES `salesman` WRITE;
/*!40000 ALTER TABLE `salesman` DISABLE KEYS */;
INSERT INTO salesman(salesman_id, name, city, commision) VALUES (5001, "James Hoog", "New York", 0.15);
INSERT INTO salesman(salesman_id, name, city, commision) VALUES (5002, "Nail Knite", "Paris", 0.13);
INSERT INTO salesman(salesman_id, name, city, commision) VALUES (5003, "Lauson Hen", "San Jose", 0.12);
INSERT INTO salesman(salesman_id, name, city, commision) VALUES (5005, "Pit Alex", "London", 0.11);
INSERT INTO salesman(salesman_id, name, city, commision) VALUES (5006, "Mc Lyon", "Paris", 0.14);
INSERT INTO salesman(salesman_id, name, city, commision) VALUES (5007, "Paul Adam", "Rome", 0.13);
/*!40000 ALTER TABLE `salesman` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `vyrobky`
--

DROP TABLE IF EXISTS `vyrobky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vyrobky` (
  `cislo` varchar(255) DEFAULT NULL,
  `nazev` varchar(255) DEFAULT NULL,
  `skupina` int DEFAULT NULL,
  `jednotka` varchar(255) DEFAULT NULL,
  `cena` float DEFAULT NULL,
  `sazba_dph` int DEFAULT NULL,
  `z_dovozu` tinyint(1) DEFAULT NULL,
  `sklad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vyrobky`
--

LOCK TABLES `vyrobky` WRITE;
/*!40000 ALTER TABLE `vyrobky` DISABLE KEYS */;
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(11, "Cukr krystal", 1, "kg", 19.9, 10, False, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(11, "Cukr krystal", 1, "kg", 19.9, 10, False, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(12, "Cukr moučka", 1, "kg", 20.3, 10, False, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(21, "Pivo Gambrinus desítka", 5, "láhev", 16.85, 21, False, 3);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(22, "Pivo Prazdroj plechovka", 5, "ks", 21.67, 21, False, 2);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(23, "Rum tuzemský", 5, "láhev", 69.3, 21, False, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(24, "Coca cola Light 2 l", 5, "láhev", 29.8, 10, True, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(25, "Džus pomerančový", 5, "litr", 23.5, 10, True, 3);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(41, "Mléko polotučné", 2, "litr", 11.3, 10, False, 2);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(42, "Jogurt bílý", 2, "ks", 6.3, 10, False, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(43, "Mléko polotučné trvanlivé", 2, "litr", 12.3, 10, False, 3);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(44, "Sýr hermelín", 2, "ks", 21.5, 10, False, 2);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(45, "Sýr Eidam", 2, "kg", 129, 10, False, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(51, "Salám turistický", 3, "kg", 125, 10, False, 3);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(52, "Špekáčky", 3, "kg", 75, 10, False, 2);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(53, "Tlačenka sváteční", 3, "kg", 76, 10, False, 2);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(54, "Tlačenka tmavá", 3, "kg", 67, 10, False, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(61, "Chléb Šumava", 4, "ks", 14.9, 10, False, 3);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(62, "Rohlík zakroucený", 4, "ks", 1.5, 10, False, 3);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(63, "Dalamánek", 4, "ks", 2.7, 10, False, 2);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(71, "Čaj černý", 6, "ks", 12.6, 10, False, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(72, "Čokoláda mléčná", 6, "ks", 18.9, 10, True, 1);
INSERT INTO vyrobky(cislo, nazev, skupina, jednotka, cena, sazba_dph, z_dovozu, sklad) VALUES(81, "Káva Nella Gold", 6, "ks", 98.9, 10, True, 3);
/*!40000 ALTER TABLE `vyrobky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zamestnanci`
--

DROP TABLE IF EXISTS `zamestnanci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zamestnanci` (
  `os_cislo` int DEFAULT NULL,
  `jmeno` varchar(255) DEFAULT NULL,
  `prijmeni` varchar(255) DEFAULT NULL,
  `funkce` varchar(255) DEFAULT NULL,
  `datum_nastupu` date DEFAULT NULL,
  `ulice` varchar(255) DEFAULT NULL,
  `cislo` int DEFAULT NULL,
  `obec` varchar(255) DEFAULT NULL,
  `pocet_deti` int DEFAULT NULL,
  `nadrizeny` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zamestnanci`
--

LOCK TABLES `zamestnanci` WRITE;
/*!40000 ALTER TABLE `zamestnanci` DISABLE KEYS */;
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(11,"Filip","Horáček","prodejce","2008-11-05","Rybářská",21,"Beroun",1,36);
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(18,"Anežka","Bubáčková","účetní","2009-02-27","Karlovo nám.",3,"Praha 1",null,62);
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(19,"Cyprián","Pitule","nákupčí","2010-01-25","Letohradská",12,"Praha 7",1,115);
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(21,"Karel","Novák","prodejce","2011-06-10","V podhradí",2,"Karlštejn",null,36);
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(24,"Emílie","Kudláčková","prodejce","2012-01-25","Hornická",5,"Kladno - SÃ­tnÃ¡",0,36);
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(27,"Rudolf","Opatrný","nákupčí","2017-03-15","Lidická",11,"Praha 5",0,115);
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(36,"Josef","Vomáčka","vedoucí prodeje","2016-09-10","Horoměřická",34,"Praha 6",2,62);
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(62,"Alfons","Karásek","ředitel","2013-06-12","Vltavská",12,"Praha - Zbraslav",2,null);
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(115,"Jitka","Horáčková","vedoucí nákupu","2015-11-15","Ostrčillovo nám.",12,"Praha 4",3,62);
INSERT INTO zamestnanci(os_cislo,jmeno,prijmeni,funkce,datum_nastupu,ulice,cislo,obec,pocet_deti,nadrizeny) VALUES(327,"Anežka","Česká","účetní","2012-10-18","Vězeňská",8,"Praha 1",0,62);
/*!40000 ALTER TABLE `zamestnanci` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-29  2:13:04
