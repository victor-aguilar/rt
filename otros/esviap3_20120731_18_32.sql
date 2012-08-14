/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : esviap3

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2012-07-31 18:22:22
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `asignaturas`
-- ----------------------------
DROP TABLE IF EXISTS `asignaturas`;
CREATE TABLE `asignaturas` (
  `Id` int(11) DEFAULT NULL,
  `Asig_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignaturas
-- ----------------------------
INSERT INTO `asignaturas` VALUES ('1', 'Español');
INSERT INTO `asignaturas` VALUES ('2', 'Matemáticas');
INSERT INTO `asignaturas` VALUES ('3', 'Ciencias');

-- ----------------------------
-- Table structure for `cec`
-- ----------------------------
DROP TABLE IF EXISTS `cec`;
CREATE TABLE `cec` (
  `Id` int(11) DEFAULT NULL,
  `Estandard_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cec
-- ----------------------------
INSERT INTO `cec` VALUES ('1', ' Actitud hacia el estudio de las matemáticas');
INSERT INTO `cec` VALUES ('2', ' Actitudes asociadas a la ciencia');
INSERT INTO `cec` VALUES ('3', ' Actitudes hacia el lenguaje');
INSERT INTO `cec` VALUES ('4', ' Aplicaciones del conocimiento científico y de la tecnología');
INSERT INTO `cec` VALUES ('5', ' Conocimiento científico');
INSERT INTO `cec` VALUES ('6', ' Conocimiento del funcionamiento y uso del lenguaje');
INSERT INTO `cec` VALUES ('7', ' Forma, espacio y medida');
INSERT INTO `cec` VALUES ('8', ' Habilidades asociadas a la ciencia');
INSERT INTO `cec` VALUES ('9', ' Manejo de la información');
INSERT INTO `cec` VALUES ('10', ' Participación en eventos comunicativos orales');
INSERT INTO `cec` VALUES ('11', ' Procesos de lectura');
INSERT INTO `cec` VALUES ('12', ' Producción de textos escritos');
INSERT INTO `cec` VALUES ('13', ' Sentido numérico y pensamiento algebraico');

-- ----------------------------
-- Table structure for `chat`
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `IdChat` double DEFAULT NULL,
  `IdUser` varchar(12) CHARACTER SET latin1 DEFAULT NULL,
  `Fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Msg` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  KEY `IdChat` (`IdChat`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES ('1', 'ESVIAP', '2012-02-16 12:23:01', ' Oscar se ha unido');
INSERT INTO `chat` VALUES ('1', 'ESVIAP', '2012-02-16 12:23:02', 'lorddive se ha unido');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:23:03', ' Gil?');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:23:04', ' Si, Pili');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:23:05', ' esperamos a Martha');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:24:06', ' si, espero');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:24:07', ' Pili tambien los veo');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:24:08', ' Ok, Oscariux');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:25:09', ' Gil, puedes ver el historial de la conversación previa a que llegaras al chat? había una carita');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:26:10', ' Solo veo desde: Gil?');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:26:11', ' ok');
INSERT INTO `chat` VALUES ('1', 'ESVIAP', '2012-02-16 12:26:12', 'Martiux se ha unido');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:26:13', ' Martiux?');
INSERT INTO `chat` VALUES ('1', 'Martiux', '2012-02-16 12:26:14', ' si?');
INSERT INTO `chat` VALUES ('1', 'Martiux', '2012-02-16 12:26:15', ' ya empezamos');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:27:16', ' Hola buen día en un ejercicio de geometría (altura y ángulos) se busca saber ¿cuanto mide el ángulo BTY?');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:28:17', ' vamos a empezar dandoples unos datos');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:28:18', ' Sean en el triángulo ABC, AY y BX las alturas por A y B respectivamente y T la intersección de dichas alturas. Los datos que nos da el ejercicio son| ángulo ABC mide 50° y el ángulo BAC mide 60');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:29:19', ' con lo que tengas de conocimientos intenta resolverlo y si tienes una duda aqui estoy para apoyarte..');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:30:20', ' ok, la demostración es para que tú nos digas qué fue lo que hiceiste en tu tutoría, la intención no es que nos tutores');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:30:21', ' podrías decirnos qué dificultades tuviste para resolver el ejercicio?');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:30:22', ' ok empiezo a resolverlo');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:30:23', ' adelante');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:31:24', ' no es necesario, en la presentación q envías está la forma en que lo resolviste');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:31:25', ' pero no mencionas las dificulatdes enfrentadas');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:31:26', ' el primer problema que tuve fue la lectura del ejercicio');
INSERT INTO `chat` VALUES ('1', 'Martiux', '2012-02-16 12:31:27', ' platicales exactamente qué fue lo que confundiste en la comprensión de la lectura');
INSERT INTO `chat` VALUES ('1', 'ESVIAP', '2012-02-16 12:32:28', 'Oscar se ha marchado');
INSERT INTO `chat` VALUES ('1', 'ESVIAP', '2012-02-16 12:32:29', 'Oscar se ha unido');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:32:30', ' perdon fue sin querer');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:34:31', ' Dibuje un triangúlo suponiendo ´que me estaba pidiendo los ángulos internos del ángulo que Pili dibuje, pero eso fue por no leer bien el problema');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:35:32', ' les envio el dibujo ??');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:35:33', ' por favor');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:35:34', ' lorddive@gmail.com');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:36:35', ' ya lo ernvie');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:37:36', ' cuando me preguntó Martha que tipo de triángulo dibuje pense que era uno en específico');
INSERT INTO `chat` VALUES ('1', 'ESVIAP', '2012-02-16 12:38:37', 'Te han invitado a este chat.');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:39:38', ' cual fué tu siguiente paso?');
INSERT INTO `chat` VALUES ('1', 'Martiux', '2012-02-16 12:40:39', ' sugiero que Oscar de la demostración de todo el proceso  e intervengamos en aquellas cosas que no entendamos o que queramos profundizar, cómo ven?');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:40:40', ' me parece bien');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:40:41', ' ok le sigo');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:40:42', ' adelante');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:41:43', ' Conforme me fue haciendo más preguntas y mandándome algunas sugerencias, como ponerle letras a los vértices y que leyera con calma y atención el problema, comencé  a enviarle diferentes dibujos');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:42:44', ' en ese momento tú sabías q era un vértice?');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:42:45', ' lo primero que me empezo ayudar fue ponerle letras a los vertices');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:42:46', ' si');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:42:47', ' ok');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:43:48', ' lo que no tenia claro y creo fue importante fue la definición de altura que me envió Martha');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:44:49', ' ah ok, qué creías que era la altura?');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:45:50', ' me fui a la formula del área de un triángulo y sacaba la altura del triángulo');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:46:51', ' y no las alturas que me solicitaba el problema');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:46:52', ' pero cómo definías altura?');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:47:53', ' no tenia la definición hasta que me la envío Martha');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:48:54', ' ya');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:48:55', ' ahora como defines la altura?');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:49:56', ' hasta que supe que es la medida de la linea que une un vértice con el lado opuesto traze mi dibujo');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:50:01', ' cómo debe ser esta línea respecto al lado opuesto del vértice?');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:50:02', ' la cantidad de lineas que cumplen eso es infinita');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:50:03', ' perpendicular');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:50:04', ' exacto');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:50:05', ' y eso qé significa?');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:51:06', ' como que significa??');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:51:07', ' qué significa q una línea sea perpendicular a otra');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:51:08', ' ?');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:52:09', ' que la cruza');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:52:10', ' sólo eso?');
INSERT INTO `chat` VALUES ('1', 'Martiux', '2012-02-16 12:52:11', ' Oscar recuerda la carateristica principal de las líneas perpendiculares, qué forman cuando se unen?');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:52:12', ' y sus aángulos so de 90 grados en donde la cruza');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:53:13', ' ahh ok');
INSERT INTO `chat` VALUES ('1', 'Martiux', '2012-02-16 12:53:14', ' vientos');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 12:53:15', ' :)');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:53:16', ' eso en la demostración lo pongo despues');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:53:17', ' si, en la diapositiva 7');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:53:18', ' continue poniendo los datos que tenia del problema');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:55:19', ' Es importante saber como señalar el dato de los ángulos que es en la intersección de los vértices.');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:55:20', 'A la hora de trazar las alturas solicitadas tener en cuenta que se crean nuevos triángulos al interior del triángulo principal que es significativo destacar para encontrar la medida del ángulo s');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:56:21', ' Sabemos que la línea de la altura de AY, forma un ángulo recto en el vértice Y de 90° por los dos lados, así como la línea BX en el vértice X.');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:57:22', ' podemos seleccionar cualquier ángulo de los formados dentro del triangúlo principal y despejamos el dato que no tenemos les envio un adjunto');
INSERT INTO `chat` VALUES ('1', 'Oscar', '2012-02-16 12:59:23', ' ya lo envie');
INSERT INTO `chat` VALUES ('1', 'lorddive', '2012-02-16 12:59:24', ' lorddive@gmail.com');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 13:00:25', ' pilar.multigrado@gmail.com no me llegó');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 13:00:26', ' :(');
INSERT INTO `chat` VALUES ('1', 'Pili', '2012-02-16 13:02:27', ' ok');
INSERT INTO `chat` VALUES ('1', 'ESVIAP', '2012-02-16 13:02:28', 'Martiux se ha marchado');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:03:29', ' por lo tanto el dato que pide el ejercicio lo sacamos despejando los datos que vamos sacando son los pasos 7 a 9 del archivo que les envie');
INSERT INTO `chat` VALUES ('2', 'ESVIAP', '2012-02-16 13:04:30', 'Martiux se ha unido');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:04:31', ' en dónde te quedaste Martiux?');
INSERT INTO `chat` VALUES ('2', 'Martiux', '2012-02-16 13:04:32', ' voy bien ya, gracias');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:04:33', ' ok');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:05:34', ' ok, hasta aquí sólo habías tenido dificultad en la comprensión del problema y las alturas?');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:06:35', ' si ya que como les dije me base en el primer dibujo que les envie y de ahí Pili queria sacar los datos que me pedía el ejercicio');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:07:36', ' fue hasta que tenía bien claro lo que me pedia el ejercicio que empeze a resolverlo y sobre todo cuando saque las alturas');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:08:37', ' ok, cómo sabes cuál es el ángulo BAC y ABC?');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:09:38', ' en la interseccion de sus vertices');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:09:39', ' el ángulo BAC en qué vértice se intersectará?');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:10:40', '?');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:11:41', ' es el punto 4 del archivo que envié');
INSERT INTO `chat` VALUES ('2', 'Martiux', '2012-02-16 13:11:42', ' sip, pero intenta responder a la pregunta de Pily, recuperando tu proceso');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:13:43', ' ok el ángulo BAC esta en el vértice A');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:14:44', ' yap');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:14:45', ' :D');
INSERT INTO `chat` VALUES ('2', 'ESVIAP', '2012-02-16 13:14:46', 'lorddive se ha marchado');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:14:47', ' ok, pero entonces eso siempre lo tuvoste claro?');
INSERT INTO `chat` VALUES ('2', 'Pili', '2012-02-16 13:15:48', ' tuviste*');
INSERT INTO `chat` VALUES ('2', 'ESVIAP', '2012-02-16 13:15:49', 'lorddive se ha unido');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:16:50', ' no hasta que pude tener claro lo de la definición de altura');
INSERT INTO `chat` VALUES ('2', 'lorddive', '2012-02-16 13:16:51', ' Oscar, ¿como identificaste el punto T?');
INSERT INTO `chat` VALUES ('2', 'ESVIAP', '2012-02-16 13:17:52', 'Martiux se ha marchado');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:17:53', ' y despues de releer el ejercicio pude ubicar los ángulos');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:18:54', 'el punto t fue la intersección de la altura AY y BX');
INSERT INTO `chat` VALUES ('2', 'ESVIAP', '2012-02-16 13:20:55', 'Martiux se ha unido');
INSERT INTO `chat` VALUES ('2', 'lorddive', '2012-02-16 13:22:56', ' Oscarín, ¿es necesario calcular los ángulos de las diapositivas 10, 11 y 12 para solucionar la pregunta principal?');
INSERT INTO `chat` VALUES ('2', 'Oscar', '2012-02-16 13:24:57', ' No Pili lo hize para tener más datos y fuera más facil, nos podemos ir directo al ángulo BTY y despejar');
INSERT INTO `chat` VALUES ('2', 'lorddive', '2012-02-16 13:25:58', ' muy bien');
INSERT INTO `chat` VALUES ('2', 'Martiux', '2012-02-16 13:25:59', ' bien, entonces con qué datos calculas el ángulo que te pide el ejercicio?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:21:33', 'HOLA');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:22:01', 'Hola!!!!! que gusto, ¿cómo estás?, ¿qué milagro?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:23:09', 'Bien gracias y tu que tal como estas??');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:24:32', 'me gustaría que me tutoraras un tema, que temas tienes?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:37:01', 'Escrito con tinta verde, el elefante, el petróleo, prismas, la altura de los triángulos');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:37:14', 'el de proporcionalidad y el de operaciones con números naturales del cuadernillo Lee, piensa, decide y aprende de Matemáticas');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:37:26', 'asimismo acabo de terminar el tema 4 del Cuadernillo Lee, piensa decide de español, el cual te sugiero estudiar, ahora que vamos a dar seguimiento a la implementación de éste en las entidades. ¿Cómo ves? Te interesa');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:39:02', 'Tienes varios!!!! pero me parece perfecto el tema cuatro del cuadernillo.');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:40:21', 'ya había tenido un primer acercamiento con esta sesión y me encantaría terminarla');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:40:54', 'aMuy bien, entonces te envío un texto que aparece en inglés');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:42:19', 'esta bien lo espero');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:43:31', 'Antes de que te llegue, ¿qué sabes del tema 4 del cuadernillo?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:45:00', 'No es necesario que revises en este momento el cuadernillo, solo comentame a groso modo lo que sabes de éste');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:45:31', 'Pues mira de esa sesión llamada los robots, solo efectue una primera traducción la cual ya no retome');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:46:27', 'así que es lo único que tengo, no ehh analizado el tema');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:49:25', 'Bien, y hiciste por escrito esa traducción, ¿podrías compartirla?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:50:49', 'si la tengo por escrito, te la envío ok');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:51:28', 'Por otra parte dices que el tema trata de robot, ¿qué sabes acerca de éstos?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 18:54:26', 'Aún no me llega tu traducción (te sugiero que me la envíes para que mientras la leo tu me compartes tus saberes acerca de los robots)');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:54:57', 'pues al parecer no mucho tengo entendido que son sistemas mecanicos o maquinas que son diseñadas especialmente para realizar alguna función específica.');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:55:55', 'Revisa por favor el siguiente archivo: <a href=\"files/SESIÓN4.docx\" target=\"_new\">SESIÓN4.docx</a>');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:57:26', 'Revisa por favor el siguiente archivo: <a href=\"files/SESION4.docx\" target=\"_new\">SESION4.docx</a>');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 18:58:34', 'también me gustaría comentarte que cuando efectue esta primera traducción me causo conflicto ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 19:02:26', 'Me queda la duda en cuál sería la diferencia entre un sistema mecanico y una máquina? ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 19:03:05', ' Traducir la oración con los verbos de terminación \'ing\'');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 19:03:11', 'Por otra parte ya tengo tu traducción, gracias, ¿por qué dices qué te causo conflicto?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 19:03:47', 'equivalentes a la terminación ando y endo en español.');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 19:04:10', 'del primero y cuarto párrafo.');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 19:05:25', 'Hacemos un corte aqui y mañana reanudamos va?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 19:05:59', 'Me quedo con la tarea de leer tu traducción y te envío el tema 4 del cuadernillo');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 19:06:01', 'Revisa por favor el siguiente archivo: <a href=\"files/QUIEN_DIRIGE_A_QUIEN.pdf\" target=\"_new\">QUIEN_DIRIGE_A_QUIEN.pdf</a>');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 19:06:06', 'ok me parece bien, a que hora nos vemos?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 19:06:42', 'a las 12:00 ¿qué te parece?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 19:07:48', 'Esta bien nos vemos a las 12:00');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-09 19:08:24', 'Muy bien, bye');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-09 19:09:37', 'Bye, cuidate');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:33:24', 'Hola buen día, espero que estés muy bien con los preparativos para continuar festejando a tu mami');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:33:46', 'Antes que nada, con la intención de que este trabajo vaya fluyendo a partir del respeto de tiempos y necesidades de ambas');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:33:58', 'qué te parece si dedicamos 2 hrs. diarias en chat ¿tu dime qué tiempos propones? para que estemos en sintonía');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 12:34:26', 'Hola Buen día, espero este super igual esperando festejar a tu mami!!');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 12:36:29', 'ok me parece bien dos horas diarias');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 12:36:42', 'de 12:00 a 2:00 esta bien?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:41:04', 'Perfecto, Por otra parte es necesario considerar tiempo fuera del chat para leer e investigar con calma lo que vaya surgiendo');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:41:22', 'asimismo te sugiero que vayas anotando las preguntas e inquietudes que te vayan surgiendo al ir leer el texto, disfruta y juega con el texto');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:41:37', 'Retomando lo trabajado el día de ayer, creo que es importante precisare dos asuntos:');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:42:00', 'Te propongo que iniciemos con el punto 1, para ello retomemos tu definición inicial sobre lo que crees que es un robot y la duda estaba  en ¿cuál es la diferencia entre un sistema mecánico y una máqui');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 12:42:28', 'si me parece bien, investigar fuera del tiempo destinado!!!');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:42:36', '\'perdón \'maquina\', se corto la última sílaba ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 12:46:55', 'entiendo que una maquina es un sistema mecanico, pero buscare la definión ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:47:03', 'No investigues, son tus palabras en un primer momento va?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 12:47:45', 'ok');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:47:51', '¿entonces que entiendes por sistema mecánico?, podrías darme un ejemplo');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 12:51:13', 'podria ser alguna maquinautilizada para empaquetar algun producto en una fabrica');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:51:53', 'qué características tiene');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 12:52:01', 'y es un sistema mecanico porque esta compuesto de dispositivos  que lo hacen funcionar para efectuar el trabajo');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 12:53:34', 'es programable, realiza las funciones en menos tiempo...');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:57:34', 'tOh! entonces cuando mencionas que  son máquinas   que son diseñadas especialmente para realizar alguna función específición me quedaba la duda');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:58:23', 'ya que me imaginaba una máquina simple diseñada para una función especifica podría ser un robot? ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 12:58:54', '¿Quedó clara mi anterior reflexión?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:00:52', 'mmmm buena pregunta');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:00:58', ':D');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:02:21', 'si podria ser un robot pero yo creo no estoy segura que depende del tipo de funcion o caracteristicas con las cuales este compuesta');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:02:30', 'o una licuadora es una máquina diseñada para una función específica no?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:03:40', 'si igual tiene un sistema mecancico y electrico ammm pero igual y hay clasificacion dentro de las maquinas a las cuales a algunas se les llama robots');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:03:59', 'por su complejidad ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:05:16', 'Entonces, para precisar en esta primera defición que podemos decir que es un robot?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:09:10', 'bueno es que ya entre en un dilema no se si darle el nombre de maquina   ammmmm bueno un robot es un sistema mecanico  diseñado para realizar funciones por lo general complejas para el hombre.');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:11:58', '¿por qué entraste en ese dilema?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:13:50', 'por lo de la licuadora jeje');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:14:41', 'pero yo creo que hay alguna clasificación entre maquinas, robots y hasta androides ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:17:20', 'Es interesante como van surgiendo muchos saberes, ahora incorporaste uno nuevo \'androide\', creo que con lo que has dicho en el chat tienes mucha información para definir a estos tres');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:19:18', 'haz el intento, con calma, tomate tu tiempo');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:20:58', 'jeje es que me van surguiendo varias dudas y cosas ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:21:24', 'ok');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:24:09', 'Que padre, si quieres compartir, te lo agradecería mucho');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:30:37', 'Bueno una maquina esta compuesta de varios elementos y es diseñada para actividades dificiles de efectuar por un hombre');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:31:41', 'Un robot es mas complejo creo yop por la composición de sistemas');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:32:24', 'Y el androide?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:33:03', 'mientras que un androide son los que tiene una apariencia humana y además imitan algunas de sus actividades ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:33:31', 'Pero sigue siendo una máquina el robot');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:33:37', 'o conductas ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:35:02', 'El androide es un robot?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:35:18', 'no creo que no ammmmm me enrede en mis propias palabras');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:36:05', 'upsss apenas estaba contestando la primer pregunta');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:37:49', ', Disculpa la insistencia, daré más tiempo lo que intento es que nos quede lo más clarito a qué nos referimos con robot porque esto nos servira en el estudio del tema');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:38:15', 'si el androide debe ser alguna clasificación de los robots');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:38:24', 'por tanto tambien e sun robot');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:45:31', 'Lo relevante es que distingues que hay diferencias entre estos, por otra parte te comparto el siguiente link que puede precisar más acerca del sistema mecánico ttp://st32caren2.blogspot.mx/');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:48:04', 'Por otra parte para profundizar un poco más podrías investigar en algunas fuentes, yo te comparto el siguiente link, y mañana nos conectamos a las 12,');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:48:44', 'para compartir tus hallazgos y continuar con el 2° punto: 2.La dificultad que identificaste con la traducción de palabras con terminación ing (y que según mencionas en español la terminación es ando,');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:49:23', '¿cómo ves? estás de acuerdo');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:51:18', 'ok de acuerdo pero donde esta el Link??');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:53:54', 'ok entonces lo reviso redefino mis ideas');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:54:09', 'http://www.cienciapopular.com/n/Tecnologia/Androides__Humanoides_y_Cyborgs/Androides__Humanoides_y_Cyborgs.php');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:54:28', 'http://www.monografias.com/trabajos31/robotica/robotica.shtml');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 13:58:00', 'Muy bien, seguimos en contacto');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:58:45', 'ok gracias, los reviso ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 13:59:19', 'cuidate bye!!!!');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-10 14:00:50', 'Bye, maña a la misma hora, que la pases super!!!! con tu mami');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-10 14:02:17', 'Gracias e igual que tela pases muy bien con tu mamita!!! hasta mañana');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-11 11:55:07', 'Hola, espero que estés muy bien y que te la hayas pasado muy bien con tu mami.');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-11 11:55:56', 'Sabes? tengo que atender una situación urgente con el equipo de Sinaloa, por favor podríamos seguir con este trabajo después de la comida? 4:00 pm');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-11 12:03:27', 'Hola, como estas que tal te fue ayer? a mi me fue muy bien!!');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-11 12:04:20', 'ahh ok no te preocupes seguimos a las 4:00 p.m.');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-11 16:04:05', 'Hola de nuevo!!!');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-11 16:05:21', 'toc!! toc!!');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-11 16:49:09', 'Hola, perdón, pero se complico un poquitin, pero todo bien, sé que estas resolviendo un asunto de Tlaxcala, tu dices');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-11 16:49:47', 'si seguimos o hasta el lunes');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-11 17:00:51', 'hola perdón si seguimos el lunes');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-11 17:07:01', 'Ok, que te sea leve y tengas un maravilloso fin de semana');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-11 17:09:58', 'Gracias e igual excelente fin');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:07:53', 'Hola como estas? ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 12:08:41', 'Muy bien, me acaban de decir que hay reunión con todos a las 12:00, que te parece si continuamos al terminar la reunión va?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 12:09:02', 'O mientras inicia la reunión me podrías compartir tus hallazgos');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:10:18', 'si tenemos reunión pero terminar continuamos, aunque por distintas cuestiones personales hoy me retiro a las 3:00 p.m.');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:16:10', 'revisando varias paginas encontre que mencionan a un robot como : entidad virtual, máquina, dispositivo o  computadora ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:17:38', 'por tanto yo digo que un robot es : una entidad virtual, máquina, dispositivo o  computadora que efectúa tareas realizadas por el hombre en donde se requiere el uso de  inteligencia.');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:19:27', 'Máquina: Una máquina es un conjunto de elementos móviles y fijos cuyo funcionamiento posibilita aprovechar, dirigir, regular o transformar energía o realizar un trabajo con un fin determinado.');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:21:01', 'con respecto a loa Androides encontré que existen diferentes tipos y clases de robots por tanto los clasifican en 4 formas');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:22:28', 'en una de esas se encuentran los androides siendo estos robots con forma humana Imitan el comportamiento de las personas, su utilidad en la actualidad es de solo experimentación. La principal limitant');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:23:37', 'es el equilibrio en el desplazamiento, por ser bípedo.');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 12:44:13', 'Muy bien,gracias');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 12:45:56', 'Con esta base, qué te parece si entramos a la traducción que ya me enviaste');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 12:46:34', 'te propongo que la revisemos  idea por idea, ¿qué te parece?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:48:24', 'sipi me parece bien');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 12:48:54', 'en la idea: do you think that a robot can ever compete with a man in intelligence?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 12:50:15', 'me generan las siguientes dudas:¿con quién compite el robot con la inteligencia o con el hombre?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 12:53:08', 'yo creoq ue lo que se busca con la construcción d eun robot es competir con la inteligencia');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 12:57:16', 'Y en el texto que nos dice? ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 12:59:08', 'Si trataramos de traducir palaba por palabra lo siguiente:can ever compete with a man in intelligence?  ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 13:08:03', 'Can: verbo poder o sustantivo lata');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 13:08:47', 'ever: alguna vez');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 13:09:54', 'compete: competir, with: con, a: un, man: hombre, in: en y intelligence: inteligencia');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 13:11:45', 'Entonces la pregunta qué plantea?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 13:13:27', 'traducida de manera literal y tomando a DO como auxiliar');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 13:40:49', 'si?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 13:51:05', 'Hola, te sigo esperando');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 13:51:37', 'a que termines la idea');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 14:34:26', 'disculpa me encontraba en una reunión!!');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 14:35:16', 'No te preocupes, espero');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-14 14:36:37', 'Perdón, me decias que hoy te vas a las tres y aún no comes, si quieres mañana continuamos va?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 14:39:24', '¿Piensas que un robot podría alguna vez competir con un hombre en inteligencia?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-14 14:39:52', 'si mañana seguimos, muchas gracias!!');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 11:57:33', 'Hola buen día, ómo estás? podemos continuar con la tutoría');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 12:17:09', 'Buen día, continuemos...');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 12:28:42', 'Aclarando la anterior idea la pregunta se centra a reflexionar sobre si un robot puede competir con el ser humano en inteligencia. Entonces, ¿cuál sería la diferencia entre tu primera traducción y est');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 12:33:46', 'Ah la primera traducción es:¿Piensas que un robot alguna vez podría competir con la inteligencia de un hombre? ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 12:34:06', 'la segunda es: ¿Piensas que un robot podría alguna vez competir con un hombre en inteligencia?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 12:36:30', 'qué diferencias encuentras entre una y otra traducción?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 12:36:32', 'el anexar en la primera articulos de más y el orden de palabras');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 12:37:13', 'por ejemplo algunas vez podría en la primera y en la segunda pordria alguna vez las inverti!!!');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 12:37:55', '¿por qué crees que sucedio esto?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 12:37:58', ' con la inteligencia de un hombre y el otro con un hombre en inteligencia');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 12:39:05', 'creo yo que por falta de claridad en las estructura de las oraciones y que el inglés no se tradcuce de manera literal.');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 12:40:05', 'Y en este caso que sucedio,');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 12:40:18', '¿con cual traducción te sientes mejor?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 12:40:29', 'o mejor dicho, te queda más clara');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 12:44:14', 'me queda clara si la enuncio así: ¿Piensas que un robot podría alguna vez competir con la inteligencia de un hombre?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 12:47:51', '¿por qué?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 12:53:11', 'que te parece si nos damos un espacio y continuamos después dela comida va? Gracias');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 12:54:17', 'esta bien, de nadita.');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 16:18:05', 'Hola de nuevo Almiux, continuamos va que va');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 16:44:58', 'Va,');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 16:47:21', 'Nos quedamos en la traducción de la primera idea');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 16:48:03', 'Y decias que te parecía más clara la traducción ¿Piensas que un robot podría alguna vez competir con la inteligencia de un hombre?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 16:48:38', 'Y te preguntaba por qué lo consideras así?, a uién afecta directamente el verbo compete');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 16:54:54', 'porque me queda clara la idea de quien compite con quien el robot compite con la inteligencia del hombre');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:16:56', 'Mmm, coincido en que la pregunta que te  hice no está bien planteada');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:17:40', 'más bien sería según lo que plantea le texto y tomando en cuenta a quién afecta directamente el verbo compete');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:18:02', 'cuál sería la traducción más cercana');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:19:12', 'Porque lo otro podría caer en solo interpretaciones');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 17:27:02', 'pues la traducción literal sería ¿Piensas que un robot puede alguna vez competir con un hombre en inteligencia?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:37:29', 'Bueno, para tener una idea más global, te propongo que continuemos con los comentarios a tu traducción del texto');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 17:38:33', 'si me parece bien');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:42:38', 'Seguro nos ayudará, la intención es reflexionar cómo interpretamos un texto en inglés, ¿qué referentes usamos?, ¿cómo esto nos ayuda de una forma u otra a entender y usar nuestra propia lengua?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:43:12', 'Asimismo sé que queda pendiente la reflexión o la diferencia entre competir con la inteligencia del hombre y competir con un hombre en inteligencia, matiz que habrá que encontrar');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:47:32', 'En la última idea de este mismo párrafo:  He believes that there will be four generations of robots before man create a thinking robot. En donde dice que pueden ser');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 17:52:23', 'Disculpa Almiux estaba con la Mtra. Dalila');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 17:54:04', 'revisando de nuevo lo puse de manera erronea');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 17:56:56', 'sería así: El cree que habrá cuatro generaciones de robots antes que un hombre pueda crear un robot pensate, pero aqui me surge la duda si thinking teniendo entendido que ing es el gerundio ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 17:57:26', 'en español terminación ando y endo se traduce como pensando o pensante??');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:59:08', 'Qué te hizo cambiar de parecer o en qué te fijaste para cambiar de idea habrá');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 17:59:40', 'en lugar de (que pueden ser)');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 18:01:02', 'no habia tomado en cuenta el auxiliar \'will\' que representa el tiempo futuro');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 18:03:54', 'Alma me tengo que ir, seguimos el jueves va mañana no vendre ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 18:04:23', '¿y el there? qué función cumple en esa construcción: there will be');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 18:05:54', 'there is o there are juntos son hay para singular y plural');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 18:07:49', 'colocandole el auxiliar will \'there will be\' es habrá debido al cambio de tiempo');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 18:09:24', '¿Entonces que función tiene en la construcción anterior ? si mencionas que s erefiere al plural');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 18:09:26', 'Almiux ya me tengo que ir, podemos seguir después?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 18:10:51', 'Ok,');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 18:11:11', 'ahh es habrán');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 18:12:59', 'El cree que habrán cuatro generaciones de robots antes que un hombre pueda crear un robot pensate');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 18:13:12', 'asi es como quedaría');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-15 18:13:16', 'cuidate bye');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-15 18:14:34', 'Bye, ');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 13:33:34', 'Hola buen día, disculpa la tardanza, pero estaba arreglando unos asuntos de casa');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 13:34:11', 'qué dices, continuamos con la tutoría o mejor después de la comida, tu dime, va');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 13:38:24', 'Hola buen día, no te preocupes espero toda este bien.');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 13:38:57', 'continuamos despues de la ocmida va ahorita tengo que enviar algunos correos nos vemos a las 4:00 ok');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 13:41:59', 'Ok, un abrazo');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 13:47:14', 'grax e igual un mega abrazo');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 16:12:34', 'hola de new Almiux continuamos?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 16:13:10', 'claro!!!');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 16:14:15', 'permiteme 5 minutos va?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 16:14:43', 'va que va');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 16:16:13', 'ya, perdón');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 16:17:54', 'recapitulando decías, que te surgia la duda sobre  la terminación de ing de thinking, ya que agregas que ing es el gerundio? , ¿qué quiere decir eso de gerundio?,  ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 16:37:32', 'en ingles el geruncio en los verbos se puede observar con el ING al final');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 16:40:41', 'es la conjugación del verbo pero nolo recuero muy bien, tengo que investigarlo');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 16:44:25', 'Entonces, podrías explicarme en qué consiste tu dificultad con thinking');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 16:49:25', 'si la termianción ING, en inglés es el gerundio, terminación ando y endo en español y teniendo entendido que Think es pensar');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 16:53:16', 'entonces como se traduce en la oración siguiente:');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 16:53:51', 'De acuerdo a tu traducción de la idea completa hasta aquí, que función tuvo thinking');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 16:54:02', 'El cree que habrán cuatro generaciones de robots antes que un hombre pueda crear un robot pensante o pensando?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 16:55:01', 'Si quedó clara mi pregunta');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 16:55:42', 'tiene la función de un adjetivo igual por eso se podría traducir como pensante aparte se escucha mejor');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 16:56:41', 'Entonces con qué aprendizaje te quedas de esto?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 16:59:21', 'mmmmmm');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 17:00:02', 'que no necesariamente se traduce con la terminación ando y endo de acuerdo a lo anterior');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 17:00:53', '¿cuándo, si se traduce con esas terminaciones y cuándo no?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 17:05:51', 'cuando el es un verbo y modific ala accion del sujeto y en este caso es un adjetivo el cual nos habal del sujeto');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 17:09:54', 'que interesante hallazgo no? yo también lo encontre, creía que todas las palabras que terminan en ing son verbos y terminan en ando, iendo');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 17:11:59', 'sip fue mi primera impresión pero viendo la oración completa tiene la fución de un adjetivo ufff de otro modo igual se escucharía fuera de tono');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 18:18:57', 'Hola, perdón, tuve que resolver un asunto que me llevo cierto tiempo');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 18:19:38', 'Creo, que en otro momento podríamos investigar más sobre el gerundio y la terminación ing, para tiene mayor claridad de cuál es el sentido y efecto de esas terminaciones, ¿qué te parece?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 18:20:03', 'Pasemos al siguiente párrafo, aparecen dos palabras remarcadas y en tu traducción sus respectivos espacios, en señal de no conocerlas.');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 18:20:26', 'Antes de que pases a buscarlas en el diccionario, que sería lo más fácil hagamos un intento de contextualizarlas primero a partir del texto y de la función que cumplen en este');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-17 18:20:41', 'Qué función crees que podría estar cumpliendo la palabra chores , si está antes de un adjetivo y un verbo');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 18:53:15', 'sorry no podia entrar');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 18:55:19', 'pues de acuerdo al seria así: LA PRIMERA GENERACIÓN de robots tendrán lainteligencia d eun reptil y solo serán capaces de ahcer tareas manuales, como mover objetos');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 18:55:42', 'o limpiar cosas. Este será por 1999');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 18:56:02', 'son igual adjetivos');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-17 18:56:40', 'ALmiux nos vemos mañanita te cuidas mucho y descansas un abrazo');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-18 11:14:15', 'Hola buen día, cuál sería la diferencia entre un adjetivo y un sustantivo?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-18 11:20:53', 'Ya que, según te entiendo, mencionas que chores y hadle son adjetivos?');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-18 11:21:05', 'Bueno, para contextualizarnos, te mencionaba que tratáramos de traducir las palabras chores y hadle a partir de contextualizarlos en el texto e identificar su función en éste.');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-18 11:21:18', 'Entonces hace la traducción completa de la idea y terminas diciendo que son adjetivos');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-18 11:21:38', 'De ahí la pregunta de saber qué entiendes por adjetivo');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-18 11:21:52', 'Si chores según tu son tareas y hadle mover');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-18 11:31:54', 'El sustantivo es la palabra que funciona como sujeto de la oración ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-18 11:32:13', 'y el adjetivo es el califica al sustantivo ');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-18 11:34:32', 'los tomo como adjetivos porqu eno sdescriben lo que podrán hacer los robots que es el sujeto');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-18 11:35:36', 'Entonces, a qué conclusión llegas acerca de cual es la función que juega chores ¿es un adjetivo?');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-18 11:38:02', 'menciono que los tome como adjetivos porque en ese parráfo describen lo que podrán hacer los robots que es el sujeto o sustantivo');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-18 12:48:16', 'Hola, perdón por la tardanza, pero me estoy tratando de armarte una idea para reflexionar sopbre está última afirmación que das');
INSERT INTO `chat` VALUES ('3', 'AlmaQ', '2012-05-18 12:49:13', 'Asimismo, ya es hora de irnos a reunión, un abrazo');
INSERT INTO `chat` VALUES ('3', 'Naye', '2012-05-18 12:57:11', 'sipi yo igual tengo mis dudas, no te preocupes igual estamos batallando con Tlaxcala jeje ');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 17:49:28', 'Se ven los mensajes mi estimado? por que yo no logro verlos');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 17:50:11', 'ya los veo mi estimado');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 17:51:51', 'Escribe el mensaje y dale Enviar mensaje no le des enter');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 17:54:06', 'Que tal mi estimado, aquí estoy a la órden pa la tutoría');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 17:55:51', 'Pues como te habia dicho mi estimado Fidel el texto que te ofrezco es el de Literatura titulado Soneto sonetil');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 17:56:30', 'oye, tu sabes qué significa es de \"Alta en el árbol\"? que está al lado de la pantalla');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 17:57:13', 'No lo sé pero al parecer tiene que ver con la red, pero no da acceso aún.');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 17:57:42', 'bueno, igual y lo exploramos en la marcha');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 17:58:24', 'comencemos pues');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 17:58:44', 'Me parece bien, igual y despues preguntamos con Martha o con el programador');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 17:59:48', 'Te decía sobr el texto del soneto, aún estas en lo dicho de querer estudiarlo?');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 17:59:55', 'si, en eso quedamos, trabajaremos el poderoso sonetito \"Soneto sonetil\"');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:00:59', 'en lo personal este texto aunque es muy corto me ha permitido explorar muchos aspectos de la relación tutora y ha servido de mucho para que los maestros tengan claridad sobre lo que es la tutoría');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:01:34', 'si, claro que quiero trabajarlo, sobre todo despues de que he visto como se entusiasma la gente al trabajarlo.');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:01:49', 'Perfecto!!!!, pues comencemos, para iniciar qué sabes sobre los sonetos mi estimado?');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:02:17', 'si, justo eso es lo que he observado, de hecho es una de las razones por las quiero trabajarlo');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:03:54', 'sé que los sonetos obras literarias escritas en verso, pero que mantienen una armonia en sus partes, tales como métrica, rima, cuartetos, ');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:05:58', 'orale!!, pues tienes una buena parte avanzada mi estimado!! de echo esas partes que mencionas son algunas de las características del soneto, ¿algo en particular que creas que los diferencias de otros ');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:06:24', 'textos literarios?');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:07:56', 'lo que creo que diferencia de otros es justo la exactitud de sus versos, es decir, cómo están compuestos');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:08:55', 'me parece que es ahí en donde radica su belleza,');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:10:02', 'Me parece bien,  veamos qué mas nos puede ofrecer el texto, te propongo le des una primera lectura y que escribas la primer interpretación que tengas sobre el soneto el general ¿cómo ves?');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:10:39', 'Voy a probar enviarte un archivo para manejar los recursos de la plataforma');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:10:46', 'Revisa por favor el siguiente archivo: <a href=\"files/3/Sonetos_Lope_de_Vega[1].doc\" target=\"_new\">Sonetos_Lope_de_Vega[1].doc</a>');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:11:19', 'Sólo para confirmar, ¿te llega el archivo?');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:11:46', 'sé que los sonetos están compuestos por estrófas con una lógica, los cuartetos y tercetos (no sé si existana más), pero es algo de lo también me gustaria saber');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:12:19', 'lo estoy abriendo ');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:12:35', 'ya quedó');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:13:25', 'perfecto!! pues a leer mi estimado, seguro que encontrarás lo que buscas!!');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:13:41', 'lo estoy leyendo');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:15:53', 'tomate tu tiempo mi estimado. ');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:18:15', 'te recomiendo que a partir de lo que leas escribas para que mañana cuando nos volvamos a conectar podamos conversar a partir de tu escrito que opinas?');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:18:30', 'lo acabo de leer, y de entrada me pare muy interesante, creo que en el mismo contenido da muchos elementos de lo que es precisamente un soneto');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:19:15', 'si, seguro, creo que hay mucho que decir, anotaré mis dudas');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:19:53', 'pues entonces, mañana continuamos colega');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:20:18', 'bueno pues te recomiendo que ésto que me dices y l odemás que encuentres lo escribas en  un texto de word y me lo envías mañana te parece si nos conectamos a las 15:00 hrs?');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:20:53', 'o tu dime a que hora crees conveniente??');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:21:20', 'de acuerdo,');
INSERT INTO `chat` VALUES ('6', 'jprosete', '2012-06-14 18:21:48', 'ok. pues quedamos en eso. Hasta mañana mi estimado');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:22:02', 'está bien a esa hora, porque de seguro habrá mucho trabajo y reuniones');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:22:23', 'de acuerdo. gracias por la tutoría');
INSERT INTO `chat` VALUES ('6', 'FIGAR', '2012-06-14 18:23:00', 'es un buen comienzo');

-- ----------------------------
-- Table structure for `entidades`
-- ----------------------------
DROP TABLE IF EXISTS `entidades`;
CREATE TABLE `entidades` (
  `IdEntidad` int(11) DEFAULT NULL,
  `NomEntidad` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of entidades
-- ----------------------------
INSERT INTO `entidades` VALUES ('1', 'Aguascalientes');
INSERT INTO `entidades` VALUES ('2', 'Baja California');
INSERT INTO `entidades` VALUES ('3', 'Baja California Sur');
INSERT INTO `entidades` VALUES ('4', 'Campeche');
INSERT INTO `entidades` VALUES ('5', 'Coahuila');
INSERT INTO `entidades` VALUES ('6', 'Colima');
INSERT INTO `entidades` VALUES ('7', 'Chiapas');
INSERT INTO `entidades` VALUES ('8', 'Chihuahua');
INSERT INTO `entidades` VALUES ('9', 'Distrito Federal');
INSERT INTO `entidades` VALUES ('10', 'Durango');
INSERT INTO `entidades` VALUES ('11', 'Guanajuato');
INSERT INTO `entidades` VALUES ('12', 'Guerrero');
INSERT INTO `entidades` VALUES ('13', 'Hidalgo');
INSERT INTO `entidades` VALUES ('14', 'Jalisco');
INSERT INTO `entidades` VALUES ('15', 'México');
INSERT INTO `entidades` VALUES ('16', 'Michoacán');
INSERT INTO `entidades` VALUES ('17', 'Morelos');
INSERT INTO `entidades` VALUES ('18', 'Nayarit');
INSERT INTO `entidades` VALUES ('19', 'Nuevo León');
INSERT INTO `entidades` VALUES ('20', 'Oaxaca');
INSERT INTO `entidades` VALUES ('21', 'Puebla');
INSERT INTO `entidades` VALUES ('22', 'Querétaro');
INSERT INTO `entidades` VALUES ('23', 'Quintana Roo');
INSERT INTO `entidades` VALUES ('24', 'San Luis Potosí');
INSERT INTO `entidades` VALUES ('25', 'Sinaloa');
INSERT INTO `entidades` VALUES ('26', 'Sonora');
INSERT INTO `entidades` VALUES ('27', 'Tabasco');
INSERT INTO `entidades` VALUES ('28', 'Tamaulipas');
INSERT INTO `entidades` VALUES ('29', 'Tlaxcala');
INSERT INTO `entidades` VALUES ('30', 'Veracruz ');
INSERT INTO `entidades` VALUES ('31', 'Yucatán');
INSERT INTO `entidades` VALUES ('32', 'Zacatecas');

-- ----------------------------
-- Table structure for `estandares`
-- ----------------------------
DROP TABLE IF EXISTS `estandares`;
CREATE TABLE `estandares` (
  `Id` int(11) DEFAULT NULL,
  `Id_per` int(11) DEFAULT NULL,
  `Periodo` varchar(255) DEFAULT NULL,
  `Id_asig` int(11) DEFAULT NULL,
  `Asignatura` varchar(255) DEFAULT NULL,
  `Id_cec` int(11) DEFAULT NULL,
  `cec` varchar(255) DEFAULT NULL,
  `estandar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estandares
-- ----------------------------
INSERT INTO `estandares` VALUES ('1', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Lee de manera autónoma una variedad de textos con diversos propósitos: aprender, informarse, divertirse.');
INSERT INTO `estandares` VALUES ('2', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Infiere el contenido de un texto a partir de índices, encabezados, títulos y subtítulos.');
INSERT INTO `estandares` VALUES ('3', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Comprende la trama o los argumentos expuestos en los textos.');
INSERT INTO `estandares` VALUES ('4', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Identifica las características generales de los textos literarios, informativos y narrativos, considerando su distribución gráfica y su función comunicativa.');
INSERT INTO `estandares` VALUES ('5', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Distingue elementos de la realidad y de la fantasía en textos literarios.');
INSERT INTO `estandares` VALUES ('6', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Identifica los textos adecuados y los fragmentos específicos para obtener, corroborar o contrastar información sobre un tema determinado.');
INSERT INTO `estandares` VALUES ('7', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Plantea preguntas para guiar la búsqueda de información e identifica fragmentos del texto para responder a éstas.');
INSERT INTO `estandares` VALUES ('8', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Investiga, selecciona y organiza información para comunicar a otros, acerca de diversos temas.');
INSERT INTO `estandares` VALUES ('9', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Lee una variedad de textos literarios y distingue algunas diferencias: poesía, obras de teatro, novelas y cuentos cortos.');
INSERT INTO `estandares` VALUES ('10', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Desarrolla criterios personales para la elección o recomendación de un texto de su preferencia.');
INSERT INTO `estandares` VALUES ('11', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Muestra fluidez al leer en voz alta.');
INSERT INTO `estandares` VALUES ('12', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '11', '1. Procesos de lectura', 'Interpreta adecuadamente, de manera cercana a la convencional, los signos de puntuación en la lectura: punto, coma, signos de exclamación, signos de interrogación, guión y tilde.');
INSERT INTO `estandares` VALUES ('13', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Emplea la escritura para comunicar sus ideas y organizar información sobre temas diversos de manera autónoma.');
INSERT INTO `estandares` VALUES ('14', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Entiende que los diferentes tipos de texto requieren formas particulares de escritura, por lo que adapta sus producciones al tipo de texto que elabora.');
INSERT INTO `estandares` VALUES ('15', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Recupera información de diferentes fuentes y las emplea para desarrollar argumentos al redactar un texto.');
INSERT INTO `estandares` VALUES ('16', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Realiza las adaptaciones necesarias al lenguaje oral para producir textos escritos.');
INSERT INTO `estandares` VALUES ('17', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Ordena las oraciones de un texto escrito de manera coherente.');
INSERT INTO `estandares` VALUES ('18', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Considera al destinatario al producir sus textos.');
INSERT INTO `estandares` VALUES ('19', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Valora la importancia de la revisión y corrección para mejorar los textos producidos y lograr su comprensión.');
INSERT INTO `estandares` VALUES ('20', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Describe un proceso, un fenómeno o una situación en orden cronológico.');
INSERT INTO `estandares` VALUES ('21', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Establece relaciones de causa y efecto al describir, narrar o explicar una serie de eventos en un texto.');
INSERT INTO `estandares` VALUES ('22', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Emplea convencionalmente el uso de mayúsculas y la puntuación.');
INSERT INTO `estandares` VALUES ('23', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Emplea juegos del lenguaje para introducir elementos de humor en textos escritos con dicho propósito.');
INSERT INTO `estandares` VALUES ('24', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '12', '2. Producción de textos escritos', 'Completa formularios para realizar diversos trámites (préstamo bibliotecario, permisos de salida, entre otros).');
INSERT INTO `estandares` VALUES ('25', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '10', '3. Participación en eventos comunicativos orales', 'Comunica sus ideas y escucha a sus compañeros con atención, y respeta turnos al hablar.');
INSERT INTO `estandares` VALUES ('26', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '10', '3. Participación en eventos comunicativos orales', 'Expone información de manera oral y considera la que otros le proporcionan para enriquecer su conocimiento.');
INSERT INTO `estandares` VALUES ('27', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '10', '3. Participación en eventos comunicativos orales', 'Comprende la importancia de comunicarse eficientemente al exponer sus ideas, argumentos y presentar información.');
INSERT INTO `estandares` VALUES ('28', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '10', '3. Participación en eventos comunicativos orales', 'Presenta información atendiendo al orden de exposición o secuencia del discurso.');
INSERT INTO `estandares` VALUES ('29', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '10', '3. Participación en eventos comunicativos orales', 'Describe de forma oral situaciones, personas, objetos, lugares, acontecimientos y escenarios simples de manera efectiva.');
INSERT INTO `estandares` VALUES ('30', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '10', '3. Participación en eventos comunicativos orales', 'Sostiene una conversación en la que explica y argumenta sus preferencias o puntos de vista.');
INSERT INTO `estandares` VALUES ('31', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Utiliza la lectura y la escritura con fines específicos dentro y fuera de la escuela.');
INSERT INTO `estandares` VALUES ('32', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Conoce y aplica las convenciones ortográficas al escribir palabras con dígrafos y sílabas complejas.');
INSERT INTO `estandares` VALUES ('33', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Conoce el uso de las letras mayúsculas al escribir nombres propios, e identifica los párrafos a partir de marcadores textuales, como mayúsculas y punto final.');
INSERT INTO `estandares` VALUES ('34', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Comprende la función de los textos instructivos al seguir instrucciones para resolver tareas cotidianas.');
INSERT INTO `estandares` VALUES ('35', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Identifica pistas para precisar la ortografía de palabras de una misma familia léxica, con ayuda del docente.');
INSERT INTO `estandares` VALUES ('36', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Emplea el orden alfabético en índices y diccionarios para localizar información.');
INSERT INTO `estandares` VALUES ('37', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Introduce la puntuación adecuada (puntos y comas) para delimitar oraciones o elementos de un listado.');
INSERT INTO `estandares` VALUES ('38', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Emplea diccionarios para verificar la ortografía de una palabra.');
INSERT INTO `estandares` VALUES ('39', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '3', '5. Actitudes hacia el lenguaje', 'Identifica y comparte su gusto por algunos temas, autores y géneros literarios.');
INSERT INTO `estandares` VALUES ('40', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '3', '5. Actitudes hacia el lenguaje', 'Desarrolla disposición por leer, escribir, hablar o escuchar.');
INSERT INTO `estandares` VALUES ('41', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '3', '5. Actitudes hacia el lenguaje', 'Desarrolla una actitud positiva para seguir aprendiendo por medio del lenguaje escrito.');
INSERT INTO `estandares` VALUES ('42', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '3', '5. Actitudes hacia el lenguaje', 'Emplea el lenguaje para expresar ideas, emociones y argumentos.');
INSERT INTO `estandares` VALUES ('43', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '3', '5. Actitudes hacia el lenguaje', 'Reconoce y valora las ventajas de hablar más de un idioma para comunicarse con otros, interactuar con los textos y acceder a información.');
INSERT INTO `estandares` VALUES ('44', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '3', '5. Actitudes hacia el lenguaje', 'Reconoce y valora la existencia de otras lenguas que se hablan en México.');
INSERT INTO `estandares` VALUES ('45', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '3', '5. Actitudes hacia el lenguaje', 'Trabaja colaborativamente, escucha y proporciona sus ideas, negocia y toma acuerdos al trabajar en grupo.');
INSERT INTO `estandares` VALUES ('46', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '1', 'Español ', '3', '5. Actitudes hacia el lenguaje', 'Desarrolla un concepto positivo de sí mismo como lector, escritor, hablante u oyente; además, desarrolla gusto por leer, escribir, hablar y escuchar.');
INSERT INTO `estandares` VALUES ('47', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Lee, escribe y compara números naturales de hasta cuatro cifras.');
INSERT INTO `estandares` VALUES ('48', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas de reparto en los que el resultado es una fracción de la forma m/2n.');
INSERT INTO `estandares` VALUES ('49', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas que impliquen sumar o restar números naturales, utilizando los algoritmos convencionales.');
INSERT INTO `estandares` VALUES ('50', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas que impliquen multiplicar o dividir números naturales, utilizando procedimientos informales.');
INSERT INTO `estandares` VALUES ('51', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Figuras y cuerpos geométricos.');
INSERT INTO `estandares` VALUES ('52', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Mide y compara longitudes utilizando unidades no convencionales y algunas convencionales comunes (m, cm).');
INSERT INTO `estandares` VALUES ('53', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '1', '3. Actitud hacia el estudio de las matemáticas', 'Desarrolla un concepto positivo de sí mismo como usuario de las matemáticas, el gusto y la inclinación por comprender y utilizar la notación, el vocabulario y los procesos matemáticos.');
INSERT INTO `estandares` VALUES ('54', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '1', '3. Actitud hacia el estudio de las matemáticas', 'Aplica el razonamiento matemático a la solución de problemas personales, sociales y naturales, aceptando el principio de que existen diversos procedimientos para resolver los problemas particulares.');
INSERT INTO `estandares` VALUES ('55', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '1', '3. Actitud hacia el estudio de las matemáticas', 'Desarrolla el hábito del pensamiento racional y utiliza las reglas del debate matemático al formular explicaciones o mostrar soluciones.');
INSERT INTO `estandares` VALUES ('56', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '2', 'Matemáticas', '1', '3. Actitud hacia el estudio de las matemáticas', 'Comparte e intercambia ideas sobre los procedimientos y resultados al resolver problemas.');
INSERT INTO `estandares` VALUES ('57', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '5', '1. Conocimiento científico', 'Identifica las características físicas personales y las de otros, así como aquellas que son heredadas.');
INSERT INTO `estandares` VALUES ('58', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '5', '1. Conocimiento científico', 'Comprende las relaciones entre plantas y animales y el lugar donde viven en términos de su nutrición y respiración.');
INSERT INTO `estandares` VALUES ('59', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '5', '1. Conocimiento científico', 'Identifica algunas partes del cuerpo humano y funciones asociadas con el movimiento, la nutrición y su relación con el entorno, así como las necesidades nutrimentales básicas.');
INSERT INTO `estandares` VALUES ('60', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '5', '1. Conocimiento científico', 'Describe cambios en el desarrollo y crecimiento de los seres vivos, incluido el ser humano.');
INSERT INTO `estandares` VALUES ('61', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '5', '1. Conocimiento científico', 'Identifica cambios en fenómenos naturales ?como estados físicos en función de la temperatura?, la sucesión del día y la noche, y las fases de la Luna.');
INSERT INTO `estandares` VALUES ('62', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '5', '1. Conocimiento científico', 'Identifica las principales características de la naturaleza y su transformación al satisfacer las necesidades del ser humano.');
INSERT INTO `estandares` VALUES ('63', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '5', '1. Conocimiento científico', 'Describe efectos de la interacción de objetos relacionados con la aplicación de fuerzas, el magnetismo y el sonido.');
INSERT INTO `estandares` VALUES ('64', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '5', '1. Conocimiento científico', 'Identifica algunas características de los materiales y las mezclas.');
INSERT INTO `estandares` VALUES ('65', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '5', '1. Conocimiento científico', 'Describe algunas características del Sol, las estrellas y la Luna, así como los movimientos de la Tierra y la Luna.');
INSERT INTO `estandares` VALUES ('66', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Relaciona las fuerzas, el magnetismo, la electricidad, la luz, el calor y el sonido con su aplicación en diversos aparatos de uso cotidiano.');
INSERT INTO `estandares` VALUES ('67', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Relaciona las características de los materiales con las formas en que se pueden utilizar.');
INSERT INTO `estandares` VALUES ('68', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Identifica las implicaciones de las acciones cotidianas en el medio natural y algunas medidas de prevención.');
INSERT INTO `estandares` VALUES ('69', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Identifica algunas acciones para el cuidado de la salud con base en el conocimiento del cuerpo y la nutrición.');
INSERT INTO `estandares` VALUES ('70', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '8', '3. Habilidades asociadas a la ciencia', 'Planea y lleva a cabo una investigación en el medio local, con un propósito definido.');
INSERT INTO `estandares` VALUES ('71', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '8', '3. Habilidades asociadas a la ciencia', 'Aplica habilidades necesarias para la investigación científica: identifica problemas, plantea preguntas, realiza experimentos, recaba datos, realiza y registra observaciones de campo, resuelve preguntas y comunica resultados.');
INSERT INTO `estandares` VALUES ('72', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '8', '3. Habilidades asociadas a la ciencia', 'Elabora conclusiones con base en la evidencia disponible.');
INSERT INTO `estandares` VALUES ('73', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '8', '3. Habilidades asociadas a la ciencia', 'Aplica el conocimiento de los materiales para diseñar, construir y evaluar un dispositivo o un modelo.');
INSERT INTO `estandares` VALUES ('74', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '8', '3. Habilidades asociadas a la ciencia', 'Comunica los resultados de observaciones y experimentos utilizando diversos recursos, por ejemplo: esquemas, dibujos y otras formas simbólicas.');
INSERT INTO `estandares` VALUES ('75', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '2', '4. Actitudes asociadas a la ciencia', 'Expresa curiosidad acerca de los fenómenos y procesos naturales en una variedad de contextos, y comparte e intercambia ideas al respecto.');
INSERT INTO `estandares` VALUES ('76', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '2', '4. Actitudes asociadas a la ciencia', 'Manifiesta responsabilidad al tomar decisiones informadas para cuidar su salud.');
INSERT INTO `estandares` VALUES ('77', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '2', '4. Actitudes asociadas a la ciencia', 'Disfruta y aprecia los espacios naturales y disponibles para la recreación y la actividad física.');
INSERT INTO `estandares` VALUES ('78', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '2', '4. Actitudes asociadas a la ciencia', 'Muestra disposición y toma decisiones en favor del cuidado del ambiente.');
INSERT INTO `estandares` VALUES ('79', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '2', '4. Actitudes asociadas a la ciencia', 'Valora y respeta las diferentes formas de vida.');
INSERT INTO `estandares` VALUES ('80', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '2', '4. Actitudes asociadas a la ciencia', 'Muestra compromiso con la idea de interdependencia de los seres humanos con la naturaleza y la necesidad de cuidar la riqueza natural.');
INSERT INTO `estandares` VALUES ('81', '2', 'Segundo periodo escolar, al concluir el tercer grado de primaria, entre 8 y 9 años de edad (1º, 2º y 3º)', '3', 'Ciencias ', '2', '4. Actitudes asociadas a la ciencia', 'Muestra disposición para el trabajo colaborativo y respeta las diferencias culturales y de género.');
INSERT INTO `estandares` VALUES ('82', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Identifica y usa información específica de un texto para resolver problemas concretos.');
INSERT INTO `estandares` VALUES ('83', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Formula preguntas precisas para guiar su búsqueda de información.');
INSERT INTO `estandares` VALUES ('84', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Comprende los aspectos centrales de un texto (tema, eventos, trama y personajes involucrados).');
INSERT INTO `estandares` VALUES ('85', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Identifica el orden y establece relaciones de causa y efecto en la trama de una variedad de tipos textuales.');
INSERT INTO `estandares` VALUES ('86', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Infiere información en un texto para recuperar aquella que no se explicita.');
INSERT INTO `estandares` VALUES ('87', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Lee y comprende una variedad de textos de mediana dificultad y puede notar contradicciones, semejanzas y diferencias entre los que abordan un mismo tema.');
INSERT INTO `estandares` VALUES ('88', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Identifica las ideas principales de un texto y selecciona información para resolver necesidades específicas y sustentar sus argumentos.');
INSERT INTO `estandares` VALUES ('89', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Comprende el lenguaje figurado y es capaz de identificarlo en diversos géneros: cuento, novela, teatro y poesía.');
INSERT INTO `estandares` VALUES ('90', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Identifica las características de los textos descriptivos, narrativos, informativos y explicativos, a partir de su distribución gráfica y su función comunicativa, y adapta su lectura a las características del mismo.');
INSERT INTO `estandares` VALUES ('91', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Emplea la cita textual para explicar y argumentar sus propias ideas.');
INSERT INTO `estandares` VALUES ('92', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Interpreta la información contenida en cuadros y tablas.');
INSERT INTO `estandares` VALUES ('93', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Selecciona datos presentados en dos fuentes distintas y los integra en un texto.');
INSERT INTO `estandares` VALUES ('94', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Diferencia entre hechos y opiniones al leer diferentes tipos de textos.');
INSERT INTO `estandares` VALUES ('95', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Sintetiza información sin perder el sentido central del texto.');
INSERT INTO `estandares` VALUES ('96', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '11', '1. Procesos de lectura', 'Identifica y emplea la función de los signos de puntuación al leer: punto, coma, dos puntos, punto y coma, signos de exclamación, signos de interrogación y acentuación.');
INSERT INTO `estandares` VALUES ('97', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Comunica por escrito conocimientos e ideas de manera clara, estableciendo el orden de los mismos, y explicitando las relaciones de causa y efecto al redactar.');
INSERT INTO `estandares` VALUES ('98', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Escribe una variedad de textos para una audiencia específica con diferentes propósitos comunicativos.');
INSERT INTO `estandares` VALUES ('99', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Distingue entre lenguaje formal e informal, y los usa adecuadamente al escribir diferentes tipos de textos.');
INSERT INTO `estandares` VALUES ('100', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Produce un texto de forma autónoma, conceptualmente correcto, a partir de la información provista por dos o tres fuentes.');
INSERT INTO `estandares` VALUES ('101', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Describe y explica por escrito fenómenos diversos usando un estilo impersonal.');
INSERT INTO `estandares` VALUES ('102', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Organiza su escritura en párrafos estructurados, usando la puntuación de manera convencional.');
INSERT INTO `estandares` VALUES ('103', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Emplea diversos recursos lingüísticos y literarios en oraciones, y los usa al redactar.');
INSERT INTO `estandares` VALUES ('104', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Recupera ideas centrales al tomar notas en la revisión de materiales escritos o de una exposición oral de temas estudiados previamente.');
INSERT INTO `estandares` VALUES ('105', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Realiza correcciones a sus producciones con el fin de garantizar el propósito comunicativo y su comprensión por otros lectores.');
INSERT INTO `estandares` VALUES ('106', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Emplea ortografía convencional al escribir.');
INSERT INTO `estandares` VALUES ('107', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Utiliza diversas fuentes de consulta para hacer correcciones ortográficas (diccionarios, glosarios y derivación léxica en diversos materiales).');
INSERT INTO `estandares` VALUES ('108', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Distingue el estilo, registro y tono de acuerdo con el contexto, la audiencia y las necesidades.');
INSERT INTO `estandares` VALUES ('109', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Expone, de manera oral, conocimientos, ideas y sentimientos.');
INSERT INTO `estandares` VALUES ('110', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Emplea el conocimiento que tiene sobre un tema para tomar decisiones y expresar su opinión fundamentada.');
INSERT INTO `estandares` VALUES ('111', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Escucha y aporta sus ideas de manera crítica.');
INSERT INTO `estandares` VALUES ('112', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Emplea diferentes estrategias para persuadir de manera oral a una audiencia.');
INSERT INTO `estandares` VALUES ('113', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Identifica diferentes formas de criticar de manera constructiva y de responder a la crítica.');
INSERT INTO `estandares` VALUES ('114', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Toma notas de una exposición oral.');
INSERT INTO `estandares` VALUES ('115', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Usa la discusión para explorar ideas y temas.');
INSERT INTO `estandares` VALUES ('116', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Usa convencionalmente signos de interrogación y admiración, guiones para introducir diálogos, así como puntos y comas en sus escritos.');
INSERT INTO `estandares` VALUES ('117', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Emplea mayúsculas al inicio de párrafo y después de punto.');
INSERT INTO `estandares` VALUES ('118', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Usa palabras de la misma familia léxica para hacer correcciones a su ortografía.');
INSERT INTO `estandares` VALUES ('119', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Reflexiona consistentemente acerca del funcionamiento de la ortografía y la puntuación en los textos.');
INSERT INTO `estandares` VALUES ('120', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Identifica las características y la función de diferentes tipos textuales.');
INSERT INTO `estandares` VALUES ('121', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Identifica información y sus fuentes para responder a preguntas específicas.');
INSERT INTO `estandares` VALUES ('122', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Incluye citas textuales y referencias bibliográficas en sus textos.');
INSERT INTO `estandares` VALUES ('123', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Identifica y comparte su gusto por algunos temas, autores y géneros literarios.');
INSERT INTO `estandares` VALUES ('124', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Desarrolla disposición por leer, escribir, hablar o escuchar.');
INSERT INTO `estandares` VALUES ('125', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Desarrolla una actitud positiva para seguir aprendiendo por medio del lenguaje escrito.');
INSERT INTO `estandares` VALUES ('126', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Emplea el lenguaje para expresar ideas, emociones y argumentos.');
INSERT INTO `estandares` VALUES ('127', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Discute sobre una variedad de temas de manera atenta y respeta los puntos de vista de otros.');
INSERT INTO `estandares` VALUES ('128', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Amplía su conocimiento sobre obras literarias y comienza a identificar sus preferencias al respecto.');
INSERT INTO `estandares` VALUES ('129', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Reconoce y valora las ventajas y desventajas de hablar más de un idioma para comunicarse con otros, interactuar con los textos y acceder a información.');
INSERT INTO `estandares` VALUES ('130', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Reconoce y valora la existencia de otras lenguas que se hablan en México.');
INSERT INTO `estandares` VALUES ('131', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Trabaja colaborativamente, escucha y proporciona sus ideas, negocia y toma acuerdos al trabajar en grupo.');
INSERT INTO `estandares` VALUES ('132', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Desarrolla un concepto positivo de sí mismo, como lector, escritor, hablante u oyente; además, desarrolla gusto por leer, escribir, hablar y escuchar.');
INSERT INTO `estandares` VALUES ('133', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Lee, escribe y compara números naturales, fraccionarios y decimales.');
INSERT INTO `estandares` VALUES ('134', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas aditivos con números fraccionarios o decimales, usando los algoritmos convencionales.');
INSERT INTO `estandares` VALUES ('135', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas que implican multiplicar o dividir números naturales, usando los algoritmos convencionales.');
INSERT INTO `estandares` VALUES ('136', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas que implican multiplicar o dividir números fraccionarios o decimales entre números naturales, utilizando los algoritmos convencionales.');
INSERT INTO `estandares` VALUES ('137', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Explica las características de diferentes tipos de rectas, ángulos, polígonos y cuerpos geométricos.');
INSERT INTO `estandares` VALUES ('138', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Utiliza sistemas de referencia convencionales para ubicar puntos o describir su ubicación en planos, mapas y en el primer cuadrante del plano cartesiano.');
INSERT INTO `estandares` VALUES ('139', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Establece relaciones entre las unidades del Sistema Internacional de Medidas, las unidades del Sistema Inglés, y las unidades de ambos sistemas.');
INSERT INTO `estandares` VALUES ('140', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Usa fórmulas para calcular perímetros y áreas de triángulos y cuadriláteros.');
INSERT INTO `estandares` VALUES ('141', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Utiliza y relaciona unidades de tiempo (milenios, siglos, décadas, años, meses, semanas, días, horas y minutos) para establecer la duración de diversos sucesos.');
INSERT INTO `estandares` VALUES ('142', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '9', '3. Manejo de la información', 'Calcula porcentajes y utiliza esta herramienta para la resolución de otros problemas, como la comparación de razones.');
INSERT INTO `estandares` VALUES ('143', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '9', '3. Manejo de la información', 'Resuelve problemas al utilizar la información representada en tablas, pictogramas o gráficas de barras, e identifica las medidas de tendencia central de un conjunto de datos.');
INSERT INTO `estandares` VALUES ('144', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '1', '4. Actitud hacia el estudio de las matemáticas', 'Desarrolla un concepto positivo de sí mismo como usuario de las matemáticas, así como el gusto y la inclinación por comprender y utilizar la notación, el vocabulario y los procesos matemáticos.');
INSERT INTO `estandares` VALUES ('145', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '1', '4. Actitud hacia el estudio de las matemáticas', 'Aplica el razonamiento matemático para solucionar problemas personales, sociales y naturales, al aceptar el principio de que existen diversos procedimientos para resolver los problemas particulares.');
INSERT INTO `estandares` VALUES ('146', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '1', '4. Actitud hacia el estudio de las matemáticas', 'Desarrolla el hábito del pensamiento racional y utiliza las reglas del debate matemático al formular explicaciones o mostrar soluciones.');
INSERT INTO `estandares` VALUES ('147', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '2', 'Matemáticas', '1', '4. Actitud hacia el estudio de las matemáticas', 'Comparte e intercambia ideas sobre los procedimientos y resultados al resolver problemas.');
INSERT INTO `estandares` VALUES ('148', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica el funcionamiento integral del cuerpo humano a partir de la interrelación de los sistemas que lo conforman, e identifica causas que afectan la salud.');
INSERT INTO `estandares` VALUES ('149', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Describe los principales cambios en la pubertad, así como el proceso de reproducción y su relación con la herencia.');
INSERT INTO `estandares` VALUES ('150', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica las características de una dieta correcta y su relación con el funcionamiento del cuerpo humano.');
INSERT INTO `estandares` VALUES ('151', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Reconoce la diversidad de los seres vivos, incluidos hongos y bacterias, en términos de la nutrición y la reproducción.');
INSERT INTO `estandares` VALUES ('152', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica los conceptos de biodiversidad, ecosistema, cadenas alimentarias y ambiente.');
INSERT INTO `estandares` VALUES ('153', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica la importancia de la evidencia fósil para el conocimiento del desarrollo de la vida a lo largo del tiempo y los cambios en el ambiente.');
INSERT INTO `estandares` VALUES ('154', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica algunas causas y consecuencias del deterioro de los ecosistemas, así como del calentamiento global.');
INSERT INTO `estandares` VALUES ('155', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica las transformaciones temporales y permanentes en procesos del entorno y en fenómenos naturales, así como algunas de las causas que las producen.');
INSERT INTO `estandares` VALUES ('156', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica algunos efectos de la interacción de objetos relacionados con la fuerza, el movimiento, la luz, el sonido, la electricidad y el calor.');
INSERT INTO `estandares` VALUES ('157', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica algunas manifestaciones y transformaciones de la energía.');
INSERT INTO `estandares` VALUES ('158', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Describe la formación de eclipses y algunas características del Sistema Solar y del Universo.');
INSERT INTO `estandares` VALUES ('159', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Explica algunas causas que afectan el funcionamiento del cuerpo humano y la importancia de desarrollar estilos de vida saludables.');
INSERT INTO `estandares` VALUES ('160', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Identifica la contribución de la ciencia y la tecnología en la investigación, la atención de la salud y el cuidado del ambiente.');
INSERT INTO `estandares` VALUES ('161', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Identifica el aprovechamiento de dispositivos ópticos y eléctricos, máquinas simples, materiales y la conservación de alimentos, en las actividades humanas y en la satisfacción de necesidades.');
INSERT INTO `estandares` VALUES ('162', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Identifica ventajas y desventajas de las formas actuales para obtener y aprovechar la energía térmica y eléctrica, así como la importancia de desarrollar alternativas orientadas al desarrollo sustentable.');
INSERT INTO `estandares` VALUES ('163', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Realiza y registra observaciones de campo y analiza esta información como parte de una investigación científica.');
INSERT INTO `estandares` VALUES ('164', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Aplica habilidades necesarias para la investigación científica: responde preguntas o identifica problemas, revisa resultados, registra datos de observaciones y experimentos, construye, aprueba o rechaza hipótesis, desarrolla explicaciones y comunica');
INSERT INTO `estandares` VALUES ('165', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Planifica y lleva a cabo experimentos que involucran el manejo de variables.');
INSERT INTO `estandares` VALUES ('166', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Explica cómo las conclusiones de una investigación científica son consistentes con los datos y las evidencias.');
INSERT INTO `estandares` VALUES ('167', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Diseña, construye y evalúa dispositivos o modelos aplicando los conocimientos necesarios y las propiedades de los materiales.');
INSERT INTO `estandares` VALUES ('168', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Comunica los resultados de observaciones e investigaciones usando diversos recursos, que incluyan formas simbólicas como esquemas, gráficas y exposiciones, además de las tecnologías de la comunicación y la información.');
INSERT INTO `estandares` VALUES ('169', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Expresa curiosidad acerca de los fenómenos y procesos naturales en una variedad de contextos, y comparte e intercambia ideas al respecto.');
INSERT INTO `estandares` VALUES ('170', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Valora el conocimiento científico y sus enfoques para investigar y explicar los fenómenos y procesos naturales.');
INSERT INTO `estandares` VALUES ('171', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Manifiesta disposición y toma decisiones en favor del cuidado del ambiente.');
INSERT INTO `estandares` VALUES ('172', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Valora y respeta las diferentes formas de vida.');
INSERT INTO `estandares` VALUES ('173', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Manifiesta compromiso con la idea de la interdependencia de los humanos con la naturaleza y la necesidad de cuidar la riqueza natural.');
INSERT INTO `estandares` VALUES ('174', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Manifiesta responsabilidad al tomar decisiones informadas para cuidar su salud.');
INSERT INTO `estandares` VALUES ('175', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Disfruta y aprecia los espacios naturales disponibles para la recreación y la actividad física.');
INSERT INTO `estandares` VALUES ('176', '3', 'Tercer periodo escolar, al concluir el sexto grado de primaria, entre 11 y 12 años de edad (4º, 5º y 6º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Muestra disposición para el trabajo colaborativo y respeta las diferencias culturales y de género.');
INSERT INTO `estandares` VALUES ('177', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '11', '1. Procesos de lectura', 'Emplea la lectura como herramienta para seguir aprendiendo y comprender su entorno.');
INSERT INTO `estandares` VALUES ('178', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '11', '1. Procesos de lectura', 'Selecciona de manera adecuada las fuentes de consulta de acuerdo con sus propósitos y temas de interés.');
INSERT INTO `estandares` VALUES ('179', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '11', '1. Procesos de lectura', 'Analiza críticamente la información que se difunde por medio de la prensa escrita, comparando y contrastando las formas en que una misma noticia se presenta en diferentes medios de comunicación.');
INSERT INTO `estandares` VALUES ('180', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '11', '1. Procesos de lectura', 'Reconoce la importancia de releer un texto para interpretar su contenido.');
INSERT INTO `estandares` VALUES ('181', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '11', '1. Procesos de lectura', 'Identifica la estructura y los rasgos estilísticos de poemas, novelas, obras de teatro y autobiografías.');
INSERT INTO `estandares` VALUES ('182', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '11', '1. Procesos de lectura', 'Analiza los mensajes publicitarios para exponer de forma crítica los efectos en los consumidores.');
INSERT INTO `estandares` VALUES ('183', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '11', '1. Procesos de lectura', 'Utiliza la información de artículos de opinión para ampliar sus conocimientos y formar un punto de vista propio.');
INSERT INTO `estandares` VALUES ('184', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '11', '1. Procesos de lectura', 'Emplea adecuadamente al leer las formas comunes de puntuación: punto, coma, dos puntos, punto y coma, signos de exclamación, signos de interrogación, apóstrofo, guión y tilde.');
INSERT INTO `estandares` VALUES ('185', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Produce textos para expresarse.');
INSERT INTO `estandares` VALUES ('186', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Produce textos en los que analiza información.');
INSERT INTO `estandares` VALUES ('187', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Escribe textos originales de diversos tipos y formatos.');
INSERT INTO `estandares` VALUES ('188', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Produce textos adecuados y coherentes al tipo de información que desea difundir.');
INSERT INTO `estandares` VALUES ('189', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Produce un texto con lógica y cohesión.');
INSERT INTO `estandares` VALUES ('190', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Emplea signos de puntuación de acuerdo con la intención que desea expresar.');
INSERT INTO `estandares` VALUES ('191', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Comprende la importancia de la corrección de textos para hacerlos claros a los lectores y mantener el propósito comunicativo.');
INSERT INTO `estandares` VALUES ('192', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Usa oraciones subordinadas, compuestas y coordinadas al producir textos que lo requieran.');
INSERT INTO `estandares` VALUES ('193', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Corrige textos empleando manuales de redacción y ortografía para resolver dudas.');
INSERT INTO `estandares` VALUES ('194', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Emplea los tiempos y modos verbales de manera coherente.');
INSERT INTO `estandares` VALUES ('195', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '12', '2. Producción de textos escritos', 'Usa en la escritura los recursos lingüísticos para expresar temporalidad, causalidad y simultaneidad.');
INSERT INTO `estandares` VALUES ('196', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Expresa y defiende opiniones e ideas de una manera razonada empleando el diálogo como forma privilegiada para resolver conflictos.');
INSERT INTO `estandares` VALUES ('197', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Utiliza una amplia variedad de modalidades del habla, como las conversaciones informales y discursos formales.');
INSERT INTO `estandares` VALUES ('198', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Expone de manera clara y lógica un tema y utiliza un lenguaje adecuado a sus interlocutores.');
INSERT INTO `estandares` VALUES ('199', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Utiliza diversos recursos discursivos para elaborar una exposición con una intención determinada.');
INSERT INTO `estandares` VALUES ('200', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Analiza las estrategias discursivas para seleccionar y aplicar las propias al participar en discusiones, análisis o debates.');
INSERT INTO `estandares` VALUES ('201', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '10', '3. Participación en eventos comunicativos orales', 'Respeta diversos puntos de vista y recupera las aportaciones de otros para enriquecer su conocimiento.');
INSERT INTO `estandares` VALUES ('202', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Emplea la puntuación y la ortografía de acuerdo con las normas establecidas.');
INSERT INTO `estandares` VALUES ('203', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Identifica fallas ortográficas y gramaticales en textos para corregirlos.');
INSERT INTO `estandares` VALUES ('204', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Comprende el contenido de diversos documentos legales y administrativos para emplearlos en situaciones específicas.');
INSERT INTO `estandares` VALUES ('205', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Utiliza adecuadamente nexos y adverbios en textos orales y escritos.');
INSERT INTO `estandares` VALUES ('206', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Emplea las fuentes textuales adecuadas para obtener información de distintas disciplinas.');
INSERT INTO `estandares` VALUES ('207', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '6', '4. Conocimiento del funcionamiento y uso del lenguaje', 'Utiliza adecuadamente los tiempos verbales al producir un texto.');
INSERT INTO `estandares` VALUES ('208', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Identifica y comparte su gusto por algunos temas, autores y géneros literarios.');
INSERT INTO `estandares` VALUES ('209', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Desarrolla disposición por leer, escribir, hablar o escuchar.');
INSERT INTO `estandares` VALUES ('210', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Desarrolla una actitud positiva para seguir aprendiendo por medio del lenguaje escrito.');
INSERT INTO `estandares` VALUES ('211', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Emplea el lenguaje para expresar ideas, emociones y argumentos.');
INSERT INTO `estandares` VALUES ('212', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Discute sobre una variedad de temas de manera atenta y respeta los puntos de vista de otros.');
INSERT INTO `estandares` VALUES ('213', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Valora la autoría propia y desarrolla autoconfianza como autor u orador.');
INSERT INTO `estandares` VALUES ('214', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Emplea el potencial del lenguaje para la resolución de conflictos.');
INSERT INTO `estandares` VALUES ('215', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Reconoce y valora las ventajas y desventajas de hablar más de un idioma para comunicarse con otros, interactuar con los textos y acceder a información.');
INSERT INTO `estandares` VALUES ('216', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Reconoce y valora la existencia de otras lenguas que se hablan en México.');
INSERT INTO `estandares` VALUES ('217', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Trabaja colaborativamente, escucha y proporciona sus ideas, negocia y toma acuerdos al trabajar en grupo.');
INSERT INTO `estandares` VALUES ('218', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '1', 'Español', '3', '5. Actitudes hacia el lenguaje', 'Desarrolla un concepto positivo de sí mismo como lector, escritor, hablante u oyente; además, desarrolla gusto por leer, escribir, hablar y escuchar.');
INSERT INTO `estandares` VALUES ('219', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas que implican convertir números fraccionarios a decimales y viceversa.');
INSERT INTO `estandares` VALUES ('220', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas que implican calcular el mínimo común múltiplo o el máximo común divisor.');
INSERT INTO `estandares` VALUES ('221', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas aditivos que implican efectuar cálculos con expresiones algebraicas.');
INSERT INTO `estandares` VALUES ('222', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas multiplicativos con expresiones algebraicas, a excepción de la división entre polinomios.');
INSERT INTO `estandares` VALUES ('223', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas que implican expresar y utilizar la regla general lineal o cuadrática de una sucesión.');
INSERT INTO `estandares` VALUES ('224', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '13', '1. Sentido numérico y pensamiento algebraico', 'Resuelve problemas que involucran el uso de ecuaciones lineales o cuadráticas.');
INSERT INTO `estandares` VALUES ('225', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Resuelve problemas que implican construir círculos y polígonos regulares con base en información diversa y usa las relaciones entre sus puntos y rectas notables.');
INSERT INTO `estandares` VALUES ('226', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Utiliza la regla y el compás para realizar diversos trazos, como alturas de triángulos, mediatrices, rotaciones, simetrías, etcétera.');
INSERT INTO `estandares` VALUES ('227', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Resuelve problemas que implican aplicar las propiedades de la congruencia y la semejanza en diversos polígonos.');
INSERT INTO `estandares` VALUES ('228', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Calcula cualquiera de las variables que intervienen en las fórmulas de perímetro, área y volumen.');
INSERT INTO `estandares` VALUES ('229', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Determina la medida de diversos elementos del círculo, como: circunferencia, superficie, ángulo inscrito y central, arcos de la circunferencia, sectores y coronas circulares.');
INSERT INTO `estandares` VALUES ('230', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '7', '2. Forma, espacio y medida', 'Aplica el teorema de Pitágoras y las razones trigonométricas seno, coseno y tangente en la resolución de problemas.');
INSERT INTO `estandares` VALUES ('231', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '9', '3. Manejo de la información', 'Resuelve problemas vinculados a la proporcionalidad directa, inversa o múltiple, como porcentajes, escalas, interés simple o compuesto.');
INSERT INTO `estandares` VALUES ('232', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '9', '3. Manejo de la información', 'Expresa algebraicamente una relación lineal o cuadrática entre dos conjuntos de cantidades.');
INSERT INTO `estandares` VALUES ('233', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '9', '3. Manejo de la información', 'Calcula la probabilidad de eventos complementarios, mutuamente excluyentes e independientes.');
INSERT INTO `estandares` VALUES ('234', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '9', '3. Manejo de la información', 'Lee y representa información en diferentes tipos de gráficas; calcula y explica el significado del rango y la desviación media.');
INSERT INTO `estandares` VALUES ('235', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '1', '4. Actitudes hacia el estudio de las matemáticas', 'Desarrolla un concepto positivo de sí mismo como usuario de las matemáticas, el gusto y la inclinación por comprender y utilizar la notación, el vocabulario y los procesos matemáticos.');
INSERT INTO `estandares` VALUES ('236', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '1', '4. Actitudes hacia el estudio de las matemáticas', 'Aplica el razonamiento matemático a la solución de problemas personales, sociales y naturales, aceptando el principio de que existen diversos procedimientos para resolver los problemas particulares.');
INSERT INTO `estandares` VALUES ('237', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '1', '4. Actitudes hacia el estudio de las matemáticas', 'Desarrolla el hábito del pensamiento racional y utiliza las reglas del debate matemático al formular explicaciones o mostrar soluciones.');
INSERT INTO `estandares` VALUES ('238', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '2', 'Matemáticas', '1', '4. Actitudes hacia el estudio de las matemáticas', 'Comparte e intercambia ideas sobre los procedimientos y resultados al resolver problemas.');
INSERT INTO `estandares` VALUES ('239', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica la unidad y diversidad en los procesos de nutrición, respiración y reproducción, así como su relación con la adaptación y evolución de los seres vivos.');
INSERT INTO `estandares` VALUES ('240', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica la dinámica de los ecosistemas en el proceso de intercambio de materia en las cadenas alimentarias y los ciclos del agua y del carbono.');
INSERT INTO `estandares` VALUES ('241', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica la relación entre los procesos de nutrición y respiración en la obtención de energía para el funcionamiento del cuerpo humano.');
INSERT INTO `estandares` VALUES ('242', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica la importancia de la dieta correcta, el consumo de agua simple potable y de la actividad física para prevenir enfermedades y trastornos asociados con la nutrición.');
INSERT INTO `estandares` VALUES ('243', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica las causas y las medidas de prevención de las enfermedades respiratorias comunes, en particular las asociadas a la contaminación atmosférica y al tabaquismo.');
INSERT INTO `estandares` VALUES ('244', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica cómo se expresa la sexualidad en términos de aspectos afectivos, de género, eróticos y reproductivos a lo largo de la vida y cómo favorecer la salud sexual y reproductiva.');
INSERT INTO `estandares` VALUES ('245', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Describe diferentes tipos de movimiento en términos de su rapidez, velocidad y aceleración.');
INSERT INTO `estandares` VALUES ('246', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Describe características del movimiento ondulatorio con base en el modelo de ondas.');
INSERT INTO `estandares` VALUES ('247', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Relaciona la fuerza con las interacciones mecánicas, electrostáticas y magnéticas, y explica sus efectos a partir de las Leyes de Newton.');
INSERT INTO `estandares` VALUES ('248', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica la relación entre la gravedad y algunos efectos en los cuerpos en la Tierra y en el Sistema Solar.');
INSERT INTO `estandares` VALUES ('249', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Describe algunas propiedades (masa, volumen, densidad y temperatura), así como interacciones relacionadas con el calor, la presión y los cambios de estado, con base en el modelo cinético de partículas.');
INSERT INTO `estandares` VALUES ('250', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Describe la energía a partir de las trasformaciones de la energía mecánica y el principio de conservación en términos de la transferencia de calor.');
INSERT INTO `estandares` VALUES ('251', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica fenómenos eléctricos y magnéticos con base en las características de los componentes del átomo.');
INSERT INTO `estandares` VALUES ('252', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica algunas características de las ondas electromagnéticas y las relaciona con la energía que transportan.');
INSERT INTO `estandares` VALUES ('253', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica explicaciones acerca del origen y evolución del Universo, así como características de sus componentes principales.');
INSERT INTO `estandares` VALUES ('254', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica las propiedades físicas de los materiales, así como la composición y pureza de las mezclas,  compuestos y elementos.');
INSERT INTO `estandares` VALUES ('255', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica los componentes de las mezclas, su clasificación, los cambios de sus propiedades en función de su concentración, así como los métodos de separación.');
INSERT INTO `estandares` VALUES ('256', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica las características del modelo atómico (partículas y sus funciones).');
INSERT INTO `estandares` VALUES ('257', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Explica la organización y la información contenida en la tabla periódica de los elementos, así como la importancia de algunos de ellos para los seres vivos.');
INSERT INTO `estandares` VALUES ('258', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica el aporte calórico de los alimentos y su relación con la cantidad de energía requerida por una persona.');
INSERT INTO `estandares` VALUES ('259', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica las propiedades de los ácidos y las bases, así como las características de las reacciones redox.');
INSERT INTO `estandares` VALUES ('260', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '5', '1. Conocimiento científico', 'Identifica las características del enlace químico y de la reacción química.');
INSERT INTO `estandares` VALUES ('261', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Explica la interrelación de la ciencia y la tecnología en los avances en el conocimiento de los seres vivos, del Universo, la transformación de los materiales, la estructura de la materia, el tratamiento de las enfermedades y del cuidado del ambiente');
INSERT INTO `estandares` VALUES ('262', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Relaciona el conocimiento científico con algunas aplicaciones tecnológicas de uso cotidiano y de importancia social.');
INSERT INTO `estandares` VALUES ('263', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Identifica los beneficios y riesgos de las aplicaciones de la ciencia y la tecnología en la calidad de vida, el cuidado del ambiente, la investigación científica y el desarrollo de la sociedad.');
INSERT INTO `estandares` VALUES ('264', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '4', '2. Aplicaciones del conocimiento científico y de la tecnología', 'Identifica las características de la ciencia y su relación con la tecnología.');
INSERT INTO `estandares` VALUES ('265', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Diseña investigaciones científicas en las que considera el contexto social.');
INSERT INTO `estandares` VALUES ('266', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Aplica habilidades necesarias para la investigación científica: plantea preguntas, identifica temas o problemas, recolecta datos mediante la observación o experimentación, elabora, comprueba o refuta hipótesis, analiza y comunica los resultados y des');
INSERT INTO `estandares` VALUES ('267', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Planea y realiza experimentos que requieren de análisis, control y cuantificación de variables.');
INSERT INTO `estandares` VALUES ('268', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Utiliza instrumentos tecnológicos para ampliar la capacidad de los sentidos y obtener información de los fenómenos naturales con mayor detalle y precisión.');
INSERT INTO `estandares` VALUES ('269', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Realiza interpretaciones, deducciones, conclusiones, predicciones y representaciones de fenómenos y procesos naturales, a partir del análisis de datos y evidencias de una investigación científica, y explica cómo llegó a ellas.');
INSERT INTO `estandares` VALUES ('270', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Desarrolla y aplica modelos para interpretar, describir, explicar o predecir fenómenos y procesos naturales, como una parte esencial del conocimiento científico.');
INSERT INTO `estandares` VALUES ('271', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Aplica habilidades interpersonales necesarias para el trabajo colaborativo, al desarrollar investigaciones científicas.');
INSERT INTO `estandares` VALUES ('272', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '8', '3. Habilidades asociadas a la ciencia', 'Comunica los resultados de sus observaciones e investigaciones usando diversos recursos, entre ellos diagramas, tablas de datos, presentaciones, gráficas y otras formas simbólicas, así como las tecnologías de la comunicación y la información (TIC), y');
INSERT INTO `estandares` VALUES ('273', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Manifiesta un pensamiento científico para investigar y explicar conocimientos sobre el mundo natural en una variedad de contextos.');
INSERT INTO `estandares` VALUES ('274', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Aplica el pensamiento crítico y el escepticismo informado al identificar el conocimiento científico del que no lo es.');
INSERT INTO `estandares` VALUES ('275', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Manifiesta compromiso y toma decisiones en favor de la sustentabilidad del ambiente.');
INSERT INTO `estandares` VALUES ('276', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Manifiesta responsabilidad al tomar decisiones informadas para cuidar su salud.');
INSERT INTO `estandares` VALUES ('277', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Disfruta y aprecia los espacios naturales y disponibles para la recreación y la actividad física.');
INSERT INTO `estandares` VALUES ('278', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Manifiesta disposición para el trabajo colaborativo respetando las diferencias culturales o de género.');
INSERT INTO `estandares` VALUES ('279', '4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria, entre 14 y 15 años de edad (1º, 2º, 3º)', '3', 'Ciencias', '2', '4. Actitudes asociadas a la ciencia', 'Valora la ciencia como proceso social en construcción permanente en el que contribuyen hombres y mujeres de distintas culturas.');

-- ----------------------------
-- Table structure for `mdl_user`
-- ----------------------------
DROP TABLE IF EXISTS `mdl_user`;
CREATE TABLE `mdl_user` (
  `id` int(11) DEFAULT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `cve` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mdl_user
-- ----------------------------
INSERT INTO `mdl_user` VALUES ('4', 'Arturo Rodríguez Guerrero', '', 'c4ca4238a0b923820dcc509a6f75849b');
INSERT INTO `mdl_user` VALUES ('5', 'Laura Aguirre Aguilar', '', 'c81e728d9d4c2f636f067f89cc14862c');
INSERT INTO `mdl_user` VALUES ('6', 'José Fidel García Reyes', '', 'eccbc87e4b5ce2fe28308fd9f2a7baf3');
INSERT INTO `mdl_user` VALUES ('7', 'Martha Leticia Casas Flores', '', 'a87ff679a2f3e71d9181a67b7542122c');
INSERT INTO `mdl_user` VALUES ('8', 'Virginia Mazón', '', 'e4da3b7fbbce2345d7772b0674a318d5');
INSERT INTO `mdl_user` VALUES ('9', 'Héctor Monges Morán', '', '1679091c5a880faf6fb5e6087eb1b2dc');
INSERT INTO `mdl_user` VALUES ('10', 'JokabedZagoya Mellado', '', '8f14e45fceea167a5a36dedd4bea2543');
INSERT INTO `mdl_user` VALUES ('11', 'Pilar Herrera Suárez', '', 'c9f0f895fb98ab9159f51fd0297e236d');
INSERT INTO `mdl_user` VALUES ('12', 'Alejandra Elizalde Trinidad', '', '45c48cce2e2d7fbdea1afc51c7c6ad26');
INSERT INTO `mdl_user` VALUES ('13', 'Janina Cuevas Zúñiga', '', 'd3d9446802a44259755d38e6d163e820');
INSERT INTO `mdl_user` VALUES ('14', 'Sara Vogel', '', '6512bd43d9caa6e02c990b0a82652dca');
INSERT INTO `mdl_user` VALUES ('15', 'Araceli Castillo Macias', '', 'c20ad4d76fe97759aa27a0c99bff6710');
INSERT INTO `mdl_user` VALUES ('16', 'María Esther Padilla Medina', '', 'c51ce410c124a10e0db5e4b97fc2af39');
INSERT INTO `mdl_user` VALUES ('17', 'Catalina Ortega Núñez', '', 'aab3238922bcc25a6f606eb525ffdc56');
INSERT INTO `mdl_user` VALUES ('1', 'Admin', 'user', '202cb962ac59075b964b07152d234b70');
INSERT INTO `mdl_user` VALUES ('18', 'Dalila López ', '', null);

-- ----------------------------
-- Table structure for `nodos`
-- ----------------------------
DROP TABLE IF EXISTS `nodos`;
CREATE TABLE `nodos` (
  `IdNodo` smallint(6) NOT NULL AUTO_INCREMENT,
  `Nodo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IdNodo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of nodos
-- ----------------------------
INSERT INTO `nodos` VALUES ('1', 'Nacional');
INSERT INTO `nodos` VALUES ('2', 'Estatal');
INSERT INTO `nodos` VALUES ('3', 'Regional');
INSERT INTO `nodos` VALUES ('4', 'Escolar');

-- ----------------------------
-- Table structure for `periodos`
-- ----------------------------
DROP TABLE IF EXISTS `periodos`;
CREATE TABLE `periodos` (
  `Id` int(11) DEFAULT NULL,
  `Per_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of periodos
-- ----------------------------
INSERT INTO `periodos` VALUES ('2', 'Segundo periodo escolar, al concluir el tercer grado de primaria');
INSERT INTO `periodos` VALUES ('3', 'Tercer periodo escolar, al concluir el sexto grado de primaria');
INSERT INTO `periodos` VALUES ('4', 'Cuarto periodo escolar, al concluir el tercer grado de secundaria');

-- ----------------------------
-- Table structure for `recursos`
-- ----------------------------
DROP TABLE IF EXISTS `recursos`;
CREATE TABLE `recursos` (
  `IdRecurso` int(11) NOT NULL AUTO_INCREMENT,
  `IdTutoria` int(11) DEFAULT NULL,
  `TipoRecurso` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Hint` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IdRecurso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of recursos
-- ----------------------------
INSERT INTO `recursos` VALUES ('1', '1', 'F', 'QUIÉN DIRIGE A QUIÉN', 'QUIEN_DIRIGE_A_QUIEN.pdf', 'Texto introductorio');
INSERT INTO `recursos` VALUES ('2', '1', 'F', 'Los Robot´s', 'tema1.docx', 'Para identificar que son los robots');
INSERT INTO `recursos` VALUES ('3', '1', 'U', 'máquina y tipos de máquinas', 'http://concurso.cnice.mec.es/cnice2006/material107/maquinas/maq_operadores.htm', null);
INSERT INTO `recursos` VALUES ('4', '1', 'U', 'Sistema mecánico-máquinas ', 'http://st32caren2.blogspot.mx/', null);
INSERT INTO `recursos` VALUES ('5', '1', 'U', 'texto 09 de julio del 2009 que habla de los robot su avance yreto. CNN. ', 'http://www.cnnexpansion.com/actualidad/2009/07/07/robots-hechos-a-imagen-y-semejanza', null);
INSERT INTO `recursos` VALUES ('6', '1', 'U', 'Definición de robot, androide y humanoide', 'http://www.cienciapopular.com/n/Tecnologia/Androides__Humanoides_y_Cyborgs/Androides__Humanoides_y_Cyborgs.php', null);
INSERT INTO `recursos` VALUES ('7', '1', 'U', 'concepto robot, diferencia entre androide, máquina yautomata', 'http://www.monografias.com/trabajos31/robotica/robotica.shtml', null);

-- ----------------------------
-- Table structure for `turnos`
-- ----------------------------
DROP TABLE IF EXISTS `turnos`;
CREATE TABLE `turnos` (
  `IdTurno` tinyint(4) NOT NULL AUTO_INCREMENT,
  `NomTurno` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`IdTurno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of turnos
-- ----------------------------
INSERT INTO `turnos` VALUES ('1', 'Matutino ');
INSERT INTO `turnos` VALUES ('2', 'Vespertino');
INSERT INTO `turnos` VALUES ('3', 'Tiempo Completo');
INSERT INTO `turnos` VALUES ('4', 'Jornada Ampliada');

-- ----------------------------
-- Table structure for `tutorias`
-- ----------------------------
DROP TABLE IF EXISTS `tutorias`;
CREATE TABLE `tutorias` (
  `IdTutoria` int(11) NOT NULL AUTO_INCREMENT,
  `IdTutor` int(11) DEFAULT NULL,
  `IdEstudiante` int(11) DEFAULT NULL,
  `IdTema` int(11) DEFAULT NULL,
  `IdChat` int(11) DEFAULT NULL,
  `IdEtapa` int(1) DEFAULT NULL,
  `path` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IdTutoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tutorias
-- ----------------------------
INSERT INTO `tutorias` VALUES ('1', '22', '23', '1', '3', '1', null);
INSERT INTO `tutorias` VALUES ('2', '11', '8', '2', '5', '1', null);
INSERT INTO `tutorias` VALUES ('3', '24', '26', '1', '6', '1', null);

-- ----------------------------
-- Table structure for `user_kw`
-- ----------------------------
DROP TABLE IF EXISTS `user_kw`;
CREATE TABLE `user_kw` (
  `idtc` int(11) NOT NULL DEFAULT '0',
  `user` int(4) DEFAULT NULL,
  `id_tema` int(4) DEFAULT NULL,
  `temacatalogo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_kw
-- ----------------------------
INSERT INTO `user_kw` VALUES ('0', '11', '48', 'fracciones');
INSERT INTO `user_kw` VALUES ('0', '11', '133', 'fracciones');
INSERT INTO `user_kw` VALUES ('0', '11', '134', 'fracciones');
INSERT INTO `user_kw` VALUES ('0', '11', '136', 'fracciones');

-- ----------------------------
-- Table structure for `user_tc`
-- ----------------------------
DROP TABLE IF EXISTS `user_tc`;
CREATE TABLE `user_tc` (
  `idtc` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(4) DEFAULT NULL,
  `temacatalogo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `kw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idtc`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_tc
-- ----------------------------
INSERT INTO `user_tc` VALUES ('2', '32', 'Aura', null);
INSERT INTO `user_tc` VALUES ('3', '32', 'Balada amarilla', null);
INSERT INTO `user_tc` VALUES ('4', '32', 'El barquito', null);
INSERT INTO `user_tc` VALUES ('5', '32', 'El gato negro', null);
INSERT INTO `user_tc` VALUES ('6', '32', 'El perro atado', null);
INSERT INTO `user_tc` VALUES ('7', '32', 'Escrito con tinta verde', null);
INSERT INTO `user_tc` VALUES ('8', '32', 'La alberca', null);
INSERT INTO `user_tc` VALUES ('9', '32', 'La cabra', null);
INSERT INTO `user_tc` VALUES ('10', '32', 'La distancia a la isla', null);
INSERT INTO `user_tc` VALUES ('11', '32', 'La gallina degollada', null);
INSERT INTO `user_tc` VALUES ('12', '32', 'La región PQR', null);
INSERT INTO `user_tc` VALUES ('13', '32', 'La tumba de Diofanto', null);
INSERT INTO `user_tc` VALUES ('14', '32', 'Las partes cultivables de un terreno', null);
INSERT INTO `user_tc` VALUES ('15', '32', 'Nos han dado la tierra', null);
INSERT INTO `user_tc` VALUES ('16', '32', 'POR ENCIMA DEL MAR, DESDE LA ORILLA AMERICANA DEL ATLÁNTICO', null);
INSERT INTO `user_tc` VALUES ('17', '32', 'Y súbita de pronto', null);
INSERT INTO `user_tc` VALUES ('18', '33', 'Área del cuadrado', null);
INSERT INTO `user_tc` VALUES ('19', '33', 'Diles que no me maten', null);
INSERT INTO `user_tc` VALUES ('20', '33', 'El Segador', null);
INSERT INTO `user_tc` VALUES ('21', '33', 'La historia y el olvido', null);
INSERT INTO `user_tc` VALUES ('22', '33', 'La Muerte tiene permiso', null);
INSERT INTO `user_tc` VALUES ('23', '33', 'Listones para los moños', null);
INSERT INTO `user_tc` VALUES ('24', '33', 'Nos han dado la tierra', null);
INSERT INTO `user_tc` VALUES ('25', '33', 'Tetraedo', null);
INSERT INTO `user_tc` VALUES ('26', '36', '¿Cuántos cubos forman el prisma?', null);
INSERT INTO `user_tc` VALUES ('27', '36', 'Problema con curvas número 1', null);
INSERT INTO `user_tc` VALUES ('28', '36', 'Problema con curvas. Número 2', null);
INSERT INTO `user_tc` VALUES ('29', '36', 'Secuencia 6. Proporcionalidad', null);
INSERT INTO `user_tc` VALUES ('30', '36', 'Sesión 1. Operaciones con números naturales', null);
INSERT INTO `user_tc` VALUES ('31', '36', 'Sesión 2. Fracciones', null);
INSERT INTO `user_tc` VALUES ('32', '36', 'Sesión 3. Proporcionalidad', null);
INSERT INTO `user_tc` VALUES ('33', '36', 'Sesión 4. Geometría', null);
INSERT INTO `user_tc` VALUES ('57', '31', 'La botella con tápón', '');
INSERT INTO `user_tc` VALUES ('56', '31', 'Las lúnulas', '');
INSERT INTO `user_tc` VALUES ('55', '31', 'Perímetro de un triángulo', '');
INSERT INTO `user_tc` VALUES ('38', '40', 'El Cultivo Fracciones', null);
INSERT INTO `user_tc` VALUES ('39', '40', 'Nos han dado la tierra', null);
INSERT INTO `user_tc` VALUES ('40', '41', 'Ecuaciones', null);
INSERT INTO `user_tc` VALUES ('41', '41', 'El cuento', null);
INSERT INTO `user_tc` VALUES ('42', '41', 'Novela', null);
INSERT INTO `user_tc` VALUES ('43', '41', 'Poesía', null);
INSERT INTO `user_tc` VALUES ('44', '41', 'Proporcionalidad', null);
INSERT INTO `user_tc` VALUES ('45', '27', 'el grillo', 'poesia');
INSERT INTO `user_tc` VALUES ('46', '31', 'La Tona', null);
INSERT INTO `user_tc` VALUES ('47', '31', 'El aplastamiento de las gotas', null);
INSERT INTO `user_tc` VALUES ('48', '31', 'El epitafio de Diofanto', null);
INSERT INTO `user_tc` VALUES ('53', '31', 'El bikini', '');
INSERT INTO `user_tc` VALUES ('54', '31', 'Cancha de basquetbol', '');
INSERT INTO `user_tc` VALUES ('50', '37', 'Nos han dado la tierra', 'cuento, revolución mexicana, latifundio, reparto de tierras');
INSERT INTO `user_tc` VALUES ('58', '31', 'De volúmenes y áreas', '');
INSERT INTO `user_tc` VALUES ('59', '31', 'Sesión 1. Operaciones con números naturales', '');
INSERT INTO `user_tc` VALUES ('60', '31', 'Sesión 2. Fracciones', '');
INSERT INTO `user_tc` VALUES ('61', '31', 'Sesión 3. Proporcionalidad', '');
INSERT INTO `user_tc` VALUES ('62', '31', 'Sesión 4. Geometría', '');
INSERT INTO `user_tc` VALUES ('63', '32', 'Angulos', 'Angulos');
INSERT INTO `user_tc` VALUES ('66', '22', 'tema1', '');
INSERT INTO `user_tc` VALUES ('67', '22', 'tema2', '');

-- ----------------------------
-- Table structure for `user_tema`
-- ----------------------------
DROP TABLE IF EXISTS `user_tema`;
CREATE TABLE `user_tema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(4) NOT NULL,
  `id_tema` int(4) NOT NULL,
  `id_tc` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_tema
-- ----------------------------
INSERT INTO `user_tema` VALUES ('1', '31', '177', '46');
INSERT INTO `user_tema` VALUES ('87', '36', '228', '27');
INSERT INTO `user_tema` VALUES ('89', '36', '137', '26');
INSERT INTO `user_tema` VALUES ('90', '36', '228', '28');
INSERT INTO `user_tema` VALUES ('91', '36', '135', '30');
INSERT INTO `user_tema` VALUES ('92', '36', '136', '31');
INSERT INTO `user_tema` VALUES ('93', '36', '142', '32');
INSERT INTO `user_tema` VALUES ('94', '36', '137', '33');
INSERT INTO `user_tema` VALUES ('95', '40', '136', '38');
INSERT INTO `user_tema` VALUES ('96', '40', '133', '38');
INSERT INTO `user_tema` VALUES ('97', '40', '146', '38');
INSERT INTO `user_tema` VALUES ('98', '40', '144', '38');
INSERT INTO `user_tema` VALUES ('99', '40', '147', '38');
INSERT INTO `user_tema` VALUES ('100', '40', '211', '39');
INSERT INTO `user_tema` VALUES ('101', '40', '178', '39');
INSERT INTO `user_tema` VALUES ('102', '40', '180', '39');
INSERT INTO `user_tema` VALUES ('103', '40', '181', '39');
INSERT INTO `user_tema` VALUES ('104', '40', '186', '39');
INSERT INTO `user_tema` VALUES ('105', '40', '189', '39');
INSERT INTO `user_tema` VALUES ('106', '40', '193', '39');
INSERT INTO `user_tema` VALUES ('107', '36', '231', '29');
INSERT INTO `user_tema` VALUES ('114', '33', '180', '22');
INSERT INTO `user_tema` VALUES ('115', '33', '180', '24');
INSERT INTO `user_tema` VALUES ('116', '33', '142', '23');
INSERT INTO `user_tema` VALUES ('117', '33', '137', '25');
INSERT INTO `user_tema` VALUES ('118', '33', '51', '18');
INSERT INTO `user_tema` VALUES ('120', '33', '180', '21');
INSERT INTO `user_tema` VALUES ('121', '33', '89', '20');
INSERT INTO `user_tema` VALUES ('122', '33', '177', '19');
INSERT INTO `user_tema` VALUES ('123', '33', '180', '19');
INSERT INTO `user_tema` VALUES ('124', '33', '177', '22');
INSERT INTO `user_tema` VALUES ('125', '41', '181', '41');
INSERT INTO `user_tema` VALUES ('126', '41', '180', '41');
INSERT INTO `user_tema` VALUES ('127', '41', '208', '41');
INSERT INTO `user_tema` VALUES ('128', '41', '185', '41');
INSERT INTO `user_tema` VALUES ('129', '41', '209', '43');
INSERT INTO `user_tema` VALUES ('130', '41', '211', '43');
INSERT INTO `user_tema` VALUES ('131', '41', '180', '43');
INSERT INTO `user_tema` VALUES ('132', '41', '181', '43');
INSERT INTO `user_tema` VALUES ('133', '41', '188', '43');
INSERT INTO `user_tema` VALUES ('134', '41', '185', '42');
INSERT INTO `user_tema` VALUES ('135', '41', '188', '42');
INSERT INTO `user_tema` VALUES ('136', '41', '180', '42');
INSERT INTO `user_tema` VALUES ('137', '41', '181', '42');
INSERT INTO `user_tema` VALUES ('138', '41', '199', '42');
INSERT INTO `user_tema` VALUES ('139', '41', '198', '42');
INSERT INTO `user_tema` VALUES ('140', '41', '223', '40');
INSERT INTO `user_tema` VALUES ('141', '41', '224', '40');
INSERT INTO `user_tema` VALUES ('142', '41', '142', '44');
INSERT INTO `user_tema` VALUES ('143', '32', '180', '7');
INSERT INTO `user_tema` VALUES ('144', '32', '226', '4');
INSERT INTO `user_tema` VALUES ('145', '32', '180', '3');
INSERT INTO `user_tema` VALUES ('146', '32', '180', '5');
INSERT INTO `user_tema` VALUES ('147', '32', '181', '17');
INSERT INTO `user_tema` VALUES ('148', '32', '181', '11');
INSERT INTO `user_tema` VALUES ('149', '32', '181', '16');
INSERT INTO `user_tema` VALUES ('150', '32', '85', '1');
INSERT INTO `user_tema` VALUES ('151', '32', '224', '13');
INSERT INTO `user_tema` VALUES ('152', '32', '136', '14');
INSERT INTO `user_tema` VALUES ('153', '32', '228', '12');
INSERT INTO `user_tema` VALUES ('154', '32', '228', '8');
INSERT INTO `user_tema` VALUES ('155', '32', '226', '6');
INSERT INTO `user_tema` VALUES ('156', '32', '230', '10');
INSERT INTO `user_tema` VALUES ('157', '32', '180', '15');
INSERT INTO `user_tema` VALUES ('158', '32', '181', '2');
INSERT INTO `user_tema` VALUES ('159', '32', '88', '9');
INSERT INTO `user_tema` VALUES ('160', '27', '36', '45');
INSERT INTO `user_tema` VALUES ('161', '27', '37', '45');
INSERT INTO `user_tema` VALUES ('165', '27', '31', '45');
INSERT INTO `user_tema` VALUES ('168', '27', '35', '45');
INSERT INTO `user_tema` VALUES ('169', '27', '51', '45');
INSERT INTO `user_tema` VALUES ('170', '27', '68', '45');
INSERT INTO `user_tema` VALUES ('171', '37', '220', '49');
INSERT INTO `user_tema` VALUES ('172', '37', '221', '49');
INSERT INTO `user_tema` VALUES ('174', '31', '123', '47');
INSERT INTO `user_tema` VALUES ('175', '31', '221', '48');
INSERT INTO `user_tema` VALUES ('176', '31', '221', '57');
INSERT INTO `user_tema` VALUES ('177', '31', '228', '56');
INSERT INTO `user_tema` VALUES ('178', '31', '221', '55');
INSERT INTO `user_tema` VALUES ('179', '31', '229', '53');
INSERT INTO `user_tema` VALUES ('180', '31', '221', '54');
INSERT INTO `user_tema` VALUES ('181', '31', '228', '58');
INSERT INTO `user_tema` VALUES ('182', '31', '135', '59');
INSERT INTO `user_tema` VALUES ('183', '31', '134', '60');
INSERT INTO `user_tema` VALUES ('184', '31', '136', '61');
INSERT INTO `user_tema` VALUES ('185', '31', '140', '62');
INSERT INTO `user_tema` VALUES ('186', '22', '125', '66');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) DEFAULT NULL,
  `IdUser` varchar(255) DEFAULT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellidos` varchar(40) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `Id_Entidad` int(11) DEFAULT NULL,
  `Id_Mun` int(11) DEFAULT NULL,
  `Id_Localidad` int(11) DEFAULT NULL,
  `Nodo` varchar(255) DEFAULT NULL,
  `urlImg` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `CCT` varchar(255) DEFAULT NULL,
  `Turno` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('8', 'Oscar', 'Oscar', 'Gonzalez Valencia', 'H', '9', null, null, '4', 'img/users/oscar.gif', 'oscarinfomx@gmail.com', null, '12345', null, null);
INSERT INTO `users` VALUES ('9', 'Pili', 'Pilar', 'Herrea', 'M', '9', null, null, '4', 'img/users/pili.gif', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('11', 'lorddive', 'Gilberto', 'López', 'H', '9', null, null, '4', 'img/users/gilberto.gif', 'lord@sep.gob.mx', null, '12345', null, null);
INSERT INTO `users` VALUES ('22', 'AlmaQ', 'Alma', 'Cuervo', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('23', 'Naye', 'Nayeli', null, 'M', '9', null, null, '4', 'img/users/LadyGreen.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('24', 'jprosete', 'Juan Pedro', 'Rosete Valencia', 'H', '15', null, null, '1', 'img/users/BoyBlue.png', 'jprosete@hotmail.com', '2431039789', 'santis54321', 'SEB', '1');
INSERT INTO `users` VALUES ('26', 'FIGAR', 'Jose Fidel', 'Garcia Reyes', 'H', '3', null, null, '1', 'img/users/Boy.png', 'figar99@hotmail.com', '2224265209', '250478_fg', 'SEB', '1');
INSERT INTO `users` VALUES ('30', 'Arturo ', 'Arturo ', 'Rodríguez Guerrero', 'H', '9', null, null, '4', 'img/users/BoyBlue.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('31', 'Laura ', 'Laura ', 'Aguirre Aguilar', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('33', 'Martiux', 'Martha ', 'Leticia Casas Flores', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('34', 'Virginia ', 'Virginia ', 'Mazón', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('35', 'Héctor ', 'Héctor ', 'Monges Morán', 'H', '9', null, null, '4', 'img/users/BoyBlue.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('36', 'Jokabed ', 'Jokabed ', 'Zagoya Mellado', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('37', 'Pilar ', 'Pilar ', 'Herrera Suárez', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('38', 'Alejandra ', 'Alejandra ', 'Elizalde Trinidad', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('39', 'Janina ', 'Janina ', 'Cuevas Zúñiga', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('40', 'Sara ', 'Sara ', 'Vogel', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('41', 'Araceli ', 'Araceli ', 'Castillo Macias', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('42', 'María Esther ', 'María Esther ', 'Padilla Medina', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('43', 'Catalina ', 'Catalina ', 'Ortega Núñez', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
INSERT INTO `users` VALUES ('44', 'Dalila  ', 'Dalila  ', 'López', 'M', '9', null, null, '4', 'img/users/LadyPnk.png', null, null, '12345', null, null);
