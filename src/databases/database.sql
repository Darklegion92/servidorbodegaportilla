/*cambios agregados el dia 19-09-2020*/
CREATE TABLE `apirest`.`grupos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE
);

CREATE TABLE `apirest`.`subgrupos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `idgrupo` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `fgk_grupos_subgrupos_idx` (`idgrupo` ASC) VISIBLE,
  CONSTRAINT `fgk_grupos_subgrupos` FOREIGN KEY (`idgrupo`) REFERENCES `apirest`.`grupos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE `apirest`.`marcas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE
);

CREATE TABLE `articulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `precio` double NOT NULL DEFAULT '0',
  `embalaje` varchar(10) NOT NULL DEFAULT '100 Gr',
  `clasificacion` int NOT NULL DEFAULT '0',
  `categoria` varchar(12) NOT NULL DEFAULT 'NORMAL',
  `idgrupo` int NOT NULL,
  `idsubgrupo` int NOT NULL,
  `idmarca` int NOT NULL,
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
  CONSTRAINT `fgk_grupos_articulos` FOREIGN KEY (`idgrupo`) REFERENCES `grupos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fgk_marcas_articulos` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fgk_subgrupos_articulos` FOREIGN KEY (`idsubgrupo`) REFERENCES `subgrupos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8
/*cambion 19-09-2020*/
CREATE TABLE `apirest`.`tipos_documento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `prefijo` VARCHAR(6) NOT NULL,
  `nombre` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `prefijo_UNIQUE` (`prefijo` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE
);

CREATE TABLE `apirest`.`barrios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `tarifa` DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
);

CREATE TABLE `apirest`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `documento` VARCHAR(15) NULL,
  `idtipo_documento` INT NULL,
  `nombres` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `celular` VARCHAR(10) NULL,
  `celular2` VARCHAR(45) NULL,
  `direccion` VARCHAR(100) NULL,
  `idbarrio` INT NULL,
  `idorden` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fgk_tipo_documento_idx` (`idtipo_documento` ASC) VISIBLE,
  INDEX `fgk_barrios_clientes_idx` (`idbarrio` ASC) VISIBLE,
  CONSTRAINT `fgk_tipos_documento_clientes` FOREIGN KEY (`idtipo_documento`) REFERENCES `apirest`.`tipos_documento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fgk_barrios_clientes` FOREIGN KEY (`idbarrio`) REFERENCES `apirest`.`barrios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE `apirest`.`ordenes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NOT NULL,
  `total` DOUBLE NOT NULL,
  `finalizada` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
);

ALTER TABLE
  `apirest`.`ordenes`
ADD
  INDEX `fgk_clientes_ordenes_idx` (`idcliente` ASC) VISIBLE;

;

ALTER TABLE
  `apirest`.`ordenes`
ADD
  CONSTRAINT `fgk_clientes_ordenes` FOREIGN KEY (`idcliente`) REFERENCES `apirest`.`clientes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE
  `apirest`.`clientes`
ADD
  INDEX `fgk_ordenes_clientes_idx` (`idorden` ASC) VISIBLE;

;

ALTER TABLE
  `apirest`.`clientes`
ADD
  CONSTRAINT `fgk_ordenes_clientes` FOREIGN KEY (`idorden`) REFERENCES `apirest`.`ordenes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE TABLE `apirest`.`orden_detalles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigoarticulo` VARCHAR(20) NOT NULL,
  `preciound` DOUBLE NOT NULL,
  `cantidad` DOUBLE NOT NULL,
  `nombrearticulo` VARCHAR(50) NOT NULL,
  `embalajearticulo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fgk_articulos_orden_detalles_idx` (`codigoarticulo` ASC) VISIBLE,
  CONSTRAINT `fgk_articulos_orden_detalles` FOREIGN KEY (`codigoarticulo`) REFERENCES `apirest`.`articulos` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE
);

ALTER TABLE
  `apirest`.`orden_detalles`
ADD
  COLUMN `idorden` INT NOT NULL
AFTER
  `embalajearticulo`,
ADD
  INDEX `fgk_ordenes_orden_detalles_idx` (`idorden` ASC) VISIBLE;

;

ALTER TABLE
  `apirest`.`orden_detalles`
ADD
  CONSTRAINT `fgk_ordenes_orden_detalles` FOREIGN KEY (`idorden`) REFERENCES `apirest`.`ordenes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

/*trigger para actualizar total orden*/
DROP TRIGGER IF EXISTS `apirest`.`orden_detalles_AFTER_INSERT`;

DELIMITER $ $ USE `apirest` $ $ CREATE DEFINER = CURRENT_USER TRIGGER `apirest`.`orden_detalles_AFTER_INSERT`
AFTER
INSERT
  ON `orden_detalles` FOR EACH ROW BEGIN
UPDATE
  ordenes
SET
  total = total +(NEW.cantidad * NEW.preciound)
WHERE
  id = NEW.idorden;

END $ $ DELIMITER ; 

DROP TRIGGER IF EXISTS `apirest`.`orden_detalles_AFTER_DELETE`;

DELIMITER $ $ USE `apirest` $ $ CREATE DEFINER = CURRENT_USER TRIGGER `apirest`.`orden_detalles_AFTER_DELETE`
AFTER
  DELETE ON `orden_detalles` FOR EACH ROW BEGIN
UPDATE
  ordenes
SET
  total = total -(OLD.cantidad * OLD.preciound)
WHERE
  id = OLD.idorden;

END $ $ DELIMITER ;

/*triguer para asignar orden pendiente a usuario*/
DROP TRIGGER IF EXISTS `apirest`.`ordenes_AFTER_INSERT`;

DELIMITER $ $ USE `apirest` $ $ CREATE DEFINER = CURRENT_USER TRIGGER `apirest`.`ordenes_AFTER_INSERT`
AFTER
INSERT
  ON `ordenes` FOR EACH ROW BEGIN
UPDATE
  clientes
set
  idorden = NEW.id
where
  id = NEW.idcliente;

END $ $ DELIMITER ;

/*triguer encargado de eliminar orden pendiente cuando ya este cerrada*/
DROP TRIGGER IF EXISTS `apirest`.`ordenes_BEFORE_UPDATE`;

DELIMITER $ $ USE `apirest` $ $ CREATE DEFINER = `root` @`localhost` TRIGGER `ordenes_BEFORE_UPDATE` BEFORE
UPDATE
  ON `ordenes` FOR EACH ROW BEGIN IF NEW.finalizada THEN
UPDATE
  clientes
set
  idorden = null
where
  id = NEW.idcliente;

END IF;

END $ $ DELIMITER ; 

ALTER TABLE
  `apirest`.`clientes`
ADD
  COLUMN `email` VARCHAR(100) NOT NULL
AFTER
  `idorden`;

ALTER TABLE
  `apirest`.`clientes`
ADD
  COLUMN `password` VARCHAR(45) NULL
AFTER
  `email`,
ADD
  COLUMN `tokenfacebook` VARCHAR(100) NULL
AFTER
  `password`,
ADD
  COLUMN `tokengoogle` VARCHAR(100) NULL
AFTER
  `tokenfacebook`;

ALTER TABLE
  `apirest`.`clientes`
ADD
  COLUMN `terminos` TINYINT(1) NOT NULL DEFAULT 0
AFTER
  `tokengoogle`,
ADD
  COLUMN `comunicaciones` TINYINT(1) NOT NULL DEFAULT 0
AFTER
  `terminos`;

/*cambios realizados 2020-09-21*/

ALTER TABLE `clientes` ADD UNIQUE(`email`);

ALTER TABLE `ordenes` CHANGE `total` `total` DOUBLE NOT NULL DEFAULT '0'
ALTER TABLE `ordenes` CHANGE `finalizada` `finalizada` TINYINT(1) NOT NULL DEFAULT '0';

CREATE PROCEDURE `nueva_orden`(IN `_idcliente` INT, IN `_codigoarticulo` DOUBLE, IN `_preciound` DOUBLE, IN `_cantidad` INT, IN `_nombrearticulo` VARCHAR(50), IN `_embalajearticulo` VARCHAR(15)) NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER BEGIN INSERT INTO ordenes(idcliente)VALUES(_idcliente); INSERT INTO `orden_detalles`(`codigoarticulo`, `preciound`, `cantidad`, `nombrearticulo`, `embalajearticulo`, `idorden`) VALUES (_codigoarticulo,_preciound,_cantidad,_nombrearticulo,_embalajearticulo,LAST_INSERT_ID()); END

/*cambios realizados 2020-10-01*/

CREATE TABLE `apirest`.`usuarios` ( `usuario` VARCHAR(12) NOT NULL , `password` VARCHAR(20) NOT NULL , `nombre` VARCHAR(50) NOT NULL , `id` INT NOT NULL AUTO_INCREMENT , PRIMARY KEY (`id`), UNIQUE (`usuario`)) ENGINE = InnoDB;