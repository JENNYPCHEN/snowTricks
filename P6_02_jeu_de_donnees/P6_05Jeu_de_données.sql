-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 31, 2021 at 02:37 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `snowtricks`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(83, 'Freeride'),
(84, 'Alpin ou Freecarve'),
(85, 'Freestyle'),
(86, 'Jib'),
(87, 'Flat'),
(88, 'Snowkite'),
(89, 'L\'autre');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `message` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `trick_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `message`, `create_date`, `trick_id`, `user_id`) VALUES
(269, 'Est aut id ullam.', '2021-12-15 15:31:46', 614, 303),
(270, 'Sint sint.', '2021-12-12 03:48:51', 596, 317),
(271, 'Velit repellendus.', '2021-12-18 21:14:29', 604, 311),
(272, 'Ea fugiat et ut.', '2021-12-25 07:31:32', 572, 308),
(273, 'Quia qui eos.', '2021-12-25 10:39:38', 597, 301),
(274, 'Rem corrupti.', '2021-12-09 20:06:47', 605, 317),
(275, 'Et maxime deserunt.', '2021-12-25 09:12:49', 583, 318),
(276, 'Vel ut molestiae.', '2021-12-17 20:53:00', 598, 315),
(277, 'Nulla tempore sunt.', '2021-12-15 09:39:02', 593, 310),
(278, 'Distinctio sit sed.', '2021-12-26 12:34:41', 616, 306),
(279, 'Itaque neque.', '2021-12-15 02:00:39', 592, 306),
(281, 'Sit ea maxime.', '2021-12-14 23:33:14', 594, 306),
(282, 'Nulla sint.', '2021-12-24 19:27:41', 575, 305),
(283, 'Eos rerum quas.', '2021-12-25 08:09:19', 571, 310),
(284, 'Minima earum odio.', '2021-12-13 09:44:12', 573, 311),
(285, 'Esse iste error.', '2021-12-13 09:22:19', 609, 299),
(286, 'Incidunt aspernatur.', '2021-12-27 06:42:24', 600, 318),
(287, 'Qui eos aliquid sit.', '2021-12-23 18:51:52', 618, 316),
(288, 'Consequatur esse.', '2021-12-20 08:23:44', 600, 308),
(289, 'Molestias vel quam.', '2021-12-20 12:14:27', 603, 306),
(290, 'Veniam reiciendis.', '2021-12-15 07:21:11', 571, 308),
(291, 'In vitae ratione.', '2021-12-09 05:42:17', 592, 313),
(292, 'Reprehenderit dolor.', '2021-12-16 00:36:22', 596, 304),
(293, 'Ipsa officia.', '2021-12-18 10:54:17', 574, 311),
(294, 'Laboriosam.', '2021-12-23 12:30:58', 576, 317),
(295, 'Sunt cum ipsam qui.', '2021-12-12 02:43:37', 574, 302),
(296, 'Fuga enim non rerum.', '2021-12-16 04:45:00', 614, 314),
(297, 'Rem repudiandae ut.', '2021-12-11 16:05:00', 593, 306),
(298, 'Quo quas aut.', '2021-12-24 16:41:41', 617, 309),
(299, 'Est quod enim velit.', '2021-12-09 22:17:34', 607, 311),
(300, 'Est blanditiis.', '2021-12-24 13:45:21', 579, 304),
(301, 'Est vel quaerat.', '2021-12-22 16:42:28', 590, 307),
(302, 'Nobis et deserunt.', '2021-12-18 04:11:14', 585, 306),
(303, 'Similique voluptas.', '2021-12-18 19:19:52', 571, 300),
(304, 'Tenetur sint dolor.', '2021-12-27 10:20:22', 590, 306),
(305, 'Rem eligendi neque.', '2021-12-11 23:21:54', 612, 316),
(306, 'Perferendis vitae.', '2021-12-27 09:57:44', 620, 302),
(307, 'Reiciendis illo.', '2021-12-17 18:00:01', 614, 307),
(308, 'Sit saepe odio quia.', '2021-12-21 17:32:42', 576, 312),
(309, 'Aut aliquam quaerat.', '2021-12-18 18:02:09', 607, 318),
(310, 'Et dolor voluptatem.', '2021-12-22 03:36:36', 602, 318),
(311, 'Repellat sed et eos.', '2021-12-13 17:40:11', 618, 300),
(312, 'Et ut nihil.', '2021-12-10 19:48:55', 617, 304),
(313, 'Quae sit quia id ea.', '2021-12-22 05:36:37', 572, 310),
(314, 'Illo velit alias.', '2021-12-18 17:06:39', 620, 299),
(315, 'Sint recusandae.', '2021-12-25 04:19:28', 610, 313),
(316, 'Nisi nam voluptatem.', '2021-12-08 22:56:15', 601, 315),
(317, 'Dolorum sed totam.', '2021-12-17 08:53:30', 576, 308),
(318, 'Non in quo.', '2021-12-09 06:11:03', 577, 306),
(319, 'Sed et vel.', '2021-12-16 00:53:38', 583, 312),
(320, 'Repudiandae ipsam.', '2021-12-16 19:55:24', 604, 310),
(321, 'Maxime voluptatem.', '2021-12-23 13:41:54', 584, 318),
(322, 'Ducimus accusamus.', '2021-12-10 12:32:58', 609, 300),
(323, 'Placeat iusto.', '2021-12-25 11:48:34', 596, 316),
(324, 'Reiciendis aliquid.', '2021-12-11 08:23:52', 583, 312),
(325, 'Officiis blanditiis.', '2021-12-15 21:44:18', 588, 313),
(326, 'Neque repellat.', '2021-12-08 13:13:42', 607, 303),
(327, 'Inventore sunt.', '2021-12-16 17:55:04', 586, 311),
(328, 'Est dolorum porro.', '2021-12-12 12:12:01', 596, 302),
(329, 'Repellendus aut.', '2021-12-22 11:55:42', 600, 302),
(330, 'Quod qui.', '2021-12-10 14:40:17', 602, 308),
(331, 'Praesentium esse at.', '2021-12-09 10:07:07', 579, 300),
(332, 'Sed omnis magni.', '2021-12-25 00:23:28', 597, 317),
(333, 'Voluptatem voluptas.', '2021-12-24 08:33:11', 587, 306),
(334, 'Laboriosam.', '2021-12-15 13:21:18', 606, 309),
(335, 'Vel sunt autem sit.', '2021-12-22 23:40:03', 607, 313),
(336, 'Sed aut quod.', '2021-12-22 16:46:55', 612, 316),
(337, 'Nam qui ad ut fugit.', '2021-12-18 09:16:48', 603, 306),
(338, 'Cumque eos adipisci.', '2021-12-20 05:39:00', 619, 307),
(339, 'Nam qui ipsa.', '2021-12-12 02:43:00', 575, 301),
(340, 'Harum et et eum.', '2021-12-14 01:06:30', 595, 308),
(341, 'Quo atque sunt.', '2021-12-25 09:12:26', 575, 303),
(342, 'Quia architecto.', '2021-12-17 05:55:08', 601, 301),
(343, 'Laborum eos.', '2021-12-27 06:23:31', 609, 311),
(344, 'Qui necessitatibus.', '2021-12-24 04:10:08', 620, 302),
(345, 'Est sed officia non.', '2021-12-20 16:38:55', 572, 311),
(346, 'Qui et tempore quia.', '2021-12-21 11:50:46', 593, 304),
(347, 'Distinctio autem.', '2021-12-25 18:29:39', 574, 307),
(348, 'Voluptatem quisquam.', '2021-12-18 13:20:23', 595, 304),
(349, 'Dolor quia et.', '2021-12-12 01:36:47', 603, 317),
(350, 'Repellat excepturi.', '2021-12-20 18:55:37', 615, 306),
(351, 'Est quia.', '2021-12-14 22:51:56', 591, 316),
(352, 'Modi nemo sunt in.', '2021-12-27 02:17:43', 576, 317),
(353, 'Est quasi ab et.', '2021-12-25 14:33:35', 595, 310),
(354, 'Occaecati.', '2021-12-14 06:15:45', 605, 317),
(355, 'Dolores inventore.', '2021-12-20 01:17:12', 575, 316),
(356, 'Ea a ut autem.', '2021-12-18 20:18:33', 583, 304),
(357, 'Eos aut autem.', '2021-12-12 15:31:16', 609, 316),
(358, 'Ad corrupti culpa.', '2021-12-19 18:45:36', 586, 318),
(359, 'Aperiam non natus.', '2021-12-18 16:40:15', 616, 301),
(360, 'Et fugiat deserunt.', '2021-12-14 16:37:34', 579, 311),
(361, 'Molestiae inventore.', '2021-12-09 04:43:18', 580, 318),
(362, 'Eum repellat.', '2021-12-14 22:10:16', 609, 311),
(363, 'Aperiam quia nulla.', '2021-12-10 08:34:36', 595, 304),
(364, 'Est quia libero.', '2021-12-21 04:17:29', 586, 308),
(365, 'Et quia maiores.', '2021-12-19 00:39:29', 610, 303),
(366, 'Dignissimos rem.', '2021-12-11 03:26:55', 620, 309),
(367, 'Reprehenderit.', '2021-12-16 07:07:19', 607, 312),
(368, 'Dolores eos odit.', '2021-12-24 22:42:41', 608, 301),
(369, 'cool', '2021-12-29 15:13:17', 592, 318),
(370, 'Est aut id ullam.', '2021-12-15 15:31:46', 592, 303),
(371, 'Velit repellendus.', '2021-12-18 21:14:29', 592, 311),
(372, 'Ea fugiat et ut.', '2021-12-25 07:31:32', 592, 308),
(373, '1', '2021-12-07 11:00:00', 592, 306),
(374, '2', '2021-12-07 09:00:00', 594, 302),
(375, '1', '2021-12-07 11:00:00', 592, 306),
(376, '2', '2021-12-07 09:00:00', 594, 302),
(377, '3', '2021-12-07 11:00:00', 592, 306),
(378, '4', '2021-12-07 09:00:00', 594, 302),
(379, '5', '2021-12-07 11:00:00', 592, 306),
(380, '6', '2021-12-07 09:00:00', 594, 302),
(381, '7', '2021-12-07 11:00:00', 592, 306),
(382, '8', '2021-12-07 09:00:00', 594, 302),
(383, '9', '2021-12-07 11:00:00', 592, 306),
(384, '10', '2021-12-07 09:00:00', 594, 302),
(385, '11', '2021-12-07 11:00:00', 592, 306),
(386, '12', '2021-12-07 09:00:00', 594, 302);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211224101924', '2021-12-24 10:20:58', 2925),
('DoctrineMigrations\\Version20211224103057', '2021-12-24 10:31:33', 343),
('DoctrineMigrations\\Version20211226074822', '2021-12-26 07:48:54', 508),
('DoctrineMigrations\\Version20211227102436', '2021-12-27 10:25:42', 937);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trick_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `path`, `trick_id`) VALUES
(93, '3.jpg', 620),
(94, '3.jpg', 590),
(95, '3.jpg', 579),
(96, '3.jpg', 572),
(98, '3.jpg', 586),
(99, '3.jpg', 619),
(100, '3.jpg', 580),
(101, '3.jpg', 586),
(103, '90f4e1575e0aea552201a9a0d85caeb5.jpg', 603),
(104, '22a9458ca1e4d218131287063c503901.jpg', 575);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trick`
--

CREATE TABLE `trick` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trick`
--

INSERT INTO `trick` (`id`, `name`, `description`, `create_date`, `update_date`, `user_id`, `category_id`) VALUES
(571, 'Tempore aut.', 'Consequatur debitis excepturi esse quas sapiente ab soluta. Omnis reiciendis beatae recusandae voluptatem. Quas voluptate nihil id dolorum eaque.', '2021-12-05 15:05:20', '2021-12-10 10:42:35', 318, 87),
(572, 'La rotation', 'Une rotation peut être frontside ou backside : une rotation frontside correspond à une rotation orientée vers la carre backside. Cela peut paraître incohérent mais l\'origine étant que dans un halfpipe ou une rampe de skateboard, une rotation frontside se déclenche naturellement depuis une position frontside (i.e. l\'appui se fait sur la carre frontside), et vice-versa. Ainsi pour un rider qui a une position regular (pied gauche devant), une rotation frontside se fait dans le sens inverse des aiguilles d\'une montre.\r\n\r\nUne rotation peut être agrémentée d\'un grab, ce qui rend le saut plus esthétique mais aussi plus difficile car la position tweakée a tendance à déséquilibrer le rideur et désaxer la rotation. De plus, le sens de la rotation a tendance à favoriser un sens de grab plutôt qu\'un autre. Les rotations de plus de trois tours existent mais sont plus rares, d\'abord parce que les modules assez gros pour lancer un tel saut sont rares, et ensuite parce que la vitesse de rotation est tellement élevée qu\'un grab devient difficile, ce qui rend le saut considérablement moins esthétique.', '2021-12-07 21:11:32', '2021-12-09 11:57:43', 308, 85),
(573, 'Nam ratione.', 'Tempora culpa eos consectetur incidunt voluptatibus ipsa voluptas. Accusamus nobis dolorum soluta dicta sed.', '2021-12-04 06:33:12', '2021-12-14 07:25:27', 305, 85),
(574, 'Dolore consectetur.', 'Minus eaque sit doloribus non error quas totam. Aspernatur temporibus sit voluptate tempora dolor itaque. Rerum officiis id nam quo ex error.', '2021-12-02 08:02:37', '2021-12-18 01:12:24', 308, 86),
(575, 'Les flips', 'Un flip est une rotation verticale. On distingue les front flips, rotations en avant, et les back flips, rotations en arrière.\r\n\r\nIl est possible de faire plusieurs flips à la suite, et d\'ajouter un grab à la rotation.\r\n\r\nLes flips agrémentés d\'une vrille existent aussi (Mac Twist, Hakon Flip...), mais de manière beaucoup plus rare, et se confondent souvent avec certaines rotations horizontales désaxées.\r\n\r\nNéanmoins, en dépit de la difficulté technique relative d\'une telle figure, le danger de retomber sur la tête ou la nuque est réel et conduit certaines stations de ski à interdire de telles figures dans ses snowparks.', '2021-12-08 07:59:36', '2021-12-28 12:28:52', 299, 85),
(576, 'Deleniti labore.', 'Facere dolorum aliquid temporibus animi dolores. Aut qui qui ea dolor quia est. Et eveniet veniam in porro velit ratione sapiente. Et quia dolorum aut odit qui harum neque.', '2021-11-30 11:00:14', '2021-12-17 18:01:45', 308, 83),
(577, 'Voluptatibus.', 'Non voluptatum ipsam rerum praesentium voluptas. Sint temporibus est laboriosam veniam ex.', '2021-11-30 16:19:33', '2021-12-15 22:19:56', 311, 84),
(578, 'Quam error quisquam.', 'Aut illum quas aliquid est facilis qui facere. Molestias voluptatem quos distinctio totam est ut.', '2021-11-30 16:41:24', '2021-12-14 21:26:49', 305, 89),
(579, 'Les one foot tricks', 'Figures réalisée avec un pied décroché de la fixation, afin de tendre la jambe correspondante pour mettre en évidence le fait que le pied n\'est pas fixé. Ce type de figure est extrêmement dangereuse pour les ligaments du genou en cas de mauvaise réception.', '2021-12-07 07:18:38', '2021-12-18 18:15:48', 318, 85),
(580, 'Voluptas et et non.', 'Eos vel asperiores id voluptatum dolorum sunt officiis voluptatem. Ut eius blanditiis aliquam doloribus dolor suscipit ratione in.', '2021-12-02 12:00:38', '2021-12-16 01:26:23', 310, 83),
(581, 'cork', 'Un cork est une rotation horizontale plus ou moins désaxée, selon un mouvement d\'épaules effectué juste au moment du saut.', '2021-12-06 06:28:26', '2021-12-27 05:21:18', 304, 89),
(582, 'Est velit amet enim.', 'Velit nam assumenda exercitationem officiis omnis amet. Nobis consequatur dolore soluta ducimus iste repudiandae placeat molestiae. Qui labore quis sapiente voluptas animi. Ut expedita et alias unde voluptatem commodi dolores.', '2021-12-04 03:12:23', '2021-12-14 07:12:53', 314, 83),
(583, 'Dolorum provident.', 'Repellat ipsum dolorem animi quis doloremque voluptas ut. Sequi ratione maxime quo ex vel voluptate voluptatum. Ea eaque et soluta quo ullam. Vel vel debitis dolorum et. Mollitia harum aliquam voluptatem doloremque.', '2021-12-02 20:27:53', '2021-12-26 03:23:45', 308, 84),
(584, 'Quam magni nesciunt.', 'Veritatis excepturi similique est blanditiis placeat commodi. Dolorem expedita sit minus voluptatem et delectus doloribus. Magnam deserunt quibusdam dolore.', '2021-11-30 15:28:02', '2021-12-10 15:11:09', 309, 83),
(585, 'Et qui tempora est.', 'Harum veritatis fugiat error inventore repellat eius in voluptate. Voluptatem et voluptatem nulla esse. Nihil sunt consectetur vel.', '2021-12-05 02:48:45', '2021-12-22 21:19:47', 311, 88),
(586, 'Exercitationem eius.', 'Dolorem et iste qui id repellat consequuntur ad. Voluptas amet id error. Perspiciatis quaerat voluptatem dignissimos sint voluptatem.', '2021-12-01 02:57:26', '2021-12-15 06:05:00', 309, 87),
(587, 'Et suscipit in.', 'Repudiandae et alias est exercitationem. Velit atque quod ex impedit voluptatem voluptatem commodi. Aperiam incidunt labore quo eligendi veniam.', '2021-11-29 20:59:31', '2021-12-09 02:37:08', 307, 89),
(588, 'Voluptatem illum.', 'Nemo rerum et impedit quis molestiae. Maiores cum incidunt ducimus quis. Officiis non est distinctio repellendus. Dignissimos sit sunt fugiat minus voluptatem aut et.', '2021-12-05 22:07:35', '2021-12-18 11:07:24', 299, 83),
(589, 'Id ut at velit esse.', 'Beatae sunt corporis hic dignissimos voluptatem eum. Explicabo consequatur molestiae doloremque ea sint est ducimus.', '2021-11-29 22:14:15', '2021-12-16 18:36:12', 305, 85),
(590, 'Numquam nisi.', 'A ut autem molestiae nisi. Non officia laboriosam suscipit error ipsam maxime. Delectus similique consequatur ab sint asperiores labore qui. Et doloremque iure minus sit perspiciatis ut quos.', '2021-11-30 00:03:38', '2021-12-18 21:18:56', 311, 88),
(591, 'Consequatur rem.', 'Consequatur quam tempore nisi ipsa nulla non qui. Reiciendis dolor quo facere voluptas esse autem. Asperiores odio dignissimos odio consequatur. Tenetur voluptas esse beatae suscipit quidem cumque atque.', '2021-12-03 06:45:17', '2021-12-16 12:21:47', 313, 89),
(592, 'La manière de rider', 'Tout d\'abord, il faut savoir qu\'il y a deux positions sur sa planche: regular ou goofy. Un rider regular aura son pied gauche devant et un rider goofy aura son pied droit devant. Après un certain moment, les planchistes sont capables de descendre dans les deux positions. Un rider regular qui descend en position goofy, dira qu\'il descend « switch ». Généralement, une manœuvre sera considéré comme plus difficile quand elle est effectué « switch ».', '2021-12-08 12:05:52', '2021-12-12 03:57:00', 316, 85),
(593, 'Ut sed quasi ab.', 'At est et fuga. Facilis molestiae minima ut modi.', '2021-12-01 10:45:27', '2021-12-19 03:54:56', 310, 87),
(594, 'Laborum natus dicta.', 'Cumque magni voluptas provident perferendis.', '2021-11-30 07:22:31', '2021-12-11 05:03:35', 303, 84),
(595, 'Quas sint ut.', 'Voluptatem occaecati et molestiae quae sunt hic. Cumque sed temporibus qui quas natus fuga commodi. Voluptate pariatur tempora molestiae aspernatur dolorem quidem quisquam. Eveniet saepe unde et modi sit velit. Neque non aut non numquam hic velit reiciendis.', '2021-12-01 12:30:08', '2021-12-20 18:51:56', 308, 83),
(596, 'Les slides', 'Un slide consiste à glisser sur une barre de slide. Le slide se fait soit avec la planche dans l\'axe de la barre, soit perpendiculaire, soit plus ou moins désaxé.\r\n\r\nOn peut slider avec la planche centrée par rapport à la barre (celle-ci se situe approximativement au-dessous des pieds du rideur), mais aussi en nose slide, c\'est-à-dire l\'avant de la planche sur la barre, ou en tail slide, l\'arrière de la planche sur la barre.', '2021-12-06 21:57:35', '2021-12-19 14:11:07', 313, 85),
(597, 'Tempora asperiores.', 'Ipsa est alias qui et ea perspiciatis enim. Voluptatem quo sed sed inventore.', '2021-12-03 16:43:18', '2021-12-22 15:33:27', 306, 88),
(598, 'Vero quam odit.', 'Eum non et qui est. Sequi ut molestiae sit illum velit ut sapiente. Dignissimos eos est illo rerum at. Velit quod unde beatae dolorem aut soluta.', '2021-11-30 06:20:36', '2021-12-15 14:26:29', 305, 84),
(599, 'Le Jib', 'Le Jib (aussi appelé Slide et Grind) est une pratique du snowboard freestyle consistant à glisser sur tous types de modules autre que la neige (rails, troncs d\'arbre, caisse en plastique, etc.). Le Jib se pratique en snowpark, mais aussi en ville (street). Aujourd\'hui, un grand nombre compétitions de snowboard comportent une épreuve de jib ; elles sont souvent organisées au cœur même des villes comme Montpellier, ou bien Genève. Seule une faible quantité de neige est nécessaire à l\'entrée et à la sortie du slide, ce qui permet de faire des compétitions de snowboard même dans les pays où il fait chaud.', '2021-12-06 13:46:16', '2021-12-24 02:38:08', 299, 86),
(600, 'Perferendis velit.', 'Voluptatem excepturi autem ut officiis. Natus dolorem nihil quam fugiat sed veritatis.', '2021-12-02 04:17:49', '2021-12-12 17:47:59', 305, 87),
(601, 'Dolores et ullam.', 'Tempora minus illo facere provident ratione. Ad expedita minima nisi non ut quia. Numquam nihil non est dolorum ut similique.', '2021-12-05 21:57:31', '2021-12-24 09:42:37', 299, 85),
(602, 'In sit amet est.', 'Veritatis reiciendis sapiente expedita consequuntur architecto. Voluptas eos ea rerum. Enim fuga vero ea aut culpa omnis. Provident sequi quis voluptatem illo impedit sint.', '2021-12-06 00:06:10', '2021-12-26 09:49:48', 303, 86),
(603, 'Maiores mollitia id.', 'Sit velit in dolores itaque explicabo aut. Consequatur autem voluptas repellendus. Et impedit sunt molestias dicta ex est non consectetur.', '2021-12-03 23:20:19', '2021-12-28 12:23:03', 318, 85),
(604, 'Le freeride', 'Le freeride (ou planche hors-piste1) regroupe tout ce qui concerne la descente en hors piste. Ce sont les descendants des premiers snowboards. Le freeride consiste (comme son nom l\'indique) à glisser librement, c\'est-à-dire en adaptant en permanence sa trajectoire uniquement en fonction du profil de la pente et des obstacles, principalement hors-piste. Les freerideurs privilégient l\'aspect nature du sport, la sensation de liberté dans une neige vierge et propre, sur des pentes nivelées par le temps. Lorsque le snowboard a été inventé, c\'était dans le but de reproduire sur la neige les sensations du surf. Il n\'est donc pas étonnant de retrouver aujourd\'hui chez certains freerideurs cet esprit hérité du monde du surf.', '2021-12-07 22:40:21', '2021-12-26 22:01:21', 318, 83),
(605, 'Distinctio.', 'Corporis aut sequi optio quo esse magnam est. Porro blanditiis corrupti dignissimos doloribus.', '2021-12-01 07:00:18', '2021-12-08 14:52:27', 305, 84),
(606, 'Deleniti corporis.', 'Aut natus et quisquam aliquid ut rem. Voluptatem fugiat et assumenda aperiam.', '2021-12-03 20:42:21', '2021-12-09 09:11:28', 306, 88),
(607, 'Odio et voluptatum.', 'Vero perspiciatis aut neque aperiam deleniti aut. Voluptate error qui eveniet quia hic totam temporibus. Dolor perferendis est voluptatibus laudantium rerum qui.', '2021-11-30 14:41:34', '2021-12-14 18:34:28', 303, 86),
(608, 'Les grabs', 'Un grab consiste à attraper la planche avec la main pendant le saut. Le verbe anglais to grab signifie « attraper. »\r\n\r\nIl existe plusieurs types de grabs selon la position de la saisie et la main choisie pour l\'effectuer, avec des difficultés variables :', '2021-12-07 02:27:08', '2021-12-21 07:02:17', 318, 85),
(609, 'Optio rerum dolorem.', 'Dolorem aut neque nesciunt omnis. Velit nam et enim nesciunt.', '2021-12-01 02:03:04', '2021-12-11 10:09:29', 313, 86),
(610, 'Consequatur.', 'Necessitatibus nihil odit facere quisquam earum tempora. Dicta minima illum amet dolorum ab reiciendis non minima.', '2021-11-30 07:17:04', '2021-12-24 09:09:14', 317, 84),
(611, 'Deleniti recusandae.', 'Cumque placeat minima veritatis fuga neque necessitatibus. Ex adipisci dolor quo consequatur consequuntur numquam. Modi non a ratione.', '2021-12-02 21:13:49', '2021-12-24 10:35:01', 303, 87),
(612, 'Soluta consequuntur.', 'Impedit ipsum non qui illum vero laborum.', '2021-11-30 10:46:20', '2021-12-12 21:15:53', 299, 85),
(614, 'Les rotations désaxées', 'Les rotations désaxées\r\nUne rotation désaxée est une rotation initialement horizontale mais lancée avec un mouvement des épaules particulier qui désaxe la rotation. Il existe différents types de rotations désaxées (corkscrew ou cork, rodeo, misty, etc.) en fonction de la manière dont est lancé le buste. Certaines de ces rotations, bien qu\'initialement horizontales, font passer la tête en bas.\r\n\r\nBien que certaines de ces rotations soient plus faciles à faire sur un certain nombre de tours (ou de demi-tours) que d\'autres, il est en théorie possible de d\'attérir n\'importe quelle rotation désaxée avec n\'importe quel nombre de tours, en jouant sur la quantité de désaxage afin de se retrouver à la position verticale au moment voulu.\r\n\r\nIl est également possible d\'agrémenter une rotation désaxée par un grab.', '2021-12-08 03:19:53', '2021-12-20 01:31:12', 300, 85),
(615, 'Autem quis velit.', 'Laboriosam voluptatem eius enim aperiam. Ipsa accusamus dolore ipsam facilis dolorum. Saepe hic fugit autem.', '2021-12-02 21:59:01', '2021-12-14 16:54:31', 318, 89),
(616, 'Deserunt sed.', 'Sed sunt voluptates qui recusandae repudiandae accusantium magni.', '2021-11-29 11:44:34', '2021-12-12 19:16:55', 299, 89),
(617, 'Voluptates maiores.', 'Perferendis dignissimos facere hic eum voluptas porro inventore. Consectetur vitae aliquid sed nobis.', '2021-12-03 14:12:10', '2021-12-27 03:31:40', 309, 89),
(618, 'Quasi voluptatem.', 'Vero et incidunt aut quaerat quas. Qui eius esse eligendi quis corrupti accusamus optio. Accusantium minus omnis ipsa omnis.', '2021-12-05 07:56:39', '2021-12-16 14:40:11', 308, 89),
(619, 'Est nam vitae ea.', 'Ea placeat quaerat voluptas nisi pariatur debitis sed. Itaque ut ratione praesentium quaerat quas.', '2021-12-02 09:06:03', '2021-12-13 05:55:18', 315, 89),
(620, 'Quaerat ducimus.', 'Minus nostrum quae cupiditate dolores velit assumenda voluptatibus. Et eligendi expedita amet molestiae. Ipsa cum sit qui ut saepe provident.', '2021-11-30 01:24:39', '2021-12-10 16:34:27', 314, 89);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roles` json NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `image`, `roles`, `email`, `create_date`, `is_verified`) VALUES
(299, 'hermann.colton', '$2y$13$NcjtIrFstGsev/GgOlBSnORHydV14cvVeXzv2t9wT5eEwjQaRpIue', 'avatar2.png', '[]', 'cummerata.dylan@gmail.com', '2021-11-17 13:49:28', 0),
(300, 'adelbert58', '$2y$13$TcuhFYr24nD7P05mF9AZWuaFJ9Xq6HdT3pCx1pAXoRPjmWyB/JvMy', 'avatar3.png', '[]', 'kenya.corkery@legros.biz', '2021-11-09 14:59:48', 1),
(301, 'chloe.littel', '$2y$13$Ya1G4OnhvUBnoJDvspQ4YeO.6zLG9AjHRxNTh9bv44GKvCaPlg87u', 'avatar7.png', '[]', 'goodwin.alycia@gmail.com', '2021-11-14 06:02:34', 1),
(302, 'cristina75', '$2y$13$iiMKFpbC9mNPhoUeFVJ1KO0JItcxfq64SLnnDqzr3Bx1J1dh/OozO', 'avatar3.png', '[]', 'giovanni54@gmail.com', '2021-11-21 07:07:40', 1),
(303, 'mcglynn.peter', '$2y$13$248nNLsLBhTjb03cLFXkoux3QeEYmqW2.OXtrg3/v9PUs3VzVlrPe', 'avatar4.png', '[]', 'scole@mohr.info', '2021-11-16 04:26:14', 1),
(304, 'delaney60', '$2y$13$BG3aZFLp7vIxi.tQRJi6VuQ0rN17GmM00J3K.7gmCznQwYCWhF6f6', 'avatar6.png', '[]', 'zleuschke@hyatt.biz', '2021-11-17 01:27:06', 1),
(305, 'dorothy.wolff', '$2y$13$QzNZ5uYklw6BiIlQbMIuueRLW41bLHvLhgWBpP0KoxrziTXSzKD/a', 'avatar1.png', '[]', 'vonrueden.paolo@wiza.com', '2021-11-28 05:23:04', 0),
(306, 'smertz', '$2y$13$e.1vSs5pQafuKgDonEiXXu4FUEgJsRc8RyL1lOac.0fWD4Bb0tzpq', 'avatar7.png', '[]', 'bkris@cronin.org', '2021-11-14 03:26:03', 1),
(307, 'emoore', '$2y$13$moVRXpSWOUMhV.5pELOiNOks85cQiKKN5bYLc8VGwClSj0eikiP9m', 'avatar1.png', '[]', 'herzog.calista@hotmail.com', '2021-11-14 17:40:31', 0),
(308, 'wiegand.dennis', '$2y$13$S/BzhrO01rNsbPotaifzQOLvKHnJIi/8K9bZlJUdiaQnEDyzPvHJO', 'avatar7.png', '[]', 'ferry.braeden@grant.info', '2021-11-25 00:43:59', 1),
(309, 'humberto86', '$2y$13$CVSOOomP8x1J6s2D8hbTueUzmjhan6CKb9f8Au7q9L25Vbo9gqWkm', 'avatar7.png', '[]', 'gmedhurst@russel.org', '2021-11-19 21:23:11', 1),
(310, 'adolph94', '$2y$13$IJ0PczjwsO6bzhmhIVn61O8v0Jvife3wCvviZvcjz4tElyqvR670y', 'avatar3.png', '[]', 'rose.nicolas@schroeder.com', '2021-11-18 00:59:25', 1),
(311, 'graham.maurine', '$2y$13$d0JqzHV5d24VtMuHQTmxReFTSk9sE9v9JwdffZCCKQ7Q3P8jrVj12', 'avatar8.png', '[]', 'jkemmer@cormier.com', '2021-11-22 09:49:39', 1),
(312, 'garfield.vandervort', '$2y$13$TStmo4CbG3yLjUxctMRDwOO08jiwX.v.cS/RTliYXh/QisLSIykcW', 'avatar1.png', '[]', 'alessandro.grant@yahoo.com', '2021-11-13 14:22:12', 1),
(313, 'renner.theresia', '$2y$13$7mcj7Agh5M/G7Ny.FYQSXOmPwxp..aZfJXyeO4UQS95eRF/ApmVKK', 'avatar6.png', '[]', 'javier.parisian@gmail.com', '2021-11-10 01:27:16', 1),
(314, 'monahan.emily', '$2y$13$WdQgCDhpMAZvGX9LH4rXjuzlJdQiwEaeWT5abFo2ZHRC7izH.2nAG', 'avatar4.png', '[]', 'eldora61@yahoo.com', '2021-11-27 13:43:54', 1),
(315, 'lockman.jean', '$2y$13$AiKAUb0JGNnRajpgMm25b.Cqgnlk5UFbydIpkfIebNHWlSNI9d7RK', 'avatar6.png', '[]', 'pollich.adah@yahoo.com', '2021-11-15 01:49:47', 1),
(316, 'ckassulke', '$2y$13$bFnsxz/qahPgdp5x5ZsxLO1SpsRKHUWq2yP.ZoEKX30WscJ4dcQVO', 'avatar2.png', '[]', 'mherzog@hotmail.com', '2021-11-26 23:35:13', 1),
(317, 'alvis38', '$2y$13$.96cBtrI2qPN6bOmC511AO9Z6cpkZ31sfZ14a9p3pDkfCNa7EDvzu', 'avatar1.png', '[]', 'lane.prohaska@yahoo.com', '2021-11-28 10:45:32', 1),
(318, 'alexandre79', '$2y$13$Ge0FHU9e.lICTQAqGKl3pe/miep8MjNpLzezNG7Eycwtio8AJzM66', 'avatar4.png', '[]', 'bode.audreanne@ankunding.com', '2021-11-13 21:29:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trick_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `path`, `trick_id`) VALUES
(38, 'fbqHK8i-HdA', 579),
(39, 'fbqHK8i-HdA', 619),
(40, 'fbqHK8i-HdA', 607),
(41, 'fbqHK8i-HdA', 589),
(42, 'fbqHK8i-HdA', 597),
(43, 'fbqHK8i-HdA', 583),
(44, 'fbqHK8i-HdA', 600),
(45, 'fbqHK8i-HdA', 610),
(46, 'fbqHK8i-HdA', 576),
(47, 'fbqHK8i-HdA', 590),
(48, 'khg3ItUFP5s', 575);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment_trick1_idx` (`trick_id`),
  ADD KEY `fk_comment_user1_idx` (`user_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_image_trick1_idx` (`trick_id`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `trick`
--
ALTER TABLE `trick`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D8F0A91E5E237E06` (`name`),
  ADD KEY `fk_trick_user_idx` (`user_id`),
  ADD KEY `fk_trick_category1_idx` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_video_trick1_idx` (`trick_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trick`
--
ALTER TABLE `trick`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=621;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_trick1` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`),
  ADD CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045FB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `trick`
--
ALTER TABLE `trick`
  ADD CONSTRAINT `fk_trick_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `fk_trick_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `FK_7CC7DA2CB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
