SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `tutorias` ;
CREATE SCHEMA IF NOT EXISTS `tutorias` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `tutorias` ;

-- -----------------------------------------------------
-- Table `tutorias`.`Entidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Entidades` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Entidades` (
  `idEntidad` INT NOT NULL ,
  `nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`idEntidad`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Municipios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Municipios` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Municipios` (
  `idMunicipios` INT NOT NULL ,
  `nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`idMunicipios`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Localidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Localidades` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Localidades` (
  `idLocalidad` INT NOT NULL ,
  `nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`idLocalidad`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Nodos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Nodos` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Nodos` (
  `idNodo` INT NOT NULL ,
  `nombre` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`idNodo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Turno` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Turno` (
  `idTurno` INT NOT NULL ,
  `nombre` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`idTurno`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Usuarios` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Usuarios` (
  `idUsuario` INT NOT NULL ,
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
  PRIMARY KEY (`idUsuario`) ,
  INDEX `idEntidadUsuarios` (`idEntidad` ASC) ,
  INDEX `idMunicipioUsuarios` (`idMunicipio` ASC) ,
  INDEX `idLocalidadUsuarios` (`idLocalidad` ASC) ,
  INDEX `idNodoUsuarios` (`idNodo` ASC) ,
  INDEX `idTurnoUsuarios` (`idTurno` ASC) ,
  CONSTRAINT `idEntidadUsuarios`
    FOREIGN KEY (`idEntidad` )
    REFERENCES `tutorias`.`Entidades` (`idEntidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMunicipioUsuarios`
    FOREIGN KEY (`idMunicipio` )
    REFERENCES `tutorias`.`Municipios` (`idMunicipios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLocalidadUsuarios`
    FOREIGN KEY (`idLocalidad` )
    REFERENCES `tutorias`.`Localidades` (`idLocalidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idNodoUsuarios`
    FOREIGN KEY (`idNodo` )
    REFERENCES `tutorias`.`Nodos` (`idNodo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTurnoUsuarios`
    FOREIGN KEY (`idTurno` )
    REFERENCES `tutorias`.`Turno` (`idTurno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Temas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Temas` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Temas` (
  `idTema` INT NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  `idUsuario` INT NOT NULL ,
  PRIMARY KEY (`idTema`) ,
  INDEX `idUsuarioTemas` (`idUsuario` ASC) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) ,
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) ,
  CONSTRAINT `idUsuarioTemas`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Tutorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Tutorias` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Tutorias` (
  `idTutoria` INT NOT NULL AUTO_INCREMENT ,
  `estudiante` INT NOT NULL ,
  `idTema` INT NOT NULL ,
  PRIMARY KEY (`idTutoria`) ,
  INDEX `estudianteTutorias` (`estudiante` ASC) ,
  INDEX `idTemaTutoria` (`idTema` ASC) ,
  CONSTRAINT `estudianteTutorias`
    FOREIGN KEY (`estudiante` )
    REFERENCES `tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTemaTutoria`
    FOREIGN KEY (`idTema` )
    REFERENCES `tutorias`.`Temas` (`idTema` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Etapas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Etapas` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Etapas` (
  `idEtapa` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idEtapa`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Historial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Historial` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Historial` (
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
    REFERENCES `tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuarioHistorial`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEtapaHistorial`
    FOREIGN KEY (`idEtapa` )
    REFERENCES `tutorias`.`Etapas` (`idEtapa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Demostraciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Demostraciones` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Demostraciones` (
  `idTutoria` INT NOT NULL ,
  `fechaInicio` TIMESTAMP NOT NULL DEFAULT '2001-01-01 00:00:00' ,
  `fechaFin` TIMESTAMP NOT NULL DEFAULT '2001-01-01 00:00:00' ,
  `fechaDeLaDemostracion` TIMESTAMP NOT NULL DEFAULT '2001-01-01 00:00:00' ,
  INDEX `idTutoriaDemostraciones` (`idTutoria` ASC) ,
  UNIQUE INDEX `idTutoria_UNIQUE` (`idTutoria` ASC) ,
  UNIQUE INDEX `fechaDeLaDemostracion_UNIQUE` (`fechaDeLaDemostracion` ASC) ,
  UNIQUE INDEX `fechaFin_UNIQUE` (`fechaFin` ASC) ,
  UNIQUE INDEX `fechaInicio_UNIQUE` (`fechaInicio` ASC) ,
  CONSTRAINT `idTutoriaDemostraciones`
    FOREIGN KEY (`idTutoria` )
    REFERENCES `tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Sinodales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Sinodales` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Sinodales` (
  `idTutoria` INT NOT NULL ,
  `idUsuario` INT NOT NULL ,
  `dictamen` TINYINT(1) NOT NULL DEFAULT FALSE ,
  INDEX `idTutoriaSinodales` (`idTutoria` ASC) ,
  INDEX `idUsuarioSinodales` (`idUsuario` ASC) ,
  PRIMARY KEY (`idTutoria`, `idUsuario`) ,
  CONSTRAINT `idTutoriaSinodales`
    FOREIGN KEY (`idTutoria` )
    REFERENCES `tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuarioSinodales`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Mensajes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Mensajes` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Mensajes` (
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
    REFERENCES `tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuarioMensajes`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEtapaMensajes`
    FOREIGN KEY (`idEtapa` )
    REFERENCES `tutorias`.`Etapas` (`idEtapa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Periodos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Periodos` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Periodos` (
  `idPeriodo` INT NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`idPeriodo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`ComponenteEjeCategoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`ComponenteEjeCategoria` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`ComponenteEjeCategoria` (
  `idComponenteEjeCategoria` INT NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`idComponenteEjeCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Asignaturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Asignaturas` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Asignaturas` (
  `idAsignatura` INT NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`idAsignatura`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Recursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Recursos` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Recursos` (
  `idTema` INT NOT NULL ,
  `url` VARCHAR(255) NOT NULL ,
  `descripcion` VARCHAR(255) NOT NULL ,
  `hint` VARCHAR(100) NOT NULL ,
  INDEX `idTemaRecursos` (`idTema` ASC) ,
  CONSTRAINT `idTemaRecursos`
    FOREIGN KEY (`idTema` )
    REFERENCES `tutorias`.`Temas` (`idTema` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Estandares`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Estandares` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Estandares` (
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
    REFERENCES `tutorias`.`Periodos` (`idPeriodo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAsignaturaEstandares`
    FOREIGN KEY (`idAsignatura` )
    REFERENCES `tutorias`.`Asignaturas` (`idAsignatura` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idComponenteEjeCategoriaEstandares`
    FOREIGN KEY (`idComponenteEjeCategoria` )
    REFERENCES `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`EstandaresDeTema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`EstandaresDeTema` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`EstandaresDeTema` (
  `idTema` INT NOT NULL ,
  `idEstandar` INT NOT NULL ,
  INDEX `idTemaEstandaresDeTema` (`idTema` ASC) ,
  INDEX `idEstandarEstandaresDeTema` (`idEstandar` ASC) ,
  CONSTRAINT `idTemaEstandaresDeTema`
    FOREIGN KEY (`idTema` )
    REFERENCES `tutorias`.`Temas` (`idTema` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstandarEstandaresDeTema`
    FOREIGN KEY (`idEstandar` )
    REFERENCES `tutorias`.`Estandares` (`idEstandar` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`Productos` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`Productos` (
  `idTutoria` INT NOT NULL ,
  `url` VARCHAR(255) NOT NULL ,
  `descripcion` VARCHAR(255) NOT NULL ,
  `hint` VARCHAR(100) NOT NULL ,
  INDEX `idTutoriaProductos` (`idTutoria` ASC) ,
  CONSTRAINT `idTutoriaProductos`
    FOREIGN KEY (`idTutoria` )
    REFERENCES `tutorias`.`Tutorias` (`idTutoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutorias`.`MensajesPrivados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutorias`.`MensajesPrivados` ;

CREATE  TABLE IF NOT EXISTS `tutorias`.`MensajesPrivados` (
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
    REFERENCES `tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `paraMensajesPrivados`
    FOREIGN KEY (`para` )
    REFERENCES `tutorias`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- procedure guardaMensaje
-- -----------------------------------------------------

USE `tutorias`;
DROP procedure IF EXISTS `tutorias`.`guardaMensaje`;

DELIMITER $$
USE `tutorias`$$
/*
Guarda un mensaje en la tabla historial y en la tabla mensajes.
*/
CREATE PROCEDURE guardaMensaje(

IN _idTutoria integer, 

IN _idUsuario varchar( 45 ),

IN _fecha timestamp,

IN _mensaje varchar(255),

IN _autorizacion boolean,

IN _idEtapa integer,

OUT _mili integer) 

BEGIN

    INSERT INTO historial VALUES (_idTutoria, _idUsuario, _fecha, _mensaje, _autorizacion, _idEtapa);

    SELECT COUNT(*) INTO _mili FROM `Mensajes` AS m WHERE m.fecha = _fecha;

    INSERT INTO mensajes VALUES (_idTutoria, _idUsuario, _mili, _fecha, _mensaje, _autorizacion, _idEtapa);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure borra
-- -----------------------------------------------------

USE `tutorias`;
DROP procedure IF EXISTS `tutorias`.`borra`;

DELIMITER $$
USE `tutorias`$$
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Entidades`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Entidades` (`idEntidad`, `nombre`) VALUES (1, 'Aguascalientes');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Municipios`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Municipios` (`idMunicipios`, `nombre`) VALUES (0, 'municipio');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Localidades`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Localidades` (`idLocalidad`, `nombre`) VALUES (0, 'localidad');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Nodos`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Nodos` (`idNodo`, `nombre`) VALUES (1, 'Nacional');
INSERT INTO `tutorias`.`Nodos` (`idNodo`, `nombre`) VALUES (2, 'Estatal');
INSERT INTO `tutorias`.`Nodos` (`idNodo`, `nombre`) VALUES (3, 'Regional');
INSERT INTO `tutorias`.`Nodos` (`idNodo`, `nombre`) VALUES (4, 'Escolar');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Turno`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Turno` (`idTurno`, `nombre`) VALUES (1, 'Matutino');
INSERT INTO `tutorias`.`Turno` (`idTurno`, `nombre`) VALUES (2, 'Vespertino');
INSERT INTO `tutorias`.`Turno` (`idTurno`, `nombre`) VALUES (3, 'Tiempo Completo');
INSERT INTO `tutorias`.`Turno` (`idTurno`, `nombre`) VALUES (4, 'Jornada Ampliada');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`) VALUES (1, 'gilberto', 'gilberto', '0', 'hombre', '0', '0', 'gilberto', '0', 1, 0, 0, 1, 1);
INSERT INTO `tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`) VALUES (2, 'victor', 'victor', '0', 'hombre', '0', '0', 'victor', '0', 1, 0, 0, 1, 1);
INSERT INTO `tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`) VALUES (3, 'toño', 'toño', '0', 'hombre', '0', '0', 'toño', '0', 1, 0, 0, 1, 1);
INSERT INTO `tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`) VALUES (4, 'hector', 'hector', '0', 'hombre', '0', '0', 'hector', '0', 1, 0, 0, 1, 1);
INSERT INTO `tutorias`.`Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`, `cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`) VALUES (27182, 'esviap', 'esviap', 'sistema', 'mujer', '0', '0', '8182', '0', 1, 0, 0, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Temas`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Temas` (`idTema`, `nombre`, `idUsuario`) VALUES (1, 'Lee de manera autónoma una variedad de textos con diversos propósitos: aprender, informarse, divertirse.', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Tutorias`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (1, 1, 1);
INSERT INTO `tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (2, 2, 1);
INSERT INTO `tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (3, 3, 1);
INSERT INTO `tutorias`.`Tutorias` (`idTutoria`, `estudiante`, `idTema`) VALUES (4, 4, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Etapas`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (1, 'uno');
INSERT INTO `tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (5, 'Demostracion');
INSERT INTO `tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (2, 'dos');
INSERT INTO `tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (3, 'tres');
INSERT INTO `tutorias`.`Etapas` (`idEtapa`, `nombre`) VALUES (4, 'cuatro');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Demostraciones`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Demostraciones` (`idTutoria`, `fechaInicio`, `fechaFin`, `fechaDeLaDemostracion`) VALUES (4, '2012-07-07 12:20:21', '2012-07-07 12:20:22', '2012-07-07 12:20:20');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Sinodales`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (4, 2, 0);
INSERT INTO `tutorias`.`Sinodales` (`idTutoria`, `idUsuario`, `dictamen`) VALUES (4, 4, 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Periodos`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Periodos` (`idPeriodo`, `nombre`) VALUES (2, 'Segundo periodo escolar, al concluir el tercer grado de primaria');
INSERT INTO `tutorias`.`Periodos` (`idPeriodo`, `nombre`) VALUES (3, 'Tercer periodo escolar, al concluir el sexto grado de primaria');
INSERT INTO `tutorias`.`Periodos` (`idPeriodo`, `nombre`) VALUES (4, 'Cuarto periodo escolar, al concluir el tercer grado de secundaria');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`ComponenteEjeCategoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (1, 'Actitud hacia el estudio de las matemáticas');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (2, 'Actitudes asociadas a la ciencia');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (3, 'Actitudes hacia el lenguaje');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (4, 'Aplicaciones del conocimiento científico y de la tecnología');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (5, 'Conocimiento científico');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (6, 'Conocimiento del funcionamiento y uso del lenguaje');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (7, 'Forma, espacio y medida');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (8, 'Habilidades asociadas a la ciencia');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (9, 'Manejo de la información');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (10, 'Participación en eventos comunicativos orales');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (11, 'Procesos de lectura');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (12, 'Producción de textos escritos');
INSERT INTO `tutorias`.`ComponenteEjeCategoria` (`idComponenteEjeCategoria`, `nombre`) VALUES (13, 'Sentido numérico y pensamiento algebraico');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Asignaturas`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Asignaturas` (`idAsignatura`, `nombre`) VALUES (1, 'Español');
INSERT INTO `tutorias`.`Asignaturas` (`idAsignatura`, `nombre`) VALUES (2, 'Matemáticas');
INSERT INTO `tutorias`.`Asignaturas` (`idAsignatura`, `nombre`) VALUES (3, 'Ciencias');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`Estandares`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`Estandares` (`idEstandar`, `idPeriodo`, `idAsignatura`, `idComponenteEjeCategoria`, `descripcion`) VALUES (1, 2, 1, 1, '');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tutorias`.`EstandaresDeTema`
-- -----------------------------------------------------
START TRANSACTION;
USE `tutorias`;
INSERT INTO `tutorias`.`EstandaresDeTema` (`idTema`, `idEstandar`) VALUES (1, 1);

COMMIT;
