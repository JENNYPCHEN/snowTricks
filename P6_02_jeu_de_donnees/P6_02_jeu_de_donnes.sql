-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 08, 2021 at 03:12 PM
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
  `name` varchar(45) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Freeride'),
(2, 'Alpin ou Freecarve'),
(3, 'Freestyle'),
(4, 'Jib'),
(5, 'Flat'),
(6, 'Snowkite'),
(7, 'L\'autre');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `message` varchar(45) CHARACTER SET utf8 NOT NULL,
  `create_date` datetime NOT NULL,
  `trick_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `message`, `create_date`, `trick_id`, `user_id`) VALUES
(1, 'cool! C\'est super!', '2021-12-08 16:01:22', 1, 1),
(2, 'Merci pour partager!', '2021-12-08 16:02:39', 2, 2),
(3, 'ha! C\'est cool!', '2021-12-07 09:00:00', 3, 3),
(6, 'wow! J\'adore la vidéo!', '2021-12-08 16:11:10', 1, 2),
(7, 'cool! C\'est pas mal!', '2021-12-08 16:11:47', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 NOT NULL,
  `trick_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `path`, `trick_id`) VALUES
(1, 'public/img/images_tricks/1.jpg', 6),
(2, 'public/img/images_tricks/2.jpg', 4),
(3, 'public/img/images_tricks/3.jpg', 10),
(4, 'public/img/images_tricks/4.jpg', 1),
(5, 'public/img/images_tricks/8.jpg', 2),
(6, 'public/img/images_tricks/7.jpg', 3),
(7, 'public/img/images_tricks/6.jpg', 4),
(8, 'public/img/images_tricks/5.jpg', 5),
(9, 'public/img/images_tricks/3.jpg', 6),
(10, 'public/img/images_tricks/3.jpg', 7),
(11, 'public/img/images_tricks/2.jpg', 7),
(12, 'public/img/images_tricks/2.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `trick`
--

CREATE TABLE `trick` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trick`
--

INSERT INTO `trick` (`id`, `name`, `description`, `create_date`, `update_date`, `user_id`, `category_id`) VALUES
(1, 'La manière de rider', 'Tout d\'abord, il faut savoir qu\'il y a deux positions sur sa planche: regular ou goofy. Un rider regular aura son pied gauche devant et un rider goofy aura son pied droit devant. Après un certain moment, les planchistes sont capables de descendre dans les deux positions. Un rider regular qui descend en position goofy, dira qu\'il descend « switch ». Généralement, une manœuvre sera considéré comme plus difficile quand elle est effectué « switch ».', '2021-12-08 15:16:34', NULL, 2, 3),
(2, 'Les flips', 'Un flip est une rotation verticale. On distingue les front flips, rotations en avant, et les back flips, rotations en arrière.\r\n\r\nIl est possible de faire plusieurs flips à la suite, et d\'ajouter un grab à la rotation.\r\n\r\nLes flips agrémentés d\'une vrille existent aussi (Mac Twist, Hakon Flip...), mais de manière beaucoup plus rare, et se confondent souvent avec certaines rotations horizontales désaxées.\r\n\r\nNéanmoins, en dépit de la difficulté technique relative d\'une telle figure, le danger de retomber sur la tête ou la nuque est réel et conduit certaines stations de ski à interdire de telles figures dans ses snowparks.', '2021-12-07 11:00:00', NULL, 3, 3),
(3, 'Les rotations désaxées', 'Les rotations désaxées\r\nUne rotation désaxée est une rotation initialement horizontale mais lancée avec un mouvement des épaules particulier qui désaxe la rotation. Il existe différents types de rotations désaxées (corkscrew ou cork, rodeo, misty, etc.) en fonction de la manière dont est lancé le buste. Certaines de ces rotations, bien qu\'initialement horizontales, font passer la tête en bas.\r\n\r\nBien que certaines de ces rotations soient plus faciles à faire sur un certain nombre de tours (ou de demi-tours) que d\'autres, il est en théorie possible de d\'attérir n\'importe quelle rotation désaxée avec n\'importe quel nombre de tours, en jouant sur la quantité de désaxage afin de se retrouver à la position verticale au moment voulu.\r\n\r\nIl est également possible d\'agrémenter une rotation désaxée par un grab.', '2021-12-06 08:00:00', '2021-12-08 12:00:00', 1, 3),
(4, 'Le freeride ', 'Le freeride (ou planche hors-piste1) regroupe tout ce qui concerne la descente en hors piste. Ce sont les descendants des premiers snowboards. Le freeride consiste (comme son nom l\'indique) à glisser librement, c\'est-à-dire en adaptant en permanence sa trajectoire uniquement en fonction du profil de la pente et des obstacles, principalement hors-piste. Les freerideurs privilégient l\'aspect nature du sport, la sensation de liberté dans une neige vierge et propre, sur des pentes nivelées par le temps. Lorsque le snowboard a été inventé, c\'était dans le but de reproduire sur la neige les sensations du surf. Il n\'est donc pas étonnant de retrouver aujourd\'hui chez certains freerideurs cet esprit hérité du monde du surf.', '2021-12-08 15:36:46', NULL, 2, 1),
(5, 'Les rotations', 'Une rotation peut être frontside ou backside : une rotation frontside correspond à une rotation orientée vers la carre backside. Cela peut paraître incohérent mais l\'origine étant que dans un halfpipe ou une rampe de skateboard, une rotation frontside se déclenche naturellement depuis une position frontside (i.e. l\'appui se fait sur la carre frontside), et vice-versa. Ainsi pour un rider qui a une position regular (pied gauche devant), une rotation frontside se fait dans le sens inverse des aiguilles d\'une montre.\r\n\r\nUne rotation peut être agrémentée d\'un grab, ce qui rend le saut plus esthétique mais aussi plus difficile car la position tweakée a tendance à déséquilibrer le rideur et désaxer la rotation. De plus, le sens de la rotation a tendance à favoriser un sens de grab plutôt qu\'un autre. Les rotations de plus de trois tours existent mais sont plus rares, d\'abord parce que les modules assez gros pour lancer un tel saut sont rares, et ensuite parce que la vitesse de rotation est tellement élevée qu\'un grab devient difficile, ce qui rend le saut considérablement moins esthétique.', '2021-12-05 10:00:00', NULL, 3, 3),
(6, 'Les one foot tricks', 'Figures réalisée avec un pied décroché de la fixation, afin de tendre la jambe correspondante pour mettre en évidence le fait que le pied n\'est pas fixé. Ce type de figure est extrêmement dangereuse pour les ligaments du genou en cas de mauvaise réception.', '2021-12-07 11:00:00', '2021-12-08 15:40:48', 3, 3),
(7, 'Les grabs', 'Un grab consiste à attraper la planche avec la main pendant le saut. Le verbe anglais to grab signifie « attraper. »\r\n\r\nIl existe plusieurs types de grabs selon la position de la saisie et la main choisie pour l\'effectuer, avec des difficultés variables :', '2021-12-08 15:40:48', NULL, 2, 3),
(8, 'Les slides', 'Un slide consiste à glisser sur une barre de slide. Le slide se fait soit avec la planche dans l\'axe de la barre, soit perpendiculaire, soit plus ou moins désaxé.\r\n\r\nOn peut slider avec la planche centrée par rapport à la barre (celle-ci se situe approximativement au-dessous des pieds du rideur), mais aussi en nose slide, c\'est-à-dire l\'avant de la planche sur la barre, ou en tail slide, l\'arrière de la planche sur la barre.', '2021-12-01 14:00:00', '2021-12-06 14:00:00', 3, 3),
(10, 'Le Jib', 'Le Jib (aussi appelé Slide et Grind) est une pratique du snowboard freestyle consistant à glisser sur tous types de modules autre que la neige (rails, troncs d\'arbre, caisse en plastique, etc.). Le Jib se pratique en snowpark, mais aussi en ville (street). Aujourd\'hui, un grand nombre compétitions de snowboard comportent une épreuve de jib ; elles sont souvent organisées au cœur même des villes comme Montpellier, ou bien Genève. Seule une faible quantité de neige est nécessaire à l\'entrée et à la sortie du slide, ce qui permet de faire des compétitions de snowboard même dans les pays où il fait chaud.', '2021-12-02 09:20:00', '2021-12-06 11:00:00', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `create_date` datetime NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `token_timestamp` timestamp NULL DEFAULT NULL,
  `activated` tinyint(2) NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_date`, `token`, `token_timestamp`, `activated`, `image`) VALUES
(1, 'user1', 'user1@gmail.com', 'abcd1234', '2021-12-08 15:11:02', NULL, NULL, 1, 'public/img/image_profiles/avtar1.png'),
(2, 'user2', 'user2@gmail.com', 'abcd1234', '2021-12-08 15:13:10', NULL, NULL, 0, 'public/img/image_profiles/avtar2.png'),
(3, 'user3', 'user3@gmail.com', 'abcd1234', '2021-12-08 15:14:09', NULL, NULL, 1, 'public/img/image_profiles/avtar2.png');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 NOT NULL,
  `trick_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `path`, `trick_id`) VALUES
(1, 'https://www.youtube.com/watch?v=ajdH6XhVaus', 10),
(2, 'https://www.youtube.com/watch?v=6vA4BuJM3_g', 3),
(3, 'https://www.youtube.com/watch?v=fbqHK8i-HdA', 5),
(4, 'https://www.youtube.com/watch?v=t705_V-RDcQ', 3),
(5, 'https://www.youtube.com/watch?v=QMrelVooJR4', 1),
(6, 'https://www.youtube.com/watch?v=GS9MMT_bNn8', 5);

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
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_image_trick1_idx` (`trick_id`);

--
-- Indexes for table `trick`
--
ALTER TABLE `trick`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_trick_user_idx` (`user_id`),
  ADD KEY `fk_trick_category1_idx` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `trick`
--
ALTER TABLE `trick`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `fk_image_trick1` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

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
  ADD CONSTRAINT `fk_video_trick1` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
