CREATE DATABASE  IF NOT EXISTS `apirest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `apirest`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: apirest
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `lista` varchar(300) DEFAULT NULL,
  `precio` double NOT NULL DEFAULT '0',
  `embalaje` varchar(10) NOT NULL DEFAULT '100 Gr',
  `clasificacion` int NOT NULL DEFAULT '5',
  `categoria` varchar(12) NOT NULL DEFAULT 'NORMAL',
  `idgrupo` int NOT NULL DEFAULT '0',
  `idsubgrupo` int NOT NULL DEFAULT '0',
  `idmarca` int NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT '5',
  `dcto1` float DEFAULT NULL,
  `cant_dcto1` double DEFAULT NULL,
  `dcto2` float DEFAULT NULL,
  `cant_dcto2` double DEFAULT NULL,
  `dcto3` float DEFAULT NULL,
  `cant_dcto3` double DEFAULT NULL,
  `img` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fgk_grupos_articulos_idx` (`idgrupo`),
  KEY `fgk_subgrupos_articulos_idx` (`idsubgrupo`),
  KEY `fgk_marcas_articulos_idx` (`idmarca`),
  CONSTRAINT `fgk_grupos_articulos` FOREIGN KEY (`idgrupo`) REFERENCES `grupos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fgk_marcas_articulos` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fgk_subgrupos_articulos` FOREIGN KEY (`idsubgrupo`) REFERENCES `subgrupos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'001','ALMENDRA FILETEADA 3A X 11.35K FS','FALTA AGREGAR ACA ALGO EN LA DESCRIPCION','Ayuda a bajar de peso*Fortalece el sistema inmune*Ideal para diabéticos*Reduce el colesterol*Antioxidante*Previene el envejecimiento*Crea músculo*Laxante\nnatural',6500,'100 gr',5,'REGALO',1,1,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/almendrafileteada.png'),(2,'002','ALMENDRA NATURAL 3A X K 22.7 FS','','Ayuda a bajar de peso*Fortalece el sistema inmune*Ideal para diabéticos*Reduce el colesterol*Antioxidante*Previene el envejecimiento*Crea músculo*Laxante\nnatural',5000,'100gr',5,'REGALO',1,1,0,5,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/almendranatural.png'),(3,'003','ALMENDRA TOSTADA X 11.34','','Ayuda a bajar de peso*Fortalece el sistema inmune*Ideal para diabéticos*Reduce el colesterol*Antioxidante*Previene el envejecimiento*Crea músculo*Laxante\nnatural',5400,'100gr',5,'REGALO',1,1,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/almendrastostadas.png'),(4,'004','AVELLANAS X K 12,5 FS 3A','','Combate el cansancio, los calambres y el envejecimiento*Previene\nel cáncer  y la depresión*Controla la hipertención*Mantiene la fiebre, los refriados\ny las enfermedades a raya*No tiene colesterol*Mejora el rendimiento  mental',9800,'100gr',5,'REGALO',1,1,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/avellanas.png'),(5,'005','MACADAMIA X K FS','','Reduce el colesterol*Evita el estreñimiento*Previene\nenfermedades del corazón*Previene la osteporosis*Ayuda a tener\nun sistema nervioso saludable*Rica en Omega 3 y 7*Gran fuente de fibra',8300,'100gr',5,'REGALO',1,1,0,2,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/macadamia.png'),(6,'006','MACADAMIA DULCE','','Reduce el colesterol*Evita el estreñimiento*Previene\nenfermedades del corazón*Previene la osteporosis*Ayuda a tener\nun sistema nervioso saludable*Rica en Omega 3 y 7*Gran fuente de fibra',8500,'100gr',5,'REGALO',1,1,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/macadamiadulce.png'),(7,'007','MANI SALADO 3A X K FS','','Aliados del corazón*Reduce el riesgo de padecer cáncer*Mejoran la\nsalud del cerebro*Cuidan tus huesos*sacian el apetito y te ayudan a perder peso*Ayudan a tener una piel sana*Combaten el colesterol*Controlan la presión arterial*Contienen ácido fólico',1500,'100gr',5,'REGALO',1,1,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/manisalado.png'),(8,'008','MANI PARTIDO A GRANEL FS','','Aliados del corazón*Reduce el riesgo de padecer cáncer*Mejoran la\nsalud del cerebro*Cuidan tus huesos*sacian el apetito y te ayudan a perder peso*Ayudan a tener una piel sana*Combaten el colesterol*Controlan la presión arterial*Contienen ácido fólico',1500,'100gr',5,'REGALO',1,1,0,5,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/manipartido.png'),(9,'009','MANI SIN SAL 3A X K FS','','Aliados del corazón*Reduce el riesgo de padecer cáncer*Mejoran la\nsalud del cerebro*Cuidan tus huesos*sacian el apetito y te ayudan a perder peso*Ayudan a tener una piel sana*Combaten el colesterol*Controlan la presión arterial*Contienen ácido fólico',1500,'100gr',5,'REGALO',1,1,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/mani.png'),(10,'010','MANI SOYA X K FS LIB','','Aliados del corazón*Reduce el riesgo de padecer cáncer*Mejoran la\nsalud del cerebro*Cuidan tus huesos*sacian el apetito y te ayudan a perder peso*Ayudan a tener una piel sana*Combaten el colesterol*Controlan la presión arterial*Contienen ácido fólico',3000,'100gr',5,'REGALO',1,1,0,5,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/manimoto.png'),(11,'011','MANI SALADO LIBARDO X 25 KL FS','','Aliados del corazón*Reduce el riesgo de padecer cáncer*Mejoran la\nsalud del cerebro*Cuidan tus huesos*sacian el apetito y te ayudan a perder peso*Ayudan a tener una piel sana*Combaten el colesterol*Controlan la presión arterial*Contienen ácido fólico',1500,'100gr',5,'REGALO',1,1,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/'),(12,'012','MANI JALAPEÑO','','Aliados del corazón*Reduce el riesgo de padecer cáncer*Mejoran la\nsalud del cerebro*Cuidan tus huesos*sacian el apetito y te ayudan a perder peso*Ayudan a tener una piel sana*Combaten el colesterol*Controlan la presión arterial*Contienen ácido fólico',2500,'100gr',5,'REGALO',1,1,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/'),(13,'013','MAIZ BBQ X 5K FS','','ayuda a acelerar los alimentos*Proteínas y fibra*Es esencial para la digestión*Buena fuente de hidratos de carbono*Vitaminas y\nminerales',3200,'100gr',5,'REGALO',1,1,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/'),(14,'014','MAIZ JALAPEÑO X 5K FS','','ayuda a acelerar los alimentos*Proteínas y fibra*Es esencial para la digestión*Buena fuente de hidratos de carbono*Vitaminas y\nminerales',3000,'100gr',5,'NORMAL',1,1,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/maispi.png'),(15,'015','MAIZ NATURAL X 5K FS','','ayuda a acelerar los alimentos*Proteínas y fibra*Es esencial para la digestión*Buena fuente de hidratos de carbono*Vitaminas y\nminerales',3000,'100gr',5,'NORMAL',1,1,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/mais.png'),(16,'016','MARAÑON X 10 K FS','','Fortalece los huesos*Previene el cáncer*Ayuda a controlar el peso*Ayuda a regenerar las células*Protege el corazón*Aumenta el metabolismo*Ayuda la salud visual*Ayuda a aumentar las defensas',6000,'100gr',5,'NORMAL',1,1,0,2,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/maranones.png'),(17,'017','NUEZ PECAN X13.6K FS 3A','','Ricas en Omega 9 con propiedades antiinflamatorias*Muy bajo contenido en sodio*Ideal para deportistas personas con estrés, Obesidad e hipertención*Importante para la salud del corazón, la piel y los huesos*Contienen minerales y vitamina E',10000,'100gr',5,'NORMAL',1,1,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/nuespeca.png'),(18,'018','PISTACHOS X K 10 FS 3A','','Gran Fuente de proteínas y fibra*Mejora la salud del corazón*Reduce los niveles de azúcar y colesterol*Antiestrés*Ayuda a perder peso',7000,'100gr',5,'NORMAL',1,1,0,2,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/pistachos.png'),(19,'019','PISTACHOS SIN CASCARA FS','','Gran Fuente de proteínas y fibra*Mejora la salud del corazón*Reduce los niveles de azúcar y colesterol*Antiestrés*Ayuda a perder peso',12500,'100gr',5,'NORMAL',1,1,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/pistachossin.png'),(20,'020','NUEZ CEREBRITO NOGAL X K FS 3A','','Antioxidantes raros y poderosos*Diabetes*Propiedades anti-Cáncer*Salud cerebral*Mejora la salud reproductiva en hombres*Control de peso*Salud del corazón*',6800,'100gr',5,'NORMAL',1,1,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/nuescerebrito.png'),(21,'021','NUEZ BRASIL PARTIDA X 20K FS 3A','ACA VA EL PARRAFO DE LA DESCRIPCION FALTO ESTO NADA MAS','Salud Del corazón*Sistema inmunológico*Salud de la piel*Función hormonal*Tratamiento del acné*Sistema digestivo*Pérdida del peso',5500,'100gr',5,'NUEVO',1,1,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/'),(22,'022','HABAS FS','','Mejora la salud del corazón*Incrementa los niveles de oxígeno*Hidrata el organismo*Ricas en hierro*Son saciantes*Son fuente de calcio*Mejora la memoria*Ayuda a controlar el peso',3500,'100gr',5,'NUEVO',1,1,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/habas.png'),(23,'023','ARANDANOS X K 11.34 FS 3A','','Previene enfermedades neurodegenerativas*Rejuvenece*Reduce la presión arterial*Es antiinflamatorio*Es antiinflamatorio*Previene el daño en el ADN*Reduce el riesgo de sufrir cáncer',4000,'100gr',5,'NUEVO',1,2,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/arandanos.png'),(24,'024','DATILES FS 3A','','Fuente de  calcio y hierro*Endulzante natural*Provee energia natural y estable*Alta concentración de ácido fólico*Antioxidantes*Fuente de fibra*Ayuda en casos de hipertensión',5000,'100gr',5,'NUEVO',1,2,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/datiles.png'),(25,'025','DURAZNOS DESHIDRATADOS FS','','Contiene pocas calorias*Hidrata la piel*Ayuda a regular la presión arterial*Ayuda a neutralizar los radicales libres*Contiene vitaminas E, K y tiamina',5500,'100gr',5,'NUEVO',1,2,0,5,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/duraznosdes.png'),(26,'026','UVAS PASAS X 10 K 3A FS YYY','','Elimina toxinas*Buena fuente de antioxidantes*Mejora la digestion por el alto contenido de fibra*Alto contenido de potasio*Mejora la circulación sanguinea*Buena fuente de energia',1100,'100gr',5,'NUEVO',1,2,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/uvaspasas.png'),(27,'027','CIRUELA SIN SEMILLA X K 3A FS YYY','','Ayuda en la perdida de peso*Ayuda a combatir la osteoporosis*Mejora el transito intestinal*Antioxidantes*Ayudan a la salud cardiovascular*Potasio y fibra',1600,'100gr',5,'NUEVO',1,2,0,5,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/'),(28,'028','AMAPOLA SEMILLA 3A FS','','Ácidos grasos saludables*Minerales*buena para la salud del corazón*Ayudan a reforzar las defensas*Vitaminas*Fibra*Omega-3 y omega-6',9000,'100gr',5,'NUEVO',0,0,0,5,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/amapola.png'),(29,'029','CALABAZA SEMILLAS FS','','Son aliadas para combatir la diabetes*Tiene grasas saludables y antioxidantes*Omega-3*Ayudan a fortalecer el sistema inmunológico*Antiinflamatorio*Ayudan a tener un sueño reparador*buena para  la salud del corazón*Ayudan a tener una próstata saludable',9000,'100gr',5,'NUEVO',0,0,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/calabaza.png'),(30,'030','CHIA X K FS LIB','','Mejora los niveles de azúcar en la sangre*Excelente fuente de fibra y antioxidante*Ayudan a la digestión*Ricas en calcio proteínas y ácidos grasos Omega 3*Reduce los antojos*Refuerza la resistencia',3000,'100gr',5,'NORMAL',0,0,0,2,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/chia.png'),(31,'031','GIRASOL DESCORTEZADO X K FS','','Anticancerigeno*Mejora el funcionamiento cerebral*Reduce la fatiga*Ideal para embarazo*Fortalece el sistema inmunológico*Rica en minerales*Fortalece los huesos*Previene Enfermedades',3000,'100gr',5,'NORMAL',0,0,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/'),(32,'032','AJONJOLI BLANCO X K FS','','Excelente fuente de minerales*Mejora la salud ósea*Combaten sintomas premestruales*Reduce inflamación*Ayudan a disminuir el colesterol malo*Protegen células del* colon',1700,'100gr',5,'NORMAL',0,0,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/ajonjoliblanco.png'),(33,'033','QUINUA X K FS LIB','','Anti cancerígeno*Mejora la piel*Ayuda a adelgazar*Reduce el colesterol*Antiinflamatorio*Fuente de vitaminas*Mejora el sueño*Rica en fibra',2000,'100gr',5,'NORMAL',0,0,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/quinua.png'),(34,'034','LINAZA ENTERA X K FS','','Mejora la digestión*Ayuda a adelgazar*Reduce el colesterol*Rico en Omega 3*Regúla el azúcar en la sangre*Protege\nel corazón',1000,'100gr',5,'NORMAL',0,0,0,3,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/linaza.png'),(35,'035','AJONJOLI NEGRO X K FS','','Excelente fuente de minerales*Mejora la salud ósea*Combaten sintomas premestruales*Reduce inflamación*Ayudan a disminuir el colesterol malo*Protegen células del* colon',1700,'100gr',5,'NORMAL',0,0,0,4,5.9,3000,11.8,25000,NULL,NULL,'img/articulos/ajonjolinegro.png');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrios`
--

DROP TABLE IF EXISTS `barrios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barrios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tarifa` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
INSERT INTO `barrios` VALUES (155,'Aeropuerto',1000),(156,'Aniversario',1000),(157,'Belén',1000),(158,'Belisario',1000),(159,'Barrio Blanco',1000),(160,'Boconó',1000),(161,'Callejón',1000),(162,'Carora',1000),(163,'Ceiba',1000),(164,'Ciudad Jardín',1000),(165,'Colsag',1000),(166,'El Contento',1000),(167,'El Llano',1000),(168,'Cundinamarca',1000),(169,'El Escobal',1000),(170,'Galán',1000),(171,'Guaimaral',1000),(172,'La Insula',1000),(173,'Latino',1000),(174,'La Merced',1000),(175,'Lleras Restrepo',1000),(176,'Las Margaritas',1000),(177,'Niza',1000),(178,'Los Pinos',1000),(179,'La Playa',1000),(180,'Prados del Norte',1000),(181,'Popular',1000),(182,'Prados del Este',1000),(183,'Quinta Bosh',1000),(184,'Quinta Oriental',1000),(185,'El Rodeo',1000),(186,'Salado',1000),(187,'San Luís',1000),(188,'Brisas de Sinaí',1000),(189,'San Martín',1000),(190,'San Miguel',1000),(191,'San Rafael',1000),(192,'Santander',1000),(193,'Simón Bolívar',1000),(194,'Trigal del Norte',1000),(195,'Atalaya',1000),(196,'Antonia Santos',1000),(197,'Chapinero',1000),(198,'Claret',1000),(199,'Comuneros',1000),(200,'La Ermita',1000),(201,'Ceci',1000),(202,'Nidia',1000),(203,'43964',1000),(204,'Tucunaré',1000),(205,'San Jerónimo',1000),(206,'B. EL CONTENTO',1000),(207,'B. LLANO',1000),(208,'B. EL PARAMO',1000),(209,'B. LA PLAYA',1000),(210,'COLSAG ',1000),(211,'LA RIVIERA',1000),(212,'B. POPULAR',1000),(213,'QUINTA ORIENTAL',1000),(214,'U. SANTA LUCIA',1000),(215,'U. LOS ACACIOS',1000),(216,'B. LIBERTADORES',1000),(217,'CAOBOS',1000),(218,'PICAVIGO',1000),(219,'URB. ALCALA',1000),(220,'URB. CEIBA II',1000),(221,'PROCERES -URAPANES',1000),(222,'URB. LA ESPERANZA',1000),(223,'AGUAS CALIENTES',1000),(224,'B. BELLA VISTA',1000),(225,'B. LA LIBERTAD',1000),(226,'B. SAN MATEO',1000),(227,'B. VALLE ESTHER',1000),(228,'U. LAS MARGARITAS',1000),(229,'B. BOGOTA',1000),(230,'B. P - SALAVARRIETA',1000),(231,'SIMON BOL.-U.SANT. ANA',1000),(232,'B. LA UNION',1000),(233,'B. SANTA ANA',1000),(234,'LA ESMERALDA',1000),(235,'ASENT. NUEVO MILENIO',1000),(236,'B. ALTO PAMPLONITA',1000),(237,'B. SAN LUIS',1000),(238,'B. SAN MARTIN',1000),(239,'B. SANTA TERESITA',1000),(240,'U. TORCOROMA',1000),(241,'B. PAMPLONITA',1000),(242,'U. ANIVERSARIO',1000),(243,'EL NUEVO ESCOBAL',1000),(244,'MARTIN II',1000),(245,'B. NUEVA SANTA CLARA',1000),(246,'U. ANIVERSARIO II ETP.',1000),(247,'GUSTAVO ARARAT NEGRON - U. PRADOS DEL ESTE',1000),(248,'EL ESCOBAL',1000),(249,'B. SANTA CLARA',1000),(250,'U. TORCOROMA II',1000),(251,'U. LA QUINTA',1000),(252,'U. JOSE DE TORCOROMA',1000),(253,'U. LA ALAMEDA',1000),(254,'U. HELIOPOLIS',1000),(255,'U. TORCOROMA',1000),(256,'SIGLO XXI',1000),(257,'U. BOSQUES DEL PAMPLONITA',1000),(258,'LA CAMPIÑA ESCOBAL II',1000),(259,'CAÑAFISTOLO',1000),(260,'TORCOROMA III',1000),(261,'B. CIUDAD JARDIN',1000),(262,'B. COLPET',1000),(263,'B. GUAIMARAL',1000),(264,'B.MERCED-JUANA RANGEL',1000),(265,'B. LLERAS RESTREPO',1000),(266,'B. PESCADERO',1000),(267,'U. SAN EDUARDO',1000),(268,'B. SAN EDUARDO II ETP.',1000),(269,'URB. LA MAR',1000),(270,'URB. NIZA NORTE',1000),(271,'U. ZULIMA I ETP',1000),(272,'U. TASAJERO',1000),(273,'U. SANTA ELENA',1000),(274,'B. SEVILLA',1000),(275,'U. PRADOS DEL NORTE',1000),(276,'U. GRATAMIRA',1000),(277,'ZULIMA II ETP',1000),(278,'U. EL BOSQUE',1000),(279,'U. ZULIMA IV ETP.',1000),(280,'U. ZULIMA III ETP.',1000),(281,'U. NIZA SUR',1000),(282,'URB. PORTACHUELO',1000),(283,'B. AEROPUERTO',1000),(284,'B. EL PORVENIR',1000),(285,'B. PANAMERICANO',1000),(286,'A. H. EL SALADO',1000),(287,'B. VIRGILIO BARCO V.',1000),(288,'U. COLINAS DE LA VICTORIA',1000),(289,'B. LA INSULA',1000),(290,'B. CERRO NORTE',1000),(291,'B. SAN GERARDO',1000),(292,'A. SEIS DE MAYO P. ALTA',1000),(293,'URB. TRIGAL DEL NORTE',1000),(294,'B. CARLOS TOLEDO PLATA',1000),(295,'U. LA CONCORDIA',1000),(296,'B. BRISAS DEL PORVENIR',1000),(297,'B. SIMON BOLIVAR',1000),(298,'B. CAÑO LIMON-COVEÑAS',1000),(299,'B. ALONCITO',1000),(300,'VILLA DE LOS TEJARES',1000),(301,'B. LOS LAURELES',1000),(302,'U. RAFAEL GARCIA-HERRERO',1000),(303,'VILLA DEL ROSARIO ',1000),(304,'PATIOS',1000),(305,'MONTEBELLO',1000),(306,'MONTEBELLO 2',1000),(307,'SAN RAFAEL ',1000),(308,'OTROS',0);
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carusel`
--

DROP TABLE IF EXISTS `carusel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carusel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(50) NOT NULL,
  `imgmovil` varchar(50) NOT NULL,
  `filtro` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carusel`
--

LOCK TABLES `carusel` WRITE;
/*!40000 ALTER TABLE `carusel` DISABLE KEYS */;
INSERT INTO `carusel` VALUES (1,'img/carusel/slider1.png','img/carusel/movil/slider1.png','harina'),(2,'img/carusel/slider2.png','img/carusel/movil/slider2.png','arroz'),(3,'img/carusel/slider3.png','img/carusel/movil/slider3.png','harina');
/*!40000 ALTER TABLE `carusel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(15) DEFAULT NULL,
  `idtipo_documento` int DEFAULT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `celular2` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `idbarrio` int DEFAULT NULL,
  `idorden` int unsigned DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `tokenfacebook` varchar(500) DEFAULT NULL,
  `idfacebook` varchar(45) DEFAULT NULL,
  `tokengoogle` varchar(500) DEFAULT NULL,
  `idgoogle` varchar(45) DEFAULT NULL,
  `terminos` tinyint(1) NOT NULL DEFAULT '0',
  `comunicaciones` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idorden_UNIQUE` (`idorden`),
  KEY `fgk_tipo_documento_idx` (`idtipo_documento`),
  KEY `fgk_barrios_clientes_idx` (`idbarrio`),
  KEY `fgk_ordenes_clientes_idx` (`idorden`),
  CONSTRAINT `fgk_barrios_clientes` FOREIGN KEY (`idbarrio`) REFERENCES `barrios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fgk_tipos_documento_clientes` FOREIGN KEY (`idtipo_documento`) REFERENCES `tipos_documento` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (0,NULL,NULL,'CLIENTE OCACIONAL',NULL,NULL,NULL,NULL,NULL,NULL,'NOREPLI@SINCORREO.COM',NULL,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `clientes_BEFORE_UPDATE` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN
IF new.idorden=null then
UPDATE ordenes set finalizada=true where old.idorden=id;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cupones`
--

DROP TABLE IF EXISTS `cupones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `fechavencimiento` date NOT NULL,
  `descuento` int NOT NULL,
  `fechacreacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupones`
--

LOCK TABLES `cupones` WRITE;
/*!40000 ALTER TABLE `cupones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'FRUTOS'),(0,'OTROS'),(2,'SEMILLAS');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (0,'OTROS');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_detalles`
--

DROP TABLE IF EXISTS `orden_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_detalles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigoarticulo` varchar(20) NOT NULL,
  `preciound` double NOT NULL,
  `cantidad` double NOT NULL,
  `nombrearticulo` varchar(50) NOT NULL,
  `embalajearticulo` varchar(10) NOT NULL,
  `idorden` int NOT NULL,
  `img` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fgk_ordenes_orden_detalles_idx` (`idorden`),
  CONSTRAINT `fgk_ordenes_orden_detalles` FOREIGN KEY (`idorden`) REFERENCES `ordenes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_detalles`
--

LOCK TABLES `orden_detalles` WRITE;
/*!40000 ALTER TABLE `orden_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_detalles` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orden_detalles_AFTER_INSERT` AFTER INSERT ON `orden_detalles` FOR EACH ROW BEGIN
UPDATE
  ordenes
SET
  total = total +(NEW.cantidad * NEW.preciound)
WHERE
  id = NEW.idorden;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orden_detalles_AFTER_UPDATE` AFTER UPDATE ON `orden_detalles` FOR EACH ROW BEGIN
UPDATE ordenes set total=total-(old.preciound*old.cantidad-new.preciound*new.cantidad) where id=new.idorden;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orden_detalles_AFTER_DELETE` AFTER DELETE ON `orden_detalles` FOR EACH ROW BEGIN
UPDATE
  ordenes
SET
  total = total -(OLD.cantidad * OLD.preciound)
WHERE
  id = OLD.idorden;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idcliente` int NOT NULL,
  `total` double NOT NULL DEFAULT '0',
  `finalizada` tinyint(1) NOT NULL DEFAULT '0',
  `nombrecliente` varchar(50) DEFAULT NULL,
  `apellidoscliente` varchar(45) DEFAULT NULL,
  `telefonocliente` varchar(10) DEFAULT NULL,
  `telefono2cliente` varchar(10) DEFAULT NULL,
  `idtipo_documento` int DEFAULT NULL,
  `documentocliente` varchar(60) DEFAULT NULL,
  `direccioncliente` varchar(100) DEFAULT NULL,
  `idbarrio` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fgk_clientes_ordenes_idx` (`idcliente`),
  KEY `fgk_idtipos_documento_ordenes_idx` (`idtipo_documento`),
  KEY `fgk_barrios_ordenes_idx` (`idbarrio`),
  CONSTRAINT `fgk_barrios_ordenes` FOREIGN KEY (`idbarrio`) REFERENCES `barrios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fgk_clientes_ordenes` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fgk_tipos_documento_ordenes` FOREIGN KEY (`idtipo_documento`) REFERENCES `tipos_documento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ordenes_AFTER_INSERT` AFTER INSERT ON `ordenes` FOR EACH ROW BEGIN
UPDATE
  clientes
set
  idorden = NEW.id
where
  id = NEW.idcliente;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ordenes_BEFORE_UPDATE` BEFORE UPDATE ON `ordenes` FOR EACH ROW BEGIN 

IF NEW.total=0 THEN
UPDATE
  clientes
set
  idorden = null
where
new.idcliente=id;
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `recomendaciones`
--

DROP TABLE IF EXISTS `recomendaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomendaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `texto` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendaciones`
--

LOCK TABLES `recomendaciones` WRITE;
/*!40000 ALTER TABLE `recomendaciones` DISABLE KEYS */;
INSERT INTO `recomendaciones` VALUES (1,'img/secciones/imgreco1.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(2,'img/secciones/imgreco2.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(3,'img/secciones/imgreco1.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(4,'img/secciones/imgreco1.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(5,'img/secciones/imgreco2.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(6,'img/secciones/imgreco1.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(7,'img/secciones/imgreco2.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(8,'img/secciones/imgreco1.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(9,'img/secciones/imgreco2.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(10,'img/secciones/imgreco1.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(11,'img/secciones/imgreco1.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(12,'img/secciones/imgreco2.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),(13,'img/secciones/imgreco1.jpeg','ALGO','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20');
/*!40000 ALTER TABLE `recomendaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subgrupos`
--

DROP TABLE IF EXISTS `subgrupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subgrupos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `idgrupo` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fgk_grupos_subgrupos_idx` (`idgrupo`),
  CONSTRAINT `fgk_grupos_subgrupos` FOREIGN KEY (`idgrupo`) REFERENCES `grupos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgrupos`
--

LOCK TABLES `subgrupos` WRITE;
/*!40000 ALTER TABLE `subgrupos` DISABLE KEYS */;
INSERT INTO `subgrupos` VALUES (0,'OTROS',0),(1,'FRUTOS SECOS',1),(2,'FRUTOS DESHIDRATADOS',1);
/*!40000 ALTER TABLE `subgrupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_documento`
--

DROP TABLE IF EXISTS `tipos_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefijo` varchar(6) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `prefijo_UNIQUE` (`prefijo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_documento`
--

LOCK TABLES `tipos_documento` WRITE;
/*!40000 ALTER TABLE `tipos_documento` DISABLE KEYS */;
INSERT INTO `tipos_documento` VALUES (1,'C.C','CEDULA DE CIUDADANIA'),(2,'NIT','NUMERO DE IDENTIFICACION TRIBUTARIA'),(3,'PEP','PERMISO ESPECIAL DE PERMANENCIA'),(4,'T.I.','TARJETA DE IDENTIDAD');
/*!40000 ALTER TABLE `tipos_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario` varchar(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('admin','1','Administrador del Sistema',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'apirest'
--
/*!50003 DROP PROCEDURE IF EXISTS `inicializarDB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inicializarDB`()
BEGIN
	DELETE FROM orden_detalles;
    DELETE FROM ordenes;
    DELETE FROM clientes;
    DELETE FROM articulos;
    DELETE FROM barrios;
    DELETE FROM cupones;
    DELETE FROM subgrupos;
    DELETE FROM grupos;
    DELETE FROM marcas;
    
    INSERT INTO grupos(id,nombre)VALUES(0,"OTROS");
    UPDATE grupos SET id = 0;
    
    INSERT INTO subgrupos(id,nombre, idgrupo)VALUES(0,"OTROS",0);
	UPDATE subgrupos SET id = 0;
    
    INSERT INTO marcas(id,nombre)VALUES(0,"OTROS");
    UPDATE marcas SET id = 0;
    
     INSERT INTO clientes(id,nombres,email,terminos,comunicaciones)
     VALUES(0,"CLIENTE OCACIONAL","NOREPLI@SINCORREO.COM",0,0);
	 UPDATE clientes SET id = 0;
    
    ALTER TABLE orden_detalles AUTO_INCREMENT = 1;
    ALTER TABLE ordenes AUTO_INCREMENT = 1;
    ALTER TABLE clientes AUTO_INCREMENT = 1;
    ALTER TABLE articulos AUTO_INCREMENT = 1;
    ALTER TABLE barrios AUTO_INCREMENT = 1;
    ALTER TABLE cupones AUTO_INCREMENT = 1;
    ALTER TABLE subgrupos AUTO_INCREMENT = 1;
    ALTER TABLE grupos AUTO_INCREMENT = 1;
    ALTER TABLE marcas AUTO_INCREMENT = 1;
  
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-08 15:25:10
