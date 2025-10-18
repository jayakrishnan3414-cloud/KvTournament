/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - tournament
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tournament` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tournament`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add human',7,'add_human'),
(26,'Can change human',7,'change_human'),
(27,'Can delete human',7,'delete_human'),
(28,'Can view human',7,'view_human'),
(29,'Can add players',8,'add_players'),
(30,'Can change players',8,'change_players'),
(31,'Can delete players',8,'delete_players'),
(32,'Can view players',8,'view_players'),
(33,'Can add auction',9,'add_auction'),
(34,'Can change auction',9,'change_auction'),
(35,'Can delete auction',9,'delete_auction'),
(36,'Can view auction',9,'view_auction');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(2,'auth','permission'),
(3,'auth','group'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'tournamentapp','human'),
(8,'tournamentapp','players'),
(9,'tournamentapp','auction');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2025-05-25 06:37:19.862363'),
(2,'auth','0001_initial','2025-05-25 06:37:20.788066'),
(3,'admin','0001_initial','2025-05-25 06:37:21.037216'),
(4,'admin','0002_logentry_remove_auto_add','2025-05-25 06:37:21.086417'),
(5,'admin','0003_logentry_add_action_flag_choices','2025-05-25 06:37:21.129892'),
(6,'contenttypes','0002_remove_content_type_name','2025-05-25 06:37:21.310896'),
(7,'auth','0002_alter_permission_name_max_length','2025-05-25 06:37:21.396288'),
(8,'auth','0003_alter_user_email_max_length','2025-05-25 06:37:21.454568'),
(9,'auth','0004_alter_user_username_opts','2025-05-25 06:37:21.505951'),
(10,'auth','0005_alter_user_last_login_null','2025-05-25 06:37:21.606177'),
(11,'auth','0006_require_contenttypes_0002','2025-05-25 06:37:21.621804'),
(12,'auth','0007_alter_validators_add_error_messages','2025-05-25 06:37:21.660813'),
(13,'auth','0008_alter_user_username_max_length','2025-05-25 06:37:21.740272'),
(14,'auth','0009_alter_user_last_name_max_length','2025-05-25 06:37:21.815661'),
(15,'auth','0010_alter_group_name_max_length','2025-05-25 06:37:21.891612'),
(16,'auth','0011_update_proxy_permissions','2025-05-25 06:37:21.926736'),
(17,'auth','0012_alter_user_first_name_max_length','2025-05-25 06:37:22.004188'),
(18,'sessions','0001_initial','2025-05-25 06:37:22.098052'),
(19,'tournamentapp','0001_initial','2025-05-25 06:37:22.262327'),
(20,'tournamentapp','0002_auction','2025-05-25 07:25:46.343678'),
(21,'tournamentapp','0003_remove_auction_name','2025-05-25 07:26:49.065931'),
(22,'tournamentapp','0004_human_phno','2025-05-25 17:30:21.560824'),
(23,'tournamentapp','0005_alter_players_human','2025-05-26 04:43:29.646256');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

/*Table structure for table `tournamentapp_auction` */

DROP TABLE IF EXISTS `tournamentapp_auction`;

CREATE TABLE `tournamentapp_auction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `HUMAN_id` bigint(20) NOT NULL,
  `PLAYERS_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tournamentapp_auction_HUMAN_id_c5cf42e7` (`HUMAN_id`),
  KEY `tournamentapp_auction_PLAYERS_id_679e4aa1` (`PLAYERS_id`)
) ENGINE=MyISAM AUTO_INCREMENT=222 DEFAULT CHARSET=latin1;

/*Data for the table `tournamentapp_auction` */

insert  into `tournamentapp_auction`(`id`,`HUMAN_id`,`PLAYERS_id`) values 
(3,11,282),
(4,11,282),
(5,11,238),
(196,18,316),
(7,19,213),
(8,11,99),
(9,11,99),
(10,11,282),
(11,12,6),
(12,16,43),
(13,12,282),
(14,14,36),
(15,12,6),
(16,12,16),
(17,14,4),
(18,17,3),
(19,14,20),
(20,15,22),
(21,17,18),
(22,19,8),
(23,19,7),
(24,18,14),
(25,16,15),
(26,13,13),
(27,11,1),
(28,13,9),
(29,16,19),
(30,17,67),
(31,17,51),
(32,16,73),
(33,19,78),
(34,11,81),
(35,18,53),
(36,16,62),
(37,11,54),
(38,17,86),
(39,16,60),
(40,14,82),
(41,15,64),
(42,11,76),
(43,19,50),
(44,15,65),
(45,17,55),
(46,14,70),
(47,17,85),
(48,19,63),
(49,14,84),
(50,12,57),
(51,12,61),
(52,12,52),
(53,12,71),
(54,13,79),
(55,13,74),
(56,19,189),
(57,13,198),
(58,11,191),
(59,12,206),
(60,13,187),
(61,18,204),
(62,15,197),
(63,19,186),
(64,14,196),
(65,17,193),
(66,16,190),
(67,13,257),
(68,17,250),
(69,11,239),
(126,18,247),
(71,14,242),
(72,16,244),
(73,15,243),
(74,14,295),
(75,15,296),
(76,12,160),
(77,19,171),
(78,11,164),
(79,16,165),
(80,16,178),
(81,14,180),
(82,15,185),
(83,13,158),
(84,14,172),
(85,17,163),
(86,14,166),
(87,19,184),
(88,13,181),
(89,15,168),
(90,18,182),
(91,17,179),
(92,11,150),
(93,14,138),
(94,19,147),
(95,18,137),
(96,19,148),
(97,19,139),
(98,13,151),
(120,15,302),
(100,13,134),
(101,11,136),
(102,14,153),
(103,12,146),
(104,14,157),
(105,18,210),
(106,14,212),
(107,19,207),
(108,15,211),
(109,17,261),
(110,14,266),
(111,12,264),
(112,16,262),
(113,14,263),
(114,16,259),
(115,18,268),
(129,15,306),
(117,14,260),
(118,17,265),
(119,11,130),
(121,16,131),
(122,16,129),
(123,17,132),
(124,17,304),
(130,14,37),
(127,18,305),
(128,19,300),
(131,17,36),
(132,15,47),
(133,16,38),
(134,18,42),
(135,19,49),
(136,12,45),
(137,16,43),
(138,14,31),
(139,16,25),
(140,13,26),
(141,17,48),
(142,15,28),
(143,17,228),
(144,15,222),
(145,13,213),
(146,13,223),
(147,19,219),
(148,14,308),
(149,11,220),
(150,12,235),
(151,13,232),
(152,18,221),
(153,19,215),
(154,12,274),
(155,12,226),
(156,11,283),
(157,17,236),
(158,12,276),
(159,14,269),
(160,13,272),
(161,15,278),
(162,11,281),
(163,17,285),
(164,18,282),
(165,15,287),
(166,11,291),
(167,11,286),
(168,15,289),
(169,16,290),
(170,19,288),
(171,19,293),
(172,17,111),
(173,19,124),
(174,12,116),
(175,14,115),
(176,11,104),
(177,19,90),
(178,12,103),
(180,15,309),
(181,13,99),
(182,15,120),
(183,17,87),
(184,11,122),
(185,14,93),
(186,16,310),
(187,19,91),
(188,15,311),
(189,16,98),
(190,11,126),
(191,17,101),
(192,14,125),
(193,11,102),
(195,11,123),
(197,15,317),
(198,15,301),
(199,15,313),
(204,13,318),
(216,14,26),
(202,18,292),
(203,16,96),
(205,18,80),
(206,16,123),
(207,17,105),
(208,18,156),
(209,18,319),
(210,18,155),
(211,18,230),
(212,18,279),
(213,18,34),
(214,16,32),
(215,16,322),
(217,11,195),
(218,11,28),
(219,14,262),
(220,12,19),
(221,11,260);

/*Table structure for table `tournamentapp_human` */

DROP TABLE IF EXISTS `tournamentapp_human`;

CREATE TABLE `tournamentapp_human` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `called_value` varchar(200) NOT NULL,
  `phno` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `tournamentapp_human` */

insert  into `tournamentapp_human`(`id`,`name`,`total`,`called_value`,`phno`) values 
(11,'jayakrishnan ','4101','0','0'),
(12,'kevin','5000','0','0'),
(13,'kelvin','5000','0','0'),
(14,'devanand','5000','0','0'),
(15,'nikil','5000','0','0'),
(16,'athul','5000','0','0'),
(17,'arjun','5000','0','0'),
(18,'anandhu','5000','0','0'),
(19,'madhav','5000','0','0');

/*Table structure for table `tournamentapp_players` */

DROP TABLE IF EXISTS `tournamentapp_players`;

CREATE TABLE `tournamentapp_players` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `auctioned_value` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `HUMAN_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tournamentapp_players_HUMAN_id_72361493` (`HUMAN_id`)
) ENGINE=MyISAM AUTO_INCREMENT=333 DEFAULT CHARSET=latin1;

/*Data for the table `tournamentapp_players` */

insert  into `tournamentapp_players`(`id`,`name`,`auctioned_value`,`status`,`HUMAN_id`) values 
(1,'Alisson Becker','0','unsold',1),
(2,'Andre? Onana','0','unsold',1),
(3,'David de Gea','0','unsold',1),
(4,'David Raya','0','unsold',1),
(5,'David Seaman','0','unsold',1),
(6,'Dida','0','unsold',1),
(7,'Ederson Moraes','0','unsold',1),
(8,'Emiliano Marti?nez','0','unsold',1),
(9,'Gianluigi Donnarumma','0','unsold',1),
(10,'Gregor Kobel','0','unsold',1),
(308,'nico williams','0','unsold',1),
(12,'Guillermo Ochoa','0','unsold',1),
(13,'Jan Oblak','0','unsold',1),
(14,'Ju?lio Ce?sar','0','unsold',1),
(15,'Manuel Neuer','0','unsold',1),
(16,'Marc ter Stegen','0','unsold',1),
(17,'Mike Maignan','0','unsold',1),
(18,'Oliver Kahn','0','unsold',1),
(19,'Petr C?ech','0','unsold',1),
(20,'Thibaut Courtois','0','unsold',1),
(21,'Unai Simo?n','0','unsold',1),
(22,'Vi?tor Bai?a','0','unsold',1),
(23,'Yann Sommer','0','unsold',1),
(24,'Brahim Di?az','0','unsold',1),
(25,'Bruno Fernandes','0','unsold',1),
(26,'Cole Palmer','0','unsold',1),
(27,'Dani Olmo','0','unsold',1),
(28,'Dejan Kulus?evski','0','unsold',1),
(29,'De?sire? Doue?','0','unsold',1),
(30,'Eberechi Eze','0','unsold',1),
(31,'Florian Wirtz','0','unsold',1),
(32,'Franck Ribe?ry','0','unsold',1),
(33,'Harvey Elliott','0','unsold',1),
(34,'Hidetoshi Nakata','0','unsold',1),
(35,'Isco','0','unsold',1),
(36,'Jamal Musiala','0','unsold',1),
(37,'Kaka?','0','unsold',1),
(38,'Kevin De Bruyne','0','unsold',1),
(39,'Marcel Sabitzer','0','unsold',1),
(40,'Marco Reus','0','unsold',1),
(41,'Mason Mount','0','unsold',1),
(42,'Rivaldo','0','unsold',1),
(43,'Ronaldinho Gau?cho','0','unsold',1),
(44,'Rui Costa','0','unsold',1),
(45,'Ruud Gullit','0','unsold',1),
(46,'Toma?s? Rosicky?','0','unsold',1),
(47,'Xavi Simons','0','unsold',1),
(48,'Wesley Sneijder','0','unsold',1),
(49,'Zico','0','unsold',1),
(50,'Alessandro Bastoni','0','unsold',1),
(51,'Alessandro Nesta','0','unsold',1),
(52,'Antonio Ru?diger','0','unsold',1),
(53,'Carles Puyol','0','unsold',1),
(54,'Benjamin Pavard','0','unsold',1),
(55,'Cristian Romero','0','unsold',1),
(56,'David Alaba','0','unsold',1),
(57,'Dayot Upamecano','0','unsold',1),
(58,'E?der Milita?o','0','unsold',1),
(59,'Fabio Cannavaro','0','unsold',1),
(60,'Franco Baresi','0','unsold',1),
(61,'Franz Beckenbauer','0','unsold',1),
(62,'Gabriel Magalha?es','0','unsold',1),
(63,'Ibrahima Konate?','0','unsold',1),
(64,'In?igo Marti?nez','0','unsold',1),
(65,'John Stones','0','unsold',1),
(66,'Jos?ko Gvardiol','0','unsold',1),
(67,'Kalidou Koulibaly','0','unsold',1),
(68,'Kim Min-Jae','0','unsold',1),
(69,'Lisandro Marti?nez','0','unsold',1),
(70,'Marquinhos','0','unsold',1),
(71,'Matthijs de Ligt','0','unsold',1),
(72,'Nacho','0','unsold',1),
(73,'Nicola?s Otamendi','0','unsold',1),
(74,'Paolo Maldini','0','unsold',1),
(75,'Pau Cubarsi?','0','unsold',1),
(76,'Raphae?l Varane','0','unsold',1),
(77,'Riccardo Calafiori','0','unsold',1),
(78,'Ru?ben Dias','0','unsold',1),
(79,'Ronald Arau?jo','0','unsold',1),
(80,'Sergio Ramos','0','unsold',1),
(81,'Sol Campbell','0','unsold',1),
(82,'Stefan de Vrij','0','unsold',1),
(83,'Thiago Silva','0','unsold',1),
(84,'Tony Adams','0','unsold',1),
(85,'Virgil van Dijk','0','unsold',1),
(86,'William Saliba','0','unsold',1),
(87,'Alexander Isak','0','unsold',1),
(88,'A?lvaro Morata','0','unsold',1),
(89,'Andy Cole','0','unsold',1),
(90,'Cristiano Ronaldo','0','unsold',1),
(91,'David Villa','0','unsold',1),
(92,'Denis Law','0','unsold',1),
(93,'Didier Drogba','0','unsold',1),
(94,'Diego Forla?n','0','unsold',1),
(95,'Diogo Jota','0','unsold',1),
(96,'Dwight Yorke','0','unsold',1),
(97,'Edinson Cavani','0','unsold',1),
(98,'Endrick','0','unsold',1),
(99,'Erling Haaland','0','unsold',1),
(100,'Fernando Morientes','0','unsold',1),
(101,'FERNANDO TORRES','0','unsold',1),
(102,'Filippo Inzaghi','0','unsold',1),
(103,'Gabriel Batistuta','0','unsold',1),
(104,'Harry Kane','0','unsold',1),
(105,'Hristo Stoichkov','0','unsold',1),
(106,'Jan Koller','0','unsold',1),
(107,'Julián Alvarez','0','unsold',1),
(318,'k.rumminigue','0','unsold',1),
(109,'Kai Havertz','0','unsold',1),
(110,'Karim Benzema','0','unsold',1),
(111,'Kylian Mbappé','0','unsold',1),
(112,'Lautaro Martínez','0','unsold',1),
(113,'Loïs Openda','0','unsold',1),
(309,'Luis Suárez','0','unsold',1),
(115,'M. OWEN','0','unsold',1),
(116,'M. VAN BASTEN','0','unsold',1),
(117,'Marcus Thuram','0','unsold',1),
(118,'Mario González','0','unsold',1),
(119,'Memphis Depay','0','unsold',1),
(120,'Olivier Giroud','0','unsold',1),
(121,'Randal Kolo Muani','0','unsold',1),
(122,'Robert Lewandowski','0','unsold',1),
(123,'ROMÁRIO','0','unsold',1),
(124,'Romelu Lukaku','0','unsold',1),
(125,'S. ETO?O','0','unsold',1),
(126,'Timo Werner','0','unsold',1),
(127,'Victor Osimhen','0','unsold',1),
(128,'Nicolò Barella','0','unsold',1),
(129,'Paul Scholes','0','unsold',1),
(130,'Pedri','0','unsold',1),
(131,'Rafael van der Vaart','0','unsold',1),
(132,'Rodrigo De Paul','0','unsold',1),
(310,'dybla','0','unsold',1),
(134,'Toni Kroos','0','unsold',1),
(135,'Vitinha','0','unsold',1),
(136,'Xavi','0','unsold',1),
(137,'Lothar Matthäus','0','unsold',1),
(138,'Luka Modri?','0','unsold',1),
(139,'Martin Ødegaard','0','unsold',1),
(140,'Nicolò Barella','0','unsold',1),
(311,'rodrigo','0','unsold',1),
(301,'iniesta','0','unsold',1),
(316,'darwin nunez','0','unsold',1),
(304,'alexis mac allister','0','unsold',1),
(307,'Steven Gerrard','0','unsold',1),
(146,'Frank Lampard','0','unsold',1),
(147,'Frenkie de Jong','0','unsold',1),
(148,'Gavi','0','unsold',1),
(149,'Granit Xhaka','0','unsold',1),
(150,'Guti','0','unsold',1),
(151,'Jack Wilshere','0','unsold',1),
(302,'Joshua Kimmich','0','unsold',1),
(153,'Jude Bellingham','0','unsold',1),
(154,'Kobbie Mainoo','0','unsold',1),
(155,'Eduardo Camavinga','0','unsold',1),
(156,'Enzo Fernández','0','unsold',1),
(157,'Federico Valverde','0','unsold',1),
(158,'Xabi Alonso','0','unsold',1),
(159,'Wataru Endo','0','unsold',1),
(160,'Massimo Ambrosini','0','unsold',1),
(161,'Mateo Kova?i?','0','unsold',1),
(162,'Moisés Caicedo','0','unsold',1),
(163,'N. Kanté','0','unsold',1),
(164,'Patrick Vieira','0','unsold',1),
(165,'Rodri','0','unsold',1),
(166,'Rúben Neves','0','unsold',1),
(167,'Sandro Tonali','0','unsold',1),
(168,'Sergio Busquets','0','unsold',1),
(169,'Fabinho','0','unsold',1),
(170,'Gilberto Silva','0','unsold',1),
(171,'Guardiola','0','unsold',1),
(172,'Hakan Çalhano?lu','0','unsold',1),
(173,'?lkay Gündo?an','0','unsold',1),
(174,'João Neves','0','unsold',1),
(175,'Jorginho','0','unsold',1),
(176,'Leon Goretzka','0','unsold',1),
(177,'Marc Casadó','0','unsold',1),
(178,'Andrea Pirlo','0','unsold',1),
(179,'Aurélien Tchouaméni','0','unsold',1),
(180,'Casemiro','0','unsold',1),
(181,'Claude Makélélé','0','unsold',1),
(182,'Declan Rice','0','unsold',1),
(183,'Edgar Davids','0','unsold',1),
(184,'Emmanuel Petit','0','unsold',1),
(185,'Frank Rijkaard','0','unsold',1),
(186,'A. Costacurta','0','unsold',1),
(187,'Alejandro Balde','0','unsold',1),
(188,'Alejandro Grimaldo','0','unsold',1),
(189,'Alphonso Davies','0','unsold',1),
(190,'Andrew Robertson','0','unsold',1),
(191,'Bixente Lizarazu','0','unsold',1),
(192,'Denis Irwin','0','unsold',1),
(193,'Federico Dimarco','0','unsold',1),
(194,'Ferland Mendy','0','unsold',1),
(195,'Jakub Kiwior','0','unsold',1),
(196,'João Cancelo','0','unsold',1),
(197,'Jordi Alba','0','unsold',1),
(198,'Lucas Hernández','0','unsold',1),
(199,'Luke Shaw','0','unsold',1),
(200,'Marc Cucurella','0','unsold',1),
(201,'Marcos Acuña','0','unsold',1),
(202,'Nuno Mendes','0','unsold',1),
(203,'Oleksandr Zinchenko','0','unsold',1),
(204,'Roberto Carlos','0','unsold',1),
(205,'Takehiro Tomiyasu','0','unsold',1),
(206,'Théo Hernández','0','unsold',1),
(207,'Denlison','0','unsold',1),
(208,'Kaoru Mitoma','0','unsold',1),
(209,'Lee Kang-In','0','unsold',1),
(210,'Pavel Nedvéd 2','0','unsold',1),
(211,'Robert Pirès','0','unsold',1),
(212,'Serginho','0','unsold',1),
(213,'Neymar Jr','0','unsold',1),
(215,'Rafael Leão','0','unsold',1),
(216,'Rabeem Sterling','0','unsold',1),
(218,'Sadio Mané','0','unsold',1),
(219,'Son Heung-Min','0','unsold',1),
(220,'Vinicius Júnior','0','unsold',1),
(221,'Jack Grealish','0','unsold',1),
(222,'Jérémy Doku','0','unsold',1),
(223,'Kvaratskhelia','0','unsold',1),
(224,'Kagou Mitoma','0','unsold',1),
(225,'Kingsley Coman','0','unsold',1),
(226,'Leroy Sané','0','unsold',1),
(227,'Luis Díaz','0','unsold',1),
(228,'Marcus Rashford','0','unsold',1),
(229,'Alejandro Garnacho','0','unsold',1),
(230,'Ansu Fati','0','unsold',1),
(231,'Anthony Gordon','0','unsold',1),
(232,'Bradley Barcola','0','unsold',1),
(233,'Christian Pulisic','0','unsold',1),
(234,'Cody Gakpo','0','unsold',1),
(235,'Federico Chiesa','0','unsold',1),
(236,'Ferran Torres','0','unsold',1),
(237,'Gabriel Martinelli','0','unsold',1),
(238,'Reece James','0','unsold',1),
(239,'T. Alexander-Arnold','0','unsold',1),
(240,'Aaron Wan-Bissaka','0','unsold',1),
(241,'Achraf Hakimi','0','unsold',1),
(242,'Albert Ferrer','0','unsold',1),
(243,'Belletti','0','unsold',1),
(244,'Ben White','0','unsold',1),
(245,'Canu','0','unsold',1),
(246,'Dani Alves','0','unsold',1),
(247,'Dani Carvajal','0','unsold',1),
(248,'Diogo Dalot','0','unsold',1),
(249,'Jeremie Frimpong','0','unsold',1),
(250,'Jules Koundé','0','unsold',1),
(251,'Jurriën Timber','0','unsold',1),
(252,'Kieran Trippier','0','unsold',1),
(253,'Lucas Vázquez','0','unsold',1),
(254,'Marcos Llorente','0','unsold',1),
(255,'Philipp Lahm','0','unsold',1),
(256,'Llorente','0','unsold',1),
(257,'Kyle Walker','0','unsold',1),
(258,'Lilian Thuram','0','unsold',1),
(259,'Takefusa Kubo','0','unsold',1),
(260,'Angel Di María','899','sold',11),
(261,'Arda Güler','0','unsold',1),
(262,'David Beckham','0','unsold',1),
(263,'Gaizka Mendieta','0','unsold',1),
(264,'Juan Cuadrado','0','unsold',1),
(265,'Ludovic Blas','0','unsold',1),
(266,'Michael Ollse','0','unsold',1),
(306,'Phil Foden','0','unsold',1),
(268,'Ray Parlour','0','unsold',1),
(269,'Mousea Diaby','0','unsold',1),
(270,'Nicolas Pépé','0','unsold',1),
(271,'Noni Madueke','0','unsold',1),
(272,'Ousmane Dembélé','0','unsold',1),
(273,'Pedro Neto','0','unsold',1),
(274,'Raphinha','0','unsold',1),
(275,'Riyad Mahrez','0','unsold',1),
(276,'Serge Gnabry','0','unsold',1),
(277,'Amad Diallo','0','unsold',1),
(278,'Antony','0','unsold',1),
(279,'Bukayo Saka','0','unsold',1),
(280,'Jadon Sancho','0','unsold',1),
(281,'Lamine Yamal','0','unsold',1),
(282,'Lionel Messi','0','unsold',1),
(283,'Luis Figo','0','unsold',1),
(284,'Marco Asensio','0','unsold',1),
(285,'Mohamed Salah','0','unsold',1),
(286,'Thomas Mu?ller','0','unsold',1),
(287,'Ademola Lookman','0','unsold',1),
(288,'Alessandro Del Piero','0','unsold',1),
(289,'Antoine Griezmann','0','unsold',1),
(290,'Dennis Bergkamp','0','unsold',1),
(291,'Diego Maradona','0','unsold',1),
(292,'Francesco Totti','0','unsold',1),
(293,'Johan Cruyff','0','unsold',1),
(294,'Raúlf','0','unsold',1),
(295,'cafu','0','unsold',1),
(296,'aldair','0','unsold',1),
(300,'dominik szoboszlai','0','unsold',1),
(313,'van nistelrooy','0','unsold',1),
(305,'gundagon','0','unsold',1),
(317,'carlos baleba','0','unsold',1),
(319,'pepe','0','unsold',1),
(322,'marcelo','0','unsold',1),
(323,'Diego Costa','0','unsold',1),
(324,'Gennaro Gattuso','0','unsold',1),
(325,'Eric Cantona','0','unsold',1),
(326,'Lucas Beraldo','0','unsold',1),
(327,'Daniel Van Buyten','0','unsold',1),
(328,'João Neves','0','unsold',1),
(329,'Benjamin Cremaschi','0','unsold',1),
(330,'Jarrad Branthwaite ','0','unsold',1),
(331,'Matheus Cunha','0','unsold',1),
(332,'Paul Gascoigne','0','unsold',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
