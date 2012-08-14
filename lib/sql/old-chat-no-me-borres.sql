/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : esviap3

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2012-07-02 13:40:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `historial`
-- ----------------------------
USE `chat`
DROP TABLE IF EXISTS `historial`;
DROP TABLE IF EXISTS `mensajes`;
DROP PROCEDURE IF EXISTS `insertHistMess`;
DROP PROCEDURE IF EXISTS `getNewMess`;


CREATE TABLE `historial` (
  `idChat` integer NOT NULL DEFAULT 0,
  `idUsuario` varchar( 12 ) CHARACTER SET latin1 NOT NULL,
  `fecha` timestamp ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  `mensaje` varchar(255) CHARACTER SET latin1 NOT NULL,
  INDEX (`idChat`, `fecha`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

CREATE TABLE `mensajes`(
  `idChat` integer DEFAULT 0,
  `idUsuario` varchar( 12 ) CHARACTER SET latin1 NOT NULL,
  `mili` integer DEFAULT 0 NOT NULL,
  `fecha` timestamp ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  `mensaje` varchar(255) CHARACTER SET latin1 NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*
Guarda un mensaje en la tabla historial y en la tabla mensajes.
Calcula el valor de la columna mili contando el numero de fechas iguales.
Recibe como parametros de solo lectura a: _idChat, _idUsuario
_fecha, _mensaje. Mientras que _mili (select @_mili) es toda una variable.

No regresa nada.
*/
DELIMITER //
CREATE PROCEDURE insertHistMess(
IN _idChat integer, 
IN _idUsuario varchar( 12 ),
IN _fecha timestamp,
IN _mensaje varchar(255),
OUT _mili integer) 
BEGIN
    INSERT INTO historial VALUES (_idChat, _idUsuario, _fecha, _mensaje);
    SELECT COUNT(*) INTO _mili FROM `mensajes` AS m WHERE m.fecha = _fecha;
    INSERT INTO mensajes VALUES (_idChat, _idUsuario, _mili, _fecha, _mensaje);
END//

/*
Devuelve los mensajes en el chat indicado y aquellos mensajes que fueron guardados
despues de la ultima verificacion.
*/
CREATE PROCEDURE getNewMess(
IN _idChat integer,
IN _lastMili integer,
IN _lastCheck timestamp)
BEGIN
    SELECT idUsuario,mili,fecha,mensaje FROM mensajes AS  m 
        WHERE m.idChat = _idChat AND 
            ( m.fecha > _lastCheck OR 
                (m.fecha = _lastCheck AND m.mili > _lastMili));

END//
DELIMITER ;

/*
Pruebas;

call insertHistMess(1,"victor","2012-02-22 12:22:12","m1");
call insertHistMess(1,"victor","2012-02-22 12:22:12","m2");
call insertHistMess(1,"victor","2012-02-22 12:22:12","m3");
call insertHistMess(1,"victor","2012-02-22 12:22:12","m4");
call insertHistMess(1,"victor","2012-02-22 12:22:12","m5");
call insertHistMess(1,"victor","2012-02-22 12:22:12","m6");


call getNewMess(1,0,"2012-02-22 12:22:12");
call getNewMess(1,1,"2012-02-22 12:22:12");
call getNewMess(1,2,""2012-02-22 12:22:12");

*/


-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `mensajes` VALUES ('1', 'ESVIAP', '0','2012-02-16 12:23:01', ' Oscar se ha unido');
INSERT INTO `mensajes` VALUES ('1', 'ESVIAP','1','2012-02-16 12:23:01', 'lorddive se ha unido');
INSERT INTO `mensajes` VALUES ('1', 'Pili','2','2012-02-16 12:23:01', ' Gil?');
INSERT INTO `mensajes` VALUES ('1', 'Pili','0','2012-02-16 12:26:11', ' ok');
INSERT INTO `mensajes` VALUES ('1', 'ESVIAP','0','2012-02-16 12:26:12', 'Martiux se ha unido');
INSERT INTO `mensajes` VALUES ('1', 'Pili','0','2012-02-16 12:26:13', ' Martiux?');
INSERT INTO `mensajes` VALUES ('1', 'Martiux','0','2012-02-16 12:26:14', ' si?');
INSERT INTO `mensajes` VALUES ('1', 'Martiux','0','2012-02-16 12:26:15', ' ya empezamos');
INSERT INTO `mensajes` VALUES ('1', 'Pili','0','2012-02-16 12:30:20', ' ok, la demostración es para que tú nos digas qué fue lo que hiceiste en tu tutoría, la intención no es que nos tutores');
INSERT INTO `mensajes` VALUES ('1', 'Pili','0','2012-02-16 12:30:21', ' podrías decirnos qué dificultades tuviste para resolver el ejercicio?');
INSERT INTO `mensajes` VALUES ('1', 'Oscar','0','2012-02-16 12:30:22', ' ok empiezo a resolverlo');
INSERT INTO `mensajes` VALUES ('3', 'AlmaQ','0','2012-05-09 19:06:01', 'Revisa por favor el siguiente archivo: <a href=\"files/QUIEN_DIRIGE_A_QUIEN.pdf\" target=\"_new\">QUIEN_DIRIGE_A_QUIEN.pdf</a>');
INSERT INTO `mensajes` VALUES ('3', 'Naye','0','2012-05-09 19:06:06', 'ok me parece bien, a que hora nos vemos?');
INSERT INTO `mensajes` VALUES ('6', 'jprosete','0','2012-06-14 18:20:53', 'o tu dime a que hora crees conveniente??');
INSERT INTO `mensajes` VALUES ('6', 'FIGAR','0','2012-06-14 18:21:20', 'de acuerdo,');
INSERT INTO `mensajes` VALUES ('6', 'jprosete','0','2012-06-14 18:21:48', 'ok. pues quedamos en eso. Hasta mañana mi estimado');
INSERT INTO `mensajes` VALUES ('6', 'FIGAR','0','2012-06-14 18:22:02', 'está bien a esa hora, porque de seguro habrá mucho trabajo y reuniones');
INSERT INTO `mensajes` VALUES ('6', 'FIGAR','0','2012-06-14 18:22:23', 'de acuerdo. gracias por la tutoría');
INSERT INTO `mensajes` VALUES ('6', 'FIGAR','0','2012-06-14 18:23:00', 'es un buen comienzo');
INSERT INTO `mensajes` VALUES ('5', 'lorddive','0','2012-06-25 14:01:48', 'Revisa por favor el siguiente archivo: <a href=\"files/2/P2030086.jpg\" target=\"_new\">P2030086.jpg</a>');



INSERT INTO `historial` VALUES ('1', 'ESVIAP', '2012-02-16 12:23:01', ' Oscar se ha unido');
INSERT INTO `historial` VALUES ('1', 'ESVIAP', '2012-02-16 12:23:01', 'lorddive se ha unido');
INSERT INTO `historial` VALUES ('1', 'Pili', '2012-02-16 12:23:01', ' Gil?');
INSERT INTO `historial` VALUES ('1', 'Pili', '2012-02-16 12:26:11', ' ok');
INSERT INTO `historial` VALUES ('1', 'ESVIAP', '2012-02-16 12:26:12', 'Martiux se ha unido');
INSERT INTO `historial` VALUES ('1', 'Pili', '2012-02-16 12:26:13', ' Martiux?');
INSERT INTO `historial` VALUES ('1', 'Martiux', '2012-02-16 12:26:14', ' si?');
INSERT INTO `historial` VALUES ('1', 'Martiux', '2012-02-16 12:26:15', ' ya empezamos');
INSERT INTO `historial` VALUES ('1', 'Pili', '2012-02-16 12:30:20', ' ok, la demostración es para que tú nos digas qué fue lo que hiceiste en tu tutoría, la intención no es que nos tutores');
INSERT INTO `historial` VALUES ('1', 'Pili', '2012-02-16 12:30:21', ' podrías decirnos qué dificultades tuviste para resolver el ejercicio?');
INSERT INTO `historial` VALUES ('1', 'Oscar', '2012-02-16 12:30:22', ' ok empiezo a resolverlo');
INSERT INTO `historial` VALUES ('3', 'AlmaQ', '2012-05-09 19:06:01', 'Revisa por favor el siguiente archivo: <a href=\"files/QUIEN_DIRIGE_A_QUIEN.pdf\" target=\"_new\">QUIEN_DIRIGE_A_QUIEN.pdf</a>');
INSERT INTO `historial` VALUES ('3', 'Naye', '2012-05-09 19:06:06', 'ok me parece bien, a que hora nos vemos?');
INSERT INTO `historial` VALUES ('6', 'jprosete', '2012-06-14 18:20:53', 'o tu dime a que hora crees conveniente??');
INSERT INTO `historial` VALUES ('6', 'FIGAR', '2012-06-14 18:21:20', 'de acuerdo,');
INSERT INTO `historial` VALUES ('6', 'jprosete', '2012-06-14 18:21:48', 'ok. pues quedamos en eso. Hasta mañana mi estimado');
INSERT INTO `historial` VALUES ('6', 'FIGAR', '2012-06-14 18:22:02', 'está bien a esa hora, porque de seguro habrá mucho trabajo y reuniones');
INSERT INTO `historial` VALUES ('6', 'FIGAR', '2012-06-14 18:22:23', 'de acuerdo. gracias por la tutoría');
INSERT INTO `historial` VALUES ('6', 'FIGAR', '2012-06-14 18:23:00', 'es un buen comienzo');
INSERT INTO `historial` VALUES ('5', 'lorddive', '2012-06-25 14:01:48', 'Revisa por favor el siguiente archivo: <a href=\"files/2/P2030086.jpg\" target=\"_new\">P2030086.jpg</a>');
