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
commit;



