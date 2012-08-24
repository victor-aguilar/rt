start transaction;
    alter table Temas add column temaPadre integer references Temas (idTema);
    alter table Temas add column autorizar boolean default false;
    
    drop procedure if exists guardaTemaDeCatalogo;
    delimiter //
    create procedure guardaTemaDeCatalogo(in _idTutoria integer,in _nombre varchar(255))
    begin
        set @id = 1;
            set @est = 27190;
            select idTema into @id from Tutorias where idTutoria = _idTutoria;
            select estudiante into @est from Tutorias where idTutoria = _idTutoria;
            insert into Temas (nombre,idUsuario,temaPadre) values ( _nombre,@est,@id);
    end//

    delimiter ;
    
    drop procedure if exists autorizaTema;

    delimiter //
    create procedure autorizaTema(_idTutoria integer)
    begin
        set @id = 0;
            set @est = 0;
            select idTema into @id from Tutorias where idTutoria = _idTutoria;
            select estudiante into @est from Tutorias where idTutoria = _idTutoria;
            update Temas set autorizado = true where temaPadre = @id and idUsuario = @est;

    end //

-- Esto es lo mas nuevo.

delimiter ;
CREATE  TABLE IF NOT EXISTS `liceocom_tutorias`.`nombreDeProductos` (
  `idProducto` INT UNSIGNED NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`idProducto`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;

INSERT INTO `liceocom_tutorias`.`nombreDeProductos` (`idProducto`, `nombre`) VALUES (1, 'registro_de_proceso_de_estudio');
INSERT INTO `liceocom_tutorias`.`nombreDeProductos` (`idProducto`, `nombre`) VALUES (2, 'guion_de_tutoria');
INSERT INTO `liceocom_tutorias`.`nombreDeProductos` (`idProducto`, `nombre`) VALUES (3, 'demostración_publica');
INSERT INTO `liceocom_tutorias`.`nombreDeProductos` (`idProducto`, `nombre`) VALUES (4, 'registro_de_tutoria');

commit;



