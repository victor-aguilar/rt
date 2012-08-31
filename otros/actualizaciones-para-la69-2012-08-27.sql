start transaction;


-- Productos

ALTER TABLE `tutorias`.`productos` DROP FOREIGN KEY `idTutoriaProductos` ;

ALTER TABLE `tutorias`.`productos` 

  ADD CONSTRAINT `idTutoriaProductos`

  FOREIGN KEY (`idTutoria` )

  REFERENCES `tutorias`.`tutorias` (`idTutoria` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;

-- Historial

ALTER TABLE `tutorias`.`historial` DROP FOREIGN KEY `idTutoriaHistorial` ;

ALTER TABLE `tutorias`.`historial` 

  ADD CONSTRAINT `idTutoriaHistorial`

  FOREIGN KEY (`idTutoria` )

  REFERENCES `tutorias`.`tutorias` (`idTutoria` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;

ALTER TABLE `tutorias`.`historial` DROP FOREIGN KEY `idUsuarioHistorial` ;

ALTER TABLE `tutorias`.`historial` 

  ADD CONSTRAINT `idUsuarioHistorial`

  FOREIGN KEY (`idUsuario` )

  REFERENCES `tutorias`.`usuarios` (`idUsuario` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;


  
-- MensajesPrivados
ALTER TABLE `tutorias`.`mensajesprivados` DROP FOREIGN KEY `deMensajesPrivados` , DROP FOREIGN KEY `paraMensajesPrivados` ;

ALTER TABLE `tutorias`.`mensajesprivados` 

  ADD CONSTRAINT `deMensajesPrivados`

  FOREIGN KEY (`de` )

  REFERENCES `tutorias`.`usuarios` (`idUsuario` )

  ON DELETE CASCADE

  ON UPDATE CASCADE, 

  ADD CONSTRAINT `paraMensajesPrivados`

  FOREIGN KEY (`para` )

  REFERENCES `tutorias`.`usuarios` (`idUsuario` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;

-- Sinodales
ALTER TABLE `tutorias`.`sinodales` DROP FOREIGN KEY `idTutoriaSinodales` , DROP FOREIGN KEY `idUsuarioSinodales` ;

ALTER TABLE `tutorias`.`sinodales` 

  ADD CONSTRAINT `idTutoriaSinodales`

  FOREIGN KEY (`idTutoria` )

  REFERENCES `tutorias`.`tutorias` (`idTutoria` )

  ON DELETE CASCADE

  ON UPDATE CASCADE, 

  ADD CONSTRAINT `idUsuarioSinodales`

  FOREIGN KEY (`idUsuario` )

  REFERENCES `tutorias`.`usuarios` (`idUsuario` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;

-- Demostracion

ALTER TABLE `tutorias`.`demostraciones` DROP FOREIGN KEY `idTutoriaDemostraciones` ;

ALTER TABLE `tutorias`.`demostraciones` 

  ADD CONSTRAINT `idTutoriaDemostraciones`

  FOREIGN KEY (`idTutoria` )

  REFERENCES `tutorias`.`tutorias` (`idTutoria` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;

-- Tutorias 

ALTER TABLE `tutorias`.`tutorias` DROP FOREIGN KEY `estudianteTutorias` , DROP FOREIGN KEY `idTemaTutorias` ;

ALTER TABLE `tutorias`.`tutorias` 

  ADD CONSTRAINT `estudianteTutorias`

  FOREIGN KEY (`estudiante` )

  REFERENCES `tutorias`.`usuarios` (`idUsuario` )

  ON DELETE CASCADE

  ON UPDATE CASCADE, 

  ADD CONSTRAINT `idTemaTutorias`

  FOREIGN KEY (`idTema` )

  REFERENCES `tutorias`.`temas` (`idTema` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;


-- Temas

ALTER TABLE `tutorias`.`temas` DROP FOREIGN KEY `idUsuarioTemas` ;

ALTER TABLE `tutorias`.`temas` 

  ADD CONSTRAINT `idUsuarioTemas`

  FOREIGN KEY (`idUsuario` )

  REFERENCES `tutorias`.`usuarios` (`idUsuario` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;

-- Recursos

ALTER TABLE `tutorias`.`recursos` DROP FOREIGN KEY `idTemaRecursos` ;

ALTER TABLE `tutorias`.`recursos` 

  ADD CONSTRAINT `idTemaRecursos`

  FOREIGN KEY (`idTema` )

  REFERENCES `tutorias`.`temas` (`idTema` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;

-- EstadaresDeTema

ALTER TABLE `tutorias`.`estandaresdetema` DROP FOREIGN KEY `idEstandarEstandaresDeTema` ;

ALTER TABLE `tutorias`.`estandaresdetema` 

  ADD CONSTRAINT `idEstandarEstandaresDeTema`

  FOREIGN KEY (`idEstandar` )

  REFERENCES `tutorias`.`estandares` (`idEstandar` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;

ALTER TABLE `tutorias`.`estandaresdetema` DROP FOREIGN KEY `idTemaEstandaresDeTema` ;

ALTER TABLE `tutorias`.`estandaresdetema` 

  ADD CONSTRAINT `idTemaEstandaresDeTema`

  FOREIGN KEY (`idTema` )

  REFERENCES `tutorias`.`temas` (`idTema` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;


ALTER TABLE `tutorias`.`mensajes` DROP FOREIGN KEY `idTutoriaMensajes` , DROP FOREIGN KEY `idUsuarioMensajes` ;

ALTER TABLE `tutorias`.`mensajes` 

  ADD CONSTRAINT `idTutoriaMensajes`

  FOREIGN KEY (`idTutoria` )

  REFERENCES `tutorias`.`tutorias` (`idTutoria` )

  ON DELETE CASCADE

  ON UPDATE CASCADE, 

  ADD CONSTRAINT `idUsuarioMensajes`

  FOREIGN KEY (`idUsuario` )

  REFERENCES `tutorias`.`usuarios` (`idUsuario` )

  ON DELETE CASCADE

  ON UPDATE CASCADE;


commit;



