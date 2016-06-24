﻿-- MySQL Script generated by MySQL Workbench
-- 06/08/16 22:25:26
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
/*==============================================================*/
/* Base de datos: `ferreteria`                                 */
/*==============================================================*/
CREATE DATABASE IF NOT EXISTS `ferreteriaweb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `ferreteriaweb`;

-- -----------------------------------------------------
-- Table `ferreteriaweb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreteriaweb`.`Usuario` (
  `runUsuario` VARCHAR(13) NOT NULL COMMENT 'Rol Unico Nacional del Cliente',
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `sexo` VARCHAR(7) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `suscripcion` BOOLEAN NOT NULL,
  `pass` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`runUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreteriaweb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreteriaweb`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `tipoCategoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreteriaweb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreteriaweb`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(30) NOT NULL,
  `categoria` VARCHAR(30) NOT NULL,
  `precioUnitario` INT NOT NULL,
  `descripcionProducto` VARCHAR(1024) NOT NULL,
  `ubicacion` VARCHAR(30) NOT NULL,
  `cantidad` INT NOT NULL,
  `dsto` DOUBLE NULL,
  `fechaTerminoDsto` DATE NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idProducto`, `Categoria_idCategoria`),
  INDEX `fk_Producto_Categoria1_idx` (`Categoria_idCategoria` ASC),
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `ferreteriaweb`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreteriaweb`.`carritoCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreteriaweb`.`carritoCompra` (
  `idcarritoCompra` INT NOT NULL,
  `producto` INT NOT NULL,
  `dscto` INT NOT NULL,
  `total` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `montoPagar` INT NOT NULL,
  `carritoCompracol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcarritoCompra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreteriaweb`.`Boleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreteriaweb`.`Boleta` (
  `numBoleta` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME(0) NOT NULL,
  `medioPago` VARCHAR(30) NOT NULL,
  `nroTarjeta` MEDIUMTEXT NOT NULL,
  `total` INT NOT NULL,
  `tipoTransaccion` VARCHAR(30) NOT NULL,
  `nroOrden` INT NOT NULL,
  `Usuario_runUsuario` VARCHAR(13) NOT NULL,
  `carritoCompra_idcarritoCompra` INT NOT NULL,
  PRIMARY KEY (`numBoleta`, `carritoCompra_idcarritoCompra`),
  INDEX `fk_Boleta_Usuario1_idx` (`Usuario_runUsuario` ASC),
  INDEX `fk_Boleta_carritoCompra1_idx` (`carritoCompra_idcarritoCompra` ASC),
  CONSTRAINT `fk_Boleta_Usuario1`
    FOREIGN KEY (`Usuario_runUsuario`)
    REFERENCES `ferreteriaweb`.`Usuario` (`runUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Boleta_carritoCompra1`
    FOREIGN KEY (`carritoCompra_idcarritoCompra`)
    REFERENCES `ferreteriaweb`.`carritoCompra` (`idcarritoCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreteriaweb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreteriaweb`.`Administrador` (
  `runUsuario` VARCHAR(13) NOT NULL COMMENT 'Rol Unico Nacional del Administrador',
  `nombre` VARCHAR(30) NOT NULL,
  `apellido` VARCHAR(30) NOT NULL,
  `sexo` VARCHAR(7) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `userName` VARCHAR(30) NOT NULL,
  `pass` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`runUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreteriaweb`.`SubCategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreteriaweb`.`SubCategoria` (
  `idSubCategoria` INT NOT NULL AUTO_INCREMENT,
  `nomCategoria` VARCHAR(30) NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idSubCategoria`, `Categoria_idCategoria`),
  INDEX `fk_SubCategoria_Categoria_idx` (`Categoria_idCategoria` ASC),
  CONSTRAINT `fk_SubCategoria_Categoria`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `ferreteriaweb`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreteriaweb`.`Producto_has_Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreteriaweb`.`Producto_has_Administrador` (
  `Producto_idProducto` INT NOT NULL,
  `Producto_Categoria_idCategoria` INT NOT NULL,
  `Administrador_runUsuario` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Producto_idProducto`, `Producto_Categoria_idCategoria`, `Administrador_runUsuario`),
  INDEX `fk_Producto_has_Administrador_Administrador1_idx` (`Administrador_runUsuario` ASC),
  INDEX `fk_Producto_has_Administrador_Producto1_idx` (`Producto_idProducto` ASC, `Producto_Categoria_idCategoria` ASC),
  CONSTRAINT `fk_Producto_has_Administrador_Producto1`
    FOREIGN KEY (`Producto_idProducto` , `Producto_Categoria_idCategoria`)
    REFERENCES `ferreteriaweb`.`Producto` (`idProducto` , `Categoria_idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Administrador_Administrador1`
    FOREIGN KEY (`Administrador_runUsuario`)
    REFERENCES `ferreteriaweb`.`Administrador` (`runUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Poblado de Datos en la BBDD
-- -----------------------------------------------------
-- USUARIOS DE CLIENTES
-- -----------------------------------------------------
INSERT INTO USUARIO VALUES('74351336','MARIA','TOLEDO ESCOBAR','MUJER','1987-01-30',984885450,'MTOLEDO.ES@FACEBOOK.COM',FALSE,'1234');
INSERT INTO USUARIO VALUES('78482796','ERIKA','MILLAS GONZALEZ','MUJER','1982-12-22',986921326,'EMILLAS.GO@YAHOO.COM',FALSE,'47fa7b241cb1b4f35722abaa302aa593');
INSERT INTO USUARIO VALUES('85112244','RODRIGO','MORAGA VARGAS','HOMBRE','1983-12-17',984635896,'RMORAGA.VA@FACEBOOK.COM',FALSE,'1db41f6f96f232d888bd59a42d354fa8');
INSERT INTO USUARIO VALUES('85188046','MARIA','QUIROZ BRAVO','MUJER','1980-10-15',975631686,'MQUIROZ.BR@OUTLOOK.ES',FALSE,'4a3b00cd6053326df6cabfc0d4037de9');
INSERT INTO USUARIO VALUES('90651110','PATRICIA','ALBORNOZ VICUÑA','MUJER','1981-05-19',983513455,'PALBORNOZ.VI@GMAIL.COM',TRUE,'2fc72acaa7f64b6e4c33fc98f576b8ea');
INSERT INTO USUARIO VALUES('91970856','LUIS','CESPEDES FUENTES','HOMBRE','1987-11-25',990406046,'LCESPEDES.FU@OUTLOOK.ES',TRUE,'9c5057c775276e741e05986eef5e9164');
INSERT INTO USUARIO VALUES('94561485','WALDO','TAPIA TAPIA','HOMBRE','1980-10-17',969916058,'WTAPIA.TA@GMAIL.COM',FALSE,'1337dc4d8862472936ba4b994e6246d6');
INSERT INTO USUARIO VALUES('101081281','RODOLFO','VELASQUEZ SANTOS','HOMBRE','1986-02-07',964682316,'RVELASQUEZ.SA@OUTLOOK.ES',FALSE,'e1880e4f9b6c70dd9da401e6f2ccd0a1');
INSERT INTO USUARIO VALUES('104254551','ARMANDO','MORENO GAMBOA','HOMBRE','1983-03-26',973731839,'AMORENO.GA@HOTMAIL.COM',TRUE,'75fe2b82fa2aa8f949958f52d21710b9');
INSERT INTO USUARIO VALUES('109753122','LORENA','RAMÍREZ AHUMADA','MUJER','1988-11-07',973406640,'LRAMÍREZ.AH@OUTLOOK.ES',FALSE,'46577e3803a3896dbe65fc41e1f41293');
INSERT INTO USUARIO VALUES('112881956','JUANA','GUTIERREZ CARDENAS','MUJER','1983-06-15',988489114,'JGUTIERREZ.CA@FACEBOOK.COM',TRUE,'64c3b87cb55496d931960684481b2518');
INSERT INTO USUARIO VALUES('118978013','NELSON','LAGOS PADILLA','HOMBRE','1995-03-12',984834027,'NLAGOS.PA@YAHOO.COM',FALSE,'987a9c010b6ac5e4e9d07b78b0a0418c');
INSERT INTO USUARIO VALUES('119701759','DENISSE','VERA ASTORGA','MUJER','1985-09-30',961304052,'DVERA.AS@HOTMAIL.COM',TRUE,'19c36e07ed2b9bd5ee2f1561f0df6b3c');
INSERT INTO USUARIO VALUES('121128055','RITA','JIMENEZ VITALJIC','MUJER','1990-03-02',968272228,'RJIMENEZ.VI@GMAIL.COM',FALSE,'ef6bbe768a53b1fe9e3402e7a4f17255');
INSERT INTO USUARIO VALUES('124872847','CARMEN','JARA GUZMAN','MUJER','1989-02-10',998537329,'CJARA.GU@FACEBOOK.COM',TRUE,'a84d1d67b8bd80e1ad522e1d6198b2b1');
INSERT INTO USUARIO VALUES('125474330','CHRISTIAN','GARRIDO GARRIDO','HOMBRE','1992-11-18',969316324,'CGARRIDO.GA@FACEBOOK.COM',FALSE,'044e3e493b40654cdc8bfdba9784768e');
INSERT INTO USUARIO VALUES('126031661','ERIKA','ROZAS LUNA','MUJER','1988-11-28',961984154,'EROZAS.LU@HOTMAIL.COM',TRUE,'823dc358df875a190984fafdd6c8b7c9');
INSERT INTO USUARIO VALUES('127192898','VERONICA','MUÑOZ MESA','MUJER','1980-03-19',985139498,'VMUÑOZ.ME@GMAIL.COM',FALSE,'0354827c39c36e64fb918c1d8f97a51c');
INSERT INTO USUARIO VALUES('128249834','CAROLA','GONZALES SEPULVEDA','MUJER','1986-02-04',978993854,'CGONZALES.SE@OUTLOOK.ES',TRUE,'74d8b0c0b2b05a1a46d33d14eff7ae57');
-- -----------------------------------------------------
-- CATEGORIA
-- -----------------------------------------------------
INSERT INTO CATEGORIA VALUES('1','METALISTERÍA','FERRETERÍA');
INSERT INTO CATEGORIA VALUES('2','CERRAJERÍA','FERRETERÍA');
INSERT INTO CATEGORIA VALUES('3','HERRAMIENTAS','FERRETERÍA');
INSERT INTO CATEGORIA VALUES('4','FERRETERÍA GENERAL','FERRETERÍA');
INSERT INTO CATEGORIA VALUES('5','PARA OBRA Y DECORACIÓN','HERRAJES');
INSERT INTO CATEGORIA VALUES('6','PARA MUEBLES','HERRAJES');
INSERT INTO CATEGORIA VALUES('7','ACCESORIOS DE BAÑO','BAÑOS');
INSERT INTO CATEGORIA VALUES('8','GRIFERÍA','BAÑOS');
INSERT INTO CATEGORIA VALUES('9','MOBILIARÍO DE BAÑO','BAÑOS');
INSERT INTO CATEGORIA VALUES('10','SANITARIOS Y LAVADOS','BAÑOS');
INSERT INTO CATEGORIA VALUES('11','MOBILIARIO DE COCINA','MOBILIARIO');
INSERT INTO CATEGORIA VALUES('12','MOBILIARIO DE HOGAR Y OFICINA','MOBILIARIO');
INSERT INTO CATEGORIA VALUES('13','MOBILIARIO INFANTIL','MOBILIARIO');
INSERT INTO CATEGORIA VALUES('14','MOBILIARIO DE JARDÍN','MOBILIARIO');
INSERT INTO CATEGORIA VALUES('15','HERRAMIENTA MANUAL','JARDÍN');
INSERT INTO CATEGORIA VALUES('16','HERRAMIENTA ELÉCTRICA','JARDÍN');
INSERT INTO CATEGORIA VALUES('17','MOBILIARIO DE JARDÍN','JARDÍN');
INSERT INTO CATEGORIA VALUES('18','EQUIPAMIENTO DE JARDÍN','JARDÍN');
INSERT INTO CATEGORIA VALUES('19','ARTÍCULOS DE JARDÍN','JARDÍN');
INSERT INTO CATEGORIA VALUES('20','MOBILIARIO DE DISEÑO','COCINAS');
INSERT INTO CATEGORIA VALUES('21','UTENSILIOS Y COMPLEMENTOS','COCINAS');
INSERT INTO CATEGORIA VALUES('22','PEQUEÑO ELECTRODOMÉSTICO','COCINAS');
INSERT INTO CATEGORIA VALUES('23','ELECTRODOMÉSTICO','COCINAS');
INSERT INTO CATEGORIA VALUES('24','MANTENIMIENTO','SERVICIO HOTELES');
INSERT INTO CATEGORIA VALUES('25','EQUIPAMIENTO DE HABITACIONES','SERVICIO HOTELES');
INSERT INTO CATEGORIA VALUES('26','EXTERIORES','SERVICIO HOTELES');
-- -----------------------------------------------------
-- ADMINISTRADORES
-- -----------------------------------------------------
INSERT INTO ADMINISTRADOR VALUES('177008796','JOSE','PEREZ CARMONA','HOMBRE','1991-03-26','JOSE.PEREZ@PELUKA.INFO','JPEREZ','1234');
INSERT INTO ADMINISTRADOR VALUES('186948483','JONATHAN','ESPINOZA BRAIN','HERMAFRODITA','1994-01-21','JONATHANESPINOZAB@GMAIL.COM','JESPINOZAB','4321');
INSERT INTO ADMINISTRADOR VALUES('162075497','JORGE','MUÑOZ NOVAKOVIC','MACHO ALFA','1985-12-07','JMUNOZNOV@GMAIL.COM','JOR.MUNOZN','2341');
-- -----------------------------------------------------
-- PRODUCTOS
-- -----------------------------------------------------
INSERT INTO PRODUCTO VALUES(' EJE DEL EMBRAGUE','MOBILIARIO DE JARDÍN',26240,'SIN DESCRIPCIÓN DISPONIBLE','MYI6381',22,0,'');
INSERT INTO PRODUCTO VALUES(' SET VASTAGO Y RODAMIENTOS V: 50/68 MM., R: 125/170/200 MM.,  (P/RCB-25)','FERRETERÍA GENERAL',329640,'SIN DESCRIPCIÓN DISPONIBLE','UWQ2930',3,0,'');
INSERT INTO PRODUCTO VALUES(' BISAGRA FIERRO CINCADO   2"   X  1.0 MM.','PARA MUEBLES',110,'SIN DESCRIPCIÓN DISPONIBLE','AJE3642',91,0,'');
INSERT INTO PRODUCTO VALUES(' JUNTA PARA PT2636','GRIFERÍA',1082,'SIN DESCRIPCIÓN DISPONIBLE','QOJ8754',21,0,'');
INSERT INTO PRODUCTO VALUES(' JGO DESTORNILLADORES MANGO ERGONIC DE 5 PIEZAS, 3 PLANOS 4,0 X 100, 5,5 X 125, 6,5 X 150, Y 2 CRUZ PH1 X 80, PH2 X 100','HERRAMIENTA ELÉCTRICA',24375,'SIN DESCRIPCIÓN DISPONIBLE','LZV9360',8,0,'');
INSERT INTO PRODUCTO VALUES(' DADO []1/2" POLIGONAL DE 12 MM.','HERRAMIENTAS',1493,'SIN DESCRIPCIÓN DISPONIBLE','OUZ5329',89,0,'');
INSERT INTO PRODUCTO VALUES(' NAPOLEON CORTACABLE COBRE ALUMINIO ACERO DE 20 MM.','MOBILIARIO DE COCINA',289914,'SIN DESCRIPCIÓN DISPONIBLE','SUA9568',82,0,'');
INSERT INTO PRODUCTO VALUES(' ESPACIADOR PARA PT326','PARA OBRA Y DECORACIÓN',647,'SIN DESCRIPCIÓN DISPONIBLE','USB2852',97,0,'');
INSERT INTO PRODUCTO VALUES(' ESCARIADOR CONICO A/R 20 MM.','SANITARIOS Y LAVADOS',36690,'SIN DESCRIPCIÓN DISPONIBLE','MJL2137',15,0,'');
INSERT INTO PRODUCTO VALUES(' PISTOLA DE ALTA PRESION 4001B, GRAVEDAD, PRESION DE TRABAJO 50-80 PSI, CONSUMO DE AIRE 7-12 PSI, DEPOSITO PLASTICO 600 CC. BOQUILLA PASO 1,7MM','PEQUEÑO ELECTRODOMÉSTICO',15450,'SIN DESCRIPCIÓN DISPONIBLE','KPS5775',12,0,'');
INSERT INTO PRODUCTO VALUES(' VIDRIO OSCURO REDONDO 50 MM GRADO 5','SANITARIOS Y LAVADOS',110,'SIN DESCRIPCIÓN DISPONIBLE','QEV3111',22,0,'');
INSERT INTO PRODUCTO VALUES(' ESPATULA FLEXIBLE BIMAT. AC/INOX. 150 MM','MOBILIARIO DE JARDÍN',4432,'SIN DESCRIPCIÓN DISPONIBLE','CSU2412',72,0,'');
INSERT INTO PRODUCTO VALUES(' BROCA CONO MORSE A/R 49.00 MM.','MOBILIARIO DE JARDÍN',219465,'SIN DESCRIPCIÓN DISPONIBLE','PFK6259',22,0,2,'2016-07-03');
INSERT INTO PRODUCTO VALUES(' PLANA ALBAÑIL PUNTA 125 X  70  MM.','ACCESORIOS DE BAÑO',11600,'SIN DESCRIPCIÓN DISPONIBLE','CCS3668',76,0,'');
INSERT INTO PRODUCTO VALUES(' THROTTLE VALVE SEAT','ACCESORIOS DE BAÑO',850,'SIN DESCRIPCIÓN DISPONIBLE','IPT1336',61,0,'');
INSERT INTO PRODUCTO VALUES(' CABEZAL 1/4" BSPT TERRAJA OOR','EQUIPAMIENTO DE HABITACIONES',87980,'SIN DESCRIPCIÓN DISPONIBLE','JDQ3884',26,0,'');
INSERT INTO PRODUCTO VALUES(' LIMA PLANA 2º CORTE DE  4"','SANITARIOS Y LAVADOS',2412,'SIN DESCRIPCIÓN DISPONIBLE','YSZ1571',94,0,'');
INSERT INTO PRODUCTO VALUES(' BROCA CONCRETO 20X 240/300 SDS-PLUS','FERRETERÍA GENERAL',7862,'SIN DESCRIPCIÓN DISPONIBLE','FST1439',46,0,'');
INSERT INTO PRODUCTO VALUES(' PANEL FRONTAL PARA #488','HERRAMIENTAS',112308,'SIN DESCRIPCIÓN DISPONIBLE','EGH1757',88,0,'');
INSERT INTO PRODUCTO VALUES(' LIJADORA DE HOJA 1/4",  POTENCIA 220 W., VELOC. ORBITAL 16000 OPM., OSCILACION: 32000 OPM.,  MEDIDA 114 X 140 MM. CON RECOLECTOR DE POLVO','METALISTERÍA',29024,'SIN DESCRIPCIÓN DISPONIBLE','QNW2711',71,0,14,'2016-07-03');
INSERT INTO PRODUCTO VALUES(' SIERRA COPA MULTI MADERA    1"  (25 MM.)','PEQUEÑO ELECTRODOMÉSTICO',5088,'SIN DESCRIPCIÓN DISPONIBLE','XBP5578',31,0,'');
INSERT INTO PRODUCTO VALUES(' ESPIGA P/UNION MANGUERAS  3/8" X 3/8"','MOBILIARÍO DE BAÑO',1237,'SIN DESCRIPCIÓN DISPONIBLE','JDC1348',87,0,'');
INSERT INTO PRODUCTO VALUES(' GUADAÑA MOD. ANCHO DE 22" J 115 FORJADAS A MANO','SANITARIOS Y LAVADOS',23750,'SIN DESCRIPCIÓN DISPONIBLE','KTY4246',27,0,'');
INSERT INTO PRODUCTO VALUES(' CONJUNTO EJE IV CON RODAMIENTOS','HERRAMIENTA ELÉCTRICA',66580,'SIN DESCRIPCIÓN DISPONIBLE','GTU4246',91,0,'');
INSERT INTO PRODUCTO VALUES(' ALICATE UNIVERSAL 7" MANGO NEGRO BLISTER','CERRAJERÍA',1767,'SIN DESCRIPCIÓN DISPONIBLE','PZK8274',61,0,'');
INSERT INTO PRODUCTO VALUES(' DESTORNILLADOR NEUMATICO HEAVY DUTY, TORQUE FIJO 145 LB/PULG-16 NM, VELOCIDAD 800 RPM, PINZA DE 1/4", CONSUMO DE AIRE 114 LT/MIN, ENTRADA AIRE 1/4", PESO 1,2K','CERRAJERÍA',64605,'SIN DESCRIPCIÓN DISPONIBLE','YUZ3295',95,0,'');
INSERT INTO PRODUCTO VALUES(' PINCELES A- 2','PEQUEÑO ELECTRODOMÉSTICO',653,'SIN DESCRIPCIÓN DISPONIBLE','OKK3365',82,0,24,'2016-07-03');
INSERT INTO PRODUCTO VALUES(' BARRA DE CABEZAL MODULO B','PARA OBRA Y DECORACIÓN',284400,'SIN DESCRIPCIÓN DISPONIBLE','FWG6458',21,0,'');
INSERT INTO PRODUCTO VALUES(' AZADA CON ENCAJE DE MANGO SOLDADO  7" DE 90 X 179 MM.','UTENSILIOS Y COMPLEMENTOS',4167,'SIN DESCRIPCIÓN DISPONIBLE','NAL2198',91,0,06,'2016-07-03');
INSERT INTO PRODUCTO VALUES(' TALADRO NEUMATICO DE 1/2" HEAVY DUTY REVERSIBLE, VELOCIDAD 800 RPM, CONSUMO DE AIRE 110 LT/MIN, ENTRADA DE AIRE 1/4" PESO 1,80 KGS.','HERRAMIENTA ELÉCTRICA',71685,'SIN DESCRIPCIÓN DISPONIBLE','LPM7823',64,0,'');
INSERT INTO PRODUCTO VALUES(' TALADRO DE COLUMNA 1.5 HP, 380 VOLTS, PARA BROCA HASTA 1.1/4",  12 VELOCIDADES','ELECTRODOMÉSTICO',525770,'SIN DESCRIPCIÓN DISPONIBLE','FOH5583',19,0,'');
INSERT INTO PRODUCTO VALUES(' PASADOR DEL MARTILLO PARA PT5124','ARTÍCULOS DE JARDÍN',3164,'SIN DESCRIPCIÓN DISPONIBLE','UJD2545',85,0,'');
INSERT INTO PRODUCTO VALUES(' RACORD ACOPLE RAPIDO HILO MACHO DE 1/4"','ACCESORIOS DE BAÑO',270,'SIN DESCRIPCIÓN DISPONIBLE','QDD1292',41,0,'');
INSERT INTO PRODUCTO VALUES(' GATILLO PISTOLIN DE ACEITE','ELECTRODOMÉSTICO',5934,'SIN DESCRIPCIÓN DISPONIBLE','EUB5101',99,0,'');
INSERT INTO PRODUCTO VALUES(' TECLE ELECTRICO MONOFASICO 0.5 T X 6 MT.','CERRAJERÍA',900750,'SIN DESCRIPCIÓN DISPONIBLE','VRE8326',93,0,'');
INSERT INTO PRODUCTO VALUES(' INFLADOR DE NEUMATICOS CON MANOMETRO DE BARRA DE 10 A 120 PSI, 1.0 A 8.0 BAR EN METAL, DOBLE TOMA, ENTRADA DE 1/4", EN BLISTER','CERRAJERÍA',23906,'SIN DESCRIPCIÓN DISPONIBLE','EIR8663',12,0,'');
INSERT INTO PRODUCTO VALUES(' CERRADURA TUBULAR DE POMO  #578 SOLO POMO EXTERIOR SIN LLAVE, CROMADA','UTENSILIOS Y COMPLEMENTOS',1650,'SIN DESCRIPCIÓN DISPONIBLE','GXC3890',38,0,'');
INSERT INTO PRODUCTO VALUES(' BROCA CILINDRICA A/R 25.0  MM.','MOBILIARÍO DE BAÑO',88484,'SIN DESCRIPCIÓN DISPONIBLE','EJA8317',62,0,'');
INSERT INTO PRODUCTO VALUES(' BIELA','EQUIPAMIENTO DE JARDÍN',902,'SIN DESCRIPCIÓN DISPONIBLE','IUQ5555',42,0,'');
INSERT INTO PRODUCTO VALUES(' MUELA DE    1"    P/DOBLADORA DE TUBOS','PARA OBRA Y DECORACIÓN',80160,'SIN DESCRIPCIÓN DISPONIBLE','VRN7888',53,0,'');