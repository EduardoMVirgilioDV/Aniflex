/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : tp2

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-07-01 02:01:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `ID_CATEGORIA` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `TEXTO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES ('2', 'perros');
INSERT INTO `categoria` VALUES ('3', 'lobos');
INSERT INTO `categoria` VALUES ('4', 'gatos');
INSERT INTO `categoria` VALUES ('5', 'felinos grandes');
INSERT INTO `categoria` VALUES ('6', 'pajaros');
INSERT INTO `categoria` VALUES ('8', 'osos');
INSERT INTO `categoria` VALUES ('11', 'peces');
INSERT INTO `categoria` VALUES ('12', 'sepientes');

-- ----------------------------
-- Table structure for comentario
-- ----------------------------
DROP TABLE IF EXISTS `comentario`;
CREATE TABLE `comentario` (
  `ID_COMENTARIO` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `COMENTARIO` tinytext NOT NULL,
  `ID_USUARIO` int(50) unsigned NOT NULL,
  `ID_POST` int(50) unsigned NOT NULL,
  PRIMARY KEY (`ID_COMENTARIO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_POST` (`ID_POST`),
  CONSTRAINT `FK_POST_COMENTARIO` FOREIGN KEY (`ID_POST`) REFERENCES `post` (`ID_POST`) ON DELETE CASCADE,
  CONSTRAINT `FK_USUARIO_COMENTARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comentario
-- ----------------------------
INSERT INTO `comentario` VALUES ('4', 'hermoso animal', '17', '46');
INSERT INTO `comentario` VALUES ('5', 'me encanta los lobos', '18', '6');
INSERT INTO `comentario` VALUES ('6', 'mee gustaria tener uno en casaaaaaa', '30', '7');
INSERT INTO `comentario` VALUES ('12', 'sdfsdfsdf', '14', '8');
INSERT INTO `comentario` VALUES ('18', 'ssssss', '14', '9');
INSERT INTO `comentario` VALUES ('19', 'xxxxxx', '14', '10');
INSERT INTO `comentario` VALUES ('20', 'zzzzzzzzzzzzz', '14', '11');
INSERT INTO `comentario` VALUES ('21', 'hola', '17', '17');
INSERT INTO `comentario` VALUES ('25', 'dffffffffffffffffff', '17', '23');
INSERT INTO `comentario` VALUES ('29', 'nn', '17', '31');
INSERT INTO `comentario` VALUES ('30', 'hola este es un comentario', '17', '32');
INSERT INTO `comentario` VALUES ('33', 'xv', '17', '33');
INSERT INTO `comentario` VALUES ('34', 'zz', '17', '34');
INSERT INTO `comentario` VALUES ('35', 'hola2', '17', '35');
INSERT INTO `comentario` VALUES ('39', 'sss', '17', '36');
INSERT INTO `comentario` VALUES ('41', 'f', '17', '37');
INSERT INTO `comentario` VALUES ('58', 'z<x<zxzx', '14', '38');
INSERT INTO `comentario` VALUES ('59', 'gabriel', '14', '39');
INSERT INTO `comentario` VALUES ('61', 'sdfsdf', '14', '40');
INSERT INTO `comentario` VALUES ('76', 'xzczxczxc', '14', '41');
INSERT INTO `comentario` VALUES ('77', '', '14', '42');
INSERT INTO `comentario` VALUES ('78', 'zxczxczxczxc', '14', '43');
INSERT INTO `comentario` VALUES ('79', 'xxxxxxxxxxxxxxxxx', '14', '44');
INSERT INTO `comentario` VALUES ('83', 'sdfsdfsd', '14', '45');
INSERT INTO `comentario` VALUES ('86', 'zxxxxxxxxxxxxxxxxxxxxxxxxx', '14', '46');
INSERT INTO `comentario` VALUES ('87', 'hermoso', '14', '10');
INSERT INTO `comentario` VALUES ('88', 'zzzzz', '14', '45');
INSERT INTO `comentario` VALUES ('89', 'hola', '14', '45');
INSERT INTO `comentario` VALUES ('90', 'e', '17', '6');
INSERT INTO `comentario` VALUES ('91', 'hola', '14', '6');
INSERT INTO `comentario` VALUES ('101', 'vgvgv v', '17', '46');
INSERT INTO `comentario` VALUES ('106', 'fffffffffffffffffffffffff', '14', '46');
INSERT INTO `comentario` VALUES ('107', 'hhhh', '14', '46');
INSERT INTO `comentario` VALUES ('108', 'hola', '14', '36');
INSERT INTO `comentario` VALUES ('122', 'vssdvsdv', '18', '42');
INSERT INTO `comentario` VALUES ('124', 'sdfsdfsdfsdf', '17', '42');
INSERT INTO `comentario` VALUES ('128', 'xvxcvxcv', '18', '42');

-- ----------------------------
-- Table structure for permiso
-- ----------------------------
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE `permiso` (
  `ID_PERMISO` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `RANGO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_PERMISO`),
  KEY `ID_PERMISO` (`ID_PERMISO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permiso
-- ----------------------------
INSERT INTO `permiso` VALUES ('1', 'novato');
INSERT INTO `permiso` VALUES ('2', 'avanzado');
INSERT INTO `permiso` VALUES ('3', 'creador');
INSERT INTO `permiso` VALUES ('4', 'editor');
INSERT INTO `permiso` VALUES ('5', 'moderador');
INSERT INTO `permiso` VALUES ('6', 'administrador');
INSERT INTO `permiso` VALUES ('7', '');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `ID_POST` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `TITULOS` varchar(50) NOT NULL,
  `DESCRIPCION` mediumtext,
  `IMAGEN` varchar(300) DEFAULT NULL,
  `ID_USUARIO` int(50) unsigned NOT NULL,
  `FECHA` datetime NOT NULL,
  PRIMARY KEY (`ID_POST`),
  KEY `FK_USUARIO_POST` (`ID_USUARIO`),
  CONSTRAINT `FK_USUARIO_POST` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('6', 'border colie', 'El Border Collie es una raza de perro de trabajo incluido dentro de la denominación Collie. Considerada la mejor raza de todas por su facilidad para ser entrenado, un caso de este ejemplo fue un border collie muy reconocido llamado Willie por las grandes competencias que ganó con una entrenadora inexperta de once años. La raza surgió en la frontera entre Escocia e Inglaterra como perro pastor, sobre todo para trabajar con rebaños de ovejas. El border collie fue seleccionado sobre todo para enfatizar su inteligencia y su obediencia; debido a esto, son uno de los perros pastores más populares en la actualidad.\r\n\r\nEl Border Collie está considerado como un perro extremadamente inteligente, lleno de energía, acrobático y atlético, y generalmente compiten con gran éxito en concursos de pastoreo y otros deportes caninos. Son mencionados como la raza de perro doméstico más inteligente.', 'border.jpg', '14', '2019-06-05 19:54:50');
INSERT INTO `post` VALUES ('7', 'shetland sheepdog', 'El Shetland Sheepdog o Sheltie es una raza de perro que proviene de las Islas Shetland (Escocia, Reino Unido). Fue intencionalmente criado para ser de tamaño pequeño. A primera vista parece un Collie de pelo largo miniaturizado, sin embargo son 2 razas diferentes con un aspecto semejante, y la raza de collie que dio origen al Sheltie fue el Border Collie. ', 'shetland.jpg', '27', '2019-02-13 19:54:52');
INSERT INTO `post` VALUES ('8', 'Akita Inu', 'El Akita o Akita Inu (秋田 犬?) (traducido como \'perro de Akita\'),1​ es una raza canina originaria de Japón, llamado así por la prefectura de Akita. Al inicio fue un perro de caza mayor y durante generaciones fue usado por los guerreros del Japón como perro de defensa y ataque, y también para cazar osos. Se le considera una raza aparte del Akita Americano. ', 'Akita Inu.jpg', '18', '2019-05-08 19:54:58');
INSERT INTO `post` VALUES ('9', 'lobo gris', 'El lobo gris, también conocido como lobo común, a la mayoría de las personas le es familiar, sin embargo, con frecuencia, estos lobos son confundidos con otras especies de lobos con aspectos parecidos.\r\n\r\nAlgunos lobos pesan 55 kilos, y otros pueden estar cerca de las 90 libras. Los investigadores han encontrado algunos de hasta 200 libras, pero encontrar a este tipo de lobos es bastante extraño. Estos animales pueden medir desde cuatro pies y medio hasta seis pies de longitud, además poseen color gris, negro, rojo, blanco, y una mezcla de colores y matices diferentes.', 'lobogris.jpg', '21', '2019-06-01 19:55:09');
INSERT INTO `post` VALUES ('10', 'lobo artico', 'ningún lobo tiene el color del lobo ártico debido a la ubicación en donde se encuentra. Esta sub especie del lobo gris generalmente es de color blanco, aunque algunos son amarillos y otros poseen colores grises y negros en algunas partes del cuerpo.', 'loboartico.jpg', '21', '2019-06-01 19:55:14');
INSERT INTO `post` VALUES ('11', 'lobo rojo', 'El lobo rojo tiene, como su nombre lo indica, una piel roja, sin embargo, no todos los lobos rojos tienen esta coloración y muchos de ellos son de color marrón, es por eso que a veces se confunden con otras especies de lobos, y muchas personas asumen que todos tienen coloración roja. Otra característica distintiva de los lobos rojos es un color blanco alrededor de la zona de boca, también tienen, la cabeza y las orejas muy grandes.', 'loborojo.jpg', '14', '2019-06-01 19:55:16');
INSERT INTO `post` VALUES ('17', 'Gato británico de pelo corto', 'Estos bellos especímenes, cuando llegaron a Gran Bretaña, se cruzaron con otros gatos de la zona e inclusive con gatos persas, dando a luz entonces a esta hermosa raza de gatos grises, que originalmente son hermosas criaturas ya que su pelaje es muy abundante gris—azulado.', 'gatogris.jpg', '20', '2019-06-01 19:55:21');
INSERT INTO `post` VALUES ('23', 'gatotabby', 'El gato atigrado, barcino, romano o tabby es un gato con un distintivo pelaje de rayas y manchas características. Los gatos atigrados a menudo son, erróneamente, confundidos con una raza de gato pero solo son una variedad de color; de hecho, el patrón que posee el atigrado es una característica que ocurre naturalmente y que podría ser la original coloración de los distantes ancestros de los gatos domésticos.\r\n\r\nEl color del atigrado es encontrado en muchas razas de gato, así como en el moggy (raza mestiza), que es el gato más parecido al atigrado. Cuando estos gatos son reconocidos como raza, de forma aleatoria, su coloración tiende a ser de color marrón con ojos verdes o en ocasiones, son de pelaje verde. Algunos genetistas creen que éste es el fenotipo más común del gato doméstico. El atigrado normalmente tiene una marca en forma de \"M\" en la frente. ', 'gatotabby.jpg', '18', '2019-05-09 03:24:02');
INSERT INTO `post` VALUES ('31', 'gato quimera', 'son gatos \"quimera\", un nombre que se da a los gatos que contienen dos tipos de ADN distinto, es decir, dos cigotos fecundados, lo cual produce que su pelaje tenga unos colores sorprendentes. El caso de las hembras, es distinto: las gatas ya tienen dos cromosomas X, así que, según los expertos, podrían no ser una \"quimera\" (de hecho, habría que hacerles pruebas de ADN para confirmarlo), pero su verdadera peculiaridad reside en los ojos azules, que no son normales en gatos de estos colores.', 'gatoojos.jpg', '27', '2019-06-05 03:32:42');
INSERT INTO `post` VALUES ('32', 'tigre', 'El tigre (Panthera tigris) es una de las cuatro3​ especies de la subfamilia de los panterinos (familia Felidae) pertenecientes al género Panthera. Se encuentra solamente en el continente asiático; es un predador carnívoro y es la especie de félido más grande del mundo junto con el león pudiendo alcanzar ambos un tamaño comparable al de los fósiles de félidos de mayor tamaño.\r\n\r\nExisten seis subespecies de tigre, de las cuales la de Bengala es la más numerosa; sus ejemplares constituyen cerca del 80 % de la población total de la especie; se encuentra en la India, Bangladés, Bután, Birmania y Nepal. Es una especie en peligro de extinción,4​ y en la actualidad, la mayor parte de los tigres en el mundo viven en cautiverio. El tigre es el animal nacional de Bangladesh y la India', 'tigre.jpg', '20', '2019-06-06 03:53:20');
INSERT INTO `post` VALUES ('33', 'jaguar', 'El tigre (Panthera tigris) es una de las cuatro3​ especies de la subfamilia de los panterinos (familia Felidae) pertenecientes al género Panthera. Se encuentra solamente en el continente asiático; es un predador carnívoro y es la especie de félido más grande del mundo junto con el león pudiendo alcanzar ambos un tamaño comparable al de los fósiles de félidos de mayor tamaño.\r\n\r\nExisten seis subespecies de tigre, de las cuales la de Bengala es la más numerosa; sus ejemplares constituyen cerca del 80 % de la población total de la especie; se encuentra en la India, Bangladés, Bután, Birmania y Nepal. Es una especie en peligro de extinción,4​ y en la actualidad, la mayor parte de los tigres en el mundo viven en cautiverio. El tigre es el animal nacional de Bangladesh y la India', 'jaguar.jpg', '33', '2019-05-15 03:53:38');
INSERT INTO `post` VALUES ('34', 'leon', 'El león (Panthera leo) es un mamífero carnívoro de la familia de los félidos y una de las cinco especies del género Panthera. Los leones salvajes viven en poblaciones cada vez más dispersas y fragmentadas del África subsahariana (a excepción de las regiones selváticas de la costa del Atlántico y la cuenca del Congo) y una pequeña zona del noroeste de India (una población en peligro crítico en el Parque nacional del Bosque de Gir y alrededores), habiendo desaparecido del resto de Asia del Sur, Asia Occidental, África del Norte y la península balcánica en tiempos históricos. Hasta finales del Pleistoceno, hace aproximadamente 10 000 años, de los grandes mamíferos terrestres, el león era el más extendido tras los humanos. Su distribución cubría la mayor parte de África, gran parte de Eurasia, desde el oeste de Europa hasta la India, y en América, desde el río Yukón hasta el sur de México.', 'leon.jpg', '27', '2019-05-16 03:55:01');
INSERT INTO `post` VALUES ('35', 'aguila', 'Águila es el nombre dado a las mayores aves depredadoras. Las diversas especies y subespecies de águilas pueden encontrarse en casi cualquier parte del mundo excepto en la Antártida. Son miembros de las aves de presa, del orden de Accipitriformes,1​ (o Falconiformes acorde a una clasificación anterior),2​ familia Accipitridae, subfamilia Buteoninae. Pertenecen a varios géneros, los cuales están sujetos a una reclasificación más adecuada puesto que los expertos no llegan a una opinión consensuada. Las águilas se caracterizan principalmente por su gran tamaño, constitución robusta, cabeza y pico pesados. ', 'aguila.jpg', '18', '2019-05-08 03:59:34');
INSERT INTO `post` VALUES ('36', 'paloma', 'Esta ave vive de los desperdicios de comida y del alpiste que le ofrecen, es frecuente ver multitudes de Palomas Domésticas en calles y plazas de todo el mundo. El plumaje típico es de color azul grisáceo con dos bandas negras en las alas. Sin embargo, puede que encuentres parvadas de ellas de un solo color, con manchas, pálidas, o de color rojo óxido. Traídas a América desde Europa a principios de 1600, las Palomas Domésticas anidan en edificios. En el campo, las Palomas Domésticas anidan en graneros, silos de torre, debajo de puentes, y barrancos naturales.', 'paloma.jpg', '19', '2019-06-11 04:00:48');
INSERT INTO `post` VALUES ('37', 'colibri', 'Las especies que forman el género Colibri tienen un tamaño que oscila entre 9,5 y 15 cm, y un peso de 4,8 a 8,5 g. Aunque son aves pequeñas, no son las más pequeñas, dado que estos pertenecen al género Mellisuga. Tienen cola amplia, bifurcada o redondeada. El pico es negro y delgado, relativamente largo y curvado, y tienen una larga lengua en forma tubular. El plumaje de tres de las cuatro especies es principalmente verde o gris claro. Los machos tienen una mancha violeta-azul corriendo hacia atrás y abajo del ojo (cuyas plumas se levantan cuando están excitados) y un parche brillante sobre la garganta. El plumaje de las hembras se parece al de los machos, pero los parches del oído y de la garganta son más pequeños.', 'colibri.jpg', '18', '2019-04-10 04:02:00');
INSERT INTO `post` VALUES ('38', 'oso negro', 'El oso negro (Ursus americanus), también llamado oso negro americano, es una especie de mamífero carnívoro de la familia de los úrsidos. Es el oso más común en Norteamérica. Se encuentra en una superficie geográfica que se extiende desde el norte de Canadá y Alaska hasta la Sierra Gorda de México, y de las costas atlánticas a las costas pacíficas de Norteamérica. Está presente en un gran número de estados estadounidenses y en todas las provincias canadienses. Prefiere los bosques y las montañas, donde encuentra su comida y puede ocultarse. La población de osos negros era hace tiempo, seguramente, de dos millones de individuos. En la actualidad, la especie está protegida y se considera que existen entre 500.000 y 750.000 osos negros en ese continente', 'osonegro.jpg', '14', '2019-05-14 04:05:57');
INSERT INTO `post` VALUES ('39', 'oso marron', 'El oso pardo es a menudo confundido con el oso grizzli, una subespecie, debido a la semejanza en su apariencia física. No deje que su nombre lo engañe los osos pardos pueden ser de color marrón, rubios, e incluso de color casi negro.', 'osomarron.jpg', '18', '2019-05-23 04:06:22');
INSERT INTO `post` VALUES ('40', 'oso polar', 'El oso polar u oso blanco (Ursus maritimus) es una especie de mamífero carnívoro de la familia de los osos (Ursidae).2​ Es junto con su pariente, el oso Kodiak (Ursus arctos middendorffi), uno de los carnívoros terrestres más grandes de la Tierra.3​ Vive en el medio polar y zonas heladas del hemisferio norte. Es el único superdepredador del Ártico. ', 'osopolar.jpg', '17', '2019-06-06 04:07:22');
INSERT INTO `post` VALUES ('41', 'pez rosado con manos', 'El pez rosado con manos, el pez que prefiere caminar a nadar\r\nEs característico del sur de la isla australiana de Tasmania, en cuyos océanos habita en la zona demersal, pegada al fondo, en la que se alimenta de gusanos y pequeños crustáceos del bentos (organismos que viven en el fondo del mar).', 'pez1.jpg', '22', '2019-05-29 04:12:42');
INSERT INTO `post` VALUES ('42', 'pez cirujano', ' Paracanthurus hepatus, llamado comúnmente pez cirujano regal o paleta de pintor. El nombre es ligeramente engañoso, ya que la espiga azul no siempre es azul. Por la noche, sin luz para reflejar su pigmentación, puede aparecer blanco con toques violáceos. Cuando es joven, es principalmente amarillo. Las espigas azules se alimentan típicamente de algas, impidiendo que los arrecifes de coral se desborden con ellas.', 'dory.jpg', '18', '2019-06-23 04:15:10');
INSERT INTO `post` VALUES ('43', 'atun', 'El grupo Thunnus es un género de peces óseos marinos con menos de diez especies incluidas en él. Los individuos de este género son llamados cordilas en sus primeros días de vida.\r\n\r\nNadan con velocidades de crucero de 3 a 7 km/h, pero pueden alcanzar los 70 km/h y, excepcionalmente, son capaces de superar los 110 km/h en recorridos cortos.1​ Como son animales oceánicos pelágicos, viajan grandes distancias durante sus migraciones (recorriendo de 14 a 50 km diarios), que duran hasta 60 días. Ciertas especies de atunes pueden sumergirse hasta los 400 m de profundidad. ', 'atun.jpg', '27', '2019-01-22 04:17:18');
INSERT INTO `post` VALUES ('44', 'Mamba negra', 'Una serpiente venenosa veloz, enorme y con un talento especial para sobrevivir en climas imposibles. Así es la mamba negra, la serpiente africana que ha hecho surgir una leyenda que va mucho más allá de su simple capacidad envenenadora. No es tan peligrosa como cuentan las viejas leyendas africanas, pero desde luego, su poder es letal, aunque no tiene nada de sobrenatural. Lo más preocupante es que al contrario de otras muchas serpientes, la mamba negra es veloz y letal, así que puede mordernos antes de que nos demos cuenta.', 'Mambanegra.jpg', '20', '2019-05-15 04:22:10');
INSERT INTO `post` VALUES ('45', 'yarara', 'La yarará común (Bothrops alternatus) es una especie de serpiente venenosa de la subfamilia Crotalinae, endémica de Brasil, Bolivia, Paraguay, Uruguay, Argentina.1​ Dentro de su rango, es una importante causa de mordeduras de serpiente. No hay subespecies reconocidas.2​ ', 'yarara.jpg', '22', '2019-06-05 04:26:04');
INSERT INTO `post` VALUES ('46', 'Cobra', 'Cobra es el nombre común de un grupo de serpientes venenosas de la familia Elapidae, en especial los géneros Naja, con unas veinte especies, y Ophiophagus, con una especie. Habitan en zonas tropicales y desérticas del sur de Asia y África. Es fácil reconocerlas porque despliegan una especie de \"capucha\" en la zona de la cabeza cuando están irritadas o en peligro. Logran hacer esto aplanando las vértebras de la cabeza.\r\n\r\nEn general, se alimentan de roedores y aves, a los que matan inyectándoles una neurotoxina a través de los colmillos. Entre sus depredadores se incluyen la mangosta y algunas aves rapaces. ', 'cobra.jpg', '33', '2019-06-18 04:26:28');

-- ----------------------------
-- Table structure for post_tiene_categoria
-- ----------------------------
DROP TABLE IF EXISTS `post_tiene_categoria`;
CREATE TABLE `post_tiene_categoria` (
  `ID_CATEGORIA` int(50) unsigned NOT NULL,
  `ID_POST` int(50) unsigned NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`,`ID_POST`),
  KEY `ID_CATEGORIA` (`ID_CATEGORIA`),
  KEY `FK_POST_POST_TIENE_CATEGORIA` (`ID_POST`),
  CONSTRAINT `FK_CATEGORIA_POST_TIENE_CATEGORIA` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`) ON DELETE CASCADE,
  CONSTRAINT `FK_POST_POST_TIENE_CATEGORIA` FOREIGN KEY (`ID_POST`) REFERENCES `post` (`ID_POST`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of post_tiene_categoria
-- ----------------------------
INSERT INTO `post_tiene_categoria` VALUES ('2', '6');
INSERT INTO `post_tiene_categoria` VALUES ('2', '7');
INSERT INTO `post_tiene_categoria` VALUES ('2', '8');
INSERT INTO `post_tiene_categoria` VALUES ('3', '9');
INSERT INTO `post_tiene_categoria` VALUES ('3', '10');
INSERT INTO `post_tiene_categoria` VALUES ('3', '11');
INSERT INTO `post_tiene_categoria` VALUES ('4', '17');
INSERT INTO `post_tiene_categoria` VALUES ('4', '23');
INSERT INTO `post_tiene_categoria` VALUES ('4', '31');
INSERT INTO `post_tiene_categoria` VALUES ('5', '32');
INSERT INTO `post_tiene_categoria` VALUES ('5', '33');
INSERT INTO `post_tiene_categoria` VALUES ('5', '34');
INSERT INTO `post_tiene_categoria` VALUES ('6', '35');
INSERT INTO `post_tiene_categoria` VALUES ('6', '36');
INSERT INTO `post_tiene_categoria` VALUES ('6', '37');
INSERT INTO `post_tiene_categoria` VALUES ('8', '38');
INSERT INTO `post_tiene_categoria` VALUES ('8', '39');
INSERT INTO `post_tiene_categoria` VALUES ('8', '40');
INSERT INTO `post_tiene_categoria` VALUES ('11', '41');
INSERT INTO `post_tiene_categoria` VALUES ('11', '42');
INSERT INTO `post_tiene_categoria` VALUES ('11', '43');
INSERT INTO `post_tiene_categoria` VALUES ('12', '44');
INSERT INTO `post_tiene_categoria` VALUES ('12', '45');
INSERT INTO `post_tiene_categoria` VALUES ('12', '46');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID_USUARIO` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `USUARIO` varchar(18) NOT NULL,
  `CONTRASENIA` varchar(300) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `ID_PERMISO` int(4) unsigned DEFAULT '1',
  `NOMBRE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `ID_PERMISO` (`ID_PERMISO`),
  CONSTRAINT `FK_PERMISO_USUARIO` FOREIGN KEY (`ID_PERMISO`) REFERENCES `permiso` (`ID_PERMISO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('14', 'taty', 'taty', 'tatiana.schiavone@davinci.edu.ar', '6', 'holaz');
INSERT INTO `usuario` VALUES ('17', 'gabi', 'gabi22', 'gabriel@hotmail.com', '2', 'holaz');
INSERT INTO `usuario` VALUES ('18', 'admin', 'admin2', 'admin@hotmail.com', '6', 'admin');
INSERT INTO `usuario` VALUES ('19', 'will', 'will', 'will@hotmail.com', '6', 'williams');
INSERT INTO `usuario` VALUES ('20', 'giovanna', 'giovanna', 'giova@hotmail.com', '5', 'giovana');
INSERT INTO `usuario` VALUES ('21', 'fernando', 'fernando', 'fernando@hotmail.com', '2', 'fernando');
INSERT INTO `usuario` VALUES ('22', 'gaston', 'gaston', 'gaston@hotmial.com', '2', 'gaston');
INSERT INTO `usuario` VALUES ('23', 'pabli', 'pabli', 'pabli@hotmail.com', '3', 'pablo');
INSERT INTO `usuario` VALUES ('27', 'dani', 'dani', 'dani@hotmail.com', '2', 'dani');
INSERT INTO `usuario` VALUES ('30', 'cielo', 'cielo', 'cielo@hotmail.com', '2', 'cielo');
INSERT INTO `usuario` VALUES ('31', 'luna', 'luna', 'luna@hotmail.com', '2', 'luna');
INSERT INTO `usuario` VALUES ('33', 'zoe', 'zoe', 'zoe@hotmail.com', '4', 'zoe');
INSERT INTO `usuario` VALUES ('34', 'maia', 'maia', 'maia@hotmail.com', '2', 'maia');
INSERT INTO `usuario` VALUES ('35', 'daiana', 'daina', 'dadina@hotmail.com', '4', 'daiana');
INSERT INTO `usuario` VALUES ('36', 'wilson', 'wilson', 'wilson@hotmail.com', '2', 'wilson');
INSERT INTO `usuario` VALUES ('37', 'marta', 'marta', 'marta@hotmail.com', '2', 'marta');
INSERT INTO `usuario` VALUES ('38', 'matias', ' matias', 'mati@hotmail.com', '3', 'matias');
INSERT INTO `usuario` VALUES ('39', 'lucas', 'lucas', 'lu@hotmai.com', '3', 'lucas');
INSERT INTO `usuario` VALUES ('41', 'martin', 'martin', 'martin@hotmail.com', '3', 'martin');
INSERT INTO `usuario` VALUES ('44', 'sadasd', 'sdfsd', 'holahola2@hotmail.com', '3', 'fsdfsdf');
INSERT INTO `usuario` VALUES ('45', 'dsfsdf', 'hola', 'holaholahola@hotmail.com', '4', 'hola');
INSERT INTO `usuario` VALUES ('46', 'leon', 'leon', 'leon@hotmail.com', '3', 'leon');
