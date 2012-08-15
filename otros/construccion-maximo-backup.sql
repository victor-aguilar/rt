SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `liceocom_tutorias` ;
CREATE SCHEMA IF NOT EXISTS `liceocom_tutorias` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `liceocom_tutorias` ;

-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Entidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Entidades` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Entidades` (
  `idEntidad` INT NOT NULL ,
  `nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`idEntidad`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Municipios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Municipios` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Municipios` (
  `idMunicipios` INT NOT NULL ,
  `nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`idMunicipios`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Localidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Localidades` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Localidades` (
  `idLocalidad` INT NOT NULL ,
  `nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`idLocalidad`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Nodos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Nodos` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Nodos` (
  `idNodo` INT NOT NULL ,
  `nombre` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`idNodo`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Turno` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Turno` (
  `idTurno` INT NOT NULL ,
  `nombre` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`idTurno`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Nivel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Nivel` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Nivel` (
  `idNivel` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idNivel`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Modalidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Modalidad` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Modalidad` (
  `idModalidad` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idModalidad`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Usuarios` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT ,
  `nick` VARCHAR(45) NOT NULL ,
  `nombre` VARCHAR(20) NOT NULL ,
  `apellidos` VARCHAR(40) NOT NULL ,
  `sexo` ENUM('mujer','hombre','maquina') NOT NULL DEFAULT 'maquina' ,
  `email` VARCHAR(255) NOT NULL ,
  `telefono` VARCHAR(25) NOT NULL ,
  `contraseña` VARCHAR(15) NOT NULL ,
  `cct` VARCHAR(255) NOT NULL ,
  `idEntidad` INT NOT NULL ,
  `idMunicipio` INT NOT NULL ,
  `idLocalidad` INT NOT NULL ,
  `idNodo` INT NOT NULL ,
  `idTurno` INT NOT NULL ,
  `idNivel` INT NOT NULL DEFAULT 1 ,
  `idModalidad` INT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idUsuario`) ,
  INDEX `idEntidadUsuarios` (`idEntidad` ASC) ,
  INDEX `idMunicipioUsuarios` (`idMunicipio` ASC) ,
  INDEX `idLocalidadUsuarios` (`idLocalidad` ASC) ,
  INDEX `idNodoUsuarios` (`idNodo` ASC) ,
  INDEX `idTurnoUsuarios` (`idTurno` ASC) ,
  INDEX `idNivelUsuarios` (`idNivel` ASC) ,
  INDEX `idModalidad` (`idModalidad` ASC) ,
  UNIQUE INDEX `nick_UNIQUE` (`nick` ASC) ,
  CONSTRAINT `idEntidadUsuarios`
    FOREIGN KEY (`idEntidad` )
    REFERENCES `liceocom_tutorias`.`Entidades` (`idEntidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMunicipioUsuarios`
    FOREIGN KEY (`idMunicipio` )
    REFERENCES `liceocom_tutorias`.`Municipios` (`idMunicipios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLocalidadUsuarios`
    FOREIGN KEY (`idLocalidad` )
    REFERENCES `liceocom_tutorias`.`Localidades` (`idLocalidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idNodoUsuarios`
    FOREIGN KEY (`idNodo` )
    REFERENCES `liceocom_tutorias`.`Nodos` (`idNodo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTurnoUsuarios`
    FOREIGN KEY (`idTurno` )
    REFERENCES `liceocom_tutorias`.`Turno` (`idTurno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idNivelUsuarios`
    FOREIGN KEY (`idNivel` )
    REFERENCES `liceocom_tutorias`.`Nivel` (`idNivel` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idModalidad`
    FOREIGN KEY (`idModalidad` )
    REFERENCES `liceocom_tutorias`.`Modalidad` (`idModalidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Temas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Temas` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Temas` (
  `idTema` INT NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  `idUsuario` INT NOT NULL ,
  `keywords` VARCHAR(255) NULL ,
  PRIMARY KEY (`idTema`) ,
  UNIQUE INDEX `nombre_idUsuario` (`nombre` ASC, `idUsuario` ASC) ,
  INDEX `idUsuarioTemas` (`idUsuario` ASC) ,
  CONSTRAINT `idUsuarioTemas`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `liceocom_tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Tutorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Tutorias` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Tutorias` (
  `idTutoria` INT NOT NULL AUTO_INCREMENT ,
  `estudiante` INT NOT NULL ,
  `idTema` INT NOT NULL ,
  PRIMARY KEY (`idTutoria`) ,
  UNIQUE INDEX `estudiante_idtema` (`estudiante` ASC, `idTema` ASC) ,
  INDEX `estudianteTutorias` (`estudiante` ASC) ,
  INDEX `idTemaTutorias` (`idTema` ASC) ,
  CONSTRAINT `estudianteTutorias`
    FOREIGN KEY (`estudiante` )
    REFERENCES `liceocom_tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTemaTutorias`
    FOREIGN KEY (`idTema` )
    REFERENCES `liceocom_tutorias`.`Temas` (`idTema` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Etapas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Etapas` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Etapas` (
  `idEtapa` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idEtapa`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Historial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Historial` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Historial` (
  `idTutoria` INT NOT NULL ,
  `idUsuario` INT NOT NULL ,
  `fecha` TIMESTAMP NOT NULL ,
  `mensaje` VARCHAR(255) NOT NULL ,
  `autorizacion` TINYINT(1) NOT NULL ,
  `idEtapa` INT NOT NULL ,
  INDEX `idTutoriaHistorial` (`idTutoria` ASC) ,
  INDEX `idUsuarioHistorial` (`idUsuario` ASC) ,
  INDEX `idEtapaHistorial` (`idEtapa` ASC) ,
  CONSTRAINT `idTutoriaHistorial`
    FOREIGN KEY (`idTutoria` )
    REFERENCES `liceocom_tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuarioHistorial`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `liceocom_tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEtapaHistorial`
    FOREIGN KEY (`idEtapa` )
    REFERENCES `liceocom_tutorias`.`Etapas` (`idEtapa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Demostraciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Demostraciones` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Demostraciones` (
  `idTutoria` INT NOT NULL ,
  `fechaInicio` TIMESTAMP NOT NULL DEFAULT '2001-01-01 00:00:00' ,
  `fechaFin` TIMESTAMP NOT NULL DEFAULT '2001-01-01 00:00:00' ,
  `fechaDeLaDemostracion` TIMESTAMP NOT NULL DEFAULT '2001-01-01 00:00:00' ,
  INDEX `idTutoriaDemostraciones` (`idTutoria` ASC) ,
  UNIQUE INDEX `idTutoria_UNIQUE` (`idTutoria` ASC, `fechaInicio` ASC, `fechaFin` ASC, `fechaDeLaDemostracion` ASC) ,
  CONSTRAINT `idTutoriaDemostraciones`
    FOREIGN KEY (`idTutoria` )
    REFERENCES `liceocom_tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Sinodales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Sinodales` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Sinodales` (
  `idTutoria` INT NOT NULL ,
  `idUsuario` INT NOT NULL ,
  `dictamen` TINYINT(1) NOT NULL DEFAULT FALSE ,
  INDEX `idTutoriaSinodales` (`idTutoria` ASC) ,
  INDEX `idUsuarioSinodales` (`idUsuario` ASC) ,
  PRIMARY KEY (`idTutoria`, `idUsuario`) ,
  CONSTRAINT `idTutoriaSinodales`
    FOREIGN KEY (`idTutoria` )
    REFERENCES `liceocom_tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuarioSinodales`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `liceocom_tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Mensajes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Mensajes` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Mensajes` (
  `idTutoria` INT NOT NULL ,
  `idUsuario` INT NOT NULL ,
  `mili` INT NOT NULL ,
  `fecha` TIMESTAMP NOT NULL ,
  `mensaje` VARCHAR(255) NOT NULL ,
  `autorizacion` TINYINT(1) NOT NULL ,
  `idEtapa` INT NOT NULL ,
  INDEX `idTutoriaMensajes` (`idTutoria` ASC) ,
  INDEX `idUsuarioMensajes` (`idUsuario` ASC) ,
  INDEX `idEtapaMensajes` (`idEtapa` ASC) ,
  CONSTRAINT `idTutoriaMensajes`
    FOREIGN KEY (`idTutoria` )
    REFERENCES `liceocom_tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuarioMensajes`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `liceocom_tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEtapaMensajes`
    FOREIGN KEY (`idEtapa` )
    REFERENCES `liceocom_tutorias`.`Etapas` (`idEtapa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Periodos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Periodos` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Periodos` (
  `idPeriodo` INT NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`idPeriodo`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`ComponenteEjeCategoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`ComponenteEjeCategoria` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`ComponenteEjeCategoria` (
  `idComponenteEjeCategoria` INT NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`idComponenteEjeCategoria`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Asignaturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Asignaturas` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Asignaturas` (
  `idAsignatura` INT NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`idAsignatura`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Recursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Recursos` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Recursos` (
  `idTema` INT NOT NULL ,
  `url` VARCHAR(255) NOT NULL ,
  `descripcion` VARCHAR(255) NOT NULL ,
  `hint` VARCHAR(100) NOT NULL ,
  INDEX `idTemaRecursos` (`idTema` ASC) ,
  CONSTRAINT `idTemaRecursos`
    FOREIGN KEY (`idTema` )
    REFERENCES `liceocom_tutorias`.`Temas` (`idTema` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Estandares`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Estandares` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Estandares` (
  `idEstandar` INT NOT NULL ,
  `idPeriodo` INT NOT NULL ,
  `idAsignatura` INT NOT NULL ,
  `idComponenteEjeCategoria` INT NOT NULL ,
  `descripcion` VARCHAR(255) NOT NULL ,
  INDEX `idPeriodoEstandares` (`idPeriodo` ASC) ,
  INDEX `idAsignaturaEstandares` (`idAsignatura` ASC) ,
  INDEX `idComponenteEjeCategoriaEstandares` (`idComponenteEjeCategoria` ASC) ,
  PRIMARY KEY (`idEstandar`) ,
  CONSTRAINT `idPeriodoEstandares`
    FOREIGN KEY (`idPeriodo` )
    REFERENCES `liceocom_tutorias`.`Periodos` (`idPeriodo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAsignaturaEstandares`
    FOREIGN KEY (`idAsignatura` )
    REFERENCES `liceocom_tutorias`.`Asignaturas` (`idAsignatura` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idComponenteEjeCategoriaEstandares`
    FOREIGN KEY (`idComponenteEjeCategoria` )
    REFERENCES `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`EstandaresDeTema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`EstandaresDeTema` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`EstandaresDeTema` (
  `idTema` INT NOT NULL ,
  `idEstandar` INT NOT NULL ,
  INDEX `idTemaEstandaresDeTema` (`idTema` ASC) ,
  INDEX `idEstandarEstandaresDeTema` (`idEstandar` ASC) ,
  CONSTRAINT `idTemaEstandaresDeTema`
    FOREIGN KEY (`idTema` )
    REFERENCES `liceocom_tutorias`.`Temas` (`idTema` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstandarEstandaresDeTema`
    FOREIGN KEY (`idEstandar` )
    REFERENCES `liceocom_tutorias`.`Estandares` (`idEstandar` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`Productos` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`Productos` (
  `idTutoria` INT NOT NULL ,
  `url` VARCHAR(255) NOT NULL ,
  `descripcion` VARCHAR(255) NOT NULL ,
  `hint` VARCHAR(100) NOT NULL ,
  INDEX `idTutoriaProductos` (`idTutoria` ASC) ,
  CONSTRAINT `idTutoriaProductos`
    FOREIGN KEY (`idTutoria` )
    REFERENCES `liceocom_tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liceocom_tutorias`.`MensajesPrivados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liceocom_tutorias`.`MensajesPrivados` ;

CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`MensajesPrivados` (
  `idMensajePrivado` INT NOT NULL AUTO_INCREMENT ,
  `de` INT NOT NULL ,
  `para` INT NOT NULL ,
  `asunto` VARCHAR(45) NOT NULL ,
  `mensaje` TEXT NOT NULL ,
  `fecha` TIMESTAMP NOT NULL DEFAULT "2012-12-12 00:00:00" ,
  `leido` TINYINT(1) NOT NULL DEFAULT 0 ,
  INDEX `indicePara` USING BTREE (`para` ASC) ,
  INDEX `deMensajesPrivados` (`de` ASC) ,
  INDEX `paraMensajesPrivados` (`para` ASC) ,
  PRIMARY KEY (`idMensajePrivado`) ,
  CONSTRAINT `deMensajesPrivados`
    FOREIGN KEY (`de` )
    REFERENCES `liceocom_tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `paraMensajesPrivados`
    FOREIGN KEY (`para` )
    REFERENCES `liceocom_tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- procedure borra
-- -----------------------------------------------------

USE `liceocom_tutorias`;
DROP procedure IF EXISTS `liceocom_tutorias`.`borra`;

DELIMITER $$
USE `liceocom_tutorias`$$
create procedure borra()
begin
delete from recursos;
delete from mensajes;
delete from historial;
delete from productos;
delete from mensajesPrivados;
delete from sinodales;
end $$

DELIMITER ;

-- -----------------------------------------------------
-- procedure guardaMensaje
-- -----------------------------------------------------

USE `liceocom_tutorias`;
DROP procedure IF EXISTS `liceocom_tutorias`.`guardaMensaje`;

DELIMITER $$
USE `liceocom_tutorias`$$
CREATE PROCEDURE guardaMensaje(

IN _idTutoria integer, 

IN _idUsuario integer,

IN _fecha timestamp,

IN _mensaje varchar(255),

IN _autorizacion boolean,

IN _idEtapa integer,

OUT _mili integer) 

BEGIN

    INSERT INTO Historial VALUES (_idTutoria, _idUsuario, _fecha, _mensaje, _autorizacion, _idEtapa);

    SELECT COUNT(*) INTO _mili FROM Mensajes AS m WHERE m.fecha = _fecha;

    INSERT INTO Mensajes VALUES (_idTutoria, _idUsuario, _mili, _fecha, _mensaje, _autorizacion, _idEtapa);

END$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Entidades`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (1,'Aguascalientes');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (2,'Baja California');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (3,'Baja California Sur');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (4,'Campeche');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (7,'Chiapas');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (8,'Chihuahua');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (5,'Coahuila');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (6,'Colima');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (9,'Distrito Federal');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (10,'Durango');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (11,'Guanajuato');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (12,'Guerrero');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (13,'Hidalgo');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (14,'Jalisco');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (15,'México');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (16,'Michoacán');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (17,'Morelos');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (18,'Nayarit');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (19,'Nuevo León');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (20,'Oaxaca');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (21,'Puebla');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (22,'Querétaro');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (23,'Quintana Roo');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (24,'San Luis Potosí');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (25,'Sinaloa');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (26,'Sonora');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (27,'Tabasco');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (28,'Tamaulipas');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (29,'Tlaxcala');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (30,'Veracruz ');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (31,'Yucatán');
INSERT INTO `Entidades` (`idEntidad`,`nombre`) VALUES (32,'Zacatecas');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Municipios`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Municipios` (`idMunicipios`, `nombre`) VALUES (0, 'municipio');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Localidades`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Localidades` (`idLocalidad`, `nombre`) VALUES (0, 'localidad');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Nodos`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Nodos` (`idNodo`, `nombre`) VALUES (1, 'Nacional');
INSERT INTO `liceocom_tutorias`.`Nodos` (`idNodo`, `nombre`) VALUES (2, 'Estatal');
INSERT INTO `liceocom_tutorias`.`Nodos` (`idNodo`, `nombre`) VALUES (3, 'Regional');
INSERT INTO `liceocom_tutorias`.`Nodos` (`idNodo`, `nombre`) VALUES (4, 'Escolar');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Turno`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Turno` (`idTurno`, `nombre`) VALUES (1, 'Matutino');
INSERT INTO `liceocom_tutorias`.`Turno` (`idTurno`, `nombre`) VALUES (2, 'Vespertino');
INSERT INTO `liceocom_tutorias`.`Turno` (`idTurno`, `nombre`) VALUES (3, 'Tiempo Completo');
INSERT INTO `liceocom_tutorias`.`Turno` (`idTurno`, `nombre`) VALUES (4, 'Jornada Ampliada');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Nivel`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Nivel` (`idNivel`, `nombre`) VALUES (1, 'Preescolar');
INSERT INTO `liceocom_tutorias`.`Nivel` (`idNivel`, `nombre`) VALUES (2, 'Primaria');
INSERT INTO `liceocom_tutorias`.`Nivel` (`idNivel`, `nombre`) VALUES (3, 'Secundaria');
INSERT INTO `liceocom_tutorias`.`Nivel` (`idNivel`, `nombre`) VALUES (4, 'Educación Especial');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Modalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (1, 'Preescolar Inicial');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (2, 'Preescolar General');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (3, 'Preescolar Comunitario');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (4, 'Preescolar Indígena');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (5, 'Primaria General');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (6, 'Primaria Comunitaria');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (7, 'Primaria Indigena');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (8, 'Secundaria General');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (9, 'Secundaria Tecnica');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (10, 'Secundaria Comunitaria');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (11, 'Secundaria Para Trabajadores');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (12, 'Telesecundaria');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (13, 'Educación Especial CAM');
INSERT INTO `liceocom_tutorias`.`Modalidad` (`idModalidad`, `nombre`) VALUES (14, 'Educación Especial USAER');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (0,'esviap','esviap','sistema','mujer','deathstar@la69.sep','0','8182','0',1,0,0,1,1,1,1);

INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (2,'victor','victor','0','hombre','victor.aguilar@ciencias.unam.mx','0','victor','0',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (3,'toño','toño','0','hombre','antoniohernandez@ciencias.unam.mx','0','toño','0',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (4,'hector0','hector','0','hombre','hector@gmail.com','0','hector','0',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (5,'tonio','Antonio','Hernandez','hombre','tono1989@gmail.com','56759272','tonio','GUHT',1,0,0,4,1,1,2);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (22,'AlmaQ','Alma','Cuervo','mujer','.','0','12345','0',1,0,0,4,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (23,'Naye','NAYELI','MEJIA BECERRA','mujer','yeli.admonedu@gmail.com','5517006837','231988','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (26,'FIGAR','Jose Fidel','Garcia Reyes','hombre','figar99@hotmail.com','2224265209','250478_fg','SEB',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (30,'Arturo','Arturo','Rodríguez Guerrero','hombre','.','.','12345','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (33,'Martiux','Martha','Casas','mujer','martiux21@gmail.com','.','5toelemento','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (34,'Virginia','Virginia','Mazón','mujer','.','.','12345','.',1,0,0,4,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (35,'Héctor','Héctor','Monges Morán','hombre','.','.','12345','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (36,'Jokabed','Jokabed','Zagoya Mellado','mujer','.','.','12345','.',1,0,0,4,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (40,'Sara','Sara','Vogel','mujer','.','.','12345','.',1,0,0,4,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (42,'María Esther','María Esther','Padilla Medina','mujer','.','.','12345','.',1,0,0,4,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (47,'tutoriara','Araceli','Castillo','mujer','araseppe@gmail.com','.','licearatutoria','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (49,'Adán Rivera','Adán','Rivera Ramos','hombre','adals.guana@hotmail.com','01(55)36014000','chinaproduce','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (50,'ekutoru','hector','monges morán','hombre','ekutoru@yahoo.com','36014000 ext.23907','iakattakai','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (51,'Alvarín1','Álvaro','de Ávila Aguilar','hombre','2012alavag@gmail.com','4925442952','ALVARINES2','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (52,'patt_rodriguez','Patricia','Rodríguez Cordero','mujer','patrirod_24@yahoo.com.mx','5529547304','patricia','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (53,'ALVARIN2','ALVARO','DE AVILA AGUILAR','hombre','2012alavag@gmail.com','4925442952','ALVARINES3','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (54,'Diana','diana','lopez','mujer','dyana3@gmail.com','.','caminando3','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (55,'Yolito','Laura Beatriz','Meneses Chico','mujer','pejpeni@gmail.com','5525130226','marakatu','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (56,'alvarin3','Álvaro','de Ávila Aguilar','hombre','2012alavag@gmail.com','4925442952','ALVARINES4','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (57,'Pablo26','JUAN PABLO','REYES BERNAL','hombre','rpjb26@hotmail.com','5529409418','cucopupes2609','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (58,'Pilar','Pilar','Herrera','mujer','pilar.multigrado@gmail.com','55-1008-6909','contraseña','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (59,'Joka','Jokabed','Zagoya Mellado','mujer','jozam_burbuja@yahoo.com.mx','.','lindavenus23','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (60,'luisge','Luis Gerardo','Cisneros Hernández','hombre','luisge8@yahoo.com.mx','5531904353','amanda','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (61,'smzamudio','Sandra','Zamudio Hernández','mujer','sandzam@hotmail.com','46221298','europa41','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (62,'vic','victor','aguilar Gonzaga','hombre','victor.aguilar@yahoo.com.mx','21579919','vic','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (63,'Constelación','Consuelo','González Araujo','mujer','cony_gto@hotmail.com','5535142204','orion88','SEB',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (64,'Oscar','Oscar','Gonzalez Valencia','hombre','oscarinfomx@gmail.com','.','12345','.',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (65,'jprosete','Juan Pedro','Rosete Valencia','hombre','jprosete@hotmail.com','2431039789','santis54321','SEB',1,0,0,1,1,1,1);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27190,'wilbur','wilfred','güemess','hombre','lorddive@gmail.com','456456','w','abc',1,0,0,4,2,1,3);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27194,'v','v','v','hombre','v@v','2','v','e',1,0,0,4,1,1,2);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27195,'betun','beto','betún','hombre','a@b','12345','b','121231',1,0,0,4,1,2,3);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27196,'a','a','b','hombre','a@b','11','b','asd',2,0,0,4,1,1,3);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27197,'hola','a','b','hombre','lorddive@gmail.com','456456','hola','abc',2,0,0,2,2,2,3);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27201,'wilburcito','wilbur','wi','hombre','a@b','12345','w','121231',32,0,0,4,1,1,4);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27213,'Eva Triana','Eva','Triana Juarez','mujer','e.triana.j@gmail.com.mx','2147483647','calle2012','',9,0,0,1,1,3,8);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27216,'ollinyamil','ANDREA VIRIDIANA','VILLARREAL VIZUET','mujer','ollinyamil@gmail.com','2147483647','martincito','',9,0,0,4,1,3,8);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27217,'gerardoespinosa2','Gerardo','Espinosa Espinosa ','hombre','gerardoespinosa2@yahoo.com.mx','2147483647','carmina6','',9,0,0,1,1,3,9);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27224,'cleare','cleare','redfield','hombre','cleare@yahoo.com','2','cleare','',1,0,0,4,1,1,2);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27226,'chris','chris','redfield','hombre','r@r','1','chris','',1,0,0,4,1,2,2);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27228,'maguilars','manuel','aguilar soto','hombre','manuelaguilar1265@hotmail.com','36014000','sicoloco','',9,0,0,1,1,3,12);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27232,'NoraHilda','Nora Hilda','Acevedo Ruvalcaba','mujer','nharuvalcaba@gmail.com','0','Mexico2013','',9,0,0,1,1,2,5);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27233,'SandraOrtiz','Sandra','Ortiz  Martínez','mujer','sandraortizmartinez@gmail.com','2147483647','ortiz765','',9,0,0,1,1,3,12);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27234,'Danaian','Deifilia','Zárate Arias','mujer','deizax@gmail.com','0','luna','',9,0,0,1,1,3,12);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27235,'tonioanj','Antonio','Hernandez','hombre','tono1989@gmail.com','0','1','GUHT',32,0,0,2,1,1,2);
INSERT INTO `Usuarios` (`idUsuario`,`nick`,`nombre`,`apellidos`,`sexo`,`email`,`telefono`,`contraseña`,`cct`,`idEntidad`,`idMunicipio`,`idLocalidad`,`idNodo`,`idTurno`,`idNivel`,`idModalidad`) VALUES (27236,'cieloes','María Graciela','Estrada Estrada','mujer','cieloes3000@gmail.com','0','1997','',9,0,0,1,1,1,1);


COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Temas`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (1,'Lee de manera autónoma una variedad de textos con diversos propósitos: aprender, informarse, divertirse.',1,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (2,'El area del bikini',2,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (3,'diles que no me maten',26,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (4,'Tema 4a',40,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (5,'demo',3,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (6,'Tema Alma',22,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (7,'Tema Paty',52,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (8,'Tema Araceli',47,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (9,'Tema Pili',58,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (10,'Tema Albaro',53,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (11,'Tema Juan Pablo',57,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (12,'Tema Diana',54,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (13,'Soneto sonetil',65,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (14,'Tema 4 Alma',22,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (18,'Área del cuadrado',33,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (19,'Diles que no me maten',33,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (20,'El Segador',33,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (21,'La historia y el olvido',33,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (22,'La Muerte tiene permiso',33,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (23,'Listones para los moños',33,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (24,'Nos han dado la tierra',33,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (25,'Tetraedo',33,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (26,'¿Cuántos cubos forman el prisma?',36,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (28,'Problema con curvas. Número 2',36,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (29,'Secuencia 6. Proporcionalidad',36,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (30,'Sesión 1. Operaciones con números naturales',36,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (31,'Sesión 2. Fracciones',36,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (32,'Sesión 3. Proporcionalidad',36,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (33,'Sesión 4. Geometría',36,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (38,'El Cultivo Fracciones',40,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (39,'Nos han dado la tierra',40,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (66,'tema1',22,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (67,'tema2',22,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (70,'tema3',51,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (71,'Diles que no me maten',52,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (72,'Fuera del círculo de tiza',57,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (73,'Oetzi, el hombre de hielo',57,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (74,'Operaciones con números naturales',57,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (75,'¿Quién dirige a quien?',57,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (76,'Geometria',57,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (77,'Leer y comparar poemas de dos autores	',57,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (78,'Identificar y describir escenarios y personajes de cuentos.',57,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (79,'El caballo rojo',51,'');
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (80,'unos',2,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (81,'El area del bikini (conceptos y fórmulas  geométricas)  ',2,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (82,'Fracciones (carrera de carros) Tema 2 de Lee, piensa, decide y aprende ',2,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (83,'Proporcionalidad (Elaboración de galletas) Tema 3 de Lee, piensa, decide y aprende',2,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (84,'Comprensión de lectura en texto literario',2,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (85,'Razonamiento algebráico en un problema matemático',2,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (86,'A través de los ojos de la ciencia',2,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (87,'Tema de Nora',33,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (90,'Tema de  Eva Triana',27213,NULL);
INSERT INTO `Temas` (`idTema`,`nombre`,`idUsuario`,`keyWords`) VALUES (91,'Tema de Gerardo Prueba',27217,NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Tutorias`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (1,1,1);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (5,1,2);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (2,2,1);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (21,2,5);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (37,2,18);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (3,3,1);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (22,3,2);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (4,4,1);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (10,4,3);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (12,23,6);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (33,23,14);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (36,26,13);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (11,42,4);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (14,49,8);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (15,55,9);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (17,59,11);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (20,60,5);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (16,60,10);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (13,61,7);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (43,61,90);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (18,63,12);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (38,27201,67);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (41,27216,91);
INSERT INTO `Tutorias` (`idTutoria`,`estudiante`,`idTema`) VALUES (42,27232,87);

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Etapas`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (1, 'uno');
INSERT INTO `liceocom_tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (5, 'Demostracion');
INSERT INTO `liceocom_tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (2, 'dos');
INSERT INTO `liceocom_tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (3, 'tres');
INSERT INTO `liceocom_tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (4, 'cuatro');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Demostraciones`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Demostraciones` (`idTutoria`, `fechaInicio`, `fechaFin`, `fechaDeLaDemostracion`) VALUES (4, '2012-07-07 12:20:21', '2012-07-07 12:20:22', '2012-07-07 12:20:20');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Sinodales`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (4,2,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (4,4,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (5,2,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (5,3,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (5,4,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (10,1,1);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (10,30,1);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (11,34,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (11,36,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (20,33,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (20,35,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (20,52,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (20,53,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (20,54,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (21,3,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (21,22,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (21,57,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (22,3,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (22,35,0);
INSERT INTO `Sinodales` (`idTutoria`,`idUsuario`,`dictamen`) VALUES (22,62,0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Periodos`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Periodos` (`idPeriodo`, `nombre`) VALUES (2, 'Segundo periodo escolar, al concluir el tercer grado de primaria');
INSERT INTO `liceocom_tutorias`.`Periodos` (`idPeriodo`, `nombre`) VALUES (3, 'Tercer periodo escolar, al concluir el sexto grado de primaria');
INSERT INTO `liceocom_tutorias`.`Periodos` (`idPeriodo`, `nombre`) VALUES (4, 'Cuarto periodo escolar, al concluir el tercer grado de secundaria');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`ComponenteEjeCategoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (1, 'Actitud hacia el estudio de las matemáticas');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (2, 'Actitudes asociadas a la ciencia');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (3, 'Actitudes hacia el lenguaje');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (4, 'Aplicaciones del conocimiento científico y de la tecnología');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (5, 'Conocimiento científico');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (6, 'Conocimiento del funcionamiento y uso del lenguaje');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (7, 'Forma, espacio y medida');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (8, 'Habilidades asociadas a la ciencia');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (9, 'Manejo de la información');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (10, 'Participación en eventos comunicativos orales');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (11, 'Procesos de lectura');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (12, 'Producción de textos escritos');
INSERT INTO `liceocom_tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (13, 'Sentido numérico y pensamiento algebraico');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Asignaturas`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Asignaturas` (`idAsignatura`, `nombre`) VALUES (1, 'Español');
INSERT INTO `liceocom_tutorias`.`Asignaturas` (`idAsignatura`, `nombre`) VALUES (2, 'Matemáticas');
INSERT INTO `liceocom_tutorias`.`Asignaturas` (`idAsignatura`, `nombre`) VALUES (3, 'Ciencias');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Estandares`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (1,2,1,11,'		Lee de manera autónoma una variedad de textos con diversos propósitos: aprender, informarse, divertirse.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (2,2,1,11,'		Infiere el contenido de un texto a partir de índices, encabezados, títulos y subtítulos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (3,2,1,11,'		Comprende la trama o los argumentos expuestos en los textos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (4,2,1,11,'		Identifica las características generales de los textos literarios, informativos y narrativos, considerando su distribución gráfica y su función comunicativa.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (5,2,1,11,'		Distingue elementos de la realidad y de la fantasía en textos literarios.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (6,2,1,11,'		Identifica los textos adecuados y los fragmentos específicos para obtener, corroborar o contrastar información sobre un tema determinado.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (7,2,1,11,'		Plantea preguntas para guiar la búsqueda de información e identifica fragmentos del texto para responder a éstas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (8,2,1,11,'		Investiga, selecciona y organiza información para comunicar a otros, acerca de diversos temas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (9,2,1,11,'		Lee una variedad de textos literarios y distingue algunas diferencias: poesía, obras de teatro, novelas y cuentos cortos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (10,2,1,11,'		Desarrolla criterios personales para la elección o recomendación de un texto de su preferencia.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (11,2,1,11,'		Muestra fluidez al leer en voz alta.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (12,2,1,11,'		Interpreta adecuadamente, de manera cercana a la convencional, los signos de puntuación en la lectura: punto, coma, signos de exclamación, signos de interrogación, guión y tilde.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (13,2,1,12,'		Emplea la escritura para comunicar sus ideas y organizar información sobre temas diversos de manera autónoma.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (14,2,1,12,'		Entiende que los diferentes tipos de texto requieren formas particulares de escritura, por lo que adapta sus producciones al tipo de texto que elabora.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (15,2,1,12,'		Recupera información de diferentes fuentes y las emplea para desarrollar argumentos al redactar un texto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (16,2,1,12,'		Realiza las adaptaciones necesarias al lenguaje oral para producir textos escritos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (17,2,1,12,'		Ordena las oraciones de un texto escrito de manera coherente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (18,2,1,12,'		Considera al destinatario al producir sus textos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (19,2,1,12,'		Valora la importancia de la revisión y corrección para mejorar los textos producidos y lograr su comprensión.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (20,2,1,12,'		Describe un proceso, un fenómeno o una situación en orden cronológico.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (21,2,1,12,'		Establece relaciones de causa y efecto al describir, narrar o explicar una serie de eventos en un texto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (22,2,1,12,'		Emplea convencionalmente el uso de mayúsculas y la puntuación.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (23,2,1,12,'		Emplea juegos del lenguaje para introducir elementos de humor en textos escritos con dicho propósito.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (24,2,1,12,'		Completa formularios para realizar diversos trámites (préstamo bibliotecario, permisos de salida, entre otros).								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (25,2,1,10,'		Comunica sus ideas y escucha a sus compañeros con atención, y respeta turnos al hablar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (26,2,1,10,'		Expone información de manera oral y considera la que otros le proporcionan para enriquecer su conocimiento.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (27,2,1,10,'		Comprende la importancia de comunicarse eficientemente al exponer sus ideas, argumentos y presentar información.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (28,2,1,10,'		Presenta información atendiendo al orden de exposición o secuencia del discurso.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (29,2,1,10,'		Describe de forma oral situaciones, personas, objetos, lugares, acontecimientos y escenarios simples de manera efectiva.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (30,2,1,10,'		Sostiene una conversación en la que explica y argumenta sus preferencias o puntos de vista.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (31,2,1,6,'		Utiliza la lectura y la escritura con fines específicos dentro y fuera de la escuela.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (32,2,1,6,'		Conoce y aplica las convenciones ortográficas al escribir palabras con dígrafos y sílabas complejas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (33,2,1,6,'		Conoce el uso de las letras mayúsculas al escribir nombres propios, e identifica los párrafos a partir de marcadores textuales, como mayúsculas y punto final.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (34,2,1,6,'		Comprende la función de los textos instructivos al seguir instrucciones para resolver tareas cotidianas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (35,2,1,6,'		Identifica pistas para precisar la ortografía de palabras de una misma familia léxica, con ayuda del docente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (36,2,1,6,'		Emplea el orden alfabético en índices y diccionarios para localizar información.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (37,2,1,6,'		Introduce la puntuación adecuada (puntos y comas) para delimitar oraciones o elementos de un listado.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (38,2,1,6,'		Emplea diccionarios para verificar la ortografía de una palabra.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (39,2,1,3,'		Identifica y comparte su gusto por algunos temas, autores y géneros literarios.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (40,2,1,3,'		Desarrolla disposición por leer, escribir, hablar o escuchar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (41,2,1,3,'		Desarrolla una actitud positiva para seguir aprendiendo por medio del lenguaje escrito.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (42,2,1,3,'		Emplea el lenguaje para expresar ideas, emociones y argumentos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (43,2,1,3,'		Reconoce y valora las ventajas de hablar más de un idioma para comunicarse con otros, interactuar con los textos y acceder a información.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (44,2,1,3,'		Reconoce y valora la existencia de otras lenguas que se hablan en México.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (45,2,1,3,'		Trabaja colaborativamente, escucha y proporciona sus ideas, negocia y toma acuerdos al trabajar en grupo.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (46,2,1,3,'		Desarrolla un concepto positivo de sí mismo como lector, escritor, hablante u oyente; además, desarrolla gusto por leer, escribir, hablar y escuchar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (47,2,2,13,'		Lee, escribe y compara números naturales de hasta cuatro cifras.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (48,2,2,13,'		Resuelve problemas de reparto en los que el resultado es una fracción de la forma m/2n.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (49,2,2,13,'		Resuelve problemas que impliquen sumar o restar números naturales, utilizando los algoritmos convencionales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (50,2,2,13,'		Resuelve problemas que impliquen multiplicar o dividir números naturales, utilizando procedimientos informales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (51,2,2,7,'		Figuras y cuerpos geométricos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (52,2,2,7,'		Mide y compara longitudes utilizando unidades no convencionales y algunas convencionales comunes (m, cm).								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (53,2,2,1,'		Desarrolla un concepto positivo de sí mismo como usuario de las matemáticas, el gusto y la inclinación por comprender y utilizar la notación, el vocabulario y los procesos matemáticos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (54,2,2,1,'		Aplica el razonamiento matemático a la solución de problemas personales, sociales y naturales, aceptando el principio de que existen diversos procedimientos para resolver los problemas particulares.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (55,2,2,1,'		Desarrolla el hábito del pensamiento racional y utiliza las reglas del debate matemático al formular explicaciones o mostrar soluciones.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (56,2,2,1,'		Comparte e intercambia ideas sobre los procedimientos y resultados al resolver problemas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (57,2,3,5,'		Identifica las características físicas personales y las de otros, así como aquellas que son heredadas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (58,2,3,5,'		Comprende las relaciones entre plantas y animales y el lugar donde viven en términos de su nutrición y respiración.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (59,2,3,5,'		Identifica algunas partes del cuerpo humano y funciones asociadas con el movimiento, la nutrición y su relación con el entorno, así como las necesidades nutrimentales básicas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (60,2,3,5,'		Describe cambios en el desarrollo y crecimiento de los seres vivos, incluido el ser humano.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (61,2,3,5,'		Identifica cambios en fenómenos naturales ?como estados físicos en función de la temperatura?, la sucesión del día y la noche, y las fases de la Luna.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (62,2,3,5,'		Identifica las principales características de la naturaleza y su transformación al satisfacer las necesidades del ser humano.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (63,2,3,5,'		Describe efectos de la interacción de objetos relacionados con la aplicación de fuerzas, el magnetismo y el sonido.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (64,2,3,5,'		Identifica algunas características de los materiales y las mezclas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (65,2,3,5,'		Describe algunas características del Sol, las estrellas y la Luna, así como los movimientos de la Tierra y la Luna.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (66,2,3,4,'		Relaciona las fuerzas, el magnetismo, la electricidad, la luz, el calor y el sonido con su aplicación en diversos aparatos de uso cotidiano.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (67,2,3,4,'		Relaciona las características de los materiales con las formas en que se pueden utilizar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (68,2,3,4,'		Identifica las implicaciones de las acciones cotidianas en el medio natural y algunas medidas de prevención.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (69,2,3,4,'		Identifica algunas acciones para el cuidado de la salud con base en el conocimiento del cuerpo y la nutrición.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (70,2,3,8,'		Planea y lleva a cabo una investigación en el medio local, con un propósito definido.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (71,2,3,8,'		Aplica habilidades necesarias para la investigación científica: identifica problemas, plantea preguntas, realiza experimentos, recaba datos, realiza y registra observaciones de campo, resuelve preguntas y comunica resultados.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (72,2,3,8,'		Elabora conclusiones con base en la evidencia disponible.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (73,2,3,8,'		Aplica el conocimiento de los materiales para diseñar, construir y evaluar un dispositivo o un modelo.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (74,2,3,8,'		Comunica los resultados de observaciones y experimentos utilizando diversos recursos, por ejemplo: esquemas, dibujos y otras formas simbólicas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (75,2,3,2,'		Expresa curiosidad acerca de los fenómenos y procesos naturales en una variedad de contextos, y comparte e intercambia ideas al respecto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (76,2,3,2,'		Manifiesta responsabilidad al tomar decisiones informadas para cuidar su salud.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (77,2,3,2,'		Disfruta y aprecia los espacios naturales y disponibles para la recreación y la actividad física.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (78,2,3,2,'		Muestra disposición y toma decisiones en favor del cuidado del ambiente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (79,2,3,2,'		Valora y respeta las diferentes formas de vida.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (80,2,3,2,'		Muestra compromiso con la idea de interdependencia de los seres humanos con la naturaleza y la necesidad de cuidar la riqueza natural.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (81,2,3,2,'		Muestra disposición para el trabajo colaborativo y respeta las diferencias culturales y de género.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (82,3,1,11,'		Identifica y usa información específica de un texto para resolver problemas concretos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (83,3,1,11,'		Formula preguntas precisas para guiar su búsqueda de información.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (84,3,1,11,'		Comprende los aspectos centrales de un texto (tema, eventos, trama y personajes involucrados).								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (85,3,1,11,'		Identifica el orden y establece relaciones de causa y efecto en la trama de una variedad de tipos textuales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (86,3,1,11,'		Infiere información en un texto para recuperar aquella que no se explicita.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (87,3,1,11,'		Lee y comprende una variedad de textos de mediana dificultad y puede notar contradicciones, semejanzas y diferencias entre los que abordan un mismo tema.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (88,3,1,11,'		Identifica las ideas principales de un texto y selecciona información para resolver necesidades específicas y sustentar sus argumentos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (89,3,1,11,'		Comprende el lenguaje figurado y es capaz de identificarlo en diversos géneros: cuento, novela, teatro y poesía.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (90,3,1,11,'		Identifica las características de los textos descriptivos, narrativos, informativos y explicativos, a partir de su distribución gráfica y su función comunicativa, y adapta su lectura a las características del mismo.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (91,3,1,11,'		Emplea la cita textual para explicar y argumentar sus propias ideas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (92,3,1,11,'		Interpreta la información contenida en cuadros y tablas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (93,3,1,11,'		Selecciona datos presentados en dos fuentes distintas y los integra en un texto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (94,3,1,11,'		Diferencia entre hechos y opiniones al leer diferentes tipos de textos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (95,3,1,11,'		Sintetiza información sin perder el sentido central del texto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (96,3,1,11,'		Identifica y emplea la función de los signos de puntuación al leer: punto, coma, dos puntos, punto y coma, signos de exclamación, signos de interrogación y acentuación.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (97,3,1,12,'		Comunica por escrito conocimientos e ideas de manera clara, estableciendo el orden de los mismos, y explicitando las relaciones de causa y efecto al redactar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (98,3,1,12,'		Escribe una variedad de textos para una audiencia específica con diferentes propósitos comunicativos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (99,3,1,12,'		Distingue entre lenguaje formal e informal, y los usa adecuadamente al escribir diferentes tipos de textos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (100,3,1,12,'		Produce un texto de forma autónoma, conceptualmente correcto, a partir de la información provista por dos o tres fuentes.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (101,3,1,12,'		Describe y explica por escrito fenómenos diversos usando un estilo impersonal.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (102,3,1,12,'		Organiza su escritura en párrafos estructurados, usando la puntuación de manera convencional.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (103,3,1,12,'		Emplea diversos recursos lingüísticos y literarios en oraciones, y los usa al redactar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (104,3,1,12,'		Recupera ideas centrales al tomar notas en la revisión de materiales escritos o de una exposición oral de temas estudiados previamente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (105,3,1,12,'		Realiza correcciones a sus producciones con el fin de garantizar el propósito comunicativo y su comprensión por otros lectores.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (106,3,1,12,'		Emplea ortografía convencional al escribir.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (107,3,1,12,'		Utiliza diversas fuentes de consulta para hacer correcciones ortográficas (diccionarios, glosarios y derivación léxica en diversos materiales).								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (108,3,1,10,'		Distingue el estilo, registro y tono de acuerdo con el contexto, la audiencia y las necesidades.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (109,3,1,10,'		Expone, de manera oral, conocimientos, ideas y sentimientos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (110,3,1,10,'		Emplea el conocimiento que tiene sobre un tema para tomar decisiones y expresar su opinión fundamentada.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (111,3,1,10,'		Escucha y aporta sus ideas de manera crítica.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (112,3,1,10,'		Emplea diferentes estrategias para persuadir de manera oral a una audiencia.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (113,3,1,10,'		Identifica diferentes formas de criticar de manera constructiva y de responder a la crítica.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (114,3,1,10,'		Toma notas de una exposición oral.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (115,3,1,10,'		Usa la discusión para explorar ideas y temas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (116,3,1,6,'		Usa convencionalmente signos de interrogación y admiración, guiones para introducir diálogos, así como puntos y comas en sus escritos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (117,3,1,6,'		Emplea mayúsculas al inicio de párrafo y después de punto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (118,3,1,6,'		Usa palabras de la misma familia léxica para hacer correcciones a su ortografía.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (119,3,1,6,'		Reflexiona consistentemente acerca del funcionamiento de la ortografía y la puntuación en los textos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (120,3,1,6,'		Identifica las características y la función de diferentes tipos textuales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (121,3,1,6,'		Identifica información y sus fuentes para responder a preguntas específicas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (122,3,1,6,'		Incluye citas textuales y referencias bibliográficas en sus textos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (123,3,1,3,'		Identifica y comparte su gusto por algunos temas, autores y géneros literarios.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (124,3,1,3,'		Desarrolla disposición por leer, escribir, hablar o escuchar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (125,3,1,3,'		Desarrolla una actitud positiva para seguir aprendiendo por medio del lenguaje escrito.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (126,3,1,3,'		Emplea el lenguaje para expresar ideas, emociones y argumentos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (127,3,1,3,'		Discute sobre una variedad de temas de manera atenta y respeta los puntos de vista de otros.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (128,3,1,3,'		Amplía su conocimiento sobre obras literarias y comienza a identificar sus preferencias al respecto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (129,3,1,3,'		Reconoce y valora las ventajas y desventajas de hablar más de un idioma para comunicarse con otros, interactuar con los textos y acceder a información.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (130,3,1,3,'		Reconoce y valora la existencia de otras lenguas que se hablan en México.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (131,3,1,3,'		Trabaja colaborativamente, escucha y proporciona sus ideas, negocia y toma acuerdos al trabajar en grupo.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (132,3,1,3,'		Desarrolla un concepto positivo de sí mismo, como lector, escritor, hablante u oyente; además, desarrolla gusto por leer, escribir, hablar y escuchar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (133,3,2,13,'		Lee, escribe y compara números naturales, fraccionarios y decimales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (134,3,2,13,'		Resuelve problemas aditivos con números fraccionarios o decimales, usando los algoritmos convencionales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (135,3,2,13,'		Resuelve problemas que implican multiplicar o dividir números naturales, usando los algoritmos convencionales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (136,3,2,13,'		Resuelve problemas que implican multiplicar o dividir números fraccionarios o decimales entre números naturales, utilizando los algoritmos convencionales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (137,3,2,7,'		Explica las características de diferentes tipos de rectas, ángulos, polígonos y cuerpos geométricos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (138,3,2,7,'		Utiliza sistemas de referencia convencionales para ubicar puntos o describir su ubicación en planos, mapas y en el primer cuadrante del plano cartesiano.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (139,3,2,7,'		Establece relaciones entre las unidades del Sistema Internacional de Medidas, las unidades del Sistema Inglés, y las unidades de ambos sistemas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (140,3,2,7,'		Usa fórmulas para calcular perímetros y áreas de triángulos y cuadriláteros.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (141,3,2,7,'		Utiliza y relaciona unidades de tiempo (milenios, siglos, décadas, años, meses, semanas, días, horas y minutos) para establecer la duración de diversos sucesos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (142,3,2,9,'		Calcula porcentajes y utiliza esta herramienta para la resolución de otros problemas, como la comparación de razones.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (143,3,2,9,'		Resuelve problemas al utilizar la información representada en tablas, pictogramas o gráficas de barras, e identifica las medidas de tendencia central de un conjunto de datos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (144,3,2,1,'		Desarrolla un concepto positivo de sí mismo como usuario de las matemáticas, así como el gusto y la inclinación por comprender y utilizar la notación, el vocabulario y los procesos matemáticos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (145,3,2,1,'		Aplica el razonamiento matemático para solucionar problemas personales, sociales y naturales, al aceptar el principio de que existen diversos procedimientos para resolver los problemas particulares.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (146,3,2,1,'		Desarrolla el hábito del pensamiento racional y utiliza las reglas del debate matemático al formular explicaciones o mostrar soluciones.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (147,3,2,1,'		Comparte e intercambia ideas sobre los procedimientos y resultados al resolver problemas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (148,3,3,5,'		Explica el funcionamiento integral del cuerpo humano a partir de la interrelación de los sistemas que lo conforman, e identifica causas que afectan la salud.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (149,3,3,5,'		Describe los principales cambios en la pubertad, así como el proceso de reproducción y su relación con la herencia.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (150,3,3,5,'		Identifica las características de una dieta correcta y su relación con el funcionamiento del cuerpo humano.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (151,3,3,5,'		Reconoce la diversidad de los seres vivos, incluidos hongos y bacterias, en términos de la nutrición y la reproducción.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (152,3,3,5,'		Explica los conceptos de biodiversidad, ecosistema, cadenas alimentarias y ambiente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (153,3,3,5,'		Explica la importancia de la evidencia fósil para el conocimiento del desarrollo de la vida a lo largo del tiempo y los cambios en el ambiente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (154,3,3,5,'		Identifica algunas causas y consecuencias del deterioro de los ecosistemas, así como del calentamiento global.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (155,3,3,5,'		Identifica las transformaciones temporales y permanentes en procesos del entorno y en fenómenos naturales, así como algunas de las causas que las producen.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (156,3,3,5,'		Identifica algunos efectos de la interacción de objetos relacionados con la fuerza, el movimiento, la luz, el sonido, la electricidad y el calor.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (157,3,3,5,'		Identifica algunas manifestaciones y transformaciones de la energía.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (158,3,3,5,'		Describe la formación de eclipses y algunas características del Sistema Solar y del Universo.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (159,3,3,4,'		Explica algunas causas que afectan el funcionamiento del cuerpo humano y la importancia de desarrollar estilos de vida saludables.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (160,3,3,4,'		Identifica la contribución de la ciencia y la tecnología en la investigación, la atención de la salud y el cuidado del ambiente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (161,3,3,4,'		Identifica el aprovechamiento de dispositivos ópticos y eléctricos, máquinas simples, materiales y la conservación de alimentos, en las actividades humanas y en la satisfacción de necesidades.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (162,3,3,4,'		Identifica ventajas y desventajas de las formas actuales para obtener y aprovechar la energía térmica y eléctrica, así como la importancia de desarrollar alternativas orientadas al desarrollo sustentable.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (163,3,3,8,'		Realiza y registra observaciones de campo y analiza esta información como parte de una investigación científica.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (164,3,3,8,'		Aplica habilidades necesarias para la investigación científica: responde preguntas o identifica problemas, revisa resultados, registra datos de observaciones y experimentos, construye, aprueba o rechaza hipótesis, desarrolla explicaciones y comunica								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (165,3,3,8,'		Planifica y lleva a cabo experimentos que involucran el manejo de variables.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (166,3,3,8,'		Explica cómo las conclusiones de una investigación científica son consistentes con los datos y las evidencias.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (167,3,3,8,'		Diseña, construye y evalúa dispositivos o modelos aplicando los conocimientos necesarios y las propiedades de los materiales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (168,3,3,8,'		Comunica los resultados de observaciones e investigaciones usando diversos recursos, que incluyan formas simbólicas como esquemas, gráficas y exposiciones, además de las tecnologías de la comunicación y la información.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (169,3,3,2,'		Expresa curiosidad acerca de los fenómenos y procesos naturales en una variedad de contextos, y comparte e intercambia ideas al respecto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (170,3,3,2,'		Valora el conocimiento científico y sus enfoques para investigar y explicar los fenómenos y procesos naturales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (171,3,3,2,'		Manifiesta disposición y toma decisiones en favor del cuidado del ambiente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (172,3,3,2,'		Valora y respeta las diferentes formas de vida.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (173,3,3,2,'		Manifiesta compromiso con la idea de la interdependencia de los humanos con la naturaleza y la necesidad de cuidar la riqueza natural.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (174,3,3,2,'		Manifiesta responsabilidad al tomar decisiones informadas para cuidar su salud.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (175,3,3,2,'		Disfruta y aprecia los espacios naturales disponibles para la recreación y la actividad física.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (176,3,3,2,'		Muestra disposición para el trabajo colaborativo y respeta las diferencias culturales y de género.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (177,4,1,11,'		Emplea la lectura como herramienta para seguir aprendiendo y comprender su entorno.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (178,4,1,11,'		Selecciona de manera adecuada las fuentes de consulta de acuerdo con sus propósitos y temas de interés.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (179,4,1,11,'		Analiza críticamente la información que se difunde por medio de la prensa escrita, comparando y contrastando las formas en que una misma noticia se presenta en diferentes medios de comunicación.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (180,4,1,11,'		Reconoce la importancia de releer un texto para interpretar su contenido.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (181,4,1,11,'		Identifica la estructura y los rasgos estilísticos de poemas, novelas, obras de teatro y autobiografías.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (182,4,1,11,'		Analiza los mensajes publicitarios para exponer de forma crítica los efectos en los consumidores.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (183,4,1,11,'		Utiliza la información de artículos de opinión para ampliar sus conocimientos y formar un punto de vista propio.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (184,4,1,11,'		Emplea adecuadamente al leer las formas comunes de puntuación: punto, coma, dos puntos, punto y coma, signos de exclamación, signos de interrogación, apóstrofo, guión y tilde.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (185,4,1,12,'		Produce textos para expresarse.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (186,4,1,12,'		Produce textos en los que analiza información.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (187,4,1,12,'		Escribe textos originales de diversos tipos y formatos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (188,4,1,12,'		Produce textos adecuados y coherentes al tipo de información que desea difundir.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (189,4,1,12,'		Produce un texto con lógica y cohesión.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (190,4,1,12,'		Emplea signos de puntuación de acuerdo con la intención que desea expresar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (191,4,1,12,'		Comprende la importancia de la corrección de textos para hacerlos claros a los lectores y mantener el propósito comunicativo.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (192,4,1,12,'		Usa oraciones subordinadas, compuestas y coordinadas al producir textos que lo requieran.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (193,4,1,12,'		Corrige textos empleando manuales de redacción y ortografía para resolver dudas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (194,4,1,12,'		Emplea los tiempos y modos verbales de manera coherente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (195,4,1,12,'		Usa en la escritura los recursos lingüísticos para expresar temporalidad, causalidad y simultaneidad.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (196,4,1,10,'		Expresa y defiende opiniones e ideas de una manera razonada empleando el diálogo como forma privilegiada para resolver conflictos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (197,4,1,10,'		Utiliza una amplia variedad de modalidades del habla, como las conversaciones informales y discursos formales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (198,4,1,10,'		Expone de manera clara y lógica un tema y utiliza un lenguaje adecuado a sus interlocutores.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (199,4,1,10,'		Utiliza diversos recursos discursivos para elaborar una exposición con una intención determinada.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (200,4,1,10,'		Analiza las estrategias discursivas para seleccionar y aplicar las propias al participar en discusiones, análisis o debates.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (201,4,1,10,'		Respeta diversos puntos de vista y recupera las aportaciones de otros para enriquecer su conocimiento.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (202,4,1,6,'		Emplea la puntuación y la ortografía de acuerdo con las normas establecidas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (203,4,1,6,'		Identifica fallas ortográficas y gramaticales en textos para corregirlos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (204,4,1,6,'		Comprende el contenido de diversos documentos legales y administrativos para emplearlos en situaciones específicas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (205,4,1,6,'		Utiliza adecuadamente nexos y adverbios en textos orales y escritos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (206,4,1,6,'		Emplea las fuentes textuales adecuadas para obtener información de distintas disciplinas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (207,4,1,6,'		Utiliza adecuadamente los tiempos verbales al producir un texto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (208,4,1,3,'		Identifica y comparte su gusto por algunos temas, autores y géneros literarios.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (209,4,1,3,'		Desarrolla disposición por leer, escribir, hablar o escuchar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (210,4,1,3,'		Desarrolla una actitud positiva para seguir aprendiendo por medio del lenguaje escrito.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (211,4,1,3,'		Emplea el lenguaje para expresar ideas, emociones y argumentos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (212,4,1,3,'		Discute sobre una variedad de temas de manera atenta y respeta los puntos de vista de otros.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (213,4,1,3,'		Valora la autoría propia y desarrolla autoconfianza como autor u orador.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (214,4,1,3,'		Emplea el potencial del lenguaje para la resolución de conflictos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (215,4,1,3,'		Reconoce y valora las ventajas y desventajas de hablar más de un idioma para comunicarse con otros, interactuar con los textos y acceder a información.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (216,4,1,3,'		Reconoce y valora la existencia de otras lenguas que se hablan en México.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (217,4,1,3,'		Trabaja colaborativamente, escucha y proporciona sus ideas, negocia y toma acuerdos al trabajar en grupo.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (218,4,1,3,'		Desarrolla un concepto positivo de sí mismo como lector, escritor, hablante u oyente; además, desarrolla gusto por leer, escribir, hablar y escuchar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (219,4,2,13,'		Resuelve problemas que implican convertir números fraccionarios a decimales y viceversa.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (220,4,2,13,'		Resuelve problemas que implican calcular el mínimo común múltiplo o el máximo común divisor.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (221,4,2,13,'		Resuelve problemas aditivos que implican efectuar cálculos con expresiones algebraicas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (222,4,2,13,'		Resuelve problemas multiplicativos con expresiones algebraicas, a excepción de la división entre polinomios.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (223,4,2,13,'		Resuelve problemas que implican expresar y utilizar la regla general lineal o cuadrática de una sucesión.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (224,4,2,13,'		Resuelve problemas que involucran el uso de ecuaciones lineales o cuadráticas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (225,4,2,7,'		Resuelve problemas que implican construir círculos y polígonos regulares con base en información diversa y usa las relaciones entre sus puntos y rectas notables.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (226,4,2,7,'		Utiliza la regla y el compás para realizar diversos trazos, como alturas de triángulos, mediatrices, rotaciones, simetrías, etcétera.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (227,4,2,7,'		Resuelve problemas que implican aplicar las propiedades de la congruencia y la semejanza en diversos polígonos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (228,4,2,7,'		Calcula cualquiera de las variables que intervienen en las fórmulas de perímetro, área y volumen.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (229,4,2,7,'		Determina la medida de diversos elementos del círculo, como: circunferencia, superficie, ángulo inscrito y central, arcos de la circunferencia, sectores y coronas circulares.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (230,4,2,7,'		Aplica el teorema de Pitágoras y las razones trigonométricas seno, coseno y tangente en la resolución de problemas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (231,4,2,9,'		Resuelve problemas vinculados a la proporcionalidad directa, inversa o múltiple, como porcentajes, escalas, interés simple o compuesto.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (232,4,2,9,'		Expresa algebraicamente una relación lineal o cuadrática entre dos conjuntos de cantidades.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (233,4,2,9,'		Calcula la probabilidad de eventos complementarios, mutuamente excluyentes e independientes.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (234,4,2,9,'		Lee y representa información en diferentes tipos de gráficas; calcula y explica el significado del rango y la desviación media.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (235,4,2,1,'		Desarrolla un concepto positivo de sí mismo como usuario de las matemáticas, el gusto y la inclinación por comprender y utilizar la notación, el vocabulario y los procesos matemáticos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (236,4,2,1,'		Aplica el razonamiento matemático a la solución de problemas personales, sociales y naturales, aceptando el principio de que existen diversos procedimientos para resolver los problemas particulares.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (237,4,2,1,'		Desarrolla el hábito del pensamiento racional y utiliza las reglas del debate matemático al formular explicaciones o mostrar soluciones.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (238,4,2,1,'		Comparte e intercambia ideas sobre los procedimientos y resultados al resolver problemas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (239,4,3,5,'		Identifica la unidad y diversidad en los procesos de nutrición, respiración y reproducción, así como su relación con la adaptación y evolución de los seres vivos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (240,4,3,5,'		Explica la dinámica de los ecosistemas en el proceso de intercambio de materia en las cadenas alimentarias y los ciclos del agua y del carbono.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (241,4,3,5,'		Explica la relación entre los procesos de nutrición y respiración en la obtención de energía para el funcionamiento del cuerpo humano.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (242,4,3,5,'		Explica la importancia de la dieta correcta, el consumo de agua simple potable y de la actividad física para prevenir enfermedades y trastornos asociados con la nutrición.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (243,4,3,5,'		Identifica las causas y las medidas de prevención de las enfermedades respiratorias comunes, en particular las asociadas a la contaminación atmosférica y al tabaquismo.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (244,4,3,5,'		Explica cómo se expresa la sexualidad en términos de aspectos afectivos, de género, eróticos y reproductivos a lo largo de la vida y cómo favorecer la salud sexual y reproductiva.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (245,4,3,5,'		Describe diferentes tipos de movimiento en términos de su rapidez, velocidad y aceleración.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (246,4,3,5,'		Describe características del movimiento ondulatorio con base en el modelo de ondas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (247,4,3,5,'		Relaciona la fuerza con las interacciones mecánicas, electrostáticas y magnéticas, y explica sus efectos a partir de las Leyes de Newton.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (248,4,3,5,'		Explica la relación entre la gravedad y algunos efectos en los cuerpos en la Tierra y en el Sistema Solar.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (249,4,3,5,'		Describe algunas propiedades (masa, volumen, densidad y temperatura), así como interacciones relacionadas con el calor, la presión y los cambios de estado, con base en el modelo cinético de partículas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (250,4,3,5,'		Describe la energía a partir de las trasformaciones de la energía mecánica y el principio de conservación en términos de la transferencia de calor.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (251,4,3,5,'		Explica fenómenos eléctricos y magnéticos con base en las características de los componentes del átomo.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (252,4,3,5,'		Identifica algunas características de las ondas electromagnéticas y las relaciona con la energía que transportan.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (253,4,3,5,'		Identifica explicaciones acerca del origen y evolución del Universo, así como características de sus componentes principales.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (254,4,3,5,'		Identifica las propiedades físicas de los materiales, así como la composición y pureza de las mezclas,  compuestos y elementos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (255,4,3,5,'		Identifica los componentes de las mezclas, su clasificación, los cambios de sus propiedades en función de su concentración, así como los métodos de separación.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (256,4,3,5,'		Identifica las características del modelo atómico (partículas y sus funciones).								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (257,4,3,5,'		Explica la organización y la información contenida en la tabla periódica de los elementos, así como la importancia de algunos de ellos para los seres vivos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (258,4,3,5,'		Identifica el aporte calórico de los alimentos y su relación con la cantidad de energía requerida por una persona.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (259,4,3,5,'		Identifica las propiedades de los ácidos y las bases, así como las características de las reacciones redox.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (260,4,3,5,'		Identifica las características del enlace químico y de la reacción química.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (261,4,3,4,'		Explica la interrelación de la ciencia y la tecnología en los avances en el conocimiento de los seres vivos, del Universo, la transformación de los materiales, la estructura de la materia, el tratamiento de las enfermedades y del cuidado del ambiente								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (262,4,3,4,'		Relaciona el conocimiento científico con algunas aplicaciones tecnológicas de uso cotidiano y de importancia social.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (263,4,3,4,'		Identifica los beneficios y riesgos de las aplicaciones de la ciencia y la tecnología en la calidad de vida, el cuidado del ambiente, la investigación científica y el desarrollo de la sociedad.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (264,4,3,4,'		Identifica las características de la ciencia y su relación con la tecnología.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (265,4,3,8,'		Diseña investigaciones científicas en las que considera el contexto social.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (266,4,3,8,'		Aplica habilidades necesarias para la investigación científica: plantea preguntas, identifica temas o problemas, recolecta datos mediante la observación o experimentación, elabora, comprueba o refuta hipótesis, analiza y comunica los resultados y des								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (267,4,3,8,'		Planea y realiza experimentos que requieren de análisis, control y cuantificación de variables.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (268,4,3,8,'		Utiliza instrumentos tecnológicos para ampliar la capacidad de los sentidos y obtener información de los fenómenos naturales con mayor detalle y precisión.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (269,4,3,8,'		Realiza interpretaciones, deducciones, conclusiones, predicciones y representaciones de fenómenos y procesos naturales, a partir del análisis de datos y evidencias de una investigación científica, y explica cómo llegó a ellas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (270,4,3,8,'		Desarrolla y aplica modelos para interpretar, describir, explicar o predecir fenómenos y procesos naturales, como una parte esencial del conocimiento científico.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (271,4,3,8,'		Aplica habilidades interpersonales necesarias para el trabajo colaborativo, al desarrollar investigaciones científicas.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (272,4,3,8,'		Comunica los resultados de sus observaciones e investigaciones usando diversos recursos, entre ellos diagramas, tablas de datos, presentaciones, gráficas y otras formas simbólicas, así como las tecnologías de la comunicación y la información (TIC), y								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (273,4,3,2,'		Manifiesta un pensamiento científico para investigar y explicar conocimientos sobre el mundo natural en una variedad de contextos.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (274,4,3,2,'		Aplica el pensamiento crítico y el escepticismo informado al identificar el conocimiento científico del que no lo es.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (275,4,3,2,'		Manifiesta compromiso y toma decisiones en favor de la sustentabilidad del ambiente.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (276,4,3,2,'		Manifiesta responsabilidad al tomar decisiones informadas para cuidar su salud.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (277,4,3,2,'		Disfruta y aprecia los espacios naturales y disponibles para la recreación y la actividad física.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (278,4,3,2,'		Manifiesta disposición para el trabajo colaborativo respetando las diferencias culturales o de género.								 ');
INSERT INTO `Estandares` (`idEstandar`,`idPeriodo`,`idAsignatura`,`idComponenteEjeCategoria`,`descripcion`) VALUES (279,4,3,2,'		Valora la ciencia como proceso social en construcción permanente en el que contribuyen hombres y mujeres de distintas culturas.								 ');


COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`EstandaresDeTema`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (1,1);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (1,85);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (2,181);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (3,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (4,226);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (5,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (6,226);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (7,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (8,228);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (9,88);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (10,230);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (11,181);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (1,85);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (2,181);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (3,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (4,226);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (5,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (6,226);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (7,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (8,228);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (9,88);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (10,230);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (11,181);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (18,51);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (19,177);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (19,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (20,89);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (21,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (22,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (22,177);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (23,142);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (24,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (25,137);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (26,137);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (28,228);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (29,231);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (30,135);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (31,136);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (32,142);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (33,137);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (38,136);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (38,133);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (38,146);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (38,144);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (38,147);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (39,211);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (39,178);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (39,180);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (39,181);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (39,186);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (39,189);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (39,193);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (66,125);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (66,36);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (71,84);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (72,89);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (72,88);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (72,95);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (72,90);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (72,4);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (72,9);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (79,125);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (80,273);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (80,63);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (81,225);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (81,226);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (81,228);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (81,229);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (81,230);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (5,264);
INSERT INTO `EstandaresDeTema` (`idTema`,`idEstandar`) VALUES (91,208);

COMMIT;

-- --------------------------
-- MensajesPrivados
-- --------------------------

start transaction;

INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:21:33','HOLA',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:22:01','Hola!!!!! que gusto, ¿cómo estás?, ¿qué milagro?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:23:09','Bien gracias y tu que tal como estas??',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:24:32','me gustaría que me tutoraras un tema, que temas tienes?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:37:01','Escrito con tinta verde, el elefante, el petróleo, prismas, la altura de los triángulos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:37:14','el de proporcionalidad y el de operaciones con números naturales del cuadernillo Lee, piensa, decide y aprende de Matemáticas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:37:26','asimismo acabo de terminar el tema 4 del Cuadernillo Lee, piensa decide de español, el cual te sugiero estudiar, ahora que vamos a dar seguimiento a la implementación de éste en las entidades. ¿Cómo ves? Te interesa',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:39:02','Tienes varios!!!! pero me parece perfecto el tema cuatro del cuadernillo.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:40:21','ya había tenido un primer acercamiento con esta sesión y me encantaría terminarla',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:40:54','aMuy bien, entonces te envío un texto que aparece en inglés',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:42:19','esta bien lo espero',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:43:31','Antes de que te llegue, ¿qué sabes del tema 4 del cuadernillo?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:45:00','No es necesario que revises en este momento el cuadernillo, solo comentame a groso modo lo que sabes de éste',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:45:31','Pues mira de esa sesión llamada los robots, solo efectue una primera traducción la cual ya no retome',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:46:27','así que es lo único que tengo, no ehh analizado el tema',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:49:25','Bien, y hiciste por escrito esa traducción, ¿podrías compartirla?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:50:49','si la tengo por escrito, te la envío ok',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:51:28','Por otra parte dices que el tema trata de robot, ¿qué sabes acerca de éstos?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:54:26','Aún no me llega tu traducción (te sugiero que me la envíes para que mientras la leo tu me compartes tus saberes acerca de los robots)',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:54:57','pues al parecer no mucho tengo entendido que son sistemas mecanicos o maquinas que son diseñadas especialmente para realizar alguna función específica.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:58:34','también me gustaría comentarte que cuando efectue esta primera traducción me causo conflicto ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:02:26','Me queda la duda en cuál sería la diferencia entre un sistema mecanico y una máquina? ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:03:05',' Traducir la oración con los verbos de terminación "ing"',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:03:11','Por otra parte ya tengo tu traducción, gracias, ¿por qué dices qué te causo conflicto?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:03:47','equivalentes a la terminación ando y endo en español.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:04:10','del primero y cuarto párrafo.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:05:25','Hacemos un corte aqui y mañana reanudamos va?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:05:59','Me quedo con la tarea de leer tu traducción y te envío el tema 4 del cuadernillo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:06:06','ok me parece bien, a que hora nos vemos?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:06:42','a las 12:00 ¿qué te parece?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:07:48','Esta bien nos vemos a las 12:00',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:08:24','Muy bien, bye',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:09:37','Bye, cuidate',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:33:24','Hola buen día, espero que estés muy bien con los preparativos para continuar festejando a tu mami',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:33:46','Antes que nada, con la intención de que este trabajo vaya fluyendo a partir del respeto de tiempos y necesidades de ambas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:33:58','qué te parece si dedicamos 2 hrs. diarias en chat ¿tu dime qué tiempos propones? para que estemos en sintonía',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:34:26','Hola Buen día, espero este super igual esperando festejar a tu mami!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:36:29','ok me parece bien dos horas diarias',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:36:42','de 12:00 a 2:00 esta bien?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:41:04','Perfecto, Por otra parte es necesario considerar tiempo fuera del chat para leer e investigar con calma lo que vaya surgiendo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:41:22','asimismo te sugiero que vayas anotando las preguntas e inquietudes que te vayan surgiendo al ir leer el texto, disfruta y juega con el texto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:41:37','Retomando lo trabajado el día de ayer, creo que es importante precisare dos asuntos:',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:42:00','Te propongo que iniciemos con el punto 1, para ello retomemos tu definición inicial sobre lo que crees que es un robot y la duda estaba  en ¿cuál es la diferencia entre un sistema mecánico y una máqui',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:42:28','si me parece bien, investigar fuera del tiempo destinado!!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:42:36','perdón "maquina", se corto la última sílaba ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:46:55','entiendo que una maquina es un sistema mecanico, pero buscare la definión ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:47:03','No investigues, son tus palabras en un primer momento va?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:47:45','ok',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:47:51','¿entonces que entiendes por sistema mecánico?, podrías darme un ejemplo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:51:13','podria ser alguna maquinautilizada para empaquetar algun producto en una fabrica',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:51:53','qué características tiene',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:52:01','y es un sistema mecanico porque esta compuesto de dispositivos  que lo hacen funcionar para efectuar el trabajo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:53:34','es programable, realiza las funciones en menos tiempo...',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:57:34','tOh! entonces cuando mencionas que  son máquinas   que son diseñadas especialmente para realizar alguna función específición me quedaba la duda',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:58:23','ya que me imaginaba una máquina simple diseñada para una función especifica podría ser un robot? ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:58:54','¿Quedó clara mi anterior reflexión?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:00:52','mmmm buena pregunta',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:00:58',':D',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:02:21','si podria ser un robot pero yo creo no estoy segura que depende del tipo de funcion o caracteristicas con las cuales este compuesta',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:02:30','o una licuadora es una máquina diseñada para una función específica no?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:03:40','si igual tiene un sistema mecancico y electrico ammm pero igual y hay clasificacion dentro de las maquinas a las cuales a algunas se les llama robots',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:03:59','por su complejidad ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:05:16','Entonces, para precisar en esta primera defición que podemos decir que es un robot?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:09:10','bueno es que ya entre en un dilema no se si darle el nombre de maquina   ammmmm bueno un robot es un sistema mecanico  diseñado para realizar funciones por lo general complejas para el hombre.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:11:58','¿por qué entraste en ese dilema?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:13:50','por lo de la licuadora jeje',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:14:41','pero yo creo que hay alguna clasificación entre maquinas, robots y hasta androides ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:17:20','Es interesante como van surgiendo muchos saberes, ahora incorporaste uno nuevo "androide", creo que con lo que has dicho en el chat tienes mucha información para definir a estos tres',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:19:18','haz el intento, con calma, tomate tu tiempo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:20:58','jeje es que me van surguiendo varias dudas y cosas ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:21:24','ok',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:24:09','Que padre, si quieres compartir, te lo agradecería mucho',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:30:37','Bueno una maquina esta compuesta de varios elementos y es diseñada para actividades dificiles de efectuar por un hombre',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:31:41','Un robot es mas complejo creo yop por la composición de sistemas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:32:24','Y el androide?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:33:03','mientras que un androide son los que tiene una apariencia humana y además imitan algunas de sus actividades ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:33:31','Pero sigue siendo una máquina el robot',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:33:37','o conductas ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:35:02','El androide es un robot?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:35:18','no creo que no ammmmm me enrede en mis propias palabras',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:36:05','upsss apenas estaba contestando la primer pregunta',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:37:49',', Disculpa la insistencia, daré más tiempo lo que intento es que nos quede lo más clarito a qué nos referimos con robot porque esto nos servira en el estudio del tema',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:38:15','si el androide debe ser alguna clasificación de los robots',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:38:24','por tanto tambien e sun robot',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:45:31','Lo relevante es que distingues que hay diferencias entre estos, por otra parte te comparto el siguiente link que puede precisar más acerca del sistema mecánico ttp://st32caren2.blogspot.mx/',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:48:04','Por otra parte para profundizar un poco más podrías investigar en algunas fuentes, yo te comparto el siguiente link, y mañana nos conectamos a las 12,',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:48:44','para compartir tus hallazgos y continuar con el 2° punto: 2.La dificultad que identificaste con la traducción de palabras con terminación ing (y que según mencionas en español la terminación es ando,',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:49:23','¿cómo ves? estás de acuerdo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:51:18','ok de acuerdo pero donde esta el Link??',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:53:54','ok entonces lo reviso redefino mis ideas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:54:09','http://www.cienciapopular.com/n/Tecnologia/Androides__Humanoides_y_Cyborgs/Androides__Humanoides_y_Cyborgs.php',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:54:28','http://www.monografias.com/trabajos31/robotica/robotica.shtml',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:58:00','Muy bien, seguimos en contacto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:58:45','ok gracias, los reviso ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:59:19','cuidate bye!!!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 14:00:50','Bye, maña a la misma hora, que la pases super!!!! con tu mami',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 14:02:17','Gracias e igual que tela pases muy bien con tu mamita!!! hasta mañana',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 11:55:07','Hola, espero que estés muy bien y que te la hayas pasado muy bien con tu mami.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 11:55:56','Sabes? tengo que atender una situación urgente con el equipo de Sinaloa, por favor podríamos seguir con este trabajo después de la comida? 4:00 pm',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 12:03:27','Hola, como estas que tal te fue ayer? a mi me fue muy bien!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 12:04:20','ahh ok no te preocupes seguimos a las 4:00 p.m.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 16:04:05','Hola de nuevo!!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 16:05:21','toc!! toc!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 16:49:09','Hola, perdón, pero se complico un poquitin, pero todo bien, sé que estas resolviendo un asunto de Tlaxcala, tu dices',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 16:49:47','si seguimos o hasta el lunes',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 17:00:51','hola perdón si seguimos el lunes',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 17:07:01','Ok, que te sea leve y tengas un maravilloso fin de semana',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 17:09:58','Gracias e igual excelente fin',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:07:53','Hola como estas? ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:08:41','Muy bien, me acaban de decir que hay reunión con todos a las 12:00, que te parece si continuamos al terminar la reunión va?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:09:02','O mientras inicia la reunión me podrías compartir tus hallazgos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:10:18','si tenemos reunión pero terminar continuamos, aunque por distintas cuestiones personales hoy me retiro a las 3:00 p.m.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:16:10','revisando varias paginas encontre que mencionan a un robot como : entidad virtual, máquina, dispositivo o  computadora ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:17:38','por tanto yo digo que un robot es : una entidad virtual, máquina, dispositivo o  computadora que efectúa tareas realizadas por el hombre en donde se requiere el uso de  inteligencia.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:19:27','Máquina: Una máquina es un conjunto de elementos móviles y fijos cuyo funcionamiento posibilita aprovechar, dirigir, regular o transformar energía o realizar un trabajo con un fin determinado.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:21:01','con respecto a loa Androides encontré que existen diferentes tipos y clases de robots por tanto los clasifican en 4 formas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:22:28','en una de esas se encuentran los androides siendo estos robots con forma humana Imitan el comportamiento de las personas, su utilidad en la actualidad es de solo experimentación. La principal limitant',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:23:37','es el equilibrio en el desplazamiento, por ser bípedo.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:44:13','Muy bien,gracias',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:45:56','Con esta base, qué te parece si entramos a la traducción que ya me enviaste',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:46:34','te propongo que la revisemos  idea por idea, ¿qué te parece?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:48:24','sipi me parece bien',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:48:54','en la idea: do you think that a robot can ever compete with a man in intelligence?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:50:15','me generan las siguientes dudas:¿con quién compite el robot con la inteligencia o con el hombre?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:53:08','yo creoq ue lo que se busca con la construcción d eun robot es competir con la inteligencia',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:57:16','Y en el texto que nos dice? ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:59:08','Si trataramos de traducir palaba por palabra lo siguiente:can ever compete with a man in intelligence?  ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 13:08:03','Can: verbo poder o sustantivo lata',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 13:08:47','ever: alguna vez',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 13:09:54','compete: competir, with: con, a: un, man: hombre, in: en y intelligence: inteligencia',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 13:11:45','Entonces la pregunta qué plantea?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 13:13:27','traducida de manera literal y tomando a DO como auxiliar',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 13:40:49','si?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 13:51:05','Hola, te sigo esperando',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 13:51:37','a que termines la idea',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 14:34:26','disculpa me encontraba en una reunión!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 14:35:16','No te preocupes, espero',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 14:36:37','Perdón, me decias que hoy te vas a las tres y aún no comes, si quieres mañana continuamos va?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 14:39:24','¿Piensas que un robot podría alguna vez competir con un hombre en inteligencia?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 14:39:52','si mañana seguimos, muchas gracias!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 11:57:33','Hola buen día, ómo estás? podemos continuar con la tutoría',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:17:09','Buen día, continuemos...',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:28:42','Aclarando la anterior idea la pregunta se centra a reflexionar sobre si un robot puede competir con el ser humano en inteligencia. Entonces, ¿cuál sería la diferencia entre tu primera traducción y est',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:33:46','Ah la primera traducción es:¿Piensas que un robot alguna vez podría competir con la inteligencia de un hombre? ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:34:06','la segunda es: ¿Piensas que un robot podría alguna vez competir con un hombre en inteligencia?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:36:30','qué diferencias encuentras entre una y otra traducción?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:36:32','el anexar en la primera articulos de más y el orden de palabras',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:37:13','por ejemplo algunas vez podría en la primera y en la segunda pordria alguna vez las inverti!!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:37:55','¿por qué crees que sucedio esto?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:37:58',' con la inteligencia de un hombre y el otro con un hombre en inteligencia',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:39:05','creo yo que por falta de claridad en las estructura de las oraciones y que el inglés no se tradcuce de manera literal.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:40:05','Y en este caso que sucedio,',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:40:18','¿con cual traducción te sientes mejor?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:40:29','o mejor dicho, te queda más clara',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:44:14','me queda clara si la enuncio así: ¿Piensas que un robot podría alguna vez competir con la inteligencia de un hombre?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:47:51','¿por qué?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:53:11','que te parece si nos damos un espacio y continuamos después dela comida va? Gracias',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:54:17','esta bien, de nadita.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 16:18:05','Hola de nuevo Almiux, continuamos va que va',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 16:44:58','Va,',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 16:47:21','Nos quedamos en la traducción de la primera idea',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 16:48:03','Y decias que te parecía más clara la traducción ¿Piensas que un robot podría alguna vez competir con la inteligencia de un hombre?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 16:48:38','Y te preguntaba por qué lo consideras así?, a uién afecta directamente el verbo compete',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 16:54:54','porque me queda clara la idea de quien compite con quien el robot compite con la inteligencia del hombre',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:16:56','Mmm, coincido en que la pregunta que te  hice no está bien planteada',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:17:40','más bien sería según lo que plantea le texto y tomando en cuenta a quién afecta directamente el verbo compete',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:18:02','cuál sería la traducción más cercana',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:19:12','Porque lo otro podría caer en solo interpretaciones',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:27:02','pues la traducción literal sería ¿Piensas que un robot puede alguna vez competir con un hombre en inteligencia?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:37:29','Bueno, para tener una idea más global, te propongo que continuemos con los comentarios a tu traducción del texto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:38:33','si me parece bien',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:42:38','Seguro nos ayudará, la intención es reflexionar cómo interpretamos un texto en inglés, ¿qué referentes usamos?, ¿cómo esto nos ayuda de una forma u otra a entender y usar nuestra propia lengua?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:43:12','Asimismo sé que queda pendiente la reflexión o la diferencia entre competir con la inteligencia del hombre y competir con un hombre en inteligencia, matiz que habrá que encontrar',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:47:32','En la última idea de este mismo párrafo:  He believes that there will be four generations of robots before man create a thinking robot. En donde dice que pueden ser',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:52:23','Disculpa Almiux estaba con la Mtra. Dalila',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:54:04','revisando de nuevo lo puse de manera erronea',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:56:56','sería así: El cree que habrá cuatro generaciones de robots antes que un hombre pueda crear un robot pensate, pero aqui me surge la duda si thinking teniendo entendido que ing es el gerundio ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:57:26','en español terminación ando y endo se traduce como pensando o pensante??',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:59:08','Qué te hizo cambiar de parecer o en qué te fijaste para cambiar de idea habrá',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:59:40','en lugar de (que pueden ser)',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:01:02','no habia tomado en cuenta el auxiliar "will" que representa el tiempo futuro',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:03:54','Alma me tengo que ir, seguimos el jueves va mañana no vendre ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 18:04:23','¿y el there? qué función cumple en esa construcción: there will be',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:05:54','there is o there are juntos son hay para singular y plural',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:07:49','colocandole el auxiliar will "there will be" es habrá debido al cambio de tiempo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 18:09:24','¿Entonces que función tiene en la construcción anterior ? si mencionas que s erefiere al plural',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:09:26','Almiux ya me tengo que ir, podemos seguir después?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 18:10:51','Ok,',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:11:11','ahh es habrán',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:12:59','El cree que habrán cuatro generaciones de robots antes que un hombre pueda crear un robot pensate',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:13:12','asi es como quedaría',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:13:16','cuidate bye',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 18:14:34','Bye, ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 13:33:34','Hola buen día, disculpa la tardanza, pero estaba arreglando unos asuntos de casa',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 13:34:11','qué dices, continuamos con la tutoría o mejor después de la comida, tu dime, va',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 13:38:24','Hola buen día, no te preocupes espero toda este bien.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 13:38:57','continuamos despues de la ocmida va ahorita tengo que enviar algunos correos nos vemos a las 4:00 ok',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 13:41:59','Ok, un abrazo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 13:47:14','grax e igual un mega abrazo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:12:34','hola de new Almiux continuamos?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:13:10','claro!!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:14:15','permiteme 5 minutos va?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:14:43','va que va',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:16:13','ya, perdón',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:17:54','recapitulando decías, que te surgia la duda sobre  la terminación de ing de thinking, ya que agregas que ing es el gerundio? , ¿qué quiere decir eso de gerundio?,  ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:37:32','en ingles el geruncio en los verbos se puede observar con el ING al final',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:40:41','es la conjugación del verbo pero nolo recuero muy bien, tengo que investigarlo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:44:25','Entonces, podrías explicarme en qué consiste tu dificultad con thinking',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:49:25','si la termianción ING, en inglés es el gerundio, terminación ando y endo en español y teniendo entendido que Think es pensar',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:53:16','entonces como se traduce en la oración siguiente:',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:53:51','De acuerdo a tu traducción de la idea completa hasta aquí, que función tuvo thinking',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:54:02','El cree que habrán cuatro generaciones de robots antes que un hombre pueda crear un robot pensante o pensando?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:55:01','Si quedó clara mi pregunta',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:55:42','tiene la función de un adjetivo igual por eso se podría traducir como pensante aparte se escucha mejor',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:56:41','Entonces con qué aprendizaje te quedas de esto?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:59:21','mmmmmm',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 17:00:02','que no necesariamente se traduce con la terminación ando y endo de acuerdo a lo anterior',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 17:00:53','¿cuándo, si se traduce con esas terminaciones y cuándo no?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 17:05:51','cuando el es un verbo y modific ala accion del sujeto y en este caso es un adjetivo el cual nos habal del sujeto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 17:09:54','que interesante hallazgo no? yo también lo encontre, creía que todas las palabras que terminan en ing son verbos y terminan en ando, iendo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 17:11:59','sip fue mi primera impresión pero viendo la oración completa tiene la fución de un adjetivo ufff de otro modo igual se escucharía fuera de tono',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:18:57','Hola, perdón, tuve que resolver un asunto que me llevo cierto tiempo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:19:38','Creo, que en otro momento podríamos investigar más sobre el gerundio y la terminación ing, para tiene mayor claridad de cuál es el sentido y efecto de esas terminaciones, ¿qué te parece?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:20:03','Pasemos al siguiente párrafo, aparecen dos palabras remarcadas y en tu traducción sus respectivos espacios, en señal de no conocerlas.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:20:26','Antes de que pases a buscarlas en el diccionario, que sería lo más fácil hagamos un intento de contextualizarlas primero a partir del texto y de la función que cumplen en este',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:20:41','Qué función crees que podría estar cumpliendo la palabra chores , si está antes de un adjetivo y un verbo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:53:15','sorry no podia entrar',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:55:19','pues de acuerdo al seria así: LA PRIMERA GENERACIÓN de robots tendrán lainteligencia d eun reptil y solo serán capaces de ahcer tareas manuales, como mover objetos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:55:42','o limpiar cosas. Este será por 1999',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:56:02','son igual adjetivos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:56:40','ALmiux nos vemos mañanita te cuidas mucho y descansas un abrazo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:14:15','Hola buen día, cuál sería la diferencia entre un adjetivo y un sustantivo?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:20:53','Ya que, según te entiendo, mencionas que chores y hadle son adjetivos?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:21:05','Bueno, para contextualizarnos, te mencionaba que tratáramos de traducir las palabras chores y hadle a partir de contextualizarlos en el texto e identificar su función en éste.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:21:18','Entonces hace la traducción completa de la idea y terminas diciendo que son adjetivos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:21:38','De ahí la pregunta de saber qué entiendes por adjetivo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:21:52','Si chores según tu son tareas y hadle mover',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 11:31:54','El sustantivo es la palabra que funciona como sujeto de la oración ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 11:32:13','y el adjetivo es el califica al sustantivo ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 11:34:32','los tomo como adjetivos porqu eno sdescriben lo que podrán hacer los robots que es el sujeto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:35:36','Entonces, a qué conclusión llegas acerca de cual es la función que juega chores ¿es un adjetivo?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 11:38:02','menciono que los tome como adjetivos porque en ese parráfo describen lo que podrán hacer los robots que es el sujeto o sustantivo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 12:48:16','Hola, perdón por la tardanza, pero me estoy tratando de armarte una idea para reflexionar sopbre está última afirmación que das',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 12:49:13','Asimismo, ya es hora de irnos a reunión, un abrazo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 12:57:11','sipi yo igual tengo mis dudas, no te preocupes igual estamos batallando con Tlaxcala jeje ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:49:28','Se ven los mensajes mi estimado? por que yo no logro verlos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:50:11','ya los veo mi estimado',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:51:51','Escribe el mensaje y dale Enviar mensaje no le des enter',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:54:06','Que tal mi estimado, aquí estoy a la órden pa la tutoría',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:55:51','Pues como te habia dicho mi estimado Fidel el texto que te ofrezco es el de Literatura titulado Soneto sonetil',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:56:30','oye, tu sabes qué significa es de "Alta en el árbol"? que está al lado de la pantalla',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:57:13','No lo sé pero al parecer tiene que ver con la red, pero no da acceso aún.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:57:42','bueno, igual y lo exploramos en la marcha',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:58:24','comencemos pues',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:58:44','Me parece bien, igual y despues preguntamos con Martha o con el programador',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:59:48','Te decía sobr el texto del soneto, aún estas en lo dicho de querer estudiarlo?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:59:55','si, en eso quedamos, trabajaremos el poderoso sonetito "Soneto sonetil"',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:00:59','en lo personal este texto aunque es muy corto me ha permitido explorar muchos aspectos de la relación tutora y ha servido de mucho para que los maestros tengan claridad sobre lo que es la tutoría',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:01:34','si, claro que quiero trabajarlo, sobre todo despues de que he visto como se entusiasma la gente al trabajarlo.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:01:49','Perfecto!!!!, pues comencemos, para iniciar qué sabes sobre los sonetos mi estimado?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:02:17','si, justo eso es lo que he observado, de hecho es una de las razones por las quiero trabajarlo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:03:54','sé que los sonetos obras literarias escritas en verso, pero que mantienen una armonia en sus partes, tales como métrica, rima, cuartetos, ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:05:58','orale!!, pues tienes una buena parte avanzada mi estimado!! de echo esas partes que mencionas son algunas de las características del soneto, ¿algo en particular que creas que los diferencias de otros ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:06:24','textos literarios?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:07:56','lo que creo que diferencia de otros es justo la exactitud de sus versos, es decir, cómo están compuestos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:08:55','me parece que es ahí en donde radica su belleza,',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:10:02','Me parece bien,  veamos qué mas nos puede ofrecer el texto, te propongo le des una primera lectura y que escribas la primer interpretación que tengas sobre el soneto el general ¿cómo ves?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:10:39','Voy a probar enviarte un archivo para manejar los recursos de la plataforma',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:10:46','Revisa por favor el siguiente archivo: <a href="files/3/Sonetos_Lope_de_Vega[1].doc" target="_new">Sonetos_Lope_de_Vega[1].doc</a>',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:11:19','Sólo para confirmar, ¿te llega el archivo?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:11:46','sé que los sonetos están compuestos por estrófas con una lógica, los cuartetos y tercetos (no sé si existana más), pero es algo de lo también me gustaria saber',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:12:19','lo estoy abriendo ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:12:35','ya quedó',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:13:25','perfecto!! pues a leer mi estimado, seguro que encontrarás lo que buscas!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:13:41','lo estoy leyendo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:15:53','tomate tu tiempo mi estimado. ',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:18:15','te recomiendo que a partir de lo que leas escribas para que mañana cuando nos volvamos a conectar podamos conversar a partir de tu escrito que opinas?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:18:30','lo acabo de leer, y de entrada me pare muy interesante, creo que en el mismo contenido da muchos elementos de lo que es precisamente un soneto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:19:15','si, seguro, creo que hay mucho que decir, anotaré mis dudas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:19:53','pues entonces, mañana continuamos colega',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:20:18','bueno pues te recomiendo que ésto que me dices y l odemás que encuentres lo escribas en  un texto de word y me lo envías mañana te parece si nos conectamos a las 15:00 hrs?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:20:53','o tu dime a que hora crees conveniente??',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:21:20','de acuerdo,',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:21:48','ok. pues quedamos en eso. Hasta mañana mi estimado',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:22:02','está bien a esa hora, porque de seguro habrá mucho trabajo y reuniones',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:22:23','de acuerdo. gracias por la tutoría',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:23:00','es un buen comienzo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-08-07 17:10:07','Hola querida!!!!!!!!! como estas?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (3,3,'2012-08-11 01:11:18','<a href="http://168.255.101.69/rt/modulos/tutorias/archivosSubidos/undefined" target="_blank">undefined</a>',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (3,3,'2012-08-11 01:11:41','<a href="http://168.255.101.69/rt/modulos/tutorias/archivosSubidos/chat/3/3/estandares.sql" target="_blank">chat/3/3/estandares.sql</a>',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 10:13:23','Buenos días Adán',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:19:02','Aquí!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,55,'2012-08-13 10:23:23','ya estoy acá',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:23:49','PERFECTO',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:23:56','oye',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,55,'2012-08-13 10:24:06','siii',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:24:11','no hay forma de que recuperemos la conversación anterior verdad?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:24:29','Hola Cony',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,55,'2012-08-13 10:24:41','no no lo creo, ese es buen punto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:24:49','u.u',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:25:52','en fin',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:26:05','qué te parece si me envías la versión final de tu guión?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:27:22','buen día :)',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 10:32:23','hola buenos dias',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 10:33:52','veo que ha desaparecido el historial de nuestra tutoria',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 10:34:06','y eso ma da tristeza porque no lo habia regfistrado',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 10:34:08','jaja',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 10:35:00','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/productos/16/Ejercicios mate Luis Ge..doc">productos/16/Ejercicios mate Luis Ge..doc</a>',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:38:11','(prueba)',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:40:34','Hola, buen día!!!',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 10:41:18','Hola, para que sepas que ya ando aquí',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 10:41:53','hola',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 10:42:49','Buen día ya estoy conectada',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 10:43:04','HOLA',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:44:33','bueno... si no mal recuerdo, nos habíamos quedado en lo que era una hipótesis y cuáles hipótesis venían en la lectura, no?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 10:44:38','ok. recibiste el dcto del viernes?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 10:44:44','Sip',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:48:39','espera, ya recordé',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:48:51','a ver',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:48:53','para retomar',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:48:59','te diré lo que yo recuerdo que dijimos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:49:06','y ya le seguimos, vale?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:49:41','oye, y me podrías volver a mandar tu registro de proceso? es que yo pensé que esta plataforma iba a guardar la liga y por eso no la guardé en mi máquina',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:49:44','pero ahora no la tengo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 10:51:40','Hola',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 10:51:48','se borro todoooooooooooooooooooooooooooooo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:52:12','?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 10:54:04','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/chat/18/63/Proceso de aprendizaje Oetzi.docx">chat/18/63/Proceso de aprendizaje Oetzi.docx</a>',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 10:55:11','Hola Naye, podemos continuar con la tutoría?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 10:55:31','estoy en espera de tus avances para estar en sintonía? por fis?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:55:42','gracias',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:55:54','sip ya voy a adjuntar el archivo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:56:15','entonces... lo que pusiste ahí eran interrogantes que tú respecto a la información que se vierte en los textos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:56:25','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/chat/12/23/SESION4.docx">chat/12/23/SESION4.docx</a>',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:56:25','me decías que no sabías si la información era verídica o no',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:56:40','por lo cual, querías realizar una investigación, cierto?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:56:50','ya te lo envío, si lo puedes abrir?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (13,61,'2012-08-13 10:57:40','paty, nos esperamos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 10:58:40','Ok, lo estoy abriendo,',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:58:49','Okis',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:02:19','Así es, nada más que no pude hacerla puesto que salí a Morelos el viernes',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 11:03:08','tutooooor',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:03:48','muy bien, pues si quieres, podemos hacerla ahora',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:03:56','o bueno, en el transcurso de este día',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:04:32','lo otro, es que, a mí me gustaría que pudiéramos avanzar en el análisis del texto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:04:41','incluso sin tú haber podido hacer mayor investigación',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:04:49','ya que me parece que podemos sacarle mucho jugo al texto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:04:58','por sí mismo, cóm ves?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 11:05:08','<a href="http://168.255.101.69/rt/modulos/tutorias/archivosSubidos/chat/17/59/El sabor de la sal.docx" target="_blank">chat/17/59/El sabor de la sal.docx</a>',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 11:05:24','por suerte conservé el archivo que te acabo de enviar',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:05:52','Si exploremos el texto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:06:48','Muy bien,gracias, entonces continuamos con el quinto párrafo, no antes que me comentes si ya quedó claro la distinción entre adjetivo, sustantivo y verbo?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:08:06','toc, toc',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:08:42','vale, entonces me gustaría preguntarte, de nuevo, qué información de este texto llamó tu atención y por qué?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:10:19','Me llamó la atención el descubrimiento de la momia y las diferentes hipótesis que se plantearon los científicos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:11:45','De acuerdo con lo que escribiste en tu registro, las hipótesis que se plantean ahi son: Murió Oetzi en una oquedad de los Alpes Tiroleses, a 3 mil 200 metros de altura, hace unos 5300 años. Tenía alrededor de 30 años y medía 1.57 metros',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:11:47','sip',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:11:56','es así?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:12:29','el adjetivo: nos proporciona información acerca del sustantivo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:13:00','Sí',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:13:22','el Sustantivo: es la persona animal o cosa de la cual se habla en la oración',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:14:18','y el verbo: expresa la acción del sustantivo dentro de la oración',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:14:53','ya estoy de regreso',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:15:01','muy bien... podrías decirme',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:15:02','tu me avisas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:15:16','de acuerdo con la información que se vierte',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:15:21','Entonces hay distinción en estos tres conceptos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:15:29','si podemos saber en qué año murió Oetzi?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:16:32','lo menciono porque la última intervención que tuviste mencionaste que tareas y manejar eran adjetivos.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 11:16:58','en este archivo ya incorporé lo que investigué sobre las partes del cuento y localicé las partes en el cuento del sabor de la sal',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:17:10','si, cada uno tiene una función distinta dentro de la oración',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:17:13','Aproximadamente hace 3000 años antes de cristo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:17:39','Hola hola hola',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:17:45','Una vez aclarada esta precisión podemos continuar con el quinto párrafo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:18:29','En la siguiente ides By THE THIRD GENERATION, which will come in 2010-2020, de quién estamos hablando?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:18:43','Ándas, por allí?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:18:47','perdón quise decir idea en lugar de ides',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:18:49','muy bien, podríamos, de acuerdo con la información, determinar el año exacto de su muerte?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:19:28','ok dejamos entonces pendiente el párrafo de la segunda generación¡?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:20:11','De acuerdo con el texto si, en el año 3200 A. C.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:20:30','ya lo habiamos trabajado no?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:21:21','no aún no nos habíamos quedado en la primera generación.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:21:35','HOLA ya estas ahí luisge?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:21:37','Ups!!! Perdón, continuemos en la segunda generación',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:21:39','ok',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:21:43','entonces mira',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:21:45','viendo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:21:50','ok',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:22:03','que los diálogos anteriores se borraron y sin sber si serán recuperados,',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:22:20','podrías decirme cómo lo determinaste?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:22:21','creo que hay que ir intentando sistematizar el proceso de estudio hasta el momento',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:22:37','a mi parecer siendo muy específico en las preguntas que fueron utiles',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:22:52','porque no se si tengas mas dudas al respecto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:23:21','restando a 2012 5300 años',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:24:03','dame 5 min. tengo llamada',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:24:10','sugiero que en archivo que te subo ahora en lista de recursos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:24:22','ok',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:24:50','Perdón a 1991, le resté 5300',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:24:51','sigas avanzando',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:24:58','ok, por qué estás tomando el 2012 como año de referencia?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:25:00','ah, vale',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:25:02','a eso iba',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:25:02','digo que sería importante tener los diálogos anteriores',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:25:15','y cuánto te da?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:25:36','cerrar este ejercicio con un proceso y guion y luego entrarle al segundo ejercicio que podemos poner en archivo a parte',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:25:55','Ok, entonces me voy a centarr solo en el problema 3',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:26:18','año 30309',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:26:22','y los sistematizo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:26:29','3309',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:27:07','que te parece si reanudamos la tutoría a las meras 12 del día',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:27:17','para avanzar en lo que me dices',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:27:37','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/productos/16/Ejercicios mate Luis Ge..doc">productos/16/Ejercicios mate Luis Ge..doc</a>',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:27:47','perfecto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:28:15','vale',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:28:18','Nueva Etapa Iniciada',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:28:30','perdon estaba calando algo',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:28:33','ahora, con los datos que nos dan podríamos determinar cuál fue su año de nacimiento?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:29:08','ahorita regreso (voy al baño, jeje)',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:29:15','ok. ya recibí el dcto.',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:29:22','trabajo en él',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:29:56','3279 fue el año de nacimiento',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:34:02','Ya terminé, una cuetsión que me surge en esta segunda generación ¿Qué lugar ocupa la palabra  brain en la oración?, ¿cuál es su función?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:34:29','esperame 5 min.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:39:59','OK, es un adjetivo y creo que podría tener una relación con la palabra power:poder',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:43:21','podrías decirme qué operación hiciste?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:48:44','A 3279 años le resté los 30 años de edad de Oetzi.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:49:58','Entonces cómo quedaría',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:50:24','ok. A ver, recuperemos nuestros datos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:50:33','en qué año quedamos que murió Oetzi?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:50:46','3279',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:50:59','30309',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:51:04','3309',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:51:46','nació en 3279',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:53:06','entiendo que brain es cerebro',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:53:11','Me hice pelotas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:53:25','entonces quedaría asi:',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:53:55','no te preocupes... ahora te preguntaría, por qué restaste los 30 años a 3309?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:55:45','Porque fue la fecha en que lo encotraron su edad era de 30 años',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:56:53','ok. Te parece si comprobamos si el dato que me estás dando es correcto?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:57:03','LA SEGUNDA GENERACIÓN (2000-2010)  de robots tendrán el poder cerebral de mamíferos. pero no se que palabra adecuar para lower porque creo que es amante y esto sale fuera de contexto',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:57:04','tal vez podemos comprobarlo haciendo una línea del tiempo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:57:05','Sip',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:57:05','jeje',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:57:10','te parece que lo hagamos?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:57:11','vale',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:57:15','Si',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:57:42','alguna vez has elaborado líneas del tiempo?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:58:15','Sip',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:03:49','sorry por el pleonasmo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 12:03:54','Ando en eso de la sistematización, me tardo un ratito más',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:05:04','ok, muy bien, porquér dices que lower se refiere a amante, de dónde lo sacas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:07:30','mmmm, esto está muy difícil explicarlo si no se hace gráficamente :(',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:08:03','toc, toc',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:08:07','En alguna clase de inglés fue mencionado y se hablaba de amantes por eso jeje no lo eh buscado',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:08:10','bueno, te parece que cuando realices tu línea del tiempo, me la envíes?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:09:26','mira, te comento algunas cosas que debemos tomar en cuenta para nuestra elaboración',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:09:31','de la línea del tiempo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:09:46','te puedo ayudar diciendo que s erefiere a inferior (si gustas buscala) y trata de armar la idea, va',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:10:07','ok',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:10:20','qué datos le pondrías?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:19:29','LA SEGUNDA GENERACIÓN (2000-2010) de robots tendrá el poder cerebral de mamíferos inferiores. Estas máquinas serán capaces de ser entrenadas y responder a señales.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:20:49','Ok, que interesante no? cómo ves?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:21:05','entiendo que eso de inferior se refiere como a poca capacidad',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:21:11','verdad',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:21:15','?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:22:18','Así es, nosotros somos mamiferos pero no no inferiores verdad? sería interesante buscar cuáles son los mamiferos inferiores, pero en general la idea es la que mencionas',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:23:34','Pero eso sería una tarea posterior si así lo consideras necesario.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:23:45','te parece si continuamos con la tercera generación?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:25:17','sip la apunto como tarea, si me parece interesante conocer esa clasificación',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:25:37','ok continuamos con la tercera generación.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:27:24','pero tengo una duda nosotros somos mamíferos?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:29:04','por ser vertebrados y ser alimentados por nuestras madres?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:30:13','Tu que crees?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:31:44','que si',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:35:24','Muy bien, también sería un tema a investigar para dar mayor seguridad en los argumentos, cómo ves? valoralo y en un tiempito que tengas enriquece tu guión.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:35:45','sip me parece bien',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:36:19','Bueno entrando a la quinta generación By THE THIRD GENERATION, which will come in 2010-2020, en ésta idea de quién estamos hablando',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:39:15','Es la  tercera generación',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:40:45','y se esta hablando del tiempo en el cual  se desarrollará  esa generación',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:41:09','de robots',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 12:44:34','hola',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (41,27216,'2012-08-13 12:45:17','hola',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:55:18','Entonces el verbo estará conjugado en singular o plural?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:55:44','Voy al baño, perdón',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:56:56','ok es en singular en mi mi traducción creo que lo coloco en plural pero revisando de nuevo es singular',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:59:23','Ok, entonces cómo quedaria By THE THIRD GENERATION, which will come in 2010-2020',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:59:42','oye, podemos seguir en torno a las hipótesis?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:59:56','te parece si seguimos hasta la 1:15, o tú ya vas a comer?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 13:05:03','Ya me voy a comer, conmtinuamos después?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 13:05:14','toc,toc',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:05:36','hola',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:07:51','hola pues nos han informado que regresaremos a reunion a las 14:30',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 13:08:02','Por LA TERCERA GENERACIÓN, que vendrá en 2010-2020',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:04','asi que planeo salir a comer ya en un ratico',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:08:09','y a qué hora piensas salir a comer',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 13:08:18','dame 10 minutitos por fis',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:22','asi que habria que ponernos de acuerdo',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:32','para avanzarle al trabajo de tutoria',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:46','no se si pueda ser mañana',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:59','sobre todo porque ahorita es mucho de entre pares',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 13:09:03','Ok',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:09:07','y pues necesitamos coincidir',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:09:10','como vez?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:10:12','bien. creo que es bueno que salga usted a comer para que baje un poco el estres y veremos que no sdicen en la reunión.',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:11:01','si no hay nada urgente continuamos en la tarde y que las demás parejas se integren conforme resuelvan su conección y sus tiempos',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:12:47','oks muy bien',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:12:53','buen provecho',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 13:14:07','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/productos/16/Ejercicios mate Luis Ge.13 agosdoc.doc">productos/16/Ejercicios mate Luis Ge.13 agosdoc.doc</a>',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 13:14:31','Alvaro, te envío la sistematización, por fa, echale un ojo',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 13:14:38','y me dices que falta.',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 13:14:41','garcias.',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 13:15:10','sale y vale',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 13:17:24','ok deja leo luisge',1,2);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:25:10','igual',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 13:49:27','13:49 YA?',1,1);
INSERT INTO `MensajesPrivados` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 17:04:00','Qué tal Adán?',1,1);

commit;

-- ------------------------
-- Historial inserts
-- ------------------------
start transaction;

INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:21:33','HOLA',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:22:01','Hola!!!!! que gusto, ¿cómo estás?, ¿qué milagro?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:23:09','Bien gracias y tu que tal como estas??',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:24:32','me gustaría que me tutoraras un tema, que temas tienes?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:37:01','Escrito con tinta verde, el elefante, el petróleo, prismas, la altura de los triángulos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:37:14','el de proporcionalidad y el de operaciones con números naturales del cuadernillo Lee, piensa, decide y aprende de Matemáticas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:37:26','asimismo acabo de terminar el tema 4 del Cuadernillo Lee, piensa decide de español, el cual te sugiero estudiar, ahora que vamos a dar seguimiento a la implementación de éste en las entidades. ¿Cómo ves? Te interesa',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:39:02','Tienes varios!!!! pero me parece perfecto el tema cuatro del cuadernillo.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:40:21','ya había tenido un primer acercamiento con esta sesión y me encantaría terminarla',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:40:54','aMuy bien, entonces te envío un texto que aparece en inglés',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:42:19','esta bien lo espero',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:43:31','Antes de que te llegue, ¿qué sabes del tema 4 del cuadernillo?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:45:00','No es necesario que revises en este momento el cuadernillo, solo comentame a groso modo lo que sabes de éste',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:45:31','Pues mira de esa sesión llamada los robots, solo efectue una primera traducción la cual ya no retome',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:46:27','así que es lo único que tengo, no ehh analizado el tema',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:49:25','Bien, y hiciste por escrito esa traducción, ¿podrías compartirla?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:50:49','si la tengo por escrito, te la envío ok',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:51:28','Por otra parte dices que el tema trata de robot, ¿qué sabes acerca de éstos?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 18:54:26','Aún no me llega tu traducción (te sugiero que me la envíes para que mientras la leo tu me compartes tus saberes acerca de los robots)',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:54:57','pues al parecer no mucho tengo entendido que son sistemas mecanicos o maquinas que son diseñadas especialmente para realizar alguna función específica.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 18:58:34','también me gustaría comentarte que cuando efectue esta primera traducción me causo conflicto ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:02:26','Me queda la duda en cuál sería la diferencia entre un sistema mecanico y una máquina? ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:03:05',' Traducir la oración con los verbos de terminación "ing"',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:03:11','Por otra parte ya tengo tu traducción, gracias, ¿por qué dices qué te causo conflicto?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:03:47','equivalentes a la terminación ando y endo en español.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:04:10','del primero y cuarto párrafo.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:05:25','Hacemos un corte aqui y mañana reanudamos va?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:05:59','Me quedo con la tarea de leer tu traducción y te envío el tema 4 del cuadernillo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:06:06','ok me parece bien, a que hora nos vemos?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:06:42','a las 12:00 ¿qué te parece?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:07:48','Esta bien nos vemos a las 12:00',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-09 19:08:24','Muy bien, bye',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-09 19:09:37','Bye, cuidate',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:33:24','Hola buen día, espero que estés muy bien con los preparativos para continuar festejando a tu mami',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:33:46','Antes que nada, con la intención de que este trabajo vaya fluyendo a partir del respeto de tiempos y necesidades de ambas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:33:58','qué te parece si dedicamos 2 hrs. diarias en chat ¿tu dime qué tiempos propones? para que estemos en sintonía',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:34:26','Hola Buen día, espero este super igual esperando festejar a tu mami!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:36:29','ok me parece bien dos horas diarias',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:36:42','de 12:00 a 2:00 esta bien?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:41:04','Perfecto, Por otra parte es necesario considerar tiempo fuera del chat para leer e investigar con calma lo que vaya surgiendo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:41:22','asimismo te sugiero que vayas anotando las preguntas e inquietudes que te vayan surgiendo al ir leer el texto, disfruta y juega con el texto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:41:37','Retomando lo trabajado el día de ayer, creo que es importante precisare dos asuntos:',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:42:00','Te propongo que iniciemos con el punto 1, para ello retomemos tu definición inicial sobre lo que crees que es un robot y la duda estaba  en ¿cuál es la diferencia entre un sistema mecánico y una máqui',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:42:28','si me parece bien, investigar fuera del tiempo destinado!!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:42:36','perdón "maquina", se corto la última sílaba ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:46:55','entiendo que una maquina es un sistema mecanico, pero buscare la definión ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:47:03','No investigues, son tus palabras en un primer momento va?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:47:45','ok',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:47:51','¿entonces que entiendes por sistema mecánico?, podrías darme un ejemplo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:51:13','podria ser alguna maquinautilizada para empaquetar algun producto en una fabrica',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:51:53','qué características tiene',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:52:01','y es un sistema mecanico porque esta compuesto de dispositivos  que lo hacen funcionar para efectuar el trabajo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 12:53:34','es programable, realiza las funciones en menos tiempo...',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:57:34','tOh! entonces cuando mencionas que  son máquinas   que son diseñadas especialmente para realizar alguna función específición me quedaba la duda',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:58:23','ya que me imaginaba una máquina simple diseñada para una función especifica podría ser un robot? ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 12:58:54','¿Quedó clara mi anterior reflexión?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:00:52','mmmm buena pregunta',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:00:58',':D',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:02:21','si podria ser un robot pero yo creo no estoy segura que depende del tipo de funcion o caracteristicas con las cuales este compuesta',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:02:30','o una licuadora es una máquina diseñada para una función específica no?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:03:40','si igual tiene un sistema mecancico y electrico ammm pero igual y hay clasificacion dentro de las maquinas a las cuales a algunas se les llama robots',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:03:59','por su complejidad ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:05:16','Entonces, para precisar en esta primera defición que podemos decir que es un robot?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:09:10','bueno es que ya entre en un dilema no se si darle el nombre de maquina   ammmmm bueno un robot es un sistema mecanico  diseñado para realizar funciones por lo general complejas para el hombre.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:11:58','¿por qué entraste en ese dilema?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:13:50','por lo de la licuadora jeje',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:14:41','pero yo creo que hay alguna clasificación entre maquinas, robots y hasta androides ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:17:20','Es interesante como van surgiendo muchos saberes, ahora incorporaste uno nuevo "androide", creo que con lo que has dicho en el chat tienes mucha información para definir a estos tres',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:19:18','haz el intento, con calma, tomate tu tiempo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:20:58','jeje es que me van surguiendo varias dudas y cosas ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:21:24','ok',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:24:09','Que padre, si quieres compartir, te lo agradecería mucho',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:30:37','Bueno una maquina esta compuesta de varios elementos y es diseñada para actividades dificiles de efectuar por un hombre',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:31:41','Un robot es mas complejo creo yop por la composición de sistemas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:32:24','Y el androide?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:33:03','mientras que un androide son los que tiene una apariencia humana y además imitan algunas de sus actividades ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:33:31','Pero sigue siendo una máquina el robot',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:33:37','o conductas ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:35:02','El androide es un robot?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:35:18','no creo que no ammmmm me enrede en mis propias palabras',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:36:05','upsss apenas estaba contestando la primer pregunta',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:37:49',', Disculpa la insistencia, daré más tiempo lo que intento es que nos quede lo más clarito a qué nos referimos con robot porque esto nos servira en el estudio del tema',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:38:15','si el androide debe ser alguna clasificación de los robots',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:38:24','por tanto tambien e sun robot',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:45:31','Lo relevante es que distingues que hay diferencias entre estos, por otra parte te comparto el siguiente link que puede precisar más acerca del sistema mecánico ttp://st32caren2.blogspot.mx/',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:48:04','Por otra parte para profundizar un poco más podrías investigar en algunas fuentes, yo te comparto el siguiente link, y mañana nos conectamos a las 12,',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:48:44','para compartir tus hallazgos y continuar con el 2° punto: 2.La dificultad que identificaste con la traducción de palabras con terminación ing (y que según mencionas en español la terminación es ando,',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:49:23','¿cómo ves? estás de acuerdo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:51:18','ok de acuerdo pero donde esta el Link??',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:53:54','ok entonces lo reviso redefino mis ideas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:54:09','http://www.cienciapopular.com/n/Tecnologia/Androides__Humanoides_y_Cyborgs/Androides__Humanoides_y_Cyborgs.php',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:54:28','http://www.monografias.com/trabajos31/robotica/robotica.shtml',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 13:58:00','Muy bien, seguimos en contacto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:58:45','ok gracias, los reviso ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 13:59:19','cuidate bye!!!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-10 14:00:50','Bye, maña a la misma hora, que la pases super!!!! con tu mami',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-10 14:02:17','Gracias e igual que tela pases muy bien con tu mamita!!! hasta mañana',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 11:55:07','Hola, espero que estés muy bien y que te la hayas pasado muy bien con tu mami.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 11:55:56','Sabes? tengo que atender una situación urgente con el equipo de Sinaloa, por favor podríamos seguir con este trabajo después de la comida? 4:00 pm',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 12:03:27','Hola, como estas que tal te fue ayer? a mi me fue muy bien!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 12:04:20','ahh ok no te preocupes seguimos a las 4:00 p.m.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 16:04:05','Hola de nuevo!!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 16:05:21','toc!! toc!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 16:49:09','Hola, perdón, pero se complico un poquitin, pero todo bien, sé que estas resolviendo un asunto de Tlaxcala, tu dices',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 16:49:47','si seguimos o hasta el lunes',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 17:00:51','hola perdón si seguimos el lunes',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-11 17:07:01','Ok, que te sea leve y tengas un maravilloso fin de semana',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-11 17:09:58','Gracias e igual excelente fin',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:07:53','Hola como estas? ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:08:41','Muy bien, me acaban de decir que hay reunión con todos a las 12:00, que te parece si continuamos al terminar la reunión va?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:09:02','O mientras inicia la reunión me podrías compartir tus hallazgos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:10:18','si tenemos reunión pero terminar continuamos, aunque por distintas cuestiones personales hoy me retiro a las 3:00 p.m.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:16:10','revisando varias paginas encontre que mencionan a un robot como : entidad virtual, máquina, dispositivo o  computadora ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:17:38','por tanto yo digo que un robot es : una entidad virtual, máquina, dispositivo o  computadora que efectúa tareas realizadas por el hombre en donde se requiere el uso de  inteligencia.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:19:27','Máquina: Una máquina es un conjunto de elementos móviles y fijos cuyo funcionamiento posibilita aprovechar, dirigir, regular o transformar energía o realizar un trabajo con un fin determinado.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:21:01','con respecto a loa Androides encontré que existen diferentes tipos y clases de robots por tanto los clasifican en 4 formas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:22:28','en una de esas se encuentran los androides siendo estos robots con forma humana Imitan el comportamiento de las personas, su utilidad en la actualidad es de solo experimentación. La principal limitant',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:23:37','es el equilibrio en el desplazamiento, por ser bípedo.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:44:13','Muy bien,gracias',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:45:56','Con esta base, qué te parece si entramos a la traducción que ya me enviaste',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:46:34','te propongo que la revisemos  idea por idea, ¿qué te parece?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:48:24','sipi me parece bien',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:48:54','en la idea: do you think that a robot can ever compete with a man in intelligence?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:50:15','me generan las siguientes dudas:¿con quién compite el robot con la inteligencia o con el hombre?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 12:53:08','yo creoq ue lo que se busca con la construcción d eun robot es competir con la inteligencia',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:57:16','Y en el texto que nos dice? ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 12:59:08','Si trataramos de traducir palaba por palabra lo siguiente:can ever compete with a man in intelligence?  ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 13:08:03','Can: verbo poder o sustantivo lata',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 13:08:47','ever: alguna vez',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 13:09:54','compete: competir, with: con, a: un, man: hombre, in: en y intelligence: inteligencia',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 13:11:45','Entonces la pregunta qué plantea?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 13:13:27','traducida de manera literal y tomando a DO como auxiliar',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 13:40:49','si?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 13:51:05','Hola, te sigo esperando',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 13:51:37','a que termines la idea',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 14:34:26','disculpa me encontraba en una reunión!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 14:35:16','No te preocupes, espero',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-14 14:36:37','Perdón, me decias que hoy te vas a las tres y aún no comes, si quieres mañana continuamos va?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 14:39:24','¿Piensas que un robot podría alguna vez competir con un hombre en inteligencia?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-14 14:39:52','si mañana seguimos, muchas gracias!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 11:57:33','Hola buen día, ómo estás? podemos continuar con la tutoría',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:17:09','Buen día, continuemos...',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:28:42','Aclarando la anterior idea la pregunta se centra a reflexionar sobre si un robot puede competir con el ser humano en inteligencia. Entonces, ¿cuál sería la diferencia entre tu primera traducción y est',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:33:46','Ah la primera traducción es:¿Piensas que un robot alguna vez podría competir con la inteligencia de un hombre? ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:34:06','la segunda es: ¿Piensas que un robot podría alguna vez competir con un hombre en inteligencia?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:36:30','qué diferencias encuentras entre una y otra traducción?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:36:32','el anexar en la primera articulos de más y el orden de palabras',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:37:13','por ejemplo algunas vez podría en la primera y en la segunda pordria alguna vez las inverti!!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:37:55','¿por qué crees que sucedio esto?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:37:58',' con la inteligencia de un hombre y el otro con un hombre en inteligencia',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:39:05','creo yo que por falta de claridad en las estructura de las oraciones y que el inglés no se tradcuce de manera literal.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:40:05','Y en este caso que sucedio,',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:40:18','¿con cual traducción te sientes mejor?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:40:29','o mejor dicho, te queda más clara',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:44:14','me queda clara si la enuncio así: ¿Piensas que un robot podría alguna vez competir con la inteligencia de un hombre?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:47:51','¿por qué?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 12:53:11','que te parece si nos damos un espacio y continuamos después dela comida va? Gracias',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 12:54:17','esta bien, de nadita.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 16:18:05','Hola de nuevo Almiux, continuamos va que va',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 16:44:58','Va,',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 16:47:21','Nos quedamos en la traducción de la primera idea',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 16:48:03','Y decias que te parecía más clara la traducción ¿Piensas que un robot podría alguna vez competir con la inteligencia de un hombre?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 16:48:38','Y te preguntaba por qué lo consideras así?, a uién afecta directamente el verbo compete',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 16:54:54','porque me queda clara la idea de quien compite con quien el robot compite con la inteligencia del hombre',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:16:56','Mmm, coincido en que la pregunta que te  hice no está bien planteada',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:17:40','más bien sería según lo que plantea le texto y tomando en cuenta a quién afecta directamente el verbo compete',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:18:02','cuál sería la traducción más cercana',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:19:12','Porque lo otro podría caer en solo interpretaciones',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:27:02','pues la traducción literal sería ¿Piensas que un robot puede alguna vez competir con un hombre en inteligencia?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:37:29','Bueno, para tener una idea más global, te propongo que continuemos con los comentarios a tu traducción del texto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:38:33','si me parece bien',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:42:38','Seguro nos ayudará, la intención es reflexionar cómo interpretamos un texto en inglés, ¿qué referentes usamos?, ¿cómo esto nos ayuda de una forma u otra a entender y usar nuestra propia lengua?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:43:12','Asimismo sé que queda pendiente la reflexión o la diferencia entre competir con la inteligencia del hombre y competir con un hombre en inteligencia, matiz que habrá que encontrar',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:47:32','En la última idea de este mismo párrafo:  He believes that there will be four generations of robots before man create a thinking robot. En donde dice que pueden ser',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:52:23','Disculpa Almiux estaba con la Mtra. Dalila',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:54:04','revisando de nuevo lo puse de manera erronea',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:56:56','sería así: El cree que habrá cuatro generaciones de robots antes que un hombre pueda crear un robot pensate, pero aqui me surge la duda si thinking teniendo entendido que ing es el gerundio ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 17:57:26','en español terminación ando y endo se traduce como pensando o pensante??',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:59:08','Qué te hizo cambiar de parecer o en qué te fijaste para cambiar de idea habrá',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 17:59:40','en lugar de (que pueden ser)',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:01:02','no habia tomado en cuenta el auxiliar "will" que representa el tiempo futuro',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:03:54','Alma me tengo que ir, seguimos el jueves va mañana no vendre ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 18:04:23','¿y el there? qué función cumple en esa construcción: there will be',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:05:54','there is o there are juntos son hay para singular y plural',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:07:49','colocandole el auxiliar will "there will be" es habrá debido al cambio de tiempo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 18:09:24','¿Entonces que función tiene en la construcción anterior ? si mencionas que s erefiere al plural',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:09:26','Almiux ya me tengo que ir, podemos seguir después?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 18:10:51','Ok,',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:11:11','ahh es habrán',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:12:59','El cree que habrán cuatro generaciones de robots antes que un hombre pueda crear un robot pensate',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:13:12','asi es como quedaría',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-15 18:13:16','cuidate bye',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-15 18:14:34','Bye, ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 13:33:34','Hola buen día, disculpa la tardanza, pero estaba arreglando unos asuntos de casa',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 13:34:11','qué dices, continuamos con la tutoría o mejor después de la comida, tu dime, va',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 13:38:24','Hola buen día, no te preocupes espero toda este bien.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 13:38:57','continuamos despues de la ocmida va ahorita tengo que enviar algunos correos nos vemos a las 4:00 ok',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 13:41:59','Ok, un abrazo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 13:47:14','grax e igual un mega abrazo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:12:34','hola de new Almiux continuamos?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:13:10','claro!!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:14:15','permiteme 5 minutos va?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:14:43','va que va',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:16:13','ya, perdón',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:17:54','recapitulando decías, que te surgia la duda sobre  la terminación de ing de thinking, ya que agregas que ing es el gerundio? , ¿qué quiere decir eso de gerundio?,  ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:37:32','en ingles el geruncio en los verbos se puede observar con el ING al final',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:40:41','es la conjugación del verbo pero nolo recuero muy bien, tengo que investigarlo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:44:25','Entonces, podrías explicarme en qué consiste tu dificultad con thinking',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:49:25','si la termianción ING, en inglés es el gerundio, terminación ando y endo en español y teniendo entendido que Think es pensar',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:53:16','entonces como se traduce en la oración siguiente:',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:53:51','De acuerdo a tu traducción de la idea completa hasta aquí, que función tuvo thinking',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:54:02','El cree que habrán cuatro generaciones de robots antes que un hombre pueda crear un robot pensante o pensando?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:55:01','Si quedó clara mi pregunta',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:55:42','tiene la función de un adjetivo igual por eso se podría traducir como pensante aparte se escucha mejor',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 16:56:41','Entonces con qué aprendizaje te quedas de esto?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 16:59:21','mmmmmm',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 17:00:02','que no necesariamente se traduce con la terminación ando y endo de acuerdo a lo anterior',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 17:00:53','¿cuándo, si se traduce con esas terminaciones y cuándo no?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 17:05:51','cuando el es un verbo y modific ala accion del sujeto y en este caso es un adjetivo el cual nos habal del sujeto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 17:09:54','que interesante hallazgo no? yo también lo encontre, creía que todas las palabras que terminan en ing son verbos y terminan en ando, iendo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 17:11:59','sip fue mi primera impresión pero viendo la oración completa tiene la fución de un adjetivo ufff de otro modo igual se escucharía fuera de tono',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:18:57','Hola, perdón, tuve que resolver un asunto que me llevo cierto tiempo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:19:38','Creo, que en otro momento podríamos investigar más sobre el gerundio y la terminación ing, para tiene mayor claridad de cuál es el sentido y efecto de esas terminaciones, ¿qué te parece?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:20:03','Pasemos al siguiente párrafo, aparecen dos palabras remarcadas y en tu traducción sus respectivos espacios, en señal de no conocerlas.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:20:26','Antes de que pases a buscarlas en el diccionario, que sería lo más fácil hagamos un intento de contextualizarlas primero a partir del texto y de la función que cumplen en este',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-17 18:20:41','Qué función crees que podría estar cumpliendo la palabra chores , si está antes de un adjetivo y un verbo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:53:15','sorry no podia entrar',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:55:19','pues de acuerdo al seria así: LA PRIMERA GENERACIÓN de robots tendrán lainteligencia d eun reptil y solo serán capaces de ahcer tareas manuales, como mover objetos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:55:42','o limpiar cosas. Este será por 1999',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:56:02','son igual adjetivos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-17 18:56:40','ALmiux nos vemos mañanita te cuidas mucho y descansas un abrazo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:14:15','Hola buen día, cuál sería la diferencia entre un adjetivo y un sustantivo?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:20:53','Ya que, según te entiendo, mencionas que chores y hadle son adjetivos?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:21:05','Bueno, para contextualizarnos, te mencionaba que tratáramos de traducir las palabras chores y hadle a partir de contextualizarlos en el texto e identificar su función en éste.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:21:18','Entonces hace la traducción completa de la idea y terminas diciendo que son adjetivos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:21:38','De ahí la pregunta de saber qué entiendes por adjetivo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:21:52','Si chores según tu son tareas y hadle mover',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 11:31:54','El sustantivo es la palabra que funciona como sujeto de la oración ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 11:32:13','y el adjetivo es el califica al sustantivo ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 11:34:32','los tomo como adjetivos porqu eno sdescriben lo que podrán hacer los robots que es el sujeto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 11:35:36','Entonces, a qué conclusión llegas acerca de cual es la función que juega chores ¿es un adjetivo?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 11:38:02','menciono que los tome como adjetivos porque en ese parráfo describen lo que podrán hacer los robots que es el sujeto o sustantivo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 12:48:16','Hola, perdón por la tardanza, pero me estoy tratando de armarte una idea para reflexionar sopbre está última afirmación que das',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,22,'2012-05-18 12:49:13','Asimismo, ya es hora de irnos a reunión, un abrazo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-05-18 12:57:11','sipi yo igual tengo mis dudas, no te preocupes igual estamos batallando con Tlaxcala jeje ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:49:28','Se ven los mensajes mi estimado? por que yo no logro verlos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:50:11','ya los veo mi estimado',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:51:51','Escribe el mensaje y dale Enviar mensaje no le des enter',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:54:06','Que tal mi estimado, aquí estoy a la órden pa la tutoría',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:55:51','Pues como te habia dicho mi estimado Fidel el texto que te ofrezco es el de Literatura titulado Soneto sonetil',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:56:30','oye, tu sabes qué significa es de "Alta en el árbol"? que está al lado de la pantalla',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:57:13','No lo sé pero al parecer tiene que ver con la red, pero no da acceso aún.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:57:42','bueno, igual y lo exploramos en la marcha',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:58:24','comencemos pues',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:58:44','Me parece bien, igual y despues preguntamos con Martha o con el programador',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 17:59:48','Te decía sobr el texto del soneto, aún estas en lo dicho de querer estudiarlo?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 17:59:55','si, en eso quedamos, trabajaremos el poderoso sonetito "Soneto sonetil"',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:00:59','en lo personal este texto aunque es muy corto me ha permitido explorar muchos aspectos de la relación tutora y ha servido de mucho para que los maestros tengan claridad sobre lo que es la tutoría',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:01:34','si, claro que quiero trabajarlo, sobre todo despues de que he visto como se entusiasma la gente al trabajarlo.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:01:49','Perfecto!!!!, pues comencemos, para iniciar qué sabes sobre los sonetos mi estimado?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:02:17','si, justo eso es lo que he observado, de hecho es una de las razones por las quiero trabajarlo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:03:54','sé que los sonetos obras literarias escritas en verso, pero que mantienen una armonia en sus partes, tales como métrica, rima, cuartetos, ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:05:58','orale!!, pues tienes una buena parte avanzada mi estimado!! de echo esas partes que mencionas son algunas de las características del soneto, ¿algo en particular que creas que los diferencias de otros ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:06:24','textos literarios?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:07:56','lo que creo que diferencia de otros es justo la exactitud de sus versos, es decir, cómo están compuestos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:08:55','me parece que es ahí en donde radica su belleza,',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:10:02','Me parece bien,  veamos qué mas nos puede ofrecer el texto, te propongo le des una primera lectura y que escribas la primer interpretación que tengas sobre el soneto el general ¿cómo ves?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:10:39','Voy a probar enviarte un archivo para manejar los recursos de la plataforma',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:10:46','Revisa por favor el siguiente archivo: <a href="files/3/Sonetos_Lope_de_Vega[1].doc" target="_new">Sonetos_Lope_de_Vega[1].doc</a>',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:11:19','Sólo para confirmar, ¿te llega el archivo?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:11:46','sé que los sonetos están compuestos por estrófas con una lógica, los cuartetos y tercetos (no sé si existana más), pero es algo de lo también me gustaria saber',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:12:19','lo estoy abriendo ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:12:35','ya quedó',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:13:25','perfecto!! pues a leer mi estimado, seguro que encontrarás lo que buscas!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:13:41','lo estoy leyendo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:15:53','tomate tu tiempo mi estimado. ',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:18:15','te recomiendo que a partir de lo que leas escribas para que mañana cuando nos volvamos a conectar podamos conversar a partir de tu escrito que opinas?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:18:30','lo acabo de leer, y de entrada me pare muy interesante, creo que en el mismo contenido da muchos elementos de lo que es precisamente un soneto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:19:15','si, seguro, creo que hay mucho que decir, anotaré mis dudas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:19:53','pues entonces, mañana continuamos colega',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:20:18','bueno pues te recomiendo que ésto que me dices y l odemás que encuentres lo escribas en  un texto de word y me lo envías mañana te parece si nos conectamos a las 15:00 hrs?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:20:53','o tu dime a que hora crees conveniente??',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:21:20','de acuerdo,',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,65,'2012-06-14 18:21:48','ok. pues quedamos en eso. Hasta mañana mi estimado',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:22:02','está bien a esa hora, porque de seguro habrá mucho trabajo y reuniones',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:22:23','de acuerdo. gracias por la tutoría',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (36,26,'2012-06-14 18:23:00','es un buen comienzo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (33,23,'2012-08-07 17:10:07','Hola querida!!!!!!!!! como estas?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (3,3,'2012-08-11 01:11:18','<a href="http://168.255.101.69/rt/modulos/tutorias/archivosSubidos/undefined" target="_blank">undefined</a>',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (3,3,'2012-08-11 01:11:41','<a href="http://168.255.101.69/rt/modulos/tutorias/archivosSubidos/chat/3/3/estandares.sql" target="_blank">chat/3/3/estandares.sql</a>',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 10:13:23','Buenos días Adán',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:19:02','Aquí!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,55,'2012-08-13 10:23:23','ya estoy acá',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:23:49','PERFECTO',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:23:56','oye',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,55,'2012-08-13 10:24:06','siii',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:24:11','no hay forma de que recuperemos la conversación anterior verdad?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:24:29','Hola Cony',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,55,'2012-08-13 10:24:41','no no lo creo, ese es buen punto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:24:49','u.u',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:25:52','en fin',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:26:05','qué te parece si me envías la versión final de tu guión?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:27:22','buen día :)',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 10:32:23','hola buenos dias',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 10:33:52','veo que ha desaparecido el historial de nuestra tutoria',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 10:34:06','y eso ma da tristeza porque no lo habia regfistrado',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 10:34:08','jaja',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 10:35:00','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/productos/16/Ejercicios mate Luis Ge..doc">productos/16/Ejercicios mate Luis Ge..doc</a>',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:38:11','(prueba)',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:40:34','Hola, buen día!!!',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 10:41:18','Hola, para que sepas que ya ando aquí',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 10:41:53','hola',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 10:42:49','Buen día ya estoy conectada',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 10:43:04','HOLA',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:44:33','bueno... si no mal recuerdo, nos habíamos quedado en lo que era una hipótesis y cuáles hipótesis venían en la lectura, no?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 10:44:38','ok. recibiste el dcto del viernes?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 10:44:44','Sip',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:48:39','espera, ya recordé',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:48:51','a ver',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:48:53','para retomar',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:48:59','te diré lo que yo recuerdo que dijimos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:49:06','y ya le seguimos, vale?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:49:41','oye, y me podrías volver a mandar tu registro de proceso? es que yo pensé que esta plataforma iba a guardar la liga y por eso no la guardé en mi máquina',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:49:44','pero ahora no la tengo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 10:51:40','Hola',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 10:51:48','se borro todoooooooooooooooooooooooooooooo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 10:52:12','?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 10:54:04','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/chat/18/63/Proceso de aprendizaje Oetzi.docx">chat/18/63/Proceso de aprendizaje Oetzi.docx</a>',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 10:55:11','Hola Naye, podemos continuar con la tutoría?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 10:55:31','estoy en espera de tus avances para estar en sintonía? por fis?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:55:42','gracias',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:55:54','sip ya voy a adjuntar el archivo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:56:15','entonces... lo que pusiste ahí eran interrogantes que tú respecto a la información que se vierte en los textos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:56:25','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/chat/12/23/SESION4.docx">chat/12/23/SESION4.docx</a>',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:56:25','me decías que no sabías si la información era verídica o no',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 10:56:40','por lo cual, querías realizar una investigación, cierto?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:56:50','ya te lo envío, si lo puedes abrir?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (13,61,'2012-08-13 10:57:40','paty, nos esperamos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 10:58:40','Ok, lo estoy abriendo,',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 10:58:49','Okis',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:02:19','Así es, nada más que no pude hacerla puesto que salí a Morelos el viernes',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 11:03:08','tutooooor',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:03:48','muy bien, pues si quieres, podemos hacerla ahora',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:03:56','o bueno, en el transcurso de este día',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:04:32','lo otro, es que, a mí me gustaría que pudiéramos avanzar en el análisis del texto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:04:41','incluso sin tú haber podido hacer mayor investigación',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:04:49','ya que me parece que podemos sacarle mucho jugo al texto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:04:58','por sí mismo, cóm ves?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 11:05:08','<a href="http://168.255.101.69/rt/modulos/tutorias/archivosSubidos/chat/17/59/El sabor de la sal.docx" target="_blank">chat/17/59/El sabor de la sal.docx</a>',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 11:05:24','por suerte conservé el archivo que te acabo de enviar',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:05:52','Si exploremos el texto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:06:48','Muy bien,gracias, entonces continuamos con el quinto párrafo, no antes que me comentes si ya quedó claro la distinción entre adjetivo, sustantivo y verbo?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:08:06','toc, toc',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:08:42','vale, entonces me gustaría preguntarte, de nuevo, qué información de este texto llamó tu atención y por qué?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:10:19','Me llamó la atención el descubrimiento de la momia y las diferentes hipótesis que se plantearon los científicos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:11:45','De acuerdo con lo que escribiste en tu registro, las hipótesis que se plantean ahi son: Murió Oetzi en una oquedad de los Alpes Tiroleses, a 3 mil 200 metros de altura, hace unos 5300 años. Tenía alrededor de 30 años y medía 1.57 metros',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:11:47','sip',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:11:56','es así?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:12:29','el adjetivo: nos proporciona información acerca del sustantivo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:13:00','Sí',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:13:22','el Sustantivo: es la persona animal o cosa de la cual se habla en la oración',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:14:18','y el verbo: expresa la acción del sustantivo dentro de la oración',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:14:53','ya estoy de regreso',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:15:01','muy bien... podrías decirme',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:15:02','tu me avisas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:15:16','de acuerdo con la información que se vierte',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:15:21','Entonces hay distinción en estos tres conceptos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:15:29','si podemos saber en qué año murió Oetzi?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:16:32','lo menciono porque la última intervención que tuviste mencionaste que tareas y manejar eran adjetivos.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (17,59,'2012-08-13 11:16:58','en este archivo ya incorporé lo que investigué sobre las partes del cuento y localicé las partes en el cuento del sabor de la sal',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:17:10','si, cada uno tiene una función distinta dentro de la oración',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:17:13','Aproximadamente hace 3000 años antes de cristo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:17:39','Hola hola hola',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:17:45','Una vez aclarada esta precisión podemos continuar con el quinto párrafo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:18:29','En la siguiente ides By THE THIRD GENERATION, which will come in 2010-2020, de quién estamos hablando?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:18:43','Ándas, por allí?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:18:47','perdón quise decir idea en lugar de ides',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:18:49','muy bien, podríamos, de acuerdo con la información, determinar el año exacto de su muerte?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:19:28','ok dejamos entonces pendiente el párrafo de la segunda generación¡?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:20:11','De acuerdo con el texto si, en el año 3200 A. C.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:20:30','ya lo habiamos trabajado no?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:21:21','no aún no nos habíamos quedado en la primera generación.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:21:35','HOLA ya estas ahí luisge?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:21:37','Ups!!! Perdón, continuemos en la segunda generación',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:21:39','ok',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:21:43','entonces mira',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:21:45','viendo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:21:50','ok',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:22:03','que los diálogos anteriores se borraron y sin sber si serán recuperados,',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:22:20','podrías decirme cómo lo determinaste?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:22:21','creo que hay que ir intentando sistematizar el proceso de estudio hasta el momento',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:22:37','a mi parecer siendo muy específico en las preguntas que fueron utiles',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:22:52','porque no se si tengas mas dudas al respecto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:23:21','restando a 2012 5300 años',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:24:03','dame 5 min. tengo llamada',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:24:10','sugiero que en archivo que te subo ahora en lista de recursos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:24:22','ok',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:24:50','Perdón a 1991, le resté 5300',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:24:51','sigas avanzando',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:24:58','ok, por qué estás tomando el 2012 como año de referencia?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:25:00','ah, vale',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:25:02','a eso iba',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:25:02','digo que sería importante tener los diálogos anteriores',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:25:15','y cuánto te da?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:25:36','cerrar este ejercicio con un proceso y guion y luego entrarle al segundo ejercicio que podemos poner en archivo a parte',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:25:55','Ok, entonces me voy a centarr solo en el problema 3',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:26:18','año 30309',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:26:22','y los sistematizo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:26:29','3309',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:27:07','que te parece si reanudamos la tutoría a las meras 12 del día',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:27:17','para avanzar en lo que me dices',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:27:37','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/productos/16/Ejercicios mate Luis Ge..doc">productos/16/Ejercicios mate Luis Ge..doc</a>',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:27:47','perfecto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:28:15','vale',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:28:18','Nueva Etapa Iniciada',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 11:28:30','perdon estaba calando algo',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:28:33','ahora, con los datos que nos dan podríamos determinar cuál fue su año de nacimiento?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:29:08','ahorita regreso (voy al baño, jeje)',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:29:15','ok. ya recibí el dcto.',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 11:29:22','trabajo en él',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:29:56','3279 fue el año de nacimiento',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:34:02','Ya terminé, una cuetsión que me surge en esta segunda generación ¿Qué lugar ocupa la palabra  brain en la oración?, ¿cuál es su función?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:34:29','esperame 5 min.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:39:59','OK, es un adjetivo y creo que podría tener una relación con la palabra power:poder',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:43:21','podrías decirme qué operación hiciste?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:48:44','A 3279 años le resté los 30 años de edad de Oetzi.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 11:49:58','Entonces cómo quedaría',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:50:24','ok. A ver, recuperemos nuestros datos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:50:33','en qué año quedamos que murió Oetzi?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:50:46','3279',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:50:59','30309',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:51:04','3309',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:51:46','nació en 3279',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:53:06','entiendo que brain es cerebro',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:53:11','Me hice pelotas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:53:25','entonces quedaría asi:',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:53:55','no te preocupes... ahora te preguntaría, por qué restaste los 30 años a 3309?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:55:45','Porque fue la fecha en que lo encotraron su edad era de 30 años',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:56:53','ok. Te parece si comprobamos si el dato que me estás dando es correcto?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:57:03','LA SEGUNDA GENERACIÓN (2000-2010)  de robots tendrán el poder cerebral de mamíferos. pero no se que palabra adecuar para lower porque creo que es amante y esto sale fuera de contexto',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:57:04','tal vez podemos comprobarlo haciendo una línea del tiempo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:57:05','Sip',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 11:57:05','jeje',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:57:10','te parece que lo hagamos?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:57:11','vale',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:57:15','Si',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 11:57:42','alguna vez has elaborado líneas del tiempo?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 11:58:15','Sip',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:03:49','sorry por el pleonasmo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 12:03:54','Ando en eso de la sistematización, me tardo un ratito más',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:05:04','ok, muy bien, porquér dices que lower se refiere a amante, de dónde lo sacas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:07:30','mmmm, esto está muy difícil explicarlo si no se hace gráficamente :(',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:08:03','toc, toc',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:08:07','En alguna clase de inglés fue mencionado y se hablaba de amantes por eso jeje no lo eh buscado',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:08:10','bueno, te parece que cuando realices tu línea del tiempo, me la envíes?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:09:26','mira, te comento algunas cosas que debemos tomar en cuenta para nuestra elaboración',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:09:31','de la línea del tiempo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:09:46','te puedo ayudar diciendo que s erefiere a inferior (si gustas buscala) y trata de armar la idea, va',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:10:07','ok',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:10:20','qué datos le pondrías?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:19:29','LA SEGUNDA GENERACIÓN (2000-2010) de robots tendrá el poder cerebral de mamíferos inferiores. Estas máquinas serán capaces de ser entrenadas y responder a señales.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:20:49','Ok, que interesante no? cómo ves?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:21:05','entiendo que eso de inferior se refiere como a poca capacidad',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:21:11','verdad',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:21:15','?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:22:18','Así es, nosotros somos mamiferos pero no no inferiores verdad? sería interesante buscar cuáles son los mamiferos inferiores, pero en general la idea es la que mencionas',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:23:34','Pero eso sería una tarea posterior si así lo consideras necesario.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:23:45','te parece si continuamos con la tercera generación?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:25:17','sip la apunto como tarea, si me parece interesante conocer esa clasificación',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:25:37','ok continuamos con la tercera generación.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:27:24','pero tengo una duda nosotros somos mamíferos?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:29:04','por ser vertebrados y ser alimentados por nuestras madres?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:30:13','Tu que crees?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:31:44','que si',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:35:24','Muy bien, también sería un tema a investigar para dar mayor seguridad en los argumentos, cómo ves? valoralo y en un tiempito que tengas enriquece tu guión.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:35:45','sip me parece bien',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:36:19','Bueno entrando a la quinta generación By THE THIRD GENERATION, which will come in 2010-2020, en ésta idea de quién estamos hablando',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:39:15','Es la  tercera generación',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:40:45','y se esta hablando del tiempo en el cual  se desarrollará  esa generación',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:41:09','de robots',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (15,58,'2012-08-13 12:44:34','hola',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (41,27216,'2012-08-13 12:45:17','hola',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:55:18','Entonces el verbo estará conjugado en singular o plural?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:55:44','Voy al baño, perdón',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 12:56:56','ok es en singular en mi mi traducción creo que lo coloco en plural pero revisando de nuevo es singular',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 12:59:23','Ok, entonces cómo quedaria By THE THIRD GENERATION, which will come in 2010-2020',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:59:42','oye, podemos seguir en torno a las hipótesis?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 12:59:56','te parece si seguimos hasta la 1:15, o tú ya vas a comer?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,63,'2012-08-13 13:05:03','Ya me voy a comer, conmtinuamos después?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 13:05:14','toc,toc',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:05:36','hola',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:07:51','hola pues nos han informado que regresaremos a reunion a las 14:30',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 13:08:02','Por LA TERCERA GENERACIÓN, que vendrá en 2010-2020',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:04','asi que planeo salir a comer ya en un ratico',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:08:09','y a qué hora piensas salir a comer',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,23,'2012-08-13 13:08:18','dame 10 minutitos por fis',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:22','asi que habria que ponernos de acuerdo',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:32','para avanzarle al trabajo de tutoria',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:46','no se si pueda ser mañana',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:08:59','sobre todo porque ahorita es mucho de entre pares',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 13:09:03','Ok',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:09:07','y pues necesitamos coincidir',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:09:10','como vez?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:10:12','bien. creo que es bueno que salga usted a comer para que baje un poco el estres y veremos que no sdicen en la reunión.',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:11:01','si no hay nada urgente continuamos en la tarde y que las demás parejas se integren conforme resuelvan su conección y sus tiempos',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:12:47','oks muy bien',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,49,'2012-08-13 13:12:53','buen provecho',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 13:14:07','<a href="http://168.255.101.69/c3po/config/apache/htdocs/rt/archivosSubidos/productos/16/Ejercicios mate Luis Ge.13 agosdoc.doc">productos/16/Ejercicios mate Luis Ge.13 agosdoc.doc</a>',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 13:14:31','Alvaro, te envío la sistematización, por fa, echale un ojo',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 13:14:38','y me dices que falta.',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,60,'2012-08-13 13:14:41','garcias.',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (18,54,'2012-08-13 13:15:10','sale y vale',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (16,53,'2012-08-13 13:17:24','ok deja leo luisge',1,2);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 13:25:10','igual',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (12,22,'2012-08-13 13:49:27','13:49 YA?',1,1);
INSERT INTO `Historial` (`idTutoria`,`idUsuario`,`fecha`,`mensaje`,`autorizacion`,`idEtapa`) VALUES (14,47,'2012-08-13 17:04:00','Qué tal Adán?',1,1);
commit;




