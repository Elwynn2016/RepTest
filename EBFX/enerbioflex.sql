-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 14 Décembre 2016 à 09:42
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `enerbioflex`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_auteur` int(11) UNSIGNED NOT NULL,
  `titre` varchar(63) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `contenu` text COLLATE latin1_general_ci NOT NULL,
  `image` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_modification` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `id_auteur`, `titre`, `description`, `contenu`, `image`, `date_creation`, `date_modification`) VALUES
(1, 1, 'Titre de l\'article', 'Mon premier article', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at cursus dolor. Duis cursus sodales pretium. Nam eget mi fringilla, efficitur diam ut, venenatis sapien. Phasellus in suscipit tortor. Mauris turpis magna, laoreet sit amet mattis vel, cursus vitae massa. Sed placerat ullamcorper consequat. Fusce lacus nisi, fringilla nec vehicula a, porttitor sed dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed viverra quis neque ut rhoncus. Maecenas a consectetur orci. Nulla quis mauris quis mi tempor lacinia in pellentesque nisl. Donec aliquet nibh eros, a eleifend urna viverra blandit. Integer in scelerisque tortor. Nam lectus nisi, pharetra at imperdiet ut, facilisis sit amet enim. Aenean nisi metus, dapibus quis mollis eu, elementum eget leo. Etiam fringilla erat vitae odio pulvinar, in auctor neque tempus.', 'Tv.jpg', '2016-11-26 19:19:15', '2016-11-27 20:12:16');

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

CREATE TABLE `chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `auteurId` int(10) UNSIGNED DEFAULT NULL,
  `diffusionId` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE latin1_general_ci NOT NULL,
  `dateMessage` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_article` int(11) UNSIGNED NOT NULL,
  `id_auteur` int(11) UNSIGNED NOT NULL,
  `contenu` text COLLATE latin1_general_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Commentaire article et forum';

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `id_article`, `id_auteur`, `contenu`, `date`) VALUES
(1, 1, 2, 'Yakoi', '2016-11-19 23:41:48'),
(2, 1, 1, 'ghjk', '2016-12-13 14:57:35');

-- --------------------------------------------------------

--
-- Structure de la table `diffusion`
--

CREATE TABLE `diffusion` (
  `id` int(11) UNSIGNED NOT NULL,
  `auteurId` int(11) UNSIGNED DEFAULT NULL,
  `lien` text COLLATE latin1_general_ci NOT NULL,
  `debut` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `diffusion`
--

INSERT INTO `diffusion` (`id`, `auteurId`, `lien`, `debut`) VALUES
(1, 1, 'http://www.dailymotion.com/video/x4y2yr0', '2016-11-28 00:00:00'),
(2, 1, 'http://www.dailymotion.com/video/x32b8fb', '2016-11-28 00:00:00'),
(3, 1, 'http://www.dailymotion.com/video/xzmaz2', '2016-11-28 00:00:00'),
(5, 1, 'http://www.dailymotion.com/video/xeuaes_projet-de-methanisation-a-reugney_news', '2016-11-28 00:00:00'),
(6, 1, 'http://www.dailymotion.com/video/x1548xv_php-advance-lecture-10_tech', '2016-11-28 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `forum`
--

CREATE TABLE `forum` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `forum`
--

INSERT INTO `forum` (`id`, `nom`, `description`) VALUES
(1, 'Methane', 'Cette partie du forum traitera de la methanisation'),
(2, 'Energie', 'Cette partie du forum traitera de l\'energie');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom` varchar(127) COLLATE latin1_general_ci NOT NULL,
  `prenom` varchar(127) COLLATE latin1_general_ci NOT NULL,
  `civilite` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `login` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `mdp` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `mail` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `mailing` tinyint(1) NOT NULL DEFAULT '1',
  `ville` varchar(127) COLLATE latin1_general_ci NOT NULL,
  `pays` varchar(31) COLLATE latin1_general_ci NOT NULL,
  `photo` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'default.jpg',
  `description` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `date_naissance` date DEFAULT '1920-01-01',
  `type` tinyint(4) NOT NULL DEFAULT '3',
  `adresseIp` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_connexion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `civilite`, `login`, `mdp`, `mail`, `mailing`, `ville`, `pays`, `photo`, `description`, `date_naissance`, `type`, `adresseIp`, `date_creation`, `date_connexion`) VALUES
(1, 'Exemple', 'Standard', '', 'membre1', '', 'exemple@exemple.fr', 1, 'Marseille', 'France', 'default.jpg', 'Je suis un membre', '1991-11-29', 2, '10.10.0.1', '2016-11-27 18:34:38', '2016-11-27 20:13:39'),
(2, 'Ad', 'Ministrateur', '', 'admin', '', 'admin@exemple.com', 1, 'Paris', 'France', 'default.jpg', 'L\'administrateur du site', '1980-01-01', 0, '192.168.1.1', '2016-11-27 17:59:55', '2016-11-27 20:13:39'),
(4, 'MMM', 'DG', 'h', 'sdfg', '5661c1ef3d5e1a8e4cc17397c440ff7513186437', 'groupb2s3@gmail.com', 1, 'dghdfg', 'Afghanistan', 'daily.jpg', NULL, '1920-01-01', 3, NULL, '2016-12-11 23:33:23', '2016-12-11 23:33:23');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_exp` int(11) UNSIGNED NOT NULL,
  `id_dest` int(11) UNSIGNED NOT NULL,
  `objet` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `contenu` text COLLATE latin1_general_ci NOT NULL,
  `dossier` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `lu` int(1) NOT NULL DEFAULT '0',
  `effacer` int(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id`, `id_exp`, `id_dest`, `objet`, `contenu`, `dossier`, `lu`, `effacer`, `date`) VALUES
(1, 1, 2, 'Message 1', 'Je m\'envoie un message tout seul!', 'lus', 0, 0, '2016-11-27 18:03:20'),
(2, 2, 1, 'Reponse 1', 'Je reponds au message 1', 'non-lus', 0, 0, '2016-11-27 18:03:20');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_topic` int(11) UNSIGNED NOT NULL,
  `id_auteur` int(11) UNSIGNED NOT NULL,
  `contenu` text COLLATE latin1_general_ci NOT NULL,
  `date_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `post`
--

INSERT INTO `post` (`id`, `id_topic`, `id_auteur`, `contenu`, `date_creation`) VALUES
(1, 1, 1, 'Ok, merci', '2016-11-27 18:21:29'),
(2, 1, 2, 'Je pense que tu devrais...', '2016-11-27 18:21:29');

-- --------------------------------------------------------

--
-- Structure de la table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_forum` int(11) UNSIGNED NOT NULL,
  `id_auteur` int(11) UNSIGNED NOT NULL,
  `titre` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `date_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `topic`
--

INSERT INTO `topic` (`id`, `id_forum`, `id_auteur`, `titre`, `date_creation`) VALUES
(1, 1, 1, 'Comment faire?', '2016-11-27 18:13:46');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_auteur` (`id_auteur`),
  ADD KEY `id_auteur_2` (`id_auteur`);

--
-- Index pour la table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auteurId` (`auteurId`),
  ADD KEY `diffusionId` (`diffusionId`),
  ADD KEY `auteurId_2` (`auteurId`),
  ADD KEY `diffusionId_2` (`diffusionId`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_auteur` (`id_auteur`);

--
-- Index pour la table `diffusion`
--
ALTER TABLE `diffusion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_auteur` (`auteurId`);

--
-- Index pour la table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID` (`id`),
  ADD UNIQUE KEY `pseudo` (`login`),
  ADD UNIQUE KEY `pseudo_2` (`login`),
  ADD UNIQUE KEY `pseudo_3` (`login`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_exp` (`id_exp`),
  ADD KEY `id_dest` (`id_dest`),
  ADD KEY `id_exp_2` (`id_exp`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_auteur_post` (`id_auteur`),
  ADD KEY `id_topic_post` (`id_topic`);

--
-- Index pour la table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_auteur` (`id_auteur`),
  ADD KEY `id_forum_topic` (`id_forum`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `diffusion`
--
ALTER TABLE `diffusion`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `forum`
--
ALTER TABLE `forum`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `id_auteur_article` FOREIGN KEY (`id_auteur`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `id_auteur_chat` FOREIGN KEY (`auteurId`) REFERENCES `membre` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `id_diffusion_chat` FOREIGN KEY (`diffusionId`) REFERENCES `diffusion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `id_article_commentaire` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_auteur_commentaire` FOREIGN KEY (`id_auteur`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `diffusion`
--
ALTER TABLE `diffusion`
  ADD CONSTRAINT `id_auteur_diffusion` FOREIGN KEY (`auteurId`) REFERENCES `membre` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `id_dest_message` FOREIGN KEY (`id_dest`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_exp_message` FOREIGN KEY (`id_exp`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `id_auteur_post` FOREIGN KEY (`id_auteur`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_topic_post` FOREIGN KEY (`id_topic`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `id_auteur_topic` FOREIGN KEY (`id_auteur`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_forum_topic` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
