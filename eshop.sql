-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 29 nov. 2021 à 14:46
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eshop`
--

-- --------------------------------------------------------

-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C35F0816A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `user_id`, `nom`, `prenom`, `lastname`, `societe`, `adresse`, `postal`, `ville`, `pays`, `phone`) VALUES
(1, 1, 'Maison', 'Blanchard', 'Bany', 'Bany Trading', '23 Avenue du Docteur Fleming', '92600', 'Asnières-sur-Seine', 'FR', '+33626179337'),
(6, 2, 'Bureau', 'Blanchard', 'Banyingela', 'Bany Trading', '23 Avenue Du Docteur Fleming', '92600', 'ASNIÈRES SUR SEINE', 'FR', '0626179337'),
(7, 2, 'Maison', 'Blanchard', 'Banyingela', NULL, '23 AV du Docteur Fleming', '92600', 'Asnières-sur-Seine', 'FR', '0626179337'),
(8, 3, 'Maison', 'Malon', 'Hector', NULL, '79 rue de la république', '92800', 'PUTEAUX', 'FR', '0626179337'),
(9, 4, 'Maison', 'Blanchard', 'BANYINGELA', '23', '23 AVENUE DU DOCTEUR FLEMING', '92600', 'Asnières-sur-Seine', 'FR', '0626179337');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `nom`, `content`, `slug`) VALUES
(5, 'Chichas', NULL, 'chichas');

-- --------------------------------------------------------

--
-- Structure de la table `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `color`
--

INSERT INTO `color` (`id`, `title`, `ref`) VALUES
(1, 'test', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211013002143', '2021-11-02 18:01:51', 370),
('DoctrineMigrations\\Version20211014142907', '2021-11-02 18:01:52', 293),
('DoctrineMigrations\\Version20211015115551', '2021-11-02 18:01:52', 3044),
('DoctrineMigrations\\Version20211016120351', '2021-11-02 18:01:55', 386),
('DoctrineMigrations\\Version20211016125246', '2021-11-02 18:01:56', 1787),
('DoctrineMigrations\\Version20211016133339', '2021-11-02 18:01:58', 510),
('DoctrineMigrations\\Version20211019002016', '2021-11-02 18:04:55', 620),
('DoctrineMigrations\\Version20211028143012', '2021-11-02 18:04:55', 1340),
('DoctrineMigrations\\Version20211102180708', '2021-11-02 22:45:54', 951),
('DoctrineMigrations\\Version20211102223203', '2021-11-02 22:45:55', 840),
('DoctrineMigrations\\Version20211104130942', '2021-11-04 13:10:02', 835),
('DoctrineMigrations\\Version20211104140016', '2021-11-04 14:00:26', 2051),
('DoctrineMigrations\\Version20211107195708', '2021-11-07 19:57:26', 2001),
('DoctrineMigrations\\Version20211108005257', '2021-11-08 00:53:28', 415),
('DoctrineMigrations\\Version20211112152109', '2021-11-12 15:21:38', 7877),
('DoctrineMigrations\\Version20211114184327', '2021-11-14 18:43:47', 1953),
('DoctrineMigrations\\Version20211118000726', '2021-11-18 00:15:41', 569),
('DoctrineMigrations\\Version20211118025915', '2021-11-18 03:09:47', 491),
('DoctrineMigrations\\Version20211118030928', '2021-11-18 03:09:48', 925),
('DoctrineMigrations\\Version20211118161913', '2021-11-18 16:31:48', 2086),
('DoctrineMigrations\\Version20211118233126', '2021-11-18 23:31:40', 532),
('DoctrineMigrations\\Version20211119002856', '2021-11-19 00:29:09', 1933),
('DoctrineMigrations\\Version20211129144457', '2021-11-29 14:45:31', 3545);

-- --------------------------------------------------------

--
-- Structure de la table `gout`
--

DROP TABLE IF EXISTS `gout`;
CREATE TABLE IF NOT EXISTS `gout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

DROP TABLE IF EXISTS `header`;
CREATE TABLE IF NOT EXISTS `header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `btn_title`, `btn_url`, `image`) VALUES
(1, 'Chicha 1', 'test test', 'Voir', 'sdsd', ''),
(2, 'Chicha 1', 'dfdsf', 'sdfsdf', 'sdfsdf', '82d199fed30e8033a2713486f35b5be6cc282b3a.jpg'),
(3, 'Black Friday', 'Remise exceptionnel pour la black friday', 'Décourvir', 'qsdqsdqsd', 'acaed64fa34f9cb40aca05bfe96345e670d5537c.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `image_product`
--

DROP TABLE IF EXISTS `image_product`;
CREATE TABLE IF NOT EXISTS `image_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_465A53714584665A` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `transpoteur_nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transporteur_prix` double NOT NULL,
  `delivry` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statut` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `transpoteur_nom`, `transporteur_prix`, `delivry`, `is_paid`, `reference`, `stripe_session_id`, `statut`) VALUES
(1, 2, '2021-11-08 15:34:29', 'Colissimo', 50, 'Bureau<br/>Banyingela Blanchard<br/>0626179337<br/>Bany Trading<br/>23 Avenue Du Docteur Fleming<br/>92600 ASNIÈRES SUR SEINE<br/>FR', 0, '', NULL, 0),
(3, 2, '2021-11-10 14:45:13', 'Colissimo', 50, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 0, '', NULL, 0),
(4, 2, '2021-11-12 15:53:15', 'Colissimo', 50, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 0, '12112021-618e8deb10020', NULL, 0),
(5, 2, '2021-11-12 16:39:26', 'Colissimo', 50, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 0, '12112021-618e98be1c6b9', NULL, 0),
(6, 2, '2021-11-12 16:59:58', 'Colissimo', 50, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 0, '12112021-618e9d8e17aa6', NULL, 0),
(7, 2, '2021-11-12 17:01:03', 'Colissimo', 50, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 0, '12112021-618e9dcf7dc4e', NULL, 0),
(8, 2, '2021-11-12 17:03:03', 'DHL', 60, 'Bureau<br/>Banyingela Blanchard<br/>0626179337<br/>Bany Trading<br/>23 Avenue Du Docteur Fleming<br/>92600 ASNIÈRES SUR SEINE<br/>FR', 0, '12112021-618e9e4724d4a', NULL, 0),
(9, 2, '2021-11-14 16:58:42', 'Colissimo', 50, 'Bureau<br/>Banyingela Blanchard<br/>0626179337<br/>Bany Trading<br/>23 Avenue Du Docteur Fleming<br/>92600 ASNIÈRES SUR SEINE<br/>FR', 0, '14112021-619140427c681', NULL, 0),
(10, 2, '2021-11-14 17:28:22', 'DHL', 60, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 0, '14112021-619147360067d', NULL, 0),
(11, 3, '2021-11-14 19:02:25', 'DHL', 60, 'Maison<br/>Hector Malon<br/>0626179337<br/>79 rue de la république<br/>92800 PUTEAUX<br/>FR', 1, '14112021-61915d41de0f9', 'cs_test_b1f2cWU3OIzspBwhGP8fyVhzXBzslCROQqj7ghneOuk0JFbZlAKSkW05I8', 0),
(12, 3, '2021-11-15 19:39:39', 'Colissimo', 50, 'Maison<br/>Hector Malon<br/>0626179337<br/>79 rue de la république<br/>92800 PUTEAUX<br/>FR', 0, '15112021-6192b77b87a65', NULL, 0),
(13, 3, '2021-11-15 19:40:34', 'Colissimo', 50, 'Maison<br/>Hector Malon<br/>0626179337<br/>79 rue de la république<br/>92800 PUTEAUX<br/>FR', 0, '15112021-6192b7b25f87b', 'cs_test_b1Hp9cmgmqSLTToNXzEJBvVL4gOcfhF0g6H2h0hT2BcrqRQm8eufSdWfsR', 0),
(14, 2, '2021-11-15 20:08:56', 'Colissimo', 5000, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 0, '15112021-6192be5877fb8', NULL, 0),
(15, 2, '2021-11-15 20:10:08', 'Colissimo', 5000, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 1, '15112021-6192bea0dff8a', NULL, 0),
(16, 2, '2021-11-15 20:10:44', 'Colissimo', 5000, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 1, '15112021-6192bec4ada41', NULL, 0),
(17, 2, '2021-11-15 20:10:58', 'Colissimo', 5000, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 0, '15112021-6192bed296ece', NULL, 0),
(18, 2, '2021-11-15 20:11:40', 'Colissimo', 5000, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 1, '15112021-6192befcbd48b', NULL, 0),
(19, 2, '2021-11-15 20:12:03', 'Colissimo', 5000, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 0, '15112021-6192bf13c9d4c', 'cs_test_b10ezGFtJ680U7oJkLYqRxMLbHRRnpYc3P5HL4lNZL2bbcSCdLpaB0NIOx', 0),
(20, 3, '2021-11-15 20:15:13', 'Colissimo', 5000, 'Maison<br/>Hector Malon<br/>0626179337<br/>79 rue de la république<br/>92800 PUTEAUX<br/>FR', 1, '15112021-6192bfd164bd0', 'cs_test_b19pM74af4vYdQPo2sx24eRt2Z9RqkwoAlhQSI8KCsGzQs3FPp9Bh2LP2v', 0),
(21, 3, '2021-11-15 22:43:23', 'Colissimo', 5000, 'Maison<br/>Hector Malon<br/>0626179337<br/>79 rue de la république<br/>92800 PUTEAUX<br/>FR', 0, '15112021-6192e28b29289', NULL, 0),
(22, 3, '2021-11-15 23:11:14', 'Colissimo', 5000, 'Maison<br/>Hector Malon<br/>0626179337<br/>79 rue de la république<br/>92800 PUTEAUX<br/>FR', 0, '15112021-6192e9126c5eb', 'cs_test_b1k5BNKpKIzqAUZxz9c9Dl6whKvQAljDmk3iZpEutkBESN5t3W1fkqjnUy', 2),
(23, 2, '2021-11-16 15:23:43', 'Colissimo', 700, 'Maison<br/>Banyingela Blanchard<br/>0626179337<br/>23 AV du Docteur Fleming<br/>92600 Asnières-sur-Seine<br/>FR', 1, '16112021-6193ccff07bcd', 'cs_test_b1r9C4xZsWJaXZvk3q6s3FhRqdulM6S2uV8Ba0meEoSrJaRjG0jGttrgjB', 2),
(24, 3, '2021-11-16 15:27:51', 'DHL', 399, 'Maison<br/>Hector Malon<br/>0626179337<br/>79 rue de la république<br/>92800 PUTEAUX<br/>FR', 1, '16112021-6193cdf76039a', 'cs_test_b1uoMiCoeW99ZClAgn9nKNbupGkfMXbyLtSnIM9WyN4kvj5yIHGcezcgfQ', 2),
(25, 2, '2021-11-18 01:00:17', 'Colissimo', 700, 'Bureau<br/>Banyingela Blanchard<br/>0626179337<br/>Bany Trading<br/>23 Avenue Du Docteur Fleming<br/>92600 ASNIÈRES SUR SEINE<br/>FR', 0, '18112021-6195a5a10755e', NULL, 1),
(26, 2, '2021-11-18 01:02:45', 'DHL', 399, 'Bureau<br/>Banyingela Blanchard<br/>0626179337<br/>Bany Trading<br/>23 Avenue Du Docteur Fleming<br/>92600 ASNIÈRES SUR SEINE<br/>FR', 0, '18112021-6195a6351e742', NULL, 1),
(27, 2, '2021-11-18 01:03:04', 'DHL', 399, 'Bureau<br/>Banyingela Blanchard<br/>0626179337<br/>Bany Trading<br/>23 Avenue Du Docteur Fleming<br/>92600 ASNIÈRES SUR SEINE<br/>FR', 0, '18112021-6195a648ca6e6', 'cs_test_b1eXUIBdJgRhNqWT7lg3WWxDqlEKaahUEkW4Z8gZKzzKPtW4dUpwJC6Cu4', 1),
(28, 4, '2021-11-18 01:12:31', 'DHL', 399, 'Maison<br/>BANYINGELA Blanchard<br/>0626179337<br/>23<br/>23 AVENUE DU DOCTEUR FLEMING<br/>92600 Asnières-sur-Seine<br/>FR', 1, '18112021-6195a87f81be7', 'cs_test_b1D25r6czxZcoENjMxxXHgnQ2PaConVOUxmeBC6bxP2LYCe6Qo2WdD0U4j', 4),
(29, 4, '2021-11-18 01:18:53', 'Colissimo', 700, 'Maison<br/>BANYINGELA Blanchard<br/>0626179337<br/>23<br/>23 AVENUE DU DOCTEUR FLEMING<br/>92600 Asnières-sur-Seine<br/>FR', 1, '18112021-6195a9fd761cb', 'cs_test_b11NEzEeKGw5Rcm1qXECVtBVJ1nY5slnJAXMMtEEPUYclSRmO9zIRHDu3f', 3),
(30, 2, '2021-11-29 03:09:46', 'DHL', 399, 'Bureau<br/>Banyingela Blanchard<br/>0626179337<br/>Bany Trading<br/>23 Avenue Du Docteur Fleming<br/>92600 ASNIÈRES SUR SEINE<br/>FR', 0, '29112021-61a4447adce20', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `my_order_id` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845CA2C1BFCDF877` (`my_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `qantity`, `price`, `total`) VALUES
(1, 1, ' Chicha BAMBINO ', 1, 45, 45),
(2, 1, ' Chicha Minotor ', 1, 99, 99),
(3, 1, ' Chicha BAMBINO ', 1, 45, 45),
(6, 3, ' Chicha GLOSSY GOLD ® ', 1, 109, 109),
(7, 3, ' Chicha ODUMAN N7 SMOKE TANK ', 1, 99, 99),
(8, 4, ' Chicha PRISMA ONE AQUA ', 2, 179, 358),
(9, 4, ' Chicha BAMBINO ', 1, 45, 45),
(10, 5, ' Chicha PRISMA ONE AQUA ', 2, 179, 358),
(11, 5, ' Chicha BAMBINO ', 1, 45, 45),
(12, 6, ' Chicha PRISMA ONE AQUA ', 2, 179, 358),
(13, 6, ' Chicha BAMBINO ', 1, 45, 45),
(14, 7, ' Chicha PRISMA ONE AQUA ', 2, 179, 358),
(15, 7, ' Chicha BAMBINO ', 1, 45, 45),
(16, 8, ' Chicha PRISMA ONE AQUA ', 2, 179, 358),
(17, 8, ' Chicha BAMBINO ', 1, 45, 45),
(18, 9, ' Chicha BAMBINO ', 1, 45, 45),
(19, 9, ' Chicha Minotor ', 1, 99, 99),
(20, 9, ' KIT CHICHA ', 1, 39, 39),
(21, 10, ' Chicha BAMBINO ', 1, 45, 45),
(22, 10, ' Chicha Minotor ', 1, 99, 99),
(23, 10, ' KIT CHICHA ', 1, 39, 39),
(24, 10, ' Chicha EMBERY MONO WAVE ', 1, 199, 199),
(25, 11, ' Chicha MS VENOM ', 1, 99, 99),
(26, 11, ' Chicha VENTO ', 1, 45, 45),
(27, 12, ' Chicha MS VENOM ', 1, 99, 99),
(28, 12, ' Chicha VENTO ', 1, 45, 45),
(29, 13, ' Chicha MS VENOM ', 1, 99, 99),
(30, 13, ' Chicha VENTO ', 1, 45, 45),
(31, 14, ' KIT CHICHA ', 1, 39, 39),
(32, 14, ' Chicha EMBERY MONO WAVE ', 1, 199, 199),
(33, 15, ' KIT CHICHA ', 1, 39, 39),
(34, 15, ' Chicha EMBERY MONO WAVE ', 1, 199, 199),
(35, 16, ' KIT CHICHA ', 1, 39, 39),
(36, 16, ' Chicha EMBERY MONO WAVE ', 1, 199, 199),
(37, 17, ' KIT CHICHA ', 1, 39, 39),
(38, 17, ' Chicha EMBERY MONO WAVE ', 1, 199, 199),
(39, 18, ' KIT CHICHA ', 1, 39, 39),
(40, 18, ' Chicha EMBERY MONO WAVE ', 1, 199, 199),
(41, 19, ' KIT CHICHA ', 1, 39, 39),
(42, 19, ' Chicha EMBERY MONO WAVE ', 1, 199, 199),
(43, 20, ' Chicha MS VENOM ', 1, 99, 99),
(44, 20, ' Chicha VENTO ', 1, 45, 45),
(45, 21, ' Chicha BAMBINO ', 1, 45, 45),
(46, 21, ' Chicha BAMBINO ', 1, 45, 45),
(47, 22, ' Chicha BAMBINO ', 1, 45, 45),
(48, 22, ' Chicha MEXANIKA SMOKE MS ', 1, 195, 195),
(49, 23, ' KIT CHICHA ', 1, 39, 39),
(50, 23, ' Chicha EMBERY MONO WAVE ', 1, 199, 199),
(51, 23, ' Chicha Centor ', 1, 149, 149),
(52, 24, ' Chicha BAMBINO ', 1, 45, 45),
(53, 24, ' Chicha MEXANIKA SMOKE MS ', 1, 195, 195),
(54, 25, ' Chicha Centor ', 1, 149, 149),
(55, 26, ' Chicha Centor ', 1, 149, 149),
(56, 27, ' Chicha Centor ', 1, 149, 149),
(57, 28, ' Chicha BAMBINO ', 1, 45, 45),
(58, 29, ' Chicha BAMBINO ', 1, 45, 45),
(59, 30, ' STEAMULATION PRO X II ', 1, 379, 379),
(60, 30, ' Chicha CELESTE X3 CLICK ', 1, 49, 49);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `sous_category_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `price_ht` double NOT NULL,
  `promotion` tinyint(1) DEFAULT NULL,
  `nouveaute` tinyint(1) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `taille` double NOT NULL,
  `vase` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tuyau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fixation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `autre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publie` tinyint(1) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`),
  KEY `IDX_D34A04AD527FEED1` (`sous_category_id`),
  KEY `IDX_D34A04AD7ADA1FB5` (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `sous_category_id`, `nom`, `content`, `slug`, `image`, `price`, `price_ht`, `promotion`, `nouveaute`, `color_id`, `taille`, `vase`, `tuyau`, `fixation`, `autre`, `publie`, `is_best`) VALUES
(1, 5, 1, ' Chicha CELESTE JUNIOR 2.0 ', ' La chicha CELESTE JUNIOR 2.0, la référence du narguilé EL-BADIA, fourni avec tuyau, foyer en céramique, une brosse dentretien et une pince.', '-chicha-celeste-junior-2-0-', 'https://www.el-badia.com/9080-home_default/xchicha-celeste-junior-20.jpg.pagespeed.ic.CzkTIrQYRL.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 1, 1),
(2, 5, 1, ' Chicha EL-BADIA P1 ', ' Chicha EL-BADAI P1, chicha transportable avec tuyau&nbsp;en silicone et foyer à double capacité&nbsp;', '-chicha-el-badia-p1-', 'https://www.el-badia.com/7012-home_default/xchicha-el-badia-p1.jpg.pagespeed.ic.OH_zNsAgsv.png', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 1, 1),
(3, 5, 1, ' Chicha CELESTE X3 CLICK ', ' Chicha CELESTE X3, 36cm, avec vase en verre et fixation CLICK', '-chicha-celeste-x3-click-', 'https://www.el-badia.com/10257-home_default/xchicha-celeste-x3-click.jpg.pagespeed.ic.l-KbJPtdUD.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 1, 0),
(4, 5, 1, ' Chicha EL-BADIA XS ', ' Chicha EL-BADIA XS, 21cm, compacte et nomade, vase en verre, foyer et tuyaux fournis', '-chicha-el-badia-xs-', 'https://www.el-badia.com/9063-home_default/xchicha-el-badia-xs.jpg.pagespeed.ic.gqQSy_dym8.jpg', 29, 29, 0, 0, 1, 0, '', '', '', NULL, 0, 1),
(5, 5, 1, ' Chicha EL-BADIA C1 ', ' Chicha EL-BADIA C1, haute de 31cm, cette chicha chamboule les codes avec un tout nouveau vase en verre doté dun système click.', '-chicha-el-badia-c1-', 'https://www.el-badia.com/9076-home_default/xchicha-el-badia-c1.jpg.pagespeed.ic.L-l4b68jQc.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 1),
(6, 5, 1, ' Chicha Celeste X3 ', ' Issue de la gamme de chicha CELESTE, voici la EL-BADIA CELESTE X3,', '-chicha-celeste-x3-', 'https://www.el-badia.com/9099-home_default/xchicha-celeste-x3.jpg.pagespeed.ic.PJFmhWQp8W.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(7, 5, 1, ' Chicha EL-BADIA C5 ', ' Chicha EL-BADIA C5, 43cm, vase en verre CLICK, CUT de colonne 18/8 fourni avec tuyau silicone, manche métallique et foyer avec système de chauffe type cheminée.', '-chicha-el-badia-c5-', 'https://www.el-badia.com/9179-home_default/xchicha-el-badia-c5.jpg.pagespeed.ic.rjyJKOJ2fs.jpg', 79, 79, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(8, 5, 1, ' Chicha CELESTE JUNIOR 2.0 CAMO ', ' Chicha CELESTE JUNIOR 2.0 CAMO, cm37, vase acry, couleurs camouflage', '-chicha-celeste-junior-2-0-camo-', 'https://www.el-badia.com/9130-home_default/xchicha-celeste-junior-20-camo.jpg.pagespeed.ic.AhDpu_gDpv.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(9, 5, 1, ' Chicha CELESTE X1 ', ' La chicha X1 de la gamme la plus célèbre de chicha, CELESTE, compacte de 25cm, tuyau et foyer inclus', '-chicha-celeste-x1-', 'https://www.el-badia.com/9138-home_default/xchicha-celeste-x1.jpg.pagespeed.ic.YaHNIIvAOD.jpg', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(10, 5, 1, ' Chicha EL-BADIA C7 ', ' Chicha EL-BADIA C7, 56 cm, vase en verre CLICK, CUT de colonne 18/8, tuyau silicone et foyer avec système de chauffe type cheminée', '-chicha-el-badia-c7-', 'https://www.el-badia.com/9192-home_default/xchicha-el-badia-c7.jpg.pagespeed.ic.6BxrkPFrie.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(11, 5, 1, ' Chicha CELESTE CRAZY ', ' Chicha CELESTE X3, 36cm, avec vase en verre et fixation CLICK et coloris type graffiti', '-chicha-celeste-crazy-', 'https://www.el-badia.com/9198-home_default/xchicha-celeste-crazy.jpg.pagespeed.ic.s5tvpl52F0.jpg', 69, 69, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(12, 5, 1, ' Chicha CELESTE X3 EDITION SPECIALE ', ' Chicha CELESTE X3 édition spéciale: Woodland Army, Lava et Black Marble', '-chicha-celeste-x3-edition-speciale-', 'https://www.el-badia.com/9153-home_default/xchicha-celeste-x3-edition-spe.jpg.pagespeed.ic.jUuyt8O9pr.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(13, 5, 1, ' Chicha VYRO ONE ', ' Chicha VYRO ONE de la marque AEON, chicha transportable très résistante, en carbone et acier inoxydable, haute de 16cm.', '-chicha-vyro-one-', 'https://www.el-badia.com/6402-home_default/xchicha-vyro-one.jpg.pagespeed.ic.V7IDaTok9v.jpg', 69, 69, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(14, 5, 1, ' Chicha MVP 360 ', ' Chicha MVP 360 en acier inoxydable, complète avec tuyau silicone et foyer', '-chicha-mvp-360-', 'https://www.el-badia.com/7713-home_default/xchicha-mvp-360.jpg.pagespeed.ic.xCzVxtvPZk.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(15, 5, 1, ' Chicha MOZE BREEZE TWO ', ' Chicha MOZE BREEZE TWO, 39cm, en acier inoxydable, polyacétal et revêtement en résine colorée. Fournie avec manche assorti, diffuseur et purge modulable.', '-chicha-moze-breeze-two-', 'https://www.el-badia.com/10221-home_default/xchicha-moze-breeze-two.jpg.pagespeed.ic.C5FQE8xOEm.jpg', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(16, 5, 1, ' Chicha MS MICRO ', ' Chicha MS MICRO en acrylique et aluminium, tuyau silicone et manche fournis', '-chicha-ms-micro-', 'https://www.el-badia.com/4430-home_default/xchicha-ms-micro.jpg.pagespeed.ic.azOigeEfeN.jpg', 120, 120, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(17, 5, 1, ' Chicha STARBUZZ CARBINE HOOKAH ', ' Chicha STARBUZZ CARBINE HOOKAH, 65cm, trépied télescopique, rotation 360°, système LED', '-chicha-starbuzz-carbine-hookah-', 'https://www.el-badia.com/5201-home_default/xchicha-starbuzz-carbine-hookah.jpg.pagespeed.ic._MRlenYWbT.jpg', 269, 269, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(18, 5, 1, ' STEAMULATION PRO X II ', ' Chicha STEAMULATION CLASSIC PRO X II, en acier inoxydable, vase en cristal, 52cm, Click 360°,&nbsp;ultra réglable', '-steamulation-pro-x-ii-', 'https://www.el-badia.com/10551-home_default/xsteamulation-pro-x-ii.jpg.pagespeed.ic.l8cDYvoB_D.jpg', 379, 379, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(19, 5, 1, ' Chicha CELESTE X1 EDITION SPECIALE ', ' Chicha CELESTE X1&nbsp;édition spéciale', '-chicha-celeste-x1-edition-speciale-', 'https://www.el-badia.com/9174-home_default/xchicha-celeste-x1-edition-speciale.jpg.pagespeed.ic.qzwoVtxn1O.jpg', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(20, 5, 1, ' Chicha OCEAN HOOKAH KAIF SMALL ', ' Chicha OCEAN HOOKAH KAIF SMALL, 39cm, acier inoxydable V2A, purge en dessous du plateau, tuyau silicone, manche et pince fournis', '-chicha-ocean-hookah-kaif-small-', 'https://www.el-badia.com/8012-home_default/xchicha-ocean-hookah-kaif-small.jpg.pagespeed.ic.G3POhKYyi-.jpg', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(21, 5, 1, ' Chicha BRODATOR 320 MINI ', ' Chicha BRODATOR 320 MINI, 32cm en inox, sac de transport, tuyau silicone et foyer en terre cuite', '-chicha-brodator-320-mini-', 'https://www.el-badia.com/10068-home_default/xchicha-brodator-320-mini.jpg.pagespeed.ic.fhEjeNWsWi.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(22, 5, 1, ' Chicha MS SCANDI 2.0 ', ' Chicha en verre MS SCANDI 2.0, haute de 25 cm, vase en verre&nbsp;suspendu&nbsp;sur un socle en bois.', '-chicha-ms-scandi-2-0-', 'https://www.el-badia.com/9776-home_default/xchicha-ms-scandi-20.jpg.pagespeed.ic.oyURP5KGGB.jpg', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(23, 5, 1, ' Chicha MS MIGNON ', ' Chicha MS&nbsp;MIGNON, 20cm, en acrylique et aluminium, tuyau silicone et manche, LED et sacoche fournis', '-chicha-ms-mignon-', 'https://www.el-badia.com/10576-home_default/xchicha-ms-mignon.jpg.pagespeed.ic.VKFqlsPXgu.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(24, 5, 1, ' Chicha CORSAIR ', ' Chicha CORSAIR, 50cm, de fabrication russe, acier inoxydable et polyacétal.&nbsp;Système de réglage du diffuseur.&nbsp;', '-chicha-corsair-', 'https://www.el-badia.com/10492-home_default/xchicha-corsair.jpg.pagespeed.ic.xzUcGBLsVq.jpg', 119, 119, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(25, 5, 1, ' Chicha MVP A36 ', ' Chicha MVP A36 en acier inoxydable,36cm&nbsp; complète avec tuyau silicone et foyer avec système de chauffe, cut de colonne et diffuseur', '-chicha-mvp-a36-', 'https://www.el-badia.com/10741-home_default/xchicha-mvp-a36.jpg.pagespeed.ic.69BZMovqxQ.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(26, 5, 1, ' Chicha EMBERY MINI MONO ', ' Chicha EMBERY MINI MONO, acier inoxydable et polyacétal&nbsp;(POM), 35cm, tuyau silicone et manche inclus', '-chicha-embery-mini-mono-', 'https://www.el-badia.com/7878-home_default/xchicha-embery-mini-mono.jpg.pagespeed.ic.oE5BsI9cK6.jpg', 109, 109, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(27, 5, 1, ' SCORPIO Melody ', ' Chicha SCORPIO MELODY, 40cm, vase en verre nacré et corps en aluminium anodisé, complète foyer et tuyau silicone fournis', '-scorpio-melody-', 'https://www.el-badia.com/9770-home_default/xscorpio-melody.jpg.pagespeed.ic.Ufk0Ylm0JC.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(28, 5, 1, ' Chicha MVP 360 GOLD EDITION ', ' Chicha MVP 360 GOLD EDITION en acier inoxydable, complète avec tuyau silicone et foyer', '-chicha-mvp-360-gold-edition-', 'https://www.el-badia.com/10248-home_default/xchicha-mvp-360-gold-edition.jpg.pagespeed.ic.YuJihwrap6.png', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(29, 5, 1, ' Scorpio Temple ', ' Chicha SCORPIO&nbsp;TEMPLE, 41&nbsp;cm, foyer et tuyau en silicone inclus', '-scorpio-temple-', 'https://www.el-badia.com/5434-home_default/xscorpio-temple.jpg.pagespeed.ic.zWtJTdTMl7.jpg', 55, 55, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(30, 5, 1, ' Scorpio Stinger Carbon ', ' Chicha SCORPIO&nbsp;CARBON, 38 cm, colonne en finition carbone, tuyau et foyer silicone fournis', '-scorpio-stinger-carbon-', 'https://www.el-badia.com/5437-home_default/xscorpio-stinger-carbon.jpg.pagespeed.ic.7aP1CpgN_A.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(31, 5, 1, ' Chicha MVP 460 ', ' Chicha MVP&nbsp;460 en acier inoxydable, 46cm complète avec tuyau silicone et foyer avec système de chauffe et diffuseur', '-chicha-mvp-460-', 'https://www.el-badia.com/10762-home_default/xchicha-mvp-460.jpg.pagespeed.ic.4NFW_C4q9K.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(32, 5, 1, ' Chicha Clones Captain ', ' Chicha CLONES CAPTAIN, 52 cm, système click, vase verre, tuyau silicone et foyer terre-cuite', '-chicha-clones-captain-', 'https://www.el-badia.com/10537-home_default/xchicha-clones-captain.jpg.pagespeed.ic.fcZ_AWHmNH.jpg', 69, 69, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(33, 5, 1, ' Chicha MVP 500 ', ' Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', '-chicha-mvp-500-', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(34, 5, 1, ' Chicha WOOKAH IROKO CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni.', '-chicha-wookah-iroko-crystal-click-', 'https://www.el-badia.com/6489-home_default/xwookah-iroko-crystal-click.jpg.pagespeed.ic.0gOFOAjPj7.jpg', 294, 294, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(35, 5, 1, ' Chicha DUM SS30 2.0 ', ' Chicha DUM SS30 2.0&nbsp;: &nbsp;52 cm, en acier inoxydable, «&nbsp;cut&nbsp;»18.8, complète avec tuyau en silicone et manche en aluminium dévissable, foyer et système de chauffe type cheminée, diffuseur amovible pour plongeur.&nbsp;', '-chicha-dum-ss30-2-0-', 'https://www.el-badia.com/10367-home_default/xchicha-dum-ss30-20.jpg.pagespeed.ic.MWCoCH5F09.jpg', 119, 119, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(36, 5, 1, ' Chicha MS TOKYO 2.0 ', ' Chicha MS TOKYO 2.0, 30cm, fournie avec sacoche de transport, tuyau silicone et manche en alu, foyer silicone.', '-chicha-ms-tokyo-2-0-', 'https://www.el-badia.com/9009-home_default/xchicha-ms-tokyo-20.jpg.pagespeed.ic.43xCO8GUHJ.jpg', 69, 69, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(37, 5, 1, ' Steamulation PRO X II CRYSTAL ', ' Chicha STEAMULATION CLASSIC PRO X II CRYSTAL, en acier inoxydable, vase en cristal ciselé, 52cm, Click 360°,&nbsp;ultra réglable', '-steamulation-pro-x-ii-crystal-', 'https://www.el-badia.com/10562-home_default/xsteamulation-pro-x-2-crystal.jpg.pagespeed.ic.Qc8qtm21BM.jpg', 399, 399, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(38, 5, 1, ' Chicha DUM CARBON SS19 ', ' chicha DUM CARBON SS19, 33cm, en acier inoxydable, colonne en carbone, complète avec tuyau en silicone et manche carbone, foyer et système de chauffe type cheminée, diffuseur amovible pour plongeur', '-chicha-dum-carbon-ss19-', 'https://www.el-badia.com/8184-home_default/xchicha-dum-carbon-ss19.jpg.pagespeed.ic.yAc3NzrdVB.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(39, 5, 1, ' Chicha ARTEFACT HOOKAH ESTETIC ', ' Chicha ARTEFACT HOOKAH ESTETIC, 50cm, corps en résine epoxy et inox, soupape dissimulée, tuyau silicone et manche assorti', '-chicha-artefact-hookah-estetic-', 'https://www.el-badia.com/10235-home_default/xchicha-artefact-estetic-hookah.jpg.pagespeed.ic.zJ01uiLQlz.png', 189, 189, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(40, 5, 1, ' Chicha NUBE UNIQUE ', ' Chicha NUBE UNIQUE, 55cm, en acier inoxydable AISI 321 revêtue de bois noble, tuyau silicone', '-chicha-nube-unique-', 'https://www.el-badia.com/6149-home_default/xchicha-nube-unique.jpg.pagespeed.ic.3NPkmhCfFk.jpg', 309, 309, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(41, 5, 1, ' Chicha MS TOKYO ', ' Chicha transportable MS TOKYO, pack complet, facilement transportable.', '-chicha-ms-tokyo-', 'https://www.el-badia.com/6661-home_default/xchicha-ms-tokyo.jpg.pagespeed.ic.YraCO6KsX5.jpg', 59, 59, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(42, 5, 1, ' Chicha WOOKAH WALNUT CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni.', '-chicha-wookah-walnut-crystal-click-', 'https://www.el-badia.com/6503-home_default/xwookah-walnut-crystal-click.jpg.pagespeed.ic.AETXrP11ZL.jpg', 314, 314, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(43, 5, 1, ' Chicha KALOUD KRYSALIS ELTHERIA ', ' Chicha KALOUD KRYSALIS ELTHERIA&nbsp;®, double paroi en plastique sans BPA avec socle en silicone, système de LED', '-chicha-kaloud-krysalis-eltheria-', 'https://www.el-badia.com/7129-home_default/xchicha-kaloud-krysalis-eltheria.jpg.pagespeed.ic.vy5R1n8V20.jpg', 499, 499, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(44, 5, 1, ' Chicha EMBERY MINI MONO FLIP ', ' Chicha EMBERY MINI MONO FLIP, acier inoxydable et polyacétal&nbsp;(POM), 35cm, 6 types de purge paramétrables, tuyau silicone et manche inclus', '-chicha-embery-mini-mono-flip-', 'https://www.el-badia.com/11085-home_default/xchicha-embery-mini-mono-flip.jpg.pagespeed.ic.Q3BmyX46pZ.jpg', 135, 135, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(45, 5, 1, ' Chicha MS BB ', ' MS BB, 13cm, chicha compacte en acrylique avec sac de transport, fournie avec diffuseur et tuyau silicone', '-chicha-ms-bb-', 'https://www.el-badia.com/9808-home_default/xchicha-ms-bb.jpg.pagespeed.ic.sRkQSMo_FD.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(46, 5, 1, ' Chicha EMBERY MINI MONO FLIP BLACK ', ' Chicha EMBERY MINI MONO FLIP BLACK, acier inoxydable et polyacétal&nbsp;(POM), 35cm, 6 types de purge paramétrables, tuyau silicone et manche inclus', '-chicha-embery-mini-mono-flip-black-', 'https://www.el-badia.com/11106-home_default/xembery-mini-mono-flip-black.jpg.pagespeed.ic.aOMYoXlgbK.jpg', 145, 145, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(47, 5, 1, ' Chicha CARTEL HAVANA S ', ' Chicha CARTEL HAVANA S, 35cm, foyer STARK, tuyau et manche silicone, diffuseur, purge dissimulée et plateau ciselé WOLF', '-chicha-cartel-havana-s-', 'https://www.el-badia.com/10996-home_default/xchicha-cartel-havana-s.jpg.pagespeed.ic.ZQeUrJAGph.png', 69, 69, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(48, 5, 1, ' Chicha MVP 360 EPOX ', ' Chicha MVP 360 EPOXY en acier inoxydable, complète avec tuyau silicone et foyer', '-chicha-mvp-360-epox-', 'https://www.el-badia.com/10787-home_default/xchicha-mvp-360-epox.jpg.pagespeed.ic._qwBsJdbVW.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(49, 5, 1, ' Chicha MVP A46 ', ' Chicha MVP A46 en acier inoxydable, 46cm complète avec tuyau silicone et foyer avec système de chauffe, cut de colonne et diffuseur', '-chicha-mvp-a46-', 'https://www.el-badia.com/10747-home_default/xchicha-mvp-a46.jpg.pagespeed.ic.OYxH6RPXzZ.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(50, 5, 1, ' Chicha WOOKAH WENGE CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-wenge-crystal-click-', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(51, 5, 1, ' Chicha WOOKAH WENGE CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-wenge-crystal-click-', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(52, 5, 1, ' Chicha WOOKAH WENGE CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-wenge-crystal-click-', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(53, 5, 1, ' Chicha WOOKAH WENGE CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-wenge-crystal-click-', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(54, 5, 1, ' Chicha WOOKAH WENGE CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-wenge-crystal-click-', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(55, 5, 1, ' Chicha WOOKAH WENGE CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-wenge-crystal-click-', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(56, 5, 1, ' Chicha WOOKAH WENGE CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-wenge-crystal-click-', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(57, 5, 1, ' Chicha WOOKAH WENGE CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-wenge-crystal-click-', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(58, 5, 2, ' Chicha ODUMAN N3 ON THE GO ', ' Chicha ODUMAN N3 ON THE GO', '-chicha-oduman-n3-on-the-go-', 'https://www.el-badia.com/10810-home_default/xchicha-oduman-n3-on-the-go.jpg.pagespeed.ic.Xv-MeGSBsj.png', 79, 79, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(59, 5, 2, ' Chicha Oduman Micro ', ' Chicha ODUMAN MICRO, 17cm avec sacoche de transport , tuyau silicone, ressort et diffuseur', '-chicha-oduman-micro-', 'https://www.el-badia.com/10814-home_default/xchicha-oduman-micro.jpg.pagespeed.ic.OgD36ePSrG.png', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(60, 5, 2, ' Chicha ODUMAN N5-Z JUNIOR ', ' La chicha ODUMAN N5-Z JUNIOR est une chicha en verre suspendue sur un socle métallique, 24cm', '-chicha-oduman-n5-z-junior-', 'https://www.el-badia.com/3509-home_default/xchicha-oduman-n5-z-junior.jpg.pagespeed.ic.WF6ukoYRER.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(61, 5, 2, ' Chicha ODUMAN SMOKE X ', ' Chicha en verre ODUMAN SMOKE X tuyau silicone et métal, 22cm, système de LED', '-chicha-oduman-smoke-x-', 'https://www.el-badia.com/10811-home_default/xchicha-oduman-smoke-x.jpg.pagespeed.ic.HWCTbe56Tf.png', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(62, 5, 2, ' Chicha ODUMAN N9 SPIDER ', ' La chicha ODUMAN N9&nbsp;SPIDER est une chicha en verre suspendue sur un socle métallique, 25cm', '-chicha-oduman-n9-spider-', 'https://www.el-badia.com/10530-home_default/xchicha-oduman-n9-spider.jpg.pagespeed.ic.Q0INuZOE8b.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(63, 5, 2, ' Chicha ODUMAN N8 VOYAGE ', ' Chicha ODUMAN N8 VOYAGE en verre, compacte 20cm, avec sacoche de transport et tuyau silicone', '-chicha-oduman-n8-voyage-', 'https://www.el-badia.com/4070-home_default/xchicha-oduman-n8-voyage.jpg.pagespeed.ic.u-biqbP5mp.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(64, 5, 2, ' Chicha Fumo MINI JAR MALLETTE ', ' Chicha FUMO MINI JAR&nbsp;® en verre de laboratoire complète avec mallette, H=26cm, L=10cm', '-chicha-fumo-mini-jar-mallette-', 'https://www.el-badia.com/11040-home_default/xchicha-fumo-mini-jar-mallette.jpg.pagespeed.ic.7rsJtW3Wsk.jpg', 245, 245, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(65, 5, 2, ' Chicha ODUMAN N7 SMOKE TANK ', ' Chicha ODUMAN N7 SMOKE TANK avec sacoche et tuyau silicone, 21x19cm', '-chicha-oduman-n7-smoke-tank-', 'https://www.el-badia.com/3823-home_default/xchicha-oduman-n7-smoke-tank.jpg.pagespeed.ic.i-J8FJrerJ.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(66, 5, 2, ' Chicha FUMO MINI JAR ', ' Chicha FUMO MINI JAR&nbsp;® en verre de laboratoire complète, H=26cm, L=10cm', '-chicha-fumo-mini-jar-', 'https://www.el-badia.com/11155-home_default/xchicha-fumo-mini-jar.jpg.pagespeed.ic.kEaGNuS2ZQ.jpg', 215, 215, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(67, 5, 2, ' Chicha ODUMAN MIDI ', ' Chicha ODUMAN N4M-C MIDI, 23 cm, en verre avec sacoche de transport et tuyau silicone, LED inclue', '-chicha-oduman-midi-', 'https://www.el-badia.com/5372-home_default/xchicha-oduman-midi.jpg.pagespeed.ic.XO6Hf0DET8.jpg', 109, 109, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(68, 5, 2, ' Chicha MS COSMOPOLITAN ', ' Chicha MS COSMOPOLITAN, 31 cm, avec manche en verre et tuyau silicone', '-chicha-ms-cosmopolitan-', 'https://www.el-badia.com/3497-home_default/xchicha-ms-cosmopolitan.jpg.pagespeed.ic.I2fVBaKITy.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(69, 5, 2, ' Chicha Fumo MINI TANK MALLETTE ', ' Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', '-chicha-fumo-mini-tank-mallette-', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(70, 5, 2, ' Chicha FUMO MINI TANK ', ' Chicha FUMO MINI TANK ® en verre de laboratoire avec tuyau à embout en verre, H=17cm, L=21cm', '-chicha-fumo-mini-tank-', 'https://www.el-badia.com/11154-home_default/xchicha-fumo-mini-tank-.jpg.pagespeed.ic.tzbm1tKoyi.png', 245, 245, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(71, 5, 2, ' Chicha ODUMAN N2 TRAVEL ', ' La chicha ODUMAN N2 TRAVEL en verre, compacte 18cm, avec sacoche de transport et tuyau silicone', '-chicha-oduman-n2-travel-', 'https://www.el-badia.com/10532-home_default/xchicha-oduman-n2-travel.jpg.pagespeed.ic.PttnNxpIWB.jpg', 79, 79, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(72, 5, 2, ' Chicha Ms SCANDI ', ' Chicha en verre MS SCANDI, haute de 35 cm, vase en verre maintenu par un socle en bois.', '-chicha-ms-scandi-', 'https://www.el-badia.com/6378-home_default/xchicha-ms-scandi.jpg.pagespeed.ic.g0qod9oi7c.jpg', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(73, 5, 2, ' Chicha CELESTE GLASS ICE ', ' Chicha en verre de laboratoire CELESTE GLASS version ICE, 39cm, avec système de LED', '-chicha-celeste-glass-ice-', 'https://www.el-badia.com/2634-home_default/xchicha-celeste-glass-ice.jpg.pagespeed.ic.KoJhsReLJC.jpg', 139, 139, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(74, 5, 2, ' Chicha FUMO ZED ', ' Chicha FUMO ZED&nbsp;® en verre de laboratoire borosilicate avec tuyau à embout en verre, 49cm', '-chicha-fumo-zed-', 'https://www.el-badia.com/3873-home_default/xchicha-fumo-zed.jpg.pagespeed.ic.o4fatgm2WA.jpg', 359, 359, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(75, 5, 2, ' Chicha CELESTE GLASS ', ' Chicha en verre de laboratoire CELESTE GLASS, 39cm, avec système de LED, tuyau silicone et&nbsp;verre', '-chicha-celeste-glass-', 'https://www.el-badia.com/2420-home_default/xceleste-glass.jpg.pagespeed.ic.dzpywdw2RQ.jpg', 129, 129, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(76, 5, 2, ' Chicha FUMO MIDDLE TANK ', ' Chicha FUMO MIDDLE TANK ® en verre de laboratoire avec tuyau à embout en verre, H=13cm, L=25cm', '-chicha-fumo-middle-tank-', 'https://www.el-badia.com/3864-home_default/xchicha-fumo-middle-tank-.jpg.pagespeed.ic.YcmxopQdqd.jpg', 349, 349, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(77, 5, 2, ' Chicha FUMO JAR ICE ', ' Chicha FUMO JAR ® ICE en verre de laboratoire borosilicate avec tuyau à embout en verre, 37cm.', '-chicha-fumo-jar-ice-', 'https://www.el-badia.com/3865-home_default/xchicha-fumo-jar-ice.jpg.pagespeed.ic.tIygQJGKSo.jpg', 309, 309, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(78, 5, 2, ' Chicha FUMO ZED XL ', ' La chicha FUMO POD ZED&nbsp;® en verre de laboratoire borosilicate avec tuyau à embout en verre, 80cm', '-chicha-fumo-zed-xl-', 'https://www.el-badia.com/3874-home_default/xchicha-fumo-zed-xl.jpg.pagespeed.ic.M-Vb1NpEtr.jpg', 389, 389, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(79, 5, 2, ' Chicha GLOSSY WHITE ® ', ' Chicha&nbsp;GLOSSY WHITE ® en verre de laboratoire, 30cm, foyer verre, diffuseur intégré, tuyau silicone', '-chicha-glossy-white-', 'https://www.el-badia.com/1877-home_default/xchicha-glossy-white.jpg.pagespeed.ic.7q_1Mzzeg0.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(80, 5, 2, ' Chicha SKULL ', ' Chicha Skull, entièrement en verre, fournie avec manche en verre et foyer.', '-chicha-skull-', 'https://www.el-badia.com/6740-home_default/xchicha-skull.jpg.pagespeed.ic.cSdnDBf_x6.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(81, 5, 2, ' Chicha FUMO TANK ', ' Chicha FUMO TANK ® en verre de laboratoire borosilicate avec tuyau à embout en verre, H=23cm, L=30cm', '-chicha-fumo-tank-', 'https://www.el-badia.com/3872-home_default/xchicha-fumo-tank-.jpg.pagespeed.ic.aRywlIErvQ.jpg', 329, 329, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(82, 5, 2, ' Chicha CELESTE GLASS GOLD ', ' Chicha en verre de laboratoire CELESTE GLASS version GOLD, 39cm, avec système de LED', '-chicha-celeste-glass-gold-', 'https://www.el-badia.com/3260-home_default/xchicha-celeste-glass-gold.jpg.pagespeed.ic.owKQpaBr9o.jpg', 111, 111, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(83, 5, 2, ' Chicha ODUMAN TRINITY ', ' Chicha ODUMAN TRINITY en verre sur trépied, 41cm', '-chicha-oduman-trinity-', 'https://www.el-badia.com/5184-home_default/xchicha-oduman-trinity.jpg.pagespeed.ic.6CGtEo97KY.png', 179, 179, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(84, 5, 2, ' Chicha FUMO ORB ICE ', ' Chicha FUMO Orb ® ICE en verre de laboratoire avec tuyau à embout en verre, 26cm', '-chicha-fumo-orb-ice-', 'https://www.el-badia.com/3871-home_default/xchicha-fumo-orb-ice.jpg.pagespeed.ic.JJqKRqqwVx.jpg', 289, 289, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(85, 5, 2, ' Chicha GLOSSY SILVER ® ', ' Chicha&nbsp;GLOSSY Silver&nbsp;® en verre de laboratoire, 30cm, foyer verre, diffuseur intégré, tuyau silicone', '-chicha-glossy-silver-', 'https://www.el-badia.com/3255-home_default/xchicha-glossy-silver.jpg.pagespeed.ic.7AyY_zg-37.jpg', 109, 109, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(86, 5, 2, ' Chicha FUMO ORB ', ' Chicha FUMO Orb ® en verre de laboratoire avec tuyau à embout en verre, 26cm', '-chicha-fumo-orb-', 'https://www.el-badia.com/3870-home_default/xchicha-fumo-orb.jpg.pagespeed.ic.UXAOMAkST8.jpg', 269, 269, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(87, 5, 2, ' Chicha FUMO F4 ', ' Chicha FUMO F4 ® en verre de laboratoire borosilicate avec tuyau à embout en verre, 48cm', '-chicha-fumo-f4-', 'https://www.el-badia.com/3876-home_default/xchicha-fumo-f4.jpg.pagespeed.ic.0k11mZ1tMR.jpg', 289, 289, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(88, 5, 2, ' Chicha ODUMAN N3 ', ' Chicha en verre ODUMAN N3 en version Matt ou Clear avec système LED, tuyau silicone et métal, 24cm', '-chicha-oduman-n3-', 'https://www.el-badia.com/2385-home_default/xchicha-oduman-n3.jpg.pagespeed.ic.keORVamIPN.jpg', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(89, 5, 2, ' Chicha FUMO F4 ICE ', ' Chicha FUMO F4 ® ICE en verre de laboratoire borosilicate avec tuyau à embout en verre, 48cm', '-chicha-fumo-f4-ice-', 'https://www.el-badia.com/3875-home_default/xchicha-fumo-f4-ice.jpg.pagespeed.ic.NXM3Qsz-HN.jpg', 309, 309, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(90, 5, 2, ' Chicha FUMO MINI TANK ICE ', ' Chicha FUMO MINI TANK ® ICE en verre de laboratoire avec tuyau à embout en verre, H=17cm, L=21cm', '-chicha-fumo-mini-tank-ice-', 'https://www.el-badia.com/11156-home_default/xchicha-fumo-mini-tank-ice.jpg.pagespeed.ic.gX9p_37HTL.png', 289, 289, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(91, 5, 2, ' Chicha CELESTE GLASS SILVER ', ' Chicha en verre de laboratoire CELESTE GLASS version Silver, 39cm, avec système de LED', '-chicha-celeste-glass-silver-', 'https://www.el-badia.com/3256-home_default/xchicha-celeste-glass-silver.jpg.pagespeed.ic.LAm5IMdZyr.jpg', 111, 111, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(92, 5, 2, ' Chicha ODUMAN N5 ', ' Chicha en verre ODUMAN N5&nbsp;en version Clear et matt avec socle métal, système LED, tuyau silicone', '-chicha-oduman-n5-', 'https://www.el-badia.com/2803-home_default/xchicha-oduman-n5.jpg.pagespeed.ic.u9byKt4Q_w.jpg', 179, 179, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(93, 5, 2, ' Chicha FUMO JAR ', ' Chicha FUMO JAR ® en verre de laboratoire borosilicate avec tuyau à embout en verre, 37cm.', '-chicha-fumo-jar-', 'https://www.el-badia.com/3860-home_default/xchicha-fumo-jar-.jpg.pagespeed.ic.Z0Okbe8XO_.jpg', 289, 289, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(94, 5, 2, ' Chicha DSCHINNI AQUA ', ' La chicha DSCHINNI AQUA, 83cm en verre de laboratoire : socle en verre,&nbsp;VENDU SANS TUYAUX', '-chicha-dschinni-aqua-', 'https://www.el-badia.com/3181-home_default/xchicha-dschinni-aqua.jpg.pagespeed.ic.F2KhYWP61A.jpg', 399, 399, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(95, 5, 2, ' Chicha ODUMAN N2 ', ' Chicha en verre ODUMAN N2 en version Matt ou Clear avec système LED, tuyau silicone et metal, 28cm', '-chicha-oduman-n2-', 'https://www.el-badia.com/2375-home_default/xchicha-oduman-n2.jpg.pagespeed.ic.cSK0x9Ofs4.jpg', 129, 129, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(96, 5, 2, ' Chicha Ms Optimus ', ' Chicha MS OPTIMUS&nbsp;en verre de laboratoire, 30cm, avec socle, tuyau silicone&nbsp;', '-chicha-ms-optimus-', 'https://www.el-badia.com/5426-home_default/xchicha-ms-optimus.jpg.pagespeed.ic.Wu24boFzwr.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(97, 5, 2, ' Chicha TROPHY ', ' Chicha TROPHY en verre de laboratoire, 70cm, tuyau silicone et foyer verre fournis', '-chicha-trophy-', 'https://www.el-badia.com/3288-home_default/xchicha-trophy.jpg.pagespeed.ic.SO1f4BUuJS.jpg', 199, 199, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(98, 5, 2, ' Chicha FUMO POD ', ' Chicha FUMO POD ® en verre de laboratoire borosilicate avec tuyau à embout en verre, 49cm', '-chicha-fumo-pod-', 'https://www.el-badia.com/3866-home_default/xchicha-fumo-pod-.jpg.pagespeed.ic.o3nUV-Q7Cc.jpg', 359, 359, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(99, 5, 2, ' Chicha ODUMAN N4 ', ' Chicha en verre ODUMAN N4 en version Clear avec système LED, tuyau silicone et métal, 28cm', '-chicha-oduman-n4-', 'https://www.el-badia.com/2514-home_default/xchicha-oduman-n4.jpg.pagespeed.ic.VfO2kfieQR.jpg', 139, 139, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(100, 5, 2, ' Chicha FUMO POD ICE ', ' Chicha FUMO POD ® ICE en verre de laboratoire borosilicate avec tuyau à embout en verre, 49cm', '-chicha-fumo-pod-ice-', 'https://www.el-badia.com/3867-home_default/xchicha-fumo-pod-ice.jpg.pagespeed.ic.yMrPP9A_Xp.jpg', 379, 379, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(101, 5, 2, ' Chicha DSCHINNI BLACK WIDOW ', ' La chicha DSCHINNI BLACK WIDOW en verre de laboratoire avec trépied', '-chicha-dschinni-black-widow-', 'https://www.el-badia.com/4270-home_default/xchicha-dschinni-black-widow.jpg.pagespeed.ic.9TKZNuQXLw.jpg', 399, 399, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(102, 5, 2, ' Chicha FUMO POD XL ', ' La chicha FUMO POD XL ® en verre de laboratoire borosilicate avec tuyau à embout en verre, 80cm', '-chicha-fumo-pod-xl-', 'https://www.el-badia.com/3868-home_default/xchicha-fumo-pod-xl.jpg.pagespeed.ic.QrryOA6ETg.jpg', 389, 389, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(103, 5, 2, ' Chicha FUMO POD XL ICE ', ' La chicha FUMO POD XL ® ICE en verre de laboratoire borosilicate avec tuyau à embout en verre, 80cm', '-chicha-fumo-pod-xl-ice-', 'https://www.el-badia.com/3869-home_default/xchicha-fumo-pod-xl-ice.jpg.pagespeed.ic.qwBqAN1nkb.jpg', 409, 409, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(104, 5, 2, ' Chicha DSCHINNI TRIPOD ', ' La chicha DSCHINNI TRIPOD en&nbsp;verre de laboratoire avec trépied métal', '-chicha-dschinni-tripod-', 'https://www.el-badia.com/4150-home_default/xchicha-dschinni-tripod.jpg.pagespeed.ic.TVtmAYEK2D.jpg', 399, 399, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(105, 5, 2, ' Chicha GLOSSY GOLD ® ', ' Chicha&nbsp;GLOSSY Gold&nbsp;® en verre de laboratoire, 30cm, foyer verre, diffuseur intégré, tuyau silicone', '-chicha-glossy-gold-', 'https://www.el-badia.com/3254-home_default/xchicha-glossy-gold.jpg.pagespeed.ic.1oKGL7SUME.jpg', 109, 109, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(106, 5, 2, ' Chicha HEAVEN by SD HOOKAH ', ' Chicha en verre de laboratoire SD HOOKAH by SHAPES DESIGN, système LED tactile, 74cm', '-chicha-heaven-by-sd-hookah-', 'https://www.el-badia.com/1669-home_default/xchicha-heaven-by-sd-hookah.jpg.pagespeed.ic.NKf9od2NXb.jpg', 349, 349, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(107, 5, 3, ' STEAMULATION PRO X II ', ' Chicha STEAMULATION CLASSIC PRO X II, en acier inoxydable, vase en cristal, 52cm, Click 360°,&nbsp;ultra réglable', '-steamulation-pro-x-ii-', 'https://www.el-badia.com/10551-home_default/xsteamulation-pro-x-ii.jpg.pagespeed.ic.l8cDYvoB_D.jpg', 379, 379, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(108, 5, 3, ' STEAMULATION PRIME ', ' Chicha STEAMULATION PRIME, 45cm, système rotatif SteamClick 360° vase cristal', '-steamulation-prime-', 'https://www.el-badia.com/4482-home_default/xsteamulation-prime.jpg.pagespeed.ic.0zzAznr83b.jpg', 239, 239, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(109, 5, 3, ' STEAMULATION PRIME PRO X ', ' Chicha STEAMULATION PRIME PRO X, 47cm, en inox, système rotatif SteamClick 360°, diffuseur réglable, contrôle de purge et de flux dair, vase cristal', '-steamulation-prime-pro-x-', 'https://www.el-badia.com/9482-home_default/xsteamulation-prime-pro-x.jpg.pagespeed.ic.GPsHKiJPxX.jpg', 279, 279, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(110, 5, 3, ' STEAMULATION CLASSIC PRO X ', ' Chicha STEAMULATION CLASSIC PRO X, en acier inoxydable, vase en cristal, 52cm, système Click 360°,&nbsp;plongeur réglable, débit dair réglable', '-steamulation-classic-pro-x-', 'https://www.el-badia.com/7798-home_default/xsteamulation-classic-pro-x.jpg.pagespeed.ic.HnKJZ4fwOZ.jpg', 379, 379, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(111, 5, 3, ' Chicha MS SCANDI 2.0 ', ' Chicha en verre MS SCANDI 2.0, haute de 25 cm, vase en verre&nbsp;suspendu&nbsp;sur un socle en bois.', '-chicha-ms-scandi-2-0-', 'https://www.el-badia.com/9776-home_default/xchicha-ms-scandi-20.jpg.pagespeed.ic.oyURP5KGGB.jpg', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(112, 5, 3, ' Chicha ORDEN TESLA ', ' Chicha ORDEN TESLA, 56cm, fabriquée en Russie, acier inoxydable avec insert en bois. Tuyau silicone, manche inox, diffuseur amovible et purge dissimulée.', '-chicha-orden-tesla-', 'https://www.el-badia.com/9362-home_default/xchicha-orden-tesla.jpg.pagespeed.ic.BN_I0zsFrM.jpg', 199, 199, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(113, 5, 3, ' Chicha Centor ', ' Chicha CENTOR, 71cm acier inoxydable, système click, fourni sans tuyau et foyer', '-chicha-centor-', 'https://www.el-badia.com/4904-home_default/xchicha-centor.jpg.pagespeed.ic.sZVRJifC1a.jpg', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(114, 5, 3, ' Chicha PRISMA ONE ', ' Chicha STEAMULATION PRISMA ONE, 51cm de hauteur, entièrement en acier inoxydable, vase en clear', '-chicha-prisma-one-', 'https://www.el-badia.com/7752-home_default/xchicha-prisma-one.jpg.pagespeed.ic.qYlDTDWCk9.jpg', 179, 179, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(115, 5, 3, ' STEAMULATION PRIME PRO X CRYSTAL ', ' Chicha STEAMULATION PRIME PRO X CRYSTAL, 47cm, en inox, système rotatif SteamClick 360°, diffuseur réglable, contrôle de purge et de flux dair, vase cristal ciselé', '-steamulation-prime-pro-x-crystal-', 'https://www.el-badia.com/9481-home_default/xsteamulation-prime-pro-x-cryst.jpg.pagespeed.ic.enVVNCnkcV.jpg', 299, 299, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(116, 5, 3, ' Chicha MOZE DASH BLACK COLOR ', ' Chicha MOZE DASH BLACK COLOR, 50cm, en acier inoxydable et résine avec purge centrale qui renvoi la fumée vers le haut de la colonne', '-chicha-moze-dash-black-color-', 'https://www.el-badia.com/9276-home_default/xchicha-moze-dash-black-color.jpg.pagespeed.ic.kQaFkpM4N8.jpg', 159, 159, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(117, 5, 3, ' Steamulation PRO X II CRYSTAL ', ' Chicha STEAMULATION CLASSIC PRO X II CRYSTAL, en acier inoxydable, vase en cristal ciselé, 52cm, Click 360°,&nbsp;ultra réglable', '-steamulation-pro-x-ii-crystal-', 'https://www.el-badia.com/10562-home_default/xsteamulation-pro-x-2-crystal.jpg.pagespeed.ic.Qc8qtm21BM.jpg', 399, 399, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(118, 5, 3, ' Chicha STARBUZZ CARBINE HOOKAH ', ' Chicha STARBUZZ CARBINE HOOKAH, 65cm, trépied télescopique, rotation 360°, système LED', '-chicha-starbuzz-carbine-hookah-', 'https://www.el-badia.com/5201-home_default/xchicha-starbuzz-carbine-hookah.jpg.pagespeed.ic._MRlenYWbT.jpg', 269, 269, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(119, 5, 3, ' Chicha WOOKAH OAK CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni', '-chicha-wookah-oak-crystal-click-', 'https://www.el-badia.com/6474-home_default/xwookah-oak-crystal-click.jpg.pagespeed.ic.2ZSqaIgX1_.jpg', 279, 279, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(120, 5, 3, ' Chicha NA GRANI STICK ', ' CHICHA NA GRANI STICK, 50cm, en acier inoxydable, fabriquée en Russie', '-chicha-na-grani-stick-', 'https://www.el-badia.com/10339-home_default/xchicha-na-grani-stick.jpg.pagespeed.ic.8VdE3-E0L7.png', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(121, 5, 3, ' Chicha Fumo MINI JAR MALLETTE ', ' Chicha FUMO MINI JAR&nbsp;® en verre de laboratoire complète avec mallette, H=26cm, L=10cm', '-chicha-fumo-mini-jar-mallette-', 'https://www.el-badia.com/11040-home_default/xchicha-fumo-mini-jar-mallette.jpg.pagespeed.ic.7rsJtW3Wsk.jpg', 245, 245, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(122, 5, 3, ' Chicha WOOKAH IROKO CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni.', '-chicha-wookah-iroko-crystal-click-', 'https://www.el-badia.com/6489-home_default/xwookah-iroko-crystal-click.jpg.pagespeed.ic.0gOFOAjPj7.jpg', 294, 294, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(123, 5, 3, ' Chicha WOOKAH MERBAU CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni.', '-chicha-wookah-merbau-crystal-click-', 'https://www.el-badia.com/6494-home_default/xwookah-merbau-crystal-click.jpg.pagespeed.ic.vFekgI3i7r.jpg', 294, 294, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(124, 5, 3, ' Chicha WOOKAH ARCTIC BLUE CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal de haute qualité, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-arctic-blue-click-', 'https://www.el-badia.com/6488-home_default/xwookah-arctic-blue-click.jpg.pagespeed.ic.gX4NKFltqf.jpg', 299, 299, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(125, 5, 3, ' Chicha HOOKY STEEL ', ' Chicha HOOKY STEEL, 52cm, en acier inoxydable V2A (vase et corps), récupérateur de mélasse intégré, diffuseur, tuyau silicone souple et manche fournis', '-chicha-hooky-steel-', 'https://www.el-badia.com/10585-home_default/xchicha-hooky-steel.jpg.pagespeed.ic.HmOfVefDXS.png', 250, 250, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(126, 5, 3, ' Chicha CARTEL PABLO ', ' Chicha CARTEL PABLO, 50cm, en acier inoxydable, système click, cut 18/8, colonie interchangeable, diffuseur réglable, purge 360°', '-chicha-cartel-pablo-', 'https://www.el-badia.com/6969-home_default/xchicha-cartel-pablo.jpg.pagespeed.ic._4zGNZkjQV.jpg', 169, 169, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(127, 5, 3, ' STEAMULATION CLASSIC PLATINIUM ', ' Chicha STEAMULATION CLASSIC PLATINIUM, en cristal et acier inoxydable avec système de rotation 360°', '-steamulation-classic-platinium-', 'https://www.el-badia.com/5042-home_default/xsteamulation-classic-platinum.jpg.pagespeed.ic.Vu-a5TiJT2.jpg', 299, 299, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(128, 5, 3, ' Chicha RETROFIT OPTIMA BLACK ', ' Chicha RETROFIT OPTIMA BLACK, marque russe, 60 cm, acier inoxydable 304 et polyacétal (POM), mécanisme de réglage du diffuseur, tuyau silicone et manche inoxydable inclus', '-chicha-retrofit-optima-black-', 'https://www.el-badia.com/10496-home_default/xchicha-retrofit-optima-black.jpg.pagespeed.ic.G7uKPjDapP.jpg', 239, 239, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(129, 5, 3, ' Chicha MAKLAUD HERO X GAZZIK ', ' Chicha MAKLAUD HERO X GAZZIK, 70cm, fabriquée en Russie, en acier inoxydable AISI 304 et insert en laiton', '-chicha-maklaud-hero-x-gazzik-', 'https://www.el-badia.com/11003-home_default/xmaklaud-hero-x-gazzik.jpg.pagespeed.ic.0qjwIXqgJn.png', 299, 299, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(130, 5, 3, ' Chicha MIG AIR FORCE L DELUXE CLASSIC ', ' Chicha MIG AIR FORCE L DELUXE CLASSIC, 52cm, en acier inoxydable et verre de Bohême, de la marque allemande MIG', '-chicha-mig-air-force-l-deluxe-classic-', 'https://www.el-badia.com/9020-home_default/xmig-air-force-l-deluxe-classic.jpg.pagespeed.ic.dySYllPgxh.png', 279, 279, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(131, 5, 3, ' Chicha WOOKAH NOX WHITE CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal de haute qualité, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-nox-white-click-', 'https://www.el-badia.com/6487-home_default/xwookah-nox-white-click.jpg.pagespeed.ic.m6gcx0zyo9.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(132, 5, 3, ' Chicha CARTEL FAME ', ' Chicha CARTEL FAME, 53cm, en acier inoxydable, système de filetage, diffuseur réglable, purge 360°', '-chicha-cartel-fame-', 'https://www.el-badia.com/10113-home_default/xchicha-cartel-fame.jpg.pagespeed.ic.DMkudV8w4i.jpg', 219, 219, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(133, 5, 3, ' Chicha CARTEL PABLO GOLD ', ' Chicha CARTEL PABLO GOLD, 50cm, en acier inoxydable, système click, cut 18/8, colonie interchangeable, diffuseur réglable, purge 360°', '-chicha-cartel-pablo-gold-', 'https://www.el-badia.com/11021-home_default/xchicha-cartel-pablo-gold.jpg.pagespeed.ic.WCpyASG9ao.png', 179, 179, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(134, 5, 3, ' Chicha WOOKAH WENGE CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-wenge-crystal-click-', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(135, 5, 3, ' Chicha EMBERY MONO EVO ', ' Chicha EMBERY MONO EVO, 61 cm, acier inoxydable & POM, tuyau silicone', '-chicha-embery-mono-evo-', 'https://www.el-badia.com/7864-home_default/xchicha-embery-mono-evo.jpg.pagespeed.ic.IdvNqE2jFD.jpg', 199, 199, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(136, 5, 3, ' Chicha MIG MINIME X-Series ', ' CHICHA MIG&nbsp;MINIME X-SERIES,&nbsp;45cm, en acier inoxydable de la marque allemande MIG', '-chicha-mig-minime-x-series-', 'https://www.el-badia.com/6244-home_default/xchicha-mig-minime-x-series.jpg.pagespeed.ic._XP1M9T8le.png', 269, 269, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(137, 5, 3, ' Chicha KORESS HOOKAH ', ' Chicha KORESS HOOKAH, 52cm, acier inoxydable et polyoxyméthylène, diffuseur avec régulateur sur le corps, tuyau silicone et manche métal fournis', '-chicha-koress-hookah-', 'https://www.el-badia.com/9717-home_default/xchicha-koress-hookah.jpg.pagespeed.ic.qNPLVjjnqJ.jpg', 259, 259, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(138, 5, 3, ' Chicha FUMO MINI JAR ', ' Chicha FUMO MINI JAR&nbsp;® en verre de laboratoire complète, H=26cm, L=10cm', '-chicha-fumo-mini-jar-', 'https://www.el-badia.com/11155-home_default/xchicha-fumo-mini-jar.jpg.pagespeed.ic.kEaGNuS2ZQ.jpg', 215, 215, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(139, 5, 3, ' Chicha WOOKAH WALNUT CRYSTAL CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni.', '-chicha-wookah-walnut-crystal-click-', 'https://www.el-badia.com/6503-home_default/xwookah-walnut-crystal-click.jpg.pagespeed.ic.AETXrP11ZL.jpg', 314, 314, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(140, 5, 3, ' Chicha MIG AIR FORCE S TRIANGLE CLASSIC ', ' Chicha MIG AIR FORCE S&nbsp;TRIANGLE CLASSIC, 33cm, en acier inoxydable et verre de Bohême, de la marque allemande MIG', '-chicha-mig-air-force-s-triangle-classic-', 'https://www.el-badia.com/9018-home_default/xmig-air-force-s-triangle-classic.jpg.pagespeed.ic.Ay7ARiy_yq.png', 229, 229, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(141, 5, 3, ' Chicha MAKLAUD DZEN SKULL ', ' Chicha Maklaud Dzen F/Skull K, en acier inoxydable et polyacétal, haute de 55 cm.', '-chicha-maklaud-dzen-skull-', 'https://www.el-badia.com/10598-home_default/xchicha-maklaud-dzen-skull.jpg.pagespeed.ic.-x_oc_aFGO.jpg', 239, 239, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(142, 5, 3, ' Chicha EMBERY MONO WAVE ', ' Chicha EMBERY MONO WAVE, 61 cm, inox & aluminium anodisé, tuyau silicone', '-chicha-embery-mono-wave-', 'https://www.el-badia.com/6746-home_default/xchicha-embery-mono-wave.jpg.pagespeed.ic.a8XohBrlia.jpg', 199, 199, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(143, 5, 3, ' Chicha CAPSULE ONE ', ' Chicha CAPSULE ONE, fabriqué en Russie, 52cm, en acier inoxydable, fourni avec tuyau silicone et manche en métal', '-chicha-capsule-one-', 'https://www.el-badia.com/10332-home_default/xchicha-capsule-one.jpg.pagespeed.ic.wzZ7XF0vqK.png', 289, 289, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(144, 5, 3, ' Chicha RETROFIT AMALGAM ', ' Chicha RETROFIT AMALGAM, marque russe, 60 cm, acier inoxydable 304, mécanisme de réglage du diffuseur, tuyau silicone et manche inoxydable inclus', '-chicha-retrofit-amalgam-', 'https://www.el-badia.com/10500-home_default/xchicha-retrofit-amalgam.jpg.pagespeed.ic.bewjpHrFTG.jpg', 269, 269, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(145, 5, 3, ' Chicha WOOKAH NOX CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal&nbsp;sans motifs, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-nox-click-', 'https://www.el-badia.com/10785-home_default/xwookah-nox-click.jpg.pagespeed.ic.ZAxGqn3BRj.jpg', 334, 334, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(146, 5, 3, ' Chicha MAKLAUD RUSSIAN SPIRIT Aluminium ', ' Chicha Maklaud Lady, en aluminium, haute de 75 cm, fourni avec manche et tuyau.', '-chicha-maklaud-russian-spirit-aluminium-', 'https://www.el-badia.com/10690-home_default/xchicha-maklaud-russian-spirit.jpg.pagespeed.ic.c9kuiGagUp.jpg', 235, 235, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(147, 5, 3, ' Chicha MAKLAUD SKULL ALUMLINIUM ', ' Chicha Maklaud Skull, en aluminium, haute de 70 cm, fourni avec manche et tuyau.', '-chicha-maklaud-skull-alumlinium-', 'https://www.el-badia.com/10691-home_default/xchicha-maklaud-skull.jpg.pagespeed.ic.yNPW9mr4so.jpg', 199, 199, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(148, 5, 3, ' Chicha WOOKAH GROM CLICK ', ' Chicha en bois noble WOOKAH, vase en cristal de haute qualité, haute de 64cm. Fourni sans tuyau et sans foyer.', '-chicha-wookah-grom-click-', 'https://www.el-badia.com/6484-home_default/xwookah-grom-click.jpg.pagespeed.ic._t0ztlpbC3.jpg', 384, 384, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(149, 5, 3, ' Chicha MEXANIKA SMOKE MS ', ' Chicha russe Mexanika Smoke MS, 65cm, entièrement en acier inoxydable.', '-chicha-mexanika-smoke-ms-', 'https://www.el-badia.com/6654-home_default/xchicha-mexanika-smoke-ms.jpg.pagespeed.ic.HpJE-MOfQa.jpg', 195, 195, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(150, 5, 3, ' Chicha MIG AIR FORCE S DELUXE CLASSIC ', ' Chicha&nbsp;MIG AIR FORCE S DELUXE CLASSIC, 33cm, en acier inoxydable et verre de Bohême,&nbsp;de la marque allemande MIG', '-chicha-mig-air-force-s-deluxe-classic-', 'https://www.el-badia.com/9029-home_default/xmig-air-force-s-deluxe-classic.jpg.pagespeed.ic._2K0mov3As.jpg', 219, 219, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(151, 5, 3, ' Chicha EMBERY MONO-H ', ' Chicha EMBERY MONO-H, 61 cm, inox & aluminium anodisé, tuyau silicone', '-chicha-embery-mono-h-', 'https://www.el-badia.com/5636-home_default/xchicha-embery-mono-h.jpg.pagespeed.ic.0dtkxHroNQ.jpg', 199, 199, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(152, 5, 3, ' Chicha MIG X EL-BADIA ', ' La chicha MIG X EL-BADIA est une chicha compacte de la marque allemande MIG en collaboration avec EL-BADIA, 32cm', '-chicha-mig-x-el-badia-', 'https://www.el-badia.com/9767-home_default/xchicha-mig-x-el-badia.jpg.pagespeed.ic.SK3UfjmSCf.png', 229, 229, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(153, 5, 3, ' Chicha DSCHINNI AZTEC ', ' Chicha DSCHINNI AZTEC, 65cm, vase en cristal et corps en acier inoxydable V4A (316L), complet avec tuyau silicone, foyer verre Nero, grille de chauffe Volkan', '-chicha-dschinni-aztec-', 'https://www.el-badia.com/10359-home_default/xchicha-dschinni-aztec.jpg.pagespeed.ic.KEu4eZ9TIj.jpg', 259, 259, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(154, 5, 3, ' Chicha EMBERY MONO WOOD ', ' Chicha EMBERY MONO WOOD, 61 cm, inox & bois, tuyau silicone', '-chicha-embery-mono-wood-', 'https://www.el-badia.com/8202-home_default/xchicha-embery-mono-wood.jpg.pagespeed.ic.kEz_bfxY5E.jpg', 179, 179, 0, 0, 1, 0, '', '', '', NULL, 0, 0);
INSERT INTO `product` (`id`, `category_id`, `sous_category_id`, `nom`, `content`, `slug`, `image`, `price`, `price_ht`, `promotion`, `nouveaute`, `color_id`, `taille`, `vase`, `tuyau`, `fixation`, `autre`, `publie`, `is_best`) VALUES
(155, 5, 3, ' Chicha MAKLAUD DZEN BUDDAH ', ' Chicha Maklaud Dzen F/Buddha, en acier inoxydable et polyacétal, haute de 55 cm.', '-chicha-maklaud-dzen-buddah-', 'https://www.el-badia.com/10594-home_default/xchicha-maklaud-dzen-buddah.jpg.pagespeed.ic.ebuAcTDyaX.jpg', 239, 239, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(156, 5, 3, ' Chicha Fumo MINI TANK MALLETTE ', ' Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', '-chicha-fumo-mini-tank-mallette-', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(157, 5, 3, ' Chicha Fumo MINI TANK MALLETTE ', ' Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', '-chicha-fumo-mini-tank-mallette-', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(158, 5, 3, ' Chicha Fumo MINI TANK MALLETTE ', ' Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', '-chicha-fumo-mini-tank-mallette-', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(159, 5, 3, ' Chicha Fumo MINI TANK MALLETTE ', ' Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', '-chicha-fumo-mini-tank-mallette-', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(160, 5, 3, ' Chicha Fumo MINI TANK MALLETTE ', ' Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', '-chicha-fumo-mini-tank-mallette-', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(161, 5, 3, ' Chicha Fumo MINI TANK MALLETTE ', ' Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', '-chicha-fumo-mini-tank-mallette-', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(162, 5, 3, ' Chicha Fumo MINI TANK MALLETTE ', ' Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', '-chicha-fumo-mini-tank-mallette-', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(163, 5, 3, ' Chicha Fumo MINI TANK MALLETTE ', ' Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', '-chicha-fumo-mini-tank-mallette-', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(164, 5, 4, ' Chicha EL-BADIA C5 ', ' Chicha EL-BADIA C5, 43cm, vase en verre CLICK, CUT de colonne 18/8 fourni avec tuyau silicone, manche métallique et foyer avec système de chauffe type cheminée.', '-chicha-el-badia-c5-', 'https://www.el-badia.com/9179-home_default/xchicha-el-badia-c5.jpg.pagespeed.ic.rjyJKOJ2fs.jpg', 79, 79, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(165, 5, 4, ' Chicha CELESTE X3 CLICK ', ' Chicha CELESTE X3, 36cm, avec vase en verre et fixation CLICK', '-chicha-celeste-x3-click-', 'https://www.el-badia.com/10257-home_default/xchicha-celeste-x3-click.jpg.pagespeed.ic.l-KbJPtdUD.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(166, 5, 4, ' Chicha EL-BADIA XS ', ' Chicha EL-BADIA XS, 21cm, compacte et nomade, vase en verre, foyer et tuyaux fournis', '-chicha-el-badia-xs-', 'https://www.el-badia.com/9063-home_default/xchicha-el-badia-xs.jpg.pagespeed.ic.gqQSy_dym8.jpg', 29, 29, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(167, 5, 4, ' Chicha EL-BADIA C1 ', ' Chicha EL-BADIA C1, haute de 31cm, cette chicha chamboule les codes avec un tout nouveau vase en verre doté dun système click.', '-chicha-el-badia-c1-', 'https://www.el-badia.com/9076-home_default/xchicha-el-badia-c1.jpg.pagespeed.ic.L-l4b68jQc.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(168, 5, 4, ' Chicha EL-BADIA C7 ', ' Chicha EL-BADIA C7, 56 cm, vase en verre CLICK, CUT de colonne 18/8, tuyau silicone et foyer avec système de chauffe type cheminée', '-chicha-el-badia-c7-', 'https://www.el-badia.com/9192-home_default/xchicha-el-badia-c7.jpg.pagespeed.ic.6BxrkPFrie.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(169, 5, 4, ' Chicha CELESTE JUNIOR 2.0 ', ' La chicha CELESTE JUNIOR 2.0, la référence du narguilé EL-BADIA, fourni avec tuyau, foyer en céramique, une brosse dentretien et une pince.', '-chicha-celeste-junior-2-0-', 'https://www.el-badia.com/9080-home_default/xchicha-celeste-junior-20.jpg.pagespeed.ic.CzkTIrQYRL.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(170, 5, 4, ' Chicha CELESTE JUNIOR 2.0 CAMO ', ' Chicha CELESTE JUNIOR 2.0 CAMO, cm37, vase acry, couleurs camouflage', '-chicha-celeste-junior-2-0-camo-', 'https://www.el-badia.com/9130-home_default/xchicha-celeste-junior-20-camo.jpg.pagespeed.ic.AhDpu_gDpv.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(171, 5, 4, ' Chicha CELESTE X1 ', ' La chicha X1 de la gamme la plus célèbre de chicha, CELESTE, compacte de 25cm, tuyau et foyer inclus', '-chicha-celeste-x1-', 'https://www.el-badia.com/9138-home_default/xchicha-celeste-x1.jpg.pagespeed.ic.YaHNIIvAOD.jpg', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(172, 5, 4, ' Chicha CELESTE CRAZY ', ' Chicha CELESTE X3, 36cm, avec vase en verre et fixation CLICK et coloris type graffiti', '-chicha-celeste-crazy-', 'https://www.el-badia.com/9198-home_default/xchicha-celeste-crazy.jpg.pagespeed.ic.s5tvpl52F0.jpg', 69, 69, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(173, 5, 4, ' Chicha EL-BADIA P1 ', ' Chicha EL-BADAI P1, chicha transportable avec tuyau&nbsp;en silicone et foyer à double capacité&nbsp;', '-chicha-el-badia-p1-', 'https://www.el-badia.com/7012-home_default/xchicha-el-badia-p1.jpg.pagespeed.ic.OH_zNsAgsv.png', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(174, 5, 4, ' Chicha Celeste X3 ', ' Issue de la gamme de chicha CELESTE, voici la EL-BADIA CELESTE X3,', '-chicha-celeste-x3-', 'https://www.el-badia.com/9099-home_default/xchicha-celeste-x3.jpg.pagespeed.ic.PJFmhWQp8W.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(175, 5, 4, ' Chicha CELESTE X1 EDITION SPECIALE ', ' Chicha CELESTE X1&nbsp;édition spéciale', '-chicha-celeste-x1-edition-speciale-', 'https://www.el-badia.com/9174-home_default/xchicha-celeste-x1-edition-speciale.jpg.pagespeed.ic.qzwoVtxn1O.jpg', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(176, 5, 4, ' Chicha CELESTE X3 EDITION SPECIALE ', ' Chicha CELESTE X3 édition spéciale: Woodland Army, Lava et Black Marble', '-chicha-celeste-x3-edition-speciale-', 'https://www.el-badia.com/9153-home_default/xchicha-celeste-x3-edition-spe.jpg.pagespeed.ic.jUuyt8O9pr.jpg', 49, 49, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(177, 5, 4, ' Chicha MVP 360 ', ' Chicha MVP 360 en acier inoxydable, complète avec tuyau silicone et foyer', '-chicha-mvp-360-', 'https://www.el-badia.com/7713-home_default/xchicha-mvp-360.jpg.pagespeed.ic.xCzVxtvPZk.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(178, 5, 4, ' Chicha CARTEL HAVANA S ', ' Chicha CARTEL HAVANA S, 35cm, foyer STARK, tuyau et manche silicone, diffuseur, purge dissimulée et plateau ciselé WOLF', '-chicha-cartel-havana-s-', 'https://www.el-badia.com/10996-home_default/xchicha-cartel-havana-s.jpg.pagespeed.ic.ZQeUrJAGph.png', 69, 69, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(179, 5, 4, ' Chicha MVP 360 GOLD EDITION ', ' Chicha MVP 360 GOLD EDITION en acier inoxydable, complète avec tuyau silicone et foyer', '-chicha-mvp-360-gold-edition-', 'https://www.el-badia.com/10248-home_default/xchicha-mvp-360-gold-edition.jpg.pagespeed.ic.YuJihwrap6.png', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(180, 5, 4, ' Chicha MS MICRO ', ' Chicha MS MICRO en acrylique et aluminium, tuyau silicone et manche fournis', '-chicha-ms-micro-', 'https://www.el-badia.com/4430-home_default/xchicha-ms-micro.jpg.pagespeed.ic.azOigeEfeN.jpg', 120, 120, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(181, 5, 4, ' Scorpio Stinger Carbon ', ' Chicha SCORPIO&nbsp;CARBON, 38 cm, colonne en finition carbone, tuyau et foyer silicone fournis', '-scorpio-stinger-carbon-', 'https://www.el-badia.com/5437-home_default/xscorpio-stinger-carbon.jpg.pagespeed.ic.7aP1CpgN_A.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(182, 5, 4, ' Chicha Oduman Micro ', ' Chicha ODUMAN MICRO, 17cm avec sacoche de transport , tuyau silicone, ressort et diffuseur', '-chicha-oduman-micro-', 'https://www.el-badia.com/10814-home_default/xchicha-oduman-micro.jpg.pagespeed.ic.OgD36ePSrG.png', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(183, 5, 4, ' Chicha MS TOKYO 2.0 ', ' Chicha MS TOKYO 2.0, 30cm, fournie avec sacoche de transport, tuyau silicone et manche en alu, foyer silicone.', '-chicha-ms-tokyo-2-0-', 'https://www.el-badia.com/9009-home_default/xchicha-ms-tokyo-20.jpg.pagespeed.ic.43xCO8GUHJ.jpg', 69, 69, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(184, 5, 4, ' Chicha MS VENOM Camo ', ' Chicha MS VENOM CAMO, 60cm, montée sur pieds, avec tuyau silicone, manche et foyer en silicone.', '-chicha-ms-venom-camo-', 'https://www.el-badia.com/6724-home_default/xchicha-ms-venom-camo.jpg.pagespeed.ic.YW3s7aaywr.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(185, 5, 4, ' Chicha MVP 360 EPOX ', ' Chicha MVP 360 EPOXY en acier inoxydable, complète avec tuyau silicone et foyer', '-chicha-mvp-360-epox-', 'https://www.el-badia.com/10787-home_default/xchicha-mvp-360-epox.jpg.pagespeed.ic._qwBsJdbVW.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(186, 5, 4, ' Chicha BRODATOR 320 MINI ', ' Chicha BRODATOR 320 MINI, 32cm en inox, sac de transport, tuyau silicone et foyer en terre cuite', '-chicha-brodator-320-mini-', 'https://www.el-badia.com/10068-home_default/xchicha-brodator-320-mini.jpg.pagespeed.ic.fhEjeNWsWi.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(187, 5, 4, ' Chicha ODUMAN N5-Z JUNIOR ', ' La chicha ODUMAN N5-Z JUNIOR est une chicha en verre suspendue sur un socle métallique, 24cm', '-chicha-oduman-n5-z-junior-', 'https://www.el-badia.com/3509-home_default/xchicha-oduman-n5-z-junior.jpg.pagespeed.ic.WF6ukoYRER.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(188, 5, 4, ' Chicha Oduman MONSTER ', ' Chicha ODUMAN MONSTER, 23 cm, fournie avec une sacoche, un tuyau silicone, manche en alu et ressort.', '-chicha-oduman-monster-', 'https://www.el-badia.com/6387-home_default/xchicha-oduman-monster.jpg.pagespeed.ic.ieCmcNW-Nr.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(189, 5, 4, ' Chicha MVP 500 ', ' Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', '-chicha-mvp-500-', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(190, 5, 4, ' Chicha MS TOKYO ', ' Chicha transportable MS TOKYO, pack complet, facilement transportable.', '-chicha-ms-tokyo-', 'https://www.el-badia.com/6661-home_default/xchicha-ms-tokyo.jpg.pagespeed.ic.YraCO6KsX5.jpg', 59, 59, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(191, 5, 4, ' Chicha MOZE BREEZE ', ' Chicha MOZE BREEZE, 40cm, en acier inoxydable et revêtement en bois et résine. Vendu dans un coffre en bois.', '-chicha-moze-breeze-', 'https://www.el-badia.com/6888-home_default/xchicha-moze-breeze.jpg.pagespeed.ic.LsJnYeVT8t.jpg', 139, 139, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(192, 5, 4, ' Chicha Centor ', ' Chicha CENTOR, 71cm acier inoxydable, système click, fourni sans tuyau et foyer', '-chicha-centor-', 'https://www.el-badia.com/4904-home_default/xchicha-centor.jpg.pagespeed.ic.sZVRJifC1a.jpg', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(193, 5, 4, ' Chicha PRISMA ONE ', ' Chicha STEAMULATION PRISMA ONE, 51cm de hauteur, entièrement en acier inoxydable, vase en clear', '-chicha-prisma-one-', 'https://www.el-badia.com/7752-home_default/xchicha-prisma-one.jpg.pagespeed.ic.qYlDTDWCk9.jpg', 179, 179, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(194, 5, 4, ' Chicha ODUMAN N9 SPIDER ', ' La chicha ODUMAN N9&nbsp;SPIDER est une chicha en verre suspendue sur un socle métallique, 25cm', '-chicha-oduman-n9-spider-', 'https://www.el-badia.com/10530-home_default/xchicha-oduman-n9-spider.jpg.pagespeed.ic.Q0INuZOE8b.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(195, 5, 4, ' Chicha ODUMAN N8 VOYAGE ', ' Chicha ODUMAN N8 VOYAGE en verre, compacte 20cm, avec sacoche de transport et tuyau silicone', '-chicha-oduman-n8-voyage-', 'https://www.el-badia.com/4070-home_default/xchicha-oduman-n8-voyage.jpg.pagespeed.ic.u-biqbP5mp.jpg', 89, 89, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(196, 5, 4, ' Chicha MS BEIRUT ', ' Chicha MS BEIRUT, 43cm, fournie avec tuyau en silicone manche carbone, foyer silicone, diffuseur intégré et soupape dissimulée', '-chicha-ms-beirut-', 'https://www.el-badia.com/9008-home_default/xchicha-ms-beirut.jpg.pagespeed.ic.kkQSBvQ0x-.jpg', 79, 79, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(197, 5, 4, ' Chicha ODUMAN GUSTO ', ' Chicha ODUMAN GUSTO, 37cm, acier inoxydable et verre, tuyau silicone et ressort fournis', '-chicha-oduman-gusto-', 'https://www.el-badia.com/4062-home_default/xchicha-oduman-gusto.jpg.pagespeed.ic.1cOdUb6ru6.jpg', 119, 119, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(198, 5, 4, ' Chicha MYA MELINA ', ' Chicha MYA MELINA, 46 cm, vase click, fournie avec&nbsp; foyer, tuyau silicone et manche en métal', '-chicha-mya-melina-', 'https://www.el-badia.com/4116-home_default/xchicha-mya-melina.jpg.pagespeed.ic.Wy6TYLumzf.jpg', 59, 59, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(199, 5, 4, ' Chicha ODUMAN N7 SMOKE TANK ', ' Chicha ODUMAN N7 SMOKE TANK avec sacoche et tuyau silicone, 21x19cm', '-chicha-oduman-n7-smoke-tank-', 'https://www.el-badia.com/3823-home_default/xchicha-oduman-n7-smoke-tank.jpg.pagespeed.ic.i-J8FJrerJ.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(200, 5, 4, ' Chicha MOZE DASH BLACK ', ' Chicha MOZE DASH BLACK, 50cm, en acier inoxydable et PMO avec purge centrale qui renvoi la fumée vers le haut de la colonne', '-chicha-moze-dash-black-', 'https://www.el-badia.com/9275-home_default/xchicha-moze-dash-black.jpg.pagespeed.ic.2oaM51ycL2.jpg', 149, 149, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(201, 5, 4, ' Chicha MOZE DASH WHITE COLOR ', ' Chicha MOZE DASH&nbsp;WHITE COLOR, 50cm, en acier inoxydable et résine avec purge centrale qui renvoi la fumée vers le haut de la colonne', '-chicha-moze-dash-white-color-', 'https://www.el-badia.com/9262-home_default/xchicha-moze-dash-white-color.jpg.pagespeed.ic.P82HC6zNzD.jpg', 159, 159, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(202, 5, 4, ' Chicha QT ', ' Lincontournable&nbsp;chicha QT de chez MYA, 32cm, fournit dans sa cage avec tuyau et foyer, la&nbsp;référence', '-chicha-qt-', 'https://www.el-badia.com/1886-home_default/xchicha-qt-.jpg.pagespeed.ic.XWRuYtASus.jpg', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(203, 5, 4, ' Chicha MS COSMOPOLITAN ', ' Chicha MS COSMOPOLITAN, 31 cm, avec manche en verre et tuyau silicone', '-chicha-ms-cosmopolitan-', 'https://www.el-badia.com/3497-home_default/xchicha-ms-cosmopolitan.jpg.pagespeed.ic.I2fVBaKITy.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(204, 5, 4, ' Chicha VENTO ', ' Chicha VENTO de chez MYA, 33cm, fournit dans sa cage avec tuyau et foyer, la&nbsp;référence qualité prix!', '-chicha-vento-', 'https://www.el-badia.com/1893-home_default/xchicha-vento.jpg.pagespeed.ic.v0m9CmR1qs.jpg', 45, 45, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(205, 5, 4, ' Chicha EMBERY MONO WAVE ', ' Chicha EMBERY MONO WAVE, 61 cm, inox & aluminium anodisé, tuyau silicone', '-chicha-embery-mono-wave-', 'https://www.el-badia.com/6746-home_default/xchicha-embery-mono-wave.jpg.pagespeed.ic.a8XohBrlia.jpg', 199, 199, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(206, 5, 4, ' KIT CHICHA ', ' Le KIT CHICHA pour bouteilles : permet de transformer vos bouteilles en verre en véritables chichas', '-kit-chicha-', 'https://www.el-badia.com/3696-home_default/xkit-chicha.jpg.pagespeed.ic.iwkD1ojyOh.jpg', 39, 39, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(207, 5, 4, ' Chicha MEXANIKA SMOKE MS ', ' Chicha russe Mexanika Smoke MS, 65cm, entièrement en acier inoxydable.', '-chicha-mexanika-smoke-ms-', 'https://www.el-badia.com/6654-home_default/xchicha-mexanika-smoke-ms.jpg.pagespeed.ic.HpJE-MOfQa.jpg', 195, 195, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(208, 5, 4, ' Chicha EMBERY MONO-H ', ' Chicha EMBERY MONO-H, 61 cm, inox & aluminium anodisé, tuyau silicone', '-chicha-embery-mono-h-', 'https://www.el-badia.com/5636-home_default/xchicha-embery-mono-h.jpg.pagespeed.ic.0dtkxHroNQ.jpg', 199, 199, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(209, 5, 4, ' Chicha ODUMAN N2 TRAVEL ', ' La chicha ODUMAN N2 TRAVEL en verre, compacte 18cm, avec sacoche de transport et tuyau silicone', '-chicha-oduman-n2-travel-', 'https://www.el-badia.com/10532-home_default/xchicha-oduman-n2-travel.jpg.pagespeed.ic.PttnNxpIWB.jpg', 79, 79, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(210, 5, 4, ' Chicha MS VENOM ', ' Chicha MS VENOM, 60cm, montée sur pieds, avec tuyau silicone, manche et foyer en silicone.', '-chicha-ms-venom-', 'https://www.el-badia.com/5424-home_default/xchicha-ms-venom.jpg.pagespeed.ic.oxV3mKauET.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(211, 5, 4, ' Chicha PRISMA ONE AQUA ', ' Chicha STEAMULATION PRISMA ONE, 51cm de hauteur, entièrement en acier inoxydable, vase en couleur Aqua', '-chicha-prisma-one-aqua-', 'https://www.el-badia.com/7753-home_default/xchicha-prisma-one-aqua.jpg.pagespeed.ic.8hXocFq4uq.jpg', 179, 179, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(212, 5, 4, ' Chicha Minotor ', ' Chicha MINOTOR, 49cm, acier inoxydable, système click, fourni sans tuyau et foyer', '-chicha-minotor-', 'https://www.el-badia.com/4911-home_default/xchicha-minotor.jpg.pagespeed.ic.fwczDGibiI.jpg', 99, 99, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(213, 5, 4, ' Chicha BAMBINO ', ' Chicha BAMBINO de marque MYA, 27cm, colonne ornée de motifs, avec malette de transport, tuyau, foyer', '-chicha-bambino-', 'https://www.el-badia.com/345-home_default/xchicha-bambino-.jpg.pagespeed.ic.gce-5D7XWo.jpg', 45, 45, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(214, 5, 4, ' Chicha BAMBINO ', ' Chicha BAMBINO de marque MYA, 27cm, colonne ornée de motifs, avec malette de transport, tuyau, foyer', '-chicha-bambino-', 'https://www.el-badia.com/345-home_default/xchicha-bambino-.jpg.pagespeed.ic.gce-5D7XWo.jpg', 45, 45, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(215, 5, 4, ' Chicha BAMBINO ', ' Chicha BAMBINO de marque MYA, 27cm, colonne ornée de motifs, avec malette de transport, tuyau, foyer', '-chicha-bambino-', 'https://www.el-badia.com/345-home_default/xchicha-bambino-.jpg.pagespeed.ic.gce-5D7XWo.jpg', 45, 45, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(216, 5, 4, ' Chicha BAMBINO ', ' Chicha BAMBINO de marque MYA, 27cm, colonne ornée de motifs, avec malette de transport, tuyau, foyer', '-chicha-bambino-', 'https://www.el-badia.com/345-home_default/xchicha-bambino-.jpg.pagespeed.ic.gce-5D7XWo.jpg', 45, 45, 0, 0, 1, 0, '', '', '', NULL, 0, 0),
(217, 5, 4, ' Chicha BAMBINO ', ' Chicha BAMBINO de marque MYA, 27cm, colonne ornée de motifs, avec malette de transport, tuyau, foyer', '-chicha-bambino-', 'https://www.el-badia.com/345-home_default/xchicha-bambino-.jpg.pagespeed.ic.gce-5D7XWo.jpg', 45, 45, 0, 0, 1, 0, '', '', '', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE IF NOT EXISTS `reset_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B9983CE5A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `reset_password`
--

INSERT INTO `reset_password` (`id`, `user_id`, `token`, `created_at`) VALUES
(1, 2, '6196fdfd2719f', '2021-11-19 01:29:33'),
(2, 2, '6196fe4f139ea', '2021-11-19 01:30:55'),
(3, 3, '6197032cc2f5c', '2021-11-19 01:51:40'),
(4, 2, '619950ba98ebb', '2021-11-20 19:47:06');

-- --------------------------------------------------------

--
-- Structure de la table `sous_category`
--

DROP TABLE IF EXISTS `sous_category`;
CREATE TABLE IF NOT EXISTS `sous_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E022D9412469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sous_category`
--

INSERT INTO `sous_category` (`id`, `category_id`, `nom`, `content`, `slug`) VALUES
(1, 5, 'Chicha classique', NULL, 'chicha-classique'),
(2, 5, 'Chicha en verre', NULL, 'chicha-en-verre'),
(3, 5, 'Chicha de luxe', NULL, 'chicha-de-luxe'),
(4, 5, 'Chicha Premier Prix', NULL, 'chicha-premier-prix');

-- --------------------------------------------------------

--
-- Structure de la table `transporteur`
--

DROP TABLE IF EXISTS `transporteur`;
CREATE TABLE IF NOT EXISTS `transporteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `transporteur`
--

INSERT INTO `transporteur` (`id`, `nom`, `description`, `price`) VALUES
(1, 'Colissimo', 'Profiter d\'une livraison premium dans les 72H.', 700),
(2, 'DHL', 'Livraison en 24h.', 399);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `sexe` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `roles`, `password`, `adresse`, `zipcode`, `ville`, `phone`, `sexe`) VALUES
(1, 'Blanchard Banyingela', 'Blanchard', 'blancho@gmail.com', '[]', '$2y$13$VI1fpN4iixdudUTpdBXDBeV1yXN/15A.GCi2kxG2hCn...', '23', 92600, 'Asnières-sur-Seine', 626179337, 1),
(2, 'Banyingela', 'Blanchard', 'blanchard.banyingela@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$VI1fpN4iixdudUTpdBXDBeV1yXN/15A.GCi2kxG2hCnWxAR5bMxe2', '23', 92600, 'Asnières-sur-Seine', 626179337, 1),
(3, 'Malon', 'Hector', 'blanchard.banyingela@laposte.net', '[]', '$2y$13$VI1fpN4iixdudUTpdBXDBeV1yXN/15A.GCi2kxG2hCn...', '23 AV du Docteur Fleming', 1000, 'BROU', 626179337, 1),
(4, 'Banyingela', 'Blanchard', 'blancho@yopmail.com', '[]', '$2y$13$VI1fpN4iixdudUTpdBXDBeV1yXN/15A.GCi2kxG2hCn...', '23, Avenue Du Docteur Fleming', 92600, 'Asnières-sur-Seine', 626179337, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FK_C35F0816A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `image_product`
--
ALTER TABLE `image_product`
  ADD CONSTRAINT `FK_465A53714584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_D34A04AD527FEED1` FOREIGN KEY (`sous_category_id`) REFERENCES `sous_category` (`id`),
  ADD CONSTRAINT `FK_D34A04AD7ADA1FB5` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`);

--
-- Contraintes pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD CONSTRAINT `FK_B9983CE5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `sous_category`
--
ALTER TABLE `sous_category`
  ADD CONSTRAINT `FK_E022D9412469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
