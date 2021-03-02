-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 18, 2021 at 05:21 PM
-- Server version: 10.3.27-MariaDB-log
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lapetite_prod`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `id` int(11) NOT NULL,
  `accessory_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`id`, `accessory_name`, `price`, `image_url`) VALUES
(1, 'Lumanari Aurii', 10, 'lumanari-aurii.jpeg'),
(2, 'Lumanari Roz', 10, 'lumanari-roz.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `county` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `phone`, `address`, `town`, `county`) VALUES
(2, 1, '+40785696811', 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'BUCURESTI', 'Bucuresti');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `banner` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `banner`) VALUES
(1, 'Prajituri La Petite', 'prajituri-la-petite', NULL),
(2, 'Prajituri Clasice si Traditionale', 'prajituri-clasice-si-traditionale', NULL),
(3, 'Torturi Aniversare', 'torturi-aniversare', NULL),
(4, 'Torturi Personalizate', 'torturi-personalizate', NULL),
(5, 'Produse Sarate', 'produse-sarate', NULL),
(6, 'Produse editie limitata', 'produse-editie-limitata', NULL),
(7, 'Candy-Bar', 'candy-bar', NULL),
(8, 'Accesorii', 'accesorii', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `coupon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `percent` varchar(3) NOT NULL DEFAULT '10',
  `type` enum('newsletter','promotion','','') DEFAULT 'newsletter',
  `used` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon`, `email`, `percent`, `type`, `used`) VALUES
(24, 'SARBATORI10', 'maria.hvb@gmail.com', '10', 'newsletter', 0),
(22, 'SARBATORI10', 'Pirvan_adriana@yahoo.com', '10', 'newsletter', 0),
(23, 'SARBATORI10', 'Daniel@terra-agency.ro', '10', 'newsletter', 0),
(21, 'SARBATORI10', 'iamandif983@gmail.com', '10', 'newsletter', 0),
(12, 'SARBATORI10', 'Dianasimona22@yahoo.com', '10', 'newsletter', 0),
(20, 'SARBATORI10', 'c.vieriu@yahoo.com', '10', 'newsletter', 0),
(19, 'SARBATORI10', 'financiar@terra-agency.ro', '10', 'newsletter', 0),
(25, 'SARBATORI10', 'Daniel.popa@terra-agency.ro', '10', 'newsletter', 1),
(26, 'SARBATORI10', 'alexandru.manta@hotmail.com', '10', 'newsletter', 1),
(27, 'SARBATORI10', 'maricaionita76@gmail.com', '10', 'newsletter', 0),
(28, 'SARBATORI10', 'lazarsilvia86@gmail.com ', '10', 'newsletter', 0),
(29, 'SARBATORI10', 'soarestefanita29@gmail.com', '10', 'newsletter', 0),
(30, 'SARBATORI10', 'Tudorelenamagdalena@gmail.com', '10', 'newsletter', 0),
(31, 'SARBATORI10', 'catalina_styoian89@yahoo.com', '10', 'newsletter', 0),
(32, 'SARBATORI10', 'marinasuciu@gmail.com', '10', 'newsletter', 0),
(33, 'SARBATORI10', 's_el3na@yahoo.com', '10', 'newsletter', 0),
(34, 'SARBATORI10', 'georgianacristinacoman@gmail.com', '10', 'newsletter', 0),
(35, 'SARBATORI10', 'auramandachi@yahoo.com', '10', 'newsletter', 0),
(36, 'SARBATORI10', 'lugojeanaanagospodina@email.com ', '10', 'newsletter', 0),
(37, 'SARBATORI10', 'louisedumbraveanu579@gmail.com', '10', 'newsletter', 0),
(38, 'SARBATORI10', 'Mateielena9555@gmail.com ', '10', 'newsletter', 0),
(39, 'SARBATORI10', 'geota1979@yahoo.com', '10', 'newsletter', 0),
(40, 'SARBATORI10', 'cristina.marin06@yahoo.com', '10', 'newsletter', 0),
(41, 'SARBATORI10', 'oprisa.iana@gmail.com', '10', 'newsletter', 0),
(42, 'SARBATORI10', 'larisa.chioseaua@gmail.com', '10', 'newsletter', 0),
(43, 'SARBATORI10', 'ramoghinea@yahoo.com ', '10', 'newsletter', 0),
(44, 'SARBATORI10', 'mady2007madalina@yahoo.com', '10', 'newsletter', 0),
(45, 'SARBATORI10', 'mihaelaotoiu@yahoo.co.uk', '10', 'newsletter', 0),
(46, 'SARBATORI10', 'dimageorgeta82@gmail.com.', '10', 'newsletter', 0),
(47, 'SARBATORI10', 'alice.nitu@yahoo.com', '10', 'newsletter', 0),
(48, 'SARBATORI10', 'Danielpopa701@gmail.com', '10', 'newsletter', 1),
(49, 'SARBATORI10', 'alina507moise@gmail.com', '10', 'newsletter', 0),
(50, 'SARBATORI10', 'articole@terra-agency.ro', '10', 'newsletter', 0),
(51, 'SARBATORI10', 'Alexalpha14i@gmail.com', '10', 'newsletter', 0),
(52, 'SARBATORI10', 'poparascumarius@gmail.com', '10', 'newsletter', 0),
(53, 'SARBATORI10', 'Proiecte@terra-agency.ro', '10', 'newsletter', 1),
(54, 'SARBATORI10', 'david.yamir@yahoo.com', '10', 'newsletter', 0),
(55, 'SARBATORI10', 'Alina.balan1983@gmail.com', '10', 'newsletter', 0),
(56, 'SARBATORI10', 'mihai.luncasu.liviu@gmail.com', '10', 'newsletter', 1),
(57, 'SARBATORI10', 'grosu_stoica@yahoo.com', '10', 'newsletter', 0),
(58, 'SARBATORI10', 'lorenacroitoru5@gmail.com', '10', 'newsletter', 0),
(59, 'SARBATORI10', 'alice_iulia_lascu@yahoo.com', '10', 'newsletter', 0),
(60, 'SARBATORI10', 'petrutapana22@yahoo.com', '10', 'newsletter', 0),
(61, 'SARBATORI10', 'anghel.danuta@yahoo.com', '10', 'newsletter', 0),
(62, 'SARBATORI10', 'Claudia.andrei09@gmail.com', '10', 'newsletter', 0),
(63, 'SARBATORI10', 'Monimitran@yahoo.com ', '10', 'newsletter', 0),
(64, 'SARBATORI10', 'anamaria.padeanu@yahoo.com', '10', 'newsletter', 0),
(65, 'SARBATORI10', 'zvizer@yahoo.com ', '10', 'newsletter', 0),
(66, 'SARBATORI10', 'Stefania_butnarus2000@yahoo.com', '10', 'newsletter', 0),
(67, 'SARBATORI10', 'Iuliadragomir011@gmail.com ', '10', 'newsletter', 0),
(68, 'SARBATORI10', 'briana.tucan@neculce.ro', '10', 'newsletter', 0),
(69, 'SARBATORI10', 'Dianasimona22@icloud.com', '10', 'newsletter', 0),
(70, 'SARBATORI10', 'sophiaiancumsj@gmail.com ', '10', 'newsletter', 0),
(71, 'SARBATORI10', 'Ioana.ruta@gmail.com', '10', 'newsletter', 0),
(72, 'SARBATORI10', 'daniela.voica99@yahoo.com', '10', 'newsletter', 0),
(73, 'SARBATORI10', 'Albert.maglan@gmail.com ', '10', 'newsletter', 0),
(74, 'SARBATORI10', 'voicumaria83@gmail.com ', '10', 'newsletter', 0),
(75, 'SARBATORI10', 'boicu.georgiana@gmail.com', '10', 'newsletter', 0),
(76, 'SARBATORI10', 'voineanicoletamariana@gmail.com', '10', 'newsletter', 0),
(77, 'SARBATORI10', 'monica.duscu@yahoo.com ', '10', 'newsletter', 0),
(78, 'SARBATORI10', 'Iuliadaniela.stoica@yahoo.com', '10', 'newsletter', 0),
(79, 'SARBATORI10', 'Scarlatcristina10@yahoo.com ', '10', 'newsletter', 0),
(80, 'SARBATORI10', 'Marius.zota.ro@gmail.com', '10', 'newsletter', 0),
(81, 'SARBATORI10', 'laura_katalin@yahoo.com', '10', 'newsletter', 0),
(82, 'SARBATORI10', 'Cocuti.mihai@gmail.com ', '10', 'newsletter', 0),
(83, 'SARBATORI10', 'paraschiv.nicoleta91@yahoo.ro', '10', 'newsletter', 0),
(84, 'SARBATORI10', 'Daniela.fartat@yahoo.com', '10', 'newsletter', 1),
(85, 'SARBATORI10', 'ioana.mihail07@gmail.com', '10', 'newsletter', 0),
(86, 'SARBATORI10', 'onuta.lari@gmail.com', '10', 'newsletter', 0),
(87, 'SARBATORI10', 'onuta.lari@gmail.com', '10', 'newsletter', 0),
(88, 'SARBATORI10', 'floryna_m@hotmail.com ', '10', 'newsletter', 0),
(89, 'SARBATORI10', 'anastasescu_laura@yahoo@yahoo.com', '10', 'newsletter', 0),
(90, 'SARBATORI10', 'brezoi.adrian@gmail.com', '10', 'newsletter', 0),
(91, 'SARBATORI10', 'simonar622@gmail.com ', '10', 'newsletter', 0),
(92, 'SARBATORI10', 'nedelcu_cristina_elena@yahoo.com ', '10', 'newsletter', 0),
(93, 'SARBATORI10', 'gontaru_alina@yahoo.com', '10', 'newsletter', 0),
(94, 'SARBATORI10', 'balasoiuo13@gmail.com', '10', 'newsletter', 0),
(95, 'SARBATORI10', 'carminadiaconeasa@yahoo.com', '10', 'newsletter', 0),
(96, 'SARBATORI10', 'bordinc_adelina@yahoo.ro', '10', 'newsletter', 0),
(97, 'SARBATORI10', 'grazzielaparaschiv@gmail.com', '10', 'newsletter', 0),
(98, 'SARBATORI10', 'olivia.pletea@yahoo.com', '10', 'newsletter', 0),
(99, 'SARBATORI10', 'ramonabadica@yahoo.com', '10', 'newsletter', 0),
(100, 'SARBATORI10', 'm.giorgiana.tudor@gmail.com', '10', 'newsletter', 0),
(101, 'SARBATORI10', 'Vasilesilvia16@gmail.com', '10', 'newsletter', 0),
(102, 'SARBATORI10', 'Cristinamocanu853@gmail.com ', '10', 'newsletter', 0),
(103, 'SARBATORI10', 'miha_alex75@yahoo.com', '10', 'newsletter', 0),
(104, 'SARBATORI10', 'elena141998paraschiv@gmail.com ', '10', 'newsletter', 0),
(105, 'SARBATORI10', 'alexandra.matei1699@iclud.com', '10', 'newsletter', 0),
(106, 'SARBATORI10', 'dannynede.dn@gmail.com', '10', 'newsletter', 0),
(107, 'SARBATORI10', 'daniela_alystar@yahoo.com', '10', 'newsletter', 0),
(108, 'SARBATORI10', 'andreeanicolaie1980@yahoo.com ', '10', 'newsletter', 0),
(109, 'SARBATORI10', 'Iovescu.violeta@yahoo.com', '10', 'newsletter', 0),
(110, 'SARBATORI10', 'bioricapetrutam@yahoo.com', '10', 'newsletter', 0),
(111, 'SARBATORI10', 'shukaryta_nr1@yahoo.com ', '10', 'newsletter', 0),
(112, 'SARBATORI10', 'Cristu.andrei22@yahoo.com', '10', 'newsletter', 0),
(113, 'SARBATORI10', 'Dorica.cirligeanu@gmail.com', '10', 'newsletter', 0),
(114, 'SARBATORI10', 'elenaarsene207@gmail.com', '10', 'newsletter', 0),
(115, 'SARBATORI10', 'alina_madalina21@yahoo.com', '10', 'newsletter', 0),
(116, 'SARBATORI10', 'risha_md@yahoo.com', '10', 'newsletter', 0),
(117, 'SARBATORI10', 'Stanlilianamaria@yahoo.com', '10', 'newsletter', 0),
(118, 'SARBATORI10', 'Annemar.alina@yahoo.com ', '10', 'newsletter', 0),
(119, 'SARBATORI10', 'ghitalucia19882015@gmail.com', '10', 'newsletter', 0),
(120, 'SARBATORI10', 'Oanailie127@yahoo.com ', '10', 'newsletter', 0),
(121, 'SARBATORI10', 'adriana.covaliu@gmail.com', '10', 'newsletter', 0),
(122, 'SARBATORI10', 'Gabriela.urs2019@gmail.com', '10', 'newsletter', 0),
(123, 'SARBATORI10', 'florea.violetaramona@gmail.com', '10', 'newsletter', 0),
(124, 'SARBATORI10', 'Clauditaniko@gmail.com', '10', 'newsletter', 0),
(125, 'SARBATORI10', 'costescu.liliana80@yahoo.ro', '10', 'newsletter', 0),
(126, 'SARBATORI10', 'hristea.andrada@yahoo.com', '10', 'newsletter', 0),
(127, 'SARBATORI10', 'andrei.macavei89@gmail.com', '10', 'newsletter', 0),
(128, 'SARBATORI10', 'anca0582@yahoo.com ', '10', 'newsletter', 0),
(129, 'SARBATORI10', 'paunmirela696@yahoo.com', '10', 'newsletter', 0),
(130, 'SARBATORI10', 'Adri_ana2050@yahoo.com', '10', 'newsletter', 0),
(131, 'SARBATORI10', 'a_bivolaru@yahoo.com', '10', 'newsletter', 0),
(132, 'SARBATORI10', 'camellia.paun@gmail.com', '10', 'newsletter', 0),
(133, 'SARBATORI10', 'badeam71@yahoo.com', '10', 'newsletter', 0),
(134, 'SARBATORI10', 'Catalina_stoian89@yahoo.com', '10', 'newsletter', 0),
(135, 'SARBATORI10', 'popiciandreea@gmail.com', '10', 'newsletter', 0),
(136, 'SARBATORI10', 'elenaadrianam@yahoo.com', '10', 'newsletter', 0),
(137, 'SARBATORI10', 'Nideleaadrianaluminita@gmail.com', '10', 'newsletter', 0),
(138, 'SARBATORI10', 'www.vrenicuelenamonica@gmail.com', '10', 'newsletter', 0),
(139, 'SARBATORI10', 'diana.antochi89@gmail.com', '10', 'newsletter', 0),
(140, 'SARBATORI10', 'alexa.niko20@yahoo.com', '10', 'newsletter', 0),
(141, 'SARBATORI10', 'monicamarialacatus@yahoo.com', '10', 'newsletter', 0),
(142, 'SARBATORI10', 'mariogb05@yahoo.com ', '10', 'newsletter', 0),
(143, 'SARBATORI10', 'Cristanmail@gmail.com', '10', 'newsletter', 0),
(144, 'SARBATORI10', 'ancutza_maria84@yahoo.com', '10', 'newsletter', 0),
(145, 'SARBATORI10', 'michelle_shtephanie@yahoo.com', '10', 'newsletter', 0),
(146, 'SARBATORI10', 'mariusminca@yahoo.com ', '10', 'newsletter', 1),
(147, 'SARBATORI10', 'Nedea.giulia07@gmail.com', '10', 'newsletter', 0),
(148, 'SARBATORI10', 'claudia.mmarinescu@gmail.com', '10', 'newsletter', 0),
(149, 'SARBATORI10', 'anisoara.stefan@catena.ro', '10', 'newsletter', 0),
(150, 'SARBATORI10', 'flory878@gmail.com', '10', 'newsletter', 0),
(151, 'SARBATORI10', 'andreibudau@gmail.com', '10', 'newsletter', 0),
(152, 'SARBATORI10', 'lazarbianca86@yahoo.com', '10', 'newsletter', 0),
(153, 'SARBATORI10', 'toniantonia648@mail.com', '10', 'newsletter', 0),
(154, 'SARBATORI10', 'loredanacojanu50@gmail.com', '10', 'newsletter', 0),
(155, 'SARBATORI10', 'Aurica.grisca@yahoo.ro', '10', 'newsletter', 0),
(156, 'SARBATORI10', 'vladalex13@yahoo.com', '10', 'newsletter', 0),
(157, 'SARBATORI10', 'mfrincu38@gmail.com ', '10', 'newsletter', 0),
(158, 'SARBATORI10', 'elenapetrescu@gmail.com', '10', 'newsletter', 0),
(159, 'SARBATORI10', 'Ioanaclara942@gmail.com', '10', 'newsletter', 0),
(160, 'SARBATORI10', 'Dafina.costin@liceuldecebal.ro', '10', 'newsletter', 0),
(161, 'SARBATORI10', 'mihaelavalentina_alexandru@yahoo.com', '10', 'newsletter', 0),
(162, 'SARBATORI10', 'Lore_danaa24@yahoo.com', '10', 'newsletter', 0),
(163, 'SARBATORI10', 'Leon_boss79@yahoo.com', '10', 'newsletter', 0),
(164, 'SARBATORI10', 'Cc792036@gmail.com', '10', 'newsletter', 0),
(165, 'SARBATORI10', 'popescu.daniela.silvia@gmail.com', '10', 'newsletter', 0),
(166, 'SARBATORI10', 'niculescudaniela26@gmail.com', '10', 'newsletter', 0),
(167, 'SARBATORI10', 'lilydrm@yahoo.com', '10', 'newsletter', 0),
(168, 'SARBATORI10', 'chm_daniela11@yahoo.com', '10', 'newsletter', 0),
(169, 'SARBATORI10', 'adina.topologeanu@gmail.com', '10', 'newsletter', 0),
(170, 'SARBATORI10', 'badeadanielagabriela98@yahoo.com', '10', 'newsletter', 0),
(171, 'SARBATORI10', 'dianaedelina@gmail.com ', '10', 'newsletter', 0),
(172, 'SARBATORI10', 'alburoxana@icloud.com', '10', 'newsletter', 0),
(173, 'SARBATORI10', 'alana_valeria@yahoo.com', '10', 'newsletter', 0),
(174, 'SARBATORI10', 'vasile.botos@yahoo.com ', '10', 'newsletter', 0),
(175, 'SARBATORI10', 'psteodora@gmail.com', '10', 'newsletter', 0),
(176, 'SARBATORI10', 'dumitrache.andreea120837@yahoo.com ', '10', 'newsletter', 0),
(177, 'SARBATORI10', 'alyna_girl21@yahoo.com', '10', 'newsletter', 0),
(178, 'SARBATORI10', 'clubakira.mc@gmail.com ', '10', 'newsletter', 0),
(179, 'SARBATORI10', 'cadjudeanu62@gmail.com', '10', 'newsletter', 0),
(180, 'SARBATORI10', 'Valentinasimion20@yahoo.com', '10', 'newsletter', 0),
(181, 'SARBATORI10', 'girl_denisa51@yahoo.com', '10', 'newsletter', 0),
(182, 'SARBATORI10', 'Adriana.coler92@yahoo.com ', '10', 'newsletter', 0),
(183, 'SARBATORI10', 'arapucosmina00@gmail.com', '10', 'newsletter', 0),
(184, 'SARBATORI10', 'angheloiuandreeamarina@yahoo.com', '10', 'newsletter', 0),
(185, 'SARBATORI10', 'iordan.elena98@yahoo.ro', '10', 'newsletter', 0),
(186, 'SARBATORI10', 'micaionescu@yahoo.com ', '10', 'newsletter', 0),
(187, 'SARBATORI10', 'tudoranlavinia5@gmail.com', '10', 'newsletter', 0),
(188, 'SARBATORI10', 'Stefaniaalice16@yahoo.com ', '10', 'newsletter', 0),
(189, 'SARBATORI10', 'Iliealex13@gmail.com ', '10', 'newsletter', 0),
(190, 'SARBATORI10', 'madalinaneda@yahoo.com ', '10', 'newsletter', 0),
(191, 'SARBATORI10', 'madalina.grosu26@gmail.com', '10', 'newsletter', 0),
(192, 'SARBATORI10', 'ghitaraluca123@yahoo.com', '10', 'newsletter', 0),
(193, 'SARBATORI10', 'Cristini_k21@yahoo.com', '10', 'newsletter', 0),
(194, 'SARBATORI10', 'dana.brindusan@yahoo.com', '10', 'newsletter', 0),
(195, 'SARBATORI10', 'Pwky_sweet_angel@yahoo.com', '10', 'newsletter', 0),
(196, 'SARBATORI10', 'gabriela.ghencea88@yahoo.com', '10', 'newsletter', 0),
(197, 'SARBATORI10', 'cristinapopa.27@yahoo.com', '10', 'newsletter', 0),
(198, 'SARBATORI10', 'Mbrotoiu2002@yahoo.com', '10', 'newsletter', 0),
(199, 'SARBATORI10', 'gabi_pastia@yahoo.com', '10', 'newsletter', 0),
(200, 'SARBATORI10', 'aniela98@gmail.com ', '10', 'newsletter', 0),
(201, 'SARBATORI10', 'Danyadase@yahoo.com', '10', 'newsletter', 1),
(202, 'SARBATORI10', 'gmzainescu@yahoo.com ', '10', 'newsletter', 0),
(203, 'SARBATORI10', 'monicacristea888@gmail.com', '10', 'newsletter', 0),
(204, 'SARBATORI10', 'alexandra.lavinia.iordan@gmail.com', '10', 'newsletter', 0),
(205, 'SARBATORI10', 'Alexandraniculae20@gmail.com', '10', 'newsletter', 0),
(206, 'SARBATORI10', 'Todoran.andreea05@gmail.com', '10', 'newsletter', 0),
(207, 'SARBATORI10', 'Georgianna.munteanu@gmail.com ', '10', 'newsletter', 0),
(208, 'SARBATORI10', 'adr. com72 @gmail.com', '10', 'newsletter', 0),
(209, 'SARBATORI10', 'adelynacosmyna@yahoo.com', '10', 'newsletter', 1),
(210, 'SARBATORI10', 'beatrice.charmgroup@gmail.com ', '10', 'newsletter', 0),
(211, 'SARBATORI10', 'roelena20@yahoo.com', '10', 'newsletter', 0),
(212, 'SARBATORI10', 'auras23_med@yahoo.com', '10', 'newsletter', 0),
(213, 'SARBATORI10', 'Cobzaru.ionela@yahoo.com', '10', 'newsletter', 0),
(214, 'SARBATORI10', 'Mirindacia28@gmail.com', '10', 'newsletter', 0),
(215, 'SARBATORI10', 'irina0587@yahoo.com', '10', 'newsletter', 0),
(216, 'SARBATORI10', 'andreea.rotaru1027@gmail.com', '10', 'newsletter', 0),
(217, 'SARBATORI10', 'teodora.stanciu1294@gmail.com', '10', 'newsletter', 0),
(218, 'SARBATORI10', 'ginaoanea@yahoo.it ', '10', 'newsletter', 0),
(219, 'SARBATORI10', 'Fizesan.alina@yahoo.com', '10', 'newsletter', 0),
(220, 'SARBATORI10', 'elenaciocanea82@gmail.com', '10', 'newsletter', 1),
(221, 'SARBATORI10', 'anda.stefania93@gmail.com ', '10', 'newsletter', 0),
(222, 'SARBATORI10', 'manea.constanta@yahoo. com', '10', 'newsletter', 0),
(223, 'SARBATORI10', 'laura.marinescu87@yahoo.r', '10', 'newsletter', 0),
(224, 'SARBATORI10', 'antondelia472@gmail.com', '10', 'newsletter', 0),
(225, 'SARBATORI10', 'Gdtheking25@yahoo.com ', '10', 'newsletter', 0),
(226, 'SARBATORI10', 'bryanamarya@yahoo.com', '10', 'newsletter', 0),
(227, 'SARBATORI10', 'danieliftime73@gmail.com', '10', 'newsletter', 0),
(228, 'SARBATORI10', 'danieliftime73@gmail.comm', '10', 'newsletter', 0),
(229, 'SARBATORI10', 'alexandraluca44@gmail.com', '10', 'newsletter', 0),
(230, 'SARBATORI10', 'mihainicoleta08@yahoo.com ', '10', 'newsletter', 0),
(231, 'SARBATORI10', 'daniela4bubu@yahoo.comBuc', '10', 'newsletter', 0),
(232, 'SARBATORI10', 'e.neagu@asigest.ro', '10', 'newsletter', 0),
(233, 'SARBATORI10', 'padurecristina1991@yahoo.com', '10', 'newsletter', 0),
(234, 'SARBATORI10', 'amirea230@yahoo.com', '10', 'newsletter', 0),
(235, 'SARBATORI10', 'madalina.buraga13@gmail.com', '10', 'newsletter', 0),
(236, 'SARBATORI10', 'taneelena3@gmail.com ', '10', 'newsletter', 0),
(237, 'SARBATORI10', 'Constantinescu.aura.carmen@gmail.com', '10', 'newsletter', 0),
(238, 'SARBATORI10', 'bianca_mardare@yahoo.com', '10', 'newsletter', 0),
(239, 'SARBATORI10', 'Nneagu.maria@yahoo.com ', '10', 'newsletter', 0),
(240, 'SARBATORI10', 'mirela.ghita@raten.ro', '10', 'newsletter', 0),
(241, 'SARBATORI10', 'Ana07d@yahoo.com', '10', 'newsletter', 0),
(242, 'SARBATORI10', 'Claudia.enache@yahoo.com', '10', 'newsletter', 0),
(243, 'SARBATORI10', 'ginamanofu@yahoo.com', '10', 'newsletter', 0),
(244, 'SARBATORI10', 'Raluca.nastase32@yahoo.com ', '10', 'newsletter', 0),
(245, 'SARBATORI10', 'cristina.lauracarciumaru@gmail.com', '10', 'newsletter', 0),
(246, 'SARBATORI10', 'pantazi.daiana@gmail.com ', '10', 'newsletter', 1),
(247, 'SARBATORI10', 'tiberiu199516@yahoo.com', '10', 'newsletter', 0),
(248, 'SARBATORI10', 'bazilevschi.irina@yahoo.com', '10', 'newsletter', 0),
(249, 'SARBATORI10', 'lumispanu@gmail.com', '10', 'newsletter', 0),
(250, 'SARBATORI10', 'Mariaisabela324@yahoo.com', '10', 'newsletter', 0),
(251, 'SARBATORI10', 'dobrecristina1985@yahoo.ro', '10', 'newsletter', 1),
(252, 'SARBATORI10', 'Aleale555@yahoo.com', '10', 'newsletter', 0),
(253, 'SARBATORI10', 'ghita.cristinam@gmail.com', '10', 'newsletter', 1),
(254, 'SARBATORI10', 'Ionut_lex@yahoo.com', '10', 'newsletter', 0),
(255, 'SARBATORI10', '7neymar@gmail.com', '10', 'newsletter', 1),
(256, 'SARBATORI10', 'iuliana.dalu@gmail.com', '10', 'newsletter', 1),
(257, 'SARBATORI10', 'Cosmescu.madalina@yahoo.co.uk', '10', 'newsletter', 0),
(258, 'SARBATORI10', 'madw1909@yahoo.com', '10', 'newsletter', 0),
(259, 'SARBATORI10', 'miuadi@yahoo.com', '10', 'newsletter', 0),
(260, 'SARBATORI10', 'elena-madalina1288@yahoo.com', '10', 'newsletter', 0),
(261, 'SARBATORI10', 'Gabriela.adina96@yahoo.com', '10', 'newsletter', 0),
(262, 'SARBATORI10', 'sorana.u@icloud.com', '10', 'newsletter', 0),
(263, 'SARBATORI10', 'lavinia_dinut@yahoo.com', '10', 'newsletter', 0),
(264, 'SARBATORI10', 'danemonaaura@gmail.com', '10', 'newsletter', 0),
(265, 'SARBATORI10', 'Andreescu.monica11@gmail.com', '10', 'newsletter', 0),
(266, 'SARBATORI10', 'yoanna.grigore@gmail.com', '10', 'newsletter', 0),
(267, 'SARBATORI10', 'valentina_mh@yahoo.com ', '10', 'newsletter', 0),
(268, 'SARBATORI10', 'sergiu.mihalache@gmail.com', '10', 'newsletter', 1),
(269, 'SARBATORI10', 'Munteanuginaroxana@yahoo.com ', '10', 'newsletter', 0),
(270, 'SARBATORI10', 'adrianabudileanupopy@gmail.com', '10', 'newsletter', 0),
(271, 'SARBATORI10', 'georgianabenedeta@gmail.com', '10', 'newsletter', 0),
(272, 'SARBATORI10', 'Marinabalas1@gmail.com', '10', 'newsletter', 0),
(273, 'SARBATORI10', 'stanandreea0@gmail.com', '10', 'newsletter', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `shippingAddressId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `firstName`, `lastName`, `email`, `phone`, `shippingAddressId`) VALUES
(1, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 1),
(2, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 2),
(3, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 3),
(4, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 4),
(5, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 5),
(6, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 6),
(7, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 7),
(8, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 9),
(9, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 10),
(10, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 11),
(11, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 12),
(12, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 13),
(13, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 14),
(14, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 15),
(15, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 16),
(16, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 17),
(17, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 18),
(18, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 19),
(19, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 20),
(20, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 21),
(21, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 22),
(22, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 23),
(23, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 24),
(24, 'Diaba', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 25),
(25, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 26),
(26, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 27),
(27, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 28),
(28, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 29),
(29, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 30),
(30, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 31),
(31, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 32),
(32, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 33),
(33, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 34),
(34, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 35),
(35, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 36),
(36, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 37),
(37, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 38),
(38, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 39),
(39, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 40),
(40, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 41),
(41, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 42),
(42, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 43),
(43, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 44),
(44, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 45),
(45, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 46),
(46, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 47),
(47, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 48),
(48, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 49),
(49, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 50),
(50, 'Diana', 'Bria', 'dianasimona22@yahoo.com', '0758092348', 51),
(51, 'Diana', 'Bria', 'dianasimona11@yaho.com', '0758092348', 52),
(52, 'Diana', 'Bria', 'dianasimona11@yaho.com', '0758092348', 53),
(53, 'Diana', 'Bria', 'dianasimona11@yaho.com', '0758092348', 54),
(54, 'Xisnab', 'Vshss', 'dianasimona22@yahoo.com', '0758092348', 55),
(55, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 56),
(56, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 57),
(57, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 58),
(58, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 59),
(59, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 60),
(60, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 61),
(61, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 62),
(62, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 63),
(63, 'daniel', 'popa', 'daniel.popa@terra-agency.ro', '0761990600', 64),
(64, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 65),
(65, 'daniel', 'popa', 'daniel.popa@terra-agency.ro', '0761990600', 66),
(66, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 67),
(67, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 68),
(68, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 69),
(69, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 70),
(70, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 71),
(71, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 72),
(72, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 73),
(73, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 74),
(74, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 75),
(75, 'Ozdemir', 'Cristina', 'Cristina.ozdemir@europrim.ro', '0742011416', 76),
(76, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 77),
(77, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 78),
(78, 'daniel', 'daniel', 'danielpopa701@gmail.com', '0761990600', 79),
(79, 'Suruceanu ', 'Alexandru', 'sandusuruceanu48@gmail.com', '0722350309', 80),
(80, 'Suruceanu ', 'Alexandru', 'sandusuruceanu48@gmail.com', '0722350309', 81),
(81, 'amalia', 'popa', 'amalia@terra-agency.ro', '0721212121', 82),
(82, 'daniel', 'daniel', 'danielpopa701@gmail.com', '0761990600', 83),
(83, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 84),
(84, 'amalia', 'popa', 'amalia@terra-agency.ro', '0721212121', 85),
(85, 'amalia', 'popa', 'amalia@terra-agency.ro', '0721212121', 86),
(86, 'amalia', 'popa', 'articole@terra-agency.ro', '0721212121', 87),
(87, 'amalia', 'popa', 'articole@terra-agency.ro', '0721212121', 88),
(88, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 89),
(89, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 90),
(90, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 91),
(91, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 92),
(92, 'amalia', 'amalia', 'amalia@terra-agency.ro', '0721212121', 93),
(93, 'Alex', 'Alex', 'Alexalpha14i@gmail.com', '0724039697', 94),
(94, 'Laura', 'Dumitru', 'laurachivu_13@yahoo.com', '0722461834', 95),
(95, 'daniel', 'daniel', 'danielpopa701@gmail.com', '0761990600', 96),
(96, 'popa', 'daniel', 'danielpopa701@gmail.com', '0761990600', 97),
(97, 'daniel', 'daniel', 'bria.codrut@gmail.com', '0761990600', 98),
(98, 'daniel', 'dasdsa', 'daniel.popa@terra-agency.ro', '0761990600', 99),
(99, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 100),
(100, 'Alex', 'Alex', 'alexandru.manta@hotmail.com', '+40785696811', 101),
(101, 'daniel', 'daniel', 'danielpopa701@gmail.com', '0761990600', 102),
(102, 'Alex', 'Alex', 'alexandru.manta@hotmail.com', '+40785696811', 103),
(103, 'daniel', 'daniel', 'danielpopa701@gmail.com', '0761990600', 104),
(104, 'asdasd', 'asdada', 'asdad@asdasd.com', '90u450395', 105),
(105, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 106),
(106, 'amalia', 'amalia', 'amalia@terra-agency.ro', '0721212121', 107),
(107, 'Daniel', 'Daniel', 'Proiecte@terra-agency.ro', '0761990600', 108),
(108, 'Mihai', 'Luncasu', 'mihai.luncasu.liviu@gmail.com', '0720968794', 109),
(109, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 110),
(110, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 111),
(111, 'amalia', 'amalia', 'amalia@terra-agency.ro', '0721212121', 112),
(112, 'Diaba ', 'Brus', 'Dianasimona22@yahoo.com', '0758092348', 113),
(113, 'Daniel', 'Bria', 'bria.codrut@gmail.com', '0760504055', 114),
(114, 'Daniel', 'Bria', 'bria.codrut@gmail.com', '0760504055', 115),
(115, 'Elena', 'Hkfds', 'Dianasimona22@yahoo.com', '0758092348', 116),
(116, 'Ggjj', 'Lla', 'Dianasimona22@yahoo.com', '0758092348', 117),
(117, 'Laala', 'Gogu', 'Dianasimona22@yahoo.com', '0758092348', 118),
(118, 'amalia', 'amalia', 'amalia@terra-agency.ro', '0721212121', 125),
(119, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 126),
(120, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 127),
(121, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 128),
(122, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 129),
(123, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 130),
(124, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 131),
(125, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 132),
(126, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 133),
(127, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 134),
(128, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 135),
(129, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 136),
(130, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 137),
(131, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 138),
(132, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 139),
(133, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 140),
(134, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 141),
(135, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 142),
(136, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 143),
(137, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 144),
(138, 'Ciocanel', 'Daniela', 'daniela.fartat@yahoo.com', '074744408', 145),
(139, 'Ciocanel', 'Daniel', 'daniela.fartat@yahoo.com', '0747444408', 146),
(140, 'Amalia', 'Amalia', 'amaliacozma1988@gmail.com', '0761990600', 147),
(141, 'Gggg', 'Uuu', 'Dianasimona22@yahoo.com', '0758092348', 148),
(142, 'Minca', 'Marius', 'mariusminca@yahoo.com', '0724323600', 149),
(143, 'GIOSAN', 'MATEI', 'mateigiosan97@gmail.com', '0731271361/0744797380', 150),
(144, 'buleandra', 'andrei', 'andrei.buleandra@yahoo.com', '0748322113', 151),
(145, 'Alex', 'Alex', 'alexandru.manta@hotmail.com', '0785696811', 152),
(146, 'daniel', 'daniel', 'danyadase@yahoo.com', '0761990600', 153),
(147, 'Musetoiu', 'Adelina', 'adelynacosmyna@yahoo.com', '0727792201', 154),
(148, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 155),
(149, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 156),
(150, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 157),
(151, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 158),
(152, 'Calikoglu', 'Claudia', 'Claudia.enache@yahoo.com', '0723026291', 159),
(153, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 160),
(154, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 161),
(155, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 162),
(156, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 163),
(157, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 164),
(158, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 165),
(159, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 166),
(160, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 167),
(161, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 168),
(162, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 169),
(163, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 170),
(164, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 171),
(165, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 172),
(166, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 173),
(167, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 174),
(168, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 175),
(169, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 176),
(170, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 177),
(171, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 178),
(172, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 179),
(173, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 180),
(174, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '+40785696811', 181),
(175, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 182),
(176, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 183),
(177, 'Alex Manta', '', 'alexandru.manta@hotmail.com', '+40785696811', 184),
(178, 'Alex', 'manta', 'alexandru.manta@hotmail.com', '0785696811', 185),
(179, 'daniel', 'popa', 'danielpopa701@gmail.com', '0761990600', 186),
(180, 'Spanu', 'Luminita', 'lumispanu@gmail.com', '0721726782', 187),
(181, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 188),
(182, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 189),
(183, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 190),
(184, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 191),
(185, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 192),
(186, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 193),
(187, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 194),
(188, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 195),
(189, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 196),
(190, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 197),
(191, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 198),
(192, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 199),
(193, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 200),
(194, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 201),
(195, 'Dobre', 'Cristina ', 'dobrecristina1985@yahoo.ro', '0763107466', 202),
(196, 'Ghita', 'Cristina', 'Ghita.cristinam@gmail.com', '0722213883', 203),
(197, 'Mindreanu', 'Mihai', '7neymar@gmail.com', '0766547911', 204),
(198, 'Mihalache', 'Sergiu', 'sergiu.mihalache@gmail.com', '0744268918', 205);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_uuid` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `method` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `deliverydate` varchar(255) NOT NULL,
  `intervaldelivery` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_uuid`, `discount`, `total`, `method`, `notes`, `customerId`, `user_id`, `address_id`, `deliverydate`, `intervaldelivery`, `date`) VALUES
(1, '5fda730360f600.18324356', 0, 37, 'card', 'asdadas', 2, 0, 0, '', '', '2021-02-01 22:29:02'),
(2, '5fda7342e1e9e5.41057354', 0, 37, 'card', 'asdadas', 3, 0, 0, '', '', '2021-02-01 22:29:02'),
(3, '5fda73c1499970.11776139', 0, 477, 'numerar', 'asdadas', 4, 0, 0, '', '', '2021-02-01 22:29:02'),
(4, '5fda74faabd968.33185057', 0, 814, 'card', 'asdada', 6, 0, 0, '', '', '2021-02-01 22:29:02'),
(5, '5fda751b71b8b8.07270112', 0, 814, 'card', 'asdada', 7, 0, 0, '', '', '2021-02-01 22:29:02'),
(6, '5fe11158f161e5.31838284', 0, 187, 'numerar', 'Test test', 8, 0, 0, '', '', '2021-02-01 22:29:02'),
(7, '5fe1151c5c85b2.54148623', 0, 357, 'numerar', 'Test', 9, 0, 0, '', '', '2021-02-01 22:29:02'),
(8, '5fe1183aae3171.84205576', 0, 170, 'numerar', 'Nou', 10, 0, 0, '', '', '2021-02-01 22:29:02'),
(9, '5fe11e21d2e0a6.70664135', 0, 830, 'card', 'test', 11, 0, 0, '', '', '2021-02-01 22:29:02'),
(10, '5fe12032758d09.08574546', 0, 180, 'card', 'noutate', 12, 0, 0, '', '', '2021-02-01 22:29:02'),
(11, '5fe59a20132827.92357398', 10, 158, 'card', 'test', 13, 0, 0, '', '', '2021-02-01 22:29:02'),
(12, '5fe5f544f1bb11.63714651', 0, 170, 'card', 'Scris la multi ani', 50, 0, 0, '', '', '2021-02-01 22:29:02'),
(13, '5fe5f7d8777a88.44579586', 0, 180, 'numerar', 'La multi ani', 54, 0, 0, '', '', '2021-02-01 22:29:02'),
(14, '5fe75699e65cd8.48459075', 0, 508, 'numerar', 'bjasnhdjhas', 55, 0, 0, '', '', '2021-02-01 22:29:02'),
(15, '5fe86e4520ca42.22783290', 0, 175, 'card', 'Testnew', 56, 0, 0, '', '', '2021-02-01 22:29:02'),
(16, '5fe86e4851b938.35373720', 0, 175, 'card', 'Testnew', 57, 0, 0, '', '', '2021-02-01 22:29:02'),
(17, '5fe86e4930e898.45570581', 0, 175, 'card', 'Testnew', 58, 0, 0, '', '', '2021-02-01 22:29:02'),
(18, '5fe86e55adc8d9.70635495', 0, 175, 'card', 'Testnew', 59, 0, 0, '', '', '2021-02-01 22:29:02'),
(19, '5fe881787edf88.58440935', 0, 588, 'card', 'asdada', 60, 0, 0, '', '', '2021-02-01 22:29:02'),
(20, '5fe881f86c6794.76045939', 0, 588, 'card', 'asdada', 61, 0, 0, '', '', '2021-02-01 22:29:02'),
(21, '5fe8821fd36d16.83430178', 0, 588, 'card', 'asdada', 62, 0, 0, '', '', '2021-02-01 22:29:02'),
(22, '5fe883c142a1c7.80977759', 0, 175, 'numerar', 'Gdhhdhdbhd', 63, 0, 0, '', '', '2021-02-01 22:29:02'),
(23, '5fe88494bc4f31.97901861', 0, 144, 'card', 'fdfxcf', 64, 0, 0, '', '', '2021-02-01 22:29:02'),
(24, '5fe88947e05d03.63571325', 10, 153, 'card', 'Ghzhh', 65, 0, 0, '', '', '2021-02-01 22:29:02'),
(25, '5feb4fe9630ed4.06071933', 0, 175, 'card', 'Test', 76, 0, 0, '', '', '2021-02-01 22:29:02'),
(26, '5feb5270dc46c9.55304002', 0, 245, 'numerar', 'dasdas', 77, 0, 0, '', '', '2021-02-01 22:29:02'),
(27, '5feb544ef00ed3.73198716', 0, 307, 'card', 'test daniel popa', 78, 0, 0, '', '', '2021-02-01 22:29:02'),
(28, '5feb87ee3950a5.63089815', 0, 175, 'numerar', 'nimic', 81, 0, 0, '', '', '2021-02-01 22:29:02'),
(29, '5feb88a293c527.16108709', 0, 731, 'numerar', 'test 29.12', 82, 0, 0, '', '', '2021-02-01 22:29:02'),
(30, '5feb8a94207796.30611458', 10, 647, 'card', 'Test mobil 29.12', 83, 0, 0, '', '', '2021-02-01 22:29:02'),
(31, '5feb8c89daa449.64999028', 0, 170, 'numerar', 'x', 85, 0, 0, '', '', '2021-02-01 22:29:02'),
(32, '5fec565a98eee0.56185872', 0, 170, 'numerar', 'aaa', 87, 0, 0, '', '', '2021-02-01 22:29:02'),
(33, '5fec5977de2131.45257006', 0, 102, 'card', '', 90, 0, 0, '31.12.2020', 'Intre: 16:00 - 20:00', '2021-02-01 22:29:02'),
(34, '5fec5ad42519a3.27190105', 0, 102, 'numerar', '', 91, 0, 0, '31.12.2020', 'Intre: 16:00 - 20:00', '2021-02-01 22:29:02'),
(35, '5fec5af0e37d89.84744838', 0, 418, 'numerar', '', 92, 0, 0, '31.12.2020', 'Intre: 16:00 - 20:00', '2021-02-01 22:29:02'),
(36, '5fec61734bea73.58955400', 0, 1200, 'numerar', 'Gsgsg', 93, 0, 0, '31.12.2020', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(37, '5fec61a2281f27.36417816', 0, 266, 'numerar', '', 94, 0, 0, '31.12.2020', 'Intre: 16:00 - 20:00', '2021-02-01 22:29:02'),
(38, '5fec61f94c9296.10449515', 0, 603, 'numerar', 'dasdasdasd', 95, 0, 0, '31.12.2020', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(39, '5fec70fb8a3ff3.12041952', 0, 242, 'numerar', 'dasdsadsa', 96, 0, 0, '31.12.2020', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(40, '5fec72be1a4bd8.21719346', 0, 410, 'numerar', '', 97, 0, 0, '31.12.2020', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(41, '5fec737e9f82f3.57642636', 0, 575, 'numerar', 'fdsfds', 98, 0, 0, '31.12.2020', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(42, '5fec73aa811828.90158839', 0, 408, 'card', '', 99, 0, 0, '30.12.2020', 'Maine intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(43, '5fec7542de0779.67387979', 0, 394, 'numerar', '', 100, 0, 0, '31.12.2020', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(44, '5fec75c40c0c38.59834070', 0, 197, 'numerar', '', 101, 0, 0, '31.12.2020', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(45, '5fec77234b8529.38306549', 0, 408, 'card', '', 102, 0, 0, '31.12.2020', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(46, '5fec7753289c23.64096122', 0, 170, 'numerar', '', 103, 0, 0, '31.12.2020', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(47, '5fec7917086434.76834534', 0, 408, 'card', '', 104, 0, 0, '31.12.2020', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(48, '5fec7a69bb8132.70867222', 0, 170, 'numerar', '', 105, 0, 0, '31.12.2020', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(49, '5fec7aa0659c37.87599381', 0, 408, 'numerar', '', 106, 0, 0, '31.12.2020', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(50, '5fec898d6d0092.28398483', 10, 176, 'card', '', 107, 0, 0, '7.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(51, '5fecd226251296.69593588', 10, 162, 'card', 'Interfon 142, etaj 6, ap 142, scarab B', 108, 0, 0, '31.12.2020', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(52, '5fecf00b3ec6f4.81028942', 0, 525, 'numerar', 'asddasd', 109, 0, 0, '31.12.2020', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(53, '5fed96a43c7dd6.70492357', 0, 126, 'numerar', '', 110, 0, 0, '31.12.2020', 'Maine intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(54, '5fed9c40a8c613.37269936', 0, 170, 'numerar', '', 111, 0, 0, '31.12.2020', 'Maine intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(55, '5ff04359eedac6.33633598', 0, 170, 'numerar', '', 112, 0, 0, '7.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(56, '5ff0446d0965a0.99731154', 0, 102, 'numerar', 'Dfgg', 113, 0, 0, '7.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(57, '5ff047ba06cec8.14605208', 0, 170, 'numerar', '', 114, 0, 0, '7.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(58, '5ff0d2d83ec748.82563417', 0, 132, 'card', '', 115, 0, 0, '7.1.2021', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(59, '5ff444c8745814.71028395', 0, 170, 'card', '', 116, 0, 0, '9.1.2021', 'Intre: 16:00 - 20:00', '2021-02-01 22:29:02'),
(60, '5ff572d62ca4d7.21222096', 0, 188, 'numerar', '', 117, 0, 0, '8.1.2021', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(61, '5ff59c3c8e01f2.55686869', 0, 175, 'numerar', '', 118, 0, 0, '8.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(62, '5ff5ae903f8de3.99157750', 10, 166, 'card', 'Buna ziua!\n\nSe poate livra pe 8.01.2020 - in jurul orei 10?\n\nMultumesc', 139, 0, 0, '8.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(63, '5ff6133284a1c0.82308812', 0, 340, 'numerar', '', 140, 0, 0, '7.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(64, '5ff6169a3ff137.64810868', 0, 408, 'card', 'Scris lma ', 141, 0, 0, '7.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(65, '60016c9dc59c46.42303192', 10, 166, 'numerar', 'Este ziua mea de nastere si as dori sa se livreze in intervalul orar 12-13. Va rog sa-mi puneti RO pe bonul fiscal: RO36522960. ', 142, 0, 0, '16.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(66, '6007204fefd865.26727910', 0, 185, 'card', 'Va rog sa il livrati vineri incepand cu ora 18, daca este posibil.. Multumesc mult .', 143, 0, 0, '22.1.2021', 'Intre: 16:00 - 20:00', '2021-02-01 22:29:02'),
(67, '6008772b168044.92715373', 0, 360, 'card', '', 144, 0, 0, '23.1.2021', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(68, '60088b20e7f481.26679223', 10, 166, 'card', 'Aceasta este o comanda de test', 145, 0, 0, '23.1.2021', 'Intre: 14:00 - 16:00', '2021-02-01 22:29:02'),
(69, '60088b2b3f1ed5.08628845', 10, 360, 'numerar', '', 146, 0, 0, '22.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(70, '600a920a76fb23.42791905', 10, 103, 'card', 'Doresc livrarea maine, 23.01.2021.\n', 147, 0, 0, '23.1.2021', 'Intre: 12:00 - 14:00', '2021-02-01 22:29:02'),
(71, '60199c895ef120.28701510', 0, 185, 'numerar', '', 149, 1, 1, '26.2.2021', 'Intre: 16:00 - 20:00', '2021-02-02 18:40:09'),
(72, '6019afe8671332.86682212', 0, 185, 'numerar', '', 150, 1, 2, '24.2.2021', 'Intre: 16:00 - 20:00', '2021-02-02 20:02:48'),
(73, '6019b36ae569d3.89408956', 0, 185, 'numerar', '', 151, 1, 2, '26.2.2021', 'Intre: 16:00 - 20:00', '2021-02-02 20:17:46'),
(74, '601a8c25eb9d51.82898287', 0, 170, 'card', 'Mesaj pe tort\nSENI SEVIYORUM BABISH', 152, 0, 0, '7.2.2021', 'Intre: 14:00 - 16:00', '2021-02-03 11:42:29'),
(75, '602176f1069b03.48615094', 0, 816, 'numerar', '', 153, 1, 2, '26.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 17:37:53'),
(76, '6021774d4c6e59.92378898', 0, 816, 'numerar', '', 154, 1, 2, '26.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 17:39:25'),
(77, '60217be7a3f2c5.39966458', 0, 816, 'card', '', 155, 1, 2, '26.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 17:59:03'),
(78, '60217f05e68f57.21270673', 0, 1244, 'numerar', '', 156, 1, 2, '7.4.2021', 'Intre: 12:00 - 14:00', '2021-02-08 18:12:21'),
(79, '60218029b66e54.11534594', 0, 1244, 'numerar', '', 157, 1, 2, '26.2.2021', 'Intre: 14:00 - 16:00', '2021-02-08 18:17:13'),
(80, '60218149d66d64.12178336', 0, 1244, 'numerar', '', 158, 1, 2, '26.2.2021', 'Intre: 14:00 - 16:00', '2021-02-08 18:22:01'),
(81, '602182059de647.18927535', 0, 1244, 'numerar', '', 159, 1, 2, '26.2.2021', 'Intre: 14:00 - 16:00', '2021-02-08 18:25:09'),
(82, '6021825727b484.91562987', 0, 1244, 'numerar', '', 160, 1, 2, '26.2.2021', 'Intre: 14:00 - 16:00', '2021-02-08 18:26:31'),
(83, '602182fe16b0c3.01178409', 0, 1244, 'numerar', '', 161, 1, 2, '26.2.2021', 'Intre: 14:00 - 16:00', '2021-02-08 18:29:18'),
(84, '60218331530153.85238718', 0, 1244, 'numerar', '', 162, 1, 2, '26.2.2021', 'Intre: 14:00 - 16:00', '2021-02-08 18:30:09'),
(85, '6021834b8c4a72.41400611', 0, 1244, 'numerar', '', 163, 1, 2, '26.2.2021', 'Intre: 14:00 - 16:00', '2021-02-08 18:30:35'),
(86, '602183a0a3e1e7.52771441', 0, 1244, 'numerar', '', 164, 1, 2, '26.2.2021', 'Intre: 14:00 - 16:00', '2021-02-08 18:32:00'),
(87, '60219647cb1101.73167284', 0, 1244, 'numerar', '', 165, 1, 2, '25.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 19:51:35'),
(88, '6021965e66e828.81830882', 0, 1244, 'numerar', '', 166, 1, 2, '25.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 19:51:58'),
(89, '6021968226c4d7.73780250', 0, 1244, 'numerar', '', 167, 1, 2, '25.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 19:52:34'),
(90, '602196ccdf4b20.04921647', 0, 1244, 'numerar', '', 168, 1, 2, '25.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 19:53:48'),
(91, '602196e0d4f236.58880261', 0, 1244, 'numerar', '', 169, 1, 2, '25.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 19:54:08'),
(92, '602196efccbf10.30796129', 0, 1244, 'numerar', '', 170, 1, 2, '25.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 19:54:23'),
(93, '602196ff7cdc02.29300433', 0, 1244, 'numerar', '', 171, 1, 2, '25.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 19:54:39'),
(94, '602197a14bdc66.11802905', 0, 1244, 'numerar', '', 172, 1, 2, '25.2.2021', 'Intre: 16:00 - 20:00', '2021-02-08 19:57:21'),
(95, '60228c60e1ae73.54405100', 0, 428, 'numerar', 'bjbjbj', 173, 0, 0, '17.2.2021', 'Intre: 16:00 - 20:00', '2021-02-09 13:21:36'),
(96, '60228cbdd00f31.74679092', 0, 428, 'numerar', 'bjbjbj', 174, 0, 0, '17.2.2021', 'Intre: 16:00 - 20:00', '2021-02-09 13:23:09'),
(97, '602293d40f3b59.15361117', 0, 428, 'card', 'comanda de test', 175, 1, 2, '4.3.2021', 'Intre: 16:00 - 20:00', '2021-02-09 13:53:24'),
(98, '6022abf3698f48.22648753', 0, 618, 'numerar', 'comanda de test', 176, 1, 2, '14.3.2021', 'Intre: 16:00 - 20:00', '2021-02-09 15:36:19'),
(99, '6022aec43c3fe6.05403781', 0, 428, 'numerar', 'comanda de test', 177, 1, 2, '25.2.2021', 'Intre: 16:00 - 20:00', '2021-02-09 15:48:20'),
(100, '602462d0bd2505.15327137', 0, 120, 'numerar', 'comanda de test', 178, 0, 0, '24.2.2021', 'Intre: 16:00 - 20:00', '2021-02-10 22:48:48'),
(101, '6024cf6d141356.61136294', 0, 508, 'numerar', '', 179, 0, 0, '24.2.2021', 'Intre: 14:00 - 16:00', '2021-02-11 06:32:13'),
(102, '6026afa54d7802.80720537', 0, 180, 'card', '', 180, 0, 0, '13.2.2021', 'Intre: 14:00 - 16:00', '2021-02-12 16:41:09'),
(103, '6027b7c4611ee3.75532277', 10, 126, 'card', 'Se poate un mesaj pe tort? Daca da, as vrea sa scrie \"Happy last V-Day 2gether!\". Multumesc! Eventual scoateti decorul cu fructe si il lasati doar pe cel cu inima. Multumesc', 196, 0, 0, '14.2.2021', 'Intre: 12:00 - 14:00', '2021-02-13 11:28:04'),
(104, '6027f17db18778.32701833', 10, 126, 'card', 'Buna ziua, vreau sa fie livrata comanda maine 14.02 la ora 19:00 la adresa specificata mai sus, daca ajunge mai devreme nu o sa gaseasca pe nimeni acasa. Multumesc!', 197, 0, 0, '14.2.2021', 'Intre: 16:00 - 20:00', '2021-02-13 15:34:21'),
(105, '602cf1d4e37095.36765297', 10, 173, 'card', 'Am dori pe tort, pe langa mesaj, si simbolul din aceasta imagine https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Venus_symbol.svg/768px-Venus_symbol.svg.png', 198, 0, 0, '20.2.2021', 'Intre: 12:00 - 14:00', '2021-02-17 10:37:08');

-- --------------------------------------------------------

--
-- Table structure for table `orders_accessories`
--

CREATE TABLE `orders_accessories` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `ProductOrderID` int(11) NOT NULL,
  `accessory_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `AccessoryID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_accessories`
--

INSERT INTO `orders_accessories` (`id`, `order_id`, `ProductOrderID`, `accessory_name`, `price`, `AccessoryID`) VALUES
(1, 5, 0, 'Lumanari Aurii', 10, 1),
(2, 5, 0, 'Lumanari Roz', 10, 2),
(3, 10, 0, 'Lumanari Aurii', 10, 1),
(4, 13, 0, 'Lumanari Roz', 10, 2),
(5, 14, 0, 'Lumanari Roz', 10, 2),
(6, 19, 0, 'Lumanari Roz', 10, 2),
(7, 20, 0, 'Lumanari Roz', 10, 2),
(8, 21, 0, 'Lumanari Roz', 10, 2),
(9, 35, 0, 'Lumanari Roz', 10, 2),
(10, 40, 0, 'Lumanari Roz', 10, 2),
(11, 50, 0, 'Lumanari Roz', 10, 2),
(12, 51, 0, 'Lumanari Aurii', 10, 1),
(13, 66, 0, 'Lumanari Roz', 10, 2),
(14, 94, 150, 'Lumanari Aurii', 10, 1),
(15, 94, 150, 'Lumanari Roz', 10, 2),
(16, 95, 151, 'Lumanari Aurii', 10, 1),
(17, 95, 151, 'Lumanari Roz', 10, 2),
(18, 96, 152, 'Lumanari Aurii', 10, 1),
(19, 96, 152, 'Lumanari Roz', 10, 2),
(20, 97, 153, 'Lumanari Aurii', 10, 1),
(21, 97, 153, 'Lumanari Roz', 10, 2),
(22, 98, 154, 'Lumanari Aurii', 10, 1),
(23, 98, 154, 'Lumanari Roz', 10, 2),
(24, 98, 155, 'Lumanari Aurii', 10, 1),
(25, 98, 155, 'Lumanari Roz', 10, 2),
(26, 99, 156, 'Lumanari Aurii', 10, 1),
(27, 99, 156, 'Lumanari Roz', 10, 2),
(28, 105, 164, 'Lumanari Aurii', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_shipping_address`
--

CREATE TABLE `orders_shipping_address` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `county` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_shipping_address`
--

INSERT INTO `orders_shipping_address` (`id`, `address`, `county`, `town`) VALUES
(1, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(2, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(3, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(4, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(5, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(6, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(7, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(8, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(9, 'Test test ', 'Bucuresti', 'Bucuresti'),
(10, 'Bucuresti sect 2 ', 'Bucuresti', 'Bucuresti'),
(11, 'Nou nou ', 'Bucuresti', 'Bucuresti'),
(12, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(13, 'delfinului 5467 ', 'Bucuresti', 'Bucuresti'),
(14, 'Soseaua Pantelimon Nr. 352 ', 'Bucuresti', 'BUCURESTI'),
(15, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(16, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(17, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(18, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(19, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(20, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(21, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(22, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(23, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(24, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(25, 'Bucuresti stra mircea voda ', 'Bucuresti', 'Bucuresti'),
(26, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(27, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(28, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(29, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(30, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(31, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(32, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(33, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(34, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(35, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(36, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(37, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(38, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(39, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(40, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(41, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(42, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(43, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(44, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(45, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(46, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(47, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(48, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(49, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(50, 'Bucuresti ', 'Bucuresti', 'Bucuresti'),
(51, 'Mircea voda 40 ', 'Bucuresti sector 3', 'Bucuresti'),
(52, 'Aurorei nr. 4 ', 'Sector 1', 'Bucuresti'),
(53, 'Aurorei nr. 4 ', 'Sector 1', 'Bucuresti'),
(54, 'Aurorei nr. 4 ', 'Sector 1', 'Bucuresti'),
(55, 'Bucuresti Sect 3', 'Sector 2 ', 'Bucuresti'),
(56, 'Bb:bbb, 34dksfkkfjsljf;s ', 'Bucuresti', 'Bucuresti'),
(57, 'Bb:bbbadresabbb undefined', 'Bucuresti', 'Bucuresti'),
(58, 'Bb:bbbadresabbb undefined', 'Bucuresti', 'Bucuresti'),
(59, 'Bb:bbbadresabbb undefined', 'Bucuresti', 'Bucuresti'),
(60, 'Bb:bbbadresabbb undefined', 'Bucuresti', 'Bucuresti'),
(61, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(62, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(63, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(64, 'Bb:bbbbchjdjjxjhdh undefined', 'Bucuresti', 'Bucuresti'),
(65, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(66, 'Bb:bbbhzhhz undefined', 'Bucuresti', 'Bucuresti'),
(67, 'Str. Ziduri intre Vii, nr. 19, complex Doamna Ghica Plaza Bl. G, etaj 4, ap.41', 'Bucuresti', 'Bucuresti'),
(68, 'Str. Ziduri intre Vii, nr. 19, complex Doamna Ghica Plaza Bl. G, etaj 4, ap.41', 'Bucuresti', 'Bucuresti'),
(69, 'Str. Ziduri intre Vii, nr. 19, complex Doamna Ghica Plaza Bl. G, etaj 4, ap.41', 'Bucuresti', 'Bucuresti'),
(70, 'Str. Ziduri intre Vii, nr. 19, complex Doamna Ghica Plaza Bl. G, etaj 4, ap.41', 'Bucuresti', 'Bucuresti'),
(71, 'Str. Ziduri intre Vii, nr. 19, complex Doamna Ghica Plaza Bl. G, etaj 4, ap.41', 'Bucuresti', 'Bucuresti'),
(72, 'Str. Ziduri intre Vii, nr. 19, complex Doamna Ghica Plaza Bl. G, etaj 4, ap.41', 'Bucuresti', 'Bucuresti'),
(73, 'Str. Ziduri intre Vii, nr. 19, complex Doamna Ghica Plaza Bl. G, etaj 4, ap.41', 'Bucuresti', 'Bucuresti'),
(74, 'Str. Ziduri intre Vii, nr. 19, complex Doamna Ghica Plaza Bl. G, etaj 4, ap.41', 'Bucuresti', 'Bucuresti'),
(75, 'Str. Ziduri intre Vii, nr. 19, complex Doamna Ghica Plaza Bl. G, etaj 4, ap.41', 'Bucuresti', 'Bucuresti'),
(76, 'Str. Ziduri între Vii, nr. 19, Complex Dna. Ghica Plaza Bloc G, al.41, etaj 4', 'Bucuresti', 'Bucuresti'),
(77, 'Test test undefined', 'Bucuresti', 'Bucuresti'),
(78, 'Test test undefined', 'Bucuresti', 'Bucuresti'),
(79, 'Test test nou undefined', 'Bucuresti', 'Bucuresti'),
(80, 'Str Ciucea nr 5bloc L19 SC B apt 59 etaj 8 undefined', 'Ilfov', 'Bucuresti'),
(81, 'Str Ciucea nr 5bloc L19 SC B apt 59 etaj 8 undefined', 'Ilfov', 'Bucuresti'),
(82, 'strada sperantei undefined', 'bucuresti', 'bucuresti'),
(83, 'test 29.12 undefined', 'Bucuresti', 'Bucuresti'),
(84, 'Test mobil 29.12 undefined', 'Bucuresti', 'Bucuresti'),
(85, 'strada sperantei undefined', 'bucuresti', 'bucuresti'),
(86, 'strada sperantei undefined', 'bucuresti', 'bucuresti'),
(87, 'strada sperantei undefined', 'bucuresti', 'bucuresti'),
(88, 'strada sperantei undefined', 'bucuresti', 'bucuresti'),
(89, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(90, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(91, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(92, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(93, 'amalia undefined', 'amalia', 'amalia'),
(94, 'Aaaa undefined', 'Bbbb', 'Bbbb'),
(95, 'Ceair Nr 61 undefined', 'Ilfov', 'Tunari'),
(96, 'Test test undefined', 'Bucuresti', 'Bucuresti'),
(97, 'strada sperantei undefined', 'bucuresti', 'bucuresti'),
(98, 'strada sperantei undefined', 'bucuresti', 'bucuresti'),
(99, 'asddsads undefined', 'bucuresti', 'bucuresti'),
(100, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(101, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(102, 'Test test undefined', 'Bucuresti', 'Bucuresti'),
(103, 'Cosmopolis, Stefanestii de jos, Nr1B 001 undefined', 'Bucuresti', 'BUCURESTI'),
(104, 'Test test undefined', 'Bucuresti', 'Bucuresti'),
(105, 'sdfsfdsf undefined', 'sdfsfs', 'sdfsfds'),
(106, 'Test test undefined', 'Bucuresti', 'Bucuresti'),
(107, 'bucuresti undefined', 'bucuresti', 'bucuresti'),
(108, 'Str delf undefined', 'Bucuresti', 'Bucuresti'),
(109, 'Prelungirea Ghencea nr 38 40 undefined', 'Bucuresti', 'Bucuresti'),
(110, 'Test test 1234 undefined', 'Bucuresti', 'Bucuresti'),
(111, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(112, 'bucuresti undefined', 'bucuresti', 'bucuresti'),
(113, 'Mircea vod 40 undefined', 'Bucuresti', 'Bucuresti'),
(114, 'Str aurorei nr 4 undefined', 'Bucuresti ', 'Bucuresti '),
(115, 'Str aurorei br4 undefined', 'Bucuresti ', 'Bucuresti '),
(116, 'Cosmopolis undefined', 'Ilfov', 'Stefanestii de jos'),
(117, 'Mircea boda 40 undefined', 'Sector 1', 'Bucuresti'),
(118, 'Stefanestii de jos  undefined', 'Ilfov ', 'Sefanestii de jos'),
(119, 'Bd. Timisoara, Nr. 103L, Tronson 2, Et.3, Ap. 91 undefined', 'Sector 6', 'Bucuresti '),
(120, 'Bd. Timisoara, Nr. 103L, Tronson 2, Et.3, Ap. 91 undefined', 'Sector 6', 'Bucuresti '),
(121, 'Bd. Timisoara, Nr. 103L, Tronson 2, Et.3, Ap. 91 undefined', 'Sector 6', 'Bucuresti '),
(122, 'Bd. Timisoara, Nr. 103L, Tronson 2, Et.3, Ap. 91 undefined', 'Sector 6', 'Bucuresti '),
(123, 'Bd. Timisoara, Nr. 103L, Tronson 2, Et.3, Ap. 91 undefined', 'Sector 6', 'Bucuresti '),
(124, 'Bd. Timisoara, Nr. 103L, Tronson 2, Et. 3, Ap. 91 undefined', 'Bucuresti/ Sector 6', 'Bucuresti '),
(125, 'bucuresti undefined', 'bucuresti', 'bucuresti'),
(126, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(127, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(128, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(129, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(130, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(131, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(132, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(133, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(134, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(135, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(136, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(137, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(138, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(139, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(140, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(141, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(142, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(143, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(144, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(145, 'Strada Lavandei, nr 3, n21-C2-03, complex cosmopolis, stefanestii de jos, ilfov undefined', 'Ilfov', 'Stefanestii de jos'),
(146, 'Lavandei nr 3, N21C2-003, Cosmopolis undefined', 'Ilfov', 'Stefanestii de Jos'),
(147, 'Bucuresti undefined', 'Bucuresti', 'Bucureari'),
(148, 'Mirc v 40 undefined', 'Ilfov ', 'Stefanestii de jos '),
(149, 'Str. Sanzienelor nr 1, Cosmopolis, bl B13, sc 1, et 2, ap 201 undefined', 'Ilfov', 'Stefanestii de Jos'),
(150, 'Cosmopolis, str. Libertatii, nr. 2 , bloc I6, sc A, ap 102 undefined', 'Ilfov', 'Stefanestii de Jos'),
(151, 'paraul rece nr 5 undefined', 'ilfov', 'popesti leordeni'),
(152, 'Soseaua Pantelimon Nr. 352 undefined', 'Bucuresti', 'BUCURESTI'),
(153, 'Test test undefined', 'Bucuresti', 'Bucuresti'),
(154, 'Drm.Padurea Neagra nr 19-85,bl 31 B ap 26 Sector 1 , Cartier Greenfield', 'Bucuresti', 'Bucuresti'),
(155, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73 undefined', 'Bucuresti', 'BUCURESTI'),
(156, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73 undefined', 'Bucuresti', 'BUCURESTI'),
(157, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(158, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(159, 'Cosmopolis;str Fericirii;vila N16-A1-01 undefined', 'Ilfov', 'Stefanesti de jos'),
(160, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(161, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(162, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(163, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(164, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(165, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(166, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(167, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(168, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(169, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(170, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(171, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(172, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(173, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(174, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(175, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(176, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(177, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(178, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(179, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(180, 'Soseaua Pantelimon Nr. 352', 'Bucuresti', 'BUCURESTI'),
(181, 'Soseaua Pantelimon Nr. 352', 'Bucuresti', 'BUCURESTI'),
(182, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(183, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(184, 'Soseaua Pantelimon Nr. 352, Bl. 3, Sc. B, Etj. 9, Apt. 73', 'Bucuresti', 'BUCURESTI'),
(185, 'Soseaua Pantelimon Nr. 352', 'Bucuresti', 'BUCURESTI'),
(186, 'Test test vday', 'Bucuresti', 'Bucuresti'),
(187, 'Str. Florilor nr. 11, bloc J1A, etaj 3, apt. 301', 'Ilfov', 'Cosmopolis'),
(188, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(189, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(190, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(191, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(192, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(193, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(194, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(195, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(196, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(197, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(198, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(199, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(200, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(201, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(202, 'Bdul Alexandru Obregia Nr 20 bis sector 4', 'Bucuresti', 'Bucuresti '),
(203, 'Str. Ciresar, nr. 14, bl. 1, sc. A, ap. 42, etj. 4 Interfon 42', 'Ilfov', 'Bragadiru'),
(204, 'Aleea Valea Prahovei,Nr 2, Bl 7S14, et 3, ap 43, interfon 43 C', 'Sector 6', 'Bucuresti'),
(205, 'str. Fericirii nr. 1, bl. N16D2, ap. 5', 'Ilfov', 'Stefanestii de Jos');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `description` text NOT NULL,
  `descriptionInfo` text DEFAULT NULL,
  `ingredients` text NOT NULL,
  `active` tinyint(4) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `alias`, `CategoryID`, `description`, `descriptionInfo`, `ingredients`, `active`) VALUES
(1, 'Tort LOL Surprise', 'tort-lol-surprise', 4, 'Tort decor LOL Surprise, decorat cu buttercream, pasta de zahar si imagini comestibile', '<p>Tort decor LOL Surprise, decorat cu buttercream, pasta de zahar si imagini comestibile.</p>\r\n\r\n<p>Tortul poate fi realizat folosind compozitia preferata: Tort Blanche Fraise | Tort Madagascar | Tort Latte Framboise | Tort Latte Fôret | Tort Profiterol  | Tort Trois Chocolat  | Tort Petite Latte | Tort Petite Fraise | Tort Vanille au Pistache | Tort Millefeuillle Abricot | Tort Passion Orange | Tort Duo Chocolat | Tort Caramelle | Tort Cheesecake New York </p>\r\n', 'Selectie sortimente la alegere - lista din torturile aniversare, in afara de krantz', 1),
(2, 'Tort Roblox', 'tort-roblox', 4, 'Tort decor Roblox, decorat cu buttercream, pasta de zahar si imagini comestibile', '<p>Tort decor Roblox, decorat cu buttercream, pasta de zahar si imagini comestibile. </p>\r\n<p>Tortul poate fi realizat folosind compozitia preferata: Tort Blanche Fraise | Tort Madagascar | Tort Latte Framboise | Tort Latte Fôret | Tort Profiterol  | Tort Trois Chocolat  | Tort Petite Latte | Tort Petite Fraise | Tort Vanille au Pistache | Tort Millefeuillle Abricot | Tort Passion Orange | Tort Duo Chocolat | Tort Caramelle | Tort Cheesecake New York </p>', 'Selectie sortimente la alegere - lista din torturile aniversare, in afara de krantz', 1),
(3, 'Tort TikTok', 'tort-tiktok', 4, 'Tort decor TikTok, decorat cu buttercream, pasta de zahar si imagini comestibile', '<p>Tort decor TikTok, decorat cu buttercream, pasta de zahar si imagini comestibile.</p>\r\n<p>Tortul poate fi realizat folosind compozitia preferata: Tort Blanche Fraise | Tort Madagascar | Tort Latte Framboise | Tort Latte Fôret | Tort Profiterol  | Tort Trois Chocolat  | Tort Petite Latte | Tort Petite Fraise | Tort Vanille au Pistache | Tort Millefeuillle Abricot | Tort Passion Orange | Tort Duo Chocolat | Tort Caramelle | Tort Cheesecake New York </p>', 'Selectie sortimente la alegere - lista din torturile aniversare, in afara de krantz', 1),
(4, 'Tort Super Mario', 'tort-super-mario', 4, 'Tort decor Super Mario, decorat cu buttercream, pasta de zahar si imagini comestibile', '<p>Tort decor Super Mario, decorat cu buttercream, pasta de zahar si imagini comestibile. </p>\r\n<p>Tortul poate fi realizat folosind compozitia preferata: Tort Blanche Fraise | Tort Madagascar | Tort Latte Framboise | Tort Latte Fôret | Tort Profiterol  | Tort Trois Chocolat  | Tort Petite Latte | Tort Petite Fraise | Tort Vanille au Pistache | Tort Millefeuillle Abricot | Tort Passion Orange | Tort Duo Chocolat | Tort Caramelle | Tort Cheesecake New York </p>', 'Selectie sortimente la alegere - lista din torturile aniversare, in afara de krantz', 1),
(5, 'Tort Spiderman', 'tort-spiderman', 4, 'Tort decor Spiderman, decorat cu buttercream, pasta de zahar si imagini comestibile', '<p>Tort decor Spiderman, decorat cu buttercream, pasta de zahar si imagini comestibile. </p>\r\n<p>Tortul poate fi realizat folosind compozitia preferata: Tort Blanche Fraise | Tort Madagascar | Tort Latte Framboise | Tort Latte Fôret | Tort Profiterol  | Tort Trois Chocolat  | Tort Petite Latte | Tort Petite Fraise | Tort Vanille au Pistache | Tort Millefeuillle Abricot | Tort Passion Orange | Tort Duo Chocolat | Tort Caramelle | Tort Cheesecake New York </p>', 'Selectie sortimente la alegere - lista din torturile aniversare, in afara de krantz', 1),
(6, 'Tort Superman', 'tort-superman', 4, 'Tort decor Superman, decorat cu buttercream, pasta de zahar si imagini comestibile', '<p>Tort decor Superman, decorat cu buttercream, pasta de zahar si imagini comestibile.</p>\r\n<p>Tortul poate fi realizat folosind compozitia preferata: Tort Blanche Fraise | Tort Madagascar | Tort Latte Framboise | Tort Latte Fôret | Tort Profiterol  | Tort Trois Chocolat  | Tort Petite Latte | Tort Petite Fraise | Tort Vanille au Pistache | Tort Millefeuillle Abricot | Tort Passion Orange | Tort Duo Chocolat | Tort Caramelle | Tort Cheesecake New York </p>', 'Selectie sortimente la alegere - lista din torturile aniversare, in afara de krantz', 1),
(7, 'Tort Unicorn', 'tort-unicorn', 4, 'Tort decor Unicorn, decorat cu buttercream, pasta de zahar si imagini comestibile', '<p>Tort decor Unicorn, decorat cu buttercream, pasta de zahar si imagini comestibile.</p>\r\n<p>Tortul poate fi realizat folosind compozitia preferata: Tort Blanche Fraise | Tort Madagascar | Tort Latte Framboise | Tort Latte Fôret | Tort Profiterol  | Tort Trois Chocolat  | Tort Petite Latte | Tort Petite Fraise | Tort Vanille au Pistache | Tort Millefeuillle Abricot | Tort Passion Orange | Tort Duo Chocolat | Tort Caramelle | Tort Cheesecake New York </p>', 'Selectie sortimente la alegere - lista din torturile aniversare,in afara de krantz', 1),
(8, 'Tort Flower Drip', 'tort-flower-drip', 4, 'Tort Flower Drip, decorat cu buttercream, pasta de zahar , bezele , macarons si foita de aur comestibila', '<p>Tort Flower Drip, decorat cu buttercream, pasta de zahar , bezele , macarons si foita de aur comestibila.</p>\r\n<p>Tortul poate fi realizat folosind compozitia preferata: Tort Blanche Fraise | Tort Madagascar | Tort Latte Framboise | Tort Latte Fôret | Tort Profiterol  | Tort Trois Chocolat  | Tort Petite Latte | Tort Petite Fraise | Tort Vanille au Pistache | Tort Millefeuillle Abricot | Tort Passion Orange | Tort Duo Chocolat | Tort Caramelle | Tort Cheesecake New York </p>', 'Selectie sortimente la alegere - lista din torturile aniversare, in afara de krantz', 1),
(9, 'Tort Silver Flower', 'tort-silver-flower', 4, 'Tort Silver Flower, decorat cu buttercream, pasta de zahar, macarons, bezele, foita de argint comestibila', '<p>Tort Silver Flower, decorat cu buttercream, pasta de zahar, macarons, bezele, foita de argint comestibila.</p>\r\n<p>Tortul poate fi realizat folosind compozitia preferata: Tort Blanche Fraise | Tort Madagascar | Tort Latte Framboise | Tort Latte Fôret | Tort Profiterol  | Tort Trois Chocolat  | Tort Petite Latte | Tort Petite Fraise | Tort Vanille au Pistache | Tort Millefeuillle Abricot | Tort Passion Orange | Tort Duo Chocolat | Tort Caramelle | Tort Cheesecake New York </p>', 'Selectie sortimente la alegere - lista din torturile aniversare, in afara de krantz', 1),
(10, 'Blanche Fraise', 'blanche-fraise', 1, 'Mousse de ciocolata alba belgiana cu baton vanilie, mousse de capsune, insertie de zmeura cu piure de visine', NULL, 'Frisca naturala, ciocolata alba, baton vanilie, oua, lapte, capsune, zmeura, visine, amidon de porumb, zahar', 1),
(11, 'Latte Framboise', 'latte-framboise', 1, 'Mousse de ciocolata cu lapte si ciocolata alba cu baton vanilie, insertie de zmeura cu piure de visine ', NULL, 'Frisca naturala, ciocolata cu lapte, ciocolata alba, cacao, zmeura, visine, oua, faina, cacao, amidon de porumb, lapte, unt, zahar', 1),
(12, 'Le Praliné', 'le-praline', 1, 'Ganache de ciocolata neagra si ciocolata cu lapte, insertie caramelizata cu nuci, blat umed cu migdale', NULL, 'Ciocolata neagra, ciocolata cu lapte, pudra de migdale, oua, nuci, lapte, zahar', 1),
(13, 'Cheesecake', 'cheesecake', 1, 'Crema de brânza cu frisca naturala, sos cremos de fructe de padure, crumble de biscuit', NULL, 'Crema de brânza, frisca naturala, biscuiti, fructe de padure, amidon de porumb, unt, zahar', 1),
(14, 'Pistache', 'pistache', 1, 'Mousse de fistic de bronte, insertie cremoasa de visine, blat umed cu vanilie', NULL, 'Frisca  naturala, ciocolata alba, pasta de fistic de bronte, visine, faina, lapte, oua, unt, fistic, zahar', 1),
(15, 'Choco Fraise', 'choco-fraise', 1, 'Mousse de ciocolata cu lapte, insertie de fructe de padure cu capsune', NULL, 'Frisca  naturala, ciocolata cu lapte, capsune, fructe de padure, faina, cacao, lapte, oua, unt', 1),
(16, 'Mango Chocolat', 'mango-chocolat', 1, 'Mousse de mango cu ciocolata cu lapte, insertie cremoasa dulce acrisoara de mango', NULL, 'Frisca  naturala, ciocolata cu lapte, piure de mango, lapte, oua, unt, zahar', 1),
(17, 'Profiterol', 'profiterol', 1, 'Mousse de ciocolata alba cu baton de vanilie, blat umed ciocolata, insertie de choux ciocolata, decor choux vanilie', NULL, 'Frisca  naturala, ciocolata alba, ciocolata cu lapte,  baton de vanilie, oua, faina, lapte, zahar ', 1),
(18, 'Macarons', 'macarons', 1, 'Cutie mix 9 macarons asortati cu ciocolata cu lapte, vanilie si ciocolata alba, cirese si cappucinno', NULL, 'Pudra de migdale, albus de ou, zahar, ciocolata cu lapte, cirese, ciocolata alba, cappucinno', 1),
(19, 'Tarta Caramel', 'tarta-caramel', 1, 'Tarta cu aluat foarte fraged, umpluta cu crema caramel ', NULL, 'Faina, oua, lapte, zahar, scortisoara, frisca naturala', 1),
(20, 'Tarta cu vanilie si fructe', 'tarta-cu-vanilie-si-fructe', 1, 'Tarta cu aluat fraged, umpluta cu crema de vanilie si frisca, decorata cu fructe de sezon', NULL, 'Faina, oua, lapte, zahar, scortisoara, frisca naturala, baton de vanilie,  fructe de sezon', 1),
(21, 'Tarta cu ciocolata si visine', 'tarta-cu-ciocolata-si-visine', 1, 'Tarta cu aluat fraged, umpluta cu sos de visine si cu ganache de ciocolata belgiana, decorata cu fructe de sezon ', NULL, 'Faina, oua, lapte, zahar, scortisoara, ciocolata cu lapte, visine, frisca naturala, fructe de sezon', 1),
(22, 'Rouleaux au Chocolat', 'rouleaux-au-chocolat', 1, 'Rulada cu vanilie si ciocolata belgiana', NULL, 'Faina, oua, lapte, zahar, cacao, unt, aroma rom, baton vanilie, ciocolata cu lapte, frisca naturala', 1),
(23, 'Alba ca Zapada', 'alba-ca-zapada', 2, 'Prajitura traditionala Alba ca Zapada cu crema de lamaie si decor de cocos', NULL, 'Faina, lapte, oua, unt, amidon de porumb, suc de lamaie, coaja de lamaie, razatura de cocos', 1),
(24, 'Amandina', 'amandina', 2, 'Amandina cu sirop de caramel, crema de unt cu fondant si decor de portocala confiata', NULL, 'Faina, oua, unt, fondant, ciocolata neagra, ciocolata cu lapte, frisca naturala, zahar, portocala confiata', 1),
(25, 'Savarina', 'savarina', 2, 'Savarina reinterpretata, bine insiropata cu lamaie, rom, sos de fructe de padure, decorata cu frisca naturala si fructe de sezon', NULL, 'Faina, oua, unt, drojdie, zahar, suc de lamaie, rom, fructe de padure, frisca naturala, fructe de sezon ', 1),
(26, 'Diplomat', 'diplomat', 2, 'Diplomat clasic cu fructe confiate si frisca naturala', NULL, 'Faina, oua, zahar, suc de portocale, rom, fructe confiate, frisca naturala, fructe de sezon ', 1),
(27, 'Cremsnit', 'cremsnit', 2, 'Foi fragede de foietaj, cu straturi de crema de vanilie cu frisca naturala', NULL, 'Faina, oua, zahar, unt, lapte, baton vanilie ', 1),
(28, 'Indiana', 'indiana', 2, 'Blaturi de pandispan insiropate cu sirop de vanilie, umplute cu frisca naturala si decorate cu ganache de ciocolata cu lapte belgiana ', NULL, 'Faina, oua, zahar, unt, lapte, frisca naturala, ciocolata cu lapte, aroma vanilie', 1),
(29, 'Ecler Vanilie', 'ecler-vanilie', 2, 'Ecler umplut cu crema fina de vanilie si decorat cu ganache de ciocolata alba', NULL, 'Faina, oua, zahar, unt, lapte, frisca naturala, baton de vanilie, amidon de porumb, ciocolata alba', 1),
(30, 'Ecler Ciocolata', 'ecler-ciocolata', 2, 'Ecler umplut cu crema fina de ciocolata belgiana si decorata cu ganache de ciocolata cu lapte ', NULL, 'Faina, oua, zahar, unt, frisca naturala, ciocolata cu lapte, amidon de porumb ', 1),
(31, 'Salam de Biscuiti ', 'salam-de-biscuiti', 2, 'Salam de biscuiti cu sos de lapte, unt si cacao ', NULL, 'Biscuiti Petite Beurre, lapte, unt, zahar, cacao, aroma rom ', 1),
(32, 'Choux-à-la-Crème', 'choux-a-la-creme', 2, 'Choux fraged umplut cu crema fina de vanilie si cu frisca naturala ', NULL, 'Faina, lapte, oua, unt, frisca naturala, baton de vanilie, zahar', 1),
(33, 'Felie Tort Krantz ', 'felie-tort-krantz', 2, 'Tort krantz cu blaturi cu nuca insiropate cu vanilie, crema cu extract de cafea si frisca naturala, decorat cu nuca caramelizata si crumble de biscuit', NULL, 'Faina, oua, unt, extract de cafea, nuca, zahar, frisca naturala, aroma vanilie ', 1),
(34, 'Felie Tort Trois Chocolat', 'felie-tort-trois-chocolat', 2, 'Tort Trois Chocolat fara gluten, cu blat umed de cacao si sarlota de ciocolata cu lapte, ciocolata alba, ciocolata neagra ', NULL, 'Cacao, oua, lapte, zahar, frisca naturala, ciocolata alba, ciocolata cu lapte, ciocolata neagra', 1),
(35, 'Placinta cu mere ', 'placinta-cu-mere', 2, 'Placinta deosebit de frageda si aromata, umpluta cu mere', NULL, 'Faina, galbenus, unt, zahar, mere, scortisoara', 1),
(36, 'Pachet Mini Gateaux', 'pachet-mini-gateaux', 2, 'Pachet cu 5 mini amandine, 5 mini indiene, 5 mini cremsnit, 5 mini eclere vanilie ', NULL, 'Faina, oua, lapte, unt, baton vanilie, fondant, ciocolata cu lapte, ciocolata neagra, ciocolata alba, frisca naturala', 1),
(37, 'Tort Blanche Fraise ', 'tort-blanche-fraise', 3, 'Tort cu mousse de ciocolata alba si baton de vanilie, mousse de capsune, insertie de zmeura cu piure de visine, blaturi umede de vanilie ', NULL, 'Frisca naturala, ciocolata alba, baton vanilie, oua,lapte, faina, unt, capsune, zmeura, visine, amidon de porumb. zahar', 1),
(38, 'Tort Madagascar', 'tort-madagascar', 3, 'Tort cu mousse ciocolata alba si vanilie, mousse de ciocolata cu lapte, insertie de zmeura, blaturi umede de vanilie, glasaj cu ciocolata alba ', NULL, 'Frisca naturala, ciocolata alba, oua, unt, lapte,  faina, baton de vanilie, ciocolata cu lapte, zmeura, zahar', 1),
(39, 'Tort Latte Framboise', 'tort-latte-framboise', 3, 'Tort cu mousse de ciocolata alba si baton de vanilie, mousse de ciocolata cu lapte, insertii de zmeura cu piure de visine, blaturi umede de ciocolata ', NULL, 'Frisca naturala, ciocolata alba, unt, oua, ciocolata cu lapte, cacao, zmeura, visine, faina,lapte,  amidon de porumb, baton vanilie, zahar ', 1),
(40, 'Tort Latte Fôret', 'tort-latte-foret', 3, 'Tort cu mousse de ciocolata cu lapte, insertie de fructe de padure, blat umed de ciocolata ', NULL, 'Frisca naturala, ciocolata cu lapte, fructe de padure, faina, oua, unt, zahar', 1),
(41, 'Tort Krantz ', 'tort-krantz', 3, 'Tort krantz cu blaturi cu nuca insiropate cu vanilie, crema cu extract de cafea si frisca naturala, decorat cu nuca caramelizata si crumble de biscuit', NULL, 'Faina, oua, unt, extract de cafea, nuca, zahar, frisca naturala, aroma vanilie', 1),
(42, 'Tort Profiterol ', 'tort-profiterol', 3, '', NULL, 'Frisca naturala, ciocolata alba,ciocolata cu lapte, baton de vanilie, oua, faina, lapte, zahar', 1),
(43, 'Tort Trois Chocolat ', 'tort-trois-chocolat', 3, 'Tort Trois chocolat fara gluten, cu blat umed de cacao si sarlota de ciocolata cu lapte, ciocolata alba, ciocolata neagra', NULL, 'Cacao, oua, lapte, zahar, frisca naturala, ciocolata alba, ciocolata cu lapte, ciocolata neagra', 1),
(44, 'Tort Petite Latte', 'tort-petite-latte', 3, 'Tort Petite Latte fara zahar, cu ciocolata ca atare indulcita cu maltitol si stevie rebaudiana', NULL, 'indulcitor stevie rebaudiana, frisca naturala, ciocolata cu lapte fara zahar, zmeura, faina, lapte, oua ', 1),
(45, 'Tort Petite Fraise', 'tort-petite-fraise', 3, 'Tort Petite Fraise fara zahar cu mousse de capsune si insertie de fructe de padure ', NULL, 'indulcitor stevie rebauda, capsune, frisca naturala, fructe de padure, faina, oua', 1),
(46, 'Tort Vanille au Pistache', 'tort-vanille-au-pistache', 3, 'Mousse de fistic de Bronte, mousse de ciocolata alba cu vanilie, insertie cu visine si sos de visine, blaturi umede de vanilie', NULL, 'Frisca naturala, fistic,baton de vanilie,  lapte, oua, unt, ciocolata alba, faina, zahar, amidon din porumb, visine', 1),
(47, 'Tort Millefeuillle Abricot', 'tort-millefeuillle-abricot', 3, 'Mousse de ciocolata alba cu vanilie, insertie de foietaj si de caise, blaturi umede de vanilie ', NULL, 'Frisca naturala, ciocolata alba, baton de vanilie, faina, unt, oua, lapte, zahar, insertie de foietaj si caise', 1),
(48, 'Tort Passion Orange', 'tort-passion-orange', 3, '', NULL, 'Frisca naturala, ciocolata cu lapte, ciocolata neagra, fructul pasiunii, faina, lapte, oua, unt, zahar, portocala confiata', 1),
(49, 'Tort Duo Chocolat', 'tort-duo-chocolat', 3, 'Mousse de ciocolata alba, ciocolata cu lapte si blaturi umede de ciocolata ', NULL, 'Frisca naturala, ciocolata alba, ciocolata cu lapte, baton vanilie, cacao, faina, lapte, oua ', 1),
(50, 'Tort Caramelle', 'tort-caramelle', 3, 'Tort cu mousse de caramel, insertie de caramel, blat umed de ciocolata ', NULL, 'Frisca naturala, ciocolata alba, baton de vanilie, faina, cacao, unt, zahar', 1),
(51, 'Tort Cheesecake New York', 'tort-cheesecake-new-york', 3, 'Cheesecake New York cu crema fina de branza President si sos de fructe de padure ', NULL, 'Crema de branza, smantana fermentata, oua, lapte, zahar, aroma vanilie, unt, biscuiti digestivi, fructe de padure', 1),
(52, 'Saratele cu telemea, mac si susan ', 'saratele-cu-telemea-mac-si-susan', 5, '', NULL, 'Faina, oua, unt, telemea de vaca, mac, susan', 1),
(53, 'Quiche cu branza de capra si praz ', 'quiche-cu-branza-de-capra-si-praz', 5, '', NULL, 'Faina, oua, unt, lapte batut, smantana naturala pentru gatit, branza de capra', 0),
(54, 'Placinta cu telemea', 'placinta-cu-telemea', 5, '', NULL, 'Faina, oua, unt, lapte batut, telemea de vaca', 1),
(55, 'Quiche Lorraine', 'quiche-lorraine', 5, '', NULL, 'Faina, oua, unt, lapte batut, smantana naturala pentru gatit, bacon ', 1),
(56, 'Cozonac Traditional', 'cozonac-traditional', 6, '', NULL, 'Faina, lapte, oua,unt,  aroma rom, aroma vanilie, coaja citrice, cacao, miez de nuca', 0),
(57, 'Cozonac Frantuzesc', 'cozonac-frantuzesc', 6, '', NULL, 'Faina, lapte, oua, unt, aroma rom, aroma vanilie, coaja citrice, cacao, miez de nuca, cognac Vinars, rom brun', 0),
(58, 'produs test', 'produs-test', 1, 'test-description', NULL, 'test-ingredients', 0),
(59, 'Mini-Tort Révélation D’amour', 'mini-tort-revelation-d-amour', 6, 'Cand ciocolata alba intalneste zmeura, este clar ca va iesi o poveste de dragoste fabuloasa. Am mai adaugat si o tenta eleganta de vanilie. Rezultatul? Révélation D’amour!', NULL, '<p>Tort Révélation D’amour</p>\r\n<br>\r\n<p><strong>Ingrediente:</strong> Ciocolata alba, frisca naturala, baton vanilie, oua, unt, faina, zmeura. </p>\r\n<br>\r\n<p><strong>Alergeni:</strong> oua, gluten, lactoza</p>', 1),
(60, 'Tort Je T’aime', 'tort-je-t-aime', 6, 'Acest desert contine ciocolata alba atat de fina, incat fructele de padure se topesc de dragul ei, promitandu-i dragoste eterna.', NULL, '<p>Tort Je T’aime</p>\r\n<br>\r\n<p><strong>Ingrediente:</strong> Ciocolata cu lapte, frisca naturala, oua, unt, faina, fructe de padure. </p>\r\n<br>\r\n<p><strong>Alergeni:</strong> oua, gluten, lactoza</p>', 1),
(61, 'Cutie Macarons V-day', 'cutie-macarons-v-day', 6, 'Macarons. Cine le poate rezista? Sa fim seriosi, contin zmeura si vanilie, plus ca mai au fi forma aceasta simpatica. Cum sa nu le adori?', NULL, '<p>Cutie cu 8 macarons cu vanilie si zmeura</p>\r\n<br>\r\n<p><strong>Ingrediente:</strong> pudra de migdale, lapte, albus, unt, piure de zmeura, ciocolata alba, baton de vanilie</p>\r\n<br>\r\n<p><strong>Alergeni:</strong> oua, lactoza</p>', 1),
(62, 'Pachet Adore', 'pachet-adore', 6, 'Legenda spune ca e mai bine sa fii sigur decat sa regreti ca ai luat prea putine. De aceea am creat pachetul de 6 monoportii cu 3 sortimente diferite, toate la fel de spectaculoase.', NULL, '<p>Pachet Adore ce contine 6 monoportii din cele mai apreciate sortimente de mousse La Petite</p>\r\n<br>\r\n<p><strong>Prajitura Blanche (2 buc):</strong> Frisca naturala, ciocolata alba, baton vanilie, oua, lapte, capsune, zmeura, visine, amidon de porumb, zahar.</p>\r\n<p><strong>Prajitura Fraise au Lait (2 buc):</strong> Ciocolata alba belgiana, baton de vanilie, frisca naturala, faina, lapte, oua, unt</p>\r\n<p><strong>Prajitura Latte Framboise (2 buc):</strong> Frisca naturala, ciocolata cu lapte, zmeura, visine, faina, lapte, oua, unt, zahar</p>\r\n<br>\r\n<p><strong>Alergeni:</strong> oua, gluten, lactoza</p>', 1),
(63, 'Tort Blanche', 'tort-blanche', 6, 'Ce ar putea fi gresit intr-un tort in care ciocolata alba belgiana imbratiseaza cu patos capsunele, zmeura si visinele?', NULL, '<p>Tort cu mousse de ciocolata alba cu baton vanilie, insertie capsune, blat umed de vanilie. </p>\r\n<br>\r\n<p><strong>Ingrediente:</strong> Frisca naturala, ciocolata alba, baton vanilie, oua, lapte, faina, unt, capsune, zmeura, visine, amidon de porumb, zahar. </p>\r\n<br>\r\n<p><strong>Alergeni:</strong> oua, gluten, lactoza.</p>', 1),
(64, 'Tort Impulse', 'tort-impulse', 6, 'Tortul acesta este in intregime o declaratie de dragoste. Forma de inima si insertia de fructul pasiunii exprima romantism din orice perspectiva ai privi.', NULL, '<p>Tort Impulse</p>\r\n<br>\r\n<p><strong>Ingrediente:</strong> Ciocolata alba, piure fructul pasiunii, frisca naturala, lapte, baton vanilie, oua, unt, faina.</p>\r\n<br>\r\n<p><strong>Alergeni:</strong> oua, gluten, lactoza</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `ProductID`, `CategoryID`) VALUES
(1, 1, 4),
(2, 2, 4),
(3, 3, 4),
(4, 4, 4),
(5, 5, 4),
(6, 6, 4),
(7, 7, 4),
(8, 8, 4),
(9, 9, 4),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 2),
(24, 24, 2),
(25, 25, 2),
(26, 26, 2),
(27, 27, 2),
(28, 28, 2),
(29, 29, 2),
(30, 30, 2),
(31, 31, 2),
(32, 32, 2),
(33, 33, 2),
(34, 34, 2),
(35, 35, 2),
(36, 36, 2),
(37, 37, 3),
(38, 38, 3),
(39, 39, 3),
(40, 40, 3),
(41, 41, 3),
(42, 42, 3),
(43, 43, 3),
(44, 44, 3),
(45, 45, 3),
(46, 46, 3),
(47, 47, 3),
(48, 48, 3),
(49, 49, 3),
(50, 50, 3),
(51, 51, 3),
(52, 52, 5),
(53, 53, 5),
(54, 54, 5),
(55, 55, 5),
(56, 56, 6),
(57, 57, 6),
(58, 58, 1),
(59, 59, 6),
(60, 60, 6),
(61, 61, 6),
(62, 62, 6),
(63, 63, 6),
(64, 64, 6);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `ProductID`, `image_url`) VALUES
(1, 1, 'tort-lol-surprise-1.jpg'),
(2, 2, 'tort-roblox-1.jpg'),
(3, 3, 'tort-tiktok-1.jpg'),
(4, 4, 'tort-super-mario-1.jpg'),
(5, 5, 'tort-spiderman-1.jpg'),
(6, 6, 'tort-personalizat-superman-1.jpg'),
(7, 7, 'tort-unicorn-1.jpg'),
(8, 8, 'tort-flower-drip-1.jpg'),
(9, 9, 'tort-silver-flower-1.jpg'),
(10, 1, 'tort-lol-surprise-2.jpg'),
(11, 2, 'tort-roblox-2.jpg'),
(12, 3, 'tort-tiktok-2.jpg'),
(13, 4, 'tort-super-mario-2.jpg'),
(14, 5, 'tort-spiderman-2.jpg'),
(15, 6, 'tort-personalizat-superman-2.jpg'),
(16, 7, 'tort-unicorn-2.jpg'),
(17, 8, 'tort-flower-drip-2.jpg'),
(18, 9, 'tort-silver-flower-2.jpg'),
(19, 10, 'blanche-fraise-1.jpg'),
(20, 11, 'latte-framboise-1.jpg'),
(21, 12, 'le-praline-1.jpg'),
(22, 13, 'cheesecake-1.jpg'),
(23, 14, 'pistache-1.jpg'),
(24, 15, 'choco-fraise-1.jpg'),
(25, 16, 'mango-chocolat-1.jpg'),
(26, 17, 'prajitura-profiterol-1.jpg'),
(27, 18, 'macarons-1.jpg'),
(28, 19, 'tarta-caramel-1.jpg'),
(29, 20, 'tarta-cu-vanilie-si-fructe-1.jpg'),
(30, 21, 'tarta-cu-ciocolata-si-visine-1.jpg'),
(31, 22, 'rouleaux-au-chocolat-1.jpg'),
(32, 10, 'blanche-fraise-2.jpg'),
(33, 11, 'latte-framboise-2.jpg'),
(34, 12, 'le-praline-2.jpg'),
(35, 13, 'cheesecake-2.jpg'),
(36, 14, 'pistache-2.jpg'),
(37, 15, 'choco-fraise-2.jpg'),
(38, 16, 'mango-chocolat-2.jpg'),
(39, 17, 'prajitura-profiterol-2.jpg'),
(40, 18, 'macarons-2.jpg'),
(41, 19, 'tarta-caramel-2.jpg'),
(42, 20, 'tarta-cu-vanilie-si-fructe-2.jpg'),
(43, 21, 'tarta-cu-ciocolata-si-visine-2.jpg'),
(44, 22, 'rouleaux-au-chocolat-2.jpg'),
(45, 23, 'alba-ca-zapada-1.jpg'),
(46, 24, 'amandina-1.jpg'),
(47, 25, 'savarina-1.jpg'),
(48, 26, 'diplomat-1.jpg'),
(49, 27, 'cremsnit-1.jpg'),
(50, 28, 'indiana-1.jpg'),
(51, 29, 'ecler-vanilie-1.jpg'),
(52, 30, 'ecler-ciocolata-1.jpg'),
(53, 31, 'salam-de-biscuiti-1.jpg'),
(54, 32, 'choux-a-la-creme-1.jpg'),
(55, 33, 'felie-tort-krantz-1.jpg'),
(56, 34, 'felie-tort-trois-chocolat-1.jpg'),
(57, 35, 'placinta-cu-mere-1.jpg'),
(58, 36, 'pachet-mini-gateaux-1.jpg'),
(59, 23, 'alba-ca-zapada-2.jpg'),
(60, 24, 'amandina-2.jpg'),
(61, 25, 'savarina-2.jpg'),
(62, 26, 'diplomat-2.jpg'),
(63, 27, 'cremsnit-2.jpg'),
(64, 28, 'indiana-2.jpg'),
(65, 29, 'ecler-vanilie-2.jpg'),
(66, 30, 'ecler-ciocolata-2.jpg'),
(67, 31, 'salam-de-biscuiti-2.jpg'),
(68, 32, 'choux-a-la-creme-2.jpg'),
(69, 33, 'felie-tort-krantz-2.jpg'),
(70, 34, 'felie-tort-trois-chocolat-2.jpg'),
(71, 35, 'placinta-cu-mere-2.jpg'),
(72, 36, 'pachet-mini-gateaux-2.jpg'),
(73, 37, 'tort-blanche-fraise-1.jpg'),
(74, 38, 'tort-madagascar-1.jpg'),
(75, 39, 'tort-latte-framboise-1.jpg'),
(76, 40, 'tort-latte-foret-1.jpg'),
(77, 41, 'tort-krantz-1.jpg'),
(78, 42, 'tort-profiterol-1.jpg'),
(79, 43, 'tort-trois-chocolat-1.jpg'),
(80, 44, 'tort-petite-latte-1.jpg'),
(81, 45, 'tort-petite-fraise-1.jpg'),
(82, 46, 'tort-vanille-au-pistache-1.jpg'),
(83, 47, 'tort-millefeuillle-abricot-1.jpg'),
(84, 48, 'tort-passion-orange-1.jpg'),
(85, 49, 'tort-duo-chocolat-1.jpg'),
(86, 50, 'tort-caramelle-1.jpg'),
(87, 51, 'tort-cheesecake-new-york-1.jpg'),
(88, 37, 'tort-blanche-fraise-2.jpg'),
(89, 38, 'tort-madagascar-2.jpg'),
(90, 39, 'tort-latte-framboise-2.jpg'),
(91, 40, 'tort-latte-foret-2.jpg'),
(92, 41, 'tort-krantz-2.jpg'),
(93, 42, 'tort-profiterol-2.jpg'),
(94, 43, 'tort-trois-chocolat-2.jpg'),
(95, 44, 'tort-petite-latte-2.jpg'),
(96, 45, 'tort-petite-fraise-2.jpg'),
(97, 46, 'tort-vanille-au-pistache-2.jpg'),
(98, 47, 'tort-millefeuillle-abricot-2.jpg'),
(99, 48, 'tort-passion-orange-2.jpg'),
(100, 49, 'tort-duo-chocolat-2.jpg'),
(101, 50, 'tort-caramelle-2.jpg'),
(102, 51, 'tort-cheesecake-new-york-2.jpg'),
(103, 52, 'saratele-cu-telemea-mac-si-susan-1.jpg'),
(104, 53, 'quiche-cu-branza-de-capra-si-praz-1.jpg'),
(105, 54, 'placinta-cu-telemea-1.jpg'),
(106, 55, 'quiche-lorraine-1.jpg'),
(107, 52, 'saratele-cu-telemea-mac-si-susan-2.jpg'),
(108, 53, 'quiche-cu-branza-de-capra-si-praz-2.jpg'),
(109, 54, 'placinta-cu-telemea-2.jpg'),
(110, 55, 'quiche-lorraine-2.jpg'),
(111, 56, 'cozonac-traditional-1.jpg'),
(112, 57, 'cozonac-frantuzesc-1.jpg'),
(113, 56, 'cozonac-traditional-2.jpg'),
(114, 57, 'cozonac-frantuzesc-2.jpg'),
(115, 58, 'test-1.png'),
(116, 58, 'test-2.jpg'),
(117, 59, 'mini-tort-revelation-d-amour-1.jpg'),
(118, 59, 'mini-tort-revelation-d-amour-2.jpg'),
(119, 60, 'tort-je-t-aime-1.jpg'),
(120, 60, 'tort-je-t-aime-2.jpg'),
(121, 61, 'cutie-macarons-v-day-1.jpg'),
(122, 61, 'cutie-macarons-v-day-2.jpg'),
(123, 62, 'pachet-adore-1.jpg'),
(124, 62, 'pachet-adore-2.jpg'),
(125, 63, 'tort-blanche-1.jpg'),
(126, 63, 'tort-blanche-2.jpg'),
(127, 64, 'tort-impulse-1.jpg'),
(128, 64, 'tort-impulse-2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_info`
--

CREATE TABLE `product_info` (
  `id` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `QuantityID` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_info`
--

INSERT INTO `product_info` (`id`, `ProductID`, `QuantityID`, `price`) VALUES
(1, 1, 18, 408),
(2, 2, 17, 400),
(3, 3, 15, 406),
(4, 4, 16, 410),
(5, 5, 17, 420),
(6, 6, 17, 420),
(7, 7, 13, 415),
(8, 8, 13, 410),
(9, 9, 14, 412),
(10, 10, 5, 17),
(11, 11, 6, 17),
(12, 12, 4, 18),
(13, 13, 6, 18),
(14, 14, 6, 18),
(15, 15, 4, 17),
(16, 16, 5, 18),
(17, 17, 5, 17),
(18, 18, 19, 47),
(19, 19, 2, 12),
(20, 20, 2, 12),
(21, 21, 2, 12),
(22, 22, 4, 18),
(23, 23, 6, 9),
(24, 24, 6, 12),
(25, 25, 7, 14),
(26, 26, 7, 14),
(27, 27, 1, 10),
(28, 28, 7, 14),
(29, 29, 3, 12),
(30, 30, 3, 12),
(31, 31, 9, 70),
(32, 32, 7, 13),
(33, 33, 7, 17),
(34, 34, 7, 17),
(35, 35, 9, 80),
(36, 36, 20, 85),
(37, 37, 12, 170),
(38, 38, 12, 175),
(39, 39, 12, 185),
(40, 40, 12, 180),
(41, 41, 12, 170),
(42, 42, 12, 170),
(43, 43, 12, 180),
(44, 44, 12, 180),
(45, 45, 12, 180),
(46, 46, 12, 180),
(47, 47, 12, 175),
(48, 48, 12, 188),
(49, 49, 12, 175),
(50, 50, 12, 180),
(51, 51, 11, 120),
(52, 52, 8, 40),
(53, 53, 9, 70),
(54, 54, 9, 80),
(55, 55, 9, 80),
(56, 56, 10, 65),
(57, 57, 9, 65),
(58, 58, 1, 17),
(59, 58, 2, 18),
(60, 58, 17, 19),
(61, 58, 18, 20),
(62, 59, 21, 60),
(63, 60, 9, 120),
(64, 61, 23, 40),
(65, 62, 22, 100),
(66, 63, 10, 140),
(67, 64, 9, 120);

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `num` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `composition` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `ProductID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `order_id`, `product_name`, `quantity`, `num`, `price`, `composition`, `message`, `ProductID`) VALUES
(1, 2, 'produs test', '80 g', 0, 37, NULL, NULL, 58),
(2, 3, 'produs test', '80 g', 0, 37, NULL, NULL, 58),
(3, 3, 'produs test', '3.7 - 3.9kg', 0, 20, NULL, NULL, 58),
(4, 5, 'produs test', '80 g', 0, 37, NULL, NULL, 58),
(5, 6, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(6, 6, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(7, 7, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(8, 7, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(9, 8, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(10, 9, 'Tort Unicorn', '3.4 - 3.7kg', 0, 415, NULL, NULL, 7),
(11, 10, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 180, NULL, NULL, 37),
(12, 11, 'Tort Madagascar', '1.5 - 1.7kg', 0, 175, NULL, NULL, 38),
(13, 12, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(14, 13, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 180, NULL, NULL, 37),
(15, 14, 'Cozonac Traditional', '1,2kg', 0, 75, NULL, NULL, 56),
(16, 14, 'Latte Framboise', '130g', 0, 17, NULL, NULL, 11),
(17, 14, 'Tort TikTok', '3.5 - 3.7kg', 0, 416, NULL, NULL, 3),
(18, 19, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 418, NULL, NULL, 1),
(19, 20, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 418, NULL, NULL, 1),
(20, 21, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 418, NULL, NULL, 1),
(21, 21, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(22, 22, 'Tort Madagascar', '1.5 - 1.7kg', 0, 175, NULL, NULL, 38),
(23, 23, 'Mango Chocolat', '120g', 0, 18, NULL, NULL, 16),
(24, 24, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(25, 25, 'Tort Madagascar', '1.5 - 1.7kg', 0, 175, NULL, NULL, 38),
(26, 26, 'Tort Latte Fôret', '1.5 - 1.7kg', 0, 180, NULL, NULL, 40),
(27, 26, 'Cozonac Traditional', '1,2kg', 0, 65, NULL, NULL, 56),
(28, 27, 'Latte Framboise', '130g', 0, 17, NULL, NULL, 11),
(29, 27, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 185, NULL, NULL, 39),
(30, 27, 'Saratele cu telemea, mac si susan ', '500g', 0, 40, NULL, NULL, 52),
(31, 27, 'Cozonac Traditional', '1,2kg', 0, 65, NULL, NULL, 56),
(32, 28, 'Tort Madagascar', '1.5 - 1.7kg', 0, 175, NULL, NULL, 38),
(33, 29, 'Latte Framboise', '130g', 0, 17, NULL, NULL, 11),
(34, 29, 'Diplomat', '150g', 0, 14, NULL, NULL, 26),
(35, 29, 'Tort Madagascar', '1.5 - 1.7kg', 0, 185, NULL, NULL, 38),
(36, 29, 'Tort Roblox', '3.6 - 3.8kg', 0, 410, NULL, NULL, 2),
(37, 29, 'Saratele cu telemea, mac si susan ', '500g', 0, 40, NULL, NULL, 52),
(38, 29, 'Cozonac Frantuzesc', '1kg', 0, 65, NULL, NULL, 57),
(39, 30, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(40, 30, 'Amandina', '130g', 0, 12, NULL, NULL, 24),
(41, 30, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 180, NULL, NULL, 37),
(42, 30, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 418, NULL, NULL, 1),
(43, 30, 'Placinta cu telemea', '1kg', 0, 80, NULL, NULL, 54),
(44, 31, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(45, 32, 'Tort Krantz ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 41),
(46, 33, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(47, 34, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(48, 35, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 418, NULL, NULL, 1),
(49, 36, 'Amandina', '130g', 0, 12, NULL, NULL, 24),
(50, 37, 'Alba ca Zapada', '130g', 0, 9, NULL, NULL, 23),
(51, 37, 'Salam de Biscuiti ', '1kg', 0, 70, NULL, NULL, 31),
(52, 37, 'Felie Tort Krantz ', '150g', 0, 17, NULL, NULL, 33),
(53, 38, 'Mango Chocolat', '120g', 0, 18, NULL, NULL, 16),
(54, 38, 'Tort Unicorn', '3.4 - 3.7kg', 0, 415, NULL, NULL, 7),
(55, 38, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(56, 39, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(57, 39, 'Tort Madagascar', '1.5 - 1.7kg', 0, 185, NULL, NULL, 38),
(58, 39, 'Saratele cu telemea, mac si susan ', '500g', 0, 40, NULL, NULL, 52),
(59, 40, 'Tort Roblox', '3.6 - 3.8kg', 0, 410, NULL, NULL, 2),
(60, 41, 'Tort Roblox', '3.6 - 3.8kg', 0, 400, NULL, NULL, 2),
(61, 41, 'Tort Madagascar', '1.5 - 1.7kg', 0, 175, NULL, NULL, 38),
(62, 42, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 408, NULL, NULL, 1),
(63, 43, 'Latte Framboise', '130g', 0, 17, NULL, NULL, 11),
(64, 43, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(65, 43, 'Le Praliné', '110g', 0, 18, NULL, NULL, 12),
(66, 44, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(67, 44, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 180, NULL, NULL, 37),
(68, 45, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 408, NULL, NULL, 1),
(69, 46, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(70, 47, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 408, NULL, NULL, 1),
(71, 48, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(72, 49, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 408, NULL, NULL, 1),
(73, 50, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 195, NULL, NULL, 39),
(74, 51, 'Tort Profiterol ', '1.5 - 1.7kg', 0, 180, NULL, NULL, 42),
(75, 52, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 185, NULL, NULL, 39),
(76, 52, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(77, 53, 'Le Praliné', '110g', 0, 18, NULL, NULL, 12),
(78, 54, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(79, 55, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(80, 56, 'Alba ca Zapada', '130g', 0, 9, NULL, NULL, 23),
(81, 56, 'Choux-à-la-Crème', '150g', 0, 13, NULL, NULL, 32),
(82, 56, 'Placinta cu mere ', '1kg', 0, 80, NULL, NULL, 35),
(83, 57, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(84, 58, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(85, 58, 'Latte Framboise', '130g', 0, 17, NULL, NULL, 11),
(86, 58, 'Cheesecake', '130g', 0, 18, NULL, NULL, 13),
(87, 58, 'Choco Fraise', '110g', 0, 17, NULL, NULL, 15),
(88, 58, 'Tarta Caramel', '90 g', 0, 12, NULL, NULL, 19),
(89, 59, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(90, 60, 'Tort Passion Orange', '1.5 - 1.7kg', 0, 188, NULL, NULL, 48),
(91, 61, 'Tort Madagascar', '1.5 - 1.7kg', 0, 175, NULL, NULL, 38),
(92, 62, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 185, NULL, NULL, 39),
(93, 63, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(94, 64, 'Tort LOL Surprise', '3.7 - 3.9kg', 0, 408, NULL, NULL, 1),
(95, 65, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 185, NULL, NULL, 39),
(96, 66, 'Tort Madagascar', '1.5 - 1.7kg', 0, 185, NULL, NULL, 38),
(97, 67, 'Tort Millefeuillle Abricot', '1.5 - 1.7kg', 0, 175, NULL, NULL, 47),
(98, 67, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 185, NULL, NULL, 39),
(99, 68, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 185, NULL, NULL, 39),
(100, 69, 'Tort Roblox', '3.6 - 3.8kg', 0, 400, NULL, NULL, 2),
(101, 70, 'Rouleaux au Chocolat', '110g', 0, 18, NULL, NULL, 22),
(102, 70, 'Blanche Fraise', '120g', 0, 17, NULL, NULL, 10),
(103, 70, 'Cremsnit', '80 g', 0, 10, NULL, NULL, 27),
(104, 70, 'Tarta Caramel', '90 g', 0, 12, NULL, NULL, 19),
(105, 71, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 185, NULL, NULL, 39),
(106, 72, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 185, NULL, NULL, 39),
(107, 73, 'Tort Latte Framboise', '1.5 - 1.7kg', 0, 185, NULL, NULL, 39),
(108, 74, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 0, 170, NULL, NULL, 37),
(109, 77, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(110, 77, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(111, 78, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(112, 78, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(113, 78, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(114, 79, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(115, 79, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(116, 79, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(117, 80, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(118, 80, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(119, 80, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(120, 81, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(121, 81, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(122, 81, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(123, 82, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(124, 82, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(125, 82, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(126, 86, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(127, 87, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(128, 87, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(129, 87, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(130, 88, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(131, 88, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(132, 88, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(133, 89, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(134, 89, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(135, 89, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(136, 90, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(137, 90, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(138, 90, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(139, 91, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(140, 91, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(141, 91, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(142, 92, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(143, 92, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(144, 92, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(145, 93, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(146, 93, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(147, 93, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(148, 94, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(149, 94, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, 'Trois Chocolat', 'LMA', 1),
(150, 94, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Latte Fôret', 'LMA', 1),
(151, 95, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Madagascar', 'okokokokoko', 1),
(152, 96, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Madagascar', 'okokokokoko', 1),
(153, 97, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Blanche Fraise', 'LMA!', 1),
(154, 98, 'Tort Blanche Fraise ', '1.5 - 1.7kg', 1, 190, '', 'LMA', 37),
(155, 98, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Petite Fraise', 'LMA', 1),
(156, 99, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 428, 'Madagascar', 'LMA', 1),
(157, 100, 'Mini-Tort Révélation D’amour', '250g', 2, 60, '', '', 59),
(158, 101, 'Mini-Tort Révélation D’amour', '250g', 1, 60, '', '', 59),
(159, 101, 'Saratele cu telemea, mac si susan ', '500g', 1, 40, '', '', 52),
(160, 101, 'Tort LOL Surprise', '3.7 - 3.9kg', 1, 408, '', '', 1),
(161, 102, 'Tort Trois Chocolat ', '1.5 - 1.7kg', 1, 180, '', 'You’re never too old for cake!', 43),
(162, 103, 'Tort Blanche', '1,2kg', 1, 140, '', '', 63),
(163, 104, 'Tort Blanche', '1,2kg', 1, 140, '', '', 63),
(164, 105, 'Tort Millefeuillle Abricot', '1.5 - 1.7kg', 1, 175, '', '', 47),
(165, 105, 'Latte Framboise', '130g', 1, 17, '', '', 11);

-- --------------------------------------------------------

--
-- Table structure for table `quantities`
--

CREATE TABLE `quantities` (
  `id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `um` varchar(255) NOT NULL,
  `portions` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quantities`
--

INSERT INTO `quantities` (`id`, `quantity`, `um`, `portions`) VALUES
(1, '80 ', 'g', NULL),
(2, '90 ', 'g', NULL),
(3, '100', 'g', NULL),
(4, '110', 'g', NULL),
(5, '120', 'g', NULL),
(6, '130', 'g', NULL),
(7, '150', 'g', NULL),
(8, '500', 'g', NULL),
(9, '1', 'kg', NULL),
(10, '1,2', 'kg', NULL),
(11, '1.3 - 1.4', 'kg', '(8-10 portii)'),
(12, '1.5 - 1.7', 'kg', '(10-15 portii)'),
(13, '3.4 - 3.7', 'kg', '(15-20 portii)'),
(14, '3.5 - 3.6', 'kg', '(15-20 portii)'),
(15, '3.5 - 3.7', 'kg', '(15-20 portii)'),
(16, '3.5 - 3.8', 'kg', '(15-20 portii)'),
(17, '3.6 - 3.8', 'kg', '(15-20 portii)'),
(18, '3.7 - 3.9', 'kg', '(15-20 portii)'),
(19, '9', 'buc', NULL),
(20, '20', 'buc', NULL),
(21, '250', 'g', NULL),
(22, '6', 'buc', NULL),
(23, '8', 'buc', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(300) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `provider_id` varchar(200) DEFAULT NULL,
  `provider_pic` varchar(200) DEFAULT NULL,
  `token` varchar(500) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_last_visit` datetime NOT NULL,
  `access` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `last_name`, `password`, `provider`, `provider_id`, `provider_pic`, `token`, `date_created`, `date_last_visit`, `access`) VALUES
(1, 'alexandru.manta@hotmail.com', 'Alex Manta', 'Manta', '$2y$10$c/CsYhhOig3.SWKwAqWsxOxwMSFefYvpsH2azWcTYV80E6eQKbM9.', 'FACEBOOK', '3719463524778838', 'https://graph.facebook.com/3719463524778838/picture?type=normal', 'EAADGaQ0RoL8BAAeygtyLiUgSMmCkQGFvXHnrxSkYcSXkBeZC45dNX1L8csGX1Bf4S0T7pbZBwCOPZBvV9cdLC5zgrwMnQ5aXt0wpnjv1lvbZAzOGUR8nDYTGzj7EA3h6ZBvg19IzV0JSTt6exFxXu3lyBy9YjKyzzaCajFwmpLDrZB9H9ZBphxYezhrLFRV1lGUTf2SHHLbIgZDZD', '2020-12-23 11:51:30', '2021-02-11 09:52:13', 0),
(2, 'danyadase@yahoo.com', 'Daniel Popa', '', NULL, 'FACEBOOK', '4279592035403062', 'https://graph.facebook.com/4279592035403062/picture?type=normal', 'EAADGaQ0RoL8BANbiZCMXcmuPqFdIM18h8BZAfqJMiNiKSnh7IhlifyxDgdm1fVJn5jZC56ZByQHTPYv8cZCbMgP7LYnwZCjy7ggxZC7NydY6jUXnrG68VdKgVqHZAALR8QaDZBZCZAwoGxRWUI6xuxH3BBN3gxOmEZCZCmyyzUAbGTOuQHmMsDbtfEcTOwT0xna764uyMV5pZBPlSCsQZDZD', '2021-01-21 10:31:36', '2021-01-21 10:32:07', 0),
(3, 'contact@amaliapopa.ro', 'Amalia Popa', '', NULL, 'FACEBOOK', '10221458067634690', 'https://graph.facebook.com/10221458067634690/picture?type=normal', 'EAADGaQ0RoL8BAGKdCEcnkiBJb7ZAdDQJl6GJbFXMK0m5AwPE0PPwsFmj0ZAPZCJTX2ZCEzoDZAUrSV8hZAfT1UxkA9ZBFIFpgEIpiKHYd7jqfRwDYCZCnR4SLxvDs4dVJq7xzSTDQAm55vGfawSJjNMLVhy4OxzjsgEBf93aRBm9NsEZCPWMRXPr7v1QiBzPOXlZBe6GAix3ZCSyQZDZD', '2021-01-21 14:05:51', '2021-01-21 14:05:51', 0),
(4, 'test@test.ro', 'asdsd asdaads asdad', '', '$2y$10$NtSiLERg5E4oW1xtum8Q2OKKGx6k1649flThKyL8qCEEmTGdoS016', NULL, NULL, NULL, '44d01bd6a33d5c760eb3f2b61d2baf40', '2021-02-01 19:33:28', '2021-02-01 19:33:28', 0),
(5, 'danielpopa701@gmail.com', 'popa', 'daniel', '$2y$10$nj.RYZY4N27auQ1ARtjvquZb5GJ90Lrk12G8NqGIF9V.f43wEW7Y6', NULL, NULL, NULL, 'b33c889f3096489ef4b7e157fdc22584', '2021-02-09 13:12:12', '2021-02-09 13:12:12', 0),
(6, 'bria.codrut@gmail.com', 'Cezar', 'Bria', '$2y$10$rcQC9di5jYtlYna6k/NSEOlcVm1iAY6wLhDjqXEmsyo7vgT0z1a9y', NULL, NULL, NULL, 'f6ea67497c025a87d5278ba5bd7fdeb0', '2021-02-11 16:35:16', '2021-02-11 16:36:46', 0),
(7, 'taneelena3@gmail.com', 'Tane', 'Daniela ', '$2y$10$Rg7lvTAiJbb6/9C11HDodOkqybGBcmlNRGnxhadKbvf6Km2KYQOPq', NULL, NULL, NULL, 'd3782812f1c9d7ba77e60f4d138533e3', '2021-02-15 21:36:32', '2021-02-15 21:49:50', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_accessories`
--
ALTER TABLE `orders_accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_shipping_address`
--
ALTER TABLE `orders_shipping_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quantities`
--
ALTER TABLE `quantities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `orders_accessories`
--
ALTER TABLE `orders_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders_shipping_address`
--
ALTER TABLE `orders_shipping_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `product_info`
--
ALTER TABLE `product_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `quantities`
--
ALTER TABLE `quantities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
