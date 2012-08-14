START TRANSACTION;

USE `Tutorias`;

DELETE FROM `entidades` WHERE `idEntidad` = 0;
	

INSERT INTO `entidades` (`idEntidad`, `nombre`) VALUES

(2, 'Baja California'),

(3, 'Baja California Sur'),

(4, 'Campeche'),

(5, 'Coahuila'),

(6, 'Colima'),

(7, 'Chiapas'),

(8, 'Chihuahua'),

(9, 'Distrito Federal'),

(10, 'Durango'),

(11, 'Guanajuato'),

(12, 'Guerrero'),

(13, 'Hidalgo'),

(14, 'Jalisco'),

(15, 'México'),

(16, 'Michoacán'),

(17, 'Morelos'),

(18, 'Nayarit'),

(19, 'Nuevo León'),

(20, 'Oaxaca'),

(21, 'Puebla'),

(22, 'Querétaro'),

(23, 'Quintana Roo'),

(24, 'San Luis Potosí'),

(25, 'Sinaloa'),

(26, 'Sonora'),

(27, 'Tabasco'),

(28, 'Tamaulipas'),

(29, 'Tlaxcala'),

(30, 'Veracruz '),

(31, 'Yucatán'),

(32, 'Zacatecas');




INSERT INTO `temas` (`idTema`, `nombre`, `idPeriodo`, `idAsignatura`, `idEstandar`) VALUES

(2,"Infiere el contenido de un texto a partir de índices, encabezados, títulos y subtítulos.",2,1,11),

(3,"Comprende la trama o los argumentos expuestos en los textos.",2,1,11),

(4,"Identifica las características generales de los textos literarios, informativos y narrativos, considerando su distribución gráfica y su función comunicativa.",2,1,11),

(5,"Distingue elementos de la realidad y de la fantasía en textos literarios.",2,1,11),

(6,"Identifica los textos adecuados y los fragmentos específicos para obtener, corroborar o contrastar información sobre un tema determinado.",2,1,11),

(7,"Plantea preguntas para guiar la búsqueda de información e identifica fragmentos del texto para responder a éstas.",2,1,11),

(8,"Investiga, selecciona y organiza información para comunicar a otros, acerca de diversos temas.",2,1,11),

(9,"Lee una variedad de textos literarios y distingue algunas diferencias: poesía, obras de teatro, novelas y cuentos cortos.",2,1,11),

(10,"Desarrolla criterios personales para la elección o recomendación de un texto de su preferencia.",2,1,11),

(11,"Muestra fluidez al leer en voz alta.",2,1,11),

(12,"Interpreta adecuadamente, de manera cercana a la convencional, los signos de puntuación en la lectura: punto, coma, signos de exclamación, signos de interrogación, guión y tilde.",2,1,11),

(13,"Emplea la escritura para comunicar sus ideas y organizar información sobre temas diversos de manera autónoma.",2,1,12),

(14,"Entiende que los diferentes tipos de texto requieren formas particulares de escritura, por lo que adapta sus producciones al tipo de texto que elabora.",2,1,12),

(15,"Recupera información de diferentes fuentes y las emplea para desarrollar argumentos al redactar un texto.",2,1,12),

(16,"Realiza las adaptaciones necesarias al lenguaje oral para producir textos escritos.",2,1,12),

(17,"Ordena las oraciones de un texto escrito de manera coherente.",2,1,12),

(18,"Considera al destinatario al producir sus textos.",2,1,12),

(19,"Valora la importancia de la revisión y corrección para mejorar los textos producidos y lograr su comprensión.",2,1,12),

(20,"Describe un proceso, un fenómeno o una situación en orden cronológico.",2,1,12),

(21,"Establece relaciones de causa y efecto al describir, narrar o explicar una serie de eventos en un texto.",2,1,12),

(22,"Emplea convencionalmente el uso de mayúsculas y la puntuación.",2,1,12),

(23,"Emplea juegos del lenguaje para introducir elementos de humor en textos escritos con dicho propósito.",2,1,12),

(24,"Completa formularios para realizar diversos trámites (préstamo bibliotecario, permisos de salida, entre otros).",2,1,12),

(25,"Comunica sus ideas y escucha a sus compañeros con atención, y respeta turnos al hablar.",2,1,10),

(26,"Expone información de manera oral y considera la que otros le proporcionan para enriquecer su conocimiento.",2,1,10),

(27,"Comprende la importancia de comunicarse eficientemente al exponer sus ideas, argumentos y presentar información.",2,1,10),

(28,"Presenta información atendiendo al orden de exposición o secuencia del discurso.",2,1,10),

(29,"Describe de forma oral situaciones, personas, objetos, lugares, acontecimientos y escenarios simples de manera efectiva.",2,1,10),

(30,"Sostiene una conversación en la que explica y argumenta sus preferencias o puntos de vista.",2,1,10),

(31,"Utiliza la lectura y la escritura con fines específicos dentro y fuera de la escuela.",2,1,6),

(32,"Conoce y aplica las convenciones ortográficas al escribir palabras con dígrafos y sílabas complejas.",2,1,6),

(33,"Conoce el uso de las letras mayúsculas al escribir nombres propios, e identifica los párrafos a partir de marcadores textuales, como mayúsculas y punto final.",2,1,6),

(34,"Comprende la función de los textos instructivos al seguir instrucciones para resolver tareas cotidianas.",2,1,6),

(35,"Identifica pistas para precisar la ortografía de palabras de una misma familia léxica, con ayuda del docente.",2,1,6),

(36,"Emplea el orden alfabético en índices y diccionarios para localizar información.",2,1,6),

(37,"Introduce la puntuación adecuada (puntos y comas) para delimitar oraciones o elementos de un listado.",2,1,6),

(38,"Emplea diccionarios para verificar la ortografía de una palabra.",2,1,6),

(39,"Identifica y comparte su gusto por algunos temas, autores y géneros literarios.",2,1,3),

(40,"Desarrolla disposición por leer, escribir, hablar o escuchar.",2,1,3),

(41,"Desarrolla una actitud positiva para seguir aprendiendo por medio del lenguaje escrito.",2,1,3),

(42,"Emplea el lenguaje para expresar ideas, emociones y argumentos.",2,1,3),

(43,"Reconoce y valora las ventajas de hablar más de un idioma para comunicarse con otros, interactuar con los textos y acceder a información.",2,1,3),

(44,"Reconoce y valora la existencia de otras lenguas que se hablan en México.",2,1,3),

(45,"Trabaja colaborativamente, escucha y proporciona sus ideas, negocia y toma acuerdos al trabajar en grupo.",2,1,3),

(46,"Desarrolla un concepto positivo de sí mismo como lector, escritor, hablante u oyente; además, desarrolla gusto por leer, escribir, hablar y escuchar.",2,1,3),

(47,"Lee, escribe y compara números naturales de hasta cuatro cifras.",2,2,13),

(48,"Resuelve problemas de reparto en los que el resultado es una fracción de la forma m/2n.",2,2,13),

(49,"Resuelve problemas que impliquen sumar o restar números naturales, utilizando los algoritmos convencionales.",2,2,13),

(50,"Resuelve problemas que impliquen multiplicar o dividir números naturales, utilizando procedimientos informales.",2,2,13),

(51,"Figuras y cuerpos geométricos.",2,2,7),

(52,"Mide y compara longitudes utilizando unidades no convencionales y algunas convencionales comunes (m, cm).",2,2,7),

(53,"Desarrolla un concepto positivo de sí mismo como usuario de las matemáticas, el gusto y la inclinación por comprender y utilizar la notación, el vocabulario y los procesos matemáticos.",2,2,1),

(54,"Aplica el razonamiento matemático a la solución de problemas personales, sociales y naturales, aceptando el principio de que existen diversos procedimientos para resolver los problemas particulares.",2,2,1),

(55,"Desarrolla el hábito del pensamiento racional y utiliza las reglas del debate matemático al formular explicaciones o mostrar soluciones.",2,2,1),

(56,"Comparte e intercambia ideas sobre los procedimientos y resultados al resolver problemas.",2,2,1),

(57,"Identifica las características físicas personales y las de otros, así como aquellas que son heredadas.",2,3,5),

(58,"Comprende las relaciones entre plantas y animales y el lugar donde viven en términos de su nutrición y respiración.",2,3,5),

(59,"Identifica algunas partes del cuerpo humano y funciones asociadas con el movimiento, la nutrición y su relación con el entorno, así como las necesidades nutrimentales básicas.",2,3,5),

(60,"Describe cambios en el desarrollo y crecimiento de los seres vivos, incluido el ser humano.",2,3,5),

(61,"Identifica cambios en fenómenos naturales ?como estados físicos en función de la temperatura?, la sucesión del día y la noche, y las fases de la Luna.",2,3,5),

(62,"Identifica las principales características de la naturaleza y su transformación al satisfacer las necesidades del ser humano.",2,3,5),

(63,"Describe efectos de la interacción de objetos relacionados con la aplicación de fuerzas, el magnetismo y el sonido.",2,3,5),

(64,"Identifica algunas características de los materiales y las mezclas.",2,3,5),

(65,"Describe algunas características del Sol, las estrellas y la Luna, así como los movimientos de la Tierra y la Luna.",2,3,5),

(66,"Relaciona las fuerzas, el magnetismo, la electricidad, la luz, el calor y el sonido con su aplicación en diversos aparatos de uso cotidiano.",2,3,4),

(67,"Relaciona las características de los materiales con las formas en que se pueden utilizar.",2,3,4),

(68,"Identifica las implicaciones de las acciones cotidianas en el medio natural y algunas medidas de prevención.",2,3,4),

(69,"Identifica algunas acciones para el cuidado de la salud con base en el conocimiento del cuerpo y la nutrición.",2,3,4),

(70,"Planea y lleva a cabo una investigación en el medio local, con un propósito definido.",2,3,8),

(71,"Aplica habilidades necesarias para la investigación científica: identifica problemas, plantea preguntas, realiza experimentos, recaba datos, realiza y registra observaciones de campo, resuelve preguntas y comunica resultados.",2,3,8),

(72,"Elabora conclusiones con base en la evidencia disponible.",2,3,8),

(73,"Aplica el conocimiento de los materiales para diseñar, construir y evaluar un dispositivo o un modelo.",2,3,8),

(74,"Comunica los resultados de observaciones y experimentos utilizando diversos recursos, por ejemplo: esquemas, dibujos y otras formas simbólicas.",2,3,8),

(75,"Expresa curiosidad acerca de los fenómenos y procesos naturales en una variedad de contextos, y comparte e intercambia ideas al respecto.",2,3,2),

(76,"Manifiesta responsabilidad al tomar decisiones informadas para cuidar su salud.",2,3,2),

(77,"Disfruta y aprecia los espacios naturales y disponibles para la recreación y la actividad física.",2,3,2),

(78,"Muestra disposición y toma decisiones en favor del cuidado del ambiente.",2,3,2),

(79,"Valora y respeta las diferentes formas de vida.",2,3,2),

(80,"Muestra compromiso con la idea de interdependencia de los seres humanos con la naturaleza y la necesidad de cuidar la riqueza natural.",2,3,2),

(81,"Muestra disposición para el trabajo colaborativo y respeta las diferencias culturales y de género.",2,3,2),

(82,"Identifica y usa información específica de un texto para resolver problemas concretos.",3,1,11),

(83,"Formula preguntas precisas para guiar su búsqueda de información.",3,1,11),

(84,"Comprende los aspectos centrales de un texto (tema, eventos, trama y personajes involucrados).",3,1,11),

(85,"Identifica el orden y establece relaciones de causa y efecto en la trama de una variedad de tipos textuales.",3,1,11),

(86,"Infiere información en un texto para recuperar aquella que no se explicita.",3,1,11),

(87,"Lee y comprende una variedad de textos de mediana dificultad y puede notar contradicciones, semejanzas y diferencias entre los que abordan un mismo tema.",3,1,11),

(88,"Identifica las ideas principales de un texto y selecciona información para resolver necesidades específicas y sustentar sus argumentos.",3,1,11),

(89,"Comprende el lenguaje figurado y es capaz de identificarlo en diversos géneros: cuento, novela, teatro y poesía.",3,1,11),

(90,"Identifica las características de los textos descriptivos, narrativos, informativos y explicativos, a partir de su distribución gráfica y su función comunicativa, y adapta su lectura a las características del mismo.",3,1,11),

(91,"Emplea la cita textual para explicar y argumentar sus propias ideas.",3,1,11),

(92,"Interpreta la información contenida en cuadros y tablas.",3,1,11),

(93,"Selecciona datos presentados en dos fuentes distintas y los integra en un texto.",3,1,11),

(94,"Diferencia entre hechos y opiniones al leer diferentes tipos de textos.",3,1,11),

(95,"Sintetiza información sin perder el sentido central del texto.",3,1,11),

(96,"Identifica y emplea la función de los signos de puntuación al leer: punto, coma, dos puntos, punto y coma, signos de exclamación, signos de interrogación y acentuación.",3,1,11),

(97,"Comunica por escrito conocimientos e ideas de manera clara, estableciendo el orden de los mismos, y explicitando las relaciones de causa y efecto al redactar.",3,1,12),

(98,"Escribe una variedad de textos para una audiencia específica con diferentes propósitos comunicativos.",3,1,12),

(99,"Distingue entre lenguaje formal e informal, y los usa adecuadamente al escribir diferentes tipos de textos.",3,1,12),

(100,"Produce un texto de forma autónoma, conceptualmente correcto, a partir de la información provista por dos o tres fuentes.",3,1,12),

(101,"Describe y explica por escrito fenómenos diversos usando un estilo impersonal.",3,1,12),

(102,"Organiza su escritura en párrafos estructurados, usando la puntuación de manera convencional.",3,1,12),

(103,"Emplea diversos recursos lingüísticos y literarios en oraciones, y los usa al redactar.",3,1,12),

(104,"Recupera ideas centrales al tomar notas en la revisión de materiales escritos o de una exposición oral de temas estudiados previamente.",3,1,12),

(105,"Realiza correcciones a sus producciones con el fin de garantizar el propósito comunicativo y su comprensión por otros lectores.",3,1,12),

(106,"Emplea ortografía convencional al escribir.",3,1,12),

(107,"Utiliza diversas fuentes de consulta para hacer correcciones ortográficas (diccionarios, glosarios y derivación léxica en diversos materiales).",3,1,12),

(108,"Distingue el estilo, registro y tono de acuerdo con el contexto, la audiencia y las necesidades.",3,1,10),

(109,"Expone, de manera oral, conocimientos, ideas y sentimientos.",3,1,10),

(110,"Emplea el conocimiento que tiene sobre un tema para tomar decisiones y expresar su opinión fundamentada.",3,1,10),

(111,"Escucha y aporta sus ideas de manera crítica.",3,1,10),

(112,"Emplea diferentes estrategias para persuadir de manera oral a una audiencia.",3,1,10),

(113,"Identifica diferentes formas de criticar de manera constructiva y de responder a la crítica.",3,1,10),

(114,"Toma notas de una exposición oral.",3,1,10),

(115,"Usa la discusión para explorar ideas y temas.",3,1,10),

(116,"Usa convencionalmente signos de interrogación y admiración, guiones para introducir diálogos, así como puntos y comas en sus escritos.",3,1,6),

(117,"Emplea mayúsculas al inicio de párrafo y después de punto.",3,1,6),

(118,"Usa palabras de la misma familia léxica para hacer correcciones a su ortografía.",3,1,6),

(119,"Reflexiona consistentemente acerca del funcionamiento de la ortografía y la puntuación en los textos.",3,1,6),

(120,"Identifica las características y la función de diferentes tipos textuales.",3,1,6),

(121,"Identifica información y sus fuentes para responder a preguntas específicas.",3,1,6),

(122,"Incluye citas textuales y referencias bibliográficas en sus textos.",3,1,6),

(123,"Identifica y comparte su gusto por algunos temas, autores y géneros literarios.",3,1,3),

(124,"Desarrolla disposición por leer, escribir, hablar o escuchar.",3,1,3),

(125,"Desarrolla una actitud positiva para seguir aprendiendo por medio del lenguaje escrito.",3,1,3),

(126,"Emplea el lenguaje para expresar ideas, emociones y argumentos.",3,1,3),

(127,"Discute sobre una variedad de temas de manera atenta y respeta los puntos de vista de otros.",3,1,3),

(128,"Amplía su conocimiento sobre obras literarias y comienza a identificar sus preferencias al respecto.",3,1,3),

(129,"Reconoce y valora las ventajas y desventajas de hablar más de un idioma para comunicarse con otros, interactuar con los textos y acceder a información.",3,1,3),

(130,"Reconoce y valora la existencia de otras lenguas que se hablan en México.",3,1,3),

(131,"Trabaja colaborativamente, escucha y proporciona sus ideas, negocia y toma acuerdos al trabajar en grupo.",3,1,3),

(132,"Desarrolla un concepto positivo de sí mismo, como lector, escritor, hablante u oyente; además, desarrolla gusto por leer, escribir, hablar y escuchar.",3,1,3),

(133,"Lee, escribe y compara números naturales, fraccionarios y decimales.",3,2,13),

(134,"Resuelve problemas aditivos con números fraccionarios o decimales, usando los algoritmos convencionales.",3,2,13),

(135,"Resuelve problemas que implican multiplicar o dividir números naturales, usando los algoritmos convencionales.",3,2,13),

(136,"Resuelve problemas que implican multiplicar o dividir números fraccionarios o decimales entre números naturales, utilizando los algoritmos convencionales.",3,2,13),

(137,"Explica las características de diferentes tipos de rectas, ángulos, polígonos y cuerpos geométricos.",3,2,7),

(138,"Utiliza sistemas de referencia convencionales para ubicar puntos o describir su ubicación en planos, mapas y en el primer cuadrante del plano cartesiano.",3,2,7),

(139,"Establece relaciones entre las unidades del Sistema Internacional de Medidas, las unidades del Sistema Inglés, y las unidades de ambos sistemas.",3,2,7),

(140,"Usa fórmulas para calcular perímetros y áreas de triángulos y cuadriláteros.",3,2,7),

(141,"Utiliza y relaciona unidades de tiempo (milenios, siglos, décadas, años, meses, semanas, días, horas y minutos) para establecer la duración de diversos sucesos.",3,2,7),

(142,"Calcula porcentajes y utiliza esta herramienta para la resolución de otros problemas, como la comparación de razones.",3,2,9),

(143,"Resuelve problemas al utilizar la información representada en tablas, pictogramas o gráficas de barras, e identifica las medidas de tendencia central de un conjunto de datos.",3,2,9),

(144,"Desarrolla un concepto positivo de sí mismo como usuario de las matemáticas, así como el gusto y la inclinación por comprender y utilizar la notación, el vocabulario y los procesos matemáticos.",3,2,1),

(145,"Aplica el razonamiento matemático para solucionar problemas personales, sociales y naturales, al aceptar el principio de que existen diversos procedimientos para resolver los problemas particulares.",3,2,1),

(146,"Desarrolla el hábito del pensamiento racional y utiliza las reglas del debate matemático al formular explicaciones o mostrar soluciones.",3,2,1),

(147,"Comparte e intercambia ideas sobre los procedimientos y resultados al resolver problemas.",3,2,1),

(148,"Explica el funcionamiento integral del cuerpo humano a partir de la interrelación de los sistemas que lo conforman, e identifica causas que afectan la salud.",3,3,5),

(149,"Describe los principales cambios en la pubertad, así como el proceso de reproducción y su relación con la herencia.",3,3,5),

(150,"Identifica las características de una dieta correcta y su relación con el funcionamiento del cuerpo humano.",3,3,5),

(151,"Reconoce la diversidad de los seres vivos, incluidos hongos y bacterias, en términos de la nutrición y la reproducción.",3,3,5),

(152,"Explica los conceptos de biodiversidad, ecosistema, cadenas alimentarias y ambiente.",3,3,5),

(153,"Explica la importancia de la evidencia fósil para el conocimiento del desarrollo de la vida a lo largo del tiempo y los cambios en el ambiente.",3,3,5),

(154,"Identifica algunas causas y consecuencias del deterioro de los ecosistemas, así como del calentamiento global.",3,3,5),

(155,"Identifica las transformaciones temporales y permanentes en procesos del entorno y en fenómenos naturales, así como algunas de las causas que las producen.",3,3,5),

(156,"Identifica algunos efectos de la interacción de objetos relacionados con la fuerza, el movimiento, la luz, el sonido, la electricidad y el calor.",3,3,5),

(157,"Identifica algunas manifestaciones y transformaciones de la energía.",3,3,5),

(158,"Describe la formación de eclipses y algunas características del Sistema Solar y del Universo.",3,3,5),

(159,"Explica algunas causas que afectan el funcionamiento del cuerpo humano y la importancia de desarrollar estilos de vida saludables.",3,3,4),

(160,"Identifica la contribución de la ciencia y la tecnología en la investigación, la atención de la salud y el cuidado del ambiente.",3,3,4),

(161,"Identifica el aprovechamiento de dispositivos ópticos y eléctricos, máquinas simples, materiales y la conservación de alimentos, en las actividades humanas y en la satisfacción de necesidades.",3,3,4),

(162,"Identifica ventajas y desventajas de las formas actuales para obtener y aprovechar la energía térmica y eléctrica, así como la importancia de desarrollar alternativas orientadas al desarrollo sustentable.",3,3,4),

(163,"Realiza y registra observaciones de campo y analiza esta información como parte de una investigación científica.",3,3,8),

(164,"Aplica habilidades necesarias para la investigación científica: responde preguntas o identifica problemas, revisa resultados, registra datos de observaciones y experimentos, construye, aprueba o rechaza hipótesis, desarrolla explicaciones y comunica",3,3,8),

(165,"Planifica y lleva a cabo experimentos que involucran el manejo de variables.",3,3,8),

(166,"Explica cómo las conclusiones de una investigación científica son consistentes con los datos y las evidencias.",3,3,8),

(167,"Diseña, construye y evalúa dispositivos o modelos aplicando los conocimientos necesarios y las propiedades de los materiales.",3,3,8),

(168,"Comunica los resultados de observaciones e investigaciones usando diversos recursos, que incluyan formas simbólicas como esquemas, gráficas y exposiciones, además de las tecnologías de la comunicación y la información.",3,3,8),

(169,"Expresa curiosidad acerca de los fenómenos y procesos naturales en una variedad de contextos, y comparte e intercambia ideas al respecto.",3,3,2),

(170,"Valora el conocimiento científico y sus enfoques para investigar y explicar los fenómenos y procesos naturales.",3,3,2),

(171,"Manifiesta disposición y toma decisiones en favor del cuidado del ambiente.",3,3,2),

(172,"Valora y respeta las diferentes formas de vida.",3,3,2),

(173,"Manifiesta compromiso con la idea de la interdependencia de los humanos con la naturaleza y la necesidad de cuidar la riqueza natural.",3,3,2),

(174,"Manifiesta responsabilidad al tomar decisiones informadas para cuidar su salud.",3,3,2),

(175,"Disfruta y aprecia los espacios naturales disponibles para la recreación y la actividad física.",3,3,2),

(176,"Muestra disposición para el trabajo colaborativo y respeta las diferencias culturales y de género.",3,3,2),

(177,"Emplea la lectura como herramienta para seguir aprendiendo y comprender su entorno.",4,1,11),

(178,"Selecciona de manera adecuada las fuentes de consulta de acuerdo con sus propósitos y temas de interés.",4,1,11),

(179,"Analiza críticamente la información que se difunde por medio de la prensa escrita, comparando y contrastando las formas en que una misma noticia se presenta en diferentes medios de comunicación.",4,1,11),

(180,"Reconoce la importancia de releer un texto para interpretar su contenido.",4,1,11),

(181,"Identifica la estructura y los rasgos estilísticos de poemas, novelas, obras de teatro y autobiografías.",4,1,11),

(182,"Analiza los mensajes publicitarios para exponer de forma crítica los efectos en los consumidores.",4,1,11),

(183,"Utiliza la información de artículos de opinión para ampliar sus conocimientos y formar un punto de vista propio.",4,1,11),

(184,"Emplea adecuadamente al leer las formas comunes de puntuación: punto, coma, dos puntos, punto y coma, signos de exclamación, signos de interrogación, apóstrofo, guión y tilde.",4,1,11),

(185,"Produce textos para expresarse.",4,1,12),

(186,"Produce textos en los que analiza información.",4,1,12),

(187,"Escribe textos originales de diversos tipos y formatos.",4,1,12),

(188,"Produce textos adecuados y coherentes al tipo de información que desea difundir.",4,1,12),

(189,"Produce un texto con lógica y cohesión.",4,1,12),

(190,"Emplea signos de puntuación de acuerdo con la intención que desea expresar.",4,1,12),

(191,"Comprende la importancia de la corrección de textos para hacerlos claros a los lectores y mantener el propósito comunicativo.",4,1,12),

(192,"Usa oraciones subordinadas, compuestas y coordinadas al producir textos que lo requieran.",4,1,12),

(193,"Corrige textos empleando manuales de redacción y ortografía para resolver dudas.",4,1,12),

(194,"Emplea los tiempos y modos verbales de manera coherente.",4,1,12),

(195,"Usa en la escritura los recursos lingüísticos para expresar temporalidad, causalidad y simultaneidad.",4,1,12),

(196,"Expresa y defiende opiniones e ideas de una manera razonada empleando el diálogo como forma privilegiada para resolver conflictos.",4,1,10),

(197,"Utiliza una amplia variedad de modalidades del habla, como las conversaciones informales y discursos formales.",4,1,10),

(198,"Expone de manera clara y lógica un tema y utiliza un lenguaje adecuado a sus interlocutores.",4,1,10),

(199,"Utiliza diversos recursos discursivos para elaborar una exposición con una intención determinada.",4,1,10),

(200,"Analiza las estrategias discursivas para seleccionar y aplicar las propias al participar en discusiones, análisis o debates.",4,1,10),

(201,"Respeta diversos puntos de vista y recupera las aportaciones de otros para enriquecer su conocimiento.",4,1,10),

(202,"Emplea la puntuación y la ortografía de acuerdo con las normas establecidas.",4,1,6),

(203,"Identifica fallas ortográficas y gramaticales en textos para corregirlos.",4,1,6),

(204,"Comprende el contenido de diversos documentos legales y administrativos para emplearlos en situaciones específicas.",4,1,6),

(205,"Utiliza adecuadamente nexos y adverbios en textos orales y escritos.",4,1,6),

(206,"Emplea las fuentes textuales adecuadas para obtener información de distintas disciplinas.",4,1,6),

(207,"Utiliza adecuadamente los tiempos verbales al producir un texto.",4,1,6),

(208,"Identifica y comparte su gusto por algunos temas, autores y géneros literarios.",4,1,3),

(209,"Desarrolla disposición por leer, escribir, hablar o escuchar.",4,1,3),

(210,"Desarrolla una actitud positiva para seguir aprendiendo por medio del lenguaje escrito.",4,1,3),

(211,"Emplea el lenguaje para expresar ideas, emociones y argumentos.",4,1,3),

(212,"Discute sobre una variedad de temas de manera atenta y respeta los puntos de vista de otros.",4,1,3),

(213,"Valora la autoría propia y desarrolla autoconfianza como autor u orador.",4,1,3),

(214,"Emplea el potencial del lenguaje para la resolución de conflictos.",4,1,3),

(215,"Reconoce y valora las ventajas y desventajas de hablar más de un idioma para comunicarse con otros, interactuar con los textos y acceder a información.",4,1,3),

(216,"Reconoce y valora la existencia de otras lenguas que se hablan en México.",4,1,3),

(217,"Trabaja colaborativamente, escucha y proporciona sus ideas, negocia y toma acuerdos al trabajar en grupo.",4,1,3),

(218,"Desarrolla un concepto positivo de sí mismo como lector, escritor, hablante u oyente; además, desarrolla gusto por leer, escribir, hablar y escuchar.",4,1,3),

(219,"Resuelve problemas que implican convertir números fraccionarios a decimales y viceversa.",4,2,13),

(220,"Resuelve problemas que implican calcular el mínimo común múltiplo o el máximo común divisor.",4,2,13),

(221,"Resuelve problemas aditivos que implican efectuar cálculos con expresiones algebraicas.",4,2,13),

(222,"Resuelve problemas multiplicativos con expresiones algebraicas, a excepción de la división entre polinomios.",4,2,13),

(223,"Resuelve problemas que implican expresar y utilizar la regla general lineal o cuadrática de una sucesión.",4,2,13),

(224,"Resuelve problemas que involucran el uso de ecuaciones lineales o cuadráticas.",4,2,13),

(225,"Resuelve problemas que implican construir círculos y polígonos regulares con base en información diversa y usa las relaciones entre sus puntos y rectas notables.",4,2,7),

(226,"Utiliza la regla y el compás para realizar diversos trazos, como alturas de triángulos, mediatrices, rotaciones, simetrías, etcétera.",4,2,7),

(227,"Resuelve problemas que implican aplicar las propiedades de la congruencia y la semejanza en diversos polígonos.",4,2,7),

(228,"Calcula cualquiera de las variables que intervienen en las fórmulas de perímetro, área y volumen.",4,2,7),

(229,"Determina la medida de diversos elementos del círculo, como: circunferencia, superficie, ángulo inscrito y central, arcos de la circunferencia, sectores y coronas circulares.",4,2,7),

(230,"Aplica el teorema de Pitágoras y las razones trigonométricas seno, coseno y tangente en la resolución de problemas.",4,2,7),

(231,"Resuelve problemas vinculados a la proporcionalidad directa, inversa o múltiple, como porcentajes, escalas, interés simple o compuesto.",4,2,9),

(232,"Expresa algebraicamente una relación lineal o cuadrática entre dos conjuntos de cantidades.",4,2,9),

(233,"Calcula la probabilidad de eventos complementarios, mutuamente excluyentes e independientes.",4,2,9),

(234,"Lee y representa información en diferentes tipos de gráficas; calcula y explica el significado del rango y la desviación media.",4,2,9),

(235,"Desarrolla un concepto positivo de sí mismo como usuario de las matemáticas, el gusto y la inclinación por comprender y utilizar la notación, el vocabulario y los procesos matemáticos.",4,2,1),

(236,"Aplica el razonamiento matemático a la solución de problemas personales, sociales y naturales, aceptando el principio de que existen diversos procedimientos para resolver los problemas particulares.",4,2,1),

(237,"Desarrolla el hábito del pensamiento racional y utiliza las reglas del debate matemático al formular explicaciones o mostrar soluciones.",4,2,1),

(238,"Comparte e intercambia ideas sobre los procedimientos y resultados al resolver problemas.",4,2,1),

(239,"Identifica la unidad y diversidad en los procesos de nutrición, respiración y reproducción, así como su relación con la adaptación y evolución de los seres vivos.",4,3,5),

(240,"Explica la dinámica de los ecosistemas en el proceso de intercambio de materia en las cadenas alimentarias y los ciclos del agua y del carbono.",4,3,5),

(241,"Explica la relación entre los procesos de nutrición y respiración en la obtención de energía para el funcionamiento del cuerpo humano.",4,3,5),

(242,"Explica la importancia de la dieta correcta, el consumo de agua simple potable y de la actividad física para prevenir enfermedades y trastornos asociados con la nutrición.",4,3,5),

(243,"Identifica las causas y las medidas de prevención de las enfermedades respiratorias comunes, en particular las asociadas a la contaminación atmosférica y al tabaquismo.",4,3,5),

(244,"Explica cómo se expresa la sexualidad en términos de aspectos afectivos, de género, eróticos y reproductivos a lo largo de la vida y cómo favorecer la salud sexual y reproductiva.",4,3,5),

(245,"Describe diferentes tipos de movimiento en términos de su rapidez, velocidad y aceleración.",4,3,5),

(246,"Describe características del movimiento ondulatorio con base en el modelo de ondas.",4,3,5),

(247,"Relaciona la fuerza con las interacciones mecánicas, electrostáticas y magnéticas, y explica sus efectos a partir de las Leyes de Newton.",4,3,5),

(248,"Explica la relación entre la gravedad y algunos efectos en los cuerpos en la Tierra y en el Sistema Solar.",4,3,5),

(249,"Describe algunas propiedades (masa, volumen, densidad y temperatura), así como interacciones relacionadas con el calor, la presión y los cambios de estado, con base en el modelo cinético de partículas.",4,3,5),

(250,"Describe la energía a partir de las trasformaciones de la energía mecánica y el principio de conservación en términos de la transferencia de calor.",4,3,5),

(251,"Explica fenómenos eléctricos y magnéticos con base en las características de los componentes del átomo.",4,3,5),

(252,"Identifica algunas características de las ondas electromagnéticas y las relaciona con la energía que transportan.",4,3,5),

(253,"Identifica explicaciones acerca del origen y evolución del Universo, así como características de sus componentes principales.",4,3,5),

(254,"Identifica las propiedades físicas de los materiales, así como la composición y pureza de las mezclas, compuestos y elementos.",4,3,5),

(255,"Identifica los componentes de las mezclas, su clasificación, los cambios de sus propiedades en función de su concentración, así como los métodos de separación.",4,3,5),

(256,"Identifica las características del modelo atómico (partículas y sus funciones).",4,3,5),

(257,"Explica la organización y la información contenida en la tabla periódica de los elementos, así como la importancia de algunos de ellos para los seres vivos.",4,3,5),

(258,"Identifica el aporte calórico de los alimentos y su relación con la cantidad de energía requerida por una persona.",4,3,5),

(259,"Identifica las propiedades de los ácidos y las bases, así como las características de las reacciones redox.",4,3,5),

(260,"Identifica las características del enlace químico y de la reacción química.",4,3,5),

(261,"Explica la interrelación de la ciencia y la tecnología en los avances en el conocimiento de los seres vivos, del Universo, la transformación de los materiales, la estructura de la materia, el tratamiento de las enfermedades y del cuidado del ambiente",4,3,4),

(262,"Relaciona el conocimiento científico con algunas aplicaciones tecnológicas de uso cotidiano y de importancia social.",4,3,4),

(263,"Identifica los beneficios y riesgos de las aplicaciones de la ciencia y la tecnología en la calidad de vida, el cuidado del ambiente, la investigación científica y el desarrollo de la sociedad.",4,3,4),

(264,"Identifica las características de la ciencia y su relación con la tecnología.",4,3,4),

(265,"Diseña investigaciones científicas en las que considera el contexto social.",4,3,8),

(266,"Aplica habilidades necesarias para la investigación científica: plantea preguntas, identifica temas o problemas, recolecta datos mediante la observación o experimentación, elabora, comprueba o refuta hipótesis, analiza y comunica los resultados y des",4,3,8),

(267,"Planea y realiza experimentos que requieren de análisis, control y cuantificación de variables.",4,3,8),

(268,"Utiliza instrumentos tecnológicos para ampliar la capacidad de los sentidos y obtener información de los fenómenos naturales con mayor detalle y precisión.",4,3,8),

(269,"Realiza interpretaciones, deducciones, conclusiones, predicciones y representaciones de fenómenos y procesos naturales, a partir del análisis de datos y evidencias de una investigación científica, y explica cómo llegó a ellas.",4,3,8),

(270,"Desarrolla y aplica modelos para interpretar, describir, explicar o predecir fenómenos y procesos naturales, como una parte esencial del conocimiento científico.",4,3,8),

(271,"Aplica habilidades interpersonales necesarias para el trabajo colaborativo, al desarrollar investigaciones científicas.",4,3,8),

(272,"Comunica los resultados de sus observaciones e investigaciones usando diversos recursos, entre ellos diagramas, tablas de datos, presentaciones, gráficas y otras formas simbólicas, así como las tecnologías de la comunicación y la información (TIC), y",4,3,8),

(273,"Manifiesta un pensamiento científico para investigar y explicar conocimientos sobre el mundo natural en una variedad de contextos.",4,3,2),

(274,"Aplica el pensamiento crítico y el escepticismo informado al identificar el conocimiento científico del que no lo es.",4,3,2),

(275,"Manifiesta compromiso y toma decisiones en favor de la sustentabilidad del ambiente.",4,3,2),

(276,"Manifiesta responsabilidad al tomar decisiones informadas para cuidar su salud.",4,3,2),

(277,"Disfruta y aprecia los espacios naturales y disponibles para la recreación y la actividad física.",4,3,2),

(278,"Manifiesta disposición para el trabajo colaborativo respetando las diferencias culturales o de género.",4,3,2),

(279,"Valora la ciencia como proceso social en construcción permanente en el que contribuyen hombres y mujeres de distintas culturas.",4,3,2);



INSERT INTO `Usuarios` (`idUsuario`, `nick`, `nombre`, `apellidos`, `sexo`, `email`, `telefono`, `contraseña`,`cct`, `idEntidad`, `idMunicipio`, `idLocalidad`, `idNodo`, `idTurno`) VALUES

(9,"Pili","Pilar","Herrea","M","","","12345","",9,0,0,4,1),

(22,"AlmaQ","Alma","Cuervo","M","","","12345","",9,0,0,4,1),

(23,"Naye","Nayeli","a","M","","","12345","",9,0,0,4,1),

(30,"Arturo ","Arturo ","Rodríguez Guerrero","H","","","12345","",9,0,0,4,1),

(31,"Laura ","Laura ","Aguirre Aguilar","M","","","12345","",9,0,0,4,1),

(33,"Martiux","Martha ","Leticia Casas Flores","M","","","12345","",9,0,0,4,1),

(34,"Virginia ","Virginia ","Mazón","M","","","12345","",9,0,0,4,1),

(35,"Héctor ","Héctor ","Monges Morán","H","","","12345","",9,0,0,4,1),

(36,"Jokabed ","Jokabed ","Zagoya Mellado","M","","","12345","",9,0,0,4,1),

(37,"Pilar ","Pilar ","Herrera Suárez","M","","","12345","",9,0,0,4,1),

(38,"Alejandra ","Alejandra ","Elizalde Trinidad","M","","","12345","",9,0,0,4,1),

(39,"Janina ","Janina ","Cuevas Zúñiga","M","","","12345","",9,0,0,4,1),

(40,"Sara ","Sara ","Vogel","M","","","12345","",9,0,0,4,1),

(41,"Araceli ","Araceli ","Castillo Macias","M","","","12345","",9,0,0,4,1),

(42,"María Esther ","María Esther ","Padilla Medina","M","","","12345","",9,0,0,4,1),

(43,"Catalina ","Catalina ","Ortega Núñez","M","","","12345","",9,0,0,4,1),

(44,"Dalila ","Dalila ","López","M","","","12345","",9,0,0,4,1);



COMMIT;
