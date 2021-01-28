/*cambios para sacar a deploy 2021-01-26*/

/*se crea la tabla de estados*/
CREATE TABLE `apirest`.`estados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) );

/*sel asignan los estados*/
INSERT INTO `apirest`.`estados` (`id`, `nombre`) VALUES ('1', 'REGISTRADO');
INSERT INTO `apirest`.`estados` (`id`, `nombre`) VALUES ('2', 'EN DESPACHO');
INSERT INTO `apirest`.`estados` (`id`, `nombre`) VALUES ('3', 'EN ENTREGA');
INSERT INTO `apirest`.`estados` (`id`, `nombre`) VALUES ('4', 'ENTREGADO');
INSERT INTO `apirest`.`estados` (`id`, `nombre`) VALUES ('5', 'ANULADO');

/*se agrega el campo a la tabla ordenes*/
ALTER TABLE `apirest`.`ordenes` 
ADD COLUMN `idestado` INT NOT NULL DEFAULT 1 AFTER `idestado_pago`,
ADD INDEX `fgk_estados_ordenes_idx` (`idestado` ASC) ;

ALTER TABLE `apirest`.`ordenes` 
ADD CONSTRAINT `fgk_estados_ordenes`
  FOREIGN KEY (`idestado`)
  REFERENCES `apirest`.`estados` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

/*se agrega campo de fecha para saber el registro*/
ALTER TABLE `apirest`.`ordenes` 
ADD COLUMN `fecha` DATE NOT NULL AFTER `idestado`;

/*cambios 28/01/2021*/

/*se pone opcional el campo imagen y se agrega campo de estado*/

ALTER TABLE `apirest`.`articulos` 
ADD COLUMN `estado` TINYINT(1) NOT NULL DEFAULT 1 AFTER `incremento`,
CHANGE COLUMN `img` `img` VARCHAR(150) NOT NULL DEFAULT 'img/ninguna.png' ;