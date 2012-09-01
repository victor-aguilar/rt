start transaction;
alter table usuarios drop foreign key idNivelUsuarios;



-- Inserts para la tabla Niveles.
CREATE  TABLE `tutorias`.`Niveles` (

  `idNivel` INT NOT NULL ,

  `idUsuarios` INT NOT NULL ,

  UNIQUE INDEX `idNivel_UNIQUE` (`idNivel` ASC, `idUsuarios` ASC) ,

  INDEX `idNivelNiveles` (`idNivel` ASC) ,

  INDEX `idUsuariosNiveles` (`idUsuarios` ASC) ,

  CONSTRAINT `idNivelNiveles`

    FOREIGN KEY (`idNivel` )

    REFERENCES `tutorias`.`nivel` (`idNivel` )

    ON DELETE CASCADE

    ON UPDATE CASCADE,

  CONSTRAINT `idUsuariosNiveles`

    FOREIGN KEY (`idUsuarios` )

    REFERENCES `tutorias`.`usuarios` (`idUsuario` )

    ON DELETE CASCADE

    ON UPDATE CASCADE);



INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 0);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 1);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 2);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 3);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 4);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 5);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 22);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 23);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 26);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 30);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 33);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 34);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 35);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 36);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 40);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 42);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 47);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 49);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 50);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 51);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 52);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 53);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 54);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 55);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 56);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 57);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 58);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 59);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 60);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 61);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 63);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 64);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 65);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 74);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 75);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (1, 99);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (2, 71);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (2, 76);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (2, 77);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (2, 78);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (2, 80);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (2, 108);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 66);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 67);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 68);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 70);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 72);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 73);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 79);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 81);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 82);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 83);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 84);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 85);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 86);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 87);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 88);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 89);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 94);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 96);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 97);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 98);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 100);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 101);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 102);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 103);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 104);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 105);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 106);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 107);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 109);

INSERT INTO `tutorias`.`niveles` (`idNivel`, `idUsuarios`) VALUES (3, 110);

-- Eliminacion de la columna nivel de la tabla usuarios.

ALTER TABLE `liceocom_tutorias`.`usuarios` DROP COLUMN `idNivel` 

, DROP INDEX `idNivelUsuarios` ;


-- Eliminacion de las restricciones de Modalidad
ALTER TABLE `liceocom_tutorias`.`usuarios` DROP FOREIGN KEY `idModalidad` ;

ALTER TABLE `liceocom_tutorias`.`usuarios` CHANGE COLUMN `idModalidad` `idModalidad` INT(11) NULL  , 

  ADD CONSTRAINT `idModalidad`

  FOREIGN KEY (`idModalidad` )

  REFERENCES `liceocom_tutorias`.`modalidad` (`idModalidad` )

  ON DELETE NO ACTION

  ON UPDATE NO ACTION;



commit