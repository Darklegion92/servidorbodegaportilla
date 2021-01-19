-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2021 a las 19:03:26
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apirest`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `inicializarDB` ()  BEGIN
	DELETE FROM orden_detalles;
    DELETE FROM ordenes;
    DELETE FROM clientes;
    DELETE FROM articulos;
    DELETE FROM barrios;
    DELETE FROM cupones;
    DELETE FROM carusel;
    DELETE FROM subgrupos;
    DELETE FROM grupos;
    DELETE FROM marcas;
    
    INSERT INTO grupos(id,nombre)VALUES(0,"OTROS");
    UPDATE grupos SET id = 0;
    
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
    ALTER TABLE carusel AUTO_INCREMENT = 1;
    ALTER TABLE cupones AUTO_INCREMENT = 1;
    ALTER TABLE subgrupos AUTO_INCREMENT = 1;
    ALTER TABLE grupos AUTO_INCREMENT = 1;
    ALTER TABLE marcas AUTO_INCREMENT = 1;
  
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `lista` varchar(1000) DEFAULT NULL,
  `precio` double NOT NULL DEFAULT 0,
  `embalaje` varchar(10) NOT NULL DEFAULT '100 Gr',
  `clasificacion` int(11) NOT NULL DEFAULT 5,
  `categoria` varchar(12) NOT NULL DEFAULT 'NORMAL',
  `idgrupo` int(11) NOT NULL DEFAULT 0,
  `idsubgrupo` int(11) NOT NULL DEFAULT 0,
  `idmarca` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 5,
  `dcto1` float DEFAULT NULL,
  `cant_dcto1` double DEFAULT NULL,
  `dcto2` float DEFAULT NULL,
  `cant_dcto2` double DEFAULT NULL,
  `dcto3` float DEFAULT NULL,
  `cant_dcto3` double DEFAULT NULL,
  `img` varchar(150) NOT NULL,
  `incremento` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `codigo`, `nombre`, `descripcion`, `lista`, `precio`, `embalaje`, `clasificacion`, `categoria`, `idgrupo`, `idsubgrupo`, `idmarca`, `rank`, `dcto1`, `cant_dcto1`, `dcto2`, `cant_dcto2`, `dcto3`, `cant_dcto3`, `img`, `incremento`) VALUES
(1, '614143814129', 'ACEITE DE AJONJOLI X 250 ML', 'el aceite de ajonjoli o sesamo es excelente como antiinflamatorio, fuente de calcio y también, para mejorar la salud cardiovascular, ya que favorece la circulación sanguínea e impide que la grasa se pegue a nuestras arterias', '*Ayuda a normalizar el equilibrio hormonal *mejora la condición de la piel y el cabello *alto contenido en aminoácidos linoleico, oleico, palmítico y esteárico *vitaminas A, D, C, E y B ayuda al transito intestinal', 35000, 'Und', 5, 'NORMAL', 32, 99, 1, 5, 34000, 3, NULL, NULL, NULL, NULL, 'img/articulos/614143814129.png', 100),
(2, 'ACEAL01', 'ACEITE DE ALMENDRAS X 200 ML ', 'Destacando que contiene por grasas monoinsaturadas, ácidos grasos esenciales como el omega 3 y el omega 6', '*es rico en antioxidantes *un excelente aliado para tu belleza y salud, por que es rico en vitamina E *ayuda a retener la humedad en la piel, esto hace que el cutis esté y se vea más saludable *Tiene excelentes propiedades calmantes y antiinflamatorias en la piel, es efectivo para restaurar el PH', 30000, 'Und', 5, 'NORMAL', 32, 99, 1, 5, 29000, 3, NULL, NULL, NULL, NULL, 'img/articulos/ACEAL01.png', 100),
(3, '614143779435', 'ACEITE DE COCO X 500 ML', 'Su contendió es de cerca del 90% de grasas saturadas. Es resistente a la oxidación y es muy usado en cosmética y cocina', '*ayudan a reducir los triglicéridos, el colesterol total y el colesterol LDL (malo) y eleva los niveles de colesterol HDL (bueno) *provocó una mejora inmediata en las funciones cerebrales de pacientes con Alzheimer leve *puede usarse como enjuague bucal, matando las bacterias de la boca, reduciendo el mal aliento y, por tanto, mejorando la salud bucal *ayudan a reducir la fatiga y el cansancio, aumentan las capacidades de concentración', 48000, 'Und', 5, 'NORMAL', 32, 99, 1, 5, 47000, 3, NULL, NULL, NULL, NULL, 'img/articulos/614143779435.png', 100),
(4, '614143779428', 'ACEITE DE COCO  DISPENSADOR   X 250 ML', 'Su contendió es de cerca del 90% de grasas saturadas. Es resistente a la oxidación y es muy usado en cosmética y cocina', '', 24000, 'Und', 5, 'NORMAL', 32, 99, 1, 1, 23000, 3, NULL, NULL, NULL, NULL, 'img/articulos/614143779428.png', 100),
(5, '614143779282', 'ACEITE DE COCO DISPENSADOR    X 125 ML', 'Su contendió es de cerca del 90% de grasas saturadas. Es resistente a la oxidación y es muy usado en cosmética y cocina', '', 14900, 'Und', 5, 'NORMAL', 32, 99, 1, 1, 13900, 3, NULL, NULL, NULL, NULL, 'img/articulos/614143779282.png', 100),
(6, 'ACEGI04', 'ACEITE DE GIRASOL ', 'Técnicamente se trata de un conjunto de grasas insaturadas, cardiosaludables (posee cantidades similares de ácido oleico comparado con el aceite de oliva), y fuente abundante de vitamina E, se considera también un potente antioxidante', '*es beneficioso para el sistema cardiovascular por contener grandes cantidades de colina y ácido fenólico *es bajo en grasas saturadas y contiene fito esteroles, un componente que bloquea la absorción de colesterol en los intestinos a la vez que protege al corazón *ayuda a reducir los niveles de colesterol total y triglicéridos en la sangre *es rico en vitaminas A, C y D y en carotenoides y ceras que son eficaces contra la lucha del acné *es el más rico de todos en Omega 6', 20000, 'Und', 5, 'NORMAL', 32, 99, 1, 5, 19000, 3, NULL, NULL, NULL, NULL, 'img/articulos/ACEGI04.png', 100),
(7, 'ACERI05', 'ACEITE DE RICINO X30ML ', 'es un gran hidratante y laxante, entro los muchos beneficios que tiene, desde tratar la caída del pelo y la caspa, a problemas de piel, las pestañas, la artritis o las picaduras de los insectos', '*Laxante natural *ayuda a proteger las células y frenar el envejecimiento, así como a reducir las arrugas, estrías o cicatrices *El aceite de ricino actúa como acondicionador natural, aportando hidratación y flexibilidad al cabello, previniendo la sequedad y evitando las puntas abiertas *alargador de pestañas natural', 9500, 'Und', 5, 'NORMAL', 32, 99, 1, 5, 9000, 3, NULL, NULL, NULL, NULL, 'img/articulos/ACERI05.png', 100),
(8, '7707194390780', 'RICHARD X L DESMOLDANTE  ', 'Desmoldante de base acuosa para moldes de plastico, caucho, siliconas que Impide la adherencia del yeso a los moldes se puede aplicar con pincel , pulverizador, esponja, rociador etc.', '', 18000, 'Und', 5, 'NORMAL', 34, 101, 1, 1, 17500, 3, NULL, NULL, NULL, NULL, 'img/articulos/7707194390780.png', 100),
(9, '614143779411', 'ACEITE DE COCO CORCHO 150 ML', 'Su contendió es de cerca del 90% de grasas saturadas. Es resistente a la oxidación y es muy usado en cosmética y cocina', '', 18000, 'Und', 5, 'NORMAL', 32, 99, 1, 1, 17000, 3, NULL, NULL, NULL, NULL, 'img/articulos/614143779411.png', 100),
(10, 'ACE03', 'ACEITE DE COCO X 1000 ', 'Su contendió es de cerca del 90% de grasas saturadas. Es resistente a la oxidación y es muy usado en cosmética y cocina', '', 88000, 'Und', 5, 'NORMAL', 32, 99, 1, 1, 87000, 3, NULL, NULL, NULL, NULL, 'img/articulos/ACE03.png', 100),
(11, '7706477100108', 'ACEITE DE OLIVA X 250 ML', 'el aceite no sólo destaca por sus cualidades organolépticas, sino que, además, tiene multitud de ventajas para nuestra salud', '', 17000, 'Und', 5, 'NORMAL', 32, 99, 1, 1, 16500, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706477100108.png', 100),
(12, '7706477100115', 'ACEITE DE OLIVA X 500 ML ', 'el aceite no sólo destaca por sus cualidades organolépticas, sino que, además, tiene multitud de ventajas para nuestra salud', '', 22000, 'Und', 5, 'NORMAL', 32, 99, 1, 1, 21500, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706477100115.png', 100),
(13, '7706477100122', 'ACEITE DE OLIVA X 1000 ML ', 'el aceite no sólo destaca por sus cualidades organolépticas, sino que, además, tiene multitud de ventajas para nuestra salud', '', 32000, 'Und', 5, 'NORMAL', 32, 99, 1, 1, 31000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706477100122.png', 100),
(14, '8410270043638', 'ACEITE DE OLIVA X 140 ML ', 'el aceite no sólo destaca por sus cualidades organolépticas, sino que, además, tiene multitud de ventajas para nuestra salud', ' *fortalece el cabello haciendo que crezca fuerte y sano *Mejora el funcionamiento del estómago y páncreas *Mejora el vaciamiento de la vesícula biliar, lo que evita la formación de cálculos biliares *Disminuye la acidez gástrica y facilita el tránsito intestinal *Mejora las funciones metabólicas y desarrollo cerebral ', 15000, 'Und', 5, 'NORMAL', 32, 99, 1, 1, 14500, 3, NULL, NULL, NULL, NULL, 'img/articulos/8410270043638.png', 100),
(15, 'ACEMACA', 'ACEITE DE MACADAMIA  200 ml', 'Aceite de macadamia 100% puro natural prensado en frío, sin refinar, extra virgen de macadamia, El aceite de macadamia es un gran aliado en el mundo de la belleza, pues sus grasas buenas ¡realmente hacen maravillas!', '*regenera el daño del pelo y combate la resequedad, ya que es rico en ácido palmotoléico y omega 7 *desvanece las manchas causadas por el sol, desvanecen las cicatrices y previenen la aparición de estrías *aumentan la producción del colesterol bueno y, al ser libre de lípidos trans, favorecen la reduccióndel colesterol malo y del riesgo a padecer las enfermedades derivadas del corazón', 30000, 'Und', 5, 'NORMAL', 32, 99, 1, 5, 28000, 3, NULL, NULL, NULL, NULL, 'img/articulos/ACEMACA.png', 100),
(16, '614143814204', 'ACEITE DE LINAZA X 250 ML ', 'El aceite de linaza o lino aporta muchas propiedades a nuestro organismo, incluidos los ojos, por lo que ya son muchas las personas que empiezan a incorporarlo en su consumo para una dieta sana y equilibrada', '', 35000, 'Und', 5, 'NORMAL', 32, 99, 1, 5, 29000, 3, NULL, NULL, NULL, NULL, 'img/articulos/614143814204.png', 100),
(17, 'VINAGREBALS', 'VINAGRE BALSAMICO DE MANZANA X 250 ML ', 'Compañero ideal de platos en los que la manzana esté presente. Preparaciones calientes como puré de manzana o manzana al horno, fríos como ensalada de manzana, incluso muy fríos como helado de manzana. Especialmente recomendado con ensalada de queso, nueces y manzana y además carnes blancas La reducción de este vinagre trae notas aciduladas a los preparativos.', '', 25000, 'Und', 5, 'NUEVO', 33, 100, 41, 1, 24000, 3, NULL, NULL, NULL, NULL, 'img/articulos/VINAGREBALS.png', 100),
(18, 'VINAGRE250', 'VINAGRE DE MANZANA X 250 ML ', 'Vinagre de manzana natural, elaborado a partir de la doble fermentación del jugo de manzana. Vinagre tradicional utilizado en todo el mundo por su gran versatilidad. Compañero favorito de los chef mas exigentes y amantes de la buena cocina. Se puede consumir directamente diluyendo 3 cucharadas en un vaso con agua, después de las comidas, varias veces al día.', '', 25000, 'Und', 5, 'NUEVO', 33, 100, 41, 1, 24000, 3, NULL, NULL, NULL, NULL, 'img/articulos/VINAGRE250.png', 100),
(19, '7706160000012', 'VINAGRE DE MANZANA X 500 ML ', 'Vinagre de manzana GOLDEN, elaborado a partir del jugo fermentado de manzana (También llamado sidra de manzana) con las formulas ancestrales de nuestros abuelos. Conserva los nutrientes de la fruta, ha sido utilizado por sus propiedades benéficas a la salud humana y es un excelente aderezo. Su sabor posee las notas dulces y acidas de las manzanas verdes y rojas.', '', 16000, 'Und', 5, 'NUEVO', 33, 100, 41, 5, 15000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706160000012.png', 100),
(20, '7706160000036', 'VINAGRE DE PERA X 500 ML ', 'El vinagre de los hombres, la pera es considerada fruto del hombre. Aderezo perfecto para ensaladas de verduras, crudités, aliños, escabeches y adobos. Aporta agradable aroma frutal a platos de carnes mixtas e incluso postres y encurtidos. Se puede consumir directamente diluyendo 3 cucharadas en un vaso con agua, después de las comidas, varias veces al día.', '', 16000, 'Und', 5, 'NUEVO', 33, 100, 41, 5, 15000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706160000036.png', 100),
(21, '7706160000388', 'VINAGRE FINAS HIERBAS X 250 ML ', 'Vinagre de manzana natural, elaborado a partir de la doble fermentación del jugo de manzana con finas hierbas. Este vinagre aromatiza cualquier comida, dando un exquisito sabor. Especial para carnes, encurtidos, pastas, vinagretas, Queso Marinado. Con este vinagre podrás hacer una deliciosa reducción.', '', 25000, 'Und', 5, 'NUEVO', 33, 100, 41, 1, 24000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706160000388.png', 100),
(22, '7706160000029', 'VINAGRE FRUTOS ROJOS X500 ML ', 'Vinagre natural elaborado a partir de la doble fermentación del jugo de uva Isabela, fresas y moras. Este vinagre aporta un sabor único en especial a los pescados y mariscos. También se utiliza en reducción para postres y pastelería. Otros usos en vinagretas, ensaladas y pepinillos. Se puede consumir directamente diluyendo 3 cucharadas en un vaso con agua, después de las comidas, varias veces al día.', '', 16000, 'Und', 5, 'NUEVO', 33, 100, 41, 5, 15000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706160000029.png', 100),
(23, 'VINAGRELULO', 'VINAGRE LULO X 250 ML', 'Vinagre utilizado en la coctelería, sus notas acidas y su exquisito aroma logra un perfecto equilibrio al mezclarlo con licores para obtener resultados fascinantes e interesantes. Se puede utilizar en ensaladas de frutas.', '', 25000, 'Und', 5, 'NUEVO', 33, 100, 41, 5, 24000, 3, NULL, NULL, NULL, NULL, 'img/articulos/VINAGRELULO.png', 100),
(24, '7706160000227', 'VINAGRE MANGO X 250 ML ', 'Su textura es densa y tiene un sabor fresco, con una combinación de dulce y ácido. Es ideal para ensaladas, pescados blancos, macedonias de frutas, quesos y helados.', '', 25000, 'Und', 5, 'NUEVO', 33, 100, 41, 1, 24000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706160000227.png', 100),
(25, '7706160000319', 'VINAGRE MANZANA ORGANICO X 500 ML ', 'El vinagre de manzana es mucho más que un condimento para ensaladas. Su versatilidad lo convierte en un elemento con múltiples usos en la cocina y en el hogar. Puedes emplearlo como limpiador, conservante alimentario, repelente de mosquitos, cosmético natural, desinfectante', '*Entre las propiedades medicinales del vinagre de manzana destacan sus efectos hipoglucemiantes (disminuye el nivel de glucosa en sangre), hipolipemiantes (reduce el colesterol y los triglicéridos en sangre) y antimicrobianos. Puede colaborar en la pérdida de peso debido a que promueve la sensación de saciedad', 28000, 'Und', 5, 'NUEVO', 33, 100, 41, 5, 27000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706160000319.png', 100),
(26, '7706160000166', 'VINAGRE MARACUYA X 250 ML ', 'Vinagre natural elaborado a partir de la doble fermentación del jugo de maracuyá, fruta exótica que proporciona el exquisito sabor del trópico, es un gran aderezo para todo tipo de alimentos, sirve para marinar carnes, pescados, pepinillos, ensaladas y vinagretas. La reducción de este vinagre trae notas aciduladas a los preparativos.', '', 25000, 'Und', 5, 'NUEVO', 33, 100, 41, 5, 24000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7706160000166.png', 100),
(780, 'AZUGR01', 'AZUCAR  A GRANEL  X 50K BULTO', '', '', 3, 'Gr', 5, 'NORMAL', 34, 112, 1, 1, 2.58, 50000, NULL, NULL, NULL, NULL, 'img/articulos/AZUGR01.png', 500),
(781, 'AZUCAR', 'AZUCAR DE COLORES', '', '', 25, 'Gr', 5, 'NUEVO', 34, 112, 1, 5, 22, 3000, NULL, NULL, NULL, NULL, 'img/articulos/AZUCAR.png', 250),
(782, '7702059202024', 'AZUCAR INCAUCA  MORENA X  K ', '', '', 3.5, 'Gr', 5, 'NORMAL', 34, 112, 42, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702059202024.png', 100),
(783, 'MORENA', 'AZUCAR INCAUCA MORENA X LB', '', '', 2, 'Gr', 5, 'NORMAL', 34, 112, 42, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MORENA.png', 100),
(784, '7702117009459', 'PULVERIZADA  ITALO  X500                        ', 'Azúcar pulverizada obtenida a partir de la molienda del grano de azúcar para reducir el tamaño de sus cristales. Se combina perfectamente con otros productos cuando se usa para decorar, es de sabor agradable y de fácil mezcla con diferentes colorantes', '', 4000, 'Und', 5, 'NORMAL', 34, 112, 43, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702117009459.png', 100),
(785, 'AZUANF09', 'PULVERIZADA ECONOMICA X 25K ', '', '', 4.5, 'Gr', 5, 'NORMAL', 34, 112, 44, 5, 3.2, 25000, NULL, NULL, NULL, NULL, 'img/articulos/AZUANF09.png', 500),
(786, '7702014020403', 'PULVERIZADA LEVAPAN  X K', 'Polvo blanco y fino que se obtiene a partir de azúcar refinada. Útil para la elaboración y decoración de productos de panadería, pastelería, bizcochería y galletería', '', 7000, 'Und', 5, 'NORMAL', 34, 112, 45, 5, 6800, 20, NULL, NULL, NULL, NULL, 'img/articulos/7702014020403.png', 100),
(787, '7707119760117', 'PULVERIZADA PRODIA KILO', 'Azúcar refinada 5X útil para la elaboración y decoración de productos, Panadería, pastelería, bizcochería y galletería. Especial para la elaboración de pastillaje', '', 7000, 'UND', 5, 'NORMAL', 34, 112, 46, 1, 6800, 25, NULL, NULL, NULL, NULL, 'img/articulos/7707119760117.png', 100),
(788, '614143779336', 'PULVERIZADA SURTICOCOS X 5 K ', '', '', 28000, 'Und', 5, 'NORMAL', 34, 112, 44, 1, 25000, 5, NULL, NULL, NULL, NULL, 'img/articulos/614143779336.png', 100),
(789, '614143779312', 'PULVERIZADA SURTICOCOS X K ', '', '', 6000, 'Und', 5, 'NORMAL', 34, 112, 44, 5, 5280, 25, NULL, NULL, NULL, NULL, 'img/articulos/614143779312.png', 100),
(790, '7702400000545', 'COBERTURA 3A BLANCA X500 GR', '', '', 5000, 'Und', 5, 'NORMAL', 34, 112, 47, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702400000545.png', 100),
(791, '7702400000484', 'COBERTURA 3A NEGRA X500 GR', '', '', 7500, 'Und', 5, 'NORMAL', 34, 112, 47, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702400000484.png', 100),
(792, '7702109021827', 'COBERTURA DAGUSTO BLANCA X 2,5 K', '', '', 43000, 'Und', 5, 'NORMAL', 34, 112, 48, 5, 42000, 4, NULL, NULL, NULL, NULL, 'img/articulos/7702109021827.png', 100),
(793, '7702109021667', 'COBERTURA DAGUSTO NEGRA X 2,5 K', '', '', 41000, 'Und', 5, 'NORMAL', 34, 112, 48, 5, 40000, 4, NULL, NULL, NULL, NULL, 'img/articulos/7702109021667.png', 100),
(794, '7702007021554', 'DEPOSITADOS MARRON COBERTURA LECHE', 'Cobertura sabor a chocolate dulce Masa Glase Leche. Mezcla de leche, azúcar y grasa vegetal de alta calidad.', '', 18, 'Gr', 5, 'NORMAL', 34, 112, 49, 5, 17.5, 10000, NULL, NULL, NULL, NULL, 'img/articulos/7702007021554.png', 250),
(795, '7702007007275', 'COBERT BARRA BLANCA X K CB NUTRESA  ', '', '', 19500, 'UND', 5, 'NORMAL', 34, 112, 49, 5, 19, 10, NULL, NULL, NULL, NULL, 'img/articulos/7702007007275.png', 100),
(796, '7702007000771', 'COBERT BARRA MARRON  X K CB NUTRESA ', '', '', 18000, 'Und', 5, 'NORMAL', 34, 112, 49, 5, 17500, 10, NULL, NULL, NULL, NULL, 'img/articulos/7702007000771.png', 100),
(797, '7702007031560', 'COCOA CORONA X 100 GR ', '', '', 3400, 'Und', 5, 'NORMAL', 34, 112, 49, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702007031560.png', 100),
(798, '7702007031553', 'COCOA CORONA  X 230 GR', '', '', 5800, 'Und', 5, 'NORMAL', 34, 112, 49, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702007031553.png', 100),
(799, '7707062523128', 'COBERTURA PURATOS SEMIAMARGO BARRA X K LEVAPAN', '', '', 20000, 'Und', 5, 'NORMAL', 34, 112, 50, 1, 19000, 10, NULL, NULL, NULL, NULL, 'img/articulos/7707062523128.png', 100),
(800, '7702007023992', 'DEPOSITADOS BLANCA COBERTURA', 'Cobertura sabor a chocolate dulce Masa Glase Leche. Mezcla de leche, azúcar y grasa vegetal de alta calidad.', '', 19.5, 'Gr', 5, 'NORMAL', 34, 112, 49, 5, 19, 10000, NULL, NULL, NULL, NULL, 'img/articulos/7702007023992.png', 250),
(801, 'CUBCHO', 'LPU CHOCOCUBIERTA X 4K', '', '', 16, 'Gr', 5, 'NORMAL', 34, 112, 49, 5, 14.5, 4000, NULL, NULL, NULL, NULL, 'img/articulos/CUBCHO.png', 250),
(802, 'SURCO', 'COCOA A GRANEL GIRONES ', '', '', 19, 'Gr', 5, 'NORMAL', 34, 112, 51, 5, 17, 10000, NULL, NULL, NULL, NULL, 'img/articulos/SURCO.png', 250),
(803, '7703092001377', 'COBERTURA BLANCA GIRONES', '', '', 8000, 'Und', 5, 'NORMAL', 34, 112, 51, 1, 7800, 10, NULL, NULL, NULL, NULL, 'img/articulos/7703092001377.png', 100),
(804, '7703092001001', 'COBERTURA NEGRA GIRONES', '', '', 8000, 'Und', 5, 'NORMAL', 34, 112, 51, 1, 7800, 10, NULL, NULL, NULL, NULL, 'img/articulos/7703092001001.png', 100),
(805, '7702007028942', 'CHOCOLATE BLANCO X 4 L ', '', '', 75000, 'Und', 5, 'NORMAL', 34, 112, 49, 5, 72000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7702007028942.png', 100),
(806, '80135463', 'NUTELLA X 200 GR ', '', '', 13500, 'Und', 5, 'NORMAL', 34, 112, 52, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/80135463.png', 100),
(807, '80177173', 'NUTELLA X 350 GR ', '', '', 17500, 'Und', 5, 'NORMAL', 34, 112, 52, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/80177173.png', 100),
(808, '80176800', 'NUTELLA X 750 GR', '', '', 31800, 'Und', 5, 'NORMAL', 34, 112, 52, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/80176800.png', 100),
(809, 'CHOCOLATE75', 'CHOCOLATE 75% GIRONES ', '', '', 40, 'Gr', 5, 'NORMAL', 34, 112, 51, 1, 38, 2000, NULL, NULL, NULL, NULL, 'img/articulos/CHOCOLATE75.png', 100),
(810, '7702007021561', 'DEPOSITADO SEMIAMARGO ', 'Cobertura sabor a chocolate semiamargo Masa Glase Negra. Mezcla de leche, azúcar y grasa vegetal de alta calidad.', '', 20, 'Gr', 5, 'NORMAL', 34, 112, 49, 5, 19, 10000, NULL, NULL, NULL, NULL, 'img/articulos/7702007021561.png', 250),
(811, '7707212302252', 'CREMA DE AVELLANAS 1.3K', '', '', 50000, 'Und', 5, 'NORMAL', 34, 112, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707212302252.png', 100),
(812, '7702088198206', 'COBERTURA SIN AZUCAR 58% LUKER X K', '', '', 35000, 'Und', 5, 'NORMAL', 34, 112, 53, 5, 32000, 4, NULL, NULL, NULL, NULL, 'img/articulos/7702088198206.png', 100),
(813, '7702007048643', 'CHOCOLATE BLANCO EN POLVO X 2.5K', 'Cobertura blanca en polvo, 100% chocolate, manteca de cacao. Ideal en la elaboración de bebidas calientes, helados y productos horneados. Aporta suavidad y textura cremosa.', '*Ingrediente para elaborar bebidas calientes\n*Parte de la formulación de helados o caramelos\n*Ingrediente en productos horneados\n*Como topping para espolvorear', 25000, 'Und', 5, 'NORMAL', 34, 112, 49, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702007048643.png', 100),
(814, '7707212302283', 'CREMA DE AVELLANAS X 6 K ', '', '', 250000, 'Und', 5, 'NORMAL', 34, 112, 54, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707212302283.png', 100),
(815, 'LUKER', 'CHOCOLATE LUKER NEGRO MONEDAS X KILO', '', '', 20000, 'Und', 5, 'NORMAL', 34, 112, 53, 5, 19000, 6, NULL, NULL, NULL, NULL, 'img/articulos/LUKER.png', 100),
(816, '7702007067378', 'COBERTURA LIQUIDA BLANCA X KILO NUTRESA', '', '', 20000, 'Und', 5, 'NUEVO', 34, 112, 49, 5, 19000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702007067378.png', 100),
(817, '7702007067361', 'COBERTURA LIQUIDA SEMIAMARGA  X KILO NUTRESA', '', '', 19000, 'Und', 5, 'NUEVO', 34, 112, 49, 5, 18000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702007067361.png', 100),
(818, 'COB', 'COBERTURA MANA ', '', '', 6500, 'Und', 5, 'NORMAL', 34, 112, 43, 1, 6000, 10, NULL, NULL, NULL, NULL, 'img/articulos/COB.png', 100),
(819, 'COLA19', 'AMARILLO POLVO C10 X500 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 16000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 15000, 24, NULL, NULL, NULL, NULL, 'img/articulos/COLA19.png', 100),
(820, 'COLA20', 'AZUL POLVO C10 X500 CAROL  COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 16000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, 15000, 12, NULL, NULL, NULL, NULL, 'img/articulos/COLA20.png', 100),
(821, '7707175882235', 'AMARILLO HUEVO SOBRE X25 GR  COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 2000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707175882235.png', 100),
(822, '7707175881610', 'AMARILLO HUEVO POLVO  X500  COLORISA POTE ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 14000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, 13000, 24, NULL, NULL, NULL, NULL, 'img/articulos/7707175881610.png', 100),
(823, 'COLC21', 'CAFE POLVO  C10  X 500 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 18000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, 17000, 12, NULL, NULL, NULL, NULL, 'img/articulos/COLC21.png', 100),
(824, 'COLF22', 'FUCSIA POLVO  C10 X 500 GR COLORISA ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 85000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 75000, 3, NULL, NULL, NULL, NULL, 'img/articulos/COLF22.png', 100),
(825, '7707119773124', 'COLORANTE GRANDE PRODIA X 360 LIQUIDO', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 49000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 48000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707119773124.png', 100),
(826, '7707175885953', 'COLORANTE GRANDE COLORISA X390 LIQUIDO ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 50000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 48000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707175885953.png', 100),
(827, 'COLM23', 'MORA  POLVO   C10 X 500  GR COLORISA ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 20000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, 19000, 6, NULL, NULL, NULL, NULL, 'img/articulos/COLM23.png', 100),
(828, 'COLNA24', 'NARANJA POLVO  C10 X 500 GR COLORISA ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 14000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 13000, 6, NULL, NULL, NULL, NULL, 'img/articulos/COLNA24.png', 100),
(829, 'COLNE25', 'NEGRO POLVO   C10 X 500 GR COLORISA ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 22000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 21000, 6, NULL, NULL, NULL, NULL, 'img/articulos/COLNE25.png', 100),
(830, 'COLR27', 'ROJO POLVO C10 X500 CAROL COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 14000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, 13000, 6, NULL, NULL, NULL, NULL, 'img/articulos/COLR27.png', 100),
(831, 'COL123', 'ROJO  ESCARLATA POLVO POTE X 500 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 14000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 13000, 24, NULL, NULL, NULL, NULL, 'img/articulos/COL123.png', 100),
(832, 'COLRE05', 'ROJO  ESCARLATA SOBRE  X25 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 2000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/COLRE05.png', 100),
(833, '7707175881627', 'ROJO ESCARLATA POLVO X500 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 15000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707175881627.png', 100),
(834, '7707175882242', 'ROJO ESCARLATA L SOBRE X25 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 2000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707175882242.png', 100),
(835, '7707175881894', 'ROJO ESCARLATA L X 250 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 8000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, 7500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707175881894.png', 100),
(836, 'COLRF26', 'ROJO FRESA POLVO  C10 X500 GR COLORISA  ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 15000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 14000, 6, NULL, NULL, NULL, NULL, 'img/articulos/COLRF26.png', 100),
(837, 'COLROS28', 'ROSADO  POLVO C10 X 500 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 46000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 45000, 3, NULL, NULL, NULL, NULL, 'img/articulos/COLROS28.png', 100),
(838, 'COLTINC17', 'TINTA CARAMELO X 4,87', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 41000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 39000, 3, NULL, NULL, NULL, NULL, 'img/articulos/COLTINC17.png', 100),
(839, 'COLTINC18', 'TINTA CARAMELO X 650     ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 6000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/COLTINC18.png', 100),
(840, 'COLUV29', 'UVA POLVO   C10   X 500 GR COLORISA ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 18000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, 17000, 3, NULL, NULL, NULL, NULL, 'img/articulos/COLUV29.png', 100),
(841, 'COLV31', 'VERDE POLVO C10 X500 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 14000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 13000, 3, NULL, NULL, NULL, NULL, 'img/articulos/COLV31.png', 100),
(842, 'COLVL30', 'VERDE LIMON POLVO  C10 X  500 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 14000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 13000, 6, NULL, NULL, NULL, NULL, 'img/articulos/COLVL30.png', 100),
(843, 'POLDOR54', 'POLVO DORADO  ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 280, 'Gr', 5, 'NORMAL', 34, 102, 55, 5, 250, 2000, NULL, NULL, NULL, NULL, 'img/articulos/POLDOR54.png', 100),
(844, '7707119774077', 'AMARILLO HUEVO SOBRE PRODIA X25 GR COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 2000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707119774077.png', 100),
(845, '707119774084', 'ROJO ESCARLATA PRODIA X 25  GR', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 2000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/707119774084.png', 100),
(846, 'POLVPLA', 'POLVO PLATEADO ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 280, 'Gr', 5, 'NORMAL', 34, 102, 1, 5, 250, 2000, NULL, NULL, NULL, NULL, 'img/articulos/POLVPLA.png', 100),
(847, 'TARRTINT', 'TINTA CARAMELO PEQUEÑO X 60 ML ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 2500, 'Und', 5, 'NORMAL', 34, 102, 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/TARRTINT.png', 100),
(848, '7707175882839', 'AMARILLO HUEVO X 250 COLORISA POTE', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 7000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 6500, 24, NULL, NULL, NULL, NULL, 'img/articulos/7707175882839.png', 100),
(849, 'TRAZADOR1', 'TRAZADOR DORADO X 75 G  COLORISA', '', '', 17000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/TRAZADOR1.png', 100),
(850, 'TRAZADOR2', 'TRAZADOR PLATEADO X 75 G COLORISA', '', '', 15000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/TRAZADOR2.png', 100),
(851, 'COLORGEL', 'COLORANTE GEL GRAN X 60 ML COLORISA', 'Úsalo para pintar cremas y fondant. Es más concentrado y estable a la luz y al calor.', '', 12000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 11500, 12, NULL, NULL, NULL, NULL, 'img/articulos/COLORGEL.png', 100),
(852, 'GOTEROPRODIA', 'GOTERO PRODIA PEQUEÑO ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 2500, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 2400, 12, NULL, NULL, NULL, NULL, 'img/articulos/GOTEROPRODIA.png', 100),
(853, 'GOTEROPROD', 'GOTERO PRODIA GRANDE ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 12000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 11500, 6, NULL, NULL, NULL, NULL, 'img/articulos/GOTEROPROD.png', 100),
(854, 'GOTEROCOLS', 'GOTERO COLSABOR PEQUEÑO ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 2500, 'Und', 5, 'NORMAL', 34, 102, 57, 5, 2200, 12, NULL, NULL, NULL, NULL, 'img/articulos/GOTEROCOLS.png', 100),
(855, 'POLVOBLANCO', 'POLVO BLANCO DIOXIDO DE TITANIO ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 50, 'Gr', 5, 'NORMAL', 34, 102, 55, 5, 40, 1000, NULL, NULL, NULL, NULL, 'img/articulos/POLVOBLANCO.png', 100),
(856, 'COLORGEL2', 'COLORANTE GEL PEQ X 13 ML COLORISA', 'Úsalo para pintar cremas y fondant. Es más concentrado y estable a la luz y al calor.', '', 5500, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 5000, 12, NULL, NULL, NULL, NULL, 'img/articulos/COLORGEL2.png', 100),
(857, 'TRAZADORPER', 'TRAZADOR PERLADO COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 18000, 'Und', 5, 'NORMAL', 34, 102, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/TRAZADORPER.png', 100),
(858, 'COLOR', 'COLORANTE LACA SOBRE COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 8000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/COLOR.png', 100),
(859, '7707175883485', 'ROJO ESCARLATA X 250 POTE  COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 8000, 'Und', 5, 'NORMAL', 34, 102, 55, 5, 7000, 24, NULL, NULL, NULL, NULL, 'img/articulos/7707175883485.png', 100),
(860, 'LACA', 'COLORANTE LACA GRANDE COLORISA', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 18000, 'Und', 5, 'NUEVO', 34, 102, 55, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/LACA.png', 100),
(861, 'LACAF', 'COLORANTE LACA ROSADO COLORISA ', 'Úsalo para pintar bombones, turrones, figuras decorativas de chocolate, helados, postres, lácteos, mazapanes, crema batida y cubiertas de azúcar.', '', 19000, 'Und', 5, 'NUEVO', 34, 102, 55, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/LACAF.png', 100),
(862, 'MATI', 'MATIZADORES ', 'tenemos una variedad de colores que te permite tener un terminado esplendido, es ideal para trabajar en aerografo hobby kor o en spray, es un producto novedoso que ayuda a dar un acabado brillante a tus cremas o pastillaje.', '*azul-amarillo - rojo - aguamarina - bronce - verde -plateado', 26000, 'Und', 5, 'NUEVO', 34, 102, 1, 5, 24000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MATI.png', 100),
(863, 'COL', 'COLORANTE NEON ', 'Disfruta de una explocion de colores para tus chocolates o cremas', '*amarillo - verde - rojo - fucsia - naranja - morado - ', 22000, 'Und', 5, 'NUEVO', 34, 102, 1, 5, 21000, 6, NULL, NULL, NULL, NULL, 'img/articulos/COL.png', 100),
(864, '7707324630229', 'AREQUIPE X900 NUTRINAT', '', '', 7000, 'Und', 5, 'NORMAL', 34, 108, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630229.png', 100),
(865, '7707324630182', 'AREQUIPE X500 NUTRINAT', '', '', 5000, 'Und', 5, 'NORMAL', 34, 108, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630182.png', 100),
(866, 'ARECR06', 'AREQUIPE X5K NUTRINAT', '', '', 34000, 'Und', 5, 'NORMAL', 34, 108, 58, 5, 32000, 6, NULL, NULL, NULL, NULL, 'img/articulos/ARECR06.png', 100),
(867, '7707337090027', 'BOCADILLO BARRA  EL PRINCIPE  X 350 ', '', '', 2000, 'Und', 5, 'NORMAL', 34, 108, 59, 1, 42000, 30, NULL, NULL, NULL, NULL, 'img/articulos/7707337090027.png', 100),
(868, 'BOCBLO30', 'BOCADILLO BLOQUE MEDIA ARROBA PRINCIPE', '', '', 25000, 'Und', 5, 'NORMAL', 34, 108, 59, 1, 82000, 4, NULL, NULL, NULL, NULL, 'img/articulos/BOCBLO30.png', 100),
(869, '7707194390681', 'BREVAS EN ALMIBAR   XK  LEVAPAN', 'Brevas enteras clasificadas y conservadas en almíbar, especiales para rellenar y decorar productos de panadería, pastelería y bizcochería.', '', 8500, 'Und', 5, 'NORMAL', 34, 108, 45, 1, 7800, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707194390681.png', 100),
(870, '7702400000668', 'CEREZA 3A X 4  K FS', '', '', 58000, 'Und', 5, 'NORMAL', 34, 108, 60, 1, 56000, 4, NULL, NULL, NULL, NULL, 'img/articulos/7702400000668.png', 100),
(871, '7702400000699', 'CEREZA 3A   X K FS', '', '', 19000, 'Und', 5, 'NORMAL', 34, 108, 60, 1, 18000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702400000699.png', 100),
(872, '7702400000651', 'CEREZA 3A    X 500 FS', '', '', 9800, 'Und', 5, 'NORMAL', 34, 108, 60, 1, 9500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702400000651.png', 100),
(873, '7702400000644', 'CEREZA 3A    X 250 FS', '', '', 5800, 'Und', 5, 'NORMAL', 34, 108, 60, 1, 5500, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702400000644.png', 100),
(874, '7702400000637', 'CEREZA 3A    X 125 FS', '', '', 4200, 'Und', 5, 'NORMAL', 34, 108, 60, 1, 4000, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702400000637.png', 100),
(875, '7702400000323', 'DURAZNOS 3A LATA  X 820  EN MITADES X 24  FS', '', '', 6500, 'Und', 5, 'NORMAL', 34, 108, 60, 1, 6000, 24, NULL, NULL, NULL, NULL, 'img/articulos/7702400000323.png', 100),
(876, '7702014595307', 'FRUTA CRISTALIZADA  NACIONAL   3A  PB', 'Cubitos de fruta cristalizada en color amarillo (66 %), rojo (17 %) y verde (17 %), especiales para decoración y relleno de productos de panadería, bizcochería, galletería y heladería.', '', 11, 'Gr', 5, 'NORMAL', 37, 109, 45, 1, 10, 10000, 9.5, 20000, NULL, NULL, 'img/articulos/7702014595307.png', 250),
(877, '7709990893984', 'GLASSE CHICLE X K ', 'Con su textura suave y densa, podrás, además de rellenar, hacer decoraciones sobre galletas, tortas y postres.', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 61, 1, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990893984.png', 100),
(878, '7709990049299', 'GLASSE DURAZNO  X K   ', 'Con su textura suave y densa, podrás, además de rellenar, hacer decoraciones sobre galletas, tortas y postres.', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 61, 1, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990049299.png', 100),
(879, '7709990893960', 'GLASSE FRESA  X K   ', 'Con su textura suave y densa, podrás, además de rellenar, hacer decoraciones sobre galletas, tortas y postres.', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 61, 1, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990893960.png', 100),
(880, '7709990049282', 'GLASSE KIWI   X K   ', 'Con su textura suave y densa, podrás, además de rellenar, hacer decoraciones sobre galletas, tortas y postres.', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 61, 1, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990049282.png', 100),
(881, '7709990793673', 'GLASSE MARACUYA  X K   ', 'Con su textura suave y densa, podrás, además de rellenar, hacer decoraciones sobre galletas, tortas y postres.', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 61, 1, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990793673.png', 100),
(882, '7709990695427', 'GLASSE MORA  X K   ', 'Con su textura suave y densa, podrás, además de rellenar, hacer decoraciones sobre galletas, tortas y postres.', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 61, 1, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990695427.png', 100),
(883, '7709990366907', 'GLASSE NEUTRO  X K   ', 'Con su textura suave y densa, podrás, además de rellenar, hacer decoraciones sobre galletas, tortas y postres.', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 61, 1, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990366907.png', 100),
(884, '7709990049220', 'GLASSE PIÑA  X K   ', 'Con su textura suave y densa, podrás, además de rellenar, hacer decoraciones sobre galletas, tortas y postres.', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 61, 1, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990049220.png', 100),
(885, 'GLICO56', 'GLICERINA   X 4,870 GR', 'Aporta humedad y elasticidad a fondant, caramelos y productos de repostería.', '', 39000, 'Und', 5, 'NORMAL', 34, 101, 62, 1, 38000, 4, NULL, NULL, NULL, NULL, 'img/articulos/GLICO56.png', 100),
(886, 'GLU57', 'GLUCOSA  X  40 K                              ', 'Se usa en la elaboración de confites, fondant y productos de repostería. ', '', 10, 'Gr', 5, 'NORMAL', 34, 101, 62, 1, 8, 6000, 7, 40000, NULL, NULL, 'img/articulos/GLU57.png', 250),
(887, '7707324630571', 'CONDENSADA TETERO X K NUTRINAT', '', '', 7500, 'Und', 5, 'NORMAL', 34, 108, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630571.png', 100),
(888, '7707324630151', 'CONDENSADA X500 NUTRINAT', '', '', 5000, 'Und', 5, 'NORMAL', 34, 108, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630151.png', 100),
(889, '7707324630120', 'CONDENSADA TETERO X 400 NUTRINAT ', '', '', 5000, 'Und', 5, 'NORMAL', 34, 108, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630120.png', 100),
(890, '7707324630168', 'CONDENSADA NUTRI X 2,1 NUTRINAT', '', '', 16000, 'Und', 5, 'NORMAL', 34, 108, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630168.png', 100),
(891, '7707324630946', 'CONDENSADA X5K NUTRINAT ', '', '', 34000, 'Und', 5, 'NORMAL', 34, 108, 58, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630946.png', 100),
(892, '7707324630137', 'CONDENSADA X900 NUTRINAT', '', '', 7000, 'Und', 5, 'NORMAL', 34, 108, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630137.png', 100),
(893, 'MIEL58', 'MIEL X 250 PARA REPOSTERIA ', '', '', 4000, 'Und', 5, 'NORMAL', 34, 108, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MIEL58.png', 100),
(894, 'MIEL59', 'MIEL  X LITRO PARA REPOSTERIA ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 108, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MIEL59.png', 100),
(895, '7702400001542', 'PIÑA EN RODAJAS X  567 GR 3A     ', '', '', 7500, 'Und', 5, 'NORMAL', 34, 108, 47, 1, 7000, 24, NULL, NULL, NULL, NULL, 'img/articulos/7702400001542.png', 100),
(896, 'PIPGEN61', 'PIPAS DE JENGIBRE', '', '', 200, 'Und', 5, 'NORMAL', 36, 107, 1, 5, 140, 100, NULL, NULL, NULL, NULL, 'img/articulos/PIPGEN61.png', 100),
(897, '7702141001733', 'RELLENO FRESA  RICH S', 'Disfruta el delicioso sabor a fresa. Desde adentro hacia afuera nuestros rellenos de fruta son perfectos para realzar aun más el dulce sabor de tus creaciones', '*Práctico empaque en manga que te permite una fácil manipulación y aplicación *Tiene un delicioso sabor y aroma a fresa *Ideal para u tilizarse en productos de pastelería, panadería, heladería y bebidas *Se puede mezclar con cremas ligeras para utilizar como cobertura o rellenos en tortas y postres', 10000, 'Und', 5, 'NORMAL', 34, 108, 63, 1, 9000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702141001733.png', 100),
(898, '7702141001757', 'RELLENO MELOCOTON  RICH S', 'Disfruta el delicioso sabor a melocotón. Desde adentro hacia afuera nuestros rellenos de fruta son perfectos para realzar aun más el dulce sabor de tus creaciones', '*Práctico empaque en manga que te permite una fácil manipulación y aplicación *Tiene un delicioso sabor y aroma a melocotón *Ideal para utilizarse en productos de pastelería, panadería, heladería y bebidas *Se puede mezclar con cremas ligeras para utilizar como cobertura o rellenos en tortas y postres', 12000, 'Und', 5, 'NORMAL', 34, 108, 63, 1, 11000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702141001757.png', 100),
(899, '7702141001740', 'RELLENO MORA  RICH S', 'Disfruta el delicioso sabor a mora. Desde adentro hacia afuera nuestros rellenos de fruta son perfectos para realzar aun más el dulce sabor de tus creaciones', '*Práctico empaque en manga que te permite una fácil manipulación y aplicación *Tiene un delicioso sabor y aroma a mora *Ideal para utilizarse en productos de pastelería, panadería, heladería y bebidas *Se puede mezclar con cremas ligeras para utilizar como cobertura o rellenos en tortas y postres', 11000, 'Und', 5, 'NORMAL', 34, 108, 63, 1, 10000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702141001740.png', 100),
(900, '7707324630922', 'AREQUIPE TETERO GRAN X K NUTRINAT ', '', '', 7500, 'Und', 5, 'NORMAL', 34, 108, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630922.png', 100),
(901, '7707324630175', 'AREQUIPE TETERO PEQ X 390  NUTRINAT', '', '', 5000, 'Und', 5, 'NORMAL', 34, 108, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707324630175.png', 100),
(902, '7898024395232', 'NUTELLA PEQUEÑA X 140 GR ', '', '', 11000, 'Und', 5, 'NORMAL', 34, 108, 52, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7898024395232.png', 100),
(903, '7702400001504', 'COCTEL DE FRUTAS X 820 G 3A', '', '', 7800, 'Und', 5, 'NORMAL', 34, 108, 47, 1, 7500, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702400001504.png', 100),
(904, 'GLIGRA', 'GLICERINA X 25 KGR A GRANEL ', 'Aporta humedad y elasticidad a fondant, caramelos y productos de repostería.', '', 10, 'Gr', 5, 'NORMAL', 34, 101, 64, 1, 8, 6000, 6.5, 25000, NULL, NULL, 'img/articulos/GLIGRA.png', 250),
(905, 'CERNI04', 'CERNIDO GUAYABA CAJA X 5 K  LEVAPAN ', '', '', 26000, 'Und', 5, 'NORMAL', 34, 108, 45, 1, 24000, 6, NULL, NULL, NULL, NULL, 'img/articulos/CERNI04.png', 100),
(906, '7702116001645', 'RELLENO FRUTOS ROJOS RICH S', 'Disfruta el delicioso sabor a frutos rojos: fresa, mora y cereza. Desde adentro hacia afuera nuestros rellenos de fruta son perfectos para realzar aun más el dulce sabor de tus creaciones', '*Práctico empaque en manga que te permite una fácil manipulación y aplicación.\n Tiene un delicioso sabor y aroma a la mezcla de frutos rojos: fresa, mora y cereza.\n Ideal para utilizarse en productos de pastelería, panadería, heladería y bebidas.\n Se puede mezclar con cremas ligeras para utilizar como cobertura o rellenos en tortas y postres', 11000, 'Und', 5, 'NORMAL', 34, 108, 63, 5, 10500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702116001645.png', 100),
(907, '7709990049244', 'GLASE DE CHOCOLATE X K', 'Con su textura suave y densa, podrás, además de rellenar, hacer decoraciones sobre galletas, tortas y postres.', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 61, 1, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990049244.png', 100),
(908, 'MIELPO', 'MIEL PURA ', '', '', 30000, 'Und', 5, 'NORMAL', 36, 107, 1, 5, 28000, 3, NULL, NULL, NULL, NULL, 'img/articulos/MIELPO.png', 100),
(909, '7751271018500', 'CONDENSADA GLORIA X 396 G', '', '', 6000, 'Und', 5, 'NORMAL', 34, 108, 65, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7751271018500.png', 100),
(910, 'PIPASPOLEN', 'PIPAS POLEN ', '', '', 1000, 'Und', 5, 'NORMAL', 36, 107, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/PIPASPOLEN.png', 100),
(911, '7702014023916', 'AREQUIPE X 5 K LEVAPAN ', '', '', 50000, 'Und', 5, 'NORMAL', 34, 108, 45, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702014023916.png', 100),
(912, '7709158957169', 'DURAZNOS EN ALMIBAR FRUTIVITA 820 FS', '', '', 5500, 'Und', 5, 'NORMAL', 34, 108, 66, 1, 5200, 24, NULL, NULL, NULL, NULL, 'img/articulos/7709158957169.png', 100),
(913, '7707362305561', 'DURAZNOS X 3000 GR FRUTIVITA FS', '', '', 21000, 'Und', 5, 'NORMAL', 34, 108, 66, 1, 20500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707362305561.png', 100),
(914, '7707282535888', 'AREQUIPE AMY X 5 K', '', '', 32000, 'Und', 5, 'NORMAL', 34, 108, 67, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707282535888.png', 100),
(915, '7702001082131', 'AREQUIPE ALPINA X 500 G ', '', '', 8500, 'Und', 5, 'NORMAL', 34, 108, 68, 1, 8000, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702001082131.png', 100),
(916, 'ALPI', 'AREQUIPE ALPINA X 5', '', '', 70000, 'Und', 5, 'NUEVO', 34, 119, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ALPI.png', 100),
(917, '343120', 'HERSHEY`S SYRUP X 680 GR', '', '', 19500, 'Und', 5, 'NUEVO', 34, 108, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/343120.png', 100),
(918, '7707175887131', 'GLUCOSA X 5K COLORISA ', 'Se usa en la elaboración de confites, fondant y productos de repostería. ', '', 42000, 'Und', 5, 'NORMAL', 34, 101, 64, 5, 41000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707175887131.png', 100),
(919, 'PIPASAJON', 'PIPAS DE AJONJOLI', '', '', 200, 'Und', 5, 'NORMAL', 36, 107, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/PIPASAJON.png', 100),
(920, 'PROP', 'PROPOLEO', '', '', 28000, 'Und', 5, 'NUEVO', 36, 107, 47, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/PROP.png', 100),
(921, 'CERE2', 'CEREZAS CON PALO X K 3A', '', '', 22000, 'Und', 5, 'NUEVO', 34, 108, 47, 5, 21000, 6, NULL, NULL, NULL, NULL, 'img/articulos/CERE2.png', 100),
(922, '7702400005007', 'CEREZA DOY PACK 450 GR 3A', '', '', 8200, 'Und', 5, 'NUEVO', 34, 108, 47, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702400005007.png', 100),
(923, '7702400004994', 'CEREZAS DOY PACK X 230 GR 3A', '', '', 4900, 'Und', 5, 'NUEVO', 34, 108, 47, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702400004994.png', 100),
(924, '7707221803283', 'ALMENDRA COLSABOR X 70ML ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803283.png', 100),
(925, '7707221804549', 'AMARETO COLSABOR  X 500', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804549.png', 100),
(926, '7707221803566', 'AMARETO COLSABOR X 70 ML', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803566.png', 100),
(927, 'ARE60', 'AREQUIPE PRODIA X60ML ESENCIA    ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 46, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ARE60.png', 100),
(928, '7707119720173', 'AREQUIPE PRODIA  X500ML ESENCIA                                      ', '', '', 9500, 'Und', 5, 'NORMAL', 34, 105, 46, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707119720173.png', 100);
INSERT INTO `articulos` (`id`, `codigo`, `nombre`, `descripcion`, `lista`, `precio`, `embalaje`, `clasificacion`, `categoria`, `idgrupo`, `idsubgrupo`, `idmarca`, `rank`, `dcto1`, `cant_dcto1`, `dcto2`, `cant_dcto2`, `dcto3`, `cant_dcto3`, `img`, `incremento`) VALUES
(929, '7707221803023', 'CANELA COLSABOR X 70 CC ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803023.png', 100),
(930, '7707221804181', 'CARAMELO COLSABOR  X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804181.png', 100),
(931, '7707221804266', 'CHICLE COLSABOR X500ML ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804266.png', 100),
(932, '7707221803245', 'CHICLE COLSABOR X 70 CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803245.png', 100),
(933, '77072218033', 'CREMA DE LECHE COLSABOR X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/77072218033.png', 100),
(934, '7707221804013', 'COCO COLSABOR  X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804013.png', 100),
(935, '7707221803030', 'COCO COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803030.png', 100),
(936, '07707221803603', 'CREMA CHANTILLY COLSABOR X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 1, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/07707221803603.png', 100),
(937, '7707221803061', 'CREMA DE WISKEY COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803061.png', 100),
(938, '7707221804297', 'CREMA DE WISKEY COLSABOR  X500 ESENCIA ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804297.png', 100),
(939, '7707221803047', 'FRESA COLSABOR X70CC ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803047.png', 100),
(940, '7707221803320', 'GUANABANA COLSABOR X70ML ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803320.png', 100),
(941, '035', 'HUMO COLSABOR  X500 ESENCIA ', '', '', 9000, 'Und', 5, 'NORMAL', 1, 1, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/035.png', 100),
(942, '7707221803405', 'HUMO COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803405.png', 100),
(943, '7707221803429', 'KIWI COLSABOR  X 70 CC ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803429.png', 100),
(944, '7707221803207', 'LECHE CONDENSADA COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803207.png', 100),
(945, '7707119720531', 'LECHE CONDENSADA PRODIA X500ML ESENCIA                          ', '', '', 9500, 'Und', 5, 'NORMAL', 34, 105, 46, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707119720531.png', 100),
(946, '7707221803252', 'MANTECADO COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803252.png', 100),
(947, '7707221803290', 'MANI COLSABOR X70ML ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803290.png', 100),
(948, '7707221804051', 'MANTEQUILLA COLSABOR X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804051.png', 100),
(949, '7707221803085', 'MANTEQUILLA COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803085.png', 100),
(950, '7707221803344', 'MARACUYA COLSABOR  X70CC ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803344.png', 100),
(951, '77072', 'MANZANA COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/77072.png', 100),
(952, '7707221803474', 'MENTA COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803474.png', 100),
(953, '7707221804303', 'NATAS COLSABOR  X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804303.png', 100),
(954, '7707221803306', 'NATAS COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803306.png', 100),
(955, '057', 'NUEZ MOSCADA COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 1, 1, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/057.png', 100),
(956, '7707221803115', 'PIÑA COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803115.png', 100),
(957, '7707221803528', 'PISTACHOS COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803528.png', 100),
(958, '7707221804204', 'PONQUE COLSABOR  X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804204.png', 100),
(959, '7707221803122', 'PONQUE COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803122.png', 100),
(960, '7707221803221', 'RON COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803221.png', 100),
(961, '7707221804327', 'TIRAMISU COLSABOR  X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804327.png', 100),
(962, '7707221803412', 'TIRAMISU COLSABOR  X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803412.png', 100),
(963, '7707221804105', 'VAINILLA BLANCA COLSABOR  X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804105.png', 100),
(964, '7707221805027', 'VAINILLA BLANCA COLSABOR 4000 ESENCIA', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221805027.png', 100),
(965, '7707119720029', 'VAINILLA BLANCA PRODIA X500ML ESENCIA                           ', '', '', 9500, 'Und', 5, 'NORMAL', 34, 105, 46, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707119720029.png', 100),
(966, '7707221803146', 'VAINILLA BLANCA COLSABOR X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803146.png', 100),
(967, '7707221804112', 'VAINILLA NEGRA COLSABOR  X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804112.png', 100),
(968, '7705122002293', 'REGIO AREQUIPE X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002293.png', 100),
(969, '7705122002286', 'REGIO CHICLE  X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002286.png', 100),
(970, '7705122002026', 'REGIO COCO X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002026.png', 100),
(971, '7705122002040', 'REGIO FRESA X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002040.png', 100),
(972, '7705122002057', 'REGIO KOLA X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002057.png', 100),
(973, '7705122002064', 'REGIO LIMON X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002064.png', 100),
(974, '7705122002071', 'REGIO MANTECADO  X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002071.png', 100),
(975, '7705122002101', 'REGIO PIÑA X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002101.png', 100),
(976, '7705122002279', 'REGIO RON CON PASAS  X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002279.png', 100),
(977, '7705122002118', 'REGIO SALPICON X 500 CC                                             ', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002118.png', 100),
(978, '7707221804143', 'AREQUIPE COLSABOR X500ML ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804143.png', 100),
(979, '7707221804150', 'BANANO COLSABOR X500ML ESENCIA  ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804150.png', 100),
(980, '7707221803078', 'LIMON COLSABOR 70 CC ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803078.png', 100),
(981, '7707221803153', 'VAINILLA NEGRA COLSABOR 70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803153.png', 100),
(982, '7707221803337', 'MELOCOTON COLSABOR X 70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803337.png', 100),
(983, '7707221803177', 'MANZANA VERDE COLSABOR X70 ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803177.png', 100),
(984, '7707221804228', 'MELOCOTON COLSABOR X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804228.png', 100),
(985, '7707221804198', 'MANTECADO COLSABOR X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804198.png', 100),
(986, '7707221804044', 'KOLA ROJA COLSABOR X500 ESENCIA ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804044.png', 100),
(987, '7707221804037', 'FRESA COLSABOR X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804037.png', 100),
(988, '7707221804075', 'QUESO COLSABOR X500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804075.png', 100),
(989, '7707221804136', 'HINOJO COLSABOR X 500 ESENCIA ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804136.png', 100),
(990, '7707221803054', 'HINOJO COLSABOR X 70CC ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803054.png', 100),
(991, '7707221803368', 'CARAMELO COLSABOR X70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803368.png', 100),
(992, '7707221804488', 'MARACUYA COLSABOR X 500 CC ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804488.png', 100),
(993, '7707221804068', 'NARANJA COLSABOR 500CC ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804068.png', 100),
(994, '77072218', 'BRANDY COLSABOR 70CC ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/77072218.png', 100),
(995, '7707221803160', 'VINO COLSABOR X 70 ML ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803160.png', 100),
(996, 'AREE002', 'AREQUIPE  PRODIA  X 3800', '', '', 69000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/AREE002.png', 100),
(997, '7707221803399', 'KOLA ROJA COLSABOR X 70 ML  ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803399.png', 100),
(998, '7707221803139', 'QUESO COLSABOR X 70 ESENCIAS', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803139.png', 100),
(999, '7707221803108', 'NARANJA COLSABOR X 70 ML ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803108.png', 100),
(1000, '7705122002132', 'REGIO VAINILLA X 500 CC', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002132.png', 100),
(1001, '7705122002125', 'REGIO UVA X 500 CC', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002125.png', 100),
(1002, '7705122002088', 'REGIO MORA X 500 CC', '', '', 2500, 'Und', 5, 'NORMAL', 34, 105, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7705122002088.png', 100),
(1003, '7707221805010', 'MANTEQUILLA COLSABOR  4000 ESENCIA', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221805010.png', 100),
(1004, '7707221805362', 'MANTECADO COLSABOR X 4000 ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221805362.png', 100),
(1005, 'NARANJACOLSABOR', 'NARANJA COLSABOR X 4000 ESENCIA', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/NARANJACOLSABOR.png', 100),
(1006, '7707119720012', 'VAINILLA NEGRA PRODIA X 500 ML ESENCIA', '', '', 9500, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707119720012.png', 100),
(1007, '7707221803016', 'BANANO COLSABOR X 70 CM ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803016.png', 100),
(1008, '7707221804334', 'RON COLSABOR X 500 ML ESENCIAS ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804334.png', 100),
(1009, '7702014012019', 'VAINILLA NEGRA LEVAPAN X 500ML ESENCIAS', '', '', 13500, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702014012019.png', 100),
(1010, 'VAINILLANEGRA', 'VAINILLA NEGRA COLSABOR 4000 ML', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/VAINILLANEGRA.png', 100),
(1011, '7707221804129', 'VINO COLSABOR X 500 ML ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804129.png', 100),
(1012, '7707221805072', 'HUMO COLSABOL X 4000', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221805072.png', 100),
(1013, '7707221805065', 'HINOJO COLSABOR X 4000 ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221805065.png', 100),
(1014, 'MANZANA', 'MANZANA VERDE COLSABOR X 500 CC', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MANZANA.png', 100),
(1015, 'CARAMELO20L', 'CARAMELO 20 L COLSABOR', '', '', 195000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CARAMELO20L.png', 100),
(1016, 'MENTA', 'MENTA DE COLSABOR X 4000', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MENTA.png', 100),
(1157, '7704200547701', 'VINAGRE BALSAMICO X 250', '', '', 10000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7704200547701.png', 100),
(1158, 'TIRAMISU', 'TIRAMISU COLSABOR X 4000', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/TIRAMISU.png', 100),
(1159, '7707221804273', 'PIÑA COLSABOR X 500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804273.png', 100),
(1160, '7707221804426', 'CREMA CHANTILLY COLSABOR X 500 ML ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804426.png', 100),
(1161, '7707221805201', 'NATAS COLSABOR X 4000', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221805201.png', 100),
(1162, '7707221804365', 'MENTA COLSABOR X 500', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804365.png', 100),
(1163, 'CAFE', 'CAFE COLSABOR X 70 CC ESENCIAS ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAFE.png', 100),
(1164, '7707221804242', 'CAFE COLSABOR X 500 ESENCIAS ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804242.png', 100),
(1165, '7707221803269', 'MIEL COLSABOR X 70 CC ESENCIAS', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803269.png', 100),
(1166, '7707221804396', 'ALMENDRA COLSABOR X 500 ESENCIAS ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804396.png', 100),
(1167, '7707221803238', 'CHOCOLATE COLSABOR X 70 CC', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803238.png', 100),
(1168, '7707221803375', 'CEREZA COLSABOR 70 CC ESENCIAS', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803375.png', 100),
(1169, 'CHOCOLATEX4000', 'CHOCOLATE COLSABOR X 4000 ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CHOCOLATEX4000.png', 100),
(1170, 'HINOJO', 'HINOJO COLSABOR X 20 L ESENCIA', '', '', 300000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/HINOJO.png', 100),
(1171, 'BANANO', 'BANANO COLSABOR X 4000 ESENCIA ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BANANO.png', 100),
(1172, 'MIEL500', 'MIEL COLSABOR X 500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MIEL500.png', 100),
(1173, '7707221804501', 'CEREZA COLSABOR X 500 ML ESENCIAS', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804501.png', 100),
(1174, '7707221804419', 'LIMON COLSABOR X 500 ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804419.png', 100),
(1175, 'FRESACOLSABOR', 'FRESA COLSABOR X 4000 ML ESENCIA ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/FRESACOLSABOR.png', 100),
(1176, 'LIMONCOLSABOR4', 'LIMON COLSABOR X 4000 ML ESENCIA ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/LIMONCOLSABOR4.png', 100),
(1177, 'ALMENDRACOLSABOR4', 'ALMENDRA COLSABOR X 4000 ESENCIA ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ALMENDRACOLSABOR4.png', 100),
(1178, '7707221804167', 'CANELA COLSABOR X 500 ESENCIAS ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804167.png', 100),
(1179, '7707221804020', 'CHOCOLATE COLSABOR X 500 ML ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804020.png', 100),
(1180, '7707221804174', 'LECHE CONDENSADA COLSABOR X 500 ML ESENCIA ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804174.png', 100),
(1181, 'NUEZMOSCADA500', 'NUEZ MOSCADA COLSABOR X 500 ML ESENCIA ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/NUEZMOSCADA500.png', 100),
(1182, '7707226041741', 'GRANADINA', '', '', 20000, 'Und', 5, 'NORMAL', 34, 105, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707226041741.png', 100),
(1183, '7707226036617', 'CREMA DE WISKEY', '', '', 30000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707226036617.png', 100),
(1184, 'VAINILLIN', 'VAINILLIN', '', '', 120, 'Gr', 5, 'NUEVO', 34, 105, 57, 1, 110, 1000, NULL, NULL, NULL, NULL, 'img/articulos/VAINILLIN.png', 100),
(1185, '7707221804495', 'MORA COLSABOR X 500 ML ESENCIA ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804495.png', 100),
(1186, '7707221803092', 'MORA COLSABOR X 70 ML ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803092.png', 100),
(1187, '7707221803313', 'UVA COLSABOR X 70 ML ESENCIAS', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803313.png', 100),
(1188, '7707221804099', 'UVA COLSABOR X 500 ML ESENCIAS ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804099.png', 100),
(1189, '7707221804358', 'MANI COLSABOR X 500 ML ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804358.png', 100),
(1190, '7707221804525', 'GUANABANA COLSABOR X 500 ML ESENCIA ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804525.png', 100),
(1191, '7707221803658', 'AVELLANA COLSABOR X 70 ML ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803658.png', 100),
(1192, 'AVELLANA1', 'AVELLANA COLSABOR X500 ML ESENCIA ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/AVELLANA1.png', 100),
(1193, 'COCO', 'COCO COLSABOR X 4000 ESENCIA', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/COCO.png', 100),
(1194, 'RON4000', 'RON COLSABOR X 4000 ESENCIA', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/RON4000.png', 100),
(1195, 'BRANDY', 'BRANDY COLSABOR X 4000 CC', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BRANDY.png', 100),
(1196, 'CREMADELECHE', 'CREMA DE LECHE COLSABOR X 4000 CC', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CREMADELECHE.png', 100),
(1197, 'VAINILLA20L', 'VAINILLA NEGRA COLSABOR 20 L ', '', '', 250000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/VAINILLA20L.png', 100),
(1198, 'BRANDY500', 'BRANDY COLSABOR X 500 ML', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BRANDY500.png', 100),
(1199, 'CREMA500', 'CREMA DE LECHE COLSABOR X 500 ML ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CREMA500.png', 100),
(1200, '7707221804617', 'SANDIA COLSABOR X 500 ML ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804617.png', 100),
(1201, '7707221803184', 'RON CON PASAS COLSABOR X 70 ML ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221803184.png', 100),
(1202, '7707221804082', 'RON CON PASAS COLSABOR X 500 ML ESENCIA', '', '', 9000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221804082.png', 100),
(1203, 'SANDIA70', 'SANDIA COLSABOR X 70 ML ESENCIA', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/SANDIA70.png', 100),
(1204, 'CHICLE', 'CHICLE COLSABOR X 4000 ESENCIA', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CHICLE.png', 100),
(1205, 'MIEL4000', 'MIEL COLSABOR X 4000 ESENCIA', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MIEL4000.png', 100),
(1206, 'GUANABANA', 'GUANABANA COLSABOR X 4000 ESENCIA', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GUANABANA.png', 100),
(1207, 'RON20L', 'RON COLSABOR X 20L ESENCIAS ', '', '', 250000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/RON20L.png', 100),
(1337, 'MANDARINA', 'MANDARINA COLSABOR X 70 CC ESENCIA ', '', '', 3000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MANDARINA.png', 100),
(1338, 'MARACUYA', 'MARACUYA COLSABOR X 4000 ML ESENCIAS ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MARACUYA.png', 100),
(1339, 'LECHE4000', 'LECHE CONDENSADA COLSABOR 4000 ML', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/LECHE4000.png', 100),
(1340, 'CANELA4', 'CANELA COLSABOR X 4000 ESENCIA ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CANELA4.png', 100),
(1341, 'MANTEQUILLA', 'MANTEQUILLA PRODIA X 500', '', '', 9500, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MANTEQUILLA.png', 100),
(1342, '7707221805164', 'CREMA DE WISKY COLSABOR X 4000 ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221805164.png', 100),
(1347, '7707221805478', 'AMARETO COLSABOR X 4000 ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221805478.png', 100),
(1348, '7707221805669', 'CREMA CHANTILLY COLSABOL X 4000 ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707221805669.png', 100),
(1349, 'QUES4000', 'QUESO COLSABOR X 4000 ', '', '', 60000, 'Und', 5, 'NORMAL', 34, 105, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/QUES4000.png', 100),
(1350, 'GSS03', 'GELATINA SIN SABOR A GRANEL', 'Perfecta para postres a base de gelatina. Su bloom de 250 permite acabados profesionales. Solo debes agregar colorante o saborizante para darle tu toque.', '', 32, 'Gr', 5, 'NUEVO', 34, 101, 70, 5, 31, 25, NULL, NULL, NULL, NULL, 'img/articulos/GSS03.png', 250),
(1351, 'GELATINA', 'GELATINA DE COLORES', 'GELATINA INDUSTRIAL CON VARIEDAD EN SABORES NARANJA CEREZA PIÑA FRESA FRAMBUESA MORA LIMON MORA AZUL UVA ', '', 12, 'Gr', 5, 'NUEVO', 34, 101, 70, 5, 11, 5, NULL, NULL, NULL, NULL, 'img/articulos/GELATINA.png', 250),
(1352, 'AFRE01', 'AFRECHO O SALVADO X 40 K ', '', '', 2.2, 'Gr', 5, 'NORMAL', 34, 113, 1, 1, 1.1, 40000, NULL, NULL, NULL, NULL, 'img/articulos/AFRE01.png', 500),
(1353, 'ALMAGR02', 'AGRIO ALMIDON X K BULTO', '', '', 5.5, 'Gr', 5, 'NORMAL', 34, 113, 71, 5, 4.64, 12500, NULL, NULL, NULL, NULL, 'img/articulos/ALMAGR02.png', 500),
(1354, 'ALMEXP03', 'EXPANDES ALMIDON MODIFICADO X K BULTO', '', '', 6.5, 'Gr', 5, 'NORMAL', 34, 113, 72, 5, 5.6, 25000, NULL, NULL, NULL, NULL, 'img/articulos/ALMEXP03.png', 500),
(1355, '7707197044208', 'ALMOJABANA   COLMAIZ X    K ', '', '', 6000, 'Und', 5, 'NUEVO', 34, 113, 72, 5, 5500, 25, NULL, NULL, NULL, NULL, 'img/articulos/7707197044208.png', 100),
(1356, 'ALMYUC04', 'ALMIYUCA  IMPORTADO PROYUCAL  X   K BULTO', '', '', 5.5, 'Gr', 5, 'NORMAL', 34, 113, 72, 5, 4.2, 25000, NULL, NULL, NULL, NULL, 'img/articulos/ALMYUC04.png', 100),
(1357, 'AVEHOJ08', 'AVENA ENTERA HOJUELAS PRECOCIDA X 25 K  BULTO', '', '', 6, 'Gr', 5, 'NORMAL', 34, 113, 1, 1, 4.8, 25000, NULL, NULL, NULL, NULL, 'img/articulos/AVEHOJ08.png', 500),
(1358, '7707197043041', 'COLMAIZ  BUÑUELO X K   BULTO', '', '', 4500, 'Und', 5, 'NUEVO', 34, 113, 72, 5, 4300, 25, NULL, NULL, NULL, NULL, 'img/articulos/7707197043041.png', 100),
(1359, 'COPAN13', 'NIEVE X50K HARINA', '', '', 2, 'Gr', 5, 'NORMAL', 34, 113, 73, 1, 1.72, 50000, NULL, NULL, NULL, NULL, 'img/articulos/COPAN13.png', 500),
(1360, 'ELITE14', 'ELITE HARINA  XK', '', '', 3, 'Gr', 5, 'NORMAL', 34, 113, 1, 5, 2.8, 25000, NULL, NULL, NULL, NULL, 'img/articulos/ELITE14.png', 500),
(1361, 'FECU15', 'FECULA  CORRUMEZ   X  25K BULTO', '', '', 4, 'Gr', 5, 'NORMAL', 34, 113, 72, 5, 3, 25000, NULL, NULL, NULL, NULL, 'img/articulos/FECU15.png', 500),
(1362, 'INTE17', 'HARINA INTEGRAL XK', '', '', 5, 'Gr', 5, 'NUEVO', 34, 113, 1, 5, 4.8, 10000, NULL, NULL, NULL, NULL, 'img/articulos/INTE17.png', 500),
(1363, '7707296350217', 'NATILLA AREQUIPE X K         ', '', '', 6000, 'Und', 5, 'NUEVO', 34, 113, 71, 5, 5500, 12, NULL, NULL, NULL, NULL, 'img/articulos/7707296350217.png', 100),
(1364, '7707296350156', 'NATILLA  DE COCO X K       ', '', '', 6000, 'Und', 5, 'NUEVO', 34, 113, 71, 5, 5500, 12, NULL, NULL, NULL, NULL, 'img/articulos/7707296350156.png', 100),
(1365, '7707296350101', 'NATILLA TRADICIONAL  X K            ', '', '', 6000, 'Und', 5, 'NUEVO', 34, 113, 71, 5, 5500, 12, NULL, NULL, NULL, NULL, 'img/articulos/7707296350101.png', 100),
(1366, '7707197046226', 'PAN DE BONO X   K BULTO', '', '', 6500, 'Und', 5, 'NUEVO', 34, 113, 72, 5, 5700, 25, NULL, NULL, NULL, NULL, 'img/articulos/7707197046226.png', 100),
(1367, 'PASPAN24', 'PASPAN PAN X 50K', '', '', 2, 'Gr', 5, 'NORMAL', 34, 113, 74, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/PASPAN24.png', 100),
(1368, 'PASPAN25', 'PASPAN PANADERA  X25   ', '', '', 2, 'Gr', 5, 'NORMAL', 34, 113, 74, 1, 2, 25000, NULL, NULL, NULL, NULL, 'img/articulos/PASPAN25.png', 500),
(1369, 'PASPANP26', 'PASPAN PASTELERA HARINA  X25   ', '', '', 2, 'Gr', 5, 'NORMAL', 34, 113, 74, 1, 1.95, 25000, NULL, NULL, NULL, NULL, 'img/articulos/PASPANP26.png', 500),
(1370, '7702007056730', 'PREMEZCLA VAINILLA  VETEADA CORONA  ', '', '', 7500, 'Und', 5, 'NORMAL', 34, 113, 75, 5, 7000, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702007056730.png', 100),
(1371, '7707197613404', 'ROBINSON ROSADA LEUDANTE X 25K', '', '', 65000, 'Und', 5, 'NORMAL', 34, 113, 76, 5, 62000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7707197613404.png', 100),
(1372, 'TRESCASTILLOS', 'HARINA TRES CASTILLOS X 50K', '', '', 105000, 'Und', 5, 'NORMAL', 34, 113, 77, 1, 103000, 3, NULL, NULL, NULL, NULL, 'img/articulos/TRESCASTILLOS.png', 100),
(1373, '7702141003430', 'PREMEZCLA CHOCOLATE RICHS CB', 'El ingrediente perfecto para estandarizar tus fórmulas, minimizar tu esfuerzo y deleitar a tus clientes. Prepara tortas, muffins, planchas, cupcakes y sorprendete con el delicioso sabor a chocolate intenso', '*Simplifica el trabajo y elimina errores de formulación *Estandariza y logra productos con el mismo sabor y la misma calidad siempre *Aumenta la vida útil de tus productos al mantener su frescura y suavidad por más tiempo *Aporta buen desarrollo de volumen, excelente suavidad y textura', 16, 'Gr', 5, 'NUEVO', 34, 113, 63, 5, 14, 6000, NULL, NULL, NULL, NULL, 'img/articulos/7702141003430.png', 250),
(1374, '7702014525182', 'FLAN ', 'Postre obtenido por la mezcla de azúcar, sal, sabores y colores artificiales certificados para alimentos. Presenta color y sabor característico. Usalo para postre o ingrediente en la preparación de recetas de bizcochería y pastelería.', '', 12800, 'Und', 5, 'NUEVO', 34, 113, 45, 5, 12500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702014525182.png', 100),
(1375, '7702014515084', 'PUDIN', '', '', 12800, 'Und', 5, 'NUEVO', 34, 113, 45, 5, 12500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702014515084.png', 100),
(1376, '7702007056747', 'PREMEZCLA BROWNIE CORORA X 350 G ', '', '', 5800, 'Und', 5, 'NORMAL', 34, 113, 75, 5, 5500, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702007056747.png', 100),
(1377, '7702007056723', 'PREMEZCLA CHOCOLATE CORONA X 450 G ', '', '', 7500, 'Und', 5, 'NORMAL', 34, 113, 75, 5, 7200, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702007056723.png', 100),
(1378, 'PREVA', 'PREMEZCLA VAINILLA RICHS ', 'El ingrediente perfecto para estandarizar tus fórmulas, minimizar tu esfuerzo y deleitar a tus clientes. Prepara tortas, muffins, planchas, cupcakes y sorprendete con el delicioso sabor a vainilla', '*Simplifica el trabajo y elimina errores de formulación *Estandariza y logra productos con el mismo sabor y la misma calidad siempre *Aumenta la vida útil de tus productos al mantener su frescura y suavidad por más tiempo *Aporta buen desarrollo de volumen, excelente suavidad y textura', 14, 'Gr', 5, 'NUEVO', 34, 113, 63, 5, 13, 6000, NULL, NULL, NULL, NULL, 'img/articulos/PREVA.png', 250),
(1379, 'PRESPON', 'PREMEZCLA SPONGE RICHS', 'El ingrediente perfecto para estandarizar tus fórmulas, minimizar tu esfuerzo y deleitar a tus clientes. Es la premezcla perfecta para preparar esponjas o bizcochuelos y remojar con cualquier tipo de jarabe', '*Simplifica el trabajo y elimina errores de formulación *Estandariza y logra productos con el mismo sabor y la misma calidad siempre *Aumenta la vida útil de tus productos al mantener su frescura y suavidad por más tiempo *Aporta buen desarrollo de volumen, excelente suavidad y textura', 14, 'Gr', 5, 'NUEVO', 34, 113, 63, 5, 13, 6000, NULL, NULL, NULL, NULL, 'img/articulos/PRESPON.png', 250),
(1380, 'FLAM04', 'FLAMELA X15 HIDROGENADO SIGRA  ', 'Frituras de todo tipo, panes tipo industrial, heladería y confitería.', '', 6, 'Gr', 5, 'NORMAL', 34, 114, 78, 5, 5.4, 15000, NULL, NULL, NULL, NULL, 'img/articulos/FLAM04.png', 500),
(1381, '7707170120431', 'RENDIDORA X15K HIDROGENADO ', 'Frituras de todo tipo, panes tipo industrial, heladería y confitería.', '', 6, 'Gr', 5, 'NORMAL', 34, 114, 78, 5, 5.4, 15000, NULL, NULL, NULL, NULL, 'img/articulos/7707170120431.png', 500),
(1382, 'PALMARES', 'PALMARES HIDROGENADO X 15 K', 'Frituras de todo tipo, panes tipo industrial, heladería y confitería.', '', 6, 'Gr', 5, 'NORMAL', 34, 114, 78, 5, 5, 15000, NULL, NULL, NULL, NULL, 'img/articulos/PALMARES.png', 500),
(1383, '7704841611090', 'CREMA DE LECHE FRESKALECHE X 200 ', '', '', 3200, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 3100, 12, NULL, NULL, NULL, NULL, 'img/articulos/7704841611090.png', 100),
(1384, '7702177009123', 'CREMA DE LECHE ALQUERIA X 900 ', '', '', 11500, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 11000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702177009123.png', 100),
(1385, '7702001072033', 'CREMA DE LECHE ALPINA X 200 CC BOLSA X 4', 'La Crema de Leche Alpina se elabora a partir de la grasa de la leche, que es higienizada y estandarizada para obtener un producto inocuo y de suave consistencia.', '', 3500, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 3200, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702001072033.png', 100),
(1386, '7702001072064', 'CREMA DE LECHE ALPINA X 1100', 'La Crema de Leche Alpina se elabora a partir de la grasa de la leche, que es higienizada y estandarizada para obtener un producto inocuo y de suave consistencia.', '', 12500, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 12000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702001072064.png', 100),
(1387, '7702177003572', 'CREMA DE LECHE ALQUERIA  X 200 ', '', '', 3200, 'Und', 5, 'NORMAL', 34, 115, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702177003572.png', 100),
(1388, '7702177001783', 'LECHE LIQUIDA ALQUERIA  X 1100', '', '', 3200, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 3000, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702177001783.png', 100),
(1389, '7751271015721', 'LECHE  EVAPORADA  GLORIA', '', '', 9500, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 9000, 12, NULL, NULL, NULL, NULL, 'img/articulos/7751271015721.png', 100),
(1390, 'LECPOL09', 'LECHE EN POLVO X K', '', '', 15, 'Gr', 5, 'NORMAL', 34, 115, 1, 1, 14, 25000, NULL, NULL, NULL, NULL, 'img/articulos/LECPOL09.png', 500),
(1391, '7702001011308', 'QUESO CREMA  ALPINA X 200 GR', '', '', 4200, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 4000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702001011308.png', 100),
(1392, '7702001011315', 'QUESO CREMA ALPINA  X 380 GR', 'El Queso Crema Alpina es un queso fresco, blando, rico en grasa. Es elaborado principalmente con leche semidescremada.', '', 6800, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 6500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702001011315.png', 100),
(1393, '7702129025201', 'QUESO CREMA  COLANTA X 230 GR', 'El Queso Crema Alpina es un queso fresco, blando, rico en grasa. Es elaborado principalmente con leche semidescremada.', '', 4200, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 4000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702129025201.png', 100),
(1394, '7702129025157', 'QUESO CREMA COLANTA  X 400 GR', '', '', 6800, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 6500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702129025157.png', 100),
(1395, '7702001055074', 'YOGOURT GRIEGO NATURAL X 150 GR ALPINA', 'El Yogurt Griego Alpina es un yogurt descremado, 0% grasa y buena fuente de proteína ya que contiene el doble de proteína, comparado con el Yogurt Original de Alpina.', '', 3800, 'Und', 5, 'NORMAL', 34, 115, 1, 5, 3600, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702001055074.png', 100),
(1396, '7700604004918', 'CREMA DE LECHE PARMALAT X 1 L', '', '', 12500, 'Und', 5, 'NUEVO', 34, 115, 1, 5, 12000, 6, 11500, 12, NULL, NULL, 'img/articulos/7700604004918.png', 100),
(1397, '041224860025', 'LECHE DE COCO ', '', '', 11000, 'Und', 5, 'NORMAL', 1, 1, 1, 5, 10500, 6, NULL, NULL, NULL, NULL, 'img/articulos/041224860025.png', 100),
(1398, '7702129035446', 'CREMA DE LECHE COLANTA X 900 ML ', '', '', 10200, 'Und', 5, 'NORMAL', 34, 115, 1, 1, 10000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702129035446.png', 100),
(1399, 'QUESOFIL', 'QUESO TIPO FILADELFIA  1.360', '', '', 55000, 'Und', 5, 'NUEVO', 34, 115, 1, 5, 52000, 3, NULL, NULL, NULL, NULL, 'img/articulos/QUESOFIL.png', 100),
(1400, '041224712409', 'CREMA DE COCO X 425GR', '', '', 15000, 'Und', 5, 'NORMAL', 1, 1, 1, 5, 14000, 6, NULL, NULL, NULL, NULL, 'img/articulos/041224712409.png', 100),
(1401, '7702129025058', 'QUESO CREMA X 5 K COLANTA', '', '', 62000, 'Und', 5, 'NUEVO', 34, 115, 1, 5, 60000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7702129025058.png', 100),
(1402, '7501668611889', 'CREMA DE LECHE VERSATIE', 'Versatié es una crema culinaria de sabor neutro y de excelente cremosidad. Es el ingrediente principal para preparar las más deliciosas salsas, cremas y dips en tan sólo minutos. Es ideal para los profesionales de la gastronomía que requieren versatilidad en sus creaciones', '*Versatié® se puede hervir, hornear, mezclar con otros ingredientes, calentar a baño maría, mantener a fuego directo o utilizar directamente del envase *Puede combinarse sin cortarse con limón, vinagre y cualquier ingrediente ácido o de alto contenido graso *Es tolerante a altas temperaturas por largos periodos y puede ser recalentado sin cortarse *No tiene un sabor lácteo dominante por lo que es ideal para resaltar el sabor de los ingredientes de tus preparaciones *Facilita tu operación por su alto rendimiento y estabilidad, no se separa ni se corta', 11500, 'Und', 5, 'NUEVO', 34, 115, 1, 5, 11000, 6, 10500, 12, NULL, NULL, 'img/articulos/7501668611889.png', 100),
(1403, '7707212302511', 'LECHE CONDENSADA SANTILLANA ', '', '', 6000, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 5300, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707212302511.png', 100),
(1404, '6917790979642', 'GLORIPAN LEVADURA X 500 X 20 L        ', 'Gloripan están diseñadas para elaborar una amplia variedad de panes y\nproductos fermentados en general, obteniéndose un excelente volumen final de las piezas elaboradas. Fácil de utilizar, se adiciona directamente a la harina (no requiere un proceso de prehidratación). Su larga vida útil (24 meses, envase cerrado) facilitan su manejo en el almacén y no requieren espacio de frío para suconservación.', '', 7500, 'Und', 5, 'NORMAL', 34, 116, 1, 5, 6900, 20, 6800, 80, NULL, NULL, 'img/articulos/6917790979642.png', 100),
(1405, '7702014000221', 'LEVADURA SECA X  500GR LEVAPAN', 'Producto natural de vida prolongada, que se obtiene a partir de Levadura Fresca LEVAPAN® y se utiliza para la fermentación de masas en panaderías o pastelerías. En la industria licorera, es ideal para la fabricación de vinos.', '', 11500, 'Und', 5, 'NORMAL', 34, 116, 1, 1, 10500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702014000221.png', 100),
(1406, '7702014000115', 'LEVADURA FRESCA LEVAPAN X 500', '', '', 5200, 'Und', 5, 'NORMAL', 34, 116, 1, 1, 5000, 50, NULL, NULL, NULL, NULL, 'img/articulos/7702014000115.png', 100),
(1407, '6917790981492', 'FABAO LEVADURA X 500 X 20 L ', '', '', 7000, 'Und', 5, 'NORMAL', 34, 116, 1, 1, 6700, 20, NULL, NULL, NULL, NULL, 'img/articulos/6917790981492.png', 100),
(1408, '7702014000238', 'LEVADURA ACTIVA SECA X 175 G LEVAPAN ', 'Producto natural de vida prolongada, que se obtiene a partir de Levadura Fresca LEVAPAN® y se utiliza para la fermentación de masas en panaderías o pastelerías. En la industria licorera, es ideal para la fabricación de vinos.', '', 7000, 'Und', 5, 'NORMAL', 34, 116, 1, 1, 6800, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702014000238.png', 100),
(1409, '7702001020171', 'ALPINA X 500 MANTEQUILLA', 'La Mantequilla en barra Alpina es un producto lácteo elaborado principalmente a base de crema de leche pasteurizada.', '', 16000, 'Und', 5, 'NORMAL', 34, 117, 1, 5, 15000, 6, 14000, 12, NULL, NULL, 'img/articulos/7702001020171.png', 100),
(1410, '7702001020096', 'ALPINA X 125 MANTEQUILLA', 'La Mantequilla en barra Alpina es un producto lácteo elaborado principalmente a base de crema de leche pasteurizada.', '', 5000, 'Und', 5, 'NORMAL', 34, 117, 1, 5, 4800, 6, 4600, 12, NULL, NULL, 'img/articulos/7702001020096.png', 100),
(1411, 'COLANT04', 'COLANTA X   250 GR', '', '', 6800, 'Und', 5, 'NORMAL', 34, 117, 1, 5, 6500, 6, NULL, NULL, NULL, NULL, 'img/articulos/COLANT04.png', 100),
(1412, '17702109000782', 'ALIPAN MARGARINA X15K ACE      ', '', '', 5.5, 'Gr', 5, 'NORMAL', 34, 114, 1, 1, 4933, 15000, NULL, NULL, NULL, NULL, 'img/articulos/17702109000782.png', 500),
(1413, '7707240300381', 'ASTRA MARGARINA X15K SIGRA            ', 'Margarina para alta pastelería y alta panadería Productos de la más alta calidad. Insuperable sabor lácteo y aroma que perdura en el producto final. Productos más suaves, con miga más fina y uniforme. Tortas con excelente volumen y baja conicidad.', '', 7.5, 'Gr', 5, 'NORMAL', 34, 114, 1, 5, 7, 15000, NULL, NULL, NULL, NULL, 'img/articulos/7707240300381.png', 500),
(1414, '17702109000812', 'DAGUSTO REPOSTERIA MARGARINA X15K ACE', '', '', 7.5, 'Gr', 5, 'NORMAL', 34, 114, 1, 5, 7.2, 15000, NULL, NULL, NULL, NULL, 'img/articulos/17702109000812.png', 500),
(1415, '7702161002000', 'FINA X  250 GR X 40 MARGARINA                  ', '', '', 3800, 'Und', 5, 'NORMAL', 34, 114, 1, 5, 3500, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702161002000.png', 100),
(1416, '7702161003007', 'FINA X 500 GR X 20 MARGARINA', '', '', 6800, 'Und', 5, 'NORMAL', 34, 114, 1, 5, 6500, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702161003007.png', 100),
(1417, '7702109000457', 'HOJALDRINA VERDE  X 30 L   ACE  MARGARINA               ', '', '', 3500, 'Und', 5, 'NORMAL', 34, 114, 1, 5, 3300, 30, NULL, NULL, NULL, NULL, 'img/articulos/7702109000457.png', 100),
(1418, '7707170120233', 'TUPAN MARGARINA  X15K   ', '', '', 4.5, 'Gr', 5, 'NORMAL', 34, 114, 1, 5, 3.3, 15000, NULL, NULL, NULL, NULL, 'img/articulos/7707170120233.png', 500),
(1419, '7707240300572', 'VITINA X 6 X 2,5 K SIGRA MARGARINA      ', 'Margarina para productos hojaldrados Delicioso aroma y sabor a mantequilla. Insuperable volumen en el hojaldre. Su envoltura mantiene intactas las características físico-químicas de la margarina por más tiempo.', '', 7.5, 'Gr', 5, 'NORMAL', 34, 114, 1, 5, 7, 2500, 6.8, 15000, NULL, NULL, 'img/articulos/7707240300572.png', 500),
(1420, 'RICUMAR', 'RICURA MARGARINA X 15K', '', '', 5.5, 'Gr', 5, 'NORMAL', 34, 114, 1, 5, 4933, 15000, NULL, NULL, NULL, NULL, 'img/articulos/RICUMAR.png', 500),
(1421, 'MEGA', 'MEGACAMPO MARGARINA', '', '', 4, 'Gr', 5, 'NORMAL', 34, 114, 1, 1, 3.2, 15000, NULL, NULL, NULL, NULL, 'img/articulos/MEGA.png', 500),
(1422, 'SUPAN', 'SUPAN MARGARINA X 15 K', '', '', 5.5, 'Gr', 5, 'NORMAL', 34, 114, 1, 1, 5, 15000, NULL, NULL, NULL, NULL, 'img/articulos/SUPAN.png', 500),
(1423, 'HOJ', 'HOJALDRE GOURMET X 30L', '', '', 3200, 'Und', 5, 'NORMAL', 34, 114, 1, 1, 3000, 30, NULL, NULL, NULL, NULL, 'img/articulos/HOJ.png', 100),
(1424, 'ACID', 'ACIDO CITRICO X 25', '', '', 8, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, 4, 25000, NULL, NULL, NULL, NULL, 'img/articulos/ACID.png', 250),
(1425, 'BIC', 'BICARBONATO X 25 K   ', '', '', 6, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, 2.8, 25000, NULL, NULL, NULL, NULL, 'img/articulos/BIC.png', 250),
(1426, 'CMC05', 'CMC ESTABILIZANTE     X 25 K', 'Polvo C.M.C (Carboximetilcelulosa), también conocido como goma celulosa y tylose. Gránulos blancos amarillentos para uso en pastelería y repostería, puedes utilizarlo como espesante, gelificante y estabilizante en pequeñas cantidades.', ' *Espesante: Mejora la viscosidad de los productos liquidos y semilíquidos.*Estabilizante: Sirve para estabilizar salsas, cremas, sopas , helados y derivados lacteos *También equilibra la humedad de masas como fondant, pastillaje o pasta de goma.*También empleado para elaborar pegamento liquido para fijar piezas en pastillaje o pasta de goma ', 24, 'Gr', 5, 'NORMAL', 34, 101, 1, 5, 20, 6000, 18, 25, NULL, NULL, 'img/articulos/CMC05.png', 250),
(1427, 'CREMIVIT', 'CREMIVIT 4X4 X 2K CREMA PASTELERA LEVAPAN TTY', 'Mezcla en polvo para la preparación instantánea de una auténtica crema pastelera.', '', 28, 'Gr', 5, 'NORMAL', 34, 101, 1, 5, 27, 4000, NULL, NULL, NULL, NULL, 'img/articulos/CREMIVIT.png', 250),
(1428, 'CREMOR04', 'CREMOR TARTARO X K            ', 'El cremor tártaro, cuyo nombre químico es bitrartato de potasio, básicamente es un polvo blanco, sin sabor específico', '*Para hacer merengues y glaseado para postres, solo debes mezclarlo con las claras de huevo, 1/8 de cdita de cremor por cada clara.\n*Se puede agregar a las masas de los panes y pasteles para darles mayor volumen y que queden más esponjosos. *Es uno de los ingredientes básicos del polvo para hornear, por lo que puedes usarlo para sustituirlo, justo con el bicarbonato de sodio.*Para elaborar dulces o cubiertas con jarabes, ya que previene la formación de cristales de azúcar. *Los merengues al horno quedan más secos, ligeros y con picos más firmes gracias al cremor. *Evita que se endurezcan rápidamente los glaseados de los pasteles. *Para darle firmeza a la crema de leche o nata cuando se deben batir para montar. *Reduce el sabor dulce de los endulcorantes. *Funciona como conservante natural para los alimentos.', 42, 'Gr', 5, 'NORMAL', 34, 101, 1, 5, 39, 4000, NULL, NULL, NULL, NULL, 'img/articulos/CREMOR04.png', 250),
(1429, 'HYVOL17', 'HY VOL  X 2 03 K RICHS                 ', 'La forma más efectiva de preparar merengue es utilizando Hyvol, nuestra cobertura de merengue en polvo elaborado con claras de huevo deshidratadas. Rendimiento, practicidad, sabor y estabilidad son solo algunas de sus características', '*Delicioso sabor y agradable aroma a vainilla *No tiene olor ni sabor característico a huevo *Permite la adición de fruta, mermelada y rellenos sin perder su consistencia, estabilidad, textura y brillo *Conserva los colores vivos sin perder su consistencia ni estabilidad *Estable a altas temperaturas', 60, 'Gr', 5, 'NUEVO', 34, 101, 1, 5, 50, 2000, NULL, NULL, NULL, NULL, 'img/articulos/HYVOL17.png', 100),
(1430, '7707175885236', 'POLVO DE HORNEAR CAROLESE XK COLORISA', 'Ideal para masas en reposo. Tiene 2 momentos de activación: mientras la masa está reposando y mientras se hornea.', '', 8000, 'Und', 5, 'NUEVO', 34, 101, 1, 5, 7500, 6, 6633, 30, NULL, NULL, 'img/articulos/7707175885236.png', 100),
(1431, 'PHK09', 'POLVO DE HORNEAR CAROLESE GRANEL X K COLORISA', 'Ideal para masas en reposo. Tiene 2 momentos de activación: mientras la masa está reposando y mientras se hornea.', '', 8, 'Gr', 5, 'NORMAL', 34, 101, 1, 5, 7.5, 6000, 6.4, 30000, NULL, NULL, 'img/articulos/PHK09.png', 250),
(1432, '7702014000443', 'POLVO DE HORNEAR LEVAPAN X K', 'Mezcla homogénea de ingredientes, que actúan como agentes leudantes en productos de panadería, pastelería, bizcochería y galletería como galletas de avena, pan de leche, ponqué junior, ponqué industrial, pan coco, calentanos, magdalenas, mantecadas, entre otros. Su ingrediente activo es el pirofosfato de sodio.', '', 13000, 'Und', 5, 'NORMAL', 34, 101, 1, 1, 12000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702014000443.png', 100),
(1433, 'PICANT01', 'POLVO AJI JALAPEÑO  X  K', '', '', 30, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, 28, 3000, NULL, NULL, NULL, NULL, 'img/articulos/PICANT01.png', 100),
(1434, 'POLLO18', 'POLVO SABOR POLLO  X  K', '', '', 30, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, 28, 3000, NULL, NULL, NULL, NULL, 'img/articulos/POLLO18.png', 100);
INSERT INTO `articulos` (`id`, `codigo`, `nombre`, `descripcion`, `lista`, `precio`, `embalaje`, `clasificacion`, `categoria`, `idgrupo`, `idsubgrupo`, `idmarca`, `rank`, `dcto1`, `cant_dcto1`, `dcto2`, `cant_dcto2`, `dcto3`, `cant_dcto3`, `img`, `incremento`) VALUES
(1435, '7707062501720', 'PUMA  MEJORADOR PURATOS PLUS  X K LEVAPAN TTY', 'Mejorador completo en polvo especial para la elaboración artesanal de todo tipo de panes blandos. Aporta suavidad y frescura a los panes.', '', 20, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, 18, 6000, NULL, NULL, NULL, NULL, 'img/articulos/7707062501720.png', 100),
(1436, 'PRODIA', 'POLVO DE HORNEAR PRODIA KILO ', 'Permite durante el horneo mejorar el tamaño, la miga, el sabor y presentación final del producto.', '', 8000, 'Und', 5, 'NORMAL', 34, 101, 1, 1, 7000, 12, NULL, NULL, NULL, NULL, 'img/articulos/PRODIA.png', 100),
(1437, '7707119760018', 'POLVO DE HORNEAR PRODIA X LB ', 'Permite durante el horneo mejorar el tamaño, la miga, el sabor y presentación final del producto.', '', 4000, 'Und', 5, 'NORMAL', 34, 101, 1, 1, 3500, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707119760018.png', 100),
(1438, 'ANTIMOHO', 'ANTIMOHO PROPIANATO ', '', '', 20, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, 18, 6000, NULL, NULL, NULL, NULL, 'img/articulos/ANTIMOHO.png', 250),
(1439, 'POLVOCHEDAR', 'POLVO CHEDDAR', '', '', 66, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, 60, 2000, NULL, NULL, NULL, NULL, 'img/articulos/POLVOCHEDAR.png', 100),
(1440, 'POLVOTOCINETA', 'POLVO TOCINETA ', '', '', 65, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, 60, 2000, NULL, NULL, NULL, NULL, 'img/articulos/POLVOTOCINETA.png', 100),
(1441, '7707203390206', 'ISOMALT GRANULAR X 500 GR ', '', '', 18000, 'Und', 5, 'NUEVO', 34, 101, 1, 5, 17000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707203390206.png', 100),
(1442, 'SORBATO', 'SORBATO', '', '', 32000, 'Und', 5, 'NORMAL', 34, 101, 1, 1, 30000, 3, NULL, NULL, NULL, NULL, 'img/articulos/SORBATO.png', 100),
(1443, 'BENZOATO', 'BENZOATO X KILO ', '', '', 16, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, 14, 6000, NULL, NULL, NULL, NULL, 'img/articulos/BENZOATO.png', 500),
(1444, 'DIOXIDO', 'DIOXIDO DE TITANIO X K ', '', '', 60, 'Gr', 5, 'NUEVO', 34, 101, 1, 5, 45, 3000, NULL, NULL, NULL, NULL, 'img/articulos/DIOXIDO.png', 100),
(1445, 'TERMO', 'POLVO DE HORNEAR TERMOACTIVO', 'Se activa con altas temperaturas. Ideal para galletas.', '', 8000, 'Und', 5, 'NORMAL', 34, 101, 1, 1, 5000, 30, NULL, NULL, NULL, NULL, 'img/articulos/TERMO.png', 100),
(1446, 'GOMAGUAR', 'GOMA GUAR ', '', '', 100, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GOMAGUAR.png', 100),
(1447, 'COMI', 'COMINO ', '', '', 25, 'Gr', 5, 'NORMAL', 34, 101, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/COMI.png', 250),
(1448, '7500012332', 'VINO VASILEV X 750ML NEGRO', '', '', 9000, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7500012332.png', 100),
(1449, '7703435200016', 'VINO ALTA COCINA BLANCO 750 ML ', '', '', 22000, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7703435200016.png', 100),
(1450, '7703435200023', 'VINO ALTA COCINA BLANCO 375 ML      ', '', '', 12000, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7703435200023.png', 100),
(1451, '7703435200047', 'VINO ALTA COCINA   TINTO    X  375 ML    ', '', '', 12000, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7703435200047.png', 100),
(1452, '7703435200078', 'VINO ALTA COCINA BLANCO 2 L', '', '', 45000, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7703435200078.png', 100),
(1453, '7703588003304', 'VINO SANSON X 750 ML ', '', '', 18900, 'Und', 5, 'NORMAL', 34, 118, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7703588003304.png', 100),
(1454, '7707099200078', 'VINO SANTA CECILIA BLANCO X  750 ML      ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707099200078.png', 100),
(1455, '7707099200085', 'VINO MOSCATEL GARRAFA 2000 CC', '', '', 22000, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707099200085.png', 100),
(1456, '7707212280130', 'VINO EL INDIO AMADO ', '', '', 9900, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707212280130.png', 100),
(1457, '7707371320036', 'VINO DE MANZANA  X750ML      ', '', '', 9000, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707371320036.png', 100),
(1458, 'VINOCETINTO', 'VINO SANTA CECILIA TINTO X 750 ML', '', '', 9000, 'Und', 5, 'NORMAL', 34, 118, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/VINOCETINTO.png', 100),
(1459, '034264411869', 'BATIDORA OSTER ', '', '', 130000, 'Und', 5, 'NORMAL', 1, 1, 1, 5, 120000, 2, NULL, NULL, NULL, NULL, 'img/articulos/034264411869.png', 100),
(1460, '070896458100', 'NIVELADOR WILTON ', '', '', 50000, 'Und', 5, 'NORMAL', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/070896458100.png', 100),
(1461, '070896575517', 'JUEGO PEINES WILTON MORADO', '', '', 65000, 'Und', 5, 'NORMAL', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/070896575517.png', 100),
(1462, '070896721549', 'JUEGO PEINES WILTON', '', '', 90000, 'Und', 5, 'NORMAL', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/070896721549.png', 100),
(1463, '11912', 'ABECEDARIO Y NUMEROS 2 CM ', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/11912.png', 100),
(1464, '11913', 'ABECEDARIO Y NUMEROS COMICO 2 CM ', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/11913.png', 100),
(1465, '11915', 'ABECEDARIO OREJITAS 2 CM', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/11915.png', 100),
(1466, '2019344983519', 'BROCHA GANDE EKO', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/2019344983519.png', 100),
(1467, '22772', 'ABECEDARIO PLACA', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/22772.png', 100),
(1468, '3118224028049', 'ESPATULA ACERO 12 MANGO BLANCO', '', '', 12900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/3118224028049.png', 100),
(1469, '5133252015166', 'PALA SILICONA EKO', '', '', 12500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/5133252015166.png', 100),
(1470, '5133252015173', 'BROCHA EKO', '', '', 12500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/5133252015173.png', 100),
(1471, '6115117120344', 'CUCHILLO N20 ', '', '', 22000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6115117120344.png', 100),
(1472, '6115117120412', 'ESPATULA OBLICUA #26', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6115117120412.png', 100),
(1473, '6115117120443', 'ESPATULA OBLICUA #28 ', '', '', 15500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6115117120443.png', 100),
(1474, '6651603011135', 'SILICONA CORAZONES MINI ', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6651603011135.png', 100),
(1475, '6696627067263', 'CORTADOR DE ACERO FLOR CON AGARRE PEQ.', '', '', 5000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6696627067263.png', 100),
(1476, '6746960669676', 'SILICONA MOLDE CUP CAKES ROSAS FUCSIA', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6746960669676.png', 100),
(1477, '6901303000138', 'MANGA SILICONA   N 12  E COLR2 34 CAROL COLORISA', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6901303000138.png', 100),
(1478, '6901303000732', 'ESPATULAS X 3 ', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6901303000732.png', 100),
(1479, '6920170630293', 'CORDATOR DE TORTA (PORCIONARDOR) CAROL COLORISA', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6920170630293.png', 100),
(1480, '6920170630316', 'MANGA SILICONA   N 21  C  COLR2 36 CAROL COLORISA', '', '', 25000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6920170630316.png', 100),
(1481, '6920170630392', 'MANGA SILICONA   N 37  B  COLR2 ', '', '', 32000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6920170630392.png', 100),
(1482, '6920170630446', 'ESPATULA COLR3-29 ', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6920170630446.png', 100),
(1483, '6931121090295', 'ESPATULA PLANA ACERO NEGRO A COLR3 29 CAROL COLORISA', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6931121090295.png', 100),
(1484, '6931121090356', 'MANGA SILICONA   N 18  D COLR2 35 CAROL COLORISA', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6931121090356.png', 100),
(1485, '6931121091872', 'RASPA DOBLE ', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6931121091872.png', 100),
(1486, '6988888166763', 'JUEGO BOQ Y ACOPLE', '', '', 25000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6988888166763.png', 100),
(1487, '6989651212366', 'TAZA MEDIDORA JARRA', '', '', 5900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6989651212366.png', 100),
(1488, '6995568240491', 'ESPATULA PLANA ACERO NEGRO C 8 X 3,7 COLR3 27 CAROL COLORISA', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/6995568240491.png', 100),
(1489, '6995568240958', 'TERMOMETRO DIGITAL', '', '', 27000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 26000, 6, NULL, NULL, NULL, NULL, 'img/articulos/6995568240958.png', 100),
(1490, '6995568241023', 'ALISADORES', '', '', 9000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 8000, 6, NULL, NULL, NULL, NULL, 'img/articulos/6995568241023.png', 100),
(1491, '7453057048762', 'BATIDOR ELECTRICO ', '', '', 110000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7453057048762.png', 100),
(1492, '7702789010128', 'CREMA GRANDE X 450 GR', '', '', 40000, 'Und', 5, 'NORMAL', 32, 103, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702789010128.png', 100),
(1493, '7702789010135', 'CREMA PEQ X 150 G ', '', '', 20000, 'Und', 5, 'NORMAL', 32, 103, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702789010135.png', 100),
(1494, '7702789031567', 'LOCION MENTOLADA', '', '', 35000, 'Und', 5, 'NORMAL', 32, 103, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702789031567.png', 100),
(1495, '7702789031574', 'UNGUENTO X 20 GR', '', '', 20000, 'Und', 5, 'NORMAL', 32, 103, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7702789031574.png', 100),
(1496, '7707368540980', 'ABECEDARIO PEQUEÑO CORTADOR 11538', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707368540980.png', 100),
(1497, '7707368541000', 'ABECEDARIO GRANDE CORTADOR 11539', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707368541000.png', 100),
(1498, '7707368541369', 'CORTADOR PLASTICO X 3 GIRASOL', '', '', 6000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707368541369.png', 100),
(1499, '7707368544414', 'ALISADOR 77064', '', '', 6000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7707368544414.png', 100),
(1500, '7908166702284', 'ESPATULA COLR3 -28-1 ', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7908166702284.png', 100),
(1501, '7908166702383', 'ESPATULA PLANA ACERO NEGRO B COLR3 28 CAROL COLORISA', '', '', 13000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/7908166702383.png', 100),
(1502, '800246003886', 'BROCHA Y ESPATULA SILICONA', '', '', 9900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/800246003886.png', 100),
(1503, '801288102079', 'CORTADOR DE PIZZA GRIS CURVO', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288102079.png', 100),
(1504, '801288102413', 'CUCHARA DE HELADO GRIS PRESS ', '', '', 14900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288102413.png', 100),
(1505, '801288102451', 'PALA REPOSTERIA GRIS DE PRESS ', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288102451.png', 100),
(1506, '801288102611', 'BROCHA SILICONA GRIS PRESS', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288102611.png', 100),
(1507, '801288762181', 'CORTADOR DE PIZZA PEQUEÑO PRESS', '', '', 11000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288762181.png', 100),
(1508, '801288762198', 'CORTADOR PIZZA PRESS GRANDE  9,5 CM           ', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288762198.png', 100),
(1509, '801288762228', 'SEPARADOR DE HUEVO PRESS', '', '', 8000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288762228.png', 100),
(1510, '801288763072', 'BATIDOR MANUAL ACERO 15CM PRESS ', '', '', 13000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288763072.png', 100),
(1511, '801288763119', 'ESPATULA ACERO INOX PRESS', '', '', 16900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288763119.png', 100),
(1512, '801288764048', 'PALA ANTIADHERENTE PRESS LARGA', '', '', 7900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288764048.png', 100),
(1513, '801288768015', 'CUCHARA PLAST BLANCA HELADO   PRESS  ', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768015.png', 100),
(1514, '801288768022', 'MISERABLES JUEGO X 3 PRESS', '', '', 13000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768022.png', 100),
(1515, '801288768077', 'MANGA SILICONA AZUL X 6 BOQUILLAS  PRESS', '', '', 23000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768077.png', 100),
(1516, '801288768084', 'JERINGA GRANDE + 6 BOQUILLAS PRESS', '', '', 26000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768084.png', 100),
(1517, '801288768091', 'JERINGA CON BOQUILLAS   PRESS', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768091.png', 100),
(1518, '801288768107', 'MANGA CON BOQUILLAS PRESS', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768107.png', 100),
(1519, '801288768114', 'JUEGO CORTADOR GALLETAS PRESS PLASTICO ', '', '', 11000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768114.png', 100),
(1520, '801288768121', 'CORTADOR PLASTICO PRESS X 6 FLOR', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768121.png', 100),
(1521, '801288768206', 'TAZA PLASTICA MEDIDORA PEQUEÑA  X5 PRESS', '', '', 15900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768206.png', 100),
(1522, '801288768213', 'CUCHARA PLAST BLANCA MEDIDORA  X  5   PRESS', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768213.png', 100),
(1523, '801288768220', 'CORTADOR GALLETAS ACERO INOX.  X 6  PRESS', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768220.png', 100),
(1524, '801288768237', 'TAZA PRESS MEDIO LITRO ', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768237.png', 100),
(1525, '801288768244', 'TAZA PRESS UN LITRO', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768244.png', 100),
(1526, '801288768251', 'JUEGO DE CLIP CIERRABOLSA * 3 PRESS', '', '', 10900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768251.png', 100),
(1527, '801288768275', 'BOWL X 1.5 LT ', '', '', 26000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768275.png', 100),
(1528, '801288768282', 'MAXI BOWL 3 LT', '', '', 29000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288768282.png', 100),
(1529, '801288769364', 'CUCHILLO PRESS 8¨', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288769364.png', 100),
(1530, '801288771015', 'MOLDE REDONDO ANTIADHERENTE 22X3.5 PRESS', '', '', 13500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771015.png', 100),
(1531, '801288771022', 'MOLDE PAN TAJADO 34.5 X 13 X 6 PRESS', '', '', 26000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771022.png', 100),
(1532, '801288771039', 'MOLDE ANTIADHERENTE CUADRADO 22.5X5 PRESS', '', '', 14500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771039.png', 100),
(1533, '801288771046', 'MOLDE ANTIADERENTE CUP CAKE N 5  X  12  PRESS', '', '', 34000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771046.png', 100),
(1534, '801288771053', 'MOLDE ANTIADHERENTE X 6 26.5 X 18.5 X 3 CM ', '', '', 25000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771053.png', 100),
(1535, '801288771060', 'BANDEJA PARA ASAR 36.5 X 25 X 5 PRESS', '', '', 28000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771060.png', 100),
(1536, '801288771077', 'PAN TAJADO PRESS ANTIADHERENTE 27 X 15', '', '', 22000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771077.png', 100),
(1537, '801288771084', 'MOLDE PARA BROWNIES 30.5 X 20.3 X 4 PRESS ', '', '', 23000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771084.png', 100),
(1538, '801288771091', 'BANDEJA PIZZA ANTIADHERENTE 32.5X0.9 PRESS', '', '', 17000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771091.png', 100),
(1539, '801288771121', 'BANDEJA PARA GALLETAS 43X29X2 PRESS', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771121.png', 100),
(1540, '801288771145', 'MOLDE DESMONTABLE 23X6.8CM PRESS', '', '', 32000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771145.png', 100),
(1541, '801288771152', 'MOLDE CON ARO DESMONTABLE 25X11.6 PRESS', '', '', 42000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771152.png', 100),
(1542, '801288771169', 'MOLDE ANTIADHERENTE BORDE FLOR 27X5.5 PRESS', '', '', 26000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771169.png', 100),
(1543, '801288771183', 'MOLDE BROWNIES *9 31.5X26X2.7 PRESS', '', '', 42000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771183.png', 100),
(1544, '801288771190', 'MOLDE REDONDO 32 X 30 X 5 PRESS', '', '', 29000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771190.png', 100),
(1545, '801288771220', 'MOLDE MINI CUPCAKES X 24  PRESS', '', '', 34000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771220.png', 100),
(1546, '801288771237', 'MOLDE DESMONTABLE 27 X 6.8 PRESS', '', '', 38000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771237.png', 100),
(1547, '801288771244', 'MOLDE DOBLE FONDO DESMONTABLE  25 X 8.5 CM PRESS ', '', '', 44000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288771244.png', 100),
(1548, '801288772043', 'SILICONA MOLDE PARA PIE GRIS PRESS', '', '', 24900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288772043.png', 100),
(1549, '801288772050', 'SILICONA MOLDE CON ARO ONDULADO BEIGE PRESS', '', '', 19900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288772050.png', 100),
(1550, '801288772074', 'MOLDE SILICONA MINI CUPCAKE GRIS X12 PRESS    ', '', '', 28000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288772074.png', 100),
(1551, '801288772098', 'MOLDE SILICON CUP CAKES X 12 GRIS', '', '', 32000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288772098.png', 100),
(1552, '801288772296', 'RODILLO GIRATORIO 42X5 PRESS', '', '', 33900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288772296.png', 100),
(1553, '801288772357', 'GUANTE SILICONA PRESS', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288772357.png', 100),
(1554, '801288772364', 'TAZA CHOCOLATERA SILICONA PRESS', '', '', 19900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288772364.png', 100),
(1555, '801288773019', 'MOLDE DE SILICONA REDONDO 23 CM', '', '', 36000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288773019.png', 100),
(1556, '801288773026', 'MOLDE SILICONA CUADRADO 21.5 X 5.3 PRESS', '', '', 36000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288773026.png', 100),
(1557, '801288773033', 'MOLDE SILICONA PARA MANTECADA 21CM PRESS', '', '', 33000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288773033.png', 100),
(1558, '801288773040', 'SILICONA MOLDE PARA PIE PRESS', '', '', 24900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288773040.png', 100),
(1559, '801288773057', 'SILICONA MOLDE PARA TORTA CON ARO PRESS', '', '', 38000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288773057.png', 100),
(1560, '801288773064', 'MOLDE SILICON CUP CAKE #6 PRESS', '', '', 38000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288773064.png', 100),
(1561, '801288773071', 'MOLDE SILICONA MINI CUPCAKE MORADO X12 PRESS', '', '', 33000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288773071.png', 100),
(1562, '801288773095', 'SILICONA MOLDE PARA PONQUE 29.5X22.5X3  X12  PRESS', '', '', 38000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288773095.png', 100),
(1563, '801288773101', 'SILICONA MOLDE PARA CHOCOLATES X 30 PRESS ', '', '', 32000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288773101.png', 100),
(1564, '801288774221', 'ESPATULA DE SILICONA 3.6 CM PRESS', '', '', 9900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288774221.png', 100),
(1565, '801288774238', 'ESPATULA DE SILICONA 5CM PRESS', '', '', 11500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288774238.png', 100),
(1566, '801288774245', 'ESPATULA DE SILICONA 6.4CM PRESS', '', '', 11900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288774245.png', 100),
(1567, '801288774252', 'BROCHA SILICONA  PARA COCINA PRESS', '', '', 13900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288774252.png', 100),
(1568, '801288774269', 'BROCHA REDONDA SILICONA PRESS', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288774269.png', 100),
(1569, '801288774276', 'BATIDOR  DE SILICON   X  13CM PRESS', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288774276.png', 100),
(1570, '801288775112', 'HIELERA FLEXIBLE SILICON PRESS', '', '', 19900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288775112.png', 100),
(1571, '801288862072', 'CORTADOR PIZZA GRIS PRESS', '', '', 12500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288862072.png', 100),
(1572, '801288864182', 'BATIDOR ANTIADHERENTE 18CM GRANDE PRESS', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288864182.png', 100),
(1573, '801288865110', 'RALLADOR LASER PRESS', '', '', 18900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288865110.png', 100),
(1574, '801288868012', 'CUCHARA   HELADO METALICA   PRESS ', '', '', 19000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288868012.png', 100),
(1575, '801288868029', 'CUCHARA  TIJERA HELADO PLASTICA PRESS', '', '', 26000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288868029.png', 100),
(1576, '801288868036', 'PALA DE REPOSTERIA PRESS METALICA', '', '', 18900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288868036.png', 100),
(1577, '801288868050', 'BROCHA PARA COCINA CERDAS NYLON  PRESS', '', '', 11900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/801288868050.png', 100),
(1578, '8435545739993', 'JUEGO DE PEINES EKO X 3', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/8435545739993.png', 100),
(1579, '8716963660947', 'CORTADOR DE TORTA COLORISA', '', '', 35000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/8716963660947.png', 100),
(1580, '9683548099227', 'ACOPLE 3 BOQUILLAS ', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/9683548099227.png', 100),
(1581, 'ACOPEQ02', 'ACOPLES  PEQUEÑO COLORISA                                      ', '', '', 2000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ACOPEQ02.png', 100),
(1582, 'ACOPGR01', 'ACOPLE GRANDE X3', '', '', 5000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ACOPGR01.png', 100),
(1583, 'AEROGRAFO', 'AEROGRAFO', '', '', 350000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/AEROGRAFO.png', 100),
(1584, 'ALUCUP22', 'MOLDE CUP CAKE PEQUEÑO', '', '', 800, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ALUCUP22.png', 100),
(1585, 'ALUCUP23', 'MOLDE CUP CAKE MEDIANO', '', '', 900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ALUCUP23.png', 100),
(1586, 'ALUCUP25', 'MOLDE CUP CAKE GRANDE', '', '', 1000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ALUCUP25.png', 100),
(1587, 'AROS', 'AROS METALICOS ', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/AROS.png', 100),
(1588, 'BAIGR', 'BAILARINA DOBLE PLATO GRIS ', '', '', 135000, 'Und', 5, 'NUEVO', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BAIGR.png', 100),
(1589, 'BAILACE01', 'BAILARINA GIRATORIA ACERO PESADA  COLR 3 5 COLORISA ', '', '', 95000, 'Und', 5, 'NUEVO', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BAILACE01.png', 100),
(1590, 'BAILARINA', 'BAILARINA EKO BLANCA COLR3-4', '', '', 55000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BAILARINA.png', 100),
(1591, 'BAILARINAPLAT', 'BAILARINA PLATEADA ', '', '', 120000, 'Und', 5, 'NUEVO', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BAILARINAPLAT.png', 100),
(1592, 'BAILDO01', 'BAILARINA ACERO DOBLE BLANCA COLORISA       ', '', '', 148000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BAILDO01.png', 100),
(1593, 'BAILMDF01', 'BAILARINA MDF NATURAL', '', '', 40000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BAILMDF01.png', 100),
(1594, 'BAIVID', 'BAILARINA DOBLE PLATO VIDRIO ', '', '', 80000, 'Und', 5, 'NUEVO', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BAIVID.png', 100),
(1595, 'BALINERA', 'BALINES', '', '', 5000, 'Und', 5, 'NUEVO', 35, 104, 1, 5, 4000, 12, NULL, NULL, NULL, NULL, 'img/articulos/BALINERA.png', 100),
(1596, 'BANDEJA', 'BANDEJA PARA HORNO 40 X 60 ', '', '', 28000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BANDEJA.png', 100),
(1597, 'BANHOG06', 'BANDEJA RECTANGULAR GRANDE 40 X 40', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BANHOG06.png', 100),
(1598, 'BANHOM07', 'BANDEJA RECTANGULAR MEDIANA 39 X 33', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BANHOM07.png', 100),
(1599, 'BANHOMI9', 'BANDEJA RECTANGULAR MINI 20 X 33', '', '', 8500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BANHOMI9.png', 100),
(1600, 'BANPIG01', 'BANDEJA PIZZA GRANDE 50 DIAM', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BANPIG01.png', 100),
(1601, 'BANPIM02', 'BANDEJA PIZZA MEDIANA 40 DIAM', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BANPIM02.png', 100),
(1602, 'BANPISP05', 'BANDEJA PIZZA SUPER MINI  19 DIAM', '', '', 5500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BANPISP05.png', 100),
(1603, 'BASACRI01', 'BASE BLANCA METALICA COLR19-059', '', '', 42000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BASACRI01.png', 100),
(1604, 'BASACRTR', 'BASE BLANCA PVC MEDIANA', '', '', 35000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BASACRTR.png', 100),
(1605, 'BASEACRI', 'BASE MADERA TORTA', '', '', 25000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BASEACRI.png', 100),
(1606, 'BASEDOR1', 'DISCO DORADO 21CM MEDIA LIBRA ', '', '', 3000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 2600, 6, 2200, 12, NULL, NULL, 'img/articulos/BASEDOR1.png', 100),
(1607, 'BASEPVC', 'BASE BLANCA PVC BAJA', '', '', 30000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BASEPVC.png', 100),
(1608, 'BASMDF02', 'BASE BLANCA PVC ALTA ', '', '', 40000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BASMDF02.png', 100),
(1609, 'BATGP', 'BATIDOR GLOBO PEQUEÑO ', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 17000, 6, NULL, NULL, NULL, NULL, 'img/articulos/BATGP.png', 100),
(1610, 'BATIGLO', 'BATIDOR GLOBO GRANDE', '', '', 22000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 21000, 6, NULL, NULL, NULL, NULL, 'img/articulos/BATIGLO.png', 100),
(1611, 'BATMED', 'BATIDOR GLOBO MEDIANO ', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 19000, 6, NULL, NULL, NULL, NULL, 'img/articulos/BATMED.png', 100),
(1612, 'BOQPEQ01', 'BOQUILLA PEQUEÑA X25 EKO', '', '', 3000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 1800, 25, NULL, NULL, NULL, NULL, 'img/articulos/BOQPEQ01.png', 100),
(1613, 'BOQUGR01', 'BOQUILLA COLORISA PEQUEÑA  NO 6  7 ', '', '', 3500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BOQUGR01.png', 100),
(1614, 'BOQUGR02', 'BOQUILLA GRANDE X15 EKO  ', '', '', 6500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 3000, 15, NULL, NULL, NULL, NULL, 'img/articulos/BOQUGR02.png', 100),
(1615, 'BOQUILLA', 'BOQUILLA ESPECIALES ', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/BOQUILLA.png', 100),
(1616, 'BOROSA', 'BOQUILLA RUSA GRANDE', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 11000, 12, NULL, NULL, NULL, NULL, 'img/articulos/BOROSA.png', 100),
(1617, 'BRILTO53', 'BRILLANTINA TORNASOL   X KILO', '', '', 220, 'Gr', 5, 'NORMAL', 35, 104, 1, 1, 0.21, 3, NULL, NULL, NULL, NULL, 'img/articulos/BRILTO53.png', 100),
(1618, 'CAJCUP02', 'CAJA CUPCAKE COLORES SURTIDOS ', '', '', 1500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAJCUP02.png', 100),
(1619, 'CAJKILO', 'CAJA DE TORTA KILO CON TAPA', '', '', 1600, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAJKILO.png', 100),
(1620, 'CAJLIB', 'CAJA DE TORTA LIBRA', '', '', 1800, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAJLIB.png', 100),
(1621, 'CAJMEDI', 'CAJA DE TORTA MEDIA LIBRA', '', '', 1000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAJMEDI.png', 100),
(1622, 'CAJNAV01', 'CAJA NAVIDAD CUP CAKE', '', '', 1000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAJNAV01.png', 100),
(1623, 'CANCHA01', 'CANCHAS DE FUTBOL', '', '', 7000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CANCHA01.png', 100),
(1624, 'CHANTI', 'CHANTILLERA X PEQ', '', '', 130000, 'Und', 5, 'NUEVO', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CHANTI.png', 100),
(1625, 'CHANTI2', 'CHANTILLERA GRANDE ', '', '', 140000, 'Und', 5, 'NUEVO', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CHANTI2.png', 100),
(1626, 'CORCOLOFLOR', 'CORTADOR PLASTICO COLORISA X 5 FLOR', '', '', 8000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CORCOLOFLOR.png', 100),
(1627, 'CORTCOLORI', 'CORTADOR PLASTICO COLORISA X 5 CORAZON', '', '', 8000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CORTCOLORI.png', 100),
(1628, 'CORTCUACOL', 'CORTADOR PLASTICO COLORISA X 5 CUADRADO', '', '', 8000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CORTCUACOL.png', 100),
(1629, 'CORTESTRE', 'CORTADOR PLASTICO COLORISA X 5 ESTRELLA ', '', '', 8000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CORTESTRE.png', 100),
(1630, 'CORTMET', 'CORTADOR PIZZA METALICO MEDIANO', '', '', 13000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CORTMET.png', 100),
(1631, 'CORTNARA', 'CORTADOR PLASTICO COLORISA X 5 REDONDO', '', '', 8000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CORTNARA.png', 100),
(1632, 'CUP6', 'MOLDE ANTIADHERENRE X 6 CUP CAKE', '', '', 22000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CUP6.png', 100),
(1633, 'DELANTAL', 'DELANTAL', '', '', 24000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/DELANTAL.png', 100),
(1634, 'DES14', 'MOLDE DESMONTABLE #14', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/DES14.png', 100),
(1635, 'DES16', 'MOLDE DESMONTABLE #16', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/DES16.png', 100),
(1636, 'DES18', 'MOLDE DESMONTABLE #18', '', '', 22000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/DES18.png', 100),
(1637, 'DI', 'DISCO DORADO EXTRA MINI ', '', '', 1500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 1000, 12, NULL, NULL, NULL, NULL, 'img/articulos/DI.png', 100),
(1638, 'DISCOSUPER', 'DISCO 14CM SUPER MINI  ', '', '', 2000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 1500, 12, NULL, NULL, NULL, NULL, 'img/articulos/DISCOSUPER.png', 100),
(1639, 'DISRED04', 'DISCO DORADO 26CM LIBRA', '', '', 3500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 3000, 12, NULL, NULL, NULL, NULL, 'img/articulos/DISRED04.png', 100),
(1640, 'DISRED07', 'DISCO DORADO 33CM KILO', '', '', 4500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 4000, 12, NULL, NULL, NULL, NULL, 'img/articulos/DISRED07.png', 100),
(1641, 'ESPCOL05', 'ESPATULA PLANA ACERO NEGRO D COLR3 26 CAROL COLORISA', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ESPCOL05.png', 100),
(1642, 'ESPT04', 'ESPATULA EN PLASTICO Y SILICONA DE COLORES ', '', '', 5900, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ESPT04.png', 100),
(1643, 'ESTU', 'ESTUCHE BOQUILLAS', '', '', 155000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 150000, 3, NULL, NULL, NULL, NULL, 'img/articulos/ESTU.png', 100),
(1644, 'EXHIBIDOR', 'EXHIBIDOR DE TORTAS BLANCO', '', '', 34000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/EXHIBIDOR.png', 100),
(1645, 'GRAM', 'GRAMERA DIGITAL  X 10 K', '', '', 30000, 'Und', 5, 'NUEVO', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAM.png', 100),
(1646, 'HOBBY', 'HOBBYCOR', '', '', 95000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 85000, 3, 78000, 6, NULL, NULL, 'img/articulos/HOBBY.png', 100),
(1647, 'ICO15', 'ICOPOR 15.5 CM UN CUARTO', '', '', 500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ICO15.png', 100),
(1648, 'ICO21', 'ICOPOR 21 CM MEDIA LIBRA', '', '', 500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ICO21.png', 100),
(1649, 'ICO30', 'ICOPOR 30 CM LIBRA', '', '', 800, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/ICO30.png', 100),
(1650, 'LETR', 'MOLDE SILICONA ABC ', '', '', 27000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/LETR.png', 100),
(1651, 'MANGAX6', 'MANGA AMARILLA LUCAREY #14  + 6 BOQUILLAS', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MANGAX6.png', 100),
(1652, 'MANGPQ01', 'MANGAS PLASTICAS PEQUEÑA 20 X 35 LATINO', '', '', 600, 'Und', 5, 'NUEVO', 35, 104, 1, 5, 240, 100, NULL, NULL, NULL, NULL, 'img/articulos/MANGPQ01.png', 100),
(1653, 'MANGRA02', 'MANGAS PLASTICAS  GRANDE 30 X 49 LATINO', '', '', 800, 'Und', 5, 'NUEVO', 35, 104, 1, 5, 350, 100, NULL, NULL, NULL, NULL, 'img/articulos/MANGRA02.png', 100),
(1654, 'MANTEG19', 'MOLDE MANTECADA GRANDE', '', '', 4000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 3500, 12, NULL, NULL, NULL, NULL, 'img/articulos/MANTEG19.png', 100),
(1655, 'MANTEM20', 'MOLDE MANTECADA MEDIANO ', '', '', 3500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 3000, 12, NULL, NULL, NULL, NULL, 'img/articulos/MANTEM20.png', 100),
(1656, 'MANTEP21', 'MOLDE MANTECADA PEQUEÑO', '', '', 3000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 2700, 12, NULL, NULL, NULL, NULL, 'img/articulos/MANTEP21.png', 100),
(1657, 'MISERA', 'MISERABLE VERDE MEDIANA ', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 13000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MISERA.png', 100),
(1658, 'MISERABLEG', 'MISERABLE VERDE GRANDE', '', '', 16000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 15000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MISERABLEG.png', 100),
(1659, 'MISVER01', 'MISERABLE VERDE PEQUEÑA', '', '', 6500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 6000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MISVER01.png', 100),
(1660, 'MOLAL01', 'MOLDE ALTO REDONDO KILO', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 13000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLAL01.png', 100),
(1661, 'MOLAL02', 'MOLDE ALTO REDONDO LIBRA ', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 11000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLAL02.png', 100),
(1662, 'MOLAL03', 'MOLDE ALTO REDONDO MEDIA LIBRA', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 9000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLAL03.png', 100),
(1663, 'MOLAL04', 'MOLDE ALTO REDONDO UN CUARTO ', '', '', 9000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 8500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLAL04.png', 100),
(1664, 'MOLAL05', 'MOLDE ALTO REDONDO UN OCTAVO', '', '', 8500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 8000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLAL05.png', 100),
(1665, 'MOLD001', 'MOLDE REDONDO K', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 11500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLD001.png', 100),
(1666, 'MOLD002', 'MOLDE REDONDO LIBRA (500GR) ', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 9500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLD002.png', 100),
(1667, 'MOLD003', 'MOLDE REDONDO MEDIA LIBRA (250GR)', '', '', 8000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 7500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLD003.png', 100),
(1668, 'MOLD004', 'MOLDE REDONDO UN CUARTO (125 GR) ', '', '', 7000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 6500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLD004.png', 100),
(1669, 'MOLDAC01', 'MOLDES  ACETATO CHOCOLATINAS        400', '', '', 2000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MOLDAC01.png', 100),
(1670, 'MOLDAC02', 'MOLDES  ACETATO CHOCO GRANDES', '', '', 4000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MOLDAC02.png', 100),
(1671, 'MOLDE10', 'MOLDE REDONDO MINI #8 CM', '', '', 3500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 3200, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDE10.png', 100),
(1672, 'MOLDE12', 'MOLDE REDONDO MINI #12 CM ', '', '', 5000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 4800, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDE12.png', 100),
(1673, 'MOLDE14', 'MOLDE REDONDO MINI #14 CM', '', '', 6000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 5800, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDE14.png', 100),
(1674, 'MOLDE16', 'MOLDE REDONDO MINI #16 CM', '', '', 6500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 6200, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDE16.png', 100),
(1675, 'MOLDE19', 'MOLDE REDONDO MINI #19 CM', '', '', 7000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 6800, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDE19.png', 100),
(1676, 'MOLDECORAZON', 'JUEGO MOLDE CORAZON X 5', '', '', 60000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/MOLDECORAZON.png', 100),
(1677, 'MOLDPT01', 'MOLDE PAN TAJADO GRUESO', '', '', 9500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 9200, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDPT01.png', 100),
(1678, 'MOLDQUE', 'MOLDE QUESILLO LB #20', '', '', 9000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 8500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDQUE.png', 100),
(1679, 'MOLDQUES1', 'MOLDE QUESILLO X 1/2 LB #18', '', '', 7000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 6500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDQUES1.png', 100),
(1680, 'MOLDTC11', 'MOLDE CUADRADO TORTA UN CUARTO 125 GR', '', '', 9000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 8500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDTC11.png', 100),
(1681, 'MOLDTC17', 'MOLDE RECTANGULAR TORTA UN CUARTO 125 GR', '', '', 9000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 8500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDTC17.png', 100),
(1682, 'MOLDTK08', 'MOLDE CUADRADO TORTA KILO ', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 13000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDTK08.png', 100),
(1683, 'MOLDTK14', 'MOLDE RECTANGULAR  TORTA KILO ', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 13000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDTK14.png', 100),
(1684, 'MOLDTL09', 'MOLDE CUADRADO TORTA LIBRA 500 GR ', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 11000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDTL09.png', 100),
(1685, 'MOLDTL15', 'MOLDE RECTANGULAR TORTA LIBRA 500 GR ', '', '', 12000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 11000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDTL15.png', 100),
(1686, 'MOLDTM10', 'MOLDE CUADRADO TORTA MEDIA LIBRA 250 GR', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 9000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDTM10.png', 100),
(1687, 'MOLDTM16', 'MOLDE RECTANGULAR TORTA MEDIA LIBRA 250 GR', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 9000, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDTM16.png', 100),
(1688, 'MOLDTO12', 'MOLDE CUADRADO TORTA UN OCTAVO ', '', '', 6000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 5800, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLDTO12.png', 100),
(1689, 'MOLQUE3', 'MOLDE QUESILLO X 1/4 LB #16', '', '', 5000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 4500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLQUE3.png', 100),
(1690, 'MOLREDO', 'MOLDE REDONDO MINI #10 ', '', '', 4000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 3500, 6, NULL, NULL, NULL, NULL, 'img/articulos/MOLREDO.png', 100),
(1691, 'N10', 'MOLDE ALTO #10', '', '', 6000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 5500, 6, NULL, NULL, NULL, NULL, 'img/articulos/N10.png', 100),
(1692, 'N14', 'MOLDE ALTO #14', '', '', 7500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 7000, 6, NULL, NULL, NULL, NULL, 'img/articulos/N14.png', 100),
(1693, 'N15', 'MOLDE ALTO #15', '', '', 8500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 8000, 6, NULL, NULL, NULL, NULL, 'img/articulos/N15.png', 100),
(1694, 'N16', 'MOLDE ALTO #16', '', '', 9500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 9000, 6, NULL, NULL, NULL, NULL, 'img/articulos/N16.png', 100),
(1695, 'N18', 'MOLDE ALTO #18', '', '', 10000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 9500, 6, NULL, NULL, NULL, NULL, 'img/articulos/N18.png', 100),
(1696, 'N20', 'MOLDE ALTO #20', '', '', 11000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 10500, 6, NULL, NULL, NULL, NULL, 'img/articulos/N20.png', 100),
(1697, 'PALETAS', 'PALETAS X 4 ONDA ', '', '', 35000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 32000, 6, NULL, NULL, NULL, NULL, 'img/articulos/PALETAS.png', 100),
(1698, 'PALETAX4', 'PALETAS X 4 LISA', '', '', 30000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 29000, 6, NULL, NULL, NULL, NULL, 'img/articulos/PALETAX4.png', 100),
(1699, 'PAPELP01', 'PARAFINADO PAPEL ROLLO     ', '', '', 6000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/PAPELP01.png', 100),
(1700, 'PEID', 'PEINES DOBLES GRANDES ACRILICO', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 15000, 6, NULL, NULL, NULL, NULL, 'img/articulos/PEID.png', 100),
(1701, 'PEIN02', 'PEINE PLASTICO BLANCO COLORISA', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 14000, 6, NULL, NULL, NULL, NULL, 'img/articulos/PEIN02.png', 100),
(1702, 'PEIPLAS', 'PEINE PLASTICO  EKO', '', '', 3000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 2800, 6, NULL, NULL, NULL, NULL, 'img/articulos/PEIPLAS.png', 100),
(1703, 'PIZZAPEQ', 'BANDEJA PIZZA PEQUEÑA DIAM 33', '', '', 16000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 15000, 6, NULL, NULL, NULL, NULL, 'img/articulos/PIZZAPEQ.png', 100),
(1704, 'RASBLAN01', 'RASPA  RIGIDO PLASTICA BLANCA ', '', '', 2500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 2200, 6, NULL, NULL, NULL, NULL, 'img/articulos/RASBLAN01.png', 100),
(1705, 'RASPA', 'RASPA ACERO CON ACRILICO', '', '', 15000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 14000, 6, NULL, NULL, NULL, NULL, 'img/articulos/RASPA.png', 100),
(1706, 'RESMA', 'PAPEL DE ARROZ', '', '', 3000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 120000, 100, NULL, NULL, NULL, NULL, 'img/articulos/RESMA.png', 100),
(1707, 'RODCOL01', 'RODILLO PROF 40X3¨ (C) COLORISA', '', '', 62000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/RODCOL01.png', 100),
(1708, 'RODCOL02', 'RODILLO PROF 35X3¨  REF (D) COLORISA', '', '', 58000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/RODCOL02.png', 100),
(1709, 'RODCOL03', 'RODILLO PROF 30 X 2 (E) COLORISA', '', '', 45000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/RODCOL03.png', 100),
(1710, 'RODCOL04', 'RODILLO PROF 48X2¨ (B) COLORISA', '', '', 55000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/RODCOL04.png', 100),
(1711, 'RODCOL05', 'RODILLO PROF 48X3¨ (A) COLORISA', '', '', 65000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/RODCOL05.png', 100),
(1712, 'RODILLO', 'RODILLO EKO PLASTICO ', '', '', 18000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/RODILLO.png', 100),
(1713, 'RODILLOF', 'RODILLO PROF 2 X 20 (F) COLORISA', '', '', 42000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/RODILLOF.png', 100),
(1714, 'TAP02', 'TAPETE MACARRON', '', '', 20000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/TAP02.png', 100),
(1715, 'TAPA', 'TAPA DE VIDRIO', '', '', 39000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/TAPA.png', 100),
(1716, 'TAZA03', 'TAZAS MEDIDORAS X 4 BLANCA', '', '', 8000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/TAZA03.png', 100),
(1717, 'TAZAGR01', 'TAZA PLASTICA  GRANDE  X  7', '', '', 13500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/TAZAGR01.png', 100),
(1718, 'TOPPER01', 'TOPPERS PLASTICO COLORES ACRILICOS', '', '', 17000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 15000, 6, NULL, NULL, NULL, NULL, 'img/articulos/TOPPER01.png', 100),
(1719, 'TOPPERP', 'TOPPERS PEQUEÑO ', '', '', 4500, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 4000, 6, NULL, NULL, NULL, NULL, 'img/articulos/TOPPERP.png', 100);
INSERT INTO `articulos` (`id`, `codigo`, `nombre`, `descripcion`, `lista`, `precio`, `embalaje`, `clasificacion`, `categoria`, `idgrupo`, `idsubgrupo`, `idmarca`, `rank`, `dcto1`, `cant_dcto1`, `dcto2`, `cant_dcto2`, `dcto3`, `cant_dcto3`, `img`, `incremento`) VALUES
(1720, 'TOPPGR01', 'TOPPERS MADERA', '', '', 8000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 6000, 6, NULL, NULL, NULL, NULL, 'img/articulos/TOPPGR01.png', 100),
(1721, 'TORPVC02', 'TORRE BLANCA PVC PARA CUP CAKES X 3', '', '', 40000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 38000, 3, NULL, NULL, NULL, NULL, 'img/articulos/TORPVC02.png', 100),
(1722, 'VASODE', 'VASO DE MEDIDAS ', '', '', 5500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/VASODE.png', 100),
(1723, 'VOL14', 'VOLCAN #14 ', '', '', 9000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 8500, 6, NULL, NULL, NULL, NULL, 'img/articulos/VOL14.png', 100),
(1724, 'VOL16', 'VOLCAN #16', '', '', 11000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 10500, 6, NULL, NULL, NULL, NULL, 'img/articulos/VOL16.png', 100),
(1725, 'VOL18', 'VOLCAN #18', '', '', 14000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 13000, 6, NULL, NULL, NULL, NULL, 'img/articulos/VOL18.png', 100),
(1726, 'VOL20', 'VOLCAN #20', '', '', 17000, 'Und', 5, 'NORMAL', 35, 104, 1, 5, 16500, 6, NULL, NULL, NULL, NULL, 'img/articulos/VOL20.png', 100),
(1727, 'CAPBLAN0', 'CAPACILLO BLANCO N 0 X 1000', '', '', 500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 6000, 40, NULL, NULL, NULL, NULL, 'img/articulos/CAPBLAN0.png', 100),
(1728, 'CAPBLAN1', 'CAPACILLO BLANCO N 1 X 1000', '', '', 500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 7000, 40, NULL, NULL, NULL, NULL, 'img/articulos/CAPBLAN1.png', 100),
(1729, 'CAPBLAN2', 'CAPACILLO BLANCO N 2 X 1000', '', '', 500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 7900, 40, NULL, NULL, NULL, NULL, 'img/articulos/CAPBLAN2.png', 100),
(1730, 'CAPBLAN3', 'CAPACILLO BLANCO N 3 X 1000', '', '', 600, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 8900, 40, NULL, NULL, NULL, NULL, 'img/articulos/CAPBLAN3.png', 100),
(1731, 'CAPBLAN4', 'CAPACILLO BLANCO N 4 X 1000', '', '', 800, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 9900, 40, NULL, NULL, NULL, NULL, 'img/articulos/CAPBLAN4.png', 100),
(1732, 'CAPBLAN5', 'CAPACILLO BLANCO N 5 X 1000', '', '', 1000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 12000, 40, NULL, NULL, NULL, NULL, 'img/articulos/CAPBLAN5.png', 100),
(1733, 'CAPDO1', 'CAPACILLO DORADO N 1 X 60', '', '', 1000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 10000, 6, NULL, NULL, NULL, NULL, 'img/articulos/CAPDO1.png', 100),
(1734, 'CAPDO5', 'CAPACILLO DORADO N 5 X 60', '', '', 2500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, 12000, 6, NULL, NULL, NULL, NULL, 'img/articulos/CAPDO5.png', 100),
(1735, 'CAPESTAM2', 'CAPACILLO ESTAMPADO N 2', '', '', 800, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAPESTAM2.png', 100),
(1736, 'CAPESTAM4', 'CAPACILLO ESTAMPADO N 4', '', '', 1400, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAPESTAM4.png', 100),
(1737, 'CAPESTAM5', 'CAPACILLO ESTAMPADO N 5', '', '', 1600, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAPESTAM5.png', 100),
(1738, 'CAPPLA1', 'CAPACILLO PLATEADO N 1  X 60', '', '', 1000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAPPLA1.png', 100),
(1739, 'CAPPLA4', 'CAPACILLO PLATEADO N 4 X 60', '', '', 1500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAPPLA4.png', 100),
(1740, 'CAPPLA5', 'CAPACILLO PLATEADO N 5 X 60', '', '', 2500, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAPPLA5.png', 100),
(1741, 'CAPUNI5', 'CAPACILLO UNICOLOR N 5', '', '', 1400, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/CAPUNI5.png', 100),
(1742, 'NAVID', 'CAPACILLO NAVIDAD N 5', '', '', 2000, 'Und', 5, 'NORMAL', 35, 104, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/NAVID.png', 100),
(1743, '049800026988', 'CHANTILLY WHIP TOPPING   X 4 LT ', 'Explota tu pasión sin límites con Whip Topping® Base, un concentrado neutro que se puede diluir o mezclar, dándole tu personalidad a todas tus creaciones. Combínala con ingredientes como leche, agua, licor, ácidos, frutas o pulpas y crea infinitas posibilidades con tu toque secreto', '*Es una crema base, concentrado de alto rendimiento y sabor neutro ideal para personalizar tus sabores y recetas *Por su gran versatilidad puede rendirse y diluirse con diferentes ingredientes como agua, leche, crema de leche, jugos y frutas de sabores ácidos, cítricos o con diferentes licores *Permite estabilizar mezclas y prolongar la vida de anaquel de las cremas lácteas *Tiene un excelente desempeño en sifonera *Conserva una aparencia fresca por más tiempo con un brillo natural y textura firme *No se agrieta, no se endurece, ni se reseca', 54000, 'Und', 5, 'NORMAL', 1, 1, 1, 5, 53000, 6, 52800, 12, NULL, NULL, 'img/articulos/049800026988.png', 100),
(1744, '049800161924', 'WHIPTOPPING SUGAR FREE ', 'Sin azúcar, sin lactosa y sin culpa! Whip Topping® Sugar Free elimina el azúcar y agrega versatilidad para que puedas sorprender a tus clientes con productos especiales adaptados a sus necesidades', '*Libre de azúcar, colesterol, lactoras y grasas trans *Gran rendimiento y versatilidad *Puede ser utilizadas en sifonera', 18000, 'Und', 5, 'NORMAL', 1, 1, 1, 5, 16000, 3, NULL, NULL, NULL, NULL, 'img/articulos/049800161924.png', 100),
(1745, '614143779329', 'PASTILLAJE FONDANT X LB', '', '', 7000, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 6500, 6, NULL, NULL, NULL, NULL, 'img/articulos/614143779329.png', 100),
(1746, '7702007030068', 'CHANTILLY  SOBRE NUTRESA  X80 GR.', '', '', 3500, 'Und', 5, 'NORMAL', 34, 108, 1, 5, 3400, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702007030068.png', 100),
(1747, '7702007265514', 'CHANTILLY POLVO NACIONAL DE CHOCOLATES  X K NUTRESA', 'Mezcla en polvo lista para preparar crema chantilly. Su color, textura, aroma y sabor siempre son estables y uniformes. Especial para rellenar y/o decorar.', '', 28, 'Gr', 5, 'NUEVO', 34, 108, 1, 5, 27, 6000, 26.5, 12000, NULL, NULL, 'img/articulos/7702007265514.png', 250),
(1748, '7702141004055', 'CREMA CHOCOLATE DAGUSTO LT', '', '', 13500, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 12500, 6, 12000, 12, NULL, NULL, 'img/articulos/7702141004055.png', 100),
(1749, '7702141007735', 'CREMA VAINILLA DAGUSTO LT', '', '', 13500, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 12500, 6, 12000, 12, NULL, NULL, 'img/articulos/7702141007735.png', 100),
(1750, '7702141007759', 'CREMA NATAS DAGUSTO  LT', '', '', 13500, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 12500, 6, 12000, 12, NULL, NULL, 'img/articulos/7702141007759.png', 100),
(1751, '7702141007957', 'CREMA BASE DAGUSTO LT', '', '', 12000, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 11000, 6, 10500, 12, NULL, NULL, 'img/articulos/7702141007957.png', 100),
(1752, '7702177014035', 'CHANTILLY EN SPRAY ALQUERIAX 250 G', '', '', 12000, 'Und', 5, 'NORMAL', 34, 108, 1, 5, 11500, 12, NULL, NULL, NULL, NULL, 'img/articulos/7702177014035.png', 100),
(1753, '7707062512214', 'BRILLO HARMONY COLD LEVAPAN ', 'Gel transparente obtenido de la pectina de manzana, utilizado para el recubrimiento y aplicación en caliente de tortas y pastelería con frutas', '', 22000, 'Und', 5, 'NORMAL', 34, 108, 1, 5, 21000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7707062512214.png', 100),
(1754, '7708992004763', 'BETTER FRESA X L RICHS ', 'Inspírate con Bettercreme® Fresa y disfruta de su delicioso sabor. Divertida, rica y llena de posibilidades, Bettercreme® es la línea de cremas de sabores que te permite hacer piezas maestras destacando ese gusto por los detalles que tanto te caracteriza', '*Estable a temperatura ambiente (<25° C) manteniendo su apariencia y sabor *Resistente a altas temperaturas en tu área de trabajo *Se puede congelar después de batida *Por su suave y uniforme textura es muy fácil de usar y te permite decorar aún sin ser experto *¡Es la crema de la celebración! Puedes agregarle color y los mantendrá vivos y brillantes *Además por su resistencia y estabilidad te permite realizar las formas y figuras de bulto como flores, rosetones, moños, animales y demás figuras que quieras agregar a tu decoración *Es de origen vegetal, naturalmente libre de colesterol y de grasa trans', 16000, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 14000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7708992004763.png', 100),
(1755, '7708992004794', 'BETTER NATAS RICHS', 'Inspírate con Bettercreme® Nata y disfruta de su delicioso sabor lácteo. Divertida, rica y llena de posibilidades, Bettercreme® es la línea de cremas de sabores que te permite hacer piezas maestras destacando ese gusto por los detalles que tanto te caracteriza', '*Estable a temperatura ambiente (<25° C) manteniendo su apariencia y sabor *Resistente a altas temperaturas en tu área de trabajo *Se puede congelar después de batida *Por su suave y uniforme textura es muy fácil de usar y te permite decorar aún sin ser experto *¡Es la crema de la celebración! Puedes agregarle color y los mantendrá vivos y brillantes *Además por su resistencia y estabilidad te permite realizar las formas y figuras de bulto como flores, rosetones, moños, animales y demás figuras que quieras agregar a tu decoración *Es de origen vegetal, naturalmente libre de colesterol y de grasa trans', 15500, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 13500, 6, 13000, 12, NULL, NULL, 'img/articulos/7708992004794.png', 100),
(1756, '7709008387795', 'BETTER DULCE DE LECHE X L RICHS', 'Inspírate con Bettercreme® Dulce de Leche y disfruta de su delicioso sabor. Divertida, rica y llena de posibilidades, Bettercreme® es la línea de cremas de sabores que te permite hacer piezas maestras, destacando ese gusto por los detalles que tanto te caracteriza', '*Estable a temperatura ambiente (<25° C) manteniendo su apariencia y sabor *Resistente a altas temperaturas en tu área de trabajo *Se puede congelar después de batida *Por su suave y uniforme textura es muy fácil de usar y te permite decorar aún sin ser experto *¡Es la crema de la celebración! Puedes agregarle color y los mantendrá vivos y brillantes *Además por su resistencia y estabilidad te permite realizar las formas y figuras de bulto como flores, rosetones, moños, animales y demás figuras que quieras agregar a tu decoración *Es de origen vegetal, naturalmente libre de colesterol y de grasa trans', 12000, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 11000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709008387795.png', 100),
(1757, '7709623172127', 'JARABE TRES LECHES RICHS X L', 'Remoja la tradición con Tres Riches®, el jarabe con el color, sabor y aroma de la mezcla tradicional de tres leches. Listo para usarse en la elaboración del postre favorito de Colombia. Tres Riches® es tu arma secreta para preparar flanes, gelatinas, salsas, espejos, arroz con leche, bebidas, tortas y postres tres leches. Porque tu imaginación no tiene límites', '*Facilita la operación en un solo producto listo para usar con el sabor, color y aroma del tradicional jarabe tres leches *Consistencia y densidad ideal para absorberse y retenerse en la esponja (bizcochuelo) *Reduce la merma y estandariza tus recetas *Su versatilidad te permite preparar desde la clásica torta tres leches hasta flanes, gelatinas o bebidas', 13900, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 13000, 6, 12000, 12, NULL, NULL, 'img/articulos/7709623172127.png', 100),
(1758, '7709623172158', 'CHANTILLY WHIP TOPPING BASE  X L  RICH -CREMA BETTER         ', 'Explota tu pasión sin límites con Whip Topping® Base, un concentrado neutro que se puede diluir o mezclar, dándole tu personalidad a todas tus creaciones. Combínala con ingredientes como leche, agua, licor, ácidos, frutas o pulpas y crea infinitas posibilidades con tu toque secreto', '*Estable a temperatura ambiente (<25° C) manteniendo su apariencia y sabor *Resistente a altas temperaturas en tu área de trabajo *Se puede congelar después de batida *Por su suave y uniforme textura es muy fácil de usar y te permite decorar aún sin ser experto *¡Es la crema de la celebración! Puedes agregarle color y los mantendrá vivos y brillantes *Además por su resistencia y estabilidad te permite realizar las formas y figuras de bulto como flores, rosetones, moños, animales y demás figuras que quieras agregar a tu decoración *Es de origen vegetal, naturalmente libre de colesterol y de grasa trans', 14900, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 13900, 6, 13000, 12, NULL, NULL, 'img/articulos/7709623172158.png', 100),
(1759, '7709990087819', 'BETTER CHOCOLATE RICHS', 'Inspírate con Bettercreme® Chocolate y disfruta de su delicioso sabor. Divertida, rica y llena de posibilidades, Bettercreme® es la línea de cremas de sabores que te permite hacer piezas maestras destacando ese gusto por los detalles que tanto te caracteriza', '', 15000, 'Und', 5, 'NORMAL', 34, 108, 1, 5, 14000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990087819.png', 100),
(1760, '7709990794687', 'BETTER SUPREMO X L RICHS', 'Inspírate con Bettercreme® Supremo y disfruta de su delicioso sabor intenso a vainilla. Divertida, rica y llena de posibilidades, Bettercreme® es la línea de cremas de sabores que te permite hacer piezas maestras destacando ese gusto por los detalles que tanto te caracteriza', '*Estable a temperatura ambiente (<25° C) manteniendo su apariencia y sabor *Resistente a altas temperaturas en tu área de trabajo *Se puede congelar después de batida *Por su suave y uniforme textura es muy fácil de usar y te permite decorar aún sin ser experto *¡Es la crema de la celebración! Puedes agregarle color y los mantendrá vivos y brillantes *Además por su resistencia y estabilidad te permite realizar las formas y figuras de bulto como flores, rosetones, moños, animales y demás figuras que quieras agregar a tu decoración *Es de origen vegetal, naturalmente libre de colesterol y de grasa trans', 15000, 'Und', 5, 'NORMAL', 34, 108, 1, 5, 14000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7709990794687.png', 100),
(1761, '7898215601166', 'CHANTILLY AMBIENTE PURATOS X LITRO LEVAPAN KK', 'Ambiante es una crema vegetal de gran consistencia con azúcar incorporado, especial para decoraciones con sabor dulce. Tiene sabor muy agradable y una estabilidad perfecta por aquellos usos que requieren detalles y toques de gran delicadez', '*Perfecta estabilidad\n*Cobertura uniforme\n*Fácil de usar\n*Mayor rendimiento que las natas de origen animal\n*Permite la adición de sabores para rellenos, ganache, etc.\n*Acepta la incorporación de cítricos, saborizantes y colorantes\n*Textura lisa, suave y duradera *Sabor delicioso - No es grasosienta\nTextura lisa, suave y agradable.', 16000, 'Und', 5, 'NORMAL', 34, 108, 1, 5, 15000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7898215601166.png', 100),
(1762, 'CREMA', 'CREMA PASTELERA PRODIA', 'Con NUESTRO MIX, solo agregando agua o leche, podrás obtener una deliciosa crema artesanal, Relleno o decoración para productos de repostería y panadería.', '*Se le pueden incorporar saborizantes y/o colorantes líquidos\n*Suave y fácil de manejar\n*Rápida preparación\n*Excelente sabor', 24, 'Gr', 5, 'NORMAL', 34, 108, 1, 5, 23, 4000, NULL, NULL, NULL, NULL, 'img/articulos/CREMA.png', 250),
(1763, 'PASK', 'PASTILLAJE FONDANT X K ', 'Cubierta lista que brinda un excelente molde para preparar toda linea pastelera como sus tortas, ponques, galletas, cupcakes', '', 14000, 'Und', 5, 'NUEVO', 34, 108, 1, 5, 13500, 3, NULL, NULL, NULL, NULL, 'img/articulos/PASK.png', 100),
(1764, '7707062511118', 'MIXO POTE X 2.5K LEVAPAN', 'Gel a base de emulsificantes, que funciona como suavizador de miga y retenedor de frescura para panes, panetones, tortas y ponqué', '*Batidos de ponqués que lleven de un 50 % al 60 % de grasa: 1 % al 3 % sobre el peso de la harina utilizada, dependiendo de la cantidad de huevos y la calidad y cantidad de margarina usada.\n*Panes: 1 % al 3 % sobre el peso de la harina utilizada, dependiendo de la cantidad y calidad de la margarina usada', 52000, 'Und', 5, 'NORMAL', 34, 101, 1, 5, 51000, 3, NULL, NULL, NULL, NULL, 'img/articulos/7707062511118.png', 100),
(1765, 'MIXO82', 'MIXO DE PURATOS A GRANEL X 15K LEVAPAN ', 'Gel a base de emulsificantes diseñado para incrementar la incorporación de aire en el batido de tortas esponjosas, ponqué y panes, mejora la suavidad y textura de estos productos al mismo tiempo que disminuye el tiempo de batido', '*Produce una miga más suave, fina y homogénea.\n*Mejora el volumen de las tortas y ponqués.\n*Aumenta el tiempo de frescura.\n*Acorta el tiempo de batido hasta en un 70%', 30, 'Gr', 5, 'NUEVO', 34, 101, 1, 5, 28, 3000, NULL, NULL, NULL, NULL, 'img/articulos/MIXO82.png', 100),
(1766, '0003', 'GRAGEAS ESPECIALES PERLADAS ', '', '', 70, 'Gr', 5, 'NORMAL', 1, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0003.png', 100),
(1767, '7441112100104', 'MASMELOS BLANCOS ', '', '', 18, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 17, 3000, NULL, NULL, NULL, NULL, 'img/articulos/7441112100104.png', 250),
(1768, '7590011151110', 'OREO PAQ 12 ', '', '', 9500, 'Und', 5, 'NORMAL', 34, 119, 1, 5, 8500, 3, NULL, NULL, NULL, NULL, 'img/articulos/7590011151110.png', 100),
(1769, '7702007028966', 'CHIPS MARRON NUTRESA K  CB', '', '', 26, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 24, 6000, NULL, NULL, NULL, NULL, 'img/articulos/7702007028966.png', 250),
(1770, '7702007028973', 'CHIPS DE CHOCOLATE BLANCO', '', '', 28, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 26, 6000, NULL, NULL, NULL, NULL, 'img/articulos/7702007028973.png', 250),
(1771, '7702007039566', 'MM PEQUEÑO X KILO NUTRESA CB', 'Chocolate de leche recubierto con una capa de dulce de colores: Verde, azul, rojo, amarillo y blanco', '', 36, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 34, 3000, NULL, NULL, NULL, NULL, 'img/articulos/7702007039566.png', 250),
(1772, '7702025123285', 'RECREO TRITURADA ', '', '', 18000, 'Und', 5, 'NORMAL', 34, 119, 1, 5, 17000, 6, NULL, NULL, NULL, NULL, 'img/articulos/7702025123285.png', 100),
(1773, '7702117010141', 'MONEDA DORADA X 328 UND', 'Monedas de chocolate de leche en una presentación para compartir y disfrutar', '', 200, 'Und', 5, 'NORMAL', 34, 119, 1, 5, 52000, 328, NULL, NULL, NULL, NULL, 'img/articulos/7702117010141.png', 100),
(1774, '7707062522114', 'CHIPS LUKER', '', '', 24, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 23, 6000, NULL, NULL, NULL, NULL, 'img/articulos/7707062522114.png', 250),
(1775, '7896497202385', 'FLOCOS NEGROS', '', '', 35, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 32, 3000, NULL, NULL, NULL, NULL, 'img/articulos/7896497202385.png', 100),
(1776, '7897077820678', 'LLUVIA DE COLORES CHOCOLATE  X 10K CB', 'Es perfecto para pasteles, panes, pizzas dulces o cualquier otro tipo de receta que necesite ser llevada al horno. Tiene una buena resistencia al calor y mantiene su integridad, sin desaparecer en la masa', '*Añadir en la masa y llevar al horno *ideal para decoracion ', 22, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 21, 10000, NULL, NULL, NULL, NULL, 'img/articulos/7897077820678.png', 100),
(1777, 'ARRBL02', 'ARROZ SOPLADO BLANCO X KILO NUTRESA CB', '', '', 19, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 18, 3000, NULL, NULL, NULL, NULL, 'img/articulos/ARRBL02.png', 250),
(1778, 'ARRCHO01', 'ARROZ SOPLADO CHOCONUBIS  X 18 K CB                  ', '', '', 16, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 14, 3000, NULL, NULL, NULL, NULL, 'img/articulos/ARRCHO01.png', 250),
(1779, 'CHIPC', 'CHIPS COLORES', '', '', 30, 'Gr', 5, 'NUEVO', 34, 119, 1, 5, 27, 3000, NULL, NULL, NULL, NULL, 'img/articulos/CHIPC.png', 250),
(1780, 'CHOCL', 'CHOCOCEREAL ', '', '', 40, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 38, 1000, 35, 3000, NULL, NULL, 'img/articulos/CHOCL.png', 100),
(1781, 'CHOCOGALLE', 'CHOCOGALLETA ', 'Crujientes galletas con sabor a leche condensada, recubiertas de chocolate de colores surtidos', '', 40, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 38, 1000, 35, 3000, NULL, NULL, 'img/articulos/CHOCOGALLE.png', 100),
(1782, 'CHOCOMANI', 'CHOCOMANI', 'Producto hecho a base de maní recubierto con una capa exterior de chocolate de colores', '', 40, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 38, 1000, 35, 3000, NULL, NULL, 'img/articulos/CHOCOMANI.png', 100),
(1783, 'CHOCORAZ', 'CHOCORAZON', 'pequeños corazones recubiertos de chocolate de colores', '', 40, 'Gr', 5, 'NUEVO', 34, 119, 1, 5, 38, 1000, 35, 3000, NULL, NULL, 'img/articulos/CHOCORAZ.png', 100),
(1784, 'CHOCOU', 'CHOCOUVAS', 'Producto hecho a base de uvas deshidratadas, recubierto con una capa exterior de chocolate', '', 35, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 30, 1000, 28, 3000, NULL, NULL, 'img/articulos/CHOCOU.png', 100),
(1785, 'COCAB46', 'COCO CABELLO DE ANGEL  X KILO        ', 'Partículas en corte de tirillas finas de coco deshidratado que van desde 1 cm de largo de acuerdo a necesidades de nuestros clientes', '', 17, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 16.5, 25000, NULL, NULL, NULL, NULL, 'img/articulos/COCAB46.png', 100),
(1786, 'CRISTALES', 'CRISTALES DORADOS Y PLATEADOS', '', '', 100, 'Gr', 5, 'NUEVO', 34, 119, 1, 5, 80, 3000, NULL, NULL, NULL, NULL, 'img/articulos/CRISTALES.png', 100),
(1787, '', 'CRISTALES DE COLORES ', '', '', 80, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 60, 3000, NULL, NULL, NULL, NULL, 'img/articulos/.png', 100),
(1788, 'FLOCOS', 'FLOCOS BLANCOS ', '', '', 35, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 32, 3000, NULL, NULL, NULL, NULL, 'img/articulos/FLOCOS.png', 100),
(1789, 'GOM', 'GOMITAS ESPECIALES (CORAZONES BANANOS VERDES)', '', '', 40, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 38, 2000, NULL, NULL, NULL, NULL, 'img/articulos/GOM.png', 100),
(1790, 'GOM2', 'GOMITAS EKO (COLORES SURTIDOS )', '', '', 24, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 23, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GOM2.png', 100),
(1791, 'GOMA01', 'GOMITAS (GUSANOS AROS )', '', '', 28, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 27, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GOMA01.png', 100),
(1792, 'GRACOITA', 'GRAGEA DE COLORES ITALO CB', 'Gragea de azúcar cubierta de dulce de colores', '*explocion de colores en tus recetas', 10, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 9, 6000, NULL, NULL, NULL, NULL, 'img/articulos/GRACOITA.png', 100),
(1793, 'GRAES', 'GRAGEAS ESPECIALES JUMMIES', '', '', 120, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 110, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAES.png', 100),
(1794, 'GRAGEAS', 'GRAGEAS SPRINKLES ', '', '', 160, 'Gr', 5, 'NUEVO', 34, 119, 1, 5, 140, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAGEAS.png', 100),
(1795, 'GRANULADO', 'GRANULADO TOPPING ', '', '', 35, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 33, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRANULADO.png', 100),
(1796, 'GRAPER', 'GRAGEAS EXTRA GRANDES ', '', '', 80, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 70, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAPER.png', 100),
(1797, 'GRAPERVA', 'GRAGEA PERLADAS ', '', '', 60, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 50, 5000, NULL, NULL, NULL, NULL, 'img/articulos/GRAPERVA.png', 100),
(1798, 'GRASURT', 'GRAGEA SURTIDOS PEQ  COLORISA', '', '', 18, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 16, 6000, NULL, NULL, NULL, NULL, 'img/articulos/GRASURT.png', 100),
(1799, 'GRAVAPEQ', 'GRAGEA PERLADAS PEQUEÑAS', '', '', 60, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 50, 6000, NULL, NULL, NULL, NULL, 'img/articulos/GRAVAPEQ.png', 100),
(1800, 'LLUCHO11', 'LLUVIA DE CHOCOLATE   X K X 10K CB', 'Es perfecto para pasteles, panes, pizzas dulces o cualquier otro tipo de receta que necesite ser llevada al horno. Tiene una buena resistencia al calor y mantiene su integridad, sin desaparecer en la masa', '*Añadir en la masa y llevar al horno *ideal para decoracion ', 22, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 21, 10000, NULL, NULL, NULL, NULL, 'img/articulos/LLUCHO11.png', 100),
(1801, 'MASME', 'MASMELOS COLORES', '', '', 24, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 22, 2000, NULL, NULL, NULL, NULL, 'img/articulos/MASME.png', 250),
(1802, 'MINICHI60', 'CHICLES MINI      X     K', '', '', 20, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 18, 3000, NULL, NULL, NULL, NULL, 'img/articulos/MINICHI60.png', 100),
(1803, 'MYMGRA08', 'MM GRANDE TOBI COLORES X  7,5 K ITALO', 'Chocolate de leche recubierto con una capa de dulce de colores: Verde, azul, rojo, amarillo y blanco', '*usalo para decorar tus tortas postres, tambien lo puedes usar en helados', 30, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 28, 3000, NULL, NULL, NULL, NULL, 'img/articulos/MYMGRA08.png', 250),
(1804, 'PIRUCOR05', 'PIRULITO TUBITO BARQUILLO  X 100 UND CORTO', '', '', 3500, 'UND', 5, 'NORMAL', 34, 119, 1, 5, 3200, 12, NULL, NULL, NULL, NULL, 'img/articulos/PIRUCOR05.png', 100),
(1805, 'SPRINK', 'GRAGEA MAVERICO SPRINKLES', '', '', 80, 'Gr', 5, 'NORMAL', 34, 119, 1, 5, 70, 3000, NULL, NULL, NULL, NULL, 'img/articulos/SPRINK.png', 100),
(1806, 'GRAFI001', 'JUEGO DE MOLDES BAJOS', 'PRÁCTICOS E INDISPENSABLES PARA ACOMPAÑARTE JUNTO A TODAS TUS PREPARACIONES EN LA LINEA DE REPOSTERÍA Y PANADERÍA', '', 46000, 'Und', 3, 'NORMAL', 35, 104, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF001.png', 100),
(1807, 'GRAFI002', 'MOLDE MINI CUP CAKES', 'PRÁCTICOS E INDISPENSABLES PARA ACOMPAÑARTE JUNTO A TODAS TUS PREPARACIONES EN LA LINEA DE REPOSTERÍA Y PANADERÍA', '', 34000, 'Und', 4, 'NORMAL', 35, 104, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF002.png', 100),
(1808, 'GRAFI003', 'MOLDE CON ARO DESMONTABLE PRESS', 'PRÁCTICOS E INDISPENSABLES PARA ACOMPAÑARTE JUNTO A TODAS TUS PREPARACIONES EN LA LINEA DE REPOSTERÍA Y PANADERÍA', '', 42000, 'Und', 3, 'NUEVO', 35, 104, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF003.png', 100),
(1809, 'GRAFI004', 'GRAMERA DIGITAL', 'PRÁCTICOS E INDISPENSABLES PARA ACOMPAÑARTE JUNTO A TODAS TUS PREPARACIONES EN LA LINEA DE REPOSTERÍA Y PANADERÍA', '', 30000, 'Und', 2, 'NORMAL', 35, 104, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF004.png', 100),
(1810, 'GRAFI005', 'TOPPERS ACRÍLICO', 'PRÁCTICOS E INDISPENSABLES PARA ACOMPAÑARTE JUNTO A TODAS TUS PREPARACIONES EN LA LINEA DE REPOSTERÍA Y PANADERÍA', '', 17000, 'Und', 4, 'NORMAL', 35, 104, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF005.png', 100),
(1811, 'GRAFI006', 'JUEGO DE BOQUILLAS', 'PRÁCTICOS E INDISPENSABLES PARA ACOMPAÑARTE JUNTO A TODAS TUS PREPARACIONES EN LA LINEA DE REPOSTERÍA Y PANADERÍA', '', 165000, 'Und', 3, 'NORMAL', 35, 104, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF006.png', 100),
(1812, 'GRAFI007', 'ALISADOR DE FONDANT', 'PRÁCTICOS E INDISPENSABLES PARA ACOMPAÑARTE JUNTO A TODAS TUS PREPARACIONES EN LA LINEA DE REPOSTERÍA Y PANADERÍA', '', 9000, 'Und', 4, 'NORMAL', 35, 104, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF007.png', 100),
(1813, 'GRAFI008', 'MOLDE PAN TAJADO 27 X 15 PRESS', 'PRÁCTICOS E INDISPENSABLES PARA ACOMPAÑARTE JUNTO A TODAS TUS PREPARACIONES EN LA LINEA DE REPOSTERÍA Y PANADERÍA', '', 26000, 'Und', 3, 'NUEVO', 35, 104, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF008.png', 100),
(1814, 'GRAFI009', 'PORCIONADOR DE TORTA ', 'PRÁCTICOS E INDISPENSABLES PARA ACOMPAÑARTE JUNTO A TODAS TUS PREPARACIONES EN LA LINEA DE REPOSTERÍA Y PANADERÍA', '', 18000, 'Und', 2, 'NORMAL', 35, 104, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF009.png', 100),
(1815, 'GRAFI010', 'AMAPOLA SEMILLA', '', '*ÁCIDOS GRASOS SALUDABLES*MINERALES*BUENA PARA LA SALUD DEL CORAZÓN*AYUDAN A REFORZAR LAS DEFENSAS*VITAMINAS*FIBRA*OMEGA-3 Y OMEGA-6', 90, 'Gr', 5, 'NUEVO', 39, 121, 1, 5, 75, 3000, 70, 25000, NULL, NULL, 'img/articulos/GRAF010.png', 100),
(1816, 'GRAFI011', 'CALABAZA SEMILLAS', '', '*SON ALIADAS PARA COMBATIR LA DIABETES*TIENE GRASAS SALUDABLES Y ANTIOXIDANTES*OMEGA-3*AYUDAN A FORTALECER EL SISTEMA INMUNOLÓGICO*ANTIINFLAMATORIO*AYUDAN A TENER UN SUEÑO REPARADOR*BUENA PARA LA SALUD DEL CORAZÓN*AYUDAN A TENER UNA PRÓSTATA SALUDABLE', 90, 'Gr', 4, 'NORMAL', 39, 121, 1, 4, 75, 3000, 70, 10000, NULL, NULL, 'img/articulos/GRAF036.png', 100),
(1817, 'GRAFI012', 'CHIA', '', '*MEJORA LOS NIVELES DE AZÚCAR EN LA SANGRE*EXCELENTE FUENTE DE FIBRA Y ANTIOXIDANTE*AYUDAN A LA DIGESTIÓN*RICAS EN CALCIO PROTEÍNAS Y ÁCIDOS GRASOS OMEGA 3*REDUCE LOS ANTOJOS*REFUERZA LA RESISTENCIA', 30, 'Gr', 5, 'NORMAL', 39, 121, 1, 5, 25, 3000, 22, 25000, NULL, NULL, 'img/articulos/GRAF038.png', 100),
(1818, 'GRAFI013', 'AJONJOLI BLANCO', '', '*EXCELENTE FUENTE DE MINERALES*MEJORA LA SALUD ÓSEA*COMBATEN SINTOMAS PREMESTRUALES*REDUCE INFLAMACIÓN*AYUDAN A DISMINUIR EL COLESTEROL MALO*PROTEGEN CÉLULAS DEL COLON', 17, 'Gr', 3, 'NUEVO', 39, 121, 1, 3, 16, 3000, 15, 25000, NULL, NULL, 'img/articulos/GRAF008.png', 100),
(1819, 'GRAFI014', 'AJONJOLI NEGRO', '', '*EXCELENTE FUENTE DE MINERALES*MEJORA LA SALUD ÓSEA*COMBATEN SINTOMAS PREMESTRUALES*REDUCE INFLAMACIÓN*AYUDAN A DISMINUIR EL COLESTEROL MALO*PROTEGEN CÉLULAS DEL COLON', 65, 'Gr', 2, 'NORMAL', 39, 121, 1, 2, 60, 3000, 58, 10000, NULL, NULL, 'img/articulos/GRAF009.png', 100),
(1820, 'GRAFI015', 'QUINUA ', '', '*ANTI CANCERÍGENO*MEJORA LA PIEL*AYUDA A ADELGAZAR*REDUCE EL COLESTEROL*ANTIINFLAMATORIO*FUENTE DE VITAMINAS*MEJORA EL SUEÑO*RICA EN FIBRA', 20, 'Gr', 4, 'NORMAL', 39, 121, 1, 4, 18, 3000, 17, 25000, NULL, NULL, 'img/articulos/GRAF089.png', 100),
(1821, 'GRAFI016', 'LINAZA ENTERA ', '', '*MEJORA LA DIGESTIÓN*AYUDA A ADELGAZAR*REDUCE EL COLESTEROL*RICO EN OMEGA 3*REGÚLA EL AZÚCAR EN LA SANGRE*PROTEGE EL CORAZÓN', 10, 'Gr', 3, 'NUEVO', 39, 121, 1, 3, 9, 6000, 8.5, 25000, NULL, NULL, 'img/articulos/GRAF067.png', 100),
(1822, 'GRAFI017', 'GIRASOL', '', '*ANTICANCERÍGENO*IDEAL PARA EMBARAZO*REDUCE LA FATIGA*RICA EN MINERALES*FORTALECE LOS HUESOS*PREVIENE ENFERMEDADES*MEJORA EL FUNCIONAMIENTO CEREBRAL*FORTALECE EL SISTEMA INMUNOLÓGICO', 30, 'Gr', 4, 'NORMAL', 39, 121, 1, 2, 28, 3000, 26, 10, NULL, NULL, 'img/articulos/GRAF052.png', 100),
(1823, 'GRAFI018', 'CÁÑAMO', '', '*RICA EN OMEGA 3 Y 6*ALIVIA PROBLEMAS DE LA PIEL *MEJORA LA DIGESTIÓN*REDUCE SÍNTOMAS PREMENSTRUALES Y MENOPAÚSICOS*PROTEÍNAS*VITAMINAS A,B,C,D,E Y GRUPO B', 200, 'Gr', 5, 'NORMAL', 39, 121, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF037.png', 100),
(1824, 'GRAFI019', 'SANDIA ', 'SON UNA FUENTE DE ENERGÍA IMPORTANTE. SE TRATA DE UN ALIMENTO RECOMENDADO PARA PERSONAS QUE DESARROLLAN UNA ALTA ACTIVIDAD FÍSICA, AL TIEMPO QUE SON RICAS EN PROTEÍNAS, QUE PERMITEN EL DESARROLLO MUSCULAR Y LA REGENERACIÓN DE TEJIDOS.', '', 70, 'Gr', 4, '', 39, 121, 1, 4, 68, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF095.png', 100),
(1825, 'GRAFI020', 'AMARANTO', '', '\n*ALTO CONTENIDO DE HIERRO Y LISINA*FORTALECE EL SISTEMA ÓSEO*EXCELENTE FUENTE DE PROTEÍNA VEGETAL*ALTO CONTENIDO DE POTASIO Y FOSFATO*FORTALECE LA SALUD PULMONAR*FUENTE DE ÁCIDO FÓLICO\n', 40, 'Gr', 5, '', 39, 121, 1, 3, 38, 3000, 36, 10000, NULL, NULL, 'img/articulos/GRAF016.png', 100),
(1826, 'GRAFI021', 'ACEITE DE AJONJOLI X 250 ML', '', '*ALIVIA LA HEPATITI*SALIVIA LA MIGRAÑA*PREVIENE LA DIABETES*AFRODISIACO*AYUDA AL SISTEMA INMUNOLÓGICO', 35000, 'Und', 3, 'NUEVO', 32, 99, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1827, 'GRAFI022', 'ACEITE DE ALMENDRAS X 200 ML', '', '*ANTIOXIDANTE PARA LA PIEL*ANTINFLAMATORIO*AYUDA A LA CIRCULACIÓN*AYUDA A EL ESTREÑIMIENTO*AYUDA A LA DIABETES', 30000, 'Und', 5, 'NORMAL', 32, 99, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1828, 'GRAFI023', 'ACEITE DE COCO X 1000', '', '*AYUDA AL SISTEMA INMUNOLÓGICO*AYUDA A LA GASTRITIS*AYUDA AL COLON*AYUDA A LA PÉRDIDA DE PESO*PREVIENE LA DIABETES*LIMPIA, HIDRATA, NUTRE Y REJUVENECE.', 88000, 'Und', 4, 'NORMAL', 32, 99, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1829, 'GRAFI024', 'ACEITE DE LINAZA X 250 ML', '', '*ANTINFLAMATORIO*CONTROLA LA PRESIÓN ARTERIAL*EXCELENTE PARA EL CEREBRO*PREVIENE EL CÁNCER*ALIVIA LA DIABETES', 35000, 'Und', 3, 'NUEVO', 32, 99, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1830, 'GRAFI025', 'ACEITE DE MACADAMIA x 250ml', '', '*AYUDA AL SISTEMA CARDIOVASCULAR*EXCELENTE QUEMADOR DE GRASA*ANTIOXIDANTE PARA LA PIEL', 38000, 'Und', 3, 'NORMAL', 32, 99, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1831, 'GRAFI026', 'OLIVA', '', '*ELEVA LOS NIVELES DE COLESTEROL HDL (BUENO)*DISMINUYE EL COLESTEROL LDL C (COLESTEROL MALO)*BENEFICIA EL CONTROL DE LA HIPERTENSIÓN ARTERIAL.', 32000, 'Und', 2, 'NORMAL', 32, 99, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF086.png', 100),
(1832, 'GRAFI027', 'RICINO', '', '*LAXANTE*AYUDA AL CRECIMIENTO DE LAS CEJAS Y PESTAÑAS*ANTIINFLAMATORIO*AYUDA A COMBATIR LA ARTRITIS\n\n', 20000, 'Und', 4, 'NORMAL', 32, 99, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF092.png', 100),
(1833, 'GRAFI028', 'SASHA INCHI', '', '*ALTO CONTENIDO DE OMEGA 3 , 6 Y 9 ', 35000, 'Und', 5, 'NORMAL', 32, 99, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1834, 'GRAFI029', 'MORINGA', '', '*EFECTOS EMOLIENTES*NUTRITIVOS E HIDRATANTES SOBRE LA PIEL RICINO', 125000, 'UND', 5, 'NORMAL', 32, 99, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/GRAF083.png', 100),
(1835, 'GRAFI030', 'ACEITE DE AJONJOLI X 250 ML', '', '*ALIVIA LA HEPATITI*SALIVIA LA MIGRAÑA*PREVIENE LA DIABETES*AFRODISIACO*AYUDA AL SISTEMA INMUNOLÓGICO', 35000, 'Und', 3, 'NUEVO', 32, 99, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1836, 'GRAFI031', 'ACEITE DE ALMENDRAS X 200 ML', '', '*ANTIOXIDANTE PARA LA PIEL*ANTINFLAMATORIO*AYUDA A LA CIRCULACIÓN*AYUDA A EL ESTREÑIMIENTO*AYUDA A LA DIABETES', 30000, 'Und', 5, 'NORMAL', 32, 99, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1837, 'GRAFI032', 'ACEITE DE COCO X 1000', '', '*AYUDA AL SISTEMA INMUNOLÓGICO*AYUDA A LA GASTRITIS*AYUDA AL COLON*AYUDA A LA PÉRDIDA DE PESO*PREVIENE LA DIABETES*LIMPIA, HIDRATA, NUTRE Y REJUVENECE.', 88000, 'Und', 4, 'NORMAL', 32, 99, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1838, 'GRAFI033', 'ACEITE DE LINAZA X 250 ML', '', '*ANTINFLAMATORIO*CONTROLA LA PRESIÓN ARTERIAL*EXCELENTE PARA EL CEREBRO*PREVIENE EL CÁNCER*ALIVIA LA DIABETES', 35000, 'Und', 3, 'NUEVO', 32, 99, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1839, 'GRAFI034', 'ACEITE DE MACADAMIA x 250ml', '', '*AYUDA AL SISTEMA CARDIOVASCULAR*EXCELENTE QUEMADOR DE GRASA*ANTIOXIDANTE PARA LA PIEL', 38000, 'Und', 3, 'NORMAL', 32, 99, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1840, 'GRAFI035', 'VINAGRE', '', '', 38000, 'Und', 3, '', 33, 100, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1841, 'GRAFI036', 'MORINGA A GRANEL', '', '*APOYA LOS NIVELES NORMALES DE AZÚCAR EN LA SANGRE*PROVEE ENERGIA NATURAL*MEJORA EL FUNCIONAMIENTO DEL HIGADO Y RIÑON*MEJORA LA DIGESTIÓN*MEJORA EL SISTEMA CIRCULATORIO*MEJORA LA PIEL*DISMINUYE EL COLESTEROL', 150, 'Gr', 4, 'NUEVO', 36, 107, 1, 4, 140, 3000, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1842, 'GRAFI037', 'TE VERDE ', '', '*AYUDA A LA MEMORIA*DISMINUYE EL DETERIORO CAUSADO POR EL ALZAIMER Y EL PARKINSON*BRINDA UN EFECTO RELAJANTE Y TRANQUILIZANTE*EVITA LA CARIES Y ENFERMEDADES DENTALES*FORTALECE LOS HUESOS*AYUDA A COMBATIR CÉLULAS CANCERIGENAS*EVITA LA OBESIDAD*PREVIENE ENFERMEDADES DEL CORAZÓN*REDUCE EL COLESTEROL MALO DE LA SANGRE', 140, 'Gr', 3, 'NORMAL', 36, 107, 1, 3, 130, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF097.png', 100),
(1843, 'GRAFI038', 'STEVIA EN HOJA', '', '*PODEROSO ANTIOXIDANTE*AYUDA A DISMINUIR NIVELES DE ÁCIDO ÚRICO*MEJORA LA RESISTENCIA FRENTE A GRIPES Y REFRIADOS*BENEFICIOSA PARA PERSONAS HIPERTENSAS*ABSORCIÓN DE GRASAS*CONTRARESTA LA FATIGA Y LOS ESTADO DE ANCIEDAD*REDUCE EL DESEO AL TABACO Y EL ALCOHOL', 80, 'Gr', 2, 'NORMAL', 36, 107, 1, 2, 70, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF096.png', 100),
(1844, 'GRAFI039', 'MACA PULVERIZADA', '', '*PROMUEVE LA CLARIDAD MENTAL*COMBATE LA DIABETES*AUMENTA LA RESISTENCIA*MEJORA EL BIENESTAR FISICO Y EMOCIANAL*ALIVIA LOS SINTOMAS DE LA MENOPAUSIA*EQUILIBRA LAS HORMONAS*REALZA LA FERTILIDAD*TRATA LA DIFUCIÓN SEXUAL', 90, 'Gr', 3, 'NUEVO', 36, 107, 1, 3, 85, 3000, 750, 25000, NULL, NULL, 'img/articulos/GRAF068.png', 100),
(1845, 'GRAFI040', 'GINKGO BILOBA MOLIDO', '', '*PROTEGE AL CEREBRO DE ENFERMEDADES NEURODEGENERATIVAS*MEJORA LA CIRCULACIÓN DEL ORGANISMO*CONTRA LA CAIDA DEL PELO*CONCENTRACIÓN APRENDIZAJE MEMORIA', 90, 'Gr', 2, 'NORMAL', 36, 107, 1, 2, 85, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF050.png', 100),
(1846, 'GRAFI041', 'FLOR DE JAMAICA', '', '*PREVIENE Y COMBATE INFECCIONES RESPIRATORIAS*DESINTOXICANTES*MEJORA LA DIGESTIÓN*ANTIOXIDANTE*CONTIENE VITAMINAS Y MINERALES*LIMPIA EL HIGADO Y LOS RIÑONES*DEPURATIVA*COMBATE LA RESACA', 80, 'Gr', 3, 'NORMAL', 36, 107, 1, 3, 70, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF048.png', 100),
(1847, 'GRAFI042', 'GARBANZO TOSTADO ', '', '*MUY SALUDABLE PARA EL CORAZÓN*DISMINUYEN EL COLESTEROL*ENERGÉTICOS Y NUTRITIVOS*EXCELENTE FUENTE DE PROTEÍNA VEGETARIANA*MEJORA LA HIPERTENSIÓN', 30, 'Gr', 2, 'NORMAL', 38, 111, 1, 2, 29, 3000, 28, 5000, NULL, NULL, 'img/articulos/GRAF049.png', 100),
(1848, 'GRAFI043', 'CÚRCUMA   EN  POLVO  ', '', '*PREVIENE EL CÁNCER*ANTIOXIDANTE*ANTIINFLAMATORIO*MEJORA LA DIGESTIÓN Y LOS PROBLEMAS GÁSTRICOS*NIVELA EL AZÚCAR EN LA SANGRE', 70, 'Gr', 3, 'NORMAL', 36, 107, 1, 4, 65, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF042.png', 100),
(1849, 'GRAFI044', 'GINSENG', '', '*MEJORA EL ESTADO DE ÁNIMO Y EL BIENESTAR*AUMENTA LOS NIVELES DE ENERGÍA*MEJORA EL RENDIMIENTO MENTAL*REDUCE LAS HORMONAS DE ESTRÉS*COMBATE LOS ESTADOS DE CANSANCIO', 300, 'Gr', 4, 'NORMAL', 36, 107, 1, 5, 290, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF051.png', 100),
(1850, 'GRAFI045', 'ESPIRULINA EN POLVO', '', '*EQUILIBRA GLUCOSA EN LA SANGRE*REDUCE EL COLESTEROL*AYUDA A PREVENIR CÁNCER Y TUMORE*MEJORA EL SISTEMA INMUNOLÓGICO*PROTEÍNA COMPLETA*AYUDA CONTRA LAS ALERGIAS*ALTO EN HIERRO*IDEAL PARA DIETAS VEGETARIANAS', 300, 'Gr', 4, 'NORMAL', 36, 107, 1, 4, 290, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF045.png', 100),
(1851, 'GRAFI046', 'SAL MARINA ', '', '*ACTIVA LA CIRCULACIÓN*FORTALECE LOS HUESOS*COMBATE EL ASMA*EXFOLIANTE*APOYO A LA SALUD CARDIOVASCULAR*ALIVIA LOS DOLORES MUSCULARES', 35, 'Gr', 5, 'NORMAL', 36, 107, 1, 5, 30, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF093.png', 100),
(1852, 'GRAFI047', 'FENOGRECO MOLIDO', '', '*DIABETES *AUMENTA EL BUSTO*AYUDA ELIMINAR LA CASPA *CONGESTIÓN PULMONAR*TESTOSTERONA*ANTIBIÓTICO*COMBATE LAS INFECCIONES', 80, 'Gr', 3, 'NORMAL', 36, 107, 1, 5, 75, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF046.png', 100),
(1853, 'GRAFI048', 'SAL ROSADA DE HIMALAYA', '', '*REGULA EL PH DEL CUERPO*APOYO A LA SALUD CARDIOVASCULAR*MEJORA LOS HÁBITOS DEL SUEÑO*AYUDA A BAJARLA PRESIÓN ARTERIAL*EQUILIBRA LOS NIVELES DE AZÚCAR EN LA SANGRE*PREVIENE LOS CALAMBRES MUSCULARES*DESINTOXICANTE*POTENCIA EL SABOR DE LOS ALIMENTOS', 70, 'Gr', 5, 'NORMAL', 36, 107, 1, 3, 65, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF094.png', 100),
(1854, 'GRAFI049', 'JENGIBRE EN POLVO', '', '*PREVIENE LA ACIDEZ*MEJORA EL SUEÑO*ANTIGRIPAL*REDUCE LAS NÁUSEAS*PREVIENE LA MIGRAÑA *CALMANTE*REDUCE EL COLESTEROL*ANTIINFLAMATORIO*ANTICANCERÍGENO', 60, 'Gr', 5, 'NORMAL', 36, 107, 1, 1, 55, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF066.png', 100),
(1855, 'GRAFI050', 'AZAFRÁN ', '', '*AYUDA A ELIMINAR Y A PREVENIR LOS GASES INTESTINALES*CONTRIBUYE A ALIVIAR LOS CALAMBRES, LAS CONTRACTURAS Y LOS ESPASMOS*ANTIINFLAMATORIA*ELIMINA LAS BACTERIAS EN EL ORGANISMO*ANTIOXIDANTE*ALIVIA LOS DOLORES TANTO DE CABEZA, MENSTRUALES Y MUSCULARES*REDUCE EL ESTRÉS, LA ANSIEDAD Y LA DEPRESIÓN', 18, 'Gr', 3, 'NORMAL', 36, 107, 1, 4, 16, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF019.png', 100),
(1856, 'GRAFI051', 'ACAI', '', '*POTENCIA LA FUNCIÓN SEXUAL*AYUDA A PERDER PESO*MEJORA LA VISIÓN*REFUERZA LAS DEFENSAS*FORTALECE EL SISTEMA NERVIOSO APORTA VITAMINAS Y MINERALES*AYUDA EN LAS DIGESTIONES*RETRASA EL ENVEJECIMIENTO', 300, 'Gr', 3, 'NORMAL', 36, 107, 1, 4, 280, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF002.png', 100),
(1857, 'GRAFI052', 'GUARANÁ', '', '*PÉRDIDA DE PESO*REDUCIR LA ALTA PRESIÓN ARTERIAL*MEJORA EL RENDIMIENTO DEPORTIVO*POTENCIA SEXUAL*MEMORIA Y CONCENTRACIÓN*EFECTOS ANTIDEPRESIVOS*FATIGA MIGRAÑA Y DOLORES DE CABEZA', 200, 'Gr', 4, 'NORMAL', 36, 107, 1, 3, 180, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF053.png', 100),
(1858, 'GRAFI053', 'HARINA DE CENTENO ', '', '*PODER PARA AYUDARTE A PERDER PESO*AUMENTANDO LA EFICIENCIA DEL SISTEMA DIGESTIVO*PREVIENE LAS PIEDRAS BILIARES*REDUCE EL RIESGO DE DIABETES*REGULA LA PRESIÓN EN SANGRE \n', 22, 'Gr', 4, 'NORMAL', 36, 107, 1, 4, 20, 4000, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 250),
(1859, 'GRAFI054', 'HARINA DE LENTEJA', '', '*BAJO APORTE DE CALORÍAS Y CARBOHIDRATOS*BAJO APORTE DE GRASAS*BUENA FUENTE DE PROTEÍNA, FIBRA HIERRO Y POTASIO*ALTO CONTENIDO DE VITAMINA B6*NATURALMENTE EXENTA DE GLUTEN\n', 13, 'Gr', 3, 'NORMAL', 36, 107, 1, 3, 12, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF057.png', 250),
(1860, 'GRAFI055', 'HARINA DE SEMOLA', '', '*ALTO CONTENIDO EN VITAMINA K*AYUDA A CUIDAR EL SISTEMA CARDIOVASCULAR Y BENEFICIA LA CIRCULACIÓN.\n\n', 18, 'Gr', 2, 'NORMAL', 36, 107, 1, 2, 17, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF059.png', 250),
(1861, 'GRAFI056', 'HARINA DE COCO ', '', '*PRODUCTO 100% NATURAL, ELABORADO A PARTIR DE\nLA FIBRA DE COCO.*LIBRE DE GLUTEN, IDEAL PARA REEMPLAZAR LAHARINA DE TRIGO.*POR SU ALTO PORCENTAJE DE FIBRA 54 PORCIENTO ES IDEALPARA MEJORAR CONDICIONES DEL SISTEMADIGESTIVO.*GRACIAS A SU DELICIOSO SABOR ES PERFECTA PARATODO TIPO DE RECETAS.\n\n\n\n', 30, 'Gr', 3, 'NORMAL', 36, 107, 1, 3, 28, 4000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF055.png', 250),
(1862, 'GRAFI057', 'HARINA DE QUINOA', '', 'LA HARINA DE QUINUA TIENE MAYOR CONTENIDO Y\nCALIDAD PROTEICA QUE OTRAS HARINAS DE CEREALES\nCOMO EL TRIGO Y EL MAÍZ.*CON LA HARINA DE QUINUA PUEDES PREPARAR POSTRES, AREPAS, CREPS, PANCAKES O ADICIONARLA\nEN LAS SALSAS Y CREMAS PARA DAR MÁS ESPESOR.\n\n\n', 30, 'Gr', 4, 'NORMAL', 36, 107, 1, 4, 28, 4000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF058.png', 250),
(1863, 'GRAFI058', 'HARINA DE GARBANZO ', '', '*ES RICA EN FIBRA.\n*ES UNA EXCELENTE FUENTE DE PROTEÍNAS DE ORIGEN VEGETAL.*APORTA HIDRATOS DE CARBONO DE LIBERACIÓN LENTA.*EN CUANTO A MINERALES CONTIENE, SOBRE TODO, MAGNESIO Y POTASIO.*RESPECTO A VITAMINAS, APORTA ÁCIDO FÓLICO (VITAMINA B9) Y OTRAS *VITAMINAS DEL GRUPO B, EXCEPTO B12.\n', 18, 'Gr', 3, 'NORMAL', 36, 107, 1, 3, 17, 4000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF056.png', 250),
(1864, 'GRAFI059', 'HARINA DE ALMENDRAS', '', '*TU CORAZÓN TE LO AGRADECERÁ*GRAN APORTE ENERGETICO A TU CUERPO*LA HARINA DE ALMENDRAS NO ENGORDA*AYUDA A REGULAR EL AZUCAR DE LA SANGRE*TIENE PROPIEDADES ANTICANCERIGENAS*CUIDADO DE PIEL, CABELLO Y UÑAS', 75, 'Gr', 3, 'NUEVO', 36, 107, 1, 3, 72, 2000, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 250),
(1865, 'GRAFI060', 'HARINA DE AMARANTO', '', '', 30, 'Gr', 4, 'NORMAL', 36, 107, 1, 4, 28, 2000, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 250),
(1866, 'GRAFI061', 'HARINA DE ARROZ', '', '*APORTA ENERGIA*REGULA LA FUNCIÓN INSTESTINAL*APOYA A CONTROLAR EL COLESTEROL*AYUDA A PERDER PESO*BUENA PARA LOS DIABETICOS*NO ACIDIFICA LA SANGRE*CONTIENE ANTIOXIDANTES*PREVIENE CANCER DE COLON', 10, 'Gr', 5, 'NUEVO', 36, 107, 1, 5, 9, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF060.png', 250),
(1867, 'GRAFI062', 'HARINA DE ARROZ INTEGRAL', '', '', 25, 'Gr', 3, 'NORMAL', 36, 107, 1, 3, 23, 4000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF061.png', 250),
(1868, 'GRAFI063', 'HARINA DE AVENA INTEGRAL', '', '*ALTO CONTENIDO DE ANTIOXIDANTES*EXCELENTE FUENTE DE FIBRA PARA EL COLON*AYUDA A CONTROLAR LOS PICOS DE GLUCEMIA*ESTREÑIMIENTO*EXCELENTE ALIMENTO PARA HACER DIETA', 22, 'Gr', 4, 'NORMAL', 36, 107, 1, 4, 21, 4000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF062.png', 250),
(1869, 'GRAFI064', 'HARINA DE SOYA', '', '', 13, 'Gr', 5, 'NUEVO', 36, 107, 1, 5, 12, 4000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF064.png', 250),
(1870, 'GRAFI065', 'HARINA TOSTADA SACHA INCHI', '', '*AUMENTA NOTABLEMENTE LA RESISTENCIA DEL CUERPO, MEJORA LA CIRCULACIÓN DE LA SANGRE*MINIMIZA EL COLESTEROL MALO (TIPO LDL) Y POTENCIA EL REGISTRO DE COLESTEROL BUENO (HDL)*DE IGUAL FORMA, EL SACHA INCHI FORTALECE EL SISTEMA CARDIOVASCULAR*POSEE ALTOS REGISTROS DE OMEGA 3, REDUCIENDO LA POSIBILIDAD DE SUFRIR ALGUNA ENFERMEDAD CARDÍACA*SIRVE PERDER PESO Y REDUCIR MEDIDAS*PROMUEVE UNA MEJOR VISIÓN, PREVIENE EL PROCESO DEGENERATIVO DE LA PIEL Y MINIMIZA EL POTENCIAL DE SUFRIR DIABETES TIPO II*REDUCE LOS PROBLEMAS HORMONALES EN LA MUJER*RETRASA EL PROCESO DE ENVEJECIMIENTO*COMBATE EL CANSANCIO, STRESS, AGOTAMIENTO NERVIOSO O MENTAL, INSOMNIO*APORTA EN EL TRATAMIENTO DE CROHN (INFLAMACIÓN DEL COLON).', 24, 'Gr', 5, 'NORMAL', 36, 107, 1, 5, 22, 2000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF063.png', 250),
(1871, 'GRAFI066', 'MEZCLAS', '', '', 24000, 'Und', 5, 'NORMAL', 36, 107, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 250),
(1872, 'GRAFI067', 'CARAMELOS NATURALES', '', '', 24000, 'Und', 5, 'NORMAL', 36, 107, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'img/articulos/0.png', 100),
(1873, 'GRAFI068', 'PISTACHOS SIN CÁSCARA \n', '', '*GRAN FUENTE DE PROTEÍNAS Y FIBRA*MEJORA LA SALUD DEL CORAZÓN*REDUCE LOS NIVELES DE AZÚCAR Y COLESTEROL*ANTIESTRÉS*AYUDA A PERDER PESO', 140, 'Gr', 3, 'NUEVO', 38, 111, 1, 3, 120, 3000, 110, 10000, NULL, NULL, 'img/articulos/GRAF088.png', 100),
(1874, 'GRAFI069', 'PISTACHOS', '', '*GRAN FUENTE DE PROTEÍNAS Y FIBRA*MEJORA LA SALUD DEL CORAZÓN*REDUCE LOS NIVELES DE AZÚCAR Y COLESTEROL*ANTIESTRÉS*AYUDA A PERDER PESO', 70, 'Gr', 4, 'NUEVO', 38, 111, 1, 4, 68, 3000, 65, 11340, NULL, NULL, 'img/articulos/GRAF087.png', 100),
(1875, 'GRAFI070', 'ALMENDRA FILETEADA ', '', '*AYUDA A BAJAR DE PESO*FORTALECE EL SISTEMA INMUNE*IDEAL PARA DIABÉTICOS*REDUCE EL COLESTEROL*ANTIOXIDANTE*PREVIENE EL ENVEJECIMIENTO*CREA MÚSCULO*LAXANTE NATURAL', 65, 'Gr', 4, 'NUEVO', 38, 111, 1, 4, 63, 3000, 60, 11350, NULL, NULL, 'img/articulos/GRAF013.png', 100),
(1876, 'GRAFI071', 'ALMENDRA NATURAL ', '', '*AYUDA A BAJAR DE PESO*FORTALECE EL SISTEMA INMUNE*IDEAL PARA DIABÉTICOS*REDUCE EL COLESTEROL*ANTIOXIDANTE*PREVIENE EL ENVEJECIMIENTO*CREA MÚSCULO*LAXANTE NATURAL', 50, 'Gr', 5, 'NORMAL', 38, 111, 1, 5, 48, 3000, 44, 22680, NULL, NULL, 'img/articulos/GRAF014.png', 100),
(1877, 'GRAFI072', 'AVELLANAS', '', '*COMBATE EL CANSANCIO, LOS CALAMBRES Y EL ENVEJECIMIENTO*PREVIENE EL CÁNCER Y LA DEPRESIÓN*CONTROLA LA HIPERTENCIÓN*MANTIENE LA FIEBRE, LOS REFRIADOS Y LAS ENFERMEDADES A RAYA*NO TIENE COLESTEROL*MEJORA EL RENDIMIENTO MENTAL', 98, 'Gr', 3, 'NUEVO', 38, 111, 1, 3, 90, 3000, 88, 10000, NULL, NULL, 'img/articulos/GRAF018.png', 100),
(1878, 'GRAFI073', 'MACADAMIA ', '', '*REDUCE EL COLESTEROL*EVITA EL ESTREÑIMIENTO*PREVIENE ENFERMEDADES DEL CORAZÓN*PREVIENE LA OSTEPOROSIS*AYUDA A TENER UN SISTEMA NERVIOSO SALUDABLE*RICA EN OMEGA 3 Y 7*GRAN FUENTE DE FIBRA', 83, 'Gr', 5, 'NUEVO', 38, 111, 1, 5, 80, 3000, 78, 20000, NULL, NULL, 'img/articulos/GRAF069.png', 100),
(1879, 'GRAFI074', 'MANÍ  PARTIDO A GRANEL ', '', '*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO', 15, 'Gr', 4, 'NORMAL', 38, 111, 1, 4, 14.5, 3000, 14, 25000, NULL, NULL, 'img/articulos/GRAF075.png', 100),
(1880, 'GRAFI075', 'MANÍ  SALADO ', '', '*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO', 15, 'Gr', 5, 'NORMAL', 38, 111, 1, 5, 14.5, 3000, 14, 25000, NULL, NULL, 'img/articulos/GRAF076.png', 100),
(1881, 'GRAFI076', 'MANÍ  CONFITADO CON AJONJOLI', '', '*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO', 18, 'Gr', 5, 'NORMAL', 38, 111, 1, 5, 16, 3000, 14, 25000, NULL, NULL, 'img/articulos/GRAF072.png', 100),
(1882, 'GRAFI077', 'MANÍ  SIN SAL', '', '*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO', 15, 'Gr', 3, 'NORMAL', 38, 111, 1, 3, 14.5, 3000, 14, 25000, NULL, NULL, 'img/articulos/GRAF073.png', 100),
(1883, 'GRAFI078', 'MANÍ  SOYA', '', '*ALIADOS DEL CORAZÓN*REDUCE EL RIESGO DE PADECER CÁNCER*MEJORAN LA SALUD DEL CEREBRO*CUIDAN TUS HUESOS*SACIAN EL APETITO Y TE AYUDAN A PERDER PESO*AYUDAN A TENER UNA PIEL SANA*COMBATEN EL COLESTEROL*CONTROLAN LA PRESIÓN ARTERIAL*CONTIENEN ÁCIDO FÓLICO', 30, 'Gr', 4, 'NORMAL', 38, 111, 1, 4, 28, 3000, 27, 12000, NULL, NULL, 'img/articulos/GRAF074.png', 100),
(1884, 'GRAFI079', 'MAÍZ  JALAPEÑO', '', '*AYUDA A ACELERAR LOS ALIMENTOS*PROTEÍNAS Y FIBRA*ES ESENCIAL PARA LA DIGESTIÓN*BUENA FUENTE DE HIDRATOS DE CARBONO*VITAMINAS Y MINERALES', 35, 'Gr', 5, 'NORMAL', 38, 111, 1, 5, 30, 3000, 28, 5000, NULL, NULL, 'img/articulos/GRAF071.png', 100),
(1885, 'GRAFI080', 'MAÍZ  NATURAL', '', '*AYUDA A ACELERAR LOS ALIMENTOS*PROTEÍNAS Y FIBRA*ES ESENCIAL PARA LA DIGESTIÓN*BUENA FUENTE DE HIDRATOS DE CARBONO*VITAMINAS Y MINERALES', 35, 'Gr', 3, 'NUEVO', 38, 111, 1, 3, 32, 3000, 28, 5000, NULL, NULL, 'img/articulos/GRAF070.png', 100),
(1886, 'GRAFI081', 'MARAÑÓN', '', '*FORTALECE LOS HUESOS*PREVIENE EL CÁNCER*AYUDA A CONTROLAR EL PESO*AYUDA A REGENERAR LAS CÉLULAS*PROTEGE EL CORAZÓN*AUMENTA EL METABOLISMO*AYUDA LA SALUD VISUAL*AYUDA A AUMENTAR LAS DEFENSAS', 60, 'Gr', 4, 'NORMAL', 38, 111, 1, 4, 58, 3000, 55, 20000, NULL, NULL, 'img/articulos/GRAF077.png', 100);
INSERT INTO `articulos` (`id`, `codigo`, `nombre`, `descripcion`, `lista`, `precio`, `embalaje`, `clasificacion`, `categoria`, `idgrupo`, `idsubgrupo`, `idmarca`, `rank`, `dcto1`, `cant_dcto1`, `dcto2`, `cant_dcto2`, `dcto3`, `cant_dcto3`, `img`, `incremento`) VALUES
(1887, 'GRAFI082', 'NUEZ PECAN', '', '*RICAS EN OMEGA 9 CON PROPIEDADES ANTIINFLAMATORIAS*MUY BAJO CONTENIDO EN SODIO*IDEAL PARA DEPORTISTAS PERSONAS CON ESTRÉS, OBESIDAD E HIPERTENCIÓN*IMPORTANTE PARA LA SALUD DEL CORAZÓN, LA PIEL Y LOS HUESOS*CONTIENEN MINERALES Y VITAMINA E', 100, 'Gr', 5, 'NORMAL', 38, 111, 1, 5, 95, 3000, 93, 10000, NULL, NULL, 'img/articulos/GRAF085.png', 100),
(1888, 'GRAFI083', 'NUEZ CEREBRITO NOGAL', '', '*ANTIOXIDANTES PODEROSOS*DIABETES*PROPIEDADES ANTI-CÁNCER*SALUD CEREBRAL*MEJORA LA SALUD REPRODUCTIVA EN HOMBRES*CONTROL DE PESO*SALUD DEL CORAZÓN*', 68, 'Gr', 4, 'NUEVO', 38, 111, 1, 4, 65, 3000, 60, 10000, NULL, NULL, 'img/articulos/GRAF084.png', 100),
(1889, 'GRAFI084', 'HABAS', '', '*MEJORA LA SALUD DEL CORAZÓN*INCREMENTA LOS NIVELES DE OXÍGENO*HIDRATA EL ORGANISMO*RICAS EN HIERRO*SON SACIANTES*SON FUENTE DE CALCIO*MEJORA LA MEMORIA*AYUDA A CONTROLAR EL PESO', 35, 'Gr', 5, 'NORMAL', 38, 111, 1, 5, 32, 3000, 30, 5000, NULL, NULL, 'img/articulos/GRAF054.png', 100),
(1890, 'GRAFI085', 'ARÁNDANOS ', '', 'PREVIENE ENFERMEDADES NEURODEGENERATIVAS*REJUVENECE*REDUCE LA PRESIÓN ARTERIAL*ES ANTIINFLAMATORIO*ES ANTIINFLAMATORIO*PREVIENE EL DAÑO EN EL ADN*REDUCE EL RIESGO DE SUFRIR CÁNCER', 40, 'Gr', 5, 'NUEVO', 37, 110, 1, 5, 35, 3000, 33, 11340, NULL, NULL, 'img/articulos/GRAF017.png', 100),
(1891, 'GRAFI086', 'DÁTILES ', '', '*FUENTE DE CALCIO Y HIERRO*ENDULZANTE NATURAL*PROVEE ENERGIA NATURAL Y ESTABLE*ALTA CONCENTRACIÓN DE ÁCIDO FÓLICO*ANTIOXIDANTES*FUENTE DE FIBRA*AYUDA EN CASOS DE HIPERTENSIÓN', 50, 'Gr', 3, 'NORMAL', 37, 110, 1, 3, 48, 3000, 42, 6800, NULL, NULL, 'img/articulos/GRAF043.png', 100),
(1892, 'GRAFI087', 'DURAZNOS DESHIDRATADOS', '', '*CONTIENE POCAS CALORIAS*HIDRATA LA PIEL*AYUDA A REGULAR LA PRESIÓN ARTERIAL*AYUDA A NEUTRALIZAR LOS RADICALES LIBRES*CONTIENE VITAMINAS E, K Y TIAMINA', 55, 'Gr', 3, 'NORMAL', 37, 110, 1, 3, 50, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF044.png', 100),
(1893, 'GRAFI088', 'UVAS PASAS', '', '*ELIMINA TOXINAS*BUENA FUENTE DE ANTIOXIDANTES*MEJORA LA DIGESTION POR EL ALTO CONTENIDO DE FIBRA*ALTO CONTENIDO DE POTASIO*MEJORA LA CIRCULACIÓN SANGUINEA*BUENA FUENTE DE ENERGIA', 11, 'Gr', 3, 'NORMAL', 37, 110, 1, 3, 10, 3000, 80, 10000, NULL, NULL, 'img/articulos/GRAF100.png', 250),
(1894, 'GRAFI089', 'COCO EN HOJUELAS', '', '*ANTIOXIDANTES *SU CAPACIDAD PARA REGULAR LA PRESIÓN SANGUÍNEA Y DISMINUIR LOS TRIGLICÉRIDOS.*ES RICO EN FIBRAS Y MINERALES (POTASIO, FÓSFORO, MAGNESIO, HIERRO Y VITAMINAS E, C, Y B).', 35, 'Gr', 3, 'NORMAL', 37, 110, 1, 3, 32, 3000, NULL, NULL, NULL, NULL, 'img/articulos/GRAF041.png', 100),
(1895, 'GRAFI090', 'HIGOS ', 'SECOS APORTAN MÁS CALCIO QUE CUALQUIER OTRA FRUTA DESECADA. CONCRETAMENTE CONTIENEN 100 MG DE CALCIO POR CADA 100 GRAMOS DE HIGOS CONSUMIDOS. POR SU CONTENIDO EN CALCIO PUEDEN AYUDAR A PREVENIR LA OSTEOPOROSIS Y TIENEN UN EFECTO PROTECTOR CONTRA EL CÁNCER DE COLON.', '', 85, 'Gr', 3, 'NORMAL', 37, 110, 1, 3, 80, 3000, 650, 10000, NULL, NULL, 'img/articulos/GRAF065.png', 100),
(1896, 'GRAFI091', 'CIRUELA SIN SEMILLA ', 'LOS GLÓBULOS ROJOS QUE FORMULA HIERRO, EL POTASIO REGULADOR DE LA PRESIÓN DE LA SANGRE Y EL CORAZÓN, Y VITAMINAS B COMO LA NIACINA, B-6 Y EL ÁCIDO PANTOTÉNICO QUE METABOLIZAN GRASAS Y CARBOHIDRATOS SON BENEFICIOS A LA SALUD IMPORTANTES QUE CONTIENEN LAS CIRUELAS Y CIRUELA PASA, Y LOS CONTENIDOS EN VITAMINA K Y AMINO ÁCIDOS SON MUY ALTOS.', '', 16, 'Gr', 3, 'NORMAL', 37, 110, 1, 3, 13, 3000, 125, 10000, NULL, NULL, 'img/articulos/GRAF040.png', 250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancospse`
--

CREATE TABLE `bancospse` (
  `id` int(11) NOT NULL,
  `code` varchar(7) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrios`
--

CREATE TABLE `barrios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tarifa` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carusel`
--

CREATE TABLE `carusel` (
  `id` int(11) NOT NULL,
  `img` varchar(50) NOT NULL,
  `imgmovil` varchar(50) NOT NULL,
  `idgrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carusel`
--

INSERT INTO `carusel` (`id`, `img`, `imgmovil`, `idgrupo`) VALUES
(1, 'img/carusel/W2L1SVdRltU7BnWAu-8Ulxrf.png', 'img/carusel/movil/opjPE-pDUk7gaNBsb-PL4WG3.png', 1),
(2, 'img/carusel/cFplBMIavor2LzEpIUToWbPU.png', 'img/carusel/movil/3KX9qdXqqu4WSBwqRJ96vYiJ.png', 1),
(3, 'img/carusel/xJ88S8kIlqT1NL__klaj3Mp0.png', 'img/carusel/movil/pexXhXpqG4IClZsJfKY_Oi4n.png', 1),
(4, 'img/carusel/zcSy5_ej6UR7YRgPpipAExlY.png', 'img/carusel/movil/b4pQa78EsxKtJw37SgKUr5gj.png', 1),
(5, 'img/carusel/Oka23NYObPyQxb3xc8RBOQEX.png', 'img/carusel/movil/8NDVk9e600bitmvUVZbWw3v4.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `documento` varchar(15) DEFAULT NULL,
  `idtipo_documento` int(11) DEFAULT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `celular2` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `idbarrio` int(11) DEFAULT NULL,
  `idorden` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `tokenfacebook` varchar(500) DEFAULT NULL,
  `idfacebook` varchar(45) DEFAULT NULL,
  `tokengoogle` varchar(500) DEFAULT NULL,
  `idgoogle` varchar(45) DEFAULT NULL,
  `terminos` tinyint(1) NOT NULL DEFAULT 0,
  `comunicaciones` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `clientes_BEFORE_UPDATE` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN
IF new.idorden=null then
UPDATE ordenes set finalizada=true where old.idorden=id;
end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones`
--

CREATE TABLE `cupones` (
  `id` int(11) NOT NULL,
  `codigo` varchar(12) NOT NULL,
  `fechavencimiento` date NOT NULL,
  `descuento` int(11) NOT NULL,
  `fechacreacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_pago`
--

CREATE TABLE `estados_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estados_pago`
--

INSERT INTO `estados_pago` (`id`, `nombre`) VALUES
(2, 'PAGADO'),
(1, 'PENDIENTE'),
(3, 'RECHAZADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id`, `nombre`) VALUES
(32, 'ACEITES 100% NATURALES'),
(37, 'FRUTOS DESHIDRATADOS'),
(38, 'FRUTOS SECOS'),
(1, 'OTROS'),
(34, 'PANADERIA Y REPOSTERIA'),
(39, 'SEMILLAS'),
(36, 'SUPERALIMENTOS'),
(35, 'UTENSILIOS Y ACCESORIOS'),
(33, 'VINAGRES 100% NATURALES');

--
-- Disparadores `grupos`
--
DELIMITER $$
CREATE TRIGGER `grupos_AFTER_INSERT` AFTER INSERT ON `grupos` FOR EACH ROW BEGIN
	INSERT INTO subgrupos(nombre,idgrupo)value("OTROS",NEW.id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`) VALUES
(47, '3A'),
(60, '3A - PASCUALI'),
(71, '3JJJ'),
(68, 'ALPINA'),
(67, 'AMY'),
(56, 'BIOFUTURO'),
(62, 'CAROLESEN - COLSABOR'),
(61, 'CAROLESEN - GLASSEFRUIT'),
(55, 'COLORISA'),
(64, 'COLORISA - COLSABOR '),
(57, 'COLSABOR'),
(75, 'CORONA'),
(48, 'DAGUSTO'),
(66, 'FRUTIVITA'),
(70, 'GELITA'),
(51, 'GIRONES '),
(65, 'GLORIA'),
(78, 'HIDROGENADO'),
(42, 'INCAUCA'),
(72, 'INGREDION'),
(43, 'ITALO'),
(45, 'LEVAPAN '),
(53, 'LUKER'),
(49, 'NACIONAL DE CHOCOLATES '),
(73, 'NIEVE'),
(52, 'NUTELLA'),
(58, 'NUTRINAT'),
(74, 'PASPAN'),
(59, 'PRINCIPE'),
(46, 'PRODIA'),
(50, 'PURATOS LEVAPAN '),
(69, 'REGIO'),
(63, 'RICHS'),
(76, 'ROBINSON'),
(54, 'SANTILLANA'),
(1, 'SIN MARCA'),
(44, 'SURTICOCOS'),
(77, 'TRES CASTILLOS'),
(41, 'VINAGRES GOLDEN ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `total` double NOT NULL DEFAULT 0,
  `finalizada` tinyint(1) NOT NULL DEFAULT 0,
  `nombrecliente` varchar(50) DEFAULT NULL,
  `apellidoscliente` varchar(45) DEFAULT NULL,
  `telefonocliente` varchar(10) DEFAULT NULL,
  `telefono2cliente` varchar(10) DEFAULT NULL,
  `idtipo_documento` int(11) DEFAULT NULL,
  `documentocliente` varchar(60) DEFAULT NULL,
  `direccioncliente` varchar(100) DEFAULT NULL,
  `idbarrio` int(11) DEFAULT NULL,
  `idtipo_pago` int(11) DEFAULT NULL,
  `numeropago` varchar(20) DEFAULT NULL,
  `idestado_pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Disparadores `ordenes`
--
DELIMITER $$
CREATE TRIGGER `ordenes_AFTER_INSERT` AFTER INSERT ON `ordenes` FOR EACH ROW BEGIN
UPDATE
  clientes
set
  idorden = NEW.id
where
  id = NEW.idcliente;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ordenes_BEFORE_UPDATE` BEFORE UPDATE ON `ordenes` FOR EACH ROW BEGIN 

IF NEW.total=0 THEN
UPDATE
  clientes
set
  idorden = null
where
new.idcliente=id;
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalles`
--

CREATE TABLE `orden_detalles` (
  `id` int(11) NOT NULL,
  `codigoarticulo` varchar(20) NOT NULL,
  `preciound` double NOT NULL,
  `cantidad` double NOT NULL,
  `nombrearticulo` varchar(50) NOT NULL,
  `embalajearticulo` varchar(10) NOT NULL,
  `idorden` int(11) NOT NULL,
  `img` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Disparadores `orden_detalles`
--
DELIMITER $$
CREATE TRIGGER `orden_detalles_AFTER_DELETE` AFTER DELETE ON `orden_detalles` FOR EACH ROW BEGIN
UPDATE
  ordenes
SET
  total = total -(OLD.cantidad * OLD.preciound)
WHERE
  id = OLD.idorden;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `orden_detalles_AFTER_INSERT` AFTER INSERT ON `orden_detalles` FOR EACH ROW BEGIN
UPDATE
  ordenes
SET
  total = total +(NEW.cantidad * NEW.preciound)
WHERE
  id = NEW.idorden;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `orden_detalles_AFTER_UPDATE` AFTER UPDATE ON `orden_detalles` FOR EACH ROW BEGIN
UPDATE ordenes set total=total-(old.preciound*old.cantidad-new.preciound*new.cantidad) where id=new.idorden;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendaciones`
--

CREATE TABLE `recomendaciones` (
  `id` int(11) NOT NULL,
  `img` varchar(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `texto` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recomendaciones`
--

INSERT INTO `recomendaciones` (`id`, `img`, `titulo`, `texto`) VALUES
(1, 'img/secciones/imgreco1.jpeg', 'ESTO SE EDITO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(2, 'img/secciones/imgreco2.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(3, 'img/secciones/imgreco1.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(4, 'img/secciones/imgreco1.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(5, 'img/secciones/imgreco2.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(6, 'img/secciones/imgreco1.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(7, 'img/secciones/imgreco2.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(8, 'img/secciones/imgreco1.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(9, 'img/secciones/imgreco2.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(10, 'img/secciones/imgreco1.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(11, 'img/secciones/imgreco1.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(12, 'img/secciones/imgreco2.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20'),
(13, 'img/secciones/imgreco1.jpeg', 'ALGO', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subgrupos`
--

CREATE TABLE `subgrupos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idgrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `subgrupos`
--

INSERT INTO `subgrupos` (`id`, `nombre`, `idgrupo`) VALUES
(1, 'OTROS', 1),
(91, 'OTROS', 32),
(92, 'OTROS', 33),
(93, 'OTROS', 34),
(94, 'OTROS', 35),
(95, 'OTROS', 36),
(96, 'OTROS', 37),
(97, 'OTROS', 38),
(98, 'OTROS', 39),
(99, 'ACEITES 100% NATURALES', 32),
(100, 'VINAGRES 100% NATURALES', 33),
(101, 'INSUMOS', 34),
(102, 'COLORANTES', 34),
(103, 'CUIDADO DEL CUERPO', 32),
(104, 'UTENSILIOS', 35),
(105, 'ESENCIAS', 34),
(107, 'SUPERALIMENTOS', 36),
(108, 'CREMAS - DECORACION', 34),
(109, 'CREMAS - DECORACION', 37),
(110, 'FRUTOS DESHIDRATADOS', 37),
(111, 'FRUTOS SECOS', 38),
(112, 'PANADERIA Y REPOSTERIA', 34),
(113, 'HARINAS', 34),
(114, 'MARGARINAS Y GRASAS', 34),
(115, 'LACTEOS', 34),
(116, 'LEVADURAS', 34),
(117, 'MANTEQUILLAS', 34),
(118, 'VINOS', 34),
(119, 'TOPPINGS', 34),
(121, 'SEMILLAS', 39);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documento`
--

CREATE TABLE `tipos_documento` (
  `id` int(11) NOT NULL,
  `prefijo` varchar(6) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipos_documento`
--

INSERT INTO `tipos_documento` (`id`, `prefijo`, `nombre`) VALUES
(1, 'CC', 'CEDULA DE CIUDADANIA'),
(2, 'NIT', 'NUMERO DE IDENTIFICACION TRIBUTARIA'),
(3, 'PEP', 'PERMISO ESPECIAL DE PERMANENCIA'),
(4, 'TI', 'TARJETA DE IDENTIDAD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_pago`
--

CREATE TABLE `tipos_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipos_pago`
--

INSERT INTO `tipos_pago` (`id`, `nombre`) VALUES
(1, 'CONTRAENTREGA'),
(2, 'EFECTIVO'),
(4, 'PSE'),
(3, 'TARJETA CREDITO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `password`, `nombre`, `id`) VALUES
('admin', '1234', 'Administrador del Sistema', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  ADD KEY `fgk_grupos_articulos_idx` (`idgrupo`),
  ADD KEY `fgk_subgrupos_articulos_idx` (`idsubgrupo`),
  ADD KEY `fgk_marcas_articulos_idx` (`idmarca`);

--
-- Indices de la tabla `bancospse`
--
ALTER TABLE `bancospse`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `barrios`
--
ALTER TABLE `barrios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `carusel`
--
ALTER TABLE `carusel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fgk_grupos_carusel_idx` (`idgrupo`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `idorden_UNIQUE` (`idorden`),
  ADD KEY `fgk_tipo_documento_idx` (`idtipo_documento`),
  ADD KEY `fgk_barrios_clientes_idx` (`idbarrio`),
  ADD KEY `fgk_ordenes_clientes_idx` (`idorden`);

--
-- Indices de la tabla `cupones`
--
ALTER TABLE `cupones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`);

--
-- Indices de la tabla `estados_pago`
--
ALTER TABLE `estados_pago`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fgk_clientes_ordenes_idx` (`idcliente`),
  ADD KEY `fgk_idtipos_documento_ordenes_idx` (`idtipo_documento`),
  ADD KEY `fgk_barrios_ordenes_idx` (`idbarrio`),
  ADD KEY `fgk_tipos_pago_ordenes_idx` (`idtipo_pago`),
  ADD KEY `fgk_estados_pago_idx` (`idestado_pago`);

--
-- Indices de la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fgk_ordenes_orden_detalles_idx` (`idorden`);

--
-- Indices de la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subgrupos`
--
ALTER TABLE `subgrupos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fgk_grupos_subgrupos_idx` (`idgrupo`);

--
-- Indices de la tabla `tipos_documento`
--
ALTER TABLE `tipos_documento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `prefijo_UNIQUE` (`prefijo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `tipos_pago`
--
ALTER TABLE `tipos_pago`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1897;

--
-- AUTO_INCREMENT de la tabla `bancospse`
--
ALTER TABLE `bancospse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `barrios`
--
ALTER TABLE `barrios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carusel`
--
ALTER TABLE `carusel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cupones`
--
ALTER TABLE `cupones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados_pago`
--
ALTER TABLE `estados_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `subgrupos`
--
ALTER TABLE `subgrupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de la tabla `tipos_documento`
--
ALTER TABLE `tipos_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipos_pago`
--
ALTER TABLE `tipos_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `fgk_grupos_articulos` FOREIGN KEY (`idgrupo`) REFERENCES `grupos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fgk_marcas_articulos` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fgk_subgrupos_articulos` FOREIGN KEY (`idsubgrupo`) REFERENCES `subgrupos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `carusel`
--
ALTER TABLE `carusel`
  ADD CONSTRAINT `fgk_grupos_carusel` FOREIGN KEY (`idgrupo`) REFERENCES `grupos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fgk_barrios_clientes` FOREIGN KEY (`idbarrio`) REFERENCES `barrios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fgk_tipos_documento_clientes` FOREIGN KEY (`idtipo_documento`) REFERENCES `tipos_documento` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `fgk_barrios_ordenes` FOREIGN KEY (`idbarrio`) REFERENCES `barrios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fgk_clientes_ordenes` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fgk_estados_pago` FOREIGN KEY (`idestado_pago`) REFERENCES `estados_pago` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fgk_tipos_documento_ordenes` FOREIGN KEY (`idtipo_documento`) REFERENCES `tipos_documento` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fgk_tipos_pago_ordenes` FOREIGN KEY (`idtipo_pago`) REFERENCES `tipos_pago` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  ADD CONSTRAINT `fgk_ordenes_orden_detalles` FOREIGN KEY (`idorden`) REFERENCES `ordenes` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `subgrupos`
--
ALTER TABLE `subgrupos`
  ADD CONSTRAINT `fgk_grupos_subgrupos` FOREIGN KEY (`idgrupo`) REFERENCES `grupos` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
