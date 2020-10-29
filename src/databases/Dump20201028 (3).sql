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
  `lista` varchar(1000) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (249,'1','PISTACHOS SIN CASCARA','','*GRAN FUENTE DE PROTEÍNAS Y FIBRA*MEJORA LA SALUD DEL CORAZÓN*REDUCE LOS NIVELES DE AZÚCAR Y COLESTEROL*ANTIESTRÉS*AYUDA A PERDER PESO',140000,'gr',3,'NUEVO',1,1,0,3,120000,3000,1050000,10000,NULL,NULL,'pistachossin.png'),(311,'2','PISTACHOS','','*GRAN FUENTE DE PROTEÍNAS Y FIBRA*MEJORA LA SALUD DEL CORAZÓN*REDUCE LOS NIVELES DE AZÚCAR Y COLESTEROL*ANTIESTRÉS*AYUDA A PERDER PESO',70000,'gr',4,'NUEVO',1,1,0,4,68000,3000,714000,11340,NULL,NULL,'pistachos.png'),(312,'3','ALMENDRA FILETEADA ','','*AYUDA A BAJAR DE PESO*FORTALECE EL SISTEMA INMUNE*IDEAL PARA DIABÉTICOS*REDUCE EL COLESTEROL*ANTIOXIDANTE*PREVIENE EL ENVEJECIMIENTO*CREA MÚSCULO*LAXANTE NATURAL',65000,'gr',4,'NUEVO',1,1,0,4,63000,3000,681000,11350,NULL,NULL,'almendrafileteada.png'),(313,'4','ALMENDRA NATURAL ','','*AYUDA A BAJAR DE PESO*FORTALECE EL SISTEMA INMUNE*IDEAL PARA DIABÉTICOS*REDUCE EL COLESTEROL*ANTIOXIDANTE*PREVIENE EL ENVEJECIMIENTO*CREA MÚSCULO*LAXANTE NATURAL',50000,'gr',5,'NORMAL',1,1,0,5,48000,3000,997920,22680,NULL,NULL,'almendranatural.png'),(314,'5','AVELLANAS','','*COMBATE EL CANSANCIO, LOS CALAMBRES Y EL ENVEJECIMIENTO*PREVIENE EL CÁNCER Y LA DEPRESIÓN*CONTROLA LA HIPERTENCIÓN*MANTIENE LA FIEBRE, LOS REFRIADOS Y LAS ENFERMEDADES A RAYA*NO TIENE COLESTEROL*MEJORA EL RENDIMIENTO MENTAL',98000,'gr',3,'NUEVO',1,1,0,3,90000,3000,860000,10000,NULL,NULL,'avellanas.png'),(315,'6','MACADAMIA ','','*REDUCE EL COLESTEROL*EVITA EL ESTREÑIMIENTO*PREVIENE ENFERMEDADES DEL CORAZÓN*PREVIENE LA OSTEPOROSIS*AYUDA A TENER UN SISTEMA NERVIOSO SALUDABLE*RICA EN OMEGA 3 Y 7*GRAN FUENTE DE FIBRA',83000,'gr',5,'NUEVO',1,1,0,5,80000,3000,1950000,25000,NULL,NULL,'macadamia.png'),(316,'7','MANI PARTIDO A GRANEL ','','*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO',15000,'gr',4,'NORMAL',1,1,0,4,14500,3000,330000,25000,NULL,NULL,'manipartido.png'),(317,'8','MANI SALADO ','','*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO',15000,'gr',5,'NORMAL',1,1,0,5,14500,3000,330000,25000,NULL,NULL,'manisalado.png'),(318,'9','MANI CONFITADO CON AJONJOLI','','*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO',18000,'gr',5,'NORMAL',1,1,0,5,16000,3000,300000,25000,NULL,NULL,'maniconfi.png'),(319,'10','MANI SIN SAL','','*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO',15000,'gr',3,'NORMAL',1,1,0,3,14500,3000,330000,25000,NULL,NULL,'mani.png'),(320,'11','MANI SOYA','','*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO',30000,'gr',4,'NORMAL',1,1,0,4,28000,3000,288000,12000,NULL,NULL,'manimoto.png'),(321,'12','MAIZ JALAPEÑO','','*AYUDA A ACELERAR LOS ALIMENTOS*PROTEÍNAS Y FIBRA*ES ESENCIAL PARA LA DIGESTIÓN*BUENA FUENTE DE HIDRATOS DE CARBONO*VITAMINAS Y MINERALES',35000,'gr',5,'NORMAL',1,1,0,5,30000,3000,140000,5000,NULL,NULL,'maispi.png'),(322,'13','MAIZ NATURAL','','*AYUDA A ACELERAR LOS ALIMENTOS*PROTEÍNAS Y FIBRA*ES ESENCIAL PARA LA DIGESTIÓN*BUENA FUENTE DE HIDRATOS DE CARBONO*VITAMINAS Y MINERALES',35000,'gr',3,'NUEVO',1,1,0,3,32000,3000,140000,5000,NULL,NULL,'mais.png'),(323,'14','MARAÑON','','*FORTALECE LOS HUESOS*PREVIENE EL CÁNCER*AYUDA A CONTROLAR EL PESO*AYUDA A REGENERAR LAS CÉLULAS*PROTEGE EL CORAZÓN*AUMENTA EL METABOLISMO*AYUDA LA SALUD VISUAL*AYUDA A AUMENTAR LAS DEFENSAS',60000,'gr',4,'NORMAL',1,1,0,4,58000,3000,900000,20000,NULL,NULL,'maranones.png'),(324,'15','NUEZ PECAN','','*RICAS EN OMEGA 9 CON PROPIEDADES ANTIINFLAMATORIAS*MUY BAJO CONTENIDO EN SODIO*IDEAL PARA DEPORTISTAS PERSONAS CON ESTRÉS, OBESIDAD E HIPERTENCIÓN*IMPORTANTE PARA LA SALUD DEL CORAZÓN, LA PIEL Y LOS HUESOS*CONTIENEN MINERALES Y VITAMINA E',100000,'gr',5,'NORMAL',1,1,0,5,95000,3000,885000,10000,NULL,NULL,'nuespeca.png'),(325,'16','NUEZ CEREBRITO NOGAL','','*ANTIOXIDANTES PODEROSOS*DIABETES*PROPIEDADES ANTI-CÁNCER*SALUD CEREBRAL*MEJORA LA SALUD REPRODUCTIVA EN HOMBRES*CONTROL DE PESO*SALUD DEL CORAZÓN*',68000,'gr',4,'NUEVO',1,1,0,4,65000,3000,604000,10000,NULL,NULL,'nuescerebrito.png'),(326,'17','HABAS','','*MEJORA LA SALUD DEL CORAZÓN*INCREMENTA LOS NIVELES DE OXÍGENO*HIDRATA EL ORGANISMO*RICAS EN HIERRO*SON SACIANTES*SON FUENTE DE CALCIO*MEJORA LA MEMORIA*AYUDA A CONTROLAR EL PESO',35000,'gr',5,'NORMAL',1,1,0,5,32000,3000,145000,5000,NULL,NULL,'habas.png'),(327,'18','ARANDANOS','','PREVIENE ENFERMEDADES NEURODEGENERATIVAS*REJUVENECE*REDUCE LA PRESIÓN ARTERIAL*ES ANTIINFLAMATORIO*ES ANTIINFLAMATORIO*PREVIENE EL DAÑO EN EL ADN*REDUCE EL RIESGO DE SUFRIR CÁNCER',40000,'gr',5,'NUEVO',1,2,0,5,35000,3000,376500,11340,NULL,NULL,'arandanos.png'),(328,'19','DATILES ','','*FUENTE DE CALCIO Y HIERRO*ENDULZANTE NATURAL*PROVEE ENERGIA NATURAL Y ESTABLE*ALTA CONCENTRACIÓN DE ÁCIDO FÓLICO*ANTIOXIDANTES*FUENTE DE FIBRA*AYUDA EN CASOS DE HIPERTENSIÓN',50000,'gr',3,'NORMAL',1,2,0,3,48000,3000,285600,6800,NULL,NULL,'datiles.png'),(329,'20','DURAZNOS DESHIDRATADOS','','*CONTIENE POCAS CALORIAS*HIDRATA LA PIEL*AYUDA A REGULAR LA PRESIÓN ARTERIAL*AYUDA A NEUTRALIZAR LOS RADICALES LIBRES*CONTIENE VITAMINAS E, K Y TIAMINA',55000,'gr',3,'NORMAL',1,2,0,3,50000,3000,NULL,NULL,NULL,NULL,'duraznosdes.png'),(330,'21','UVAS PASAS','','*ELIMINA TOXINAS*BUENA FUENTE DE ANTIOXIDANTES*MEJORA LA DIGESTION POR EL ALTO CONTENIDO DE FIBRA*ALTO CONTENIDO DE POTASIO*MEJORA LA CIRCULACIÓN SANGUINEA*BUENA FUENTE DE ENERGIA',11000,'gr',3,'NORMAL',1,2,0,3,10000,3000,80000,10000,NULL,NULL,'uvaspasas.png'),(331,'22','COCO EN HOJUELAS','','',35000,'gr',1,'NUEVO',1,2,0,1,32000,3000,NULL,NULL,NULL,NULL,'cocohojuelas.png'),(435,'23','MORINGA A GRANEL','','*APOYA LOS NIVELES NORMALES DE AZÚCAR EN LA SANGRE*PROVEE ENERGIA NATURAL*MEJORA EL FUNCIONAMIENTO DEL HIGADO Y RIÑON*MEJORA LA DIGESTIÓN*MEJORA EL SISTEMA CIRCULATORIO*MEJORA LA PIEL*DISMINUYE EL COLESTEROL',150000,'gr',4,'NUEVO',2,3,0,4,142000,3000,NULL,NULL,NULL,NULL,'moringa.png'),(436,'24','TE VERDE ','','*AYUDA A LA MEMORIA*DISMINUYE EL DETERIORO CAUSADO POR EL ALZAIMER Y EL PARKINSON*BRINDA UN EFECTO RELAJANTE Y TRANQUILIZANTE*EVITA LA CARIES Y ENFERMEDADES DENTALES*FORTALECE LOS HUESOS*AYUDA A COMBATIR CÉLULAS CANCERIGENAS*EVITA LA OBESIDAD*PREVIENE ENFERMEDADES DEL CORAZÓN*REDUCE EL COLESTEROL MALO DE LA SANGRE',140000,'gr',3,'NORMAL',2,3,0,3,135000,3000,NULL,NULL,NULL,NULL,'teverde.png'),(437,'25','STEVIA EN HOJA','','*PODEROSO ANTIOXIDANTE*AYUDA A DISMINUIR NIVELES DE ÁCIDO ÚRICO*MEJORA LA RESISTENCIA FRENTE A GRIPES Y REFRIADOS*BENEFICIOSA PARA PERSONAS HIPERTENSAS*ABSORCIÓN DE GRASAS*CONTRARESTA LA FATIGA Y LOS ESTADO DE ANCIEDAD*REDUCE EL DESEO AL TABACO Y EL ALCOHOL',80000,'gr',2,'NORMAL',2,3,0,2,70000,3000,NULL,NULL,NULL,NULL,'stevia.png'),(438,'26','MACA PULVERIZADA','','*PROMUEVE LA CLARIDAD MENTAL*COMBATE LA DIABETES*AUMENTA LA RESISTENCIA*MEJORA EL BIENESTAR FISICO Y EMOCIANAL*ALIVIA LOS SINTOMAS DE LA MENOPAUSIA*EQUILIBRA LAS HORMONAS*REALZA LA FERTILIDAD*TRATA LA DIFUCIÓN SEXUAL',90000,'gr',3,'NUEVO',2,3,0,3,85000,3000,750000,25000,NULL,NULL,'maca.png'),(439,'27','GINKGO BILOBA MOLIDO','','*PROTEGE AL CEREBRO DE ENFERMEDADES NEURODEGENERATIVAS*MEJORA LA CIRCULACIÓN DEL ORGANISMO*CONTRA LA CAIDA DEL PELO*CONCENTRACIÓN APRENDIZAJE MEMORIA',90000,'gr',2,'NORMAL',2,3,0,2,85000,3000,NULL,NULL,NULL,NULL,'gingo.png'),(440,'28','FLOR DE JAMAICA','','*PREVIENE Y COMBATE INFECCIONES RESPIRATORIAS*DESINTOXICANTES*MEJORA LA DIGESTIÓN*ANTIOXIDANTE*CONTIENE VITAMINAS Y MINERALES*LIMPIA EL HIGADO Y LOS RIÑONES*DEPURATIVA*COMBATE LA RESACA',80000,'gr',3,'NORMAL',2,3,0,3,70000,3000,NULL,NULL,NULL,NULL,'flordejamaica.png'),(441,'29','GARBANZO TOSTADO ','','*MUY SALUDABLE PARA EL CORAZÓN*DISMINUYEN EL COLESTEROL*ENERGÉTICOS Y NUTRITIVOS*EXCELENTE FUENTE DE PROTEÍNA VEGETARIANA*MEJORA LA HIPERTENSIÓN',30000,'gr',2,'NORMAL',2,3,0,2,29000,3000,140000,5000,NULL,NULL,''),(442,'30','AMAPOLA SEMILLA','','*ÁCIDOS GRASOS SALUDABLES*MINERALES*BUENA PARA LA SALUD DEL CORAZÓN*AYUDAN A REFORZAR LAS DEFENSAS*VITAMINAS*FIBRA*OMEGA-3 Y OMEGA-6',90000,'gr',5,'NUEVO',3,4,0,5,75000,3000,1750000,25000,NULL,NULL,'amapola.png'),(443,'31','CALABAZA SEMILLAS','','*SON ALIADAS PARA COMBATIR LA DIABETES*TIENE GRASAS SALUDABLES Y ANTIOXIDANTES*OMEGA-3*AYUDAN A FORTALECER EL SISTEMA INMUNOLÓGICO*ANTIINFLAMATORIO*AYUDAN A TENER UN SUEÑO REPARADOR*BUENA PARA LA SALUD DEL CORAZÓN*AYUDAN A TENER UNA PRÓSTATA SALUDABLE',90000,'gr',4,'NORMAL',3,4,0,4,75000,3000,680000,10000,NULL,NULL,'calabaza.png'),(444,'32','CHIA','','*MEJORA LOS NIVELES DE AZÚCAR EN LA SANGRE*EXCELENTE FUENTE DE FIBRA Y ANTIOXIDANTE*AYUDAN A LA DIGESTIÓN*RICAS EN CALCIO PROTEÍNAS Y ÁCIDOS GRASOS OMEGA 3*REDUCE LOS ANTOJOS*REFUERZA LA RESISTENCIA',30000,'gr',5,'NORMAL',3,4,0,5,25000,3000,550000,25000,NULL,NULL,'chia.png'),(445,'33','AJONJOLI BLANCO','','*EXCELENTE FUENTE DE MINERALES*MEJORA LA SALUD ÓSEA*COMBATEN SINTOMAS PREMESTRUALES*REDUCE INFLAMACIÓN*AYUDAN A DISMINUIR EL COLESTEROL MALO*PROTEGEN CÉLULAS DEL COLON',17000,'gr',3,'NUEVO',3,4,0,3,16000,3000,375000,25000,NULL,NULL,'ajonjoliblanco.png'),(446,'34','AJONJOLI NEGRO','','*EXCELENTE FUENTE DE MINERALES*MEJORA LA SALUD ÓSEA*COMBATEN SINTOMAS PREMESTRUALES*REDUCE INFLAMACIÓN*AYUDAN A DISMINUIR EL COLESTEROL MALO*PROTEGEN CÉLULAS DEL COLON',17000,'gr',2,'NORMAL',3,4,0,2,16000,3000,375000,25000,NULL,NULL,'ajonjolinegro.png'),(447,'35','QUINUA ','','*ANTI CANCERÍGENO*MEJORA LA PIEL*AYUDA A ADELGAZAR*REDUCE EL COLESTEROL*ANTIINFLAMATORIO*FUENTE DE VITAMINAS*MEJORA EL SUEÑO*RICA EN FIBRA',20000,'gr',4,'NORMAL',3,4,0,4,18000,3000,375000,25000,NULL,NULL,'quinua.png'),(448,'36','LINAZA ENTERA ','','*MEJORA LA DIGESTIÓN*AYUDA A ADELGAZAR*REDUCE EL COLESTEROL*RICO EN OMEGA 3*REGÚLA EL AZÚCAR EN LA SANGRE*PROTEGE EL CORAZÓN',10000,'gr',3,'NUEVO',3,4,0,3,9000,3000,212500,25000,NULL,NULL,'linaza.png'),(449,'37','ACEITE DE AJONJOLI X 250 ML','','*ALIVIA LA HEPATITI*SALIVIA LA MIGRAÑA*PREVIENE LA DIABETES*AFRODISIACO*AYUDA AL SISTEMA INMUNOLÓGICO',35000,'und',3,'NUEVO',4,5,0,3,NULL,NULL,NULL,NULL,NULL,NULL,'aceiteajonjoli.png'),(450,'38','ACEITE DE ALMENDRAS X 200 ML','','*ANTIOXIDANTE PARA LA PIEL*ANTINFLAMATORIO*AYUDA A LA CIRCULACIÓN*AYUDA A EL ESTREÑIMIENTO*AYUDA A LA DIABETES',30000,'und',5,'NORMAL',4,5,0,5,NULL,NULL,NULL,NULL,NULL,NULL,'aceitealmendras.png'),(451,'39','ACEITE DE COCO X 1000','','*AYUDA AL SISTEMA INMUNOLÓGICO*AYUDA A LA GASTRITIS*AYUDA AL COLON*AYUDA A LA PÉRDIDA DE PESO*PREVIENE LA DIABETES*LIMPIA, HIDRATA, NUTRE Y REJUVENECE.',88000,'und',4,'NORMAL',4,5,0,4,NULL,NULL,NULL,NULL,NULL,NULL,'aceitecoco.png'),(452,'40','ACEITE DE LINAZA X 250 ML','','*ANTINFLAMATORIO*CONTROLA LA PRESIÓN ARTERIAL*EXCELENTE PARA EL CEREBRO*PREVIENE EL CÁNCER*ALIVIA LA DIABETES',35000,'und',3,'NUEVO',4,5,0,3,NULL,NULL,NULL,NULL,NULL,NULL,'aceitelinaza.png'),(453,'41','ACEITE DE MACADAMIA x 250ml','','*AYUDA AL SISTEMA CARDIOVASCULAR*EXCELENTE QUEMADOR DE GRASA*ANTIOXIDANTE PARA LA PIEL',38000,'und',3,'NORMAL',4,5,0,3,NULL,NULL,NULL,NULL,NULL,NULL,'aceitemacadamia.png'),(454,'42','GOMITAS DE GUSANO','','',26000,'gr',4,'NUEVO',5,6,0,4,24000,3000,NULL,NULL,NULL,NULL,'gomitasgusano.png'),(455,'43','GOMITAS DE GUSANO SELLADAS','','',28000,'gr',3,'NORMAL',5,6,0,3,26000,3000,NULL,NULL,NULL,NULL,'gomitasgusano.png'),(456,'44','GOMITAS SELLADAS','','',24000,'gr',3,'NUEVO',5,6,0,3,20000,3000,NULL,NULL,NULL,NULL,'gomitasselladas.png'),(457,'45','GOMITAS ECONOMICAS','','',24000,'gr',2,'NORMAL',5,6,0,2,20000,3000,NULL,NULL,NULL,NULL,'gomitasselladas.png'),(458,'46','GOMTAS ARITO','','',28000,'gr',5,'NORMAL',5,6,0,5,26000,3000,NULL,NULL,NULL,NULL,'gomasarito.png'),(491,'47','HARINA DE ALMENDRAS','','*TU CORAZÓN TE LO AGRADECERÁ*GRAN APORTE ENERGETICO A TU CUERPO*LA HARINA DE ALMENDRAS NO ENGORDA*AYUDA A REGULAR EL AZUCAR DE LA SANGRE*TIENE PROPIEDADES ANTICANCERIGENAS*CUIDADO DE PIEL, CABELLO Y UÑAS',75000,'und',3,'NUEVO',7,9,0,3,70000,3000,NULL,NULL,NULL,NULL,'harinaalmendras.png'),(502,'48','HARINA DE AMARANTO','','',30000,'und',4,'NORMAL',7,9,0,4,28000,3000,NULL,NULL,NULL,NULL,'amaranto.png'),(503,'49','HARINA DE ARROZ','','*APORTA ENERGIA*REGULA LA FUNCIÓN INSTESTINAL*APOYA A CONTROLAR EL COLESTEROL*AYUDA A PERDER PESO*BUENA PARA LOS DIABETICOS*NO ACIDIFICA LA SANGRE*CONTIENE ANTIOXIDANTES*PREVIENE CANCER DE COLON',10000,'und',5,'NUEVO',7,9,0,5,9000,3000,NULL,NULL,NULL,NULL,'harinaarroz.png'),(504,'50','HARINA DE ARROZ INTEGRAL','','',25000,'und',3,'NORMAL',7,9,0,3,22000,3000,NULL,NULL,NULL,NULL,'harinaarrozintegral.png'),(505,'51','HARINA DE AVENA INTEGRAL','','*ALTO CONTENIDO DE ANTIOXIDANTES*EXCELENTE FUENTE DE FIBRA PARA EL COLON*AYUDA A CONTROLAR LOS PICOS DE GLUCEMIA*ESTREÑIMIENTO*EXCELENTE ALIMENTO PARA HACER DIETA',22000,'und',4,'NORMAL',7,9,0,4,20000,3000,NULL,NULL,NULL,NULL,'harinaavenaintegral.png'),(529,'52','HARINA DE SOYA','','',13000,'und',5,'NUEVO',7,9,0,5,11500,3000,NULL,NULL,NULL,NULL,'harinasoya.png'),(530,'53','HARINA TOSTADA SACHA INCHI','','*AUMENTA NOTABLEMENTE LA RESISTENCIA DEL CUERPO, MEJORA LA CIRCULACIÓN DE LA SANGRE*MINIMIZA EL COLESTEROL MALO (TIPO LDL) Y POTENCIA EL REGISTRO DE COLESTEROL BUENO (HDL)*DE IGUAL FORMA, EL SACHA INCHI FORTALECE EL SISTEMA CARDIOVASCULAR*POSEE ALTOS REGISTROS DE OMEGA 3, REDUCIENDO LA POSIBILIDAD DE SUFRIR ALGUNA ENFERMEDAD CARDÍACA*SIRVE PERDER PESO Y REDUCIR MEDIDAS*PROMUEVE UNA MEJOR VISIÓN, PREVIENE EL PROCESO DEGENERATIVO DE LA PIEL Y MINIMIZA EL POTENCIAL DE SUFRIR DIABETES TIPO II*REDUCE LOS PROBLEMAS HORMONALES EN LA MUJER*RETRASA EL PROCESO DE ENVEJECIMIENTO*COMBATE EL CANSANCIO, STRESS, AGOTAMIENTO NERVIOSO O MENTAL, INSOMNIO*APORTA EN EL TRATAMIENTO DE CROHN (INFLAMACIÓN DEL COLON).',24000,'und',5,'NORMAL',7,9,0,5,22000,3000,NULL,NULL,NULL,NULL,'harinasasha.png'),(531,'54','JUEGO DE MOLDES BAJOS','','',46000,'UND',3,'NORMAL',6,10,0,3,NULL,NULL,NULL,NULL,NULL,NULL,'boquillas.png'),(532,'55','MOLDE MINI CUP CAKES','','',34000,'UND',4,'NORMAL',6,10,0,4,NULL,NULL,NULL,NULL,NULL,NULL,'moldex24.png'),(533,'56','MOLDE CON ARO DESMONTABLE PRESS','','',42000,'UND',3,'NUEVO',6,10,0,3,NULL,NULL,NULL,NULL,NULL,NULL,'moldedesmontable.png'),(534,'57','GRAMERA DIGITAL','','',30000,'UND',2,'NORMAL',6,10,0,2,NULL,NULL,NULL,NULL,NULL,NULL,'grameradigital.png'),(535,'58','TOPPERS ACRÍLICO','','',17000,'UND',4,'NORMAL',6,10,0,4,NULL,NULL,NULL,NULL,NULL,NULL,'letrero.png'),(536,'59','JUEGO DE BOQUILLAS','','',165000,'UND',3,'NORMAL',6,10,0,3,NULL,NULL,NULL,NULL,NULL,NULL,'juegoboquillas.png'),(537,'60','ALISADOR DE FONDANT','','',9000,'UND',4,'NORMAL',6,10,0,4,NULL,NULL,NULL,NULL,NULL,NULL,'alisador.png'),(538,'61','MOLDE PAN TAJADO 27 X 15 PRESS','','',26000,'UND',3,'NUEVO',6,10,0,3,NULL,NULL,NULL,NULL,NULL,NULL,'moldepan.png'),(539,'62','PORCIONADOR DE TORTA 18000','','',18000,'UND',2,'NORMAL',6,10,0,2,NULL,NULL,NULL,NULL,NULL,NULL,'torta.png');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
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
  `idgrupo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fgk_grupos_carusel_idx` (`idgrupo`),
  CONSTRAINT `fgk_grupos_carusel` FOREIGN KEY (`idgrupo`) REFERENCES `grupos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carusel`
--

LOCK TABLES `carusel` WRITE;
/*!40000 ALTER TABLE `carusel` DISABLE KEYS */;
INSERT INTO `carusel` VALUES (1,'img/carusel/slider1.png','img/carusel/movil/slider1.png',0),(2,'img/carusel/slider2.png','img/carusel/movil/slider2.png',0),(3,'img/carusel/slider3.png','img/carusel/movil/slider3.png',0),(4,'img/carusel/slider4.png','img/carusel/movil/slider4.png',0),(5,'img/carusel/slider5.png','img/carusel/movil/slider5.png',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (4,'ACEITES'),(1,'FRUTOS'),(7,'HARINAS'),(0,'OTROS'),(3,'SEMILLAS'),(5,'SPRINKLES'),(2,'SUPERALIMENTOS'),(6,'UTENSILIOS');
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
  KEY `fgk_grupos_subgrupos_idx` (`idgrupo`),
  CONSTRAINT `fgk_grupos_subgrupos` FOREIGN KEY (`idgrupo`) REFERENCES `grupos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgrupos`
--

LOCK TABLES `subgrupos` WRITE;
/*!40000 ALTER TABLE `subgrupos` DISABLE KEYS */;
INSERT INTO `subgrupos` VALUES (0,'OTROS',0),(1,'FRUTOS SECOS',1),(2,'FRUTOS DESHIDRATADOS',1),(3,'OTROS',2),(4,'OTROS',3),(5,'ACEITES NATURALES',4),(6,'OTROS',5),(7,'FRUTOS',1),(8,'ACEITES',3),(9,'HARINAS SIN GLUTEN',7),(10,'OTROS',6);
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

-- Dump completed on 2020-10-28 23:56:17
