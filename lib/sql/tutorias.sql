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

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Entidades`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Entidades` (`idEntidad`, `nombre`) VALUES (1, 'Aguascalientes');

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
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (1, 'gilberto', 'gilberto', '0', 'hombre', 'lord@sep.gob.mx', '0', 'gilberto', '0', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (2, 'victor', 'victor', '0', 'hombre', 'victor.aguilar@ciencias.unam.mx', '0', 'victor', '0', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (3, 'toño', 'toño', '0', 'hombre', 'antoniohernandez@ciencias.unam.mx', '0', 'toño', '0', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (4, 'hector0', 'hector', '0', 'hombre', 'hector@gmail.com', '0', 'hector', '0', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (22, 'AlmaQ', 'Alma', 'Cuervo', 'mujer', '.', '0', '12345', '0', 1, 0, 0, 4, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (23, 'Naye', 'NAYELI', 'MEJIA BECERRA', 'mujer', 'yeli.admonedu@gmail.com', '5517006837', '231988', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (26, 'FIGAR', 'Jose Fidel', 'Garcia Reyes', 'hombre', 'figar99@hotmail.com', '2224265209', '250478_fg', 'SEB', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (30, 'Arturo', 'Arturo', 'Rodríguez Guerrero', 'hombre', '.', '.', '12345', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (33, 'Martiux', 'Martha', 'Casas', 'mujer', 'martiux21@gmail.com', '.', 'soyel5toelement', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (34, 'Virginia', 'Virginia', 'Mazón', 'mujer', '.', '.', '12345', '.', 1, 0, 0, 4, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (35, 'Héctor', 'Héctor', 'Monges Morán', 'hombre', '.', '.', '12345', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (36, 'Jokabed', 'Jokabed', 'Zagoya Mellado', 'mujer', '.', '.', '12345', '.', 1, 0, 0, 4, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (40, 'Sara', 'Sara', 'Vogel', 'mujer', '.', '.', '12345', '.', 1, 0, 0, 4, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (42, 'María Esther', 'María Esther', 'Padilla Medina', 'mujer', '.', '.', '12345', '.', 1, 0, 0, 4, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (47, 'tutoriara', 'Araceli', 'Castillo', 'mujer', 'araseppe@gmail.com', '.', 'licearatutoria', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (49, 'Adán Rivera', 'Adán', 'Rivera Ramos', 'hombre', 'adals.guana@hotmail.com', '01(55)36014000', 'chinaproduce', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (50, 'ekutoru', 'hector', 'monges morán', 'hombre', 'ekutoru@yahoo.com', '36014000 ext.23907', 'iakattakai', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (51, 'Alvarín1', 'Álvaro', 'de Ávila Aguilar', 'hombre', '2012alavag@gmail.com', '4925442952', 'ALVARINES2', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (52, 'patt_rodriguez', 'Patricia', 'Rodríguez Cordero', 'mujer', 'patrirod_24@yahoo.com.mx', '5529547304', 'patricia', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (53, 'ALVARIN2', 'ALVARO', 'DE AVILA AGUILAR', 'hombre', '2012alavag@gmail.com', '4925442952', 'ALVARINES3', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (54, 'Diana', 'diana', 'lopez', 'mujer', 'dyana3@gmail.com', '.', 'caminando3', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (55, 'Yolito', 'Laura Beatriz', 'Meneses Chico', 'mujer', 'pejpeni@gmail.com', '5525130226', 'marakatu', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (56, 'alvarin3', 'Álvaro', 'de Ávila Aguilar', 'hombre', '2012alavag@gmail.com', '4925442952', 'ALVARINES4', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (57, 'Pablo26', 'JUAN PABLO', 'REYES BERNAL', 'hombre', 'rpjb26@hotmail.com', '5529409418', 'cucopupes2609', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (58, 'Pilar', 'Pilar', 'Herrera', 'mujer', 'pilar.multigrado@gmail.com', '55-1008-6909', 'contraseña', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (59, 'Joka', 'Jokabed', 'Zagoya Mellado', 'mujer', 'jozam_burbuja@yahoo.com.mx', '.', 'lindavenus23', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (60, 'luisge', 'Luis Gerardo', 'Cisneros Hernández', 'hombre', 'luisge8@yahoo.com.mx', '5531904353', 'amanda', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (61, 'smzamudio', 'Sandra', 'Zamudio Hernández', 'mujer', 'sandzam@hotmail.com', '46221298', 'europa41', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (62, 'vic', 'victor', 'aguilar Gonzaga', 'hombre', 'victor.aguilar@yahoo.com.mx', '21579919', 'vic', '.', 1, 0, 0, 1, 1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`, `idNivel`, `idModalidad`) VALUES (27182, 'esviap', 'esviap', 'sistema', 'mujer', 'deathstar@la69.sep', '0', '8182', '0', 1, 0, 0, 1, 1, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Temas`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (1, 'Lee de manera autónoma una variedad de textos con diversos propósitos: aprender, informarse, divertirse.', 1);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (2, 'El area del bikini', 2);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (3, 'diles que no me maten', 26);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (4, 'Tema 4', 40);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (5, 'demo', 3);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (6, 'Tema Alma', 22);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (7, 'Tema Paty', 52);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (8, 'Tema Araceli', 47);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (9, 'Tema Pili', 58);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (10, 'Tema Albaro', 53);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (11, 'Tema Juan Pablo', 57);
INSERT INTO `liceocom_tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (12, 'Tema Diana', 54);

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`Tutorias`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (1, 1, 1);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (2, 2, 1);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (3, 3, 1);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (4, 4, 1);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (5, 1, 2);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (10, 4, 3);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (11, 42, 4);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (20, 60, 5);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (12, 23, 6);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (13, 61, 7);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (14, 49, 8);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (15, 55, 9);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (16, 60, 10);
INSERT INTO `liceocom_tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (17, 59, 11);

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
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (4, 2, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (4, 4, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (5, 2, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (5, 3, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (5, 4, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (10, 1, 1);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (10, 30, 1);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (11, 34, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (11, 36, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (20, 33, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (20, 35, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (20, 52, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (20, 53, 0);
INSERT INTO `liceocom_tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (20, 54, 0);

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
INSERT INTO `liceocom_tutorias`.`Estandares` (`idEstandar`, `idPeriodo`, `idAsignatura`, `idComponenteEjeCategoria`, `descripcion`) VALUES (1, 2, 1, 1, '');

COMMIT;

-- -----------------------------------------------------
-- Data for table `liceocom_tutorias`.`EstandaresDeTema`
-- -----------------------------------------------------
START TRANSACTION;
USE `liceocom_tutorias`;
INSERT INTO `liceocom_tutorias`.`EstandaresDeTema` (`idTema`, `idEstandar`) VALUES (1, 1);

COMMIT;
