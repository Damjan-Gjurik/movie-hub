-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2026 at 10:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviehub`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`id`, `name`, `image`) VALUES
(1, 'Bryan Cranston', 'Sliki/actors/Bryan Cranston.jfif'),
(2, 'Aaron Paul', 'Sliki/actors/Aaron Paul.jfif'),
(3, 'Giancarlo Esposito', 'Sliki/actors/Giancarlo Esposito.jfif'),
(4, 'Dean Norris', 'Sliki/actors/Dean Norris.jfif'),
(5, 'Anna Gunn', 'Sliki/actors/Anna Gunn.jfif'),
(6, 'James Gandolfini', 'Sliki/actors/James Gandolfini.jfif'),
(7, 'Edie Falco', 'Sliki/actors/Edie Falco.jfif'),
(8, 'Michael Imperioli', 'Sliki/actors/Michael Imperioli.jfif'),
(9, 'Tony Sirico', 'Sliki/actors/Tony Sirico.jfif'),
(10, 'Jamie Lynn Sigler', 'Sliki/actors/Jamie Lynn Sigler.jfif'),
(11, 'Wentworth Miller', 'Sliki/actors/Wentworth Miller.jfif'),
(12, 'Domninic Purcell', 'Sliki/actors/Dominic Purcell.jfif'),
(13, 'Robert Knepper', 'Sliki/actors/Robert Knepper.jfif'),
(14, 'Sarah Wayne Callies', 'Sliki/actors/Sarah Wayne Callies.jfif'),
(15, 'William Fichtner', 'Sliki/actors/William Fichtner.jfif'),
(21, 'Bob Odenkirk', 'Sliki/Uploads/1782754991_Bob Odenkirk.jfif'),
(22, 'Jonathan Banks', 'Sliki/Uploads/1782754991_Jonathan Banks.webp'),
(23, 'Rhea Seehorn', 'Sliki/Uploads/1782754992_Rhea Seehorn.jfif'),
(24, 'Patrick Fabian', 'Sliki/Uploads/1782754992_Patrick Fabian.jfif'),
(25, 'Tony Dalton', 'Sliki/Uploads/1782754992_Tony Dalton.jfif'),
(26, 'Iain Armitage', 'Sliki/Uploads/1782757728_Ianin Armitage.jpg'),
(27, 'Raegan Revord', 'Sliki/Uploads/1782757728_Raegan Revord.jfif'),
(28, 'Montana Jordan', 'Sliki/Uploads/1782757729_Montana Jordan.jfif'),
(29, 'Annie Potts', 'Sliki/Uploads/1782757729_Annie Potts.jfif'),
(30, 'Lance Barber', 'Sliki/Uploads/1782757729_Lance Barber.jfif'),
(31, 'Jim Parsons', 'Sliki/Uploads/1782819709_Jim Parsons.jfif'),
(32, 'Johnny Galecki', 'Sliki/Uploads/1782819709_Johnny Galecki.jfif'),
(33, 'Kaley Cuoco', 'Sliki/Uploads/1782819709_Kaley Cuoco.jfif'),
(34, 'Simon Helberg', 'Sliki/Uploads/1782819709_Simon Helberg.jfif'),
(35, 'Kunal Nayyar', 'Sliki/Uploads/1782819710_Kunal Nayyar.jfif'),
(36, 'Millie Bobby Brown', 'Sliki/Uploads/1782820550_Millie Bobby Brown.jfif'),
(37, 'Finn Wolfhard', 'Sliki/Uploads/1782820550_Finn Wolfhard.jfif'),
(38, 'Winona Ryder', 'Sliki/Uploads/1782820550_Winona Ryder.jfif'),
(39, 'David Harbour', 'Sliki/Uploads/1782820550_David Harbour.jfif'),
(40, 'Gaten Matarazzo', 'Sliki/Uploads/1782820550_Gaten Matarazzo.jfif'),
(41, 'Jackie Chan', 'Sliki/Uploads/1782821309_Jackie Chan.jfif'),
(42, 'Chris Tucker', 'Sliki/Uploads/1782821309_Chris Tucker.jfif'),
(43, 'Ken Leung', 'Sliki/Uploads/1782821309_Ken Leung.jfif'),
(44, 'Tom Wilkinson', 'Sliki/Uploads/1782821309_Tom Wilkinson.jfif'),
(45, 'Tzi Ma', 'Sliki/Uploads/1782821309_Tzi Ma.jfif'),
(46, 'Brad Pitt', 'Sliki/Uploads/1782822039_Brad Pitt.jfif'),
(47, 'Damson Idris', 'Sliki/Uploads/1782822039_Damson Idris.jfif'),
(48, 'Javier Bardem', 'Sliki/Uploads/1782822039_Javier Bardem.jfif'),
(49, 'Kerry Condon', 'Sliki/Uploads/1782822039_Kerry Condon.jfif'),
(50, 'Tobias Menzies', 'Sliki/Uploads/1782822039_Tobias Menzeis.jfif'),
(51, 'Jason Momoa', 'Sliki/Uploads/1782822805_Jason Momoa.jfif'),
(52, 'Jack Black', 'Sliki/Uploads/1782822805_Jack Black.jfif'),
(53, 'Sebastian Hansen', 'Sliki/Uploads/1782822805_Sebastian Hansen.jfif'),
(54, 'Emma Myers', 'Sliki/Uploads/1782822805_Emma Myers.jfif'),
(55, 'Danielle Brooks', 'Sliki/Uploads/1782822805_Danielle Brooks.jfif'),
(56, 'Jenna Ortega', 'Sliki/Uploads/1782834999_Jenna Ortega.jfif'),
(57, 'Hunter Doohan', 'Sliki/Uploads/1782834999_Hunter Doohan.jfif'),
(58, 'Joy Sunday', 'Sliki/Uploads/1782834999_Joy Sunday.jfif'),
(59, 'Georgie Farmer', 'Sliki/Uploads/1782834999_Georgie Farmer.jfif'),
(60, 'Karl Urban', 'Sliki/Uploads/1782835747_Karl Urban.jfif'),
(61, 'Jack Quaid', 'Sliki/Uploads/1782835747_Jack Quaid.jfif'),
(62, 'Antony Starr', 'Sliki/Uploads/1782835747_Antony Starr.jfif'),
(63, 'Erin Moriarty', 'Sliki/Uploads/1782835748_Erin Moriarty.jfif'),
(64, 'Jessie T. Usher', 'Sliki/Uploads/1782835748_Jessie T. Usher.jfif'),
(65, 'Emilly Osment', 'Sliki/Uploads/1782846976_Emily Osment.webp'),
(66, 'Rachel Bay Jones', 'Sliki/Uploads/1782846976_Rachel Bay Jones.jfif'),
(67, 'Will Sasso', 'Sliki/Uploads/1782846976_Will Sasso.jfif'),
(68, 'Dougie Baldwin', 'Sliki/Uploads/1782846976_Dougie Baldwin.jfif'),
(69, 'Alvaro Morte', 'Sliki/Uploads/1782900412_Alvaro Morte.jfif'),
(70, 'Ursula Corbero', 'Sliki/Uploads/1782900412_Ursula Corbero.jfif'),
(71, 'Itziar Ituno', 'Sliki/Uploads/1782900413_Itziar Ituno.jfif'),
(72, 'Pedro Alonso', 'Sliki/Uploads/1782900413_Pedro Alonso.jfif'),
(73, 'Alba Flores', 'Sliki/Uploads/1782900413_Alba Flores.jfif'),
(74, 'Cillian Murphy', 'Sliki/Uploads/1782901188_Cillian Murphy.jfif'),
(75, 'Paul Anderson', 'Sliki/Uploads/1782901188_Paul Anderson.jfif'),
(76, 'Sophie Rundle', 'Sliki/Uploads/1782901188_Sophie Rundle.jfif'),
(77, 'Helen McCrory', 'Sliki/Uploads/1782901189_Helen McCrory.jfif'),
(78, 'Ned Dennehy', 'Sliki/Uploads/1782901190_Ned Dennehy.jfif'),
(79, 'Rebecca Ferguson', 'Sliki/Uploads/1782901813_Rebecca Ferguson.jfif'),
(80, 'Tim Roth', 'Sliki/Uploads/1782901813_Tim Roth.jfif'),
(81, 'Barry Keoghan', 'Sliki/Uploads/1782901813_Barry Keoghan.jfif'),
(82, 'Jaafar Jackson', 'Sliki/Uploads/1782902672_Jaafar Jackson.jfif'),
(83, 'Nia Long', 'Sliki/Uploads/1782902673_Nia Long.jfif'),
(84, 'Colman Domingo', 'Sliki/Uploads/1782902673_Colman Domingo.jfif'),
(85, 'Julian Valdi', 'Sliki/Uploads/1782902673_Juliano Valdi.jfif'),
(86, 'Jayden Harville', 'Sliki/Uploads/1782902673_Jayden Harville.jfif'),
(87, 'Reese Witherspoon', 'Sliki/Uploads/1782903432_Reese Witherspoon.jfif'),
(88, 'Luke Wilson', 'Sliki/Uploads/1782903432_Luke Wilson.jfif'),
(89, 'Selma Blair', 'Sliki/Uploads/1782903432_Selma Blair.jfif'),
(90, 'Matthew Davis', 'Sliki/Uploads/1782903432_Matthew Davis.jfif'),
(91, 'Victor Garber', 'Sliki/Uploads/1782903432_Victor Garber.jfif'),
(92, 'James Spader', 'Sliki/Uploads/1782904046_James Spader.jfif'),
(93, 'Megan Boone', 'Sliki/Uploads/1782904046_Megan Boone.jfif'),
(94, 'Diego Klattenhoff', 'Sliki/Uploads/1782904046_Diego Klattenhoff.jfif'),
(95, 'Harry Lennix', 'Sliki/Uploads/1782904046_Harry Lenix.jfif'),
(96, 'Hisham Tawfiq', 'Sliki/Uploads/1782904046_Hisham Tawfiq.jfif'),
(97, 'Sofia Vergara', 'Sliki/Uploads/1782904811_Sofia Vergara.jfif'),
(98, 'Julie Bowen', 'Sliki/Uploads/1782904811_Julie Bowen.jfif'),
(99, 'Ty Burrel', 'Sliki/Uploads/1782904811_Ty Burrel.jfif'),
(100, 'Sarah Hyland', 'Sliki/Uploads/1782904811_Sarah Hyland.jfif'),
(101, 'Ariel Winter', 'Sliki/Uploads/1782904811_Ariel Winters.jpg'),
(102, 'John Lone', 'Sliki/Uploads/1783007317_John Lone.jfif'),
(103, 'Ziyi Zhang', 'Sliki/Uploads/1783007317_Ziyi Zhang.jfif'),
(104, 'Roselyn  Sanchez', 'Sliki/Uploads/1783007317_Roselyn Sanchez.jfif'),
(105, 'Max von Sydow', 'Sliki/Uploads/1783007853_Max von Sydow.jfif'),
(106, 'Hiroyuki Sanada', 'Sliki/Uploads/1783007853_Hiroyuki Sanada.jpg'),
(107, 'Dominic Purcell', 'Sliki/Uploads/1783008734_Dominic Purcell.jfif'),
(108, 'Tom Selleck', 'Sliki/Uploads/1783011185_Tom Selleck.jfif'),
(109, 'John Hillerman', 'Sliki/Uploads/1783011186_John Hillerman.jfif'),
(110, 'Roger E. Mosley', 'Sliki/Uploads/1783011186_Roger E. Mosley.jfif'),
(111, 'Larry Manetti', 'Sliki/Uploads/1783011186_Larry Manetti.jfif'),
(112, 'Clyde Kusatsu', 'Sliki/Uploads/1783011186_Clyde Kusatsu.jfif'),
(113, 'Jay Hernandez', 'Sliki/Uploads/1783012019_Jay Hernandez.jfif'),
(114, 'Perdita Weeks', 'Sliki/Uploads/1783012020_Perdita Weeks.jfif'),
(115, 'Zachary Knighton', 'Sliki/Uploads/1783012020_Zachary Knighton.jfif'),
(116, 'Stephen Hill', 'Sliki/Uploads/1783012020_Stephen Hill.jfif'),
(117, 'Tim Kang', 'Sliki/Uploads/1783012020_Tim Kang.jfif'),
(118, 'Jennifer Aniston', 'Sliki/Uploads/1783012836_Jennifer Aniston.jfif'),
(119, 'Courteney Cox', 'Sliki/Uploads/1783012836_Courteney Cox.jfif'),
(120, 'Lisa Kudrow', 'Sliki/Uploads/1783012836_Lisa Kudrow.jfif'),
(121, 'Matt LeBlanc', 'Sliki/Uploads/1783012836_Matt LeBlanc.jfif'),
(122, 'Matthew Perry', 'Sliki/Uploads/1783012836_Matthew Perry.jfif'),
(123, 'David Schwimmer', 'Sliki/Uploads/1783012836_David Schwimmer.jfif'),
(124, 'Adam Sandler', 'Sliki/Uploads/1783073145_Adam Sandler.jfif'),
(125, 'Kevin James', 'Sliki/Uploads/1783073145_Kevin James.jfif'),
(126, 'Andy Samberg', 'Sliki/Uploads/1783073145_Andy Samberg.jfif'),
(127, 'Selena Gomez', 'Sliki/Uploads/1783073145_Selena Gomez.jfif'),
(128, 'Fran Drescher', 'Sliki/Uploads/1783073145_Fran Drescher.jfif'),
(129, 'Steve Buscemi', 'Sliki/Uploads/1783073699_Steve Buscemi.htm'),
(130, 'Kathryn Hahn', 'Sliki/Uploads/1783074752_Kathryn Hahn.jfif'),
(131, 'Jim Gaffigan', 'Sliki/Uploads/1783074752_Jim Gaffigan.jfif'),
(132, 'Patricia Heaton', 'Sliki/Uploads/1783075602_Patricia Heaton.jfif'),
(133, 'Neil Flynn', 'Sliki/Uploads/1783075602_Neil Flynn.jfif'),
(134, 'Charlie McDermott', 'Sliki/Uploads/1783075602_Charlie McDermott.jfif'),
(135, 'Eden Sher', 'Sliki/Uploads/1783075603_Eden Sher.jfif'),
(136, 'Atticus Shaffer', 'Sliki/Uploads/1783075603_Atticus Shaffer.jfif'),
(137, 'Bob Saget', 'Sliki/Uploads/1783076390_Bob Saget.jfif'),
(138, 'John Stamos', 'Sliki/Uploads/1783076391_John Stamos.jfif'),
(139, 'Dave Coulier', 'Sliki/Uploads/1783076391_Dave Coulier.jfif'),
(140, 'Candace Cameron Bure', 'Sliki/Uploads/1783076391_Candace Cameron Bure.jfif'),
(141, 'Jodie Sweetin', 'Sliki/Uploads/1783076391_Jodie Sweetin.jfif'),
(142, 'Tim Allen', 'Sliki/Uploads/1783082943_Tim Allen.jfif'),
(143, 'Nancy Travis', 'Sliki/Uploads/1783082944_Nancy Travis.jfif'),
(144, 'Amanda Fuller', 'Sliki/Uploads/1783082944_Amanda Fuller.jfif'),
(145, 'Kaitlyn Dever', 'Sliki/Uploads/1783082944_Kaitlyn Dever.jfif'),
(146, 'Molly Ephraim', 'Sliki/Uploads/1783082944_Molly Ephraim.jfif'),
(147, 'Miranda Cosgrove', 'Sliki/Uploads/1783083893_Miranda Cosgrove.jfif'),
(148, 'Jennette McCurdy', 'Sliki/Uploads/1783083894_Jennette McCurdy.jfif'),
(149, 'Nathan Kress', 'Sliki/Uploads/1783083894_Nathan Kress.jfif'),
(150, 'Jerry Trainor', 'Sliki/Uploads/1783083894_Jerry Trainor.jfif'),
(151, 'Noah Munck', 'Sliki/Uploads/1783083894_Noah Munck.jfif'),
(152, 'David Hasselhoff', 'Sliki/Uploads/1783084582_David Hasselhoff.jfif'),
(153, 'Pamela Anderson', 'Sliki/Uploads/1783084582_Pamela Anderson.jfif'),
(154, 'Yasmine Bleeth', 'Sliki/Uploads/1783084582_Yasmine Bleeth.jfif'),
(155, 'Jeremy Jackson', 'Sliki/Uploads/1783084582_Jeremy Jackson.jfif'),
(156, 'Micheal Newman', 'Sliki/Uploads/1783084582_Micheal Newman.jfif'),
(157, 'Hugh Jackman', 'Sliki/Uploads/1783085367_hugh jackman.jfif'),
(158, 'Brett Goldstein', 'Sliki/Uploads/1783085367_brett goldstein.jfif'),
(159, 'Patrick Stewart', 'Sliki/Uploads/1783085367_patrick stewart.jfif'),
(160, 'Regina Hall', 'Sliki/Uploads/1783085367_regina hall.jfif'),
(161, 'Bella Ramsey', 'Sliki/Uploads/1783085367_bella ramsey.jfif'),
(162, 'Milly Alcock', 'Sliki/Uploads/1783086146_Milly Alcock.jfif'),
(163, 'David Corenswet', 'Sliki/Uploads/1783086146_david corenswet.jfif'),
(164, 'Eve Ridley', 'Sliki/Uploads/1783086146_Eve Ridley.jfif'),
(165, 'Matthias Schoenaerts', 'Sliki/Uploads/1783086146_matthias schoenaerts.jfif'),
(166, 'Diarmaid Muratagh', 'Sliki/Uploads/1783086146_diaemaid murtagh.jfif'),
(167, 'Micheal Johnston', 'Sliki/Uploads/1783090534_Micheal johnston.jfif'),
(168, 'Inde Navarrette', 'Sliki/Uploads/1783090534_Inde navarrette.jfif'),
(169, 'Cooper Tomlinson', 'Sliki/Uploads/1783090534_cooper tomlinson.jfif'),
(170, 'Megan Lawless', 'Sliki/Uploads/1783090534_megan lawless.jfif'),
(171, 'Andy Richter', 'Sliki/Uploads/1783090534_andy richter.jfif'),
(172, 'Steve Carell', 'Sliki/Uploads/1783091334_steve carell.jfif'),
(173, 'Jenna Fischer', 'Sliki/Uploads/1783091334_jenna fischer.jfif'),
(174, 'John Krasinski', 'Sliki/Uploads/1783091334_john krasinski.jfif'),
(175, 'Rainn Wilson', 'Sliki/Uploads/1783091334_rainn wilson.jfif'),
(176, 'Leslie David Baker', 'Sliki/Uploads/1783091334_leslie david baker.jfif'),
(177, 'Nathan Fillion', 'Sliki/Uploads/1783092080_Nathan fillion.jfif'),
(178, 'Alyssa Diaz', 'Sliki/Uploads/1783092080_alyssa diaz.jfif'),
(179, 'Richard T. Jones', 'Sliki/Uploads/1783092080_richard t jones.jfif'),
(180, 'Melissa O\'Neil', 'Sliki/Uploads/1783092080_melissa o\'neil.jfif'),
(181, 'Eric Winter', 'Sliki/Uploads/1783092080_eric winter.jfif'),
(182, 'Stephanie Beatriz', 'Sliki/Uploads/1783092644_stephanie beatriz.jfif'),
(183, 'Terry Crews', 'Sliki/Uploads/1783092644_Terry Crews.jfif'),
(184, 'Melissa Fumero', 'Sliki/Uploads/1783092644_melissa fumero.jfif'),
(185, 'Joe Lo Truglio', 'Sliki/Uploads/1783092644_joe lo truglio.jfif'),
(186, 'Kat Dennings', 'Sliki/Uploads/1783095311_Kat dennings.jfif'),
(187, 'Beth Behrs', 'Sliki/Uploads/1783095311_Beth behrs.jfif'),
(188, 'Garrett Morris', 'Sliki/Uploads/1783095311_garrett morris.jfif'),
(189, 'Jonathan Kite', 'Sliki/Uploads/1783095312_jonathan kite.jfif'),
(190, 'Matthew Moy', 'Sliki/Uploads/1783095312_matthew moy.jfif'),
(191, 'Kiefer Suthurland', 'Sliki/Uploads/1783096195_kiefer sutherland.jfif'),
(192, 'Mary Lynn Rajskub', 'Sliki/Uploads/1783096195_mary lynn rajskub.jfif'),
(193, 'Carlos Bernard', 'Sliki/Uploads/1783096195_carlos bernanrd.jfif'),
(194, 'Dennis Haysbert', 'Sliki/Uploads/1783096196_dennis haysbert.jfif'),
(195, 'Elisha Cuthbert', 'Sliki/Uploads/1783096196_elisha cuthbert.jfif'),
(196, 'Pedro Pascal', 'Sliki/Uploads/1783096879_Pedro pascal.jfif'),
(197, 'Wagner Moura', 'Sliki/Uploads/1783096879_wagner moura.jfif'),
(198, 'Boyd Holbrook', 'Sliki/Uploads/1783096879_boyd holbrook.jfif'),
(199, 'Alberto Ammann', 'Sliki/Uploads/1783096879_alberto ammann.jfif'),
(200, 'Paulina Gaitan', 'Sliki/Uploads/1783096879_paulina gaitan.jfif'),
(201, 'Dominic West', 'Sliki/Uploads/1783097480_dominic west.jfif'),
(202, 'Lance Reddick', 'Sliki/Uploads/1783097480_lance reddick.jfif'),
(203, 'Sonja Sohn', 'Sliki/Uploads/1783097480_sonja sohn.jfif'),
(204, 'John Doman', 'Sliki/Uploads/1783097480_john doman.jfif'),
(205, 'Dede Lovejoy', 'Sliki/Uploads/1783097480_dede lovejoy.jfif'),
(206, 'Jelena Jovanova', 'Sliki/Uploads/1783098555_jelena jovanova.jfif'),
(207, 'Igor Angelov', 'Sliki/Uploads/1783098555_igor angelov.jfif'),
(208, 'Tijana Dapcevic', 'Sliki/Uploads/1783098555_tijana dapceviv.jfif'),
(209, 'Goran Stojanovski', 'Sliki/Uploads/1783098555_goran stojanovski.jfif'),
(210, 'Driton Vejseli', 'Sliki/Uploads/1783098555_driton vejsili.jfif'),
(211, 'Micheal C. Hall', 'Sliki/Uploads/1783185405_michael c hall.jfif'),
(212, 'Jennifer Carpenter', 'Sliki/Uploads/1783185406_jennifer carpenter.jfif'),
(213, 'David Zayas', 'Sliki/Uploads/1783185406_David zayas.jfif'),
(214, 'James Remar', 'Sliki/Uploads/1783185406_james remar.jfif'),
(215, 'C. S. Lee', 'Sliki/Uploads/1783185406_c. s. lee.jfif'),
(216, 'Michael C. Hall', 'Sliki/Uploads/1783186087_michael c hall.jfif'),
(217, 'Uma Thurman', 'Sliki/Uploads/1783186087_Uma Thurman.jfif'),
(218, 'Jack Alcott', 'Sliki/Uploads/1783186087_jack alcott.jfif'),
(219, 'Ntare Guma Mbaho Mwine', 'Sliki/Uploads/1783186087_ntare gumma mbaho mwine.jfif'),
(220, 'Julia Jones', 'Sliki/Uploads/1783186689_julia jones.jfif'),
(221, 'Johnny Sequoyah', 'Sliki/Uploads/1783186689_johnny sequoyah.jfif'),
(222, 'Alano Miller', 'Sliki/Uploads/1783186689_alano miller.jfif'),
(223, 'Patrick Wilson', 'Sliki/Uploads/1783187290_patrick wilson.jfif'),
(224, 'Christian Slater', 'Sliki/Uploads/1783187290_christain slater.jfif'),
(225, 'Molly Brown', 'Sliki/Uploads/1783187290_molly brown.jfif'),
(226, 'Christina Milian', 'Sliki/Uploads/1783187290_christina milian.jfif'),
(227, 'James Martinez', 'Sliki/Uploads/1783187290_james martinez.jfif'),
(228, 'Jared Harris', 'Sliki/Uploads/1783187855_jared harris.jfif'),
(229, 'Jessie Buckley', 'Sliki/Uploads/1783187855_jessie buckley.jfif'),
(230, 'Stellan Skarsgard', 'Sliki/Uploads/1783187855_stellan skardgard.jfif'),
(231, 'Emily Watson', 'Sliki/Uploads/1783187855_emily watson.jfif'),
(232, 'Adam Nagaitis', 'Sliki/Uploads/1783187855_adam nagaitis.jfif'),
(233, 'Benedict Cumberbatch', 'Sliki/Uploads/1783188631_benedict cumberbatch.jfif'),
(234, 'Martin Freeman', 'Sliki/Uploads/1783188631_martin freeman.jfif'),
(235, 'Una Stubbs', 'Sliki/Uploads/1783188631_una stubbs.jfif'),
(236, 'Rupert Graves', 'Sliki/Uploads/1783188632_rupert graves.jfif'),
(237, 'Louise Brealey', 'Sliki/Uploads/1783188632_loise brealey.jfif');

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`id`, `name`) VALUES
(25, 'Alexi Hawley'),
(41, 'Anthony Byrne'),
(42, 'Bobby Roth'),
(3, 'Brad Turner'),
(1, 'Brett Ratner'),
(32, 'Carlo Bernard'),
(33, 'Chris Brancato'),
(44, 'Chuck Lorre'),
(52, 'Clyde Phillips'),
(22, 'Craig Gillespie'),
(53, 'Craig Mazin'),
(23, 'Curry Barker'),
(26, 'Dan Goor'),
(17, 'Dan Schneider'),
(43, 'David Chase'),
(8, 'David Crane'),
(35, 'David Simon'),
(14, 'DeAnn Heline'),
(11, 'Derek Drymon'),
(4, 'Donald P. Bellisario'),
(34, 'Doug Miro'),
(20, 'Douglas Schwartz'),
(13, 'Eileen Heisler'),
(6, 'Eric Guggenheim'),
(10, 'Genndy Tartakovsky'),
(5, 'Glen A. Larson'),
(24, 'Greg Daniels'),
(19, 'Gregory J. Bonann'),
(36, 'Igor Ivanov'),
(16, 'Jack Burditt'),
(51, 'James Manos Jr.'),
(50, 'Jason Winer'),
(15, 'Jeff Franklin'),
(12, 'Jennifer Kluska'),
(40, 'Jesús Colmenar'),
(31, 'Joel Surnow'),
(49, 'Jon Bokenkamp'),
(2, 'Kevin Hooks'),
(21, 'Kyle Balda'),
(45, 'Mark Cendrowski'),
(54, 'Mark Gatiss'),
(9, 'Marta Kauffman'),
(46, 'Matt Duffer'),
(18, 'Micheal Berk'),
(29, 'Micheal Patrick King'),
(27, 'Micheal Schur'),
(39, 'Peter Gloud'),
(7, 'Peter M. Lenkov'),
(48, 'Philip Sgriccia'),
(30, 'Robert Cochran'),
(55, 'Steven Moffat'),
(47, 'Tim Burton'),
(37, 'Vardan Tozija'),
(38, 'Vince Giligan'),
(28, 'Whitney Cummings');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(3, 'Action'),
(4, 'Adventure'),
(5, 'Animation'),
(6, 'Biography'),
(7, 'Comedy'),
(1, 'Crime'),
(8, 'Documentary'),
(2, 'Drama'),
(9, 'Family'),
(10, 'Fantasy'),
(11, 'History'),
(12, 'Horror'),
(13, 'Music'),
(14, 'Mystery'),
(15, 'Romance'),
(16, 'Sci-Fi'),
(17, 'Sport'),
(18, 'Thriller'),
(19, 'War'),
(20, 'Western');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `type` enum('Филм','Серија') NOT NULL,
  `release_year` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `kreirano_na` timestamp NOT NULL DEFAULT current_timestamp(),
  `seasons` int(11) DEFAULT NULL,
  `episodes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `type`, `release_year`, `description`, `poster`, `trailer`, `kreirano_na`, `seasons`, `episodes`) VALUES
(1, 'Breaking Bad', 'Серија', 2008, 'Професор по хемија на кого му е дијагностициран канцер на плуќа, запончнува со производство на метамфетамин заедно со својот поранешен ученик за да може да обезбеди иднина за својата фамилија.', 'Sliki/Poster/Breaking Bad.jfif', 'https://www.youtube.com/embed/VFkjBy2b50Q', '2026-06-09 18:58:21', 5, 62),
(2, 'The Sopranos', 'Серија', 1999, 'Мафијашкиот шеф од Њу Џерси, Тони Сопрано, се справува со лични и професионални проблеми во неговиот домашен и деловен живот кои влијаат на неговата ментална состојба, што го наведува да побара професионално психијатриско советување.', 'Sliki/Poster/The Sopranos.jfif', 'https://www.youtube.com/embed/Q8cBFvpqmH0', '2026-06-09 18:58:21', 6, 86),
(3, 'Prison Break', 'Серија', 2005, 'Градежен инженер влегува во затвор кој е дизајниран од неговата компанија, за да го ослободи својот лажно обвинет брат од смртна казна.', 'Sliki/Poster/Prison Break.jfif', 'https://www.youtube.com/embed/AL9zLctDJaU', '2026-06-09 18:58:21', 5, 90),
(13, 'Better Call Saul', 'Серија', 2015, 'Адвокатот од Албукерки, Џими Мекгил, се бори за клиенти и почит, но секоја победа го доближува до сомнителни зделки, опасни луѓе и неговото алтер его, Сол Гудман.', 'Sliki/Uploads/1782755107_Better Call Saul.jfif', 'https://www.youtube.com/embed/PjElOuIECdE', '2026-06-29 17:45:07', 6, 63),
(14, 'Young Sheldon', 'Серија', 2017, 'Запознајте го детскиот гениј по име Шелдон Купер и неговото семејство. Шелдон, кој е социјално попречен, се соочува со некои уникатни предизвици.', 'Sliki/Uploads/1782757728_Young Sheldon.jpg', 'https://www.youtube.com/embed/FJharwos_SI', '2026-06-29 18:28:48', 7, 141),
(15, 'The Big Bang Theory', 'Серија', 2007, 'Животот на четири социјално несмасни научници добива див пресврт кога една убава и слободоумна девојка се вселува во соседството.', 'Sliki/Uploads/1782819709_Tbbt.jfif', 'https://www.youtube.com/embed/rCj-Fb1OmXg', '2026-06-30 11:41:49', 12, 279),
(16, 'Stranger Things', 'Серија', 2016, 'Во Индијана во 1980-тите, група млади пријатели се сведоци на натприродни сили и тајни владини подвизи. Додека бараат одговори, децата откриваат низа извонредни мистерии.', 'Sliki/Uploads/1782820549_Stranger Things.jpg', 'https://www.youtube.com/embed/mnd7sFt5c3A', '2026-06-30 11:55:49', 5, 42),
(17, 'Rush Hour', 'Филм', 1998, 'Лојален и посветен инспектор од Хонг Конг се здружува со неодговорен и гласен детектив од Лос Анџелес за да ја спаси киднапираната ќерка на кинескиот конзул, додека по патот се обидува да уапси опасен криминален бос.', 'Sliki/Uploads/1782821308_Rush Hour.jfif', 'https://www.youtube.com/embed/JMiFsFQcFLE', '2026-06-30 12:08:28', 0, 0),
(18, 'F1:The Movie', 'Филм', 2025, 'Возач на Формула 1 се враќа од пензија за да биде ментор и да се здружи со помлад возач.', 'Sliki/Uploads/1782822039_F1 The Movie.jfif', 'https://www.youtube.com/embed/8yh9BPUBbbQ', '2026-06-30 12:20:39', 0, 0),
(19, 'A Minecraft Movie', 'Филм', 2025, 'Четири отпадници одеднаш се влечени низ мистериозен портал во бизарна кубна земја на чудата која цвета со имагинација. За да се вратат дома, тие ќе мора да го совладаат овој свет додека се впуштаат во потрага со неочекуван експерт за изработка на ракотворби.', 'Sliki/Uploads/1782822804_A Minecraft Movie.jpg', 'https://www.youtube.com/embed/VrkqSM-U5dY', '2026-06-30 12:33:24', 0, 0),
(20, 'Wednesday', 'Серија', 2022, 'Ги следи годините на Венздеј Адамс како студентка, кога таа се обидува да ја совлада својата нова психичка способност, да спречи серија убиства и да ја реши мистеријата што ги заплетка нејзините родители.', 'Sliki/Uploads/1782834998_Wednesday.jfif', 'https://www.youtube.com/embed/Qa5kFRxBkNw', '2026-06-30 15:56:38', 2, 17),
(21, 'The Boys', 'Серија', 2019, 'Група одмаздници тргнуваат да ги совладаат корумпираните суперхерои кои ги злоупотребуваат своите супермоќи.', 'Sliki/Uploads/1782835747_The Boys.jfif', 'https://www.youtube.com/embed/M1bhOaLV4FU', '2026-06-30 16:09:07', 5, 40),
(22, 'Georgie & Mandy\'s First Marriage', 'Серија', 2024, 'Џорџи и Менди се справуваат со предизвиците на зрелоста, родителството и бракот додека го одгледуваат своето младо семејство во Тексас.', 'Sliki/Uploads/1782846975_gmfm.jfif', 'https://www.youtube.com/embed/ZbdK-QJtFKI', '2026-06-30 19:16:15', 2, 45),
(23, 'Money Heist', 'Серија', 2017, 'Необична група крадци се обидува да го изврши најсовршениот грабеж во шпанската историја - крадејќи 2,4 милијарди евра од Кралската ковница пари на Шпанија.', 'Sliki/Uploads/1782900411_Money Heist.jpg', 'https://www.youtube.com/embed/_InqQJRqGW4', '2026-07-01 10:06:52', 5, 41),
(24, 'Peaky Blinders', 'Серија', 2013, 'Гангстерски семеен епски филм сместен во Бирмингем, Англија, 1919 година; центриран околу банда која шие бричеви во врвовите на своите капи и нивниот жесток шеф Томи Шелби.', 'Sliki/Uploads/1782901186_Peaky Blinders.jfif', 'https://www.youtube.com/embed/oVzVdvGIC7U', '2026-07-01 10:19:46', 6, 36),
(25, 'Peaky Blinders: The Immortal Man', 'Филм', 2026, 'За време на Втората светска војна, Томи Шелби се враќа во бомбардираниот Бирмингем и се вклучува во тајни воени мисии, соочувајќи се со нови закани додека се справува со своето минато.', 'Sliki/Uploads/1782901812_Peaky Blinders The Immortal Man.jfif', 'https://www.youtube.com/embed/lcvUGs3xaDM', '2026-07-01 10:30:12', 0, 0),
(26, 'Micheal', 'Филм', 2026, 'Раниот живот на музичарот Мајкл Џексон, од откривањето на неговиот талент како водач на бендот „Џексон Фајв“ до уметникот чија креативна амбиција го поттикнала стремежот да стане најголемиот забавувач во светот.', 'Sliki/Uploads/1782902672_Micheal.jfif', 'https://www.youtube.com/embed/3zOLzsbOleM', '2026-07-01 10:44:32', 0, 0),
(27, 'Legally Blonde', 'Филм', 2001, 'Модната кралица на женските здруженија Ел Вудс го следи своето поранешно момче на правен факултет, каде што открива дека има нешто повеќе во неа отколку само изглед.', 'Sliki/Uploads/1782903432_Legally Blonde.jfif', 'https://www.youtube.com/embed/vWOHwI_FgAo', '2026-07-01 10:57:12', 0, 0),
(28, 'The Blacklist', 'Серија', 2013, 'Целиот живот на новата профилерка на ФБИ, Елизабет Кин, е уништен кога мистериозниот криминалец, Рејмонд Редингтон, кој со децении избегнува апсење, се предава и инсистира да разговара само со неа.', 'Sliki/Uploads/1782904045_The Blacklist.jfif', 'https://www.youtube.com/embed/JGBIimq1I3A', '2026-07-01 11:07:25', 10, 218),
(29, 'Modern Family', 'Серија', 2009, 'Три различни, но поврзани, семејства се соочуваат со искушенија и неволји на свој уникатен комичен начин.', 'Sliki/Uploads/1783071434_Modern Family.jpg', 'https://www.youtube.com/embed/rbpTUPisA78', '2026-07-01 11:20:10', 11, 250),
(30, 'Rush Hour 2', 'Филм', 2001, 'Картер и Ли одат во Хонг Конг на одмор, но се вмешуваат во измама со фалсификувани пари.', 'Sliki/Uploads/1783007317_Rush Hour 2.jpg', 'https://www.youtube.com/embed/Zr5YfE8bG_k', '2026-07-02 15:48:37', 0, 0),
(31, 'Rush Hour 3', 'Филм', 2007, 'По обидот за атентат врз амбасадорот Хан, Ли и Картер се упатуваат кон Париз за да заштитат Французинка која ги познава тајните водачи на Тријадите.', 'Sliki/Uploads/1783007853_Rush Hour 3.jfif', 'https://www.youtube.com/embed/FRDRWXfQyJE', '2026-07-02 15:57:33', 0, 0),
(32, 'Prison Break: The Final Break', 'Филм', 2009, 'Мајкл и Сара се венчаваат, но среќата е краткотрајна кога Федералците ја апсат за убиството на мајката на Мајкл, Кристина. Откако ќе се нареди атентат врз Сара, тимот се обединува за да ја ослободи сè поранливата цел.', 'Sliki/Uploads/1783008733_Prison Break The Final Break.jfif', 'https://www.youtube.com/embed/MpnDkLGlhvk', '2026-07-02 16:12:13', 0, 0),
(33, 'Magnum P.I.', 'Серија', 1980, 'Авантурите на приватен истражител од Хаваи.', 'Sliki/Uploads/1783011185_Magnum, P.I. 1988.jfif', 'https://www.youtube.com/embed/JpbYobFEjTQ', '2026-07-02 16:53:05', 8, 158),
(34, 'Magnum P.I.(2018-2024)', 'Серија', 2018, 'Поранешен припадник на морнаричките „фоки“ се враќа од Авганистан и ги користи своите воени вештини за да стане приватен истражител на Хаваи.', 'Sliki/Uploads/1783012019_Magnum, P.I..jfif', 'https://www.youtube.com/embed/jANpo1gntcI', '2026-07-02 17:06:59', 5, 96),
(35, 'Friends', 'Серија', 1994, 'Личниот и професионалниот живот на шест пријатели кои живеат во населбата Менхетен во Њујорк.', 'Sliki/Uploads/1783012835_Friends.jfif', 'https://www.youtube.com/embed/Zg2LCD5QOJs', '2026-07-02 17:20:35', 10, 234),
(36, 'Hotel Transylvania', 'Филм', 2012, 'Дракула, кој управува со луксузен хотел далеку од човечкиот свет, станува претерано заштитнички настроен кога едно момче го открива хотелот и се заљубува во тинејџерската ќерка на грофот.', 'Sliki/Uploads/1783073145_Hotel Transylvania.jpg', 'https://www.youtube.com/embed/q4RK3jY7AVk', '2026-07-03 10:05:45', 0, 0),
(37, 'Hotel Transylvania 2', 'Филм', 2015, 'Дракула и неговите пријатели се обидуваат да го извлечат чудовиштето во неговиот внук, получовек, полувампир, за да ја спречат Мејвис да го напушти хотелот.', 'Sliki/Uploads/1783073699_Hotel Transylvania 2.jpg', 'https://www.youtube.com/embed/T3nqmGgnJe8', '2026-07-03 10:14:59', 0, 0),
(38, 'Hotel Transylvania 3: Summer Vacation', 'Филм', 2018, 'Грофот Дракула и неговата компанија учествуваат во крстарење за чудовишта што ги сакаат морето, несвесни дека нивниот брод е запленет од семејството Ван Хелсинг кое ги мрази чудовиштата.', 'Sliki/Uploads/1783074162_Hotel Transylvania 3 Summer Vacation.jfif', 'https://www.youtube.com/embed/Ku52zNnft8k', '2026-07-03 10:22:42', 0, 0),
(39, 'Hotel Transylvania 4: Transformania', 'Филм', 2022, 'По еден експеримент, Џони се претвора во чудовиште, а сите други стануваат луѓе. Сега треба да се види дали ќе можат да го поништат овој експеримент.', 'Sliki/Uploads/1783074752_Hotel Transylvania 4 Transformania.jpg', 'https://www.youtube.com/embed/7AP86CYeR30', '2026-07-03 10:32:32', 0, 0),
(40, 'The Middle', 'Серија', 2009, 'The daily mishaps of a married woman and her semi-dysfunctional family and their attempts to survive life in general in the town of Orson, Indiana.', 'Sliki/Uploads/1783075602_The Middle.jpg', 'https://www.youtube.com/embed/_j2po1y6tvE', '2026-07-03 10:46:42', 9, 215),
(41, 'Full House', 'Серија', 1987, 'Вдовец, спортски коментатор, ги одгледува своите три ќерки со помош од неговиот рокенрол зет и луд најдобар пријател.', 'Sliki/Uploads/1783076390_Full House.jfif', 'https://www.youtube.com/embed/SDP7__2F1YE', '2026-07-03 10:59:50', 8, 193),
(42, 'Last Man Standing', 'Серија', 2011, 'Оженет татко на три деца се обидува да ја задржи својата машкост во свет во кој сè повеќе доминираат жени.', 'Sliki/Uploads/1783082943_Last Man Standing.jfif', 'https://www.youtube.com/embed/8j8ytWbs2e4', '2026-07-03 12:49:03', 9, 194),
(43, 'iCarly', 'Серија', 2007, 'Карли е домаќин на свое домашно веб-шоу, iCarly, а редовните веб-емисии на Карли и нејзиниот помошник Сем во крајна линија вклучуваат сè, од комични скечеви и натпревари за таленти, до интервјуа, рецепти и решавање проблеми.', 'Sliki/Uploads/1783083893_iCarly.jpg', 'https://www.youtube.com/embed/UZPdQyXl-Lo', '2026-07-03 13:04:53', 6, 95),
(44, 'Baywatch', 'Серија', 1989, 'Ги следи професионалните и личните животи на спасувачите кои патролираат по преполните плажи на округот Лос Анџелес во Калифорнија (а подоцна и на Хаваи).', 'Sliki/Uploads/1783084581_Baywatch.jfif', 'https://www.youtube.com/embed/O0nqwgu_Us4', '2026-07-03 13:16:21', 11, 243),
(45, 'The Sheep Detectives', 'Филм', 2026, 'Секоја вечер овчар гласно чита мистериозно убиство, преправајќи се дека неговите овци можат да разберат. Кога е пронајден мртов, овците веднаш сфаќаат дека станува збор за убиство и мислат дека знаат сè за тоа како да го решат.', 'Sliki/Uploads/1783085366_The Sheep detectives.jpg', 'https://www.youtube.com/embed/pyZI5oM6hWk', '2026-07-03 13:29:26', 0, 0),
(46, 'Supergirl', 'Филм', 2026, 'Кара Зор-Ел, позната и како Супердевојка, се здружува со неочекувана придружничка на меѓуѕвездено патување на одмазда и правда кога неочекуван непријател ќе налета премногу блиску до домот.', 'Sliki/Uploads/1783086145_supergirl.jfif', 'https://www.youtube.com/embed/s1-pfiVMKAs', '2026-07-03 13:42:25', 0, 0),
(47, 'Obsession', 'Филм', 2025, 'Откако ќе ја скрши мистериозната „Врба со една желба“ за да го освои срцето на својата симпатија, еден безнадежен романтичар се наоѓа себеси како добива точно она што го барал, но наскоро открива дека некои желби доаѓаат со мрачна, злокобна цена.', 'Sliki/Uploads/1783090533_Obsession.jpg', 'https://www.youtube.com/embed/gMC8kkwbIQQ', '2026-07-03 14:55:33', 0, 0),
(48, 'The Office', 'Серија', 2005, 'Мокументарец за група типични канцелариски работници, каде што работниот ден се состои од судири на егото, несоодветно однесување, досада и романса.', 'Sliki/Uploads/1783091334_The office.jpg', 'https://www.youtube.com/embed/MIEVoulYZM0', '2026-07-03 15:08:54', 9, 191),
(49, 'The Rookie', 'Серија', 2018, 'Да се ​​почне одново не е лесно, особено за Џон Нолан, кој по еден инцидент што му го променил животот, го остварува својот сон да се приклучи на полицијата на Лос Анџелес. Како нивен најстар почетник, тој е скептицизам од оние кои го гледаат како само пеш во криза на средни години.', 'Sliki/Uploads/1783092080_the rookie.jpg', 'https://www.youtube.com/embed/8BPlx6eK1vc', '2026-07-03 15:21:20', 8, 145),
(50, 'Brooklyn Nine-Nine', 'Серија', 2013, 'Комедија серија што ги следи подвизите на детектив Џејк Пералта и неговите разновидни, мили колеги додека ја полицираат 99-тата полициска станица на њујоршката полиција.', 'Sliki/Uploads/1783092644_brooklyn nine-nine.jfif', 'https://www.youtube.com/embed/sEOuJ4z5aTc', '2026-07-03 15:30:44', 8, 153),
(51, '2 Broke Girls', 'Серија', 2011, 'Две млади европско-американски жени кои работат како келнерки во ресторан со масни лажици склучуваат неочекувано пријателство со надеж дека ќе започнат успешен бизнис - само ако можат да соберат пари.', 'Sliki/Uploads/1783095311_2 broke girls.jfif', 'https://www.youtube.com/embed/G3blWoO5KJs', '2026-07-03 16:15:11', 6, 138),
(52, '24', 'Серија', 2001, 'Агентот за борба против тероризмот, Џек Бауер, се трка со времето за да ги поткопа терористичките заговори и да ја спаси својата нација од најголема катастрофа.', 'Sliki/Uploads/1783096195_24.jpg', 'https://www.youtube.com/embed/-Tldme1j_Ec', '2026-07-03 16:29:55', 8, 192),
(53, 'Narcos', 'Серија', 2015, 'Хроничен поглед на криминалните подвизи на колумбискиот наркобос Пабло Ескобар, како и на многуте други наркобосови кои ја мачеа земјата низ годините.', 'Sliki/Uploads/1783096878_narcos.jfif', 'https://www.youtube.com/embed/xl8zdCY-abw', '2026-07-03 16:41:18', 3, 30),
(54, 'The Wire', 'Серија', 2002, 'Нарко-сцената во Балтимор, видена низ очите на дилерите на дрога и органите за спроведување на законот.', 'Sliki/Uploads/1783097479_the wire.jfif', 'https://www.youtube.com/embed/apZQlqPp6Hs', '2026-07-03 16:51:19', 5, 60),
(55, 'Prespav', 'Серија', 2016, '„Преспав“, пансион во Преспанскиот регион на Македонија, претставува метафора за реалните општествени случувања во земјата, суштинскиот балкански менталитет и борбата на ликовите од која тие не можат да избегаат.', 'Sliki/Uploads/1783098554_prespav.jfif', 'https://www.youtube.com/embed/kongleLnLFU', '2026-07-03 17:09:14', 7, 154),
(56, 'Dexter', 'Серија', 2006, 'Тој е паметен. Тој е симпатичен. Тој е Декстер Морган, омилениот сериски убиец во Америка, кој ги поминува деновите решавајќи злосторства, а ноќите извршувајќи ги.', 'Sliki/Uploads/1783185405_Dexter.jfif', 'https://www.youtube.com/embed/YQeUmSD1c3g', '2026-07-04 17:16:45', 8, 96),
(57, 'Dexter: Resurrection', 'Серија', 2025, 'Декстер Морган се буди од кома и тргнува кон Њујорк, решен да го пронајде Харисон и да ги поправи работите. Но, кога Ангел Батиста од „Мајами Метро“ пристигнува со прашања, Декстер сфаќа дека неговото минато брзо го стигнува.', 'Sliki/Uploads/1783186086_dexter resurrection.jfif', 'https://www.youtube.com/embed/84o1Q6fB20k', '2026-07-04 17:28:06', 1, 20),
(58, 'Dexter: New Blood', 'Серија', 2021, 'Десет години откако ја лажирал својата смрт во Мајами и се преселил во северниот дел на Њујорк под лажно име, Декстер добива неочекувана посета од синот што го напуштил.', 'Sliki/Uploads/1783186688_dexter new blood.jfif', 'https://www.youtube.com/embed/84o1Q6fB20k', '2026-07-04 17:38:08', 1, 10),
(59, 'Dexter: Original Sin', 'Серија', 2024, 'Младиот Декстер Морган преминува во одмазднички сериски убиец.', 'Sliki/Uploads/1783187289_dexter original sin.jfif', 'https://www.youtube.com/embed/Bw8ZdQpVtdU', '2026-07-04 17:48:09', 1, 10),
(60, 'Chernobyl', 'Серија', 2019, 'Во април 1986 година, градот Чернобил во Советскиот Сојуз претрпе една од најлошите нуклеарни катастрофи во историјата на човештвото. Како последица на тоа, многу херои ги ризикуваа своите животи во наредните денови, недели и месеци.', 'Sliki/Uploads/1783187854_chernobyl.jfif', 'https://www.youtube.com/embed/s9APLXM9Ei8', '2026-07-04 17:57:34', 1, 5),
(61, ' Sherlock ', 'Серија', 2010, 'Во современ Лондон, брилијантниот, но ексцентричен детектив Шерлок Холмс се здружува со воениот ветеран д-р Џон Вотсон за да откријат збунувачки злосторства, да надмудрат страшни непријатели и да му помогнат на Скотланд Јард со остри заклучоци.', 'Sliki/Uploads/1783188631_sherlock.jfif', 'https://www.youtube.com/embed/y9ZouUyPKx8', '2026-07-04 18:10:31', 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `movie_actors`
--

CREATE TABLE `movie_actors` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_actors`
--

INSERT INTO `movie_actors` (`movie_id`, `actor_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(13, 21),
(13, 22),
(13, 23),
(13, 24),
(13, 25),
(14, 26),
(14, 27),
(14, 28),
(14, 29),
(14, 30),
(15, 31),
(15, 32),
(15, 33),
(15, 34),
(15, 35),
(16, 36),
(16, 37),
(16, 38),
(16, 39),
(16, 40),
(17, 41),
(17, 42),
(17, 43),
(17, 44),
(17, 45),
(18, 46),
(18, 47),
(18, 48),
(18, 49),
(18, 50),
(19, 51),
(19, 52),
(19, 53),
(19, 54),
(19, 55),
(20, 54),
(20, 56),
(20, 57),
(20, 58),
(20, 59),
(21, 60),
(21, 61),
(21, 62),
(21, 63),
(21, 64),
(22, 28),
(22, 65),
(22, 66),
(22, 67),
(22, 68),
(23, 69),
(23, 70),
(23, 71),
(23, 72),
(23, 73),
(24, 74),
(24, 75),
(24, 76),
(24, 77),
(24, 78),
(25, 74),
(25, 76),
(25, 79),
(25, 80),
(25, 81),
(26, 82),
(26, 83),
(26, 84),
(26, 85),
(26, 86),
(27, 87),
(27, 88),
(27, 89),
(27, 90),
(27, 91),
(28, 92),
(28, 93),
(28, 94),
(28, 95),
(28, 96),
(29, 97),
(29, 98),
(29, 99),
(29, 100),
(29, 101),
(30, 41),
(30, 42),
(30, 102),
(30, 103),
(30, 104),
(31, 41),
(31, 42),
(31, 45),
(31, 105),
(31, 106),
(32, 11),
(32, 13),
(32, 14),
(32, 15),
(32, 107),
(33, 108),
(33, 109),
(33, 110),
(33, 111),
(33, 112),
(34, 113),
(34, 114),
(34, 115),
(34, 116),
(34, 117),
(35, 118),
(35, 119),
(35, 120),
(35, 121),
(35, 122),
(35, 123),
(36, 124),
(36, 125),
(36, 126),
(36, 127),
(36, 128),
(37, 124),
(37, 125),
(37, 126),
(37, 127),
(37, 129),
(38, 124),
(38, 125),
(38, 126),
(38, 127),
(38, 128),
(39, 126),
(39, 127),
(39, 129),
(39, 130),
(39, 131),
(40, 132),
(40, 133),
(40, 134),
(40, 135),
(40, 136),
(41, 137),
(41, 138),
(41, 139),
(41, 140),
(41, 141),
(42, 142),
(42, 143),
(42, 144),
(42, 145),
(42, 146),
(43, 147),
(43, 148),
(43, 149),
(43, 150),
(43, 151),
(44, 152),
(44, 153),
(44, 154),
(44, 155),
(44, 156),
(45, 157),
(45, 158),
(45, 159),
(45, 160),
(45, 161),
(46, 162),
(46, 163),
(46, 164),
(46, 165),
(46, 166),
(47, 167),
(47, 168),
(47, 169),
(47, 170),
(47, 171),
(48, 172),
(48, 173),
(48, 174),
(48, 175),
(48, 176),
(49, 177),
(49, 178),
(49, 179),
(49, 180),
(49, 181),
(50, 126),
(50, 182),
(50, 183),
(50, 184),
(50, 185),
(51, 186),
(51, 187),
(51, 188),
(51, 189),
(51, 190),
(52, 191),
(52, 192),
(52, 193),
(52, 194),
(52, 195),
(53, 196),
(53, 197),
(53, 198),
(53, 199),
(53, 200),
(54, 201),
(54, 202),
(54, 203),
(54, 204),
(54, 205),
(55, 206),
(55, 207),
(55, 208),
(55, 209),
(55, 210),
(56, 211),
(56, 212),
(56, 213),
(56, 214),
(56, 215),
(57, 214),
(57, 216),
(57, 217),
(57, 218),
(57, 219),
(58, 216),
(58, 218),
(58, 220),
(58, 221),
(58, 222),
(59, 223),
(59, 224),
(59, 225),
(59, 226),
(59, 227),
(60, 228),
(60, 229),
(60, 230),
(60, 231),
(60, 232),
(61, 233),
(61, 234),
(61, 235),
(61, 236),
(61, 237);

-- --------------------------------------------------------

--
-- Table structure for table `movie_directors`
--

CREATE TABLE `movie_directors` (
  `movie_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_directors`
--

INSERT INTO `movie_directors` (`movie_id`, `director_id`) VALUES
(1, 38),
(2, 43),
(3, 42),
(13, 38),
(13, 39),
(14, 44),
(15, 45),
(16, 46),
(20, 47),
(21, 48),
(22, 45),
(23, 40),
(24, 41),
(28, 49),
(29, 50),
(30, 1),
(31, 1),
(32, 2),
(32, 3),
(33, 4),
(34, 6),
(35, 8),
(35, 9),
(36, 10),
(37, 10),
(38, 10),
(39, 11),
(39, 12),
(40, 13),
(40, 14),
(41, 15),
(42, 16),
(43, 17),
(44, 18),
(44, 19),
(44, 20),
(45, 21),
(46, 22),
(47, 23),
(48, 24),
(49, 25),
(50, 26),
(50, 27),
(51, 28),
(51, 29),
(52, 30),
(52, 31),
(53, 32),
(53, 33),
(53, 34),
(54, 35),
(55, 36),
(55, 37),
(56, 51),
(57, 52),
(58, 52),
(59, 52),
(60, 53),
(61, 54),
(61, 55);

-- --------------------------------------------------------

--
-- Table structure for table `movie_genres`
--

CREATE TABLE `movie_genres` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_genres`
--

INSERT INTO `movie_genres` (`movie_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 18),
(13, 1),
(13, 2),
(14, 7),
(14, 9),
(15, 7),
(16, 2),
(16, 10),
(16, 12),
(17, 1),
(17, 3),
(17, 7),
(17, 18),
(18, 2),
(18, 17),
(19, 3),
(19, 4),
(19, 7),
(19, 9),
(19, 10),
(20, 7),
(20, 10),
(20, 12),
(21, 1),
(21, 2),
(21, 3),
(21, 7),
(21, 10),
(22, 7),
(22, 9),
(23, 1),
(23, 2),
(23, 3),
(23, 14),
(23, 18),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(25, 11),
(26, 2),
(26, 6),
(26, 11),
(26, 13),
(27, 7),
(27, 15),
(28, 1),
(28, 2),
(28, 14),
(28, 18),
(29, 2),
(29, 7),
(29, 15),
(30, 1),
(30, 3),
(30, 7),
(30, 18),
(31, 1),
(31, 3),
(31, 7),
(31, 18),
(32, 2),
(32, 3),
(32, 18),
(33, 1),
(33, 3),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(34, 14),
(34, 18),
(35, 7),
(35, 15),
(36, 5),
(36, 7),
(36, 10),
(36, 12),
(37, 4),
(37, 5),
(37, 7),
(37, 10),
(37, 12),
(38, 5),
(38, 7),
(38, 10),
(38, 12),
(38, 15),
(39, 4),
(39, 5),
(39, 7),
(39, 10),
(39, 12),
(40, 1),
(40, 9),
(41, 2),
(41, 7),
(42, 7),
(43, 7),
(43, 9),
(43, 15),
(44, 1),
(44, 2),
(44, 3),
(44, 4),
(44, 15),
(45, 4),
(45, 7),
(45, 9),
(45, 14),
(46, 2),
(46, 3),
(46, 4),
(46, 16),
(47, 12),
(47, 15),
(47, 18),
(48, 7),
(49, 1),
(49, 2),
(49, 3),
(50, 1),
(50, 7),
(51, 7),
(52, 1),
(52, 2),
(52, 3),
(52, 18),
(53, 1),
(53, 2),
(53, 6),
(54, 1),
(54, 2),
(54, 18),
(55, 7),
(56, 1),
(56, 2),
(56, 14),
(56, 18),
(57, 1),
(57, 2),
(57, 14),
(57, 18),
(58, 1),
(58, 2),
(58, 14),
(59, 1),
(59, 2),
(59, 14),
(60, 2),
(60, 11),
(60, 18),
(61, 1),
(61, 2),
(61, 14),
(61, 18);

-- --------------------------------------------------------

--
-- Table structure for table `movie_platforms`
--

CREATE TABLE `movie_platforms` (
  `movie_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_platforms`
--

INSERT INTO `movie_platforms` (`movie_id`, `platform_id`) VALUES
(1, 1),
(2, 6),
(3, 2),
(3, 4),
(3, 5),
(13, 1),
(14, 1),
(14, 6),
(15, 6),
(16, 1),
(17, 6),
(18, 2),
(19, 2),
(19, 6),
(20, 1),
(21, 2),
(22, 2),
(23, 1),
(24, 1),
(25, 1),
(26, 2),
(26, 9),
(27, 1),
(27, 2),
(27, 6),
(28, 1),
(29, 4),
(29, 5),
(30, 1),
(30, 6),
(31, 2),
(31, 9),
(32, 2),
(34, 2),
(35, 1),
(35, 4),
(35, 6),
(36, 1),
(37, 1),
(38, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 4),
(41, 5),
(41, 9),
(42, 1),
(42, 4),
(42, 5),
(43, 1),
(43, 2),
(43, 7),
(44, 1),
(44, 2),
(45, 2),
(46, 6),
(47, 2),
(48, 1),
(48, 2),
(48, 5),
(48, 8),
(49, 2),
(49, 4),
(49, 5),
(50, 1),
(51, 2),
(52, 1),
(52, 2),
(52, 4),
(52, 5),
(53, 1),
(54, 1),
(54, 2),
(54, 4),
(54, 6),
(56, 1),
(57, 2),
(57, 4),
(57, 7),
(58, 2),
(58, 4),
(58, 7),
(59, 2),
(59, 4),
(59, 7),
(60, 1),
(60, 2),
(60, 6),
(60, 9),
(61, 1),
(61, 4),
(61, 5);

-- --------------------------------------------------------

--
-- Table structure for table `platforms`
--

CREATE TABLE `platforms` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `platforms`
--

INSERT INTO `platforms` (`id`, `name`, `logo`) VALUES
(1, 'Netflix', 'Sliki/Platforms/netflix.png'),
(2, 'Amazon Prime', 'Sliki/Platforms/amazon prime.png'),
(4, 'Hulu', 'Sliki/Platforms/Hulu.png'),
(5, 'Disney+', 'Sliki/Platforms/Disney.jfif'),
(6, 'HBO', 'Sliki/Platforms/HBO.jfif'),
(7, 'Paramount+', 'Sliki/Platforms/Paramount.png'),
(8, 'Peacock', 'Sliki/Platforms/peacock.jpg'),
(9, 'Apple TV+', 'Sliki/Platforms/apple tv.jfif');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `kreirano_na` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `kreirano_na` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watchlist`
--

CREATE TABLE `watchlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `kreirano_na` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_actors`
--
ALTER TABLE `movie_actors`
  ADD PRIMARY KEY (`movie_id`,`actor_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Indexes for table `movie_directors`
--
ALTER TABLE `movie_directors`
  ADD PRIMARY KEY (`movie_id`,`director_id`),
  ADD KEY `director_id` (`director_id`);

--
-- Indexes for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`movie_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `movie_platforms`
--
ALTER TABLE `movie_platforms`
  ADD PRIMARY KEY (`movie_id`,`platform_id`),
  ADD KEY `platform_id` (`platform_id`);

--
-- Indexes for table `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_actors`
--
ALTER TABLE `movie_actors`
  ADD CONSTRAINT `movie_actors_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_actors_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_directors`
--
ALTER TABLE `movie_directors`
  ADD CONSTRAINT `movie_directors_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_directors_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_platforms`
--
ALTER TABLE `movie_platforms`
  ADD CONSTRAINT `movie_platforms_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_platforms_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
