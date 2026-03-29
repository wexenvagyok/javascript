-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Már 29. 21:43
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `adatok`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csaladnev`
--

CREATE TABLE `csaladnev` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `csaladnev`
--

INSERT INTO `csaladnev` (`id`, `nev`) VALUES
(20, 'Babó'),
(21, 'Bacsu'),
(38, 'Bakos'),
(27, 'Bakró'),
(1, 'Balog'),
(44, 'Balogh'),
(22, 'Bencze'),
(53, 'Borbély'),
(45, 'Budai'),
(28, 'Bugát'),
(11, 'Burai'),
(50, 'Csik'),
(12, 'Csonka'),
(34, 'Dandás'),
(59, 'Duka'),
(2, 'Farkas'),
(13, 'Fátyol'),
(3, 'Fehér'),
(47, 'Fehérvári'),
(39, 'Fekete'),
(74, 'Fodor'),
(75, 'Gál'),
(62, 'Gazsó'),
(35, 'Gecse'),
(52, 'Geszti'),
(49, 'Góman'),
(4, 'Gondos'),
(76, 'Hegedűs'),
(54, 'Herczeg'),
(36, 'Hérmán'),
(65, 'Horváth'),
(29, 'Imre'),
(41, 'Iqbal'),
(30, 'Ivanics'),
(31, 'Jónás'),
(71, 'Juhász'),
(56, 'Katona'),
(55, 'Kelemen'),
(77, 'Kerekes'),
(66, 'Kiss'),
(78, 'Kocsis'),
(58, 'Kótai'),
(64, 'Kovács'),
(23, 'Lakatos'),
(37, 'Lólé'),
(70, 'Lukács'),
(14, 'Mága'),
(63, 'Majorszki'),
(5, 'Makula'),
(15, 'Mányi'),
(72, 'Mészáros'),
(67, 'Molnár'),
(6, 'Nagy'),
(46, 'Német'),
(68, 'Németh'),
(40, 'Oláh'),
(43, 'Palcsik'),
(69, 'Papp'),
(48, 'Poták'),
(7, 'Pozák'),
(24, 'Puzsoma'),
(8, 'Rácz'),
(16, 'Rattesid'),
(32, 'Réti'),
(17, 'Rostás'),
(73, 'Simon'),
(26, 'Susa'),
(51, 'Szabó'),
(18, 'Szallár'),
(61, 'Szilágyi'),
(57, 'Takács'),
(42, 'Tallósi'),
(19, 'Tóth'),
(9, 'Túró'),
(33, 'Tyukodi'),
(60, 'Váradi'),
(25, 'Varga'),
(10, 'Vitáris');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `diak`
--

CREATE TABLE `diak` (
  `id` int(11) NOT NULL,
  `csaladnev_id` int(11) NOT NULL,
  `utonev1_id` int(11) NOT NULL,
  `utonev2_id` int(11) DEFAULT NULL,
  `osztaly_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `diak`
--

INSERT INTO `diak` (`id`, `csaladnev_id`, `utonev1_id`, `utonev2_id`, `osztaly_id`) VALUES
(1, 1, 1, 136, 1),
(2, 2, 2, 168, 1),
(3, 2, 3, 126, 1),
(4, 3, 4, 169, 1),
(5, 3, 5, 170, 1),
(6, 3, 6, NULL, 1),
(7, 3, 7, 42, 1),
(8, 4, 2, NULL, 1),
(9, 5, 8, NULL, 1),
(10, 6, 9, 106, 1),
(11, 7, 10, NULL, 1),
(12, 7, 11, NULL, 1),
(13, 8, 12, NULL, 1),
(14, 9, 13, NULL, 1),
(15, 9, 14, 111, 1),
(16, 9, 15, NULL, 1),
(17, 9, 16, NULL, 1),
(18, 10, 14, 5, 1),
(19, 11, 17, 171, 2),
(20, 12, 18, NULL, 2),
(21, 13, 19, NULL, 2),
(22, 3, 20, 22, 2),
(23, 3, 21, NULL, 2),
(24, 3, 22, NULL, 2),
(25, 3, 23, 172, 2),
(26, 3, 24, 91, 2),
(27, 14, 25, NULL, 2),
(28, 15, 26, 35, 2),
(29, 6, 27, NULL, 2),
(30, 6, 23, NULL, 2),
(31, 6, 28, NULL, 2),
(32, 16, 29, NULL, 2),
(33, 17, 30, NULL, 2),
(34, 18, 4, 23, 2),
(35, 19, 4, 32, 2),
(36, 9, 31, 173, 2),
(37, 20, 32, NULL, 3),
(38, 21, 33, 110, 3),
(39, 22, 34, NULL, 3),
(40, 2, 35, NULL, 3),
(41, 13, 36, NULL, 3),
(42, 3, 37, 2, 3),
(43, 3, 38, 174, 3),
(44, 3, 25, NULL, 3),
(45, 3, 39, 10, 3),
(46, 3, 33, NULL, 3),
(47, 23, 40, NULL, 3),
(48, 23, 41, 27, 3),
(49, 24, 23, NULL, 3),
(50, 8, 25, 175, 3),
(51, 9, 23, 85, 3),
(52, 9, 42, 176, 3),
(53, 25, 43, NULL, 3),
(54, 2, 10, NULL, 4),
(55, 2, 12, 177, 4),
(56, 3, 4, 23, 4),
(57, 3, 33, NULL, 4),
(58, 3, 44, NULL, 4),
(59, 3, 42, 82, 4),
(60, 4, 33, 78, 4),
(61, 15, 45, NULL, 4),
(62, 7, 46, NULL, 4),
(63, 24, 30, NULL, 4),
(64, 8, 8, 178, 4),
(65, 26, 10, NULL, 4),
(66, 19, 47, 179, 4),
(67, 9, 36, 22, 4),
(68, 9, 48, NULL, 4),
(69, 9, 2, NULL, 4),
(70, 9, 49, 180, 4),
(71, 27, 50, 181, 5),
(72, 28, 51, NULL, 5),
(73, 12, 52, 133, 5),
(74, 12, 53, 38, 5),
(75, 12, 54, NULL, 5),
(76, 3, 27, NULL, 5),
(77, 3, 24, 182, 5),
(78, 3, 55, NULL, 5),
(79, 3, 56, 2, 5),
(80, 3, 3, NULL, 5),
(81, 29, 57, 63, 5),
(82, 30, 58, 22, 5),
(83, 31, 2, 56, 5),
(84, 7, 59, 183, 5),
(85, 8, 60, 95, 5),
(86, 32, 61, 184, 5),
(87, 9, 62, NULL, 5),
(88, 9, 12, 122, 5),
(89, 33, 63, 17, 5),
(90, 10, 4, NULL, 5),
(91, 28, 58, NULL, 6),
(92, 12, 64, NULL, 6),
(93, 12, 65, NULL, 6),
(94, 34, 66, NULL, 6),
(95, 2, 33, NULL, 6),
(96, 3, 67, 87, 6),
(97, 3, 58, 185, 6),
(98, 3, 36, NULL, 6),
(99, 3, 68, 63, 6),
(100, 3, 42, 174, 6),
(101, 35, 39, 44, 6),
(102, 36, 66, NULL, 6),
(103, 23, 69, 2, 6),
(104, 23, 70, NULL, 6),
(105, 23, 71, 55, 6),
(106, 37, 20, NULL, 6),
(107, 37, 24, NULL, 6),
(108, 6, 72, NULL, 6),
(109, 7, 73, 3, 6),
(110, 8, 21, 186, 6),
(111, 9, 13, 104, 6),
(112, 9, 12, 110, 6),
(113, 38, 74, 107, 7),
(114, 2, 20, 122, 7),
(115, 2, 75, NULL, 7),
(116, 13, 13, NULL, 7),
(117, 13, 14, 17, 7),
(118, 3, 76, NULL, 7),
(119, 3, 77, NULL, 7),
(120, 3, 11, NULL, 7),
(121, 39, 78, 11, 7),
(122, 39, 71, 187, 7),
(123, 4, 79, 12, 7),
(124, 37, 80, NULL, 7),
(125, 37, 81, NULL, 7),
(126, 40, 33, NULL, 7),
(127, 7, 82, 3, 7),
(128, 9, 83, NULL, 7),
(129, 9, 84, 135, 7),
(130, 9, 85, 173, 7),
(131, 9, 86, 188, 7),
(132, 27, 4, 3, 8),
(133, 2, 70, 6, 8),
(134, 2, 87, NULL, 8),
(135, 13, 65, 148, 8),
(136, 3, 88, NULL, 8),
(137, 3, 89, NULL, 8),
(138, 3, 90, 189, 8),
(139, 3, 91, NULL, 8),
(140, 3, 92, 138, 8),
(141, 41, 93, NULL, 8),
(142, 23, 82, NULL, 8),
(143, 15, 94, 75, 8),
(144, 7, 39, 190, 8),
(145, 24, 70, NULL, 8),
(146, 24, 91, NULL, 8),
(147, 24, 2, NULL, 8),
(148, 42, 95, 191, 8),
(149, 9, 96, 24, 8),
(150, 9, 97, 72, 8),
(151, 33, 12, NULL, 8),
(152, 2, 98, 97, 9),
(153, 2, 23, NULL, 9),
(154, 3, 4, 192, 9),
(155, 3, 50, NULL, 9),
(156, 3, 91, NULL, 9),
(157, 3, 63, 102, 9),
(158, 3, 99, NULL, 9),
(159, 31, 22, NULL, 9),
(160, 23, 100, 87, 9),
(161, 6, 58, NULL, 9),
(162, 43, 86, 97, 9),
(163, 24, 14, NULL, 9),
(164, 9, 101, NULL, 9),
(165, 9, 102, NULL, 9),
(166, 9, 103, NULL, 9),
(167, 9, 2, NULL, 9),
(168, 9, 104, 58, 9),
(169, 9, 55, NULL, 9),
(170, 25, 76, 138, 9),
(171, 44, 3, 14, 10),
(172, 45, 105, NULL, 10),
(173, 2, 25, 60, 10),
(174, 2, 28, NULL, 10),
(175, 13, 94, 125, 10),
(176, 3, 14, NULL, 10),
(177, 3, 22, 91, 10),
(178, 3, 106, 119, 10),
(179, 6, 107, 98, 10),
(180, 46, 2, 70, 10),
(181, 40, 108, NULL, 10),
(182, 7, 109, 35, 10),
(183, 7, 28, NULL, 10),
(184, 24, 110, NULL, 10),
(185, 9, 111, NULL, 10),
(186, 9, 112, 141, 10),
(187, 20, 85, NULL, 11),
(188, 2, 14, 129, 11),
(189, 13, 91, NULL, 11),
(190, 3, 14, 42, 11),
(191, 3, 86, NULL, 11),
(192, 47, 58, 55, 11),
(193, 31, 113, 132, 11),
(194, 15, 70, 117, 11),
(195, 6, 50, 49, 11),
(196, 46, 25, NULL, 11),
(197, 24, 22, NULL, 11),
(198, 8, 25, NULL, 11),
(199, 9, 26, NULL, 11),
(200, 9, 114, 10, 11),
(201, 9, 105, NULL, 11),
(202, 9, 12, NULL, 11),
(203, 33, 115, NULL, 11),
(204, 1, 22, 97, 12),
(205, 2, 116, 63, 12),
(206, 13, 30, 193, 12),
(207, 13, 63, 126, 12),
(208, 13, 12, 194, 12),
(209, 3, 78, 33, 12),
(210, 31, 117, 195, 12),
(211, 23, 31, 102, 12),
(212, 48, 94, 87, 12),
(213, 24, 118, 196, 12),
(214, 9, 13, NULL, 12),
(215, 9, 119, 50, 12),
(216, 1, 63, 4, 13),
(217, 13, 120, 68, 13),
(218, 3, 2, NULL, 13),
(219, 3, 121, NULL, 13),
(220, 3, 94, 131, 13),
(221, 3, 122, NULL, 13),
(222, 3, 12, 117, 13),
(223, 3, 28, 55, 13),
(224, 31, 72, 36, 13),
(225, 23, 89, NULL, 13),
(226, 23, 63, NULL, 13),
(227, 6, 95, NULL, 13),
(228, 24, 33, 20, 13),
(229, 16, 35, NULL, 13),
(230, 9, 63, 147, 13),
(231, 9, 49, NULL, 13),
(232, 9, 105, NULL, 13),
(233, 9, 56, 191, 13),
(234, 9, 82, 197, 13),
(235, 27, 23, 21, 14),
(236, 12, 123, NULL, 14),
(237, 2, 13, NULL, 14),
(238, 2, 82, 198, 14),
(239, 3, 124, 36, 14),
(240, 3, 35, 105, 14),
(241, 3, 125, 27, 14),
(242, 3, 117, 138, 14),
(243, 3, 117, 22, 14),
(244, 49, 39, 140, 14),
(245, 23, 95, 36, 14),
(246, 15, 91, 199, 14),
(247, 24, 20, 91, 14),
(248, 19, 126, 200, 14),
(249, 19, 127, 5, 14),
(250, 9, 25, NULL, 14),
(251, 9, 4, NULL, 14),
(252, 9, 128, NULL, 14),
(253, 9, 35, 71, 14),
(254, 9, 104, 74, 14),
(255, 21, 3, 201, 15),
(256, 22, 31, NULL, 15),
(257, 50, 33, NULL, 15),
(258, 50, 86, NULL, 15),
(259, 13, 102, 153, 15),
(260, 3, 78, 33, 15),
(261, 3, 10, NULL, 15),
(262, 3, 26, 202, 15),
(263, 3, 111, NULL, 15),
(264, 3, 91, 103, 15),
(265, 3, 129, 197, 15),
(266, 3, 41, 171, 15),
(267, 4, 91, NULL, 15),
(268, 6, 4, NULL, 15),
(269, 51, 20, 47, 15),
(270, 9, 70, NULL, 15),
(271, 9, 124, NULL, 15),
(272, 33, 130, 202, 15),
(273, 12, 2, 104, 16),
(274, 13, 58, NULL, 16),
(275, 3, 131, 10, 16),
(276, 3, 14, 203, 16),
(277, 3, 70, NULL, 16),
(278, 3, 40, 204, 16),
(279, 3, 39, NULL, 16),
(280, 3, 91, 199, 16),
(281, 3, 110, NULL, 16),
(282, 3, 132, NULL, 16),
(283, 35, 11, NULL, 16),
(284, 7, 133, NULL, 16),
(285, 24, 91, NULL, 16),
(286, 24, 97, NULL, 16),
(287, 8, 58, NULL, 16),
(288, 51, 11, NULL, 16),
(289, 9, 134, 205, 16),
(290, 9, 42, NULL, 16),
(291, 22, 11, NULL, 17),
(292, 28, 4, 135, 17),
(293, 12, 135, NULL, 17),
(294, 2, 38, 4, 17),
(295, 3, 136, NULL, 17),
(296, 3, 10, 63, 17),
(297, 3, 26, 105, 17),
(298, 3, 28, NULL, 17),
(299, 52, 56, 60, 17),
(300, 30, 70, NULL, 17),
(301, 23, 55, NULL, 17),
(302, 14, 19, NULL, 17),
(303, 6, 111, NULL, 17),
(304, 7, 74, NULL, 17),
(305, 8, 117, NULL, 17),
(306, 42, 137, 120, 17),
(307, 9, 19, NULL, 17),
(308, 9, 110, 70, 17),
(309, 9, 122, NULL, 17),
(310, 53, 50, NULL, 18),
(311, 11, 35, 12, 18),
(312, 34, 58, 72, 18),
(313, 2, 122, 6, 18),
(314, 3, 138, NULL, 18),
(315, 3, 70, NULL, 18),
(316, 3, 139, 138, 18),
(317, 52, 14, 75, 18),
(318, 4, 29, 150, 18),
(319, 4, 4, 200, 18),
(320, 54, 117, 70, 18),
(321, 36, 138, NULL, 18),
(322, 55, 10, 147, 18),
(323, 23, 91, 45, 18),
(324, 37, 4, NULL, 18),
(325, 46, 6, 58, 18),
(326, 43, 8, 206, 18),
(327, 17, 27, NULL, 18),
(328, 9, 140, 207, 18),
(329, 33, 2, NULL, 18),
(330, 1, 35, NULL, 19),
(331, 11, 13, NULL, 19),
(332, 12, 141, NULL, 19),
(333, 13, 33, NULL, 19),
(334, 3, 26, NULL, 19),
(335, 3, 6, NULL, 19),
(336, 4, 142, 110, 19),
(337, 23, 50, 172, 19),
(338, 24, 141, NULL, 19),
(339, 24, 35, NULL, 19),
(340, 8, 63, 3, 19),
(341, 9, 143, NULL, 19),
(342, 9, 50, NULL, 19),
(343, 9, 97, NULL, 19),
(344, 33, 144, NULL, 19),
(345, 28, 124, 104, 20),
(346, 12, 138, NULL, 20),
(347, 13, 145, 208, 20),
(348, 3, 146, NULL, 20),
(349, 3, 28, NULL, 20),
(350, 36, 35, NULL, 20),
(351, 56, 147, 209, 20),
(352, 15, 55, 33, 20),
(353, 7, 112, 210, 20),
(354, 57, 148, NULL, 20),
(355, 9, 14, NULL, 20),
(356, 9, 22, NULL, 20),
(357, 9, 104, 211, 20),
(358, 9, 82, NULL, 20),
(359, 33, 149, NULL, 20),
(360, 2, 111, 100, 21),
(361, 3, 55, 60, 21),
(362, 4, 124, 36, 21),
(363, 54, 150, 147, 21),
(364, 55, 41, 198, 21),
(365, 58, 25, 177, 21),
(366, 23, 19, NULL, 21),
(367, 14, 89, NULL, 21),
(368, 8, 50, 102, 21),
(369, 16, 98, NULL, 21),
(370, 9, 138, NULL, 21),
(371, 9, 35, NULL, 21),
(372, 9, 91, NULL, 21),
(373, 9, 151, 117, 21),
(374, 21, 6, 138, 22),
(375, 45, 122, NULL, 22),
(376, 12, 70, 202, 22),
(377, 12, 26, NULL, 22),
(378, 12, 105, NULL, 22),
(379, 59, 50, 212, 22),
(380, 3, 35, 13, 22),
(381, 3, 122, NULL, 22),
(382, 35, 74, 30, 22),
(383, 4, 152, 31, 22),
(384, 58, 44, NULL, 22),
(385, 7, 153, 87, 22),
(386, 9, 100, NULL, 22),
(387, 9, 17, NULL, 22),
(388, 9, 154, NULL, 22),
(389, 9, 28, NULL, 22),
(390, 60, 102, NULL, 22),
(391, 11, 155, NULL, 23),
(392, 2, 10, NULL, 23),
(393, 2, 50, 213, 23),
(394, 2, 22, NULL, 23),
(395, 13, 156, NULL, 23),
(396, 3, 6, NULL, 23),
(397, 3, 157, NULL, 23),
(398, 4, 105, 33, 23),
(399, 31, 158, 48, 23),
(400, 23, 50, 214, 23),
(401, 37, 2, NULL, 23),
(402, 14, 100, NULL, 23),
(403, 24, 159, NULL, 23),
(404, 61, 50, NULL, 23),
(405, 9, 113, NULL, 23),
(406, 9, 63, NULL, 23),
(407, 60, 160, NULL, 23),
(408, 12, 91, 58, 24),
(409, 2, 161, NULL, 24),
(410, 3, 162, NULL, 24),
(411, 3, 25, NULL, 24),
(412, 3, 109, 35, 24),
(413, 3, 35, NULL, 24),
(414, 3, 163, NULL, 24),
(415, 3, 55, NULL, 24),
(416, 3, 142, 22, 24),
(417, 62, 105, NULL, 24),
(418, 4, 164, 63, 24),
(419, 14, 91, NULL, 24),
(420, 14, 94, NULL, 24),
(421, 63, 87, 17, 24),
(422, 6, 165, 49, 24),
(423, 24, 166, 101, 24),
(424, 8, 147, 178, 24),
(425, 9, 167, 151, 24);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `osztaly`
--

CREATE TABLE `osztaly` (
  `id` int(11) NOT NULL,
  `megnevezes` varchar(10) NOT NULL,
  `osztalyfonok_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `osztaly`
--

INSERT INTO `osztaly` (`id`, `megnevezes`, `osztalyfonok_id`) VALUES
(1, '1/A', 1),
(2, '1/B', 2),
(3, '1/C', 3),
(4, '2/A', 4),
(5, '2/B', 5),
(6, '2/C', 6),
(7, '3/A', 7),
(8, '3/B', 8),
(9, '3/C', 9),
(10, '4/A', 10),
(11, '4/B', 11),
(12, '4/C', 12),
(13, '5/A', 13),
(14, '5/B', 14),
(15, '5/C', 15),
(16, '6/A', 16),
(17, '6/B', 17),
(18, '6/C', 18),
(19, '7/A', 19),
(20, '7/B', 20),
(21, '7/C', 21),
(22, '8/A', 22),
(23, '8/B', 23),
(24, '8/C', 24);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanar`
--

CREATE TABLE `tanar` (
  `id` int(11) NOT NULL,
  `csaladnev_id` int(11) NOT NULL,
  `utonev1_id` int(11) NOT NULL,
  `utonev2_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `tanar`
--

INSERT INTO `tanar` (`id`, `csaladnev_id`, `utonev1_id`, `utonev2_id`) VALUES
(1, 64, 72, NULL),
(2, 6, 171, NULL),
(3, 51, 120, NULL),
(4, 19, 19, NULL),
(5, 25, 207, NULL),
(6, 2, 6, NULL),
(7, 65, 215, NULL),
(8, 66, 95, NULL),
(9, 67, 114, NULL),
(10, 68, 60, NULL),
(11, 39, 87, NULL),
(12, 44, 58, NULL),
(13, 69, 201, NULL),
(14, 70, 56, NULL),
(15, 71, 176, NULL),
(16, 72, 149, NULL),
(17, 73, 216, NULL),
(18, 8, 104, NULL),
(19, 74, 133, NULL),
(20, 75, 28, NULL),
(21, 76, 217, NULL),
(22, 61, 101, NULL),
(23, 77, 178, NULL),
(24, 78, 55, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `utonev`
--

CREATE TABLE `utonev` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `utonev`
--

INSERT INTO `utonev` (`id`, `nev`) VALUES
(69, 'Ábel'),
(211, 'Ádám'),
(37, 'Adrián'),
(162, 'Adrienn'),
(93, 'Ahmed'),
(88, 'Ákos'),
(78, 'Alex'),
(126, 'Alexandra'),
(52, 'Alíz'),
(137, 'Amanda'),
(38, 'Amira'),
(143, 'Anasztázia'),
(60, 'András'),
(178, 'Andrea'),
(140, 'Angelika'),
(174, 'Anikó'),
(171, 'Anna'),
(66, 'Annabell'),
(89, 'Annabella'),
(168, 'Antal'),
(172, 'Aranka'),
(30, 'Armandó'),
(156, 'Arnold'),
(107, 'Áron'),
(101, 'Attila'),
(195, 'Balázs'),
(148, 'Barbara'),
(46, 'Beatrix'),
(13, 'Béla'),
(202, 'Bence'),
(76, 'Benjámin'),
(31, 'Bianka'),
(204, 'Blanka'),
(102, 'Boglárka'),
(136, 'Brendon'),
(203, 'Brigitta'),
(134, 'Brúnó'),
(131, 'Cintia'),
(149, 'Csaba'),
(14, 'Csenge'),
(135, 'Csilla'),
(138, 'Dániel'),
(20, 'Dávid'),
(113, 'Debóra'),
(83, 'Dénes'),
(1, 'Denisz'),
(130, 'Dezső'),
(29, 'Diána'),
(70, 'Dominik'),
(164, 'Dominika'),
(190, 'Dóra'),
(79, 'Dorián'),
(10, 'Dorina'),
(62, 'Dzsamilla'),
(188, 'Dzsasztin'),
(100, 'Dzsenifer'),
(213, 'Edit'),
(194, 'Eduárdó'),
(179, 'Elemér'),
(159, 'Elizabet'),
(209, 'Emília'),
(175, 'Endre'),
(26, 'Erik'),
(198, 'Erika'),
(103, 'Ernő'),
(17, 'Erzsébet'),
(176, 'Eszter'),
(120, 'Éva'),
(21, 'Fanni'),
(67, 'Fédra'),
(74, 'Ferenc'),
(118, 'Florina'),
(34, 'Friderika'),
(40, 'Fruzsina'),
(19, 'Gábor'),
(161, 'Georgina'),
(25, 'Gergő'),
(141, 'Gyula'),
(64, 'Hajnalka'),
(4, 'Hanna'),
(123, 'Henrietta'),
(53, 'Hermina'),
(133, 'Ildikó'),
(47, 'Imre'),
(214, 'Irma'),
(72, 'István'),
(139, 'Iván'),
(5, 'Ivett'),
(90, 'Izabella'),
(124, 'János'),
(50, 'Jázmin'),
(98, 'Jenő'),
(153, 'Jolán'),
(15, 'Jonatán'),
(58, 'József'),
(114, 'Judit'),
(109, 'Kálmán'),
(39, 'Kamilla'),
(170, 'Karola'),
(111, 'Karolina'),
(128, 'Károly'),
(207, 'Katalin'),
(27, 'Ketrin'),
(35, 'Kevin'),
(84, 'Kiara'),
(127, 'Kincső'),
(200, 'Kinga'),
(61, 'Kira'),
(169, 'Klaudia'),
(96, 'Kornél'),
(36, 'Kristóf'),
(22, 'Krisztián'),
(217, 'Krisztina'),
(91, 'Krisztofer'),
(80, 'Lana'),
(119, 'Larissza'),
(95, 'László'),
(106, 'Laura'),
(166, 'Lehel'),
(63, 'Leila'),
(206, 'Léna'),
(180, 'Léni'),
(48, 'Letícia'),
(2, 'Levente'),
(49, 'Liliána'),
(121, 'Lilla'),
(9, 'Lina'),
(181, 'Lola'),
(18, 'Lolita'),
(59, 'Lorina'),
(54, 'Luca'),
(108, 'Marcell'),
(87, 'Mária'),
(154, 'Marianna'),
(45, 'Márk'),
(199, 'Márkó'),
(105, 'Martin'),
(152, 'Martina'),
(193, 'Márton'),
(151, 'Máté'),
(75, 'Melinda'),
(94, 'Melissza'),
(129, 'Melodi'),
(104, 'Miklós'),
(33, 'Milán'),
(73, 'Mirabella'),
(99, 'Miranda'),
(23, 'Mirella'),
(77, 'Mirjam'),
(186, 'Napsugár'),
(116, 'Natália'),
(8, 'Nelli'),
(97, 'Nikolasz'),
(44, 'Nikolett'),
(85, 'Nikoletta'),
(182, 'Nimród'),
(43, 'Noé'),
(24, 'Noel'),
(163, 'Noémi'),
(92, 'Norbert'),
(155, 'Norman'),
(187, 'Pál'),
(110, 'Patrik'),
(6, 'Péter'),
(208, 'Ráhel'),
(158, 'Ramóna'),
(16, 'Raul'),
(173, 'Rebeka'),
(32, 'Regina'),
(189, 'Réka'),
(165, 'Renáta'),
(210, 'Renátó'),
(122, 'Richárd'),
(191, 'Rikárdó'),
(184, 'Rita'),
(55, 'Róbert'),
(86, 'Roland'),
(112, 'Rómeó'),
(125, 'Róza'),
(51, 'Rozália'),
(12, 'Sándor'),
(192, 'Sára'),
(196, 'Szabina'),
(146, 'Szabolcs'),
(142, 'Szebasztián'),
(177, 'Szilveszter'),
(68, 'Szilvia'),
(132, 'Szimonetta'),
(7, 'Szofia'),
(160, 'Sztella'),
(56, 'Tamás'),
(115, 'Tekla'),
(183, 'Terézia'),
(185, 'Tibor'),
(65, 'Tifani'),
(216, 'Tímea'),
(144, 'Tina'),
(57, 'Titanilla'),
(41, 'Valentina'),
(82, 'Vanessza'),
(117, 'Viktor'),
(3, 'Viktória'),
(205, 'Vilmos'),
(157, 'Viola'),
(150, 'Violetta'),
(147, 'Virág'),
(145, 'Virgínia'),
(197, 'Vivien'),
(215, 'Zita'),
(28, 'Zoltán'),
(81, 'Zselyke'),
(71, 'Zsigmond'),
(42, 'Zsófia'),
(11, 'Zsolt'),
(167, 'Zsombor'),
(212, 'Zsüliett'),
(201, 'Zsuzsanna');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `csaladnev`
--
ALTER TABLE `csaladnev`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A tábla indexei `diak`
--
ALTER TABLE `diak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `csaladnev_id` (`csaladnev_id`),
  ADD KEY `utonev1_id` (`utonev1_id`),
  ADD KEY `utonev2_id` (`utonev2_id`),
  ADD KEY `osztaly_id` (`osztaly_id`);

--
-- A tábla indexei `osztaly`
--
ALTER TABLE `osztaly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `megnevezes` (`megnevezes`),
  ADD KEY `osztalyfonok_id` (`osztalyfonok_id`);

--
-- A tábla indexei `tanar`
--
ALTER TABLE `tanar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `csaladnev_id` (`csaladnev_id`),
  ADD KEY `utonev1_id` (`utonev1_id`),
  ADD KEY `utonev2_id` (`utonev2_id`);

--
-- A tábla indexei `utonev`
--
ALTER TABLE `utonev`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `csaladnev`
--
ALTER TABLE `csaladnev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT a táblához `diak`
--
ALTER TABLE `diak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT a táblához `osztaly`
--
ALTER TABLE `osztaly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT a táblához `tanar`
--
ALTER TABLE `tanar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT a táblához `utonev`
--
ALTER TABLE `utonev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `diak`
--
ALTER TABLE `diak`
  ADD CONSTRAINT `diak_ibfk_1` FOREIGN KEY (`csaladnev_id`) REFERENCES `csaladnev` (`id`),
  ADD CONSTRAINT `diak_ibfk_2` FOREIGN KEY (`utonev1_id`) REFERENCES `utonev` (`id`),
  ADD CONSTRAINT `diak_ibfk_3` FOREIGN KEY (`utonev2_id`) REFERENCES `utonev` (`id`),
  ADD CONSTRAINT `diak_ibfk_4` FOREIGN KEY (`osztaly_id`) REFERENCES `osztaly` (`id`);

--
-- Megkötések a táblához `osztaly`
--
ALTER TABLE `osztaly`
  ADD CONSTRAINT `osztaly_ibfk_1` FOREIGN KEY (`osztalyfonok_id`) REFERENCES `tanar` (`id`);

--
-- Megkötések a táblához `tanar`
--
ALTER TABLE `tanar`
  ADD CONSTRAINT `tanar_ibfk_1` FOREIGN KEY (`csaladnev_id`) REFERENCES `csaladnev` (`id`),
  ADD CONSTRAINT `tanar_ibfk_2` FOREIGN KEY (`utonev1_id`) REFERENCES `utonev` (`id`),
  ADD CONSTRAINT `tanar_ibfk_3` FOREIGN KEY (`utonev2_id`) REFERENCES `utonev` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
