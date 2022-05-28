-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 18 mai 2022 à 03:11
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.0.14

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

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `user_id`, `nom`, `prenom`, `lastname`, `societe`, `adresse`, `postal`, `ville`, `pays`, `phone`) VALUES
(1, 1, 'Maison', 'Blanchard', 'Bany', 'Bany Trading', '23 Avenue du Docteur Fleming', '92600', 'Asnières-sur-Seine', 'FR', '+33626179337'),
(6, 2, 'Bureaufcghgvh', 'Blanchard', 'Banyingela', 'Bany Trading', '23 Avenue Du Docteur Fleming', '92600', 'ASNIÈRES SUR SEINE', 'FR', '0626179337'),
(7, 2, 'Maisonqsdqsd', 'Blanchard', 'Banyingela', NULL, '23 AV du Docteur Fleming', '92600', 'Asnières-sur-Seine', 'FR', '0626179337'),
(8, 3, 'Maison', 'Malon', 'Hector', NULL, '79 rue de la république', '92800', 'PUTEAUX', 'FR', '0626179337'),
(9, 4, 'Maison', 'Blanchard', 'BANYINGELA', '23', '23 AVENUE DU DOCTEUR FLEMING', '92600', 'Asnières-sur-Seine', 'FR', '0626179337'),
(10, 2, 'Sport', 'Blancho', 'Bany', NULL, '1 bis Rue du Petit Clamart', '78140', 'Vélizy-Villacoublay', 'AL', '0936452435');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `nom`, `content`, `slug`, `image`, `updated_at`) VALUES
(1, 'Chichas', '<p>Acheter un narguil&eacute; pas cher, une chicha de luxe ? Comment acheter une chicha adapt&eacute;e &agrave; vos besoins ? Nous savons que tous les fumeurs de chicha n&#39;ont pas les m&ecirc;mes attentes, que certains privil&eacute;gient les chichas &agrave; petit budget, d&#39;autres le design et d&#39;autres encore les performances de la chicha pour faire une grosse fum&eacute;e. Acheter une chicha portable de voyage ou une grande chicha de salon r&eacute;pond ainsi &agrave; des attentes diff&eacute;rentes. Parce que vous &ecirc;tes unique, notre boutique en ligne dispose de r&eacute;ponses personnalis&eacute;es. NarguiFive dispose de plusieurs centaines de mod&egrave;les de chichas en stock et pr&ecirc;te &agrave; &ecirc;tre exp&eacute;di&eacute;es pour &ecirc;tre livr&eacute;e chez vous en 24H. N&#39;h&eacute;sitez pas &agrave; nous contacter via le tchat ou via email pour plus d&#39;informations. L&#39;ambition de NarguiFive, c&#39;est aussi de rendre la chicha accessible au plus grand nombre, c&#39;est pourquoi nous vous proposons des chichas pas ch&egrave;res et toujours au prix le plus bas ainsi que la possibilit&eacute; de payer votre chicha en trois fois sans frais en toute simplicit&eacute;!</p>', 'chichas', '623ba7d9b8126_chicha.jpg', '2022-03-24 00:06:01'),
(2, 'GOÛT CHICHA', '<p>Les gouts chichas: des parfums savoureux deux fois moins chers que le tabac &agrave; chicha! Ces ar&ocirc;mes sans tabac ont par ailleurs l&#39;avantage de n&#39;&ecirc;tre pas chers! Les go&ucirc;ts pour chicha sont deux fois moins cher que le tabac &agrave; chicha! Les cr&egrave;mes pour chicha et les p&acirc;tes telles que le True Cloudz et le Squeeze fonctionnent de la m&ecirc;me fa&ccedil;on que les pierres et vous r&eacute;servent de d&eacute;licieux moments chicha. Mieux encore, vous pourrez les m&eacute;langer avec vos tabacs Social Smoke, Al Fakher, Adalya, Starbuzz pour cr&eacute;er des cocktails d&eacute;tonants! Tous les go&ucirc;ts chicha vendus chez NarguiFive sont sans nicotine et sans tabac pour plus de plaisir sans risque! Toutes les saveurs les plus connues des tabacs &agrave; chicha comme le Love 66, le Lady Killer, l&#39;absolute z&eacute;ro, le Mi Amore, ou encore le Hawa&iuml;, sont disponibles dans la rubrique gout chicha de notre site! Profitez du plaisir pas cher des gouts chicha qui pr&eacute;servent votre porte monnaie tout en conservant la convivialit&eacute; et le partage d&#39;une session chicha entre amis!</p>', 'goUt-chicha', 'gout-6239d562f0464.jpg', '0000-00-00 00:00:00'),
(3, 'CHARBONS', '<p>Choisir le charbon qui vous correspond est essentiel pour la qualit&eacute; de votre chicha. Aussi, NarguiFive a d&eacute;cid&eacute; de vous proposer un large choix de charbons auto-allumant et de charbon naturel pour chicha. La puissance de chauffe de votre charbon influence directement la quantit&eacute; de fum&eacute;e et le rendu en saveur de votre chicha. Autant dire qu&#39;il est important de bien choisir votre charbon &agrave; narguil&eacute;: Chez NarguiFive vous trouverez toutes les plus grandes marques de charbon &agrave; chicha auto-allumant comme le charbon Three kings, le charbon Al-Fakher, le charbon Fast Coco ou encore les charbons Carbopol... Ils sont tous pr&eacute;sents dans nos magasins au meilleur prix. Ces charbons peuvent &ecirc;tre allum&eacute;s facilement avec un simple briquet. Des charbons pour chicha de haute qualit&eacute; au charbon &agrave; chicha pas cher, nous faisons en sorte que vous puissiez obtenir la cuisson qui correspond &agrave; vos envies.</p>', 'charbons', 'charbons-6239d536d7f39.jpg', '0000-00-00 00:00:00'),
(4, 'TUYAUX', '<p>Traditionnel ou contemporain, classique ou design, &eacute;pais ou fin, en plastique, en silicone ou en m&eacute;tal, le tuyau &agrave; chicha, c&#39;est l&#39;accessoire &agrave; ne pas n&eacute;gliger pour votre narguil&eacute; : il d&eacute;finit l&#39;esth&eacute;tique de votre chicha, mais aussi votre style de consommation. Narguifive.com, c&#39;est justement une grande s&eacute;lection de tuyaux &agrave; chicha pour personnaliser votre narguil&eacute; &agrave; souhait, et choisir votre mode de consommation privil&eacute;gi&eacute;.</p>', 'tuyaux', '623ba800bd330_tuyaux.jpg', '2022-03-24 00:06:40'),
(5, 'FOYERS', 'Grand ou petit, classique ou vortex, en céramique, en terre-cuite, en verre ou en silicone, le foyer pour chicha, c\'est l\'accessoire inconditionnel pour réussir votre session de narguilé : il customise votre chicha, mais définit aussi votre style de consommation. Narguifive.com, c\'est justement un large choix de foyer à chicha pour personnaliser votre narguilé à votre gré, et l\'adapter à vos préférences.', 'foyers', '623ba8106e032_foyers.jpg', '2022-03-24 00:06:56'),
(6, 'ACCESSOIRES', 'Indispensables, ou petites coquetteries les accessoires à chichas sont divers et variés.\r\nVous trouverez dans cette rubrique différents produits, comme les vases, les brosses, les joints, les billes, les plateaux, les pinces etc...\r\nTout pour agrémenter, et rendre agréable vos sessions, peu importe le type de fumeur que vous êtes.', 'accessoires', '623ba824e1048_accessoires.jpg', '2022-03-24 00:07:16'),
(7, 'C.ELECTRONIQUE/ E-LIQUIDE', '<p>Cigarettes de poche, vapoteurs de type pen, atomiseur BBC, MOD puissants, chichas &eacute;lectroniques et e-liquides... Ils sont tous chez Narguifive ! Quel que soit votre profil, que vous soyez un fumeur addict qui cherche &agrave; arr&ecirc;ter de fumer, que vous soyez un fan de chicha cherchant la facilit&eacute; de l&rsquo;&eacute;lectronique ou que vous soyez un vapoteur confirm&eacute;, Narguifive vous propose une s&eacute;lection de cigarettes &eacute;lectroniques et de chichas &eacute;lectroniques qui conviendra parfaitement &agrave; votre profil d&#39;utilisation. Nous vous proposons &eacute;galement une gamme de liquide (avec nicotine et sans nicotine) tr&egrave;s &eacute;tendue comprenant les plus fameuses marques am&eacute;ricaines telles que Starbuzz et Square, les liquides Hooky, et la cr&egrave;me des liquides pour cigarette &eacute;lectronique fran&ccedil;ais avec les e-liquides Vap&#39;inside.</p>', 'celectronique-e-liquide', '623ba8300d35f_e-cigarette.jpg', '2022-03-24 00:07:28'),
(8, 'CBD', 'Nos produits sont sélectionnés chez les meilleurs producteurs Français, Italien, et Suisse.\r\nSur 321CBD, vous ne trouverez que de la qualité, conforme à la réglementation européenne sur la teneur en THC inférieure à 0,2%. Nous sommes véritablement attachés à votre bien-être.', 'cbd', '623ba83ac1edd_cbd.jpg', '2022-03-24 00:07:38'),
(10, 'Pack', 'NarguiFive vous propose sur Internet mais aussi en boutique, plusieurs packs pour différents budgets. L\'avantage des packs est de choisir un tout en un, au meilleur prix.', 'pack', NULL, '0000-00-00 00:00:00'),
(11, 'NOUVEAUTÉS', 'Les dernières nouveautés chichas, les nouveaux gouts pour chicha et tout ce qui fait l\'actualité du narguilé est disponible chez NarguiFive! Pour suivre l\'actualité de la boutique NarguiFive et les nouvelles chichas tendance en un seul coup d\'oeil, il vous suffit de suivre notre rubrique nouveautés. Nous actualisons quotidiennement cette rubrique pour vous proposer les dernières innovations chicha, les bons plans du moment et tous les produits chicha au meilleur prix. Vous retrouverez ainsi bien sûr les chichas à la mode, mais aussi les nouvelles saveur de gout chicha, et suivrez l\'actualité des plus grandes marques comme Kaloud, Aladin, WD Hookah, Quasar, El-Badia, Brodator...', 'nouveautes', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `color`
--

INSERT INTO `color` (`id`, `title`, `ref`) VALUES
(1, 'test', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
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
('DoctrineMigrations\\Version20211129144457', '2021-11-29 14:45:31', 3545),
('DoctrineMigrations\\Version20211223144435', '2021-12-23 15:06:22', 316),
('DoctrineMigrations\\Version20211225000750', '2022-02-20 19:00:38', 28),
('DoctrineMigrations\\Version20211226182855', '2021-12-26 19:29:21', 305),
('DoctrineMigrations\\Version20211226183104', '2021-12-26 19:31:11', 88),
('DoctrineMigrations\\Version20211228180751', '2021-12-28 19:09:15', 69),
('DoctrineMigrations\\Version20211229180116', '2022-02-20 19:03:24', 22),
('DoctrineMigrations\\Version20220220175152', '2022-02-20 19:03:24', 27),
('DoctrineMigrations\\Version20220301191311', '2022-03-01 20:14:16', 193),
('DoctrineMigrations\\Version20220302114454', '2022-03-02 12:45:22', 973),
('DoctrineMigrations\\Version20220323225254', '2022-03-23 23:59:40', 39),
('DoctrineMigrations\\Version20220406172840', '2022-04-06 19:28:48', 43);

-- --------------------------------------------------------

--
-- Structure de la table `gout`
--

CREATE TABLE `gout` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `image_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id`, `nom`, `type`) VALUES
(1, 'El-Badia', '2'),
(8, 'STEAMULATION', '2'),
(13, 'MOZE', '2'),
(14, 'MASHISHA', '2'),
(18, 'Aeon', '2'),
(19, 'STARBUZZ', '2'),
(20, 'CHICHA ALADIN', '2'),
(23, 'BRODATOR', '2'),
(25, 'OCEAN HOOKAH', '2'),
(27, 'CORSAIR', '2'),
(28, 'WD HOOKAH', '2'),
(29, 'MOB HOOKAH', '2'),
(33, 'EMBERY', '2'),
(34, 'Scorpio', '2'),
(38, 'NUBE UNIQUE', '2'),
(39, 'WOOKAH', '2'),
(44, 'DUM', '2'),
(45, 'KALOUD', '2'),
(49, 'AURA HOOKAH', '2'),
(58, 'MIG', '2'),
(59, 'CARTEL', '2'),
(60, 'ALPHA HOOKAH', '2'),
(61, 'MAKLAUD', '2'),
(65, 'UNITY', '2'),
(66, 'RETROFIT', '2'),
(69, 'ARTEFACT', '2'),
(71, 'Conceptic Design', '2'),
(73, 'BS HOOKAH CONCEPT', '2'),
(74, 'VZ HOOKAH', '2'),
(76, 'HOOKY', '2'),
(77, 'DSH: DREAM SMOKE HOOKAH', '2'),
(78, 'DSCHINNI', '2'),
(79, 'ODUMAN', '2'),
(81, 'NA GRANI', '2'),
(85, 'BLADE HOOKAH', '2'),
(86, 'FIRST HOOKAH', '2'),
(87, 'ORDEN', '2'),
(88, 'FERRO', '2'),
(89, 'CAPSULE', '2'),
(90, 'JAPONA HOOKAH', '2'),
(91, 'MEXANIKA SMOKE', '2'),
(92, 'WERKBUND HOOKAH', '2'),
(94, 'HARDWOOD', '2'),
(95, 'AMAZON HOOKAH', '2'),
(99, 'UNION HOOKAH', '2'),
(101, 'Y4 HOOKAH', '2'),
(102, 'MAMAY', '2'),
(104, 'MR. WOOD', '2'),
(106, 'IRON ROSE', '2'),
(107, 'OCTOPUZ', '2'),
(108, 'AMY', '2'),
(109, 'HOOLIGAN HOOKAH', '2'),
(111, 'GINIS', '2'),
(112, 'ADALYA', '2'),
(113, 'MYA', '2'),
(114, 'ABARID', '2'),
(116, 'QUENTINS', '2'),
(117, 'MAVERICK HOOKAH', '2'),
(118, 'ADALYA', '2'),
(120, 'S. STEEL PANDA', '2'),
(122, 'DOOSHA', '2'),
(124, 'SOLOMON HOOKAH', '2'),
(125, 'HAWK HOOKAH', '2');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `transpoteur_nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transporteur_prix` double NOT NULL,
  `delivry` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statut` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Structure de la table `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `picture`
--

INSERT INTO `picture` (`id`, `produit_id`, `image`, `updated_at`) VALUES
(1, 532, '623db7b324fff786245537.JPG', '2022-03-25 13:38:11'),
(2, 532, '623db7b3260dc026912653.JPG', '2022-03-25 13:38:11'),
(3, 532, '623db7b327090983929334.JPG', '2022-03-25 13:38:11'),
(4, 533, '624f0c217c545815731395.jpg', '2022-04-07 18:06:57'),
(5, 533, '624f0c217d4bc866387894.jpg', '2022-04-07 18:06:57'),
(6, 533, '624f0c217e983636779181.jpg', '2022-04-07 18:06:57');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
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
  `taille` double DEFAULT NULL,
  `vase` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tuyau` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fixation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publie` tinyint(1) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  `marque_id` int(11) DEFAULT NULL,
  `gramme` int(11) DEFAULT NULL,
  `en_stock` tinyint(1) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `sous_category_id`, `nom`, `content`, `slug`, `image`, `price`, `price_ht`, `promotion`, `nouveaute`, `color_id`, `taille`, `vase`, `tuyau`, `fixation`, `autre`, `publie`, `is_best`, `marque_id`, `gramme`, `en_stock`, `quantite`, `intro`) VALUES
(1, 1, 1, 'Chicha CELESTE JUNIOR 2.0', 'La chicha CELESTE JUNIOR 2.0, la référence du narguilé EL-BADIA, fourni avec tuyau, foyer en céramique, une brosse dentretien et une pince.', 'chicha-celeste-junior-2-0', 'https://www.el-badia.com/9080-home_default/xchicha-celeste-junior-20.jpg.pagespeed.ic.CzkTIrQYRL.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(2, 1, 1, 'Chicha EL-BADIA P1', 'Chicha EL-BADAI P1, chicha transportable avec tuyau&nbsp;en silicone et foyer à double capacité&nbsp;', 'chicha-el-badia-p1', 'https://www.el-badia.com/7012-home_default/xchicha-el-badia-p1.jpg.pagespeed.ic.OH_zNsAgsv.png', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(3, 1, 1, 'Chicha EL-BADIA XS', 'Chicha EL-BADIA XS, 21cm, compacte et nomade, vase en verre, foyer et tuyaux fournis', 'chicha-el-badia-xs', 'https://www.el-badia.com/9063-home_default/xchicha-el-badia-xs.jpg.pagespeed.ic.gqQSy_dym8.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(4, 1, 1, 'Chicha CELESTE JUNIOR 2.0 CAMO', 'Chicha CELESTE JUNIOR 2.0 CAMO, cm37, vase acry, couleurs camouflage', 'chicha-celeste-junior-2-0-camo', 'https://www.el-badia.com/9130-home_default/xchicha-celeste-junior-20-camo.jpg.pagespeed.ic.AhDpu_gDpv.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(5, 1, 1, 'Chicha EL-BADIA C1', 'Chicha EL-BADIA C1, haute de 31cm, cette chicha chamboule les codes avec un tout nouveau vase en verre doté dun système click.', 'chicha-el-badia-c1', 'https://www.el-badia.com/9076-home_default/xchicha-el-badia-c1.jpg.pagespeed.ic.L-l4b68jQc.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(6, 1, 1, 'Chicha Celeste X3', 'Issue de la gamme de chicha CELESTE, voici la EL-BADIA CELESTE X3,', 'chicha-celeste-x3', 'https://www.el-badia.com/9099-home_default/xchicha-celeste-x3.jpg.pagespeed.ic.PJFmhWQp8W.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(7, 1, 1, 'Chicha CELESTE X3 CLICK', 'Chicha CELESTE X3, 36cm, avec vase en verre et fixation CLICK', 'chicha-celeste-x3-click', 'https://www.el-badia.com/10257-home_default/xchicha-celeste-x3-click.jpg.pagespeed.ic.l-KbJPtdUD.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(8, 1, 1, 'Chicha EL-BADIA C5', 'Chicha EL-BADIA C5, 43cm, vase en verre CLICK, CUT de colonne 18/8 fourni avec tuyau silicone, manche métallique et foyer avec système de chauffe type cheminée.', 'chicha-el-badia-c5', 'https://www.el-badia.com/9179-home_default/xchicha-el-badia-c5.jpg.pagespeed.ic.rjyJKOJ2fs.jpg', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(9, 1, 1, 'Chicha EL-BADIA C7', 'Chicha EL-BADIA C7, 56 cm, vase en verre CLICK, CUT de colonne 18/8, tuyau silicone et foyer avec système de chauffe type cheminée', 'chicha-el-badia-c7', 'https://www.el-badia.com/9192-home_default/xchicha-el-badia-c7.jpg.pagespeed.ic.6BxrkPFrie.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(10, 1, 1, 'STEAMULATION PRO X Mini', 'Chicha STEAMULATION PRO X MINI, acier inoxydable, vase en cristal, 39cm, Click 360°, ultra réglable', 'steamulation-pro-x-mini', 'https://www.el-badia.com/11315-home_default/xsteamulation-pro-x-mini.jpg.pagespeed.ic.CwP6G1ityW.png', 209, 209, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(11, 1, 1, 'Chicha CELESTE CRAZY', 'Chicha CELESTE X3, 36cm, avec vase en verre et fixation CLICK et coloris type graffiti', 'chicha-celeste-crazy', 'https://www.el-badia.com/9198-home_default/xchicha-celeste-crazy.jpg.pagespeed.ic.s5tvpl52F0.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(12, 1, 1, 'Chicha CELESTE X1', 'La chicha X1 de la gamme la plus célèbre de chicha, CELESTE, compacte de 25cm, tuyau et foyer inclus', 'chicha-celeste-x1', 'https://www.el-badia.com/9138-home_default/xchicha-celeste-x1.jpg.pagespeed.ic.YaHNIIvAOD.jpg', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(13, 1, 1, 'Chicha MOZE BREEZE TWO', 'Chicha MOZE BREEZE TWO, 39cm, en acier inoxydable, polyacétal et revêtement en résine colorée. Fournie avec manche assorti, diffuseur et purge modulable.', 'chicha-moze-breeze-two', 'https://www.el-badia.com/10221-home_default/xchicha-moze-breeze-two.jpg.pagespeed.ic.C5FQE8xOEm.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(14, 1, 1, 'Chicha EL-BADIA M5', 'Chicha EL-BADIA M5, 43cm, en acier inoxydable et insert en résine colorée. Fournie avec flexible silicone et manche inox assorti, diffuseur inclus et purge dissimulée sous lassiette.', 'chicha-el-badia-m5', 'https://www.el-badia.com/11516-home_default/xchicha-el-badia-m5.jpg.pagespeed.ic.xoCBQWaOM3.png', 139, 139, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(15, 1, 1, 'Chicha MS MIGNON', 'Chicha MS&nbsp;MIGNON, 20cm, en acrylique et aluminium, tuyau silicone et manche, LED et sacoche fournis', 'chicha-ms-mignon', 'https://www.el-badia.com/10576-home_default/xchicha-ms-mignon.jpg.pagespeed.ic.VKFqlsPXgu.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(16, 1, 1, 'Chicha CELESTE X3 EDITION SPECIALE', 'Chicha CELESTE X3 édition spéciale: Woodland Army, Lava et Black Marble', 'chicha-celeste-x3-edition-speciale', 'https://www.el-badia.com/9153-home_default/xchicha-celeste-x3-edition-spe.jpg.pagespeed.ic.jUuyt8O9pr.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(17, 1, 1, 'Chicha MS MICRO', 'Chicha MS MICRO en acrylique et aluminium, tuyau silicone et manche fournis', 'chicha-ms-micro', 'https://www.el-badia.com/4430-home_default/xchicha-ms-micro.jpg.pagespeed.ic.azOigeEfeN.jpg', 120, 120, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(18, 1, 1, 'Chicha VYRO ONE', 'Chicha VYRO ONE de la marque AEON, chicha transportable très résistante, en carbone et acier inoxydable, haute de 16cm.', 'chicha-vyro-one', 'https://www.el-badia.com/6402-home_default/xchicha-vyro-one.jpg.pagespeed.ic.V7IDaTok9v.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 18, 1, 1, NULL, NULL),
(19, 1, 1, 'Chicha MVP 360', 'Chicha MVP 360 en acier inoxydable, complète avec tuyau silicone et foyer', 'chicha-mvp-360', 'https://www.el-badia.com/7713-home_default/xchicha-mvp-360.jpg.pagespeed.ic.xCzVxtvPZk.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(20, 1, 1, 'Chicha STARBUZZ CARBINE HOOKAH', 'Chicha STARBUZZ CARBINE HOOKAH, 65cm, trépied télescopique, rotation 360°, système LED', 'chicha-starbuzz-carbine-hookah', 'https://www.el-badia.com/5201-home_default/xchicha-starbuzz-carbine-hookah.jpg.pagespeed.ic._MRlenYWbT.jpg', 269, 269, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(21, 1, 1, 'Chicha MS SCANDI 2.0', 'Chicha en verre MS SCANDI 2.0, haute de 25 cm, vase en verre&nbsp;suspendu&nbsp;sur un socle en bois.', 'chicha-ms-scandi-2-0', 'https://www.el-badia.com/9776-home_default/xchicha-ms-scandi-20.jpg.pagespeed.ic.oyURP5KGGB.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(22, 1, 1, 'STEAMULATION PRO X II', 'Chicha STEAMULATION CLASSIC PRO X II, en acier inoxydable, vase en cristal, 52cm, Click 360°,&nbsp;ultra réglable', 'steamulation-pro-x-ii', 'https://www.el-badia.com/10551-home_default/xsteamulation-pro-x-ii.jpg.pagespeed.ic.l8cDYvoB_D.jpg', 379, 379, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(23, 1, 1, 'Chicha BRODATOR 320 MINI', 'Chicha BRODATOR 320 MINI, 32cm en inox, sac de transport, tuyau silicone et foyer en terre cuite', 'chicha-brodator-320-mini', 'https://www.el-badia.com/10068-home_default/xchicha-brodator-320-mini.jpg.pagespeed.ic.fhEjeNWsWi.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 23, 1, 1, NULL, NULL),
(24, 1, 1, 'Chicha CELESTE X1 EDITION SPECIALE', 'Chicha CELESTE X1&nbsp;édition spéciale', 'chicha-celeste-x1-edition-speciale', 'https://www.el-badia.com/9174-home_default/xchicha-celeste-x1-edition-speciale.jpg.pagespeed.ic.qzwoVtxn1O.jpg', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(25, 1, 1, 'Chicha MVP 360 GOLD EDITION', 'Chicha MVP 360 GOLD EDITION en acier inoxydable, complète avec tuyau silicone et foyer', 'chicha-mvp-360-gold-edition', 'https://www.el-badia.com/10248-home_default/xchicha-mvp-360-gold-edition.jpg.pagespeed.ic.YuJihwrap6.png', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(26, 1, 1, 'Chicha OCEAN HOOKAH KAIF SMALL', 'Chicha OCEAN HOOKAH KAIF SMALL, 39cm, acier inoxydable V2A, purge en dessous du plateau, tuyau silicone, manche et pince fournis', 'chicha-ocean-hookah-kaif-small', 'https://www.el-badia.com/8012-home_default/xchicha-ocean-hookah-kaif-small.jpg.pagespeed.ic.G3POhKYyi-.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 25, 1, 1, NULL, NULL),
(27, 1, 1, 'Chicha CORSAIR', 'Chicha CORSAIR, 50cm, de fabrication russe, acier inoxydable et polyacétal.&nbsp;Système de réglage du diffuseur.&nbsp;', 'chicha-corsair', 'https://www.el-badia.com/10492-home_default/xchicha-corsair.jpg.pagespeed.ic.xzUcGBLsVq.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 27, 1, 1, NULL, NULL),
(28, 1, 1, 'Chicha MOB HOOKAH AK47', 'Chicha AK47 de la marque U.S. \"MOB HOOKAH\", 85cm, tuyau, foyer et pince fournis', 'chicha-mob-hookah-ak47', 'https://www.el-badia.com/1777-home_default/xchicha-mob-hookah-ak47.jpg.pagespeed.ic.es-9aqubgY.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 29, 1, 1, NULL, NULL),
(29, 1, 1, 'Chicha WD HOOKAH MINI-1', 'Chicha WD HOOKAH MINI-1, 27 cm, en acier inoxydable V2A, vase en verre vissé, «&nbsp;cut&nbsp;» 18.8', 'chicha-wd-hookah-mini-1', 'https://www.el-badia.com/8162-home_default/xchicha-wd-hookah-mini-1.jpg.pagespeed.ic.t-YfPWwR8y.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 28, 1, 1, NULL, NULL),
(30, 1, 1, 'Chicha MOZE DASH BLACK', 'Chicha MOZE DASH BLACK, 50cm, en acier inoxydable et PMO avec purge centrale qui renvoi la fumée vers le haut de la colonne', 'chicha-moze-dash-black', 'https://www.el-badia.com/9275-home_default/xchicha-moze-dash-black.jpg.pagespeed.ic.2oaM51ycL2.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(31, 1, 1, 'Chicha MS BB', 'MS BB, 13cm, chicha compacte en acrylique avec sac de transport, fournie avec diffuseur et tuyau silicone', 'chicha-ms-bb', 'https://www.el-badia.com/9808-home_default/xchicha-ms-bb.jpg.pagespeed.ic.sRkQSMo_FD.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(32, 1, 1, 'Chicha EMBERY MINI MONO', 'Chicha EMBERY MINI MONO, acier inoxydable et polyacétal&nbsp;(POM), 35cm, tuyau silicone et manche inclus', 'chicha-embery-mini-mono', 'https://www.el-badia.com/7878-home_default/xchicha-embery-mini-mono.jpg.pagespeed.ic.oE5BsI9cK6.jpg', 109, 109, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(33, 1, 1, 'Chicha ALADIN EPOX 360 PRO', 'Chicha ALADIN EPOX 360 PRO, 36cm, inox et poxy, tuyau silicone et manche alu, foyer cheminée, deux colonnes epoxy et 10 purges possibles&nbsp;', 'chicha-aladin-epox-360-pro', 'https://www.el-badia.com/11268-home_default/xchicha-aladin-epox-360-pro.jpg.pagespeed.ic.Oo6O3DIfjY.jpg', 129, 129, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(34, 1, 1, 'SCORPIO Melody', 'Chicha SCORPIO MELODY, 40cm, vase en verre nacré et corps en aluminium anodisé, complète foyer et tuyau silicone fournis', 'scorpio-melody', 'https://www.el-badia.com/9770-home_default/xscorpio-melody.jpg.pagespeed.ic.Ufk0Ylm0JC.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 34, 1, 1, NULL, NULL),
(35, 1, 1, 'Chicha MVP A36', 'Chicha MVP A36 en acier inoxydable,36cm&nbsp; complète avec tuyau silicone et foyer avec système de chauffe, cut de colonne et diffuseur', 'chicha-mvp-a36', 'https://www.el-badia.com/10741-home_default/xchicha-mvp-a36.jpg.pagespeed.ic.69BZMovqxQ.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(36, 1, 1, 'Scorpio Stinger Carbon', 'Chicha SCORPIO&nbsp;CARBON, 38 cm, colonne en finition carbone, tuyau et foyer silicone fournis', 'scorpio-stinger-carbon', 'https://www.el-badia.com/5437-home_default/xscorpio-stinger-carbon.jpg.pagespeed.ic.7aP1CpgN_A.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 34, 1, 1, NULL, NULL),
(37, 1, 1, 'Chicha MS TOKYO 2.0', 'Chicha MS TOKYO 2.0, 30cm, fournie avec sacoche de transport, tuyau silicone et manche en alu, foyer silicone.', 'chicha-ms-tokyo-2-0', 'https://www.el-badia.com/9009-home_default/xchicha-ms-tokyo-20.jpg.pagespeed.ic.43xCO8GUHJ.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(38, 1, 1, 'Chicha NUBE UNIQUE', 'Chicha NUBE UNIQUE, 55cm, en acier inoxydable AISI 321 revêtue de bois noble, tuyau silicone', 'chicha-nube-unique', 'https://www.el-badia.com/6149-home_default/xchicha-nube-unique.jpg.pagespeed.ic.3NPkmhCfFk.jpg', 309, 309, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 38, 1, 1, NULL, NULL),
(39, 1, 1, 'Pack EL-BADIA M5 QUASAR RAAS', 'Pack&nbsp; EL-BADIA M5 & QUASAR RAAS, chicha 43cm en acier inoxydable et insert en résine colorée. Fournie avec foyer thermique QUASAR RAAS,&nbsp; flexible silicone et manche inox assorti, diffuseur inclus et purge dissimulée sous lassiette.', 'pack-el-badia-m5-quasar-raas', 'https://www.el-badia.com/11563-home_default/xpack-el-badia-m5-quasar-raas.jpg.pagespeed.ic.ZjLxZlZ3La.png', 189, 189, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(40, 1, 1, 'Chicha WOOKAH WALNUT CRYSTAL CLICK', 'Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni.', 'chicha-wookah-walnut-crystal-click', 'https://www.el-badia.com/6503-home_default/xwookah-walnut-crystal-click.jpg.pagespeed.ic.AETXrP11ZL.jpg', 314, 314, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(41, 1, 1, 'Chicha MS BEIRUT', 'Chicha MS BEIRUT, 43cm, fournie avec tuyau en silicone manche carbone, foyer silicone, diffuseur intégré et soupape dissimulée', 'chicha-ms-beirut', 'https://www.el-badia.com/9008-home_default/xchicha-ms-beirut.jpg.pagespeed.ic.kkQSBvQ0x-.jpg', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 34, 1, 1, NULL, NULL),
(42, 1, 1, 'Scorpio Temple', 'Chicha SCORPIO&nbsp;TEMPLE, 41&nbsp;cm, foyer et tuyau en silicone inclus', 'scorpio-temple', 'https://www.el-badia.com/5434-home_default/xscorpio-temple.jpg.pagespeed.ic.zWtJTdTMl7.jpg', 55, 55, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 34, 1, 1, NULL, NULL),
(43, 1, 1, 'Chicha MVP 460', 'Chicha MVP&nbsp;460 en acier inoxydable, 46cm complète avec tuyau silicone et foyer avec système de chauffe et diffuseur', 'chicha-mvp-460', 'https://www.el-badia.com/10762-home_default/xchicha-mvp-460.jpg.pagespeed.ic.4NFW_C4q9K.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(44, 1, 1, 'Chicha WOOKAH OAK CRYSTAL CLICK', 'Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni', 'chicha-wookah-oak-crystal-click', 'https://www.el-badia.com/6474-home_default/xwookah-oak-crystal-click.jpg.pagespeed.ic.2ZSqaIgX1_.jpg', 279, 279, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(45, 1, 1, 'Chicha DUM CARBON SS19', 'chicha DUM CARBON SS19, 33cm, en acier inoxydable, colonne en carbone, complète avec tuyau en silicone et manche carbone, foyer et système de chauffe type cheminée, diffuseur amovible pour plongeur', 'chicha-dum-carbon-ss19', 'https://www.el-badia.com/8184-home_default/xchicha-dum-carbon-ss19.jpg.pagespeed.ic.yAc3NzrdVB.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 44, 1, 1, NULL, NULL),
(46, 1, 1, 'Chicha MS TOKYO', 'Chicha transportable MS TOKYO, pack complet, facilement transportable.', 'chicha-ms-tokyo', 'https://www.el-badia.com/6661-home_default/xchicha-ms-tokyo.jpg.pagespeed.ic.YraCO6KsX5.jpg', 59, 59, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(47, 1, 1, 'Steamulation PRO X II CRYSTAL', 'Chicha STEAMULATION CLASSIC PRO X II CRYSTAL, en acier inoxydable, vase en cristal ciselé, 52cm, Click 360°,&nbsp;ultra réglable', 'steamulation-pro-x-ii-crystal', 'https://www.el-badia.com/10562-home_default/xsteamulation-pro-x-2-crystal.jpg.pagespeed.ic.Qc8qtm21BM.jpg', 399, 399, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(48, 1, 1, 'Chicha AURA HOOKAH GEAR', 'Chicha AURA HOOKAH GEAR, 51cm, acier inoxydable et&nbsp;polyacétal, purge dissimulée, tuyau silicone et manche inox', 'chicha-aura-hookah-gear', 'https://www.el-badia.com/10989-home_default/xchicha-aura-gear.jpg.pagespeed.ic.0sV2IOIR35.png', 129, 129, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 49, 1, 1, NULL, NULL),
(49, 1, 1, 'Chicha KALOUD KRYSALIS ELTHERIA', 'Chicha KALOUD KRYSALIS ELTHERIA&nbsp;®, double paroi en plastique sans BPA avec socle en silicone, système de LED', 'chicha-kaloud-krysalis-eltheria', 'https://www.el-badia.com/7129-home_default/xchicha-kaloud-krysalis-eltheria.jpg.pagespeed.ic.vy5R1n8V20.jpg', 499, 499, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 45, 1, 1, NULL, NULL),
(50, 1, 1, 'Chicha MVP 500', 'Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', 'chicha-mvp-500', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(51, 1, 1, 'Chicha MVP 500', 'Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', 'chicha-mvp-500', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(52, 1, 1, 'Chicha MVP 500', 'Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', 'chicha-mvp-500', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(53, 1, 1, 'Chicha MVP 500', 'Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', 'chicha-mvp-500', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(54, 1, 1, 'Chicha MVP 500', 'Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', 'chicha-mvp-500', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(55, 1, 1, 'Chicha MVP 500', 'Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', 'chicha-mvp-500', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(56, 1, 1, 'Chicha MVP 500', 'Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', 'chicha-mvp-500', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(57, 1, 1, 'Chicha MVP 500', 'Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', 'chicha-mvp-500', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(58, 1, 2, 'Chicha ODUMAN N3 ON THE GO', 'Chicha ODUMAN N3 ON THE GO', 'chicha-oduman-n3-on-the-go', 'https://www.el-badia.com/10810-home_default/xchicha-oduman-n3-on-the-go.jpg.pagespeed.ic.Xv-MeGSBsj.png', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(59, 1, 2, 'Chicha Oduman Micro', 'Chicha ODUMAN MICRO, 17cm avec sacoche de transport , tuyau silicone, ressort et diffuseur', 'chicha-oduman-micro', 'https://www.el-badia.com/10814-home_default/xchicha-oduman-micro.jpg.pagespeed.ic.OgD36ePSrG.png', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(60, 1, 2, 'Chicha ODUMAN N5-Z JUNIOR', 'La chicha ODUMAN N5-Z JUNIOR est une chicha en verre suspendue sur un socle métallique, 24cm', 'chicha-oduman-n5-z-junior', 'https://www.el-badia.com/3509-home_default/xchicha-oduman-n5-z-junior.jpg.pagespeed.ic.WF6ukoYRER.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(61, 1, 2, 'Chicha ODUMAN N9 SPIDER', 'La chicha ODUMAN N9&nbsp;SPIDER est une chicha en verre suspendue sur un socle métallique, 25cm', 'chicha-oduman-n9-spider', 'https://www.el-badia.com/10530-home_default/xchicha-oduman-n9-spider.jpg.pagespeed.ic.Q0INuZOE8b.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(62, 1, 2, 'Chicha ODUMAN N8 VOYAGE', 'Chicha ODUMAN N8 VOYAGE en verre, compacte 20cm, avec sacoche de transport et tuyau silicone', 'chicha-oduman-n8-voyage', 'https://www.el-badia.com/4070-home_default/xchicha-oduman-n8-voyage.jpg.pagespeed.ic.u-biqbP5mp.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(63, 1, 2, 'Chicha Fumo MINI JAR MALLETTE', 'Chicha FUMO MINI JAR&nbsp;® en verre de laboratoire complète avec mallette, H=26cm, L=10cm', 'chicha-fumo-mini-jar-mallette', 'https://www.el-badia.com/11040-home_default/xchicha-fumo-mini-jar-mallette.jpg.pagespeed.ic.7rsJtW3Wsk.jpg', 245, 245, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(64, 1, 2, 'Chicha FUMO MINI JAR', 'Chicha FUMO MINI JAR&nbsp;® en verre de laboratoire complète, H=26cm, L=10cm', 'chicha-fumo-mini-jar', 'https://www.el-badia.com/11155-home_default/xchicha-fumo-mini-jar.jpg.pagespeed.ic.kEaGNuS2ZQ.jpg', 215, 215, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(65, 1, 2, 'Chicha ODUMAN MIDI', 'Chicha ODUMAN N4M-C MIDI, 23 cm, en verre avec sacoche de transport et tuyau silicone, LED inclue', 'chicha-oduman-midi', 'https://www.el-badia.com/5372-home_default/xchicha-oduman-midi.jpg.pagespeed.ic.XO6Hf0DET8.jpg', 109, 109, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(66, 1, 2, 'Chicha MS COSMOPOLITAN', 'Chicha MS COSMOPOLITAN, 31 cm, avec manche en verre et tuyau silicone', 'chicha-ms-cosmopolitan', 'https://www.el-badia.com/3497-home_default/xchicha-ms-cosmopolitan.jpg.pagespeed.ic.I2fVBaKITy.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(67, 1, 2, 'Chicha Fumo MINI TANK MALLETTE', 'Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', 'chicha-fumo-mini-tank-mallette', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(68, 1, 2, 'Chicha ODUMAN N2 TRAVEL', 'La chicha ODUMAN N2 TRAVEL en verre, compacte 18cm, avec sacoche de transport et tuyau silicone', 'chicha-oduman-n2-travel', 'https://www.el-badia.com/10532-home_default/xchicha-oduman-n2-travel.jpg.pagespeed.ic.PttnNxpIWB.jpg', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(69, 1, 2, 'Chicha FUMO MINI TANK', 'Chicha FUMO MINI TANK ® en verre de laboratoire avec tuyau à embout en verre, H=17cm, L=21cm', 'chicha-fumo-mini-tank', 'https://www.el-badia.com/11154-home_default/xchicha-fumo-mini-tank-.jpg.pagespeed.ic.tzbm1tKoyi.png', 245, 245, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(70, 1, 2, 'Chicha Ms SCANDI', 'Chicha en verre MS SCANDI, haute de 35 cm, vase en verre maintenu par un socle en bois.', 'chicha-ms-scandi', 'https://www.el-badia.com/6378-home_default/xchicha-ms-scandi.jpg.pagespeed.ic.g0qod9oi7c.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(71, 1, 2, 'Chicha CELESTE GLASS ICE', 'Chicha en verre de laboratoire CELESTE GLASS version ICE, 39cm, avec système de LED', 'chicha-celeste-glass-ice', 'https://www.el-badia.com/2634-home_default/xchicha-celeste-glass-ice.jpg.pagespeed.ic.KoJhsReLJC.jpg', 139, 139, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(72, 1, 2, 'Chicha FUMO JAR ICE', 'Chicha FUMO JAR ® ICE en verre de laboratoire borosilicate avec tuyau à embout en verre, 37cm.', 'chicha-fumo-jar-ice', 'https://www.el-badia.com/3865-home_default/xchicha-fumo-jar-ice.jpg.pagespeed.ic.tIygQJGKSo.jpg', 309, 309, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(73, 1, 2, 'Chicha ODUMAN SMOKE X', 'Chicha en verre ODUMAN SMOKE X tuyau silicone et métal, 22cm, système de LED', 'chicha-oduman-smoke-x', 'https://www.el-badia.com/10811-home_default/xchicha-oduman-smoke-x.jpg.pagespeed.ic.HWCTbe56Tf.png', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(74, 1, 2, 'Chicha CELESTE GLASS', 'Chicha en verre de laboratoire CELESTE GLASS, 39cm, avec système de LED, tuyau silicone et&nbsp;verre', 'chicha-celeste-glass', 'https://www.el-badia.com/2420-home_default/xceleste-glass.jpg.pagespeed.ic.dzpywdw2RQ.jpg', 129, 129, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(75, 1, 2, 'Chicha ODUMAN N7 SMOKE TANK', 'Chicha ODUMAN N7 SMOKE TANK avec sacoche et tuyau silicone, 21x19cm', 'chicha-oduman-n7-smoke-tank', 'https://www.el-badia.com/3823-home_default/xchicha-oduman-n7-smoke-tank.jpg.pagespeed.ic.i-J8FJrerJ.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(76, 1, 2, 'Chicha FUMO MIDDLE TANK', 'Chicha FUMO MIDDLE TANK ® en verre de laboratoire avec tuyau à embout en verre, H=13cm, L=25cm', 'chicha-fumo-middle-tank', 'https://www.el-badia.com/3864-home_default/xchicha-fumo-middle-tank-.jpg.pagespeed.ic.YcmxopQdqd.jpg', 349, 349, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(77, 1, 2, 'Chicha GLOSSY WHITE ®', 'Chicha&nbsp;GLOSSY WHITE ® en verre de laboratoire, 30cm, foyer verre, diffuseur intégré, tuyau silicone', 'chicha-glossy-white-r', 'https://www.el-badia.com/1877-home_default/xchicha-glossy-white.jpg.pagespeed.ic.7q_1Mzzeg0.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(78, 1, 2, 'Chicha FUMO ZED', 'Chicha FUMO ZED&nbsp;® en verre de laboratoire borosilicate avec tuyau à embout en verre, 49cm', 'chicha-fumo-zed', 'https://www.el-badia.com/3873-home_default/xchicha-fumo-zed.jpg.pagespeed.ic.o4fatgm2WA.jpg', 359, 359, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(79, 1, 2, 'Chicha SKULL', 'Chicha Skull, entièrement en verre, fournie avec manche en verre et foyer.', 'chicha-skull', 'https://www.el-badia.com/6740-home_default/xchicha-skull.jpg.pagespeed.ic.cSdnDBf_x6.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(80, 1, 2, 'Chicha CELESTE GLASS GOLD', 'Chicha en verre de laboratoire CELESTE GLASS version GOLD, 39cm, avec système de LED', 'chicha-celeste-glass-gold', 'https://www.el-badia.com/3260-home_default/xchicha-celeste-glass-gold.jpg.pagespeed.ic.owKQpaBr9o.jpg', 111, 111, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(81, 1, 2, 'Chicha ODUMAN TRINITY', 'Chicha ODUMAN TRINITY en verre sur trépied, 41cm', 'chicha-oduman-trinity', 'https://www.el-badia.com/5184-home_default/xchicha-oduman-trinity.jpg.pagespeed.ic.6CGtEo97KY.png', 179, 179, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(82, 1, 2, 'Chicha GLOSSY SILVER ®', 'Chicha&nbsp;GLOSSY Silver&nbsp;® en verre de laboratoire, 30cm, foyer verre, diffuseur intégré, tuyau silicone', 'chicha-glossy-silver-r', 'https://www.el-badia.com/3255-home_default/xchicha-glossy-silver.jpg.pagespeed.ic.7AyY_zg-37.jpg', 109, 109, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(83, 1, 2, 'Chicha FUMO ORB ICE', 'Chicha FUMO Orb ® ICE en verre de laboratoire avec tuyau à embout en verre, 26cm', 'chicha-fumo-orb-ice', 'https://www.el-badia.com/3871-home_default/xchicha-fumo-orb-ice.jpg.pagespeed.ic.JJqKRqqwVx.jpg', 289, 289, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(84, 1, 2, 'Chicha ODUMAN N3', 'Chicha en verre ODUMAN N3 en version Matt ou Clear avec système LED, tuyau silicone et métal, 24cm', 'chicha-oduman-n3', 'https://www.el-badia.com/2385-home_default/xchicha-oduman-n3.jpg.pagespeed.ic.keORVamIPN.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(85, 1, 2, 'Chicha FUMO ORB', 'Chicha FUMO Orb ® en verre de laboratoire avec tuyau à embout en verre, 26cm', 'chicha-fumo-orb', 'https://www.el-badia.com/3870-home_default/xchicha-fumo-orb.jpg.pagespeed.ic.UXAOMAkST8.jpg', 269, 269, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(86, 1, 2, 'Chicha CELESTE GLASS SILVER', 'Chicha en verre de laboratoire CELESTE GLASS version Silver, 39cm, avec système de LED', 'chicha-celeste-glass-silver', 'https://www.el-badia.com/3256-home_default/xchicha-celeste-glass-silver.jpg.pagespeed.ic.LAm5IMdZyr.jpg', 111, 111, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(87, 1, 2, 'Chicha FUMO F4', 'Chicha FUMO F4 ® en verre de laboratoire borosilicate avec tuyau à embout en verre, 48cm', 'chicha-fumo-f4', 'https://www.el-badia.com/3876-home_default/xchicha-fumo-f4.jpg.pagespeed.ic.0k11mZ1tMR.jpg', 289, 289, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(88, 1, 2, 'Chicha ODUMAN N5', 'Chicha en verre ODUMAN N5&nbsp;en version Clear et matt avec socle métal, système LED, tuyau silicone', 'chicha-oduman-n5', 'https://www.el-badia.com/2803-home_default/xchicha-oduman-n5.jpg.pagespeed.ic.u9byKt4Q_w.jpg', 179, 179, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(89, 1, 2, 'Chicha FUMO JAR', 'Chicha FUMO JAR ® en verre de laboratoire borosilicate avec tuyau à embout en verre, 37cm.', 'chicha-fumo-jar', 'https://www.el-badia.com/3860-home_default/xchicha-fumo-jar-.jpg.pagespeed.ic.Z0Okbe8XO_.jpg', 289, 289, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(90, 1, 2, 'Chicha FUMO F4 ICE', 'Chicha FUMO F4 ® ICE en verre de laboratoire borosilicate avec tuyau à embout en verre, 48cm', 'chicha-fumo-f4-ice', 'https://www.el-badia.com/3875-home_default/xchicha-fumo-f4-ice.jpg.pagespeed.ic.NXM3Qsz-HN.jpg', 309, 309, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(91, 1, 2, 'Chicha DSCHINNI AQUA', 'La chicha DSCHINNI AQUA, 83cm en verre de laboratoire : socle en verre,&nbsp;VENDU SANS TUYAUX', 'chicha-dschinni-aqua', 'https://www.el-badia.com/3181-home_default/xchicha-dschinni-aqua.jpg.pagespeed.ic.F2KhYWP61A.jpg', 399, 399, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 78, 1, 1, NULL, NULL),
(92, 1, 2, 'Chicha FUMO MINI TANK ICE', 'Chicha FUMO MINI TANK ® ICE en verre de laboratoire avec tuyau à embout en verre, H=17cm, L=21cm', 'chicha-fumo-mini-tank-ice', 'https://www.el-badia.com/11156-home_default/xchicha-fumo-mini-tank-ice.jpg.pagespeed.ic.gX9p_37HTL.png', 289, 289, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(93, 1, 2, 'Chicha ODUMAN N2', 'Chicha en verre ODUMAN N2 en version Matt ou Clear avec système LED, tuyau silicone et metal, 28cm', 'chicha-oduman-n2', 'https://www.el-badia.com/2375-home_default/xchicha-oduman-n2.jpg.pagespeed.ic.cSK0x9Ofs4.jpg', 129, 129, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(94, 1, 2, 'Chicha Ms Optimus', 'Chicha MS OPTIMUS&nbsp;en verre de laboratoire, 30cm, avec socle, tuyau silicone&nbsp;', 'chicha-ms-optimus', 'https://www.el-badia.com/5426-home_default/xchicha-ms-optimus.jpg.pagespeed.ic.Wu24boFzwr.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(95, 1, 2, 'Chicha FUMO POD', 'Chicha FUMO POD ® en verre de laboratoire borosilicate avec tuyau à embout en verre, 49cm', 'chicha-fumo-pod', 'https://www.el-badia.com/3866-home_default/xchicha-fumo-pod-.jpg.pagespeed.ic.o3nUV-Q7Cc.jpg', 359, 359, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(96, 1, 2, 'Chicha TROPHY', 'Chicha TROPHY en verre de laboratoire, 70cm, tuyau silicone et foyer verre fournis', 'chicha-trophy', 'https://www.el-badia.com/3288-home_default/xchicha-trophy.jpg.pagespeed.ic.SO1f4BUuJS.jpg', 199, 199, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(97, 1, 2, 'Chicha FUMO ZED XL', 'La chicha FUMO POD ZED&nbsp;® en verre de laboratoire borosilicate avec tuyau à embout en verre, 80cm', 'chicha-fumo-zed-xl', 'https://www.el-badia.com/3874-home_default/xchicha-fumo-zed-xl.jpg.pagespeed.ic.M-Vb1NpEtr.jpg', 389, 389, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(98, 1, 2, 'Chicha ODUMAN N4', 'Chicha en verre ODUMAN N4 en version Clear avec système LED, tuyau silicone et métal, 28cm', 'chicha-oduman-n4', 'https://www.el-badia.com/2514-home_default/xchicha-oduman-n4.jpg.pagespeed.ic.VfO2kfieQR.jpg', 139, 139, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(99, 1, 2, 'Chicha FUMO TANK', 'Chicha FUMO TANK ® en verre de laboratoire borosilicate avec tuyau à embout en verre, H=23cm, L=30cm', 'chicha-fumo-tank', 'https://www.el-badia.com/3872-home_default/xchicha-fumo-tank-.jpg.pagespeed.ic.aRywlIErvQ.jpg', 329, 329, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(100, 1, 2, 'Chicha FUMO POD ICE', 'Chicha FUMO POD ® ICE en verre de laboratoire borosilicate avec tuyau à embout en verre, 49cm', 'chicha-fumo-pod-ice', 'https://www.el-badia.com/3867-home_default/xchicha-fumo-pod-ice.jpg.pagespeed.ic.yMrPP9A_Xp.jpg', 379, 379, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(101, 1, 2, 'Chicha DSCHINNI BLACK WIDOW', 'La chicha DSCHINNI BLACK WIDOW en verre de laboratoire avec trépied', 'chicha-dschinni-black-widow', 'https://www.el-badia.com/4270-home_default/xchicha-dschinni-black-widow.jpg.pagespeed.ic.9TKZNuQXLw.jpg', 399, 399, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 78, 1, 1, NULL, NULL),
(102, 1, 2, 'Chicha FUMO POD XL', 'La chicha FUMO POD XL ® en verre de laboratoire borosilicate avec tuyau à embout en verre, 80cm', 'chicha-fumo-pod-xl', 'https://www.el-badia.com/3868-home_default/xchicha-fumo-pod-xl.jpg.pagespeed.ic.QrryOA6ETg.jpg', 389, 389, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(103, 1, 2, 'Chicha FUMO POD XL ICE', 'La chicha FUMO POD XL ® ICE en verre de laboratoire borosilicate avec tuyau à embout en verre, 80cm', 'chicha-fumo-pod-xl-ice', 'https://www.el-badia.com/3869-home_default/xchicha-fumo-pod-xl-ice.jpg.pagespeed.ic.qwBqAN1nkb.jpg', 409, 409, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(104, 1, 2, 'Chicha DSCHINNI TRIPOD', 'La chicha DSCHINNI TRIPOD en&nbsp;verre de laboratoire avec trépied métal', 'chicha-dschinni-tripod', 'https://www.el-badia.com/4150-home_default/xchicha-dschinni-tripod.jpg.pagespeed.ic.TVtmAYEK2D.jpg', 399, 399, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 78, 1, 1, NULL, NULL),
(105, 1, 2, 'Chicha GLOSSY GOLD ®', 'Chicha&nbsp;GLOSSY Gold&nbsp;® en verre de laboratoire, 30cm, foyer verre, diffuseur intégré, tuyau silicone', 'chicha-glossy-gold-r', 'https://www.el-badia.com/3254-home_default/xchicha-glossy-gold.jpg.pagespeed.ic.1oKGL7SUME.jpg', 109, 109, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(106, 1, 2, 'Chicha HEAVEN by SD HOOKAH', 'Chicha en verre de laboratoire SD HOOKAH by SHAPES DESIGN, système LED tactile, 74cm', 'chicha-heaven-by-sd-hookah', 'https://www.el-badia.com/1669-home_default/xchicha-heaven-by-sd-hookah.jpg.pagespeed.ic.NKf9od2NXb.jpg', 349, 349, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(107, 1, 3, 'STEAMULATION PRO X Mini', 'Chicha STEAMULATION PRO X MINI, acier inoxydable, vase en cristal, 39cm, Click 360°, ultra réglable', 'steamulation-pro-x-mini', 'https://www.el-badia.com/11315-home_default/xsteamulation-pro-x-mini.jpg.pagespeed.ic.CwP6G1ityW.png', 209, 209, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(108, 1, 3, 'Pack EL-BADIA M5 QUASAR RAAS', 'Pack&nbsp; EL-BADIA M5 & QUASAR RAAS, chicha 43cm en acier inoxydable et insert en résine colorée. Fournie avec foyer thermique QUASAR RAAS,&nbsp; flexible silicone et manche inox assorti, diffuseur inclus et purge dissimulée sous lassiette.', 'pack-el-badia-m5-quasar-raas', 'https://www.el-badia.com/11563-home_default/xpack-el-badia-m5-quasar-raas.jpg.pagespeed.ic.ZjLxZlZ3La.png', 189, 189, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(109, 1, 3, 'STEAMULATION PRO X II', 'Chicha STEAMULATION CLASSIC PRO X II, en acier inoxydable, vase en cristal, 52cm, Click 360°,&nbsp;ultra réglable', 'steamulation-pro-x-ii', 'https://www.el-badia.com/10551-home_default/xsteamulation-pro-x-ii.jpg.pagespeed.ic.l8cDYvoB_D.jpg', 379, 379, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(110, 1, 3, 'Chicha EL-BADIA M5', 'Chicha EL-BADIA M5, 43cm, en acier inoxydable et insert en résine colorée. Fournie avec flexible silicone et manche inox assorti, diffuseur inclus et purge dissimulée sous lassiette.', 'chicha-el-badia-m5', 'https://www.el-badia.com/11516-home_default/xchicha-el-badia-m5.jpg.pagespeed.ic.xoCBQWaOM3.png', 139, 139, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(111, 1, 3, 'Chicha MS SCANDI 2.0', 'Chicha en verre MS SCANDI 2.0, haute de 25 cm, vase en verre&nbsp;suspendu&nbsp;sur un socle en bois.', 'chicha-ms-scandi-2-0', 'https://www.el-badia.com/9776-home_default/xchicha-ms-scandi-20.jpg.pagespeed.ic.oyURP5KGGB.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(112, 1, 3, 'STEAMULATION CLASSIC PRO X', 'Chicha STEAMULATION CLASSIC PRO X, en acier inoxydable, vase en cristal, 52cm, système Click 360°,&nbsp;plongeur réglable, débit dair réglable', 'steamulation-classic-pro-x', 'https://www.el-badia.com/7798-home_default/xsteamulation-classic-pro-x.jpg.pagespeed.ic.HnKJZ4fwOZ.jpg', 379, 379, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(113, 1, 3, 'Chicha ORDEN TESLA', 'Chicha ORDEN TESLA, 56cm, fabriquée en Russie, acier inoxydable avec insert en bois. Tuyau silicone, manche inox, diffuseur amovible et purge dissimulée.', 'chicha-orden-tesla', 'https://www.el-badia.com/9362-home_default/xchicha-orden-tesla.jpg.pagespeed.ic.BN_I0zsFrM.jpg', 199, 199, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 87, 1, 1, NULL, NULL),
(114, 1, 3, 'Steamulation PRO X II CRYSTAL', 'Chicha STEAMULATION CLASSIC PRO X II CRYSTAL, en acier inoxydable, vase en cristal ciselé, 52cm, Click 360°,&nbsp;ultra réglable', 'steamulation-pro-x-ii-crystal', 'https://www.el-badia.com/10562-home_default/xsteamulation-pro-x-2-crystal.jpg.pagespeed.ic.Qc8qtm21BM.jpg', 399, 399, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(115, 1, 3, 'Chicha WOOKAH WHITE BLACK CLICK', 'Chicha WOOKAH WHITE BLACK en bois noble, renforcé par de linox. 64cm, tuyau & foyer non inclus', 'chicha-wookah-white-black-click', 'https://www.el-badia.com/10566-home_default/xchicha-wookah-white-black.jpg.pagespeed.ic.7MHs98ULlL.jpg', 299, 299, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(116, 1, 3, 'Chicha STARBUZZ CARBINE HOOKAH', 'Chicha STARBUZZ CARBINE HOOKAH, 65cm, trépied télescopique, rotation 360°, système LED', 'chicha-starbuzz-carbine-hookah', 'https://www.el-badia.com/5201-home_default/xchicha-starbuzz-carbine-hookah.jpg.pagespeed.ic._MRlenYWbT.jpg', 269, 269, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(117, 1, 3, 'Chicha WOOKAH BLACK PINK Click', 'Chicha en bois noble WOOKAH, vase en cristal de haute qualité, haute de 64cm. Fourni sans tuyau et sans foyer.', 'chicha-wookah-black-pink-click', 'https://www.el-badia.com/6486-home_default/xwookah-black-pink-click.jpg.pagespeed.ic.Lc1d9yuhED.jpg', 299, 299, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(118, 1, 3, 'Chicha MOZE DASH BLACK COLOR', 'Chicha MOZE DASH BLACK COLOR, 50cm, en acier inoxydable et résine avec purge centrale qui renvoi la fumée vers le haut de la colonne', 'chicha-moze-dash-black-color', 'https://www.el-badia.com/9276-home_default/xchicha-moze-dash-black-color.jpg.pagespeed.ic.kQaFkpM4N8.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(119, 1, 3, 'Chicha Fumo MINI JAR MALLETTE', 'Chicha FUMO MINI JAR&nbsp;® en verre de laboratoire complète avec mallette, H=26cm, L=10cm', 'chicha-fumo-mini-jar-mallette', 'https://www.el-badia.com/11040-home_default/xchicha-fumo-mini-jar-mallette.jpg.pagespeed.ic.7rsJtW3Wsk.jpg', 245, 245, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(120, 1, 3, 'Chicha WOOKAH OAK CRYSTAL CLICK', 'Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni', 'chicha-wookah-oak-crystal-click', 'https://www.el-badia.com/6474-home_default/xwookah-oak-crystal-click.jpg.pagespeed.ic.2ZSqaIgX1_.jpg', 279, 279, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(121, 1, 3, 'Chicha WOOKAH MERBAU CRYSTAL CLICK', 'Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni.', 'chicha-wookah-merbau-crystal-click', 'https://www.el-badia.com/6494-home_default/xwookah-merbau-crystal-click.jpg.pagespeed.ic.vFekgI3i7r.jpg', 294, 294, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(122, 1, 3, 'Chicha WOOKAH IROKO CRYSTAL CLICK', 'Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni.', 'chicha-wookah-iroko-crystal-click', 'https://www.el-badia.com/6489-home_default/xwookah-iroko-crystal-click.jpg.pagespeed.ic.0gOFOAjPj7.jpg', 294, 294, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(123, 1, 3, 'Chicha WOOKAH TENEBRIS CLICK', 'Chicha en bois noble WOOKAH, vase en cristal de haute qualité, haute de 64cm. Fourni sans tuyau et sans foyer.', 'chicha-wookah-tenebris-click', 'https://www.el-badia.com/6482-home_default/xwookah-tenebris-click.jpg.pagespeed.ic.pkD5f0LKVv.jpg', 299, 299, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(124, 1, 3, 'Chicha WOOKAH ARCTIC BLUE CLICK', 'Chicha en bois noble WOOKAH, vase en cristal de haute qualité, haute de 64cm. Fourni sans tuyau et sans foyer.', 'chicha-wookah-arctic-blue-click', 'https://www.el-badia.com/6488-home_default/xwookah-arctic-blue-click.jpg.pagespeed.ic.gX4NKFltqf.jpg', 299, 299, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(125, 1, 3, 'Chicha NA GRANI STICK', 'CHICHA NA GRANI STICK, 50cm, en acier inoxydable, fabriquée en Russie', 'chicha-na-grani-stick', 'https://www.el-badia.com/10339-home_default/xchicha-na-grani-stick.jpg.pagespeed.ic.8VdE3-E0L7.png', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 81, 1, 1, NULL, NULL),
(126, 1, 3, 'Chicha CARTEL PABLO', 'Chicha CARTEL PABLO, 50cm, en acier inoxydable, système click, cut 18/8, colonie interchangeable, diffuseur réglable, purge 360°', 'chicha-cartel-pablo', 'https://www.el-badia.com/6969-home_default/xchicha-cartel-pablo.jpg.pagespeed.ic._4zGNZkjQV.jpg', 169, 169, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(127, 1, 3, 'Chicha CARTEL FAME', 'Chicha CARTEL FAME, 53cm, en acier inoxydable, système de filetage, diffuseur réglable, purge 360°', 'chicha-cartel-fame', 'https://www.el-badia.com/10113-home_default/xchicha-cartel-fame.jpg.pagespeed.ic.DMkudV8w4i.jpg', 219, 219, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(128, 1, 3, 'STEAMULATION CLASSIC PLATINIUM', 'Chicha STEAMULATION CLASSIC PLATINIUM, en cristal et acier inoxydable avec système de rotation 360°', 'steamulation-classic-platinium', 'https://www.el-badia.com/5042-home_default/xsteamulation-classic-platinum.jpg.pagespeed.ic.Vu-a5TiJT2.jpg', 299, 299, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(129, 1, 3, 'Chicha UNITY PURE S', 'La chicha UNITY PURE S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en terre cuite', 'chicha-unity-pure-s', 'https://www.el-badia.com/3699-home_default/xchicha-unity-pure-s.jpg.pagespeed.ic.Z9QoXaVMhg.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(130, 1, 3, 'Chicha WOOKAH WENGE CRYSTAL CLICK', 'Chicha en bois noble WOOKAH, vase en&nbsp;bois renforcé, haute de 64cm. Fourni sans tuyau et sans foyer.', 'chicha-wookah-wenge-crystal-click', 'https://www.el-badia.com/6553-home_default/xwookah-wenge-crystal-click.jpg.pagespeed.ic.eGs-xYBZKo.jpg', 334, 334, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(131, 1, 3, 'Chicha RETROFIT OPTIMA BLACK', 'Chicha RETROFIT OPTIMA BLACK, marque russe, 60 cm, acier inoxydable 304 et polyacétal (POM), mécanisme de réglage du diffuseur, tuyau silicone et manche inoxydable inclus', 'chicha-retrofit-optima-black', 'https://www.el-badia.com/10496-home_default/xchicha-retrofit-optima-black.jpg.pagespeed.ic.G7uKPjDapP.jpg', 239, 239, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 66, 1, 1, NULL, NULL),
(132, 1, 3, 'Chicha WOOKAH NOX CLICK', 'Chicha en bois noble WOOKAH, vase en cristal&nbsp;sans motifs, haute de 64cm. Fourni sans tuyau et sans foyer.', 'chicha-wookah-nox-click', 'https://www.el-badia.com/10785-home_default/xwookah-nox-click.jpg.pagespeed.ic.ZAxGqn3BRj.jpg', 334, 334, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(133, 1, 3, 'Chicha MAKLAUD HERO X GAZZIK', 'Chicha MAKLAUD HERO X GAZZIK, 70cm, fabriquée en Russie, en acier inoxydable AISI 304 et insert en laiton', 'chicha-maklaud-hero-x-gazzik', 'https://www.el-badia.com/11003-home_default/xmaklaud-hero-x-gazzik.jpg.pagespeed.ic.0qjwIXqgJn.png', 299, 299, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 61, 1, 1, NULL, NULL),
(134, 1, 3, 'Chicha WOOKAH NOX WHITE CLICK', 'Chicha en bois noble WOOKAH, vase en cristal de haute qualité, haute de 64cm. Fourni sans tuyau et sans foyer.', 'chicha-wookah-nox-white-click', 'https://www.el-badia.com/6487-home_default/xwookah-nox-white-click.jpg.pagespeed.ic.m6gcx0zyo9.jpg', 334, 334, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(135, 1, 3, 'Chicha FUMO MINI JAR', 'Chicha FUMO MINI JAR&nbsp;® en verre de laboratoire complète, H=26cm, L=10cm', 'chicha-fumo-mini-jar', 'https://www.el-badia.com/11155-home_default/xchicha-fumo-mini-jar.jpg.pagespeed.ic.kEaGNuS2ZQ.jpg', 215, 215, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(136, 1, 3, 'Chicha EMBERY MONO EVO', 'Chicha EMBERY MONO EVO, 61 cm, acier inoxydable & POM, tuyau silicone', 'chicha-embery-mono-evo', 'https://www.el-badia.com/7864-home_default/xchicha-embery-mono-evo.jpg.pagespeed.ic.IdvNqE2jFD.jpg', 199, 199, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(137, 1, 3, 'Chicha WOOKAH WALNUT CRYSTAL CLICK', 'Chicha en bois noble WOOKAH, vase en cristal gravée, haute de 64cm. Système CLICK. Tuyau et foyer non fourni.', 'chicha-wookah-walnut-crystal-click', 'https://www.el-badia.com/6503-home_default/xwookah-walnut-crystal-click.jpg.pagespeed.ic.AETXrP11ZL.jpg', 314, 314, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(138, 1, 3, 'Chicha MIG AIR FORCE S TRIANGLE CLASSIC', 'Chicha MIG AIR FORCE S&nbsp;TRIANGLE CLASSIC, 33cm, en acier inoxydable et verre de Bohême, de la marque allemande MIG', 'chicha-mig-air-force-s-triangle-classic', 'https://www.el-badia.com/9018-home_default/xmig-air-force-s-triangle-classic.jpg.pagespeed.ic.Ay7ARiy_yq.png', 229, 229, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 58, 1, 1, NULL, NULL),
(139, 1, 3, 'Chicha CARTEL PABLO GOLD', 'Chicha CARTEL PABLO GOLD, 50cm, en acier inoxydable, système click, cut 18/8, colonie interchangeable, diffuseur réglable, purge 360°', 'chicha-cartel-pablo-gold', 'https://www.el-badia.com/11021-home_default/xchicha-cartel-pablo-gold.jpg.pagespeed.ic.WCpyASG9ao.png', 179, 179, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(140, 1, 3, 'Chicha MAKLAUD DZEN SKULL', 'Chicha Maklaud Dzen F/Skull K, en acier inoxydable et polyacétal, haute de 55 cm.', 'chicha-maklaud-dzen-skull', 'https://www.el-badia.com/10598-home_default/xchicha-maklaud-dzen-skull.jpg.pagespeed.ic.-x_oc_aFGO.jpg', 239, 239, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 61, 1, 1, NULL, NULL),
(141, 1, 3, 'Chicha EMBERY MONO WAVE', 'Chicha EMBERY MONO WAVE, 61 cm, inox & aluminium anodisé, tuyau silicone', 'chicha-embery-mono-wave', 'https://www.el-badia.com/6746-home_default/xchicha-embery-mono-wave.jpg.pagespeed.ic.a8XohBrlia.jpg', 199, 199, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(142, 1, 3, 'Chicha KALOUD KRYSALIS CALIX LOTUS II ® Bundle', 'Chicha KALOUD KRYSALIS CALIX ® LOTUS II Bundle : pack chicha KRYSALIS CALIX ® avec foyer SAMSARIS VITRA pour KRYSALIS ®, KALOUD LOTUS II&nbsp;®, tuyau AEOLIS&nbsp;® et adaptateur foyer KALOUD KRYSALIS&nbsp;®', 'chicha-kaloud-krysalis-calix-lotus-ii-r-bundle', 'https://www.el-badia.com/11609-home_default/xchicha-kaloud-krysalys-calix-lotus-ii-bundle.jpg.pagespeed.ic.0xoRzUHJFh.png', 469, 469, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 45, 1, 1, NULL, NULL),
(143, 1, 3, 'Chicha KORESS HOOKAH', 'Chicha KORESS HOOKAH, 52cm, acier inoxydable et polyoxyméthylène, diffuseur avec régulateur sur le corps, tuyau silicone et manche métal fournis', 'chicha-koress-hookah', 'https://www.el-badia.com/9717-home_default/xchicha-koress-hookah.jpg.pagespeed.ic.qNPLVjjnqJ.jpg', 259, 259, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(144, 1, 3, 'Chicha MAKLAUD RUSSIAN SPIRIT Aluminium', 'Chicha Maklaud Lady, en aluminium, haute de 75 cm, fourni avec manche et tuyau.', 'chicha-maklaud-russian-spirit-aluminium', 'https://www.el-badia.com/10690-home_default/xchicha-maklaud-russian-spirit.jpg.pagespeed.ic.c9kuiGagUp.jpg', 235, 235, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 61, 1, 1, NULL, NULL);
INSERT INTO `product` (`id`, `category_id`, `sous_category_id`, `nom`, `content`, `slug`, `image`, `price`, `price_ht`, `promotion`, `nouveaute`, `color_id`, `taille`, `vase`, `tuyau`, `fixation`, `autre`, `publie`, `is_best`, `marque_id`, `gramme`, `en_stock`, `quantite`, `intro`) VALUES
(145, 1, 3, 'Chicha EMBERY MONO-H', 'Chicha EMBERY MONO-H, 61 cm, inox & aluminium anodisé, tuyau silicone', 'chicha-embery-mono-h', 'https://www.el-badia.com/5636-home_default/xchicha-embery-mono-h.jpg.pagespeed.ic.0dtkxHroNQ.jpg', 199, 199, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(146, 1, 3, 'Chicha UNITY PURE STRIPES S', 'La chicha UNITY PURE&nbsp;STRIPES S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en&nbsp;silicone', 'chicha-unity-pure-stripes-s', 'https://www.el-badia.com/10536-home_default/xchicha-unity-pure-stripes-s.jpg.pagespeed.ic.IvkPJfxbSG.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(147, 1, 3, 'Chicha MIG AIR FORCE S DELUXE CLASSIC', 'Chicha&nbsp;MIG AIR FORCE S DELUXE CLASSIC, 33cm, en acier inoxydable et verre de Bohême,&nbsp;de la marque allemande MIG', 'chicha-mig-air-force-s-deluxe-classic', 'https://www.el-badia.com/9029-home_default/xmig-air-force-s-deluxe-classic.jpg.pagespeed.ic._2K0mov3As.jpg', 219, 219, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 58, 1, 1, NULL, NULL),
(148, 1, 3, 'Chicha EMBERY MONO WOOD', 'Chicha EMBERY MONO WOOD, 61 cm, inox & bois, tuyau silicone', 'chicha-embery-mono-wood', 'https://www.el-badia.com/8202-home_default/xchicha-embery-mono-wood.jpg.pagespeed.ic.kEz_bfxY5E.jpg', 179, 179, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(149, 1, 3, 'Chicha CAPSULE ONE', 'Chicha CAPSULE ONE, fabriqué en Russie, 52cm, en acier inoxydable, fourni avec tuyau silicone et manche en métal', 'chicha-capsule-one', 'https://www.el-badia.com/10332-home_default/xchicha-capsule-one.jpg.pagespeed.ic.wzZ7XF0vqK.png', 289, 289, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 89, 1, 1, NULL, NULL),
(150, 1, 3, 'Chicha MAKLAUD SKULL ALUMLINIUM', 'Chicha Maklaud Skull, en aluminium, haute de 70 cm, fourni avec manche et tuyau.', 'chicha-maklaud-skull-alumlinium', 'https://www.el-badia.com/10691-home_default/xchicha-maklaud-skull.jpg.pagespeed.ic.yNPW9mr4so.jpg', 199, 199, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 61, 1, 1, NULL, NULL),
(151, 1, 3, 'Chicha MIG X EL-BADIA', 'La chicha MIG X EL-BADIA est une chicha compacte de la marque allemande MIG en collaboration avec EL-BADIA, 32cm', 'chicha-mig-x-el-badia', 'https://www.el-badia.com/9767-home_default/xchicha-mig-x-el-badia.jpg.pagespeed.ic.SK3UfjmSCf.png', 229, 229, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 58, 1, 1, NULL, NULL),
(152, 1, 3, 'Chicha RETROFIT AMALGAM', 'Chicha RETROFIT AMALGAM, marque russe, 60 cm, acier inoxydable 304, mécanisme de réglage du diffuseur, tuyau silicone et manche inoxydable inclus', 'chicha-retrofit-amalgam', 'https://www.el-badia.com/10500-home_default/xchicha-retrofit-amalgam.jpg.pagespeed.ic.bewjpHrFTG.jpg', 269, 269, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 66, 1, 1, NULL, NULL),
(153, 1, 3, 'Chicha Fumo MINI TANK MALLETTE', 'Chicha FUMO MINI TANK ® en verre de laboratoire complète avec mallette, H=17cm, L=21cm', 'chicha-fumo-mini-tank-mallette', 'https://www.el-badia.com/11039-home_default/xchicha-fumo-mini-tank-mallette.jpg.pagespeed.ic.HB4qfK32Fv.jpg', 275, 275, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(154, 1, 3, 'Chicha MAKLAUD HERO X GORDI', 'Chicha MAKLAUD HERO X GORDI, 70cm, fabriquée en Russie, en acier inoxydable AISI 304 et insert en laiton', 'chicha-maklaud-hero-x-gordi', 'https://www.el-badia.com/10646-home_default/xmaklaud-hero-x-gordi.jpg.pagespeed.ic.GHw-drMy8j.jpg', 299, 299, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 61, 1, 1, NULL, NULL),
(155, 1, 3, 'Chicha FUMO MINI TANK', 'Chicha FUMO MINI TANK ® en verre de laboratoire avec tuyau à embout en verre, H=17cm, L=21cm', 'chicha-fumo-mini-tank', 'https://www.el-badia.com/11154-home_default/xchicha-fumo-mini-tank-.jpg.pagespeed.ic.tzbm1tKoyi.png', 245, 245, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(156, 1, 3, 'Chicha UNITY PURE DOTS S', 'La chicha UNITY PURE DOTS S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en silicone', 'chicha-unity-pure-dots-s', 'https://www.el-badia.com/7182-home_default/xchicha-unity-pure-dots-s.jpg.pagespeed.ic.71QraREcCH.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(157, 1, 3, 'Chicha UNITY PURE DOTS S', 'La chicha UNITY PURE DOTS S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en silicone', 'chicha-unity-pure-dots-s', 'https://www.el-badia.com/7182-home_default/xchicha-unity-pure-dots-s.jpg.pagespeed.ic.71QraREcCH.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(158, 1, 3, 'Chicha UNITY PURE DOTS S', 'La chicha UNITY PURE DOTS S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en silicone', 'chicha-unity-pure-dots-s', 'https://www.el-badia.com/7182-home_default/xchicha-unity-pure-dots-s.jpg.pagespeed.ic.71QraREcCH.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(159, 1, 3, 'Chicha UNITY PURE DOTS S', 'La chicha UNITY PURE DOTS S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en silicone', 'chicha-unity-pure-dots-s', 'https://www.el-badia.com/7182-home_default/xchicha-unity-pure-dots-s.jpg.pagespeed.ic.71QraREcCH.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(160, 1, 3, 'Chicha UNITY PURE DOTS S', 'La chicha UNITY PURE DOTS S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en silicone', 'chicha-unity-pure-dots-s', 'https://www.el-badia.com/7182-home_default/xchicha-unity-pure-dots-s.jpg.pagespeed.ic.71QraREcCH.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(161, 1, 3, 'Chicha UNITY PURE DOTS S', 'La chicha UNITY PURE DOTS S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en silicone', 'chicha-unity-pure-dots-s', 'https://www.el-badia.com/7182-home_default/xchicha-unity-pure-dots-s.jpg.pagespeed.ic.71QraREcCH.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(162, 1, 3, 'Chicha UNITY PURE DOTS S', 'La chicha UNITY PURE DOTS S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en silicone', 'chicha-unity-pure-dots-s', 'https://www.el-badia.com/7182-home_default/xchicha-unity-pure-dots-s.jpg.pagespeed.ic.71QraREcCH.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(163, 1, 3, 'Chicha UNITY PURE DOTS S', 'La chicha UNITY PURE DOTS S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en silicone', 'chicha-unity-pure-dots-s', 'https://www.el-badia.com/7182-home_default/xchicha-unity-pure-dots-s.jpg.pagespeed.ic.71QraREcCH.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(164, 1, 4, 'Chicha EL-BADIA C5', 'Chicha EL-BADIA C5, 43cm, vase en verre CLICK, CUT de colonne 18/8 fourni avec tuyau silicone, manche métallique et foyer avec système de chauffe type cheminée.', 'chicha-el-badia-c5', 'https://www.el-badia.com/9179-home_default/xchicha-el-badia-c5.jpg.pagespeed.ic.rjyJKOJ2fs.jpg', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(165, 1, 4, 'Chicha CELESTE X3 CLICK', 'Chicha CELESTE X3, 36cm, avec vase en verre et fixation CLICK', 'chicha-celeste-x3-click', 'https://www.el-badia.com/10257-home_default/xchicha-celeste-x3-click.jpg.pagespeed.ic.l-KbJPtdUD.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(166, 1, 4, 'Chicha EL-BADIA XS', 'Chicha EL-BADIA XS, 21cm, compacte et nomade, vase en verre, foyer et tuyaux fournis', 'chicha-el-badia-xs', 'https://www.el-badia.com/9063-home_default/xchicha-el-badia-xs.jpg.pagespeed.ic.gqQSy_dym8.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(167, 1, 4, 'Chicha EL-BADIA C1', 'Chicha EL-BADIA C1, haute de 31cm, cette chicha chamboule les codes avec un tout nouveau vase en verre doté dun système click.', 'chicha-el-badia-c1', 'https://www.el-badia.com/9076-home_default/xchicha-el-badia-c1.jpg.pagespeed.ic.L-l4b68jQc.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(168, 1, 4, 'Pack EL-BADIA M5 QUASAR RAAS', 'Pack&nbsp; EL-BADIA M5 & QUASAR RAAS, chicha 43cm en acier inoxydable et insert en résine colorée. Fournie avec foyer thermique QUASAR RAAS,&nbsp; flexible silicone et manche inox assorti, diffuseur inclus et purge dissimulée sous lassiette.', 'pack-el-badia-m5-quasar-raas', 'https://www.el-badia.com/11563-home_default/xpack-el-badia-m5-quasar-raas.jpg.pagespeed.ic.ZjLxZlZ3La.png', 189, 189, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(169, 1, 4, 'Chicha EL-BADIA C7', 'Chicha EL-BADIA C7, 56 cm, vase en verre CLICK, CUT de colonne 18/8, tuyau silicone et foyer avec système de chauffe type cheminée', 'chicha-el-badia-c7', 'https://www.el-badia.com/9192-home_default/xchicha-el-badia-c7.jpg.pagespeed.ic.6BxrkPFrie.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(170, 1, 4, 'Chicha CELESTE JUNIOR 2.0', 'La chicha CELESTE JUNIOR 2.0, la référence du narguilé EL-BADIA, fourni avec tuyau, foyer en céramique, une brosse dentretien et une pince.', 'chicha-celeste-junior-2-0', 'https://www.el-badia.com/9080-home_default/xchicha-celeste-junior-20.jpg.pagespeed.ic.CzkTIrQYRL.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(171, 1, 4, 'Chicha CELESTE JUNIOR 2.0 CAMO', 'Chicha CELESTE JUNIOR 2.0 CAMO, cm37, vase acry, couleurs camouflage', 'chicha-celeste-junior-2-0-camo', 'https://www.el-badia.com/9130-home_default/xchicha-celeste-junior-20-camo.jpg.pagespeed.ic.AhDpu_gDpv.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(172, 1, 4, 'Chicha CELESTE X1', 'La chicha X1 de la gamme la plus célèbre de chicha, CELESTE, compacte de 25cm, tuyau et foyer inclus', 'chicha-celeste-x1', 'https://www.el-badia.com/9138-home_default/xchicha-celeste-x1.jpg.pagespeed.ic.YaHNIIvAOD.jpg', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(173, 1, 4, 'Chicha CELESTE CRAZY', 'Chicha CELESTE X3, 36cm, avec vase en verre et fixation CLICK et coloris type graffiti', 'chicha-celeste-crazy', 'https://www.el-badia.com/9198-home_default/xchicha-celeste-crazy.jpg.pagespeed.ic.s5tvpl52F0.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(174, 1, 4, 'Chicha EL-BADIA P1', 'Chicha EL-BADAI P1, chicha transportable avec tuyau&nbsp;en silicone et foyer à double capacité&nbsp;', 'chicha-el-badia-p1', 'https://www.el-badia.com/7012-home_default/xchicha-el-badia-p1.jpg.pagespeed.ic.OH_zNsAgsv.png', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(175, 1, 4, 'Chicha Celeste X3', 'Issue de la gamme de chicha CELESTE, voici la EL-BADIA CELESTE X3,', 'chicha-celeste-x3', 'https://www.el-badia.com/9099-home_default/xchicha-celeste-x3.jpg.pagespeed.ic.PJFmhWQp8W.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(176, 1, 4, 'Chicha CELESTE X1 EDITION SPECIALE', 'Chicha CELESTE X1&nbsp;édition spéciale', 'chicha-celeste-x1-edition-speciale', 'https://www.el-badia.com/9174-home_default/xchicha-celeste-x1-edition-speciale.jpg.pagespeed.ic.qzwoVtxn1O.jpg', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(177, 1, 4, 'Chicha CELESTE X3 EDITION SPECIALE', 'Chicha CELESTE X3 édition spéciale: Woodland Army, Lava et Black Marble', 'chicha-celeste-x3-edition-speciale', 'https://www.el-badia.com/9153-home_default/xchicha-celeste-x3-edition-spe.jpg.pagespeed.ic.jUuyt8O9pr.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(178, 1, 4, 'Chicha MVP 360', 'Chicha MVP 360 en acier inoxydable, complète avec tuyau silicone et foyer', 'chicha-mvp-360', 'https://www.el-badia.com/7713-home_default/xchicha-mvp-360.jpg.pagespeed.ic.xCzVxtvPZk.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(179, 1, 4, 'Chicha MVP 360 GOLD EDITION', 'Chicha MVP 360 GOLD EDITION en acier inoxydable, complète avec tuyau silicone et foyer', 'chicha-mvp-360-gold-edition', 'https://www.el-badia.com/10248-home_default/xchicha-mvp-360-gold-edition.jpg.pagespeed.ic.YuJihwrap6.png', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(180, 1, 4, 'Chicha MS MICRO', 'Chicha MS MICRO en acrylique et aluminium, tuyau silicone et manche fournis', 'chicha-ms-micro', 'https://www.el-badia.com/4430-home_default/xchicha-ms-micro.jpg.pagespeed.ic.azOigeEfeN.jpg', 120, 120, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(181, 1, 4, 'Scorpio Stinger Carbon', 'Chicha SCORPIO&nbsp;CARBON, 38 cm, colonne en finition carbone, tuyau et foyer silicone fournis', 'scorpio-stinger-carbon', 'https://www.el-badia.com/5437-home_default/xscorpio-stinger-carbon.jpg.pagespeed.ic.7aP1CpgN_A.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 34, 1, 1, NULL, NULL),
(182, 1, 4, 'Chicha Oduman Micro', 'Chicha ODUMAN MICRO, 17cm avec sacoche de transport , tuyau silicone, ressort et diffuseur', 'chicha-oduman-micro', 'https://www.el-badia.com/10814-home_default/xchicha-oduman-micro.jpg.pagespeed.ic.OgD36ePSrG.png', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(183, 1, 4, 'Chicha MS TOKYO 2.0', 'Chicha MS TOKYO 2.0, 30cm, fournie avec sacoche de transport, tuyau silicone et manche en alu, foyer silicone.', 'chicha-ms-tokyo-2-0', 'https://www.el-badia.com/9009-home_default/xchicha-ms-tokyo-20.jpg.pagespeed.ic.43xCO8GUHJ.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(184, 1, 4, 'Chicha MS VENOM Camo', 'Chicha MS VENOM CAMO, 60cm, montée sur pieds, avec tuyau silicone, manche et foyer en silicone.', 'chicha-ms-venom-camo', 'https://www.el-badia.com/6724-home_default/xchicha-ms-venom-camo.jpg.pagespeed.ic.YW3s7aaywr.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(185, 1, 4, 'Chicha BRODATOR 320 MINI', 'Chicha BRODATOR 320 MINI, 32cm en inox, sac de transport, tuyau silicone et foyer en terre cuite', 'chicha-brodator-320-mini', 'https://www.el-badia.com/10068-home_default/xchicha-brodator-320-mini.jpg.pagespeed.ic.fhEjeNWsWi.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 23, 1, 1, NULL, NULL),
(186, 1, 4, 'Chicha EL-BADIA M5', 'Chicha EL-BADIA M5, 43cm, en acier inoxydable et insert en résine colorée. Fournie avec flexible silicone et manche inox assorti, diffuseur inclus et purge dissimulée sous lassiette.', 'chicha-el-badia-m5', 'https://www.el-badia.com/11516-home_default/xchicha-el-badia-m5.jpg.pagespeed.ic.xoCBQWaOM3.png', 139, 139, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(187, 1, 4, 'Chicha ODUMAN N5-Z JUNIOR', 'La chicha ODUMAN N5-Z JUNIOR est une chicha en verre suspendue sur un socle métallique, 24cm', 'chicha-oduman-n5-z-junior', 'https://www.el-badia.com/3509-home_default/xchicha-oduman-n5-z-junior.jpg.pagespeed.ic.WF6ukoYRER.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(188, 1, 4, 'Chicha MVP 500', 'Chicha Aladin&nbsp;MVP 500 an acier inoxydable V2A, kit complet, fourni avec tuyau en silicone, manche en aluminium et kit cheminée', 'chicha-mvp-500', 'https://www.el-badia.com/6291-home_default/xchicha-mvp-500.jpg.pagespeed.ic.obg1Zfbr9i.jpg', 119, 119, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(189, 1, 4, 'Chicha Oduman MONSTER', 'Chicha ODUMAN MONSTER, 23 cm, fournie avec une sacoche, un tuyau silicone, manche en alu et ressort.', 'chicha-oduman-monster', 'https://www.el-badia.com/6387-home_default/xchicha-oduman-monster.jpg.pagespeed.ic.ieCmcNW-Nr.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(190, 1, 4, 'Chicha MS TOKYO', 'Chicha transportable MS TOKYO, pack complet, facilement transportable.', 'chicha-ms-tokyo', 'https://www.el-badia.com/6661-home_default/xchicha-ms-tokyo.jpg.pagespeed.ic.YraCO6KsX5.jpg', 59, 59, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(191, 1, 4, 'Chicha Cartel Havana', '', 'chicha-cartel-havana', 'https://www.el-badia.com/10912-home_default/xchicha-cartel-havana.jpg.pagespeed.ic.UfAYX4IBGl.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(192, 1, 4, 'Chicha ODUMAN N9 SPIDER', 'La chicha ODUMAN N9&nbsp;SPIDER est une chicha en verre suspendue sur un socle métallique, 25cm', 'chicha-oduman-n9-spider', 'https://www.el-badia.com/10530-home_default/xchicha-oduman-n9-spider.jpg.pagespeed.ic.Q0INuZOE8b.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(193, 1, 4, 'Chicha ODUMAN N8 VOYAGE', 'Chicha ODUMAN N8 VOYAGE en verre, compacte 20cm, avec sacoche de transport et tuyau silicone', 'chicha-oduman-n8-voyage', 'https://www.el-badia.com/4070-home_default/xchicha-oduman-n8-voyage.jpg.pagespeed.ic.u-biqbP5mp.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(194, 1, 4, 'Chicha MS BEIRUT', 'Chicha MS BEIRUT, 43cm, fournie avec tuyau en silicone manche carbone, foyer silicone, diffuseur intégré et soupape dissimulée', 'chicha-ms-beirut', 'https://www.el-badia.com/9008-home_default/xchicha-ms-beirut.jpg.pagespeed.ic.kkQSBvQ0x-.jpg', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 34, 1, 1, NULL, NULL),
(195, 1, 4, 'Chicha MYA MELINA', 'Chicha MYA MELINA, 46 cm, vase click, fournie avec&nbsp; foyer, tuyau silicone et manche en métal', 'chicha-mya-melina', 'https://www.el-badia.com/4116-home_default/xchicha-mya-melina.jpg.pagespeed.ic.Wy6TYLumzf.jpg', 59, 59, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 113, 1, 1, NULL, NULL),
(196, 1, 4, 'Chicha MOZE DASH BLACK', 'Chicha MOZE DASH BLACK, 50cm, en acier inoxydable et PMO avec purge centrale qui renvoi la fumée vers le haut de la colonne', 'chicha-moze-dash-black', 'https://www.el-badia.com/9275-home_default/xchicha-moze-dash-black.jpg.pagespeed.ic.2oaM51ycL2.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(197, 1, 4, 'Chicha QT', 'Lincontournable&nbsp;chicha QT de chez MYA, 32cm, fournit dans sa cage avec tuyau et foyer, la&nbsp;référence', 'chicha-qt', 'https://www.el-badia.com/1886-home_default/xchicha-qt-.jpg.pagespeed.ic.XWRuYtASus.jpg', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 113, 1, 1, NULL, NULL),
(198, 1, 4, 'Chicha UNITY PURE S', 'La chicha UNITY PURE S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en terre cuite', 'chicha-unity-pure-s', 'https://www.el-badia.com/3699-home_default/xchicha-unity-pure-s.jpg.pagespeed.ic.Z9QoXaVMhg.jpg', 149, 149, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(199, 1, 4, 'Chicha MOZE DASH WHITE COLOR', 'Chicha MOZE DASH&nbsp;WHITE COLOR, 50cm, en acier inoxydable et résine avec purge centrale qui renvoi la fumée vers le haut de la colonne', 'chicha-moze-dash-white-color', 'https://www.el-badia.com/9262-home_default/xchicha-moze-dash-white-color.jpg.pagespeed.ic.P82HC6zNzD.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(200, 1, 4, 'Chicha VENTO', 'Chicha VENTO de chez MYA, 33cm, fournit dans sa cage avec tuyau et foyer, la&nbsp;référence qualité prix!', 'chicha-vento', 'https://www.el-badia.com/1893-home_default/xchicha-vento.jpg.pagespeed.ic.v0m9CmR1qs.jpg', 45, 45, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 113, 1, 1, NULL, NULL),
(201, 1, 4, 'Chicha MS COSMOPOLITAN', 'Chicha MS COSMOPOLITAN, 31 cm, avec manche en verre et tuyau silicone', 'chicha-ms-cosmopolitan', 'https://www.el-badia.com/3497-home_default/xchicha-ms-cosmopolitan.jpg.pagespeed.ic.I2fVBaKITy.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(202, 1, 4, 'Chicha EMBERY MONO WAVE', 'Chicha EMBERY MONO WAVE, 61 cm, inox & aluminium anodisé, tuyau silicone', 'chicha-embery-mono-wave', 'https://www.el-badia.com/6746-home_default/xchicha-embery-mono-wave.jpg.pagespeed.ic.a8XohBrlia.jpg', 199, 199, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(203, 1, 4, 'KIT CHICHA', 'Le KIT CHICHA pour bouteilles : permet de transformer vos bouteilles en verre en véritables chichas', 'kit-chicha', 'https://www.el-badia.com/3696-home_default/xkit-chicha.jpg.pagespeed.ic.iwkD1ojyOh.jpg', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(204, 1, 4, 'Chicha CARTEL HAVANA S', 'Chicha CARTEL HAVANA S, 35cm, foyer STARK, tuyau et manche silicone, diffuseur, purge dissimulée et plateau ciselé WOLF', 'chicha-cartel-havana-s', 'https://www.el-badia.com/10996-home_default/xchicha-cartel-havana-s.jpg.pagespeed.ic.ZQeUrJAGph.png', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(205, 1, 4, 'Chicha EMBERY MONO-H', 'Chicha EMBERY MONO-H, 61 cm, inox & aluminium anodisé, tuyau silicone', 'chicha-embery-mono-h', 'https://www.el-badia.com/5636-home_default/xchicha-embery-mono-h.jpg.pagespeed.ic.0dtkxHroNQ.jpg', 199, 199, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(206, 1, 4, 'Chicha UNITY PURE STRIPES S', 'La chicha UNITY PURE&nbsp;STRIPES S, 50 cm, vase en cristal et manche en verre ainsi quun foyer en&nbsp;silicone', 'chicha-unity-pure-stripes-s', 'https://www.el-badia.com/10536-home_default/xchicha-unity-pure-stripes-s.jpg.pagespeed.ic.IvkPJfxbSG.jpg', 159, 159, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(207, 1, 4, 'Chicha MS VENOM', 'Chicha MS VENOM, 60cm, montée sur pieds, avec tuyau silicone, manche et foyer en silicone.', 'chicha-ms-venom', 'https://www.el-badia.com/5424-home_default/xchicha-ms-venom.jpg.pagespeed.ic.oxV3mKauET.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(208, 1, 4, 'Chicha ODUMAN N2 TRAVEL', 'La chicha ODUMAN N2 TRAVEL en verre, compacte 18cm, avec sacoche de transport et tuyau silicone', 'chicha-oduman-n2-travel', 'https://www.el-badia.com/10532-home_default/xchicha-oduman-n2-travel.jpg.pagespeed.ic.PttnNxpIWB.jpg', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(209, 1, 4, 'Chicha Minotor', 'Chicha MINOTOR, 49cm, acier inoxydable, système click, fourni sans tuyau et foyer', 'chicha-minotor', 'https://www.el-badia.com/4911-home_default/xchicha-minotor.jpg.pagespeed.ic.fwczDGibiI.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(210, 1, 4, 'Chicha MVP 360 EPOX', 'Chicha MVP 360 EPOXY en acier inoxydable, complète avec tuyau silicone et foyer', 'chicha-mvp-360-epox', 'https://www.el-badia.com/10787-home_default/xchicha-mvp-360-epox.jpg.pagespeed.ic._qwBsJdbVW.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 20, 1, 1, NULL, NULL),
(211, 1, 4, 'Chicha PRISMA ONE AQUA', 'Chicha STEAMULATION PRISMA ONE, 51cm de hauteur, entièrement en acier inoxydable, vase en couleur Aqua', 'chicha-prisma-one-aqua', 'https://www.el-badia.com/7753-home_default/xchicha-prisma-one-aqua.jpg.pagespeed.ic.8hXocFq4uq.jpg', 179, 179, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(212, 1, 4, 'Chicha BAMBINO', 'Chicha BAMBINO de marque MYA, 27cm, colonne ornée de motifs, avec malette de transport, tuyau, foyer', 'chicha-bambino', 'https://www.el-badia.com/345-home_default/xchicha-bambino-.jpg.pagespeed.ic.gce-5D7XWo.jpg', 45, 45, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 113, 1, 1, NULL, NULL),
(213, 1, 4, 'Chicha CELESTE 2.0', 'Chicha CELESTE 2.0, 50cm, un des musts de chez EL-BADIA, vase acry, tuyau, foyer, pince et brosse&nbsp;', 'chicha-celeste-2-0', 'https://www.el-badia.com/676-home_default/xchicha-celeste-20.jpg.pagespeed.ic.TO0VosfMtm.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(214, 1, 4, 'Chicha CELESTE 2.0', 'Chicha CELESTE 2.0, 50cm, un des musts de chez EL-BADIA, vase acry, tuyau, foyer, pince et brosse&nbsp;', 'chicha-celeste-2-0', 'https://www.el-badia.com/676-home_default/xchicha-celeste-20.jpg.pagespeed.ic.TO0VosfMtm.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(215, 1, 4, 'Chicha CELESTE 2.0', 'Chicha CELESTE 2.0, 50cm, un des musts de chez EL-BADIA, vase acry, tuyau, foyer, pince et brosse&nbsp;', 'chicha-celeste-2-0', 'https://www.el-badia.com/676-home_default/xchicha-celeste-20.jpg.pagespeed.ic.TO0VosfMtm.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(216, 1, 4, 'Chicha CELESTE 2.0', 'Chicha CELESTE 2.0, 50cm, un des musts de chez EL-BADIA, vase acry, tuyau, foyer, pince et brosse&nbsp;', 'chicha-celeste-2-0', 'https://www.el-badia.com/676-home_default/xchicha-celeste-20.jpg.pagespeed.ic.TO0VosfMtm.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(217, 1, 4, 'Chicha CELESTE 2.0', 'Chicha CELESTE 2.0, 50cm, un des musts de chez EL-BADIA, vase acry, tuyau, foyer, pince et brosse&nbsp;', 'chicha-celeste-2-0', 'https://www.el-badia.com/676-home_default/xchicha-celeste-20.jpg.pagespeed.ic.TO0VosfMtm.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(218, 3, 14, 'Charbons THREE KINGS 33mm boîte de 100', 'Boite de 100 charbons auto combustibles pour chicha', 'charbons-three-kings-33mm-boite-de-100', 'https://www.el-badia.com/9298-home_default/xcharbons-three-kings-33mm-boite-de-100-.jpg.pagespeed.ic.UdxLa07udc.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(219, 3, 14, 'Charbons Al Fakher 33mm', 'Boite de 100 charbons auto allumants pour chicha de marque AL FAKHER', 'charbons-al-fakher-33mm', 'https://www.el-badia.com/9302-home_default/xcharbons-al-fakher-33mm.jpg.pagespeed.ic.6QsizGVgsT.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(220, 3, 14, 'Charbons THREE KINGS 33mm rouleau de 10', 'Rouleau de 10 charbons auto-combustibles pour chicha', 'charbons-three-kings-33mm-rouleau-de-10', 'https://www.el-badia.com/9349-home_default/xcharbons-three-kings-33mm-rouleau-de-10-.jpg.pagespeed.ic.6JRUVQcb9u.jpg', 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, NULL),
(221, 3, 14, '50 Aluminiums prédécoupés', 'Paquet de 50 feuilles daluminium prédécoupées pour chicha', '50-aluminiums-predecoupes', 'https://www.el-badia.com/10309-home_default/xfeuilles-d-aluminium-predecoupees.jpg.pagespeed.ic.O2YQ5X03Nm.jpg', 2, 2, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(222, 3, 14, 'Charbons THREE KINGS XL 40mm boîte de 100', 'Charbons pour chicha THREE KINGS auto-combustibles en pastilles, 10 rouleaux de 10', 'charbons-three-kings-xl-40mm-boite-de-100', 'https://www.el-badia.com/9305-home_default/xcharbons-three-kings-xl-40mm-boite-de-100-.jpg.pagespeed.ic.GEEd1mDSLo.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(223, 3, 14, 'Charbons THREE KINGS XL 40mm rouleau de 10', 'Rouleau de 10 charbons auto-cobustibles de 40mm pour chicha', 'charbons-three-kings-xl-40mm-rouleau-de-10', 'https://www.el-badia.com/9323-home_default/charbons-three-kings-xl-40mm-rouleau-de-10-.jpg', 1, 1, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(224, 3, 14, 'Porte-charbons Petit', 'Porte charbons pour chicha avec anse et support pour poser la pince à charbons', 'porte-charbons-petit', 'https://www.el-badia.com/9341-home_default/xporte-charbons-petit.jpg.pagespeed.ic.4u-FdqLqim.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(225, 3, 14, 'Charbons ONE NATION C26 1kg', 'Charbon naturel premium&nbsp;ONE NATION en cubes 26x26x26mm, 1kg', 'charbons-one-nation-c26-1kg', 'https://www.el-badia.com/9308-home_default/xcharbons-one-nation-c26-1kg.jpg.pagespeed.ic.swXSfo0lsV.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(226, 3, 14, 'Charbons Cubes Auto-allumants 6pcs 26x26x20mm', 'paquet de 6 pièces de charbons auto-allumant de 26x26x20mm', 'charbons-cubes-auto-allumants-6pcs-26x26x20mm', 'https://www.el-badia.com/9314-home_default/charbons-cubes-auto-allumants-6pcs-26x26x20mm.jpg', 2, 2, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(227, 3, 14, 'Charbons CARBOPOL CROWN 40mm boite de 100', 'Les charbons CARBOPOL CROWN&nbsp;auto allumants en pastilles de 40mm', 'charbons-carbopol-crown-40mm-boite-de-100', 'https://www.el-badia.com/9315-home_default/xcharbons-carbopol-crown-40mm-boite-de-100.jpg.pagespeed.ic.g7Yp3iVG7o.jpg', 14, 14, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(228, 3, 14, 'Charbons CARBOPOL RING 38mm boite de 100', 'Les charbons CARBOPOL RING auto allumants en pastilles de 38mm', 'charbons-carbopol-ring-38mm-boite-de-100', 'https://www.el-badia.com/9327-home_default/xcharbons-carbopol-ring-38mm-boite-de-100.jpg.pagespeed.ic.EqIX4o21kb.jpg', 14, 14, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(229, 3, 14, 'Allume charbons électrique ELEPHANT', 'Allume charbons électrique ELEPHANT, idéal pour les charbons naturels.&nbsp; 220V - 1000W', 'allume-charbons-electrique-elephant', 'https://www.el-badia.com/1564-home_default/xallume-charbons-electrique-elephant.jpg.pagespeed.ic.prbEV1tgZs.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(230, 3, 14, 'Charbons THREE KINGS RINGS 44mm rouleau de 10', 'Rouleau de 10 charbons auto-combustibles de 44mm pour chicha', 'charbons-three-kings-rings-44mm-rouleau-de-10', 'https://www.el-badia.com/9328-home_default/charbons-three-kings-rings-44mm-rouleau-de-10-.jpg', 2, 2, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(231, 3, 14, 'Mini porte-charbons', 'Mini porte-charbons, idéal pour les charbons naturels. Hauteur 8,50cm Diamètre du plateau 8cm', 'mini-porte-charbons', 'https://www.el-badia.com/9340-home_default/xporte-charbon-pour-chicha.jpg.pagespeed.ic.tSkF_fw4-P.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 113, 1, 1, NULL, NULL),
(232, 3, 14, 'Charbons THREE KINGS RINGS 44mm boîte de 80', 'Charbons pour chicha THREE KINGS auto-combustibles en RINGS, 8&nbsp;rouleaux de 10', 'charbons-three-kings-rings-44mm-boite-de-80', 'https://www.el-badia.com/9329-home_default/xcharbons-three-kings-rings-boite-de-80-.jpg.pagespeed.ic.8kcIeIa6JR.jpg', 14, 14, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(233, 3, 14, 'Charbons CARBOPOL 35mm boite de 100', 'Les charbons CARBOPOL auto allumants en pastilles de 35mm', 'charbons-carbopol-35mm-boite-de-100', 'https://www.el-badia.com/9317-home_default/xcharbons-carbopol-35mm-boite-de-100.jpg.pagespeed.ic.OHLVmZEK7e.jpg', 9, 9, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(234, 3, 14, 'Porte-charbons Cendrier Amovible', 'Porte charbon pour chicha avec cendrier amovible et poignée', 'porte-charbons-cendrier-amovible', 'https://www.el-badia.com/9344-home_default/xporte-charbons-cendrier-amovible.jpg.pagespeed.ic.vT0JTToW2g.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(235, 3, 14, 'Charbons CARBOPOL 28mm boite de 100', 'charbons CARBOPOL auto allumants en pastilles de 28mm', 'charbons-carbopol-28mm-boite-de-100', 'https://www.el-badia.com/9326-home_default/charbons-carbopol-28mm-boite-de-100.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(236, 3, 14, 'Charbons CARBOPOL 40mm boite de 100', 'Les charbons CARBOPOL auto allumants en pastilles de 40mm', 'charbons-carbopol-40mm-boite-de-100', 'https://www.el-badia.com/2643-home_default/charbons-carbopol-40mm-boite-de-100.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(237, 3, 14, 'Allume charbons électrique VULKANOS ®', 'Grand allume charbons éléctrique Vulkanos ®', 'allume-charbons-electrique-vulkanos-r', 'https://www.el-badia.com/3553-home_default/xallume-charbons-electrique-vulkanos.jpg.pagespeed.ic.WyLt1j77eT.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(238, 3, 14, 'Allume Charbon TORNADO', 'Allume Charbon électrique TORNADO, 220V, 1000W, porte-charbon intégré', 'allume-charbon-tornado', 'https://www.el-badia.com/4076-home_default/xallume-charbon-tornado.jpg.pagespeed.ic.2kBrxiiP-x.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 108, 1, 1, NULL, NULL),
(239, 3, 15, 'Charbons 320° DISC 3B XL 4Kg', 'Charbons El-Badia 320° DISC 3 BLOCS XL 4Kg, charbons naturels Premium pour chicha, spécial Kaloud Lotus', 'charbons-3200-disc-3b-xl-4kg', 'https://www.el-badia.com/9333-home_default/xcharbons-320-disc-3b-xl-4kg.jpg.pagespeed.ic.1MUgjCHL8V.jpg', 26, 26, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(240, 3, 15, 'Charbons 320° DISC 3B XL 1Kg', 'Charbons El-Badia 320° DISC 3 blocs XL 1Kg, charbons naturels Premium pour chicha, spécial Kaloud Lotus', 'charbons-3200-disc-3b-xl-1kg', 'https://www.el-badia.com/9335-home_default/xcharbons-320-disc-3b-xl-1kg.jpg.pagespeed.ic.TEmu9qojQF.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(241, 3, 15, 'Charbons TOM COCOCHA 1Kg GOLD', 'Charbons naturels&nbsp;TOM COCOCHA 1Kg GOLD, en cubes...', 'charbons-tom-cococha-1kg-gold', 'https://www.el-badia.com/9299-home_default/xcharbons-tom-cococha-1kg-gold-.jpg.pagespeed.ic.t_jfZR7vfv.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(242, 3, 15, 'Charbons El-Badia 320° DISC 4b 4Kg', 'Charbons El-Badia 320° DISC 4 blocs 4Kg, charbon naturel Premium pour chicha, idéal Kaloud Lotus', 'charbons-el-badia-3200-disc-4b-4kg', 'https://www.el-badia.com/9334-home_default/xcharbons-320-disc-4b-4kg.jpg.pagespeed.ic.Hyosp39HqX.jpg', 22, 22, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(243, 3, 15, 'Charbons TOM COCOCHA 3Kg BLEU', 'Charbons naturels&nbsp;TOM COCOCHA 3Kg BLEU, flat', 'charbons-tom-cococha-3kg-bleu', 'https://www.el-badia.com/9304-home_default/xcharbons-tom-cococha-3kg-bleu-.jpg.pagespeed.ic.OJ5Opl4MF1.jpg', 16, 16, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(244, 3, 15, '50 Aluminiums prédécoupés', 'Paquet de 50 feuilles daluminium prédécoupées pour chicha', '50-aluminiums-predecoupes', 'https://www.el-badia.com/10309-home_default/xfeuilles-d-aluminium-predecoupees.jpg.pagespeed.ic.O2YQ5X03Nm.jpg', 2, 2, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(245, 3, 15, 'Charbons El-Badia 320° CUBES 26mm 1Kg', 'Charbons El-Badia 320° CUBES 26mm 1Kg, charbon naturel Premium pour grilles Dragon, Brohood, Volkan', 'charbons-el-badia-3200-cubes-26mm-1kg', 'https://www.el-badia.com/9297-home_default/xcharbons-320-cubes-26mm-1kg.jpg.pagespeed.ic.40MzliiIrS.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(246, 3, 15, 'Charbons 320° DISC 4b 1 Kg', 'Charbons El-Badia 320° DISC 4 blocs 1Kg, charbons naturels Premium pour chicha, idéal Kaloud Lotus', 'charbons-3200-disc-4b-1-kg', 'https://www.el-badia.com/9301-home_default/xcharbons-320-disc-4b-1kg.jpg.pagespeed.ic.0YBccZgmEj.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(247, 3, 15, 'Charbons ZOCOMO 26mm 1kg', 'Charbon naturel premium de la marque Zomo, format cube de 26 mm.', 'charbons-zocomo-26mm-1kg', 'https://www.el-badia.com/9311-home_default/xcharbons-zocomo-26mm-1kg.jpg.pagespeed.ic.nkinuQ1YsU.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(248, 3, 15, 'Charbons TOM COCOCHA 3Kg GOLD', 'Charbons naturels&nbsp;TOM COCOCHA 3Kg GOLD, en cubes', 'charbons-tom-cococha-3kg-gold', 'https://www.el-badia.com/9300-home_default/xcharbons-tom-cococha-3kg-gold-.jpg.pagespeed.ic.iF_vdUzX6I.jpg', 16, 16, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(249, 3, 15, 'Charbons DRAGON CUBES 26mm 1Kg', 'Charbons DRAGON CUBES 26mm 1Kg, charbon naturel Premium pour grilles Dragon, Brohood, Volkan', 'charbons-dragon-cubes-26mm-1kg', 'https://www.el-badia.com/11157-home_default/xcharbons-dragon-cubes-26mm-1kg.jpg.pagespeed.ic.twCHUbDB03.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(250, 3, 15, 'CHARBONS TOM COCOCHA SILVER 3KG - 3 Blocks', 'Charbons naturels TOM COCOCHA SILVER 3KG - 3 BLOCKS en 1/3 de disque, special Kaloud Lotus', 'charbons-tom-cococha-silver-3kg-3-blocks', 'https://www.el-badia.com/9332-home_default/xcharbons-tom-cococha-silver-3k-4-blocks.jpg.pagespeed.ic.5yRyokWW-b.jpg', 18, 18, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(251, 3, 15, 'Charbons El-Badia 320° CUBES 26mm 4Kg', 'Charbons El-Badia 320° CUBES 26mm 4Kg, charbon naturel Premium pour grilles Dragon, Brohood, Volkan', 'charbons-el-badia-3200-cubes-26mm-4kg', 'https://www.el-badia.com/9309-home_default/xcharbons-320-cubes-26mm-4kg.jpg.pagespeed.ic.oFtrQH8Ccw.jpg', 26, 26, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(252, 3, 15, 'Charbons TOM COCOCHA SILVER 1KG - 3 Blocks', 'Charbons naturels TOM COCOCHA SILVER 1KG - 3 BLOCKS en 1/3 de disque, special Kaloud Lotus', 'charbons-tom-cococha-silver-1kg-3-blocks', 'https://www.el-badia.com/9310-home_default/xcharbons-tom-cococha-silver-1k-4-blocks.jpg.pagespeed.ic.yF5fIz46IS.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(253, 3, 15, 'Charbons TOM COCOCHA 1Kg BLEU', 'Charbons naturels&nbsp;TOM COCOCHA 1Kg BLEU, flat :&nbsp;25x25x15mm', 'charbons-tom-cococha-1kg-bleu', 'https://www.el-badia.com/9313-home_default/xcharbons-tom-cococha-1kg-bleu-.jpg.pagespeed.ic.AocbRLmEyn.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(254, 3, 15, 'Porte-charbons Petit', 'Porte charbons pour chicha avec anse et support pour poser la pince à charbons', 'porte-charbons-petit', 'https://www.el-badia.com/9341-home_default/xporte-charbons-petit.jpg.pagespeed.ic.4u-FdqLqim.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(255, 3, 15, 'Charbon Oduman Bucoco 26mm 1kg', 'Charbon naturel en écorce de coco BUCOCO 26mm, qualité premium.', 'charbon-oduman-bucoco-26mm-1kg', 'https://www.el-badia.com/9324-home_default/xcharbon-oduman-bucoco-26mm-1kg.jpg.pagespeed.ic.booL_yT3oZ.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 79, 1, 1, NULL, NULL),
(256, 3, 15, 'Charbons COCOBRICO 10Kg', 'Charbons naturels&nbsp;COCOBRICO 10Kg, en cubes', 'charbons-cocobrico-10kg', 'https://www.el-badia.com/9371-home_default/xcharbons-cocobrico-10kg-.jpg.pagespeed.ic.Bpnl0q4cKT.jpg', 40, 40, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(257, 3, 15, 'Charbons DREAM ROUND 3 BLOCKS 1Kg', 'Charbons naturels à base décorce de coco DREAM ROUND 3 Blocs paquet de 1kg, spécial Kaloud', 'charbons-dream-round-3-blocks-1kg', 'https://www.el-badia.com/9321-home_default/xcharbons-dream-round-1kg.jpg.pagespeed.ic.qi72VDvW-G.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(258, 3, 15, 'Allume charbons électrique ELEPHANT', 'Allume charbons électrique ELEPHANT, idéal pour les charbons naturels.&nbsp; 220V - 1000W', 'allume-charbons-electrique-elephant', 'https://www.el-badia.com/1564-home_default/xallume-charbons-electrique-elephant.jpg.pagespeed.ic.prbEV1tgZs.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(259, 3, 15, 'Charbons El-Badia 320° CUBES 26mm 20Kg', 'Charbons El-Badia 320° CUBES 26mm 20Kg, charbon naturel Premium pour grilles Dragon, Brohood, Volkan', 'charbons-el-badia-3200-cubes-26mm-20kg', 'https://www.el-badia.com/9355-home_default/xcharbons-320-cubes-26mm-20kg.jpg.pagespeed.ic.TUIIP__WqE.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(260, 3, 15, 'Charbons TOM COCOCHA 20Kg GOLD', 'Charbons naturels&nbsp;TOM COCOCHA 20Kg GOLD, en cubes', 'charbons-tom-cococha-20kg-gold', 'https://www.el-badia.com/9370-home_default/xcharbons-tom-cococha-20kg-gold-.jpg.pagespeed.ic.xBNGNKu3Hh.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(261, 3, 15, 'Charbons DREAM FLAT 1Kg', 'Charbons naturels à base décorce de coco DREAM FLAT paquet de 1kg, format rectangulaire', 'charbons-dream-flat-1kg', 'https://www.el-badia.com/9320-home_default/xcharbons-dream-flat-1kg.jpg.pagespeed.ic.ReNd_ZKRJx.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(262, 3, 15, 'Charbons KING COCO C28 1KG', 'Charbon naturel premium KING COCO en gros cubes de 28mm de côtes, 1kg', 'charbons-king-coco-c28-1kg', 'https://www.el-badia.com/9325-home_default/xcharbons-king-coco-c28-1kg.jpg.pagespeed.ic.LmpvCKVynI.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(263, 3, 15, 'Charbons THREE KINGS Coconut 100 Pcs', 'Charbon naturel premium THREE KINGS COCONUT, boite de 100 pièces. Allumage rapide, idéal pour alu', 'charbons-three-kings-coconut-100-pcs', 'https://www.el-badia.com/9306-home_default/xcharbons-three-kings-coconut-100-pcs.jpg.pagespeed.ic.MrnvmPtQeh.jpg', 9, 9, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(264, 3, 15, 'Charbons KING COCO C26 1Kg', 'Charbon naturel premium KING COCO en cubes de 26mm de côtes, 1kg', 'charbons-king-coco-c26-1kg', 'https://www.el-badia.com/9322-home_default/xcharbons-king-coco-c26-1kg.jpg.pagespeed.ic.j78brvaBDY.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(265, 3, 15, 'Charbons 320° DISC 3B XL 20Kg', 'Charbons El-Badia 320° DISC 3 blocs XL 20Kg, charbons naturels Premium pour chicha, spécial Kaloud Lotus', 'charbons-3200-disc-3b-xl-20kg', 'https://www.el-badia.com/9354-home_default/xcharbons-320-disc-3b-xl-20kg.jpg.pagespeed.ic.CQSpxy0rO9.jpg', 99, 99, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(266, 3, 15, 'Charbon COCOBRATION Premium 1Kg C26', 'Charbon COCOBRATION Premium 1Kg C26, à base décorces de coco, cubes 26x26x26mm', 'charbon-cocobration-premium-1kg-c26', 'https://www.el-badia.com/10467-home_default/xcharbon-cocobration-premium-1k-c26.jpg.pagespeed.ic.lYEIaT_H2v.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(267, 3, 15, 'Charbons KING COCO XS FLAT 1KG', 'Charbon naturel premium KING COCO&nbsp;XS FLAT, 26x26x15mm, 1kg', 'charbons-king-coco-xs-flat-1kg', 'https://www.el-badia.com/9330-home_default/xcharbons-king-coco-xs-flat-1kg.jpg.pagespeed.ic.vhGDOeP9NR.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(268, 3, 15, 'Charbons TOM COCOCHA C26 2Kg', 'Charbons TOM COCOCHA C26 2Kg, cubes de charbons naturels de 26mm de côtés', 'charbons-tom-cococha-c26-2kg', 'https://www.el-badia.com/9316-home_default/xcharbons-tom-cococha-c26-2kg.jpg.pagespeed.ic.37Bu_LIndA.jpg', 14, 14, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(269, 3, 15, 'Mini porte-charbons', 'Mini porte-charbons, idéal pour les charbons naturels. Hauteur 8,50cm Diamètre du plateau 8cm', 'mini-porte-charbons', 'https://www.el-badia.com/9340-home_default/xporte-charbon-pour-chicha.jpg.pagespeed.ic.tSkF_fw4-P.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 113, 1, 1, NULL, NULL),
(270, 3, 15, 'Charbons DREAM CUBES 26mm 1Kg', 'Charbons naturels à base décorce de coco DREAM CUBES paquet de 1kg, cubes de 26mm de côtés', 'charbons-dream-cubes-26mm-1kg', 'https://www.el-badia.com/9318-home_default/xcharbons-dream-cubes-26mm-1kg.jpg.pagespeed.ic.nUNqjSecBr.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(271, 3, 15, 'Charbon COCOSOUL C26 1kg', 'Charbon naturel premium COCOSOUL en cubes de 26mm de côtes, 1kg', 'charbon-cocosoul-c26-1kg', 'https://www.el-badia.com/9303-home_default/xcharbon-cocosoul-c26-1kg.jpg.pagespeed.ic.GHAeZcSxOK.jpg', 5, 5, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(272, 3, 15, 'Charbons El-Badia 320° DISC 4b 20Kg', 'Charbons El-Badia 320° DISC 4 blocs 20Kg, charbon naturel Premium pour chicha, idéal Kaloud Lotus', 'charbons-el-badia-3200-disc-4b-20kg', 'https://www.el-badia.com/9353-home_default/xcharbons-320-disc-4b-20kg.jpg.pagespeed.ic.NDcd2LB1WF.jpg', 89, 89, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(273, 3, 15, 'Charbons COCOBUZZ 2.0', 'Charbons naturels&nbsp;COCOBUZZ en cubes, de la marque STARBUZZ, boite de 72 pièces', 'charbons-cocobuzz-2-0', 'https://www.el-badia.com/9312-home_default/xcharbons-cocobuzz-20-1kg-.jpg.pagespeed.ic.53PW2nHKtI.jpg', 9, 9, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(274, 3, 15, 'Charbon COCOSOUL Circle/3 1kg', 'Charbon naturel premium COCOSOUL en 1/3 de cercle, 1kg', 'charbon-cocosoul-circle-3-1kg', 'https://www.el-badia.com/5370-home_default/xcharbon-cocosoul-circle-3-1kg.jpg.pagespeed.ic.MLVXepN77K.jpg', 5, 5, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(275, 3, 15, 'Charbon BLACKCOCO&#039;s 20KG', 'Charbons naturels pour chicha BLACKCOCOs en cubes, carton de 20KG', 'charbon-blackcoco-039-s-20kg', 'https://www.el-badia.com/3418-home_default/xcharbon-blackcoco-s-20kg.jpg.pagespeed.ic.mNsx3Ly2Jd.jpg', 90, 90, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(276, 3, 15, 'Charbon COCOLOCO PREMIUM 1kg C26', 'Charbon naturel cubes de 26mm premium de la marque russe COCOLOCO en paquet de 1Kg', 'charbon-cocoloco-premium-1kg-c26', 'https://www.el-badia.com/9319-home_default/xcharbon-cocoloco-premium-1kg-c26.jpg.pagespeed.ic.VvLrby_BW6.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(277, 3, 15, 'Charbons DREAM CUBES 1Kg', 'Charbons naturels à base décorce de coco DREAM CUBES paquet de 1kg, cubes de 25mm de côtés', 'charbons-dream-cubes-1kg', 'https://www.el-badia.com/9307-home_default/xcharbons-coco-dream-1kg.jpg.pagespeed.ic.D_pPmigkgy.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(278, 3, 15, 'Charbons COCOBRICO 1Kg', 'Charbons naturels&nbsp;COCOBRICO 1Kg, en cubes', 'charbons-cocobrico-1kg', 'https://www.el-badia.com/5260-home_default/xcharbons-cocobrico-1kg-.jpg.pagespeed.ic.nzxTZK8Pzz.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(279, 3, 15, 'Charbons COCOBRICO 3Kg', 'Charbons naturels&nbsp;COCOBRICO 3Kg, en cubes', 'charbons-cocobrico-3kg', 'https://www.el-badia.com/2653-home_default/xcharbons-cocobrico-3kg-.jpg.pagespeed.ic.kmiDjZgqK5.jpg', 14, 14, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(280, 3, 15, 'Porte-charbons Cendrier Amovible', 'Porte charbon pour chicha avec cendrier amovible et poignée', 'porte-charbons-cendrier-amovible', 'https://www.el-badia.com/9344-home_default/xporte-charbons-cendrier-amovible.jpg.pagespeed.ic.vT0JTToW2g.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(281, 3, 15, 'Charbons DSCHINNI CUBES 1Kg 26mm', 'Charbons naturels DSCHINNI Cubes 1kg, en cubes&nbsp;26x26x26mm', 'charbons-dschinni-cubes-1kg-26mm', 'https://www.el-badia.com/3821-home_default/xcharbons-dschinni-cubes-1kg-26mm.jpg.pagespeed.ic.12C_Mkj-6P.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 78, 1, 1, NULL, NULL),
(282, 3, 15, 'Charbon BLACKCOCO&#039;s 1KG', 'Charbons naturels pour chicha BLACKCOCOs en cubes, carton de 1KG', 'charbon-blackcoco-039-s-1kg', 'https://www.el-badia.com/3415-home_default/xcharbon-blackcoco-s-1kg.jpg.pagespeed.ic.gIXQY8vxOa.jpg', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(283, 3, 15, 'Allume charbons électrique VULKANOS ®', 'Grand allume charbons éléctrique Vulkanos ®', 'allume-charbons-electrique-vulkanos-r', 'https://www.el-badia.com/3553-home_default/xallume-charbons-electrique-vulkanos.jpg.pagespeed.ic.WyLt1j77eT.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(284, 3, 15, 'Charbons TOM COCOCHA HEXAGON 1KG', 'Charbons naturels TOM COCOCHA HEXAGON 1KG en bâtonnet, idéal avec des feuilles daluminium', 'charbons-tom-cococha-hexagon-1kg', 'https://www.el-badia.com/4010-home_default/charbons-tom-cococha-hexagon-1kg.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(285, 3, 15, 'Phoenix Brohood', 'Le Phoenix Brohood est un dispositif incluant&nbsp;un foyer en terre cuite, une cheminée et un grillage', 'phoenix-brohood', 'https://www.el-badia.com/6114-home_default/xphoenix-brohood.jpg.pagespeed.ic.i4WkZa7xha.jpg', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(286, 3, 15, 'Allume Charbon TORNADO', 'Allume Charbon électrique TORNADO, 220V, 1000W, porte-charbon intégré', 'allume-charbon-tornado', 'https://www.el-badia.com/4076-home_default/xallume-charbon-tornado.jpg.pagespeed.ic.2kBrxiiP-x.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 108, 1, 1, NULL, NULL),
(287, 5, 7, 'KALOUD SAMSARIS LAPIS POUR LOTUS I ET I+', 'Foyer KALOUD SAMSARIS LAPIS pour LOTUS I & I+ en silicone et&nbsp;céramique de haute qualité', 'kaloud-samsaris-lapis-pour-lotus-i-et-i', 'https://www.el-badia.com/9980-home_default/xkaloud-samsaris-lapis-pour-lotus-i-et-i.jpg.pagespeed.ic.RLCXopNB2N.jpg', 55, 55, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 45, 1, 1, NULL, NULL),
(288, 5, 7, 'KALOUD SAMSARIS pour LOTUS I &amp; I+', 'Foyer KALOUD SAMSARIS pour LOTUS I & I+ en silicone et aluminium de haute qualité', 'kaloud-samsaris-pour-lotus-i-amp-i', 'https://www.el-badia.com/6107-home_default/kaloud-samsaris-pour-lotus-i-et-i.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 45, 1, 1, NULL, NULL),
(289, 5, 7, 'KALOUD SAMSARIS pour LOTUS II', 'Foyer KALOUD SAMSARIS pour LOTUS II en silicone et aluminium de haute qualité', 'kaloud-samsaris-pour-lotus-ii', 'https://www.el-badia.com/6113-home_default/xkaloud-samsaris-pour-lotus-ii.jpg.pagespeed.ic.Du03RlSAxM.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 45, 1, 1, NULL, NULL),
(290, 5, 7, 'KALOUD SAMSARIS VITRIA II', 'SAMSARIS VITRIA II est un foyer en silicone avec réceptacle en verre, idéal avec le KALOUD LOTUS I ou I+', 'kaloud-samsaris-vitria-ii', 'https://www.el-badia.com/10049-home_default/xkaloud-samsaris-vitria-ii.jpg.pagespeed.ic.Km3dH7N32b.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 45, 1, 1, NULL, NULL),
(291, 5, 7, 'KALOUD SAMSARIS VITRIA II POUR KRYSALIS LOTUS I ET I+', 'SAMSARIS VITRIA II est un foyer en silicone avec réceptacle en verre, idéal avec le KALOUD LOTUS I ou I+, version compatible avec la chicha KRYSALIS uniquement', 'kaloud-samsaris-vitria-ii-pour-krysalis-lotus-i-et-i', 'https://www.el-badia.com/7161-home_default/xkaloud-samsaris-vitria-ii-pour-krysalis-lotus-i-et-i.jpg.pagespeed.ic.D_M8M5EvEM.jpg', 45, 45, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 45, 1, 1, NULL, NULL);
INSERT INTO `product` (`id`, `category_id`, `sous_category_id`, `nom`, `content`, `slug`, `image`, `price`, `price_ht`, `promotion`, `nouveaute`, `color_id`, `taille`, `vase`, `tuyau`, `fixation`, `autre`, `publie`, `is_best`, `marque_id`, `gramme`, `en_stock`, `quantite`, `intro`) VALUES
(292, 5, 7, 'KALOUD SAMSARIS VITRIA II POUR KRYSALIS LOTUS II', 'SAMSARIS VITRIA II est un foyer en silicone avec réceptacle en verre, idéal avec le KALOUD LOTUS I I, version compatible avec la chicha KRYSALIS uniquement', 'kaloud-samsaris-vitria-ii-pour-krysalis-lotus-ii', 'https://www.el-badia.com/7163-home_default/xkaloud-samsaris-vitria-ii-pour-krysalis-lotus-ii.jpg.pagespeed.ic.D_M8M5EvEM.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 45, 1, 1, NULL, NULL),
(293, 5, 7, 'KALOUD SAMSARIS VITRIA II pour LOTUS II', 'SAMSARIS VITRIA II pour LOTUS II est un foyer en silicone avec réceptacle en verre, conçu pour le Kaloud Lotus II', 'kaloud-samsaris-vitria-ii-pour-lotus-ii', 'https://www.el-badia.com/10048-home_default/xkaloud-samsaris-vitria-ii-pour-lotus-ii.jpg.pagespeed.ic.ae1B-05gGn.jpg', 37, 37, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 45, 1, 1, NULL, NULL),
(294, 5, 8, 'Foyer SET DRAGON', 'Le foyer SET&nbsp;DRAGON,&nbsp;système de chauffe composé dun foyer en&nbsp;argile et dune cheminée à grille', 'foyer-set-dragon', 'https://www.el-badia.com/11200-home_default/xfoyer-set-dragon.jpg.pagespeed.ic.nQeWfgW1H4.png', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(295, 5, 8, 'Foyer Thermique QUASAR1', 'Foyer Thermique QUASAR1 : foyer silicone et système de chauffe fonctionnant avec 1 seul charbon', 'foyer-thermique-quasar1', 'https://www.el-badia.com/3978-home_default/xfoyer-thermique-quasar1.jpg.pagespeed.ic.15JcWYJFph.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(296, 5, 8, 'KALOUD SAMSARIS LAPIS POUR LOTUS I ET I+', 'Foyer KALOUD SAMSARIS LAPIS pour LOTUS I & I+ en silicone et&nbsp;céramique de haute qualité', 'kaloud-samsaris-lapis-pour-lotus-i-et-i', 'https://www.el-badia.com/9980-home_default/xkaloud-samsaris-lapis-pour-lotus-i-et-i.jpg.pagespeed.ic.RLCXopNB2N.jpg', 55, 55, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 45, 1, 1, NULL, NULL),
(297, 5, 8, 'KALOUD SAMSARIS pour LOTUS I &amp; I+', 'Foyer KALOUD SAMSARIS pour LOTUS I & I+ en silicone et aluminium de haute qualité', 'kaloud-samsaris-pour-lotus-i-amp-i', 'https://www.el-badia.com/6107-home_default/xkaloud-samsaris-pour-lotus-i-et-i.jpg.pagespeed.ic.b-gkefmqJ4.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 45, 1, 1, NULL, NULL),
(298, 5, 8, 'KALOUD SAMSARIS pour LOTUS II', 'Foyer KALOUD SAMSARIS pour LOTUS II en silicone et aluminium de haute qualité', 'kaloud-samsaris-pour-lotus-ii', 'https://www.el-badia.com/6113-home_default/xkaloud-samsaris-pour-lotus-ii.jpg.pagespeed.ic.Du03RlSAxM.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 45, 1, 1, NULL, NULL),
(299, 5, 8, 'KALOUD SAMSARIS VITRIA II', 'SAMSARIS VITRIA II est un foyer en silicone avec réceptacle en verre, idéal avec le KALOUD LOTUS I ou I+', 'kaloud-samsaris-vitria-ii', 'https://www.el-badia.com/10049-home_default/xkaloud-samsaris-vitria-ii.jpg.pagespeed.ic.Km3dH7N32b.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 45, 1, 1, NULL, NULL),
(300, 5, 8, 'KALOUD SAMSARIS VITRIA II POUR KRYSALIS LOTUS I ET I+', 'SAMSARIS VITRIA II est un foyer en silicone avec réceptacle en verre, idéal avec le KALOUD LOTUS I ou I+, version compatible avec la chicha KRYSALIS uniquement', 'kaloud-samsaris-vitria-ii-pour-krysalis-lotus-i-et-i', 'https://www.el-badia.com/7161-home_default/xkaloud-samsaris-vitria-ii-pour-krysalis-lotus-i-et-i.jpg.pagespeed.ic.D_M8M5EvEM.jpg', 45, 45, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 45, 1, 1, NULL, NULL),
(301, 5, 8, 'KALOUD SAMSARIS VITRIA II POUR KRYSALIS LOTUS II', 'SAMSARIS VITRIA II est un foyer en silicone avec réceptacle en verre, idéal avec le KALOUD LOTUS I I, version compatible avec la chicha KRYSALIS uniquement', 'kaloud-samsaris-vitria-ii-pour-krysalis-lotus-ii', 'https://www.el-badia.com/7163-home_default/xkaloud-samsaris-vitria-ii-pour-krysalis-lotus-ii.jpg.pagespeed.ic.D_M8M5EvEM.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 45, 1, 1, NULL, NULL),
(302, 5, 8, 'KALOUD SAMSARIS VITRIA II pour LOTUS II', 'SAMSARIS VITRIA II pour LOTUS II est un foyer en silicone avec réceptacle en verre, conçu pour le Kaloud Lotus II', 'kaloud-samsaris-vitria-ii-pour-lotus-ii', 'https://www.el-badia.com/10048-home_default/xkaloud-samsaris-vitria-ii-pour-lotus-ii.jpg.pagespeed.ic.ae1B-05gGn.jpg', 37, 37, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 45, 1, 1, NULL, NULL),
(303, 5, 8, 'Phoenix Brohood', 'Le Phoenix Brohood est un dispositif incluant&nbsp;un foyer en terre cuite, une cheminée et un grillage', 'phoenix-brohood', 'https://www.el-badia.com/6114-home_default/xphoenix-brohood.jpg.pagespeed.ic.i4WkZa7xha.jpg', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(304, 4, 13, 'Manche MARRAKECH', 'Manche MARRAKECH&nbsp;en alumiunium brossé, 41cm fourni avec connecteur', 'manche-marrakech', 'https://www.el-badia.com/10083-home_default/xmanche-marrakech.jpg.pagespeed.ic.z-JAgIyjQq.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(305, 4, 13, 'Tuyau Marrakech XL 3.0', 'Le tuyau Marrakech XL 3.0 plus long, plus large et surtout plus ergonomique.', 'tuyau-marrakech-xl-3-0', 'https://www.el-badia.com/4918-home_default/xtuyau-marrakech-xl-30.jpg.pagespeed.ic.vWQYGMcOMH.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(306, 4, 13, 'Flexible Silicone Soft Touch', 'Flexible silicone pour tuyau de chicha, souple, doux et légers, &nbsp;longueur 150cm. Vendu seul.', 'flexible-silicone-soft-touch', 'https://www.el-badia.com/5377-home_default/xtuyau-silicone-soft-touch.jpg.pagespeed.ic.bXCwoPjude.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(307, 4, 13, 'Manche FROSTED GLASS XL', 'Manche en verre pour tuyau silicone FROSTED GLASS XL, 40cm, finition sablée, embout plat', 'manche-frosted-glass-xl', 'https://www.el-badia.com/5382-home_default/xmanche-frosted-glass-xl.jpg.pagespeed.ic.O8FhkMt5PT.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(308, 4, 13, 'Flexible Silicone STRIPED', 'Flexible silicone STRIPED pour tuyau de chicha, souple, longueur 150cm. Vendu seul.', 'flexible-silicone-striped', 'https://www.el-badia.com/5376-home_default/xtuyau-silicone-striped.jpg.pagespeed.ic.GoTfnvzFdx.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(309, 4, 13, 'Manche SWORD', 'Manche SWORD en alumiunium brossé, 40cm fourni avec un connecteur', 'manche-sword', 'https://www.el-badia.com/3236-home_default/xmanche-sword.jpg.pagespeed.ic.Fr-ms_w1VM.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(310, 4, 13, 'Connecteur pour tuyau silicone', 'Connecteur en aluminium pour tuyau silicone', 'connecteur-pour-tuyau-silicone', 'https://www.el-badia.com/771-home_default/xconnecteur-pour-tuyau-silicone.jpg.pagespeed.ic.uZ8ROsDfjR.jpg', 2, 2, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(311, 4, 13, 'Tuyau Slim', 'Tuyau en silicone avec manche long et fin en aluminium', 'tuyau-slim', 'https://www.el-badia.com/10055-home_default/xtuyau-slim.jpg.pagespeed.ic.Mh_2XHArjJ.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(312, 4, 13, 'Tuyau Marrakech Silicone', 'Le tuyau marrakech silicone est un tuyau avec un long manche métallique et un tuyau silicone lavable', 'tuyau-marrakech-silicone', 'https://www.el-badia.com/10073-home_default/xtuyau-marrakech-silicone.jpg.pagespeed.ic.-NCs6Wumrt.jpg', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(313, 4, 13, 'Connecteur Incurve Pour Silicone', 'Connecteur coudé pour tuyau en silicone', 'connecteur-incurve-pour-silicone', 'https://www.el-badia.com/2861-home_default/xconnecteur-incurve-pour-silicone.jpg.pagespeed.ic.TLl6Unf0SA.jpg', 3, 3, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(314, 4, 13, 'Manche El-Badia Carbon', 'Manche CARBON, 40cm de long, ultra léger ce manche pour flexible silicone ne pèse que 40 grammes.', 'manche-el-badia-carbon', 'https://www.el-badia.com/6233-home_default/xmanche-carbon.jpg.pagespeed.ic.0QJKTA0Amm.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(315, 4, 13, 'ICE TIP BAZOOKA 2.0', 'ICE TIP BAZOOKA 2.0 : embout refroidissant pour chicha', 'ice-tip-bazooka-2-0', 'https://www.el-badia.com/4364-home_default/xice-tip-bazooka-20.jpg.pagespeed.ic.N_OINAwYOP.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(316, 4, 13, 'Manche COLORED GLASS', 'Manche COLORED GLASS, 30cm, en verre pour tuyau silicone, embout rond', 'manche-colored-glass', 'https://www.el-badia.com/5379-home_default/xmanche-colored-glass.jpg.pagespeed.ic.lDJecKItPX.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 1, 1, 1, NULL, NULL),
(317, 4, 13, 'Manche AEON VYRO CARBON 17cm', 'Manche pour tuyau AEON VYRO CARBON 17cm, inox et carbone&nbsp;', 'manche-aeon-vyro-carbon-17cm', 'https://www.el-badia.com/9456-home_default/xmanche-aeon-vyro-carbon-17cm.jpg.pagespeed.ic.fh_P99DZXK.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(318, 4, 13, 'Manche AEON VYRO CARBON 40cm', 'Manche pour tuyau AEON VYRO CARBON 40cm, inox et carbone', 'manche-aeon-vyro-carbon-40cm', 'https://www.el-badia.com/9473-home_default/xmanche-aeon-vyro-carbon-40cm.jpg.pagespeed.ic.vSWhwQgvT6.jpg', 22, 22, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(319, 4, 13, 'Manche EL-BADIA P1', 'Manche pour chicha EL-BADIA P1', 'manche-el-badia-p1', 'https://www.el-badia.com/10772-home_default/xmanche-el-badia-p1.jpg.pagespeed.ic.6qDLyZosxf.jpg', 4, 4, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(320, 4, 13, 'Manche CURLY GLASS', 'Manche en verre CURLY GLASS, 30cm, avec poignée en verre tressée et colorée', 'manche-curly-glass', 'https://www.el-badia.com/5292-home_default/xmanche-curly-glass.jpg.pagespeed.ic.gNLCjS2nY6.jpg', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(321, 4, 13, 'Manche WOOKAH Standard', 'Le manche WOOKAH en bois noble est renforcé par un tube en acier inoxidable.', 'manche-wookah-standard', 'https://www.el-badia.com/2578-home_default/xmanche-wookah-standard.jpg.pagespeed.ic.j_C4Zm3sie.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(322, 4, 13, 'Manche AEON VYRO CARBON 30cm', 'Manche pour tuyau AEON VYRO CARBON 30cm, inox et carbone&nbsp;', 'manche-aeon-vyro-carbon-30cm', 'https://www.el-badia.com/9464-home_default/xmanche-aeon-vyro-carbon-30cm.jpg.pagespeed.ic.fzu8YtY159.jpg', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(323, 4, 13, 'Manche en verre GH-X25 pour tuyau silicone', 'Manche de chicha en verre et aluminium GH-X25 pour tuyau silicone. Vendu seul, sans tuyau.', 'manche-en-verre-gh-x25-pour-tuyau-silicone', 'https://www.el-badia.com/552-home_default/xmanche-en-verre-gh-x25-pour-tuyau-silicone.jpg.pagespeed.ic.tgFckHH0Bn.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(324, 4, 13, 'Tuyau SWORD', 'Le tuyau SWORD est lun des tuyaux les plus performants de la gamme EL-BADIA', 'tuyau-sword', 'https://www.el-badia.com/10101-home_default/xtuyau-sword.jpg.pagespeed.ic.aU8ES3M1G8.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(325, 4, 13, 'Manche CAMO GLASS', 'Manche CAMO GLASS, 27cm, en verre pour tuyau silicone, embout plat', 'manche-camo-glass', 'https://www.el-badia.com/6277-home_default/xmanche-camo-glass.jpg.pagespeed.ic.bdOHCYr6AM.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(326, 4, 13, 'Manche Marrakech en verre pour tuyau silicone', 'Manche Marrakech 40cm en verre pour tuyau silicone. Vendu seul, sans tuyau', 'manche-marrakech-en-verre-pour-tuyau-silicone', 'https://www.el-badia.com/1525-home_default/xmanche-marrakech-en-verre-pour-tuyau-silicone.jpg.pagespeed.ic.PqpAXcWhPG.jpg', 8, 8, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(327, 4, 13, 'Connecteur en verre 18.8', 'Connecteur en verre&nbsp;18.8', 'connecteur-en-verre-18-8', 'https://www.el-badia.com/2715-home_default/xconnecteur-en-verre-pour-tuyau-silicone.jpg.pagespeed.ic.xjkL2IofmH.jpg', 5, 5, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(328, 4, 13, 'Manche en verre GH-X30 pour tuyau silicone', 'Manche de chicha en verre et aluminium GH-X30 pour tuyau silicone. Vendu seul, sans tuyau.', 'manche-en-verre-gh-x30-pour-tuyau-silicone', 'https://www.el-badia.com/553-home_default/xmanche-en-verre-gh-x30-pour-tuyau-silicone.jpg.pagespeed.ic.9QexDYXNf_.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(329, 4, 13, 'Manche MIG R93 Carbon', 'Manche MIG R93 Carbon, 40cm de long, effet carbone disponible en plusieurs colors', 'manche-mig-r93-carbon', 'https://www.el-badia.com/8163-home_default/xmanche-mig-r93-carbon.jpg.pagespeed.ic.UkZuRaP2QM.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 58, 1, 1, NULL, NULL),
(330, 4, 13, 'Manche OCEAN HOOKAH FUSION X TWISTED', 'Manche OCEAN HOOKAH FUSION X TWISTED, 37cm, poignée en acier inoxydable V2A et embout en verre borosilicate', 'manche-ocean-hookah-fusion-x-twisted', 'https://www.el-badia.com/8022-home_default/xmanche-ocean-hookah-fusion-x-twisted.jpg.pagespeed.ic.B2fIWI6qUA.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 25, 1, 1, NULL, NULL),
(331, 4, 13, 'Tuyau hygiénique Jetable', 'Tuyau hygiénique jetable&nbsp;pour chicha, manche en acrylique et flexible en plastique.&nbsp;Ce tuyau à usage unique, idéal pour les professionnels et les bars à chicha.', 'tuyau-hygienique-jetable', 'https://www.el-badia.com/10901-home_default/xtuyau-hygienique-jetable.jpg.pagespeed.ic.2QvaPDZGMy.png', 3, 3, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(332, 4, 13, 'Manche CARTEL Carbone', 'Manche CARTEL CARBONE, 39cm avec deux embouts interchangeables plat et rond', 'manche-cartel-carbone', 'https://www.el-badia.com/6977-home_default/xmanche-cartel-carbone.jpg.pagespeed.ic.Gp23xuURtm.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(333, 4, 13, 'Tuyau FREEZE', 'Le tuyau refroidissant Freeze de la marque MYA pour chicha', 'tuyau-freeze', 'https://www.el-badia.com/471-home_default/xtuyau-freeze.jpg.pagespeed.ic.TGPKzkuNGQ.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 113, 1, 1, NULL, NULL),
(334, 4, 13, 'Manche CARTEL Cigare', 'Manche CARTEL Cigare, 20cm avec un embout&nbsp;rond', 'manche-cartel-cigare', 'https://www.el-badia.com/10116-home_default/xmanche-cartel-cigare.jpg.pagespeed.ic.83YwvSYJbK.jpg', 24, 24, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(335, 4, 13, 'Manche VERRE FUMO', 'Manche VERRE pour chicha Fumo ®', 'manche-verre-fumo', 'https://www.el-badia.com/1010-home_default/xmanche-verre-fumo.jpg.pagespeed.ic._wui1DeHql.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(336, 4, 13, 'Manche en verre UNITY', 'Manche en verre pour tuyau de chicha en silicone de marque UNITY (4.0)', 'manche-en-verre-unity', 'https://www.el-badia.com/1882-home_default/xmanche-en-verre-pour-unity.jpg.pagespeed.ic.YvG6rlkovq.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(337, 4, 13, 'Tuyau WOOKAH en cuir', 'Les tuyaux WOOKAH sont fabriqués en silicone de haute qualité recouvert de véritable cuir cousu main', 'tuyau-wookah-en-cuir', 'https://www.el-badia.com/2577-home_default/xtuyau-wookah-en-cuir.jpg.pagespeed.ic.HWfNSr24I4.jpg', 70, 70, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(338, 4, 13, 'Manche MOZE BREEZE', 'Manche en verre MOZE BREEZE de 30 cm couvert dun manche en résine.', 'manche-moze-breeze', 'https://www.el-badia.com/9266-home_default/xmanche-moze-breeze.jpg.pagespeed.ic.PfsTmvYFmJ.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(339, 4, 13, 'Manche CARTEL Steel', 'Manche CARTEL STEEL, 39cm avec deux embouts interchangeables plat et rond', 'manche-cartel-steel', 'https://www.el-badia.com/6979-home_default/xmanche-cartel-steel.jpg.pagespeed.ic.cHpkGf3Cms.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(340, 4, 13, 'Manche CARTEL Zine', 'Manche CARTEL ZINE, 42cm avec un embout&nbsp;rond', 'manche-cartel-zine', 'https://www.el-badia.com/6980-home_default/xmanche-cartel-zine.jpg.pagespeed.ic.S7p3nFmShN.jpg', 45, 45, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(341, 4, 13, 'Manche Maklaud', 'Manche Maklaud, en métal, 35cm.', 'manche-maklaud', 'https://www.el-badia.com/10667-home_default/xmanche-maklaud.jpg.pagespeed.ic.oLuCEKQFg9.jpg', 45, 45, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 61, 1, 1, NULL, NULL),
(342, 4, 13, 'TUYAU KALOUD AEOLIS', 'Tuyau KALOUD&nbsp;AEOLIS&nbsp;® en silicone avec manche en bois noble et des pièces en métal en acier inoxydable', 'tuyau-kaloud-aeolis', 'https://www.el-badia.com/7154-home_default/xtuyau-kaloud-aeolis.jpg.pagespeed.ic.N5S1ToqW81.jpg', 139, 139, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 45, 1, 1, NULL, NULL),
(343, 4, 13, 'Manche Wookah Walnut Cuir', 'Le manche WOOKAH en cuir et en bois noble est renforcé par un tube en acier inoxidable.', 'manche-wookah-walnut-cuir', 'https://www.el-badia.com/10880-home_default/xmanche-wookah-walnut-cuir.jpg.pagespeed.ic.B7LaybYIlp.png', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(344, 4, 13, 'Manche ORDEN MAGNETIC SILVER', 'Manche ORDEN MAGNETIC SILVER, 33cm, fabriqué en acier inoxydable', 'manche-orden-magnetic-silver', 'https://www.el-badia.com/9409-home_default/xmanche-orden-magnetic-silver.jpg.pagespeed.ic.0W3sh6L4_R.jpg', 28, 28, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 87, 1, 1, NULL, NULL),
(345, 4, 13, 'Manche Wookah Iroko Cuir', 'Le manche WOOKAH en cuir et en bois noble est renforcé par un tube en acier inoxidable.', 'manche-wookah-iroko-cuir', 'https://www.el-badia.com/10881-home_default/xmanche-wookah-iroko-cuir.jpg.pagespeed.ic.36cP9AjJ18.png', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(346, 4, 13, 'Revêtement pour tuyau silicone SLEEVE', 'revêtement pour tuyau silicone de chicha', 'revetement-pour-tuyau-silicone-sleeve', 'https://www.el-badia.com/558-home_default/xsleeve-revetement-pour-tuyau-silicone.jpg.pagespeed.ic.6XivPN8A_n.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(347, 4, 13, 'Manche WOOKAH GROM', 'Le manche WOOKAH&nbsp;GROM en bois noble est renforcé par un tube en acier inoxydable.', 'manche-wookah-grom', 'https://www.el-badia.com/6570-home_default/xmanche-wookah-grom.jpg.pagespeed.ic.-TrugxXcZ6.jpg', 50, 50, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(348, 4, 13, 'Manche MR. WOOD', 'Manche MR. WOOD, en bois précieux et en acier inoxydable.', 'manche-mr-wood', 'https://www.el-badia.com/6405-home_default/xmanche-mrwood.jpg.pagespeed.ic.huyPLVlwGU.jpg', 30, 30, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 104, 1, 1, NULL, NULL),
(349, 4, 13, 'Tuyau VERRE FUMO', 'tuyau VERRE ultra souple (170cm) à manche et embout en verre (breveté) Fumo', 'tuyau-verre-fumo', 'https://www.el-badia.com/2243-home_default/xtuyau-verre-fumo.jpg.pagespeed.ic.qzP8eiyOb3.jpg', 50, 50, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(350, 4, 13, 'Manche DEVIL SMOKE COLORED PLAT', 'Manche&nbsp;DEVIL SMOKE COLORED PLAT, manche en verre pour tuyau à chicha en silicone avec embout plat', 'manche-devil-smoke-colored-plat', 'https://www.el-badia.com/3588-home_default/xmanche-devil-smoke-colored-plat.jpg.pagespeed.ic.eWpFjwHO3u.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(351, 4, 13, 'Tuyau Marrakech Striped', 'manche Marrakech avec tuyau silicone Stripped', 'tuyau-marrakech-striped', 'https://www.el-badia.com/4937-home_default/xtuyau-marrakech-striped.jpg.pagespeed.ic.TZHqnq5oJM.jpg', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(352, 4, 13, 'Manche Wookah Wenge Cuir', 'Le manche WOOKAH en cuir et en bois noble est renforcé par un tube en acier inoxidable.', 'manche-wookah-wenge-cuir', 'https://www.el-badia.com/10883-home_default/xmanche-wookah-wenge-cuir.jpg.pagespeed.ic.1suG7uV8cu.png', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(353, 4, 13, 'Manche MOZE ELEMENTS', 'Manche en verre MOZE ELEMENTS de 30 cm couvert dun manche en bois et résine de haute qualité.', 'manche-moze-elements', 'https://www.el-badia.com/6903-home_default/xmanche-moze-elements.jpg.pagespeed.ic.NIPFZpIsw3.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(354, 4, 13, 'Manche MOZE ELEMENTS', 'Manche en verre MOZE ELEMENTS de 30 cm couvert dun manche en bois et résine de haute qualité.', 'manche-moze-elements', 'https://www.el-badia.com/6903-home_default/xmanche-moze-elements.jpg.pagespeed.ic.NIPFZpIsw3.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(355, 4, 13, 'Manche MOZE ELEMENTS', 'Manche en verre MOZE ELEMENTS de 30 cm couvert dun manche en bois et résine de haute qualité.', 'manche-moze-elements', 'https://www.el-badia.com/6903-home_default/xmanche-moze-elements.jpg.pagespeed.ic.NIPFZpIsw3.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(356, 4, 13, 'Manche MOZE ELEMENTS', 'Manche en verre MOZE ELEMENTS de 30 cm couvert dun manche en bois et résine de haute qualité.', 'manche-moze-elements', 'https://www.el-badia.com/6903-home_default/xmanche-moze-elements.jpg.pagespeed.ic.NIPFZpIsw3.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(357, 4, 13, 'Manche MOZE ELEMENTS', 'Manche en verre MOZE ELEMENTS de 30 cm couvert dun manche en bois et résine de haute qualité.', 'manche-moze-elements', 'https://www.el-badia.com/6903-home_default/xmanche-moze-elements.jpg.pagespeed.ic.NIPFZpIsw3.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(358, 4, 13, 'Manche MOZE ELEMENTS', 'Manche en verre MOZE ELEMENTS de 30 cm couvert dun manche en bois et résine de haute qualité.', 'manche-moze-elements', 'https://www.el-badia.com/6903-home_default/xmanche-moze-elements.jpg.pagespeed.ic.NIPFZpIsw3.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(359, 4, 13, 'Manche Devil Smoke Tattoo Plat', 'Manche DEVIL SMOKE Tattoo, manche en verre pour tuyau à chicha en silicone', 'manche-devil-smoke-tattoo-plat', 'https://www.el-badia.com/4021-home_default/xmanche-devil-smoke-tattoo-plat.jpg.pagespeed.ic.I08z1zHiB7.jpg', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(360, 4, 13, 'Manche SWORD en verre pour tuyau silicone', 'Manche SWORD&nbsp;50cm&nbsp;en verre pour tuyau silicone. Vendu seul, sans tuyau', 'manche-sword-en-verre-pour-tuyau-silicone', 'https://www.el-badia.com/2461-home_default/xmanche-sword-en-verre-pour-tuyau-silicone.jpg.pagespeed.ic.vWQ-HQe4xy.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(361, 4, 13, 'Manche Devil Smoke Camouflage', 'Manche DEVIL SMOKE Camouflage, manche en verre pour tuyau à chicha en silicone', 'manche-devil-smoke-camouflage', 'https://www.el-badia.com/3729-home_default/manche-devil-smoke-camouflage.jpg', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(362, 4, 13, 'Tuyau PRO STEEL FUMO', 'Tuyau pour chicha PRO STEEL (165cm) à manche et embout en acier inoxydable (breveté) FUMO', 'tuyau-pro-steel-fumo', 'https://www.el-badia.com/5284-home_default/xtuyau-pro-steel-fumo.jpg.pagespeed.ic.5oXKB1tssP.jpg', 75, 75, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(363, 4, 13, 'Manche MOZE VIRUS', 'Manche en verre MOZE VIRUS de 30 cm couvert dun manche en bois de haute qualité.', 'manche-moze-virus', 'https://www.el-badia.com/6884-home_default/xmanche-moze-virus.jpg.pagespeed.ic.7fpG5ATS5y.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 13, 1, 1, NULL, NULL),
(364, 4, 13, 'Manche Wookah Teak Cuir', 'Le manche WOOKAH en cuir et en bois noble est renforcé par un tube en acier inoxidable.', 'manche-wookah-teak-cuir', 'https://www.el-badia.com/10868-home_default/xmanche-wookah-teak-cuir.jpg.pagespeed.ic.uQIOZ3N0yo.png', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(365, 4, 13, 'Manche EMBERY SLIM PIKE', 'Manche EMBERY SLIM PIKE, 32,5cm, acier inoxydable', 'manche-embery-slim-pike', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAEEAQQDASIAAhEB', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(366, 4, 13, 'Manche EMBERY WOOD SCARPENA', 'Manche EMBERY WOOD SCARPENA, en acier inoxydable et aluminium anodisé, longueur 29cm', 'manche-embery-wood-scarpena', 'https://www.el-badia.com/7900-home_default/xmanche-embery-wood-scarpena.jpg.pagespeed.ic.FVKZ9sl6KS.jpg', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(367, 4, 13, 'tuyau silicone UNITY (V4.0)', 'Tuyau en silicone et manche en verre pour le&nbsp;chicha&nbsp;UNITY (V4.0)&nbsp;', 'tuyau-silicone-unity-v4-0', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wgARCAEEAQQDASIAAhEB', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 65, 1, 1, NULL, NULL),
(368, 4, 13, 'Manche DEVIL SMOKE LEOPARD PLAT', 'Manche DEVIL SMOKE LEOPARD, manche en verre pour tuyau à chicha en silicone', 'manche-devil-smoke-leopard-plat', 'https://www.el-badia.com/3285-home_default/xmanche-devil-smoke-leopard.jpg.pagespeed.ic.UbYll3so2N.jpg', 17, 17, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(369, 4, 13, 'Tuyau STARBUZZ PHANTOM', 'Tuyau STARBUZZ PHANTOM en silicone et aluminium anodisé', 'tuyau-starbuzz-phantom', 'https://www.el-badia.com/5841-home_default/xtuyau-starbuzz-phantom.jpg.pagespeed.ic.FY5Ahx00Hw.jpg', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(370, 4, 13, 'Tuyau STARBUZZ SPEC-OP', 'Tuyau STARBUZZ SPEC-OP en silicone et manche en aluminium anodisé', 'tuyau-starbuzz-spec-op', 'https://www.el-badia.com/5842-home_default/xtuyau-starbuzz-spec-op.jpg.pagespeed.ic.mMeYVB_uyG.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(371, 4, 13, 'Manche DEVIL SMOKE METAL', 'Manche DEVIL SMOKE METAL, 40cm, bout rond, verre borosilicate', 'manche-devil-smoke-metal', 'https://www.el-badia.com/5872-home_default/xmanche-devil-metal.jpg.pagespeed.ic.QQUPjORCDV.jpg', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(372, 4, 13, 'Manche JAPONA HOOKAH', 'Manche en bois JAPONA HOOKAH, 30 cm', 'manche-japona-hookah', 'https://www.el-badia.com/11566-home_default/xmanche-japona-hookah.jpg.pagespeed.ic.lcySM1uJFK.png', 39, 39, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 90, 1, 1, NULL, NULL),
(373, 4, 13, 'Manche EMBERY WOOD SCARPENA GOLD', 'Manche EMBERY WOOD SCARPENA GOLD, en acier inoxydable et aluminium anodisé, longueur 29cm', 'manche-embery-wood-scarpena-gold', 'https://www.el-badia.com/7910-home_default/xmanche-embery-wood-scarpena-gold.jpg.pagespeed.ic.kh4gD-ZMjd.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 33, 1, 1, NULL, NULL),
(374, 4, 13, 'Manche Wookah Padouk Cuir', 'Le manche WOOKAH en cuir et en bois noble est renforcé par un tube en acier inoxidable.', 'manche-wookah-padouk-cuir', 'https://www.el-badia.com/10885-home_default/xmanche-wookah-padouk-cuir.jpg.pagespeed.ic.qL_F-N3qB8.png', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(375, 4, 13, 'Manche STEAMULATION CARBON', 'Manche STEAMULATION de 38cm en acier V2A et en carbone.', 'manche-steamulation-carbon', 'https://www.el-badia.com/6300-home_default/xmanche-steamulation-carbon.jpg.pagespeed.ic.SNiOD9A749.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(376, 4, 13, 'Manche WOOKAH NOX Cuir', 'Le manche WOOKAH NOX en cuir et en bois noble est renforcé par un tube en acier inoxydable.', 'manche-wookah-nox-cuir', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wgARCAEEAQQDASIAAhEB', 55, 55, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(377, 4, 13, 'Manche DSCHINNI ZEPTER FLIG FLAG', 'Manche DSCHINNI ZEPTER FLIG FLAG, 40cm, fabriqué en verre de laboratoire, torsadé et profilé', 'manche-dschinni-zepter-flig-flag', 'https://www.el-badia.com/10463-home_default/xmanche-dschinni-zepter-flig-flag.jpg.pagespeed.ic.xShPvmBEdN.png', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 78, 1, 1, NULL, NULL),
(378, 4, 13, 'Manche En Verre Skull', 'Manche en Verre Skull&nbsp;en forme tête de mort,&nbsp;manche en verre pour tuyau à chicha en silicone', 'manche-en-verre-skull', 'https://www.el-badia.com/4148-home_default/xmanche-en-verre-skull.jpg.pagespeed.ic.wHzaJ1Cv_d.jpg', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 14, 1, 1, NULL, NULL),
(379, 4, 13, 'Manche DEVIL SMOKE LICORNE', 'Manche DEVIL SMOKE LICORNE, 30cm, bout rond, verre borosilicate', 'manche-devil-smoke-licorne', 'https://www.el-badia.com/6103-home_default/xmanche-devil-smoke-licorne.jpg.pagespeed.ic.0cwf8SksBe.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(380, 4, 13, 'Manche WERKBUND MINIMALISM', 'Manche en bois WERKBUND MINIMALISM environ 40cm', 'manche-werkbund-minimalism', 'https://www.el-badia.com/5026-home_default/xmanche-werkbund-minimalism.jpg.pagespeed.ic.PZ8amVO4Mu.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 92, 1, 1, NULL, NULL),
(381, 4, 13, 'Flexible silicone', 'Flexible silicone pour tuyau de chicha, &nbsp;longueur 150cm. Vendu seul.', 'flexible-silicone', 'https://www.el-badia.com/555-home_default/xtuyau-silicone.jpg.pagespeed.ic.jJMxSJD8be.jpg', 5, 5, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(382, 4, 13, 'Tuyau flexible silicone EL-BADIA P1', 'Tuyau&nbsp;flexible en&nbsp;silicone pour chicha EL-BADIA P1', 'tuyau-flexible-silicone-el-badia-p1', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAEEAQQDASIAAhEB', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(383, 4, 13, 'Manche WERKBUND GLORY', 'Manche en bois WERKBUND GLORY environ 40cm', 'manche-werkbund-glory', 'https://www.el-badia.com/5028-home_default/manche-werkbund-glory.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 92, 1, 1, NULL, NULL),
(384, 4, 13, 'Manche WERKBUND AUTHENTIC', 'Manche en bois WERKBUND AUTHENTIC, environ 40cm', 'manche-werkbund-authentic', 'https://www.el-badia.com/5027-home_default/xmanche-werkbund-authentic.jpg.pagespeed.ic.8fW01J-qgD.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 92, 1, 1, NULL, NULL),
(385, 4, 13, 'Manche DEVIL SMOKE LEOPARD REVOLUTION', 'Manche DEVIL SMOKE LEOPARD REVOLUTION, manche en verre pour tuyau à chicha en silicone', 'manche-devil-smoke-leopard-revolution', 'https://www.el-badia.com/3282-home_default/xmanche-devil-smoke-leopard-rev-revolution.jpg.pagespeed.ic.r-FdCY_Yxk.jpg', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(386, 4, 13, 'Manche QUASAR JABED', 'Manche QUASAR JABED, 40 cm, en aluminium anodisé, fourni avec un connecteur tuyau.', 'manche-quasar-jabed', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wgARCAEEAQQDASIAAhEB', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(387, 4, 13, 'Manche WERKBUND RUBBER', 'Manche en bois WERKBUND RUBBER environ 40cm', 'manche-werkbund-rubber', 'https://www.el-badia.com/5165-home_default/manche-werkbund-rubber.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 92, 1, 1, NULL, NULL),
(388, 4, 13, 'Manche STEAMULATION KONUS ONE', 'Manche STEAMULATION KONUS ONE de la marque germano-suisse STEAMULATION', 'manche-steamulation-konus-one', 'https://www.el-badia.com/3853-home_default/xmanche-steamulation-konus-one.jpg.pagespeed.ic._aSn_-WE1j.jpg', 30, 30, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 8, 1, 1, NULL, NULL),
(389, 4, 13, 'Manche DEVIL SMOKE TIGER TWISTED', 'Manche DEVIL SMOKE TIGER TWISTED, manche en verre pour tuyau à chicha en silicone', 'manche-devil-smoke-tiger-twisted', 'https://www.el-badia.com/3283-home_default/xmanche-devil-smoke-tiger-twist.jpg.pagespeed.ic.LfYJGEFjEu.jpg', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(390, 4, 13, 'Manche DEVIL ICE BABY', 'Manche en verre DEVIL ICE BABY, 40 cm bout rond', 'manche-devil-ice-baby', 'https://www.el-badia.com/4956-home_default/manche-devil-ice-baby.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(391, 4, 13, 'Manche CARTEL MOONSHINE', 'Manche CARTEL MOONSHINE, 34cm, en verre borosilicate, avec une prise en main de type verre de Cognac', 'manche-cartel-moonshine', 'https://www.el-badia.com/6989-home_default/xmanche-cartel-moonshine.jpg.pagespeed.ic.K-DU8MECoZ.jpg', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 59, 1, 1, NULL, NULL),
(392, 4, 13, 'Manche DEVIL SMOKE ZEPTER ROYAL', 'Manche DEVIL SMOKE ZEPTER ROYAL, 34cm, en verre borosilicate', 'manche-devil-smoke-zepter-royal', 'https://www.el-badia.com/5867-home_default/xmanche-devil-smoke-zepter-royal.jpg.pagespeed.ic.7JQ9qnKMw5.jpg', 22, 22, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(393, 4, 13, 'Manche AEON CARBON 32cm', 'Manche AEON CARBON 32cm, manche carbon pour tuyau flexible à chicha', 'manche-aeon-carbon-32cm', 'https://www.el-badia.com/5001-home_default/manche-aeon-carbon-32cm.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 18, 1, 1, NULL, NULL),
(394, 4, 13, 'Manche ORDEN ELECTRIC GOLD', 'Manche ORDEN ELECTRIC GOLD, 33cm, fabriqué en acier inoxydable', 'manche-orden-electric-gold', 'https://www.el-badia.com/9407-home_default/xmanche-orden-electric-gold.jpg.pagespeed.ic.HDMcFcHxoR.jpg', 26, 26, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 87, 1, 1, NULL, NULL),
(395, 4, 13, 'Tuyau Cuir MR. WOOD', 'Tuyau en cuir MR. WOOD, longueur 140cm, fait-main.', 'tuyau-cuir-mr-wood', 'https://www.el-badia.com/6400-home_default/xtuyau-cuir-mrwood.jpg.pagespeed.ic.cujquiAI8I.jpg', 30, 30, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 104, 1, 1, NULL, NULL),
(396, 4, 13, 'Manche DEVIL SMOKE THREE BALL LEO', 'Manche DEVIL SMOKE THREE BALL LEO, manche en verre pour tuyau à chicha en silicone', 'manche-devil-smoke-three-ball-leo', 'https://www.el-badia.com/3284-home_default/xmanche-devil-smoke-three-ball-leo.jpg.pagespeed.ic.gEunbUu6p7.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(397, 4, 13, 'Manche DEVIL SMOKE DIABLO GOLDEN NUGGET 24K', 'Manche DEVIL SMOKE DIABLO GOLDEN NUGGET 24K, manche en verre pour tuyau à chicha en silicone', 'manche-devil-smoke-diablo-golden-nugget-24k', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAEEAQQDASIAAhEB', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(398, 4, 13, 'Tuyau SS MOUTHPIECE FUMO', 'tuyau pour chicha SS MOUTHPIECE (153cm) à manche et embout en acier inoxydable (breveté) FUMO', 'tuyau-ss-mouthpiece-fumo', 'https://www.el-badia.com/2244-home_default/xtuyau-ss-mouthpiece-fumo.jpg.pagespeed.ic.EsVALy5lrD.jpg', 60, 60, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(399, 4, 13, 'Manche WOOKAH WHITE NOX', 'Le manche WOOKAH&nbsp;WHIE NOX en bois noble est renforcé par un tube en acier inoxydable.', 'manche-wookah-white-nox', 'https://www.el-badia.com/6572-home_default/xmanche-wookah-white-nox.jpg.pagespeed.ic.B15XHB7GJ-.jpg', 45, 45, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(400, 4, 13, 'Manche DEVIL SMOKE FLUTED CURVED 3', 'Manche DEVIL SMOKE FLUTED CURVED 3, 42cm, bout rond, en verre borosilicate', 'manche-devil-smoke-fluted-curved-3', 'https://www.el-badia.com/5864-home_default/xmanche-devil-smoke-fluted-curved-3.jpg.pagespeed.ic.Gahzwrvx35.jpg', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(401, 4, 13, 'Manche Wookah Meranti Cuir', 'Le manche WOOKAH en cuir et en bois noble est renforcé par un tube en acier inoxidable.', 'manche-wookah-meranti-cuir', 'https://www.el-badia.com/3004-home_default/xmanche-wookah-meranti-cuir.jpg.pagespeed.ic.X-afWGCZtV.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(402, 4, 13, 'Manche DEVIL SMOKE 24K GOLD CAMOUFLAGE', 'Manche DEVIL SMOKE 24K GOLD CAMOUFLAGE, , manche en verre pour tuyau à chicha en silicone', 'manche-devil-smoke-24k-gold-camouflage', 'https://www.el-badia.com/4276-home_default/xmanche-devil-smoke-24k-gold-camouflage.jpg.pagespeed.ic.4pLlxw0Vz3.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(403, 4, 13, 'Manche MAVERICK', 'Manche en bois MAVERICK HOOKAH et en acier de 30 cm avec effet phosphorescent.', 'manche-maverick', 'https://www.el-badia.com/6426-home_default/xmanche-maverick.jpg.pagespeed.ic.G3oYzk1847.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 117, 1, 1, NULL, NULL),
(404, 4, 13, 'Manche DEVIL SMOKE FLUTED CURVED 1', 'Manche DEVIL SMOKE FLUTED CURVED 1, 20cm, bout rond, en verre borosilicate', 'manche-devil-smoke-fluted-curved-1', 'https://www.el-badia.com/5873-home_default/xmanche-devil-smoke-fluted-curved-1.jpg.pagespeed.ic.CIzq9t77ja.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(405, 4, 13, 'Manche DEVIL SMOKE SWAROVSKI', 'Manche DEVIL SMOKE SWAROVSKI, 40cm, en verre de laboratoire, décoré de cristaux SWAROVSKI', 'manche-devil-smoke-swarovski', 'https://www.el-badia.com/5976-home_default/xmanche-devil-smoke-swarovski-royal.jpg.pagespeed.ic.B2eXQ2otr0.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(406, 4, 13, 'Manche Wookah Nox', 'Le manche WOOKAH NOX &nbsp;en bois noble est renforcé par un tube en acier inoxydable.', 'manche-wookah-nox', 'https://www.el-badia.com/10867-home_default/xmanche-wookah-nox.jpg.pagespeed.ic.CcApXoV5_B.png', 45, 45, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(407, 4, 13, 'Tuyau silicone FLUO', 'Tuyau silicone phosphorescent, 150cm vendu seul', 'tuyau-silicone-fluo', 'https://www.el-badia.com/1138-home_default/tuyau-silicone-fluo.jpg', 14, 14, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(408, 4, 13, 'Tuyau ADALYA ATH Traditionnel', 'Tuyau ATH ADALYA TRADI, en cuir, long de 180 cm, longueur du manche 50cm.', 'tuyau-adalya-ath-traditionnel', 'https://www.el-badia.com/6536-home_default/xtuyau-adalya-ath-traditionnel.jpg.pagespeed.ic.H7fUBXe_DF.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(409, 4, 13, 'Tuyau ADALYA ATH Traditionnel', 'Tuyau ATH ADALYA TRADI, en cuir, long de 180 cm, longueur du manche 50cm.', 'tuyau-adalya-ath-traditionnel', 'https://www.el-badia.com/6536-home_default/xtuyau-adalya-ath-traditionnel.jpg.pagespeed.ic.H7fUBXe_DF.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(410, 4, 13, 'Tuyau ADALYA ATH Traditionnel', 'Tuyau ATH ADALYA TRADI, en cuir, long de 180 cm, longueur du manche 50cm.', 'tuyau-adalya-ath-traditionnel', 'https://www.el-badia.com/6536-home_default/xtuyau-adalya-ath-traditionnel.jpg.pagespeed.ic.H7fUBXe_DF.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(411, 4, 13, 'Tuyau ADALYA ATH Traditionnel', 'Tuyau ATH ADALYA TRADI, en cuir, long de 180 cm, longueur du manche 50cm.', 'tuyau-adalya-ath-traditionnel', 'https://www.el-badia.com/6536-home_default/xtuyau-adalya-ath-traditionnel.jpg.pagespeed.ic.H7fUBXe_DF.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(412, 4, 13, 'Tuyau ADALYA ATH Traditionnel', 'Tuyau ATH ADALYA TRADI, en cuir, long de 180 cm, longueur du manche 50cm.', 'tuyau-adalya-ath-traditionnel', 'https://www.el-badia.com/6536-home_default/xtuyau-adalya-ath-traditionnel.jpg.pagespeed.ic.H7fUBXe_DF.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(413, 4, 13, 'Tuyau ADALYA ATH Traditionnel', 'Tuyau ATH ADALYA TRADI, en cuir, long de 180 cm, longueur du manche 50cm.', 'tuyau-adalya-ath-traditionnel', 'https://www.el-badia.com/6536-home_default/xtuyau-adalya-ath-traditionnel.jpg.pagespeed.ic.H7fUBXe_DF.jpg', 69, 69, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(414, 4, 12, 'Manche MARRAKECH', 'Manche MARRAKECH&nbsp;en alumiunium brossé, 41cm fourni avec connecteur', 'manche-marrakech', 'https://www.el-badia.com/10083-home_default/xmanche-marrakech.jpg.pagespeed.ic.z-JAgIyjQq.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(415, 4, 12, 'Manche FROSTED GLASS XL', 'Manche en verre pour tuyau silicone FROSTED GLASS XL, 40cm, finition sablée, embout plat', 'manche-frosted-glass-xl', 'https://www.el-badia.com/5382-home_default/xmanche-frosted-glass-xl.jpg.pagespeed.ic.O8FhkMt5PT.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(416, 4, 12, 'Manche El-Badia Carbon', 'Manche CARBON, 40cm de long, ultra léger ce manche pour flexible silicone ne pèse que 40 grammes.', 'manche-el-badia-carbon', 'https://www.el-badia.com/6233-home_default/xmanche-carbon.jpg.pagespeed.ic.0QJKTA0Amm.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(417, 4, 12, 'ICE TIP BAZOOKA 2.0', 'ICE TIP BAZOOKA 2.0 : embout refroidissant pour chicha', 'ice-tip-bazooka-2-0', 'https://www.el-badia.com/4364-home_default/xice-tip-bazooka-20.jpg.pagespeed.ic.N_OINAwYOP.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(418, 4, 12, 'Manche COLORED GLASS', 'Manche COLORED GLASS, 30cm, en verre pour tuyau silicone, embout rond', 'manche-colored-glass', 'https://www.el-badia.com/5379-home_default/xmanche-colored-glass.jpg.pagespeed.ic.lDJecKItPX.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(419, 4, 12, 'Manche SWORD', 'Manche SWORD en alumiunium brossé, 40cm fourni avec un connecteur', 'manche-sword', 'https://www.el-badia.com/3236-home_default/xmanche-sword.jpg.pagespeed.ic.Fr-ms_w1VM.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(420, 4, 12, 'Manche AEON VYRO CARBON 17cm', 'Manche pour tuyau AEON VYRO CARBON 17cm, inox et carbone&nbsp;', 'manche-aeon-vyro-carbon-17cm', 'https://www.el-badia.com/9456-home_default/xmanche-aeon-vyro-carbon-17cm.jpg.pagespeed.ic.fh_P99DZXK.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(421, 4, 12, 'Manche AEON VYRO CARBON 40cm', 'Manche pour tuyau AEON VYRO CARBON 40cm, inox et carbone', 'manche-aeon-vyro-carbon-40cm', 'https://www.el-badia.com/9473-home_default/xmanche-aeon-vyro-carbon-40cm.jpg.pagespeed.ic.vSWhwQgvT6.jpg', 22, 22, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(422, 4, 12, 'Manche EL-BADIA P1', 'Manche pour chicha EL-BADIA P1', 'manche-el-badia-p1', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAEEAQQDASIAAhEB', 4, 4, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(423, 4, 12, 'Manche CURLY GLASS', 'Manche en verre CURLY GLASS, 30cm, avec poignée en verre tressée et colorée', 'manche-curly-glass', 'https://www.el-badia.com/5292-home_default/xmanche-curly-glass.jpg.pagespeed.ic.gNLCjS2nY6.jpg', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(424, 4, 12, 'Manche AEON VYRO CARBON 30cm', 'Manche pour tuyau AEON VYRO CARBON 30cm, inox et carbone&nbsp;', 'manche-aeon-vyro-carbon-30cm', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wgARCAEEAQQDASIAAhEB', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(425, 4, 12, 'Manche CAMO GLASS', 'Manche CAMO GLASS, 27cm, en verre pour tuyau silicone, embout plat', 'manche-camo-glass', 'https://www.el-badia.com/6277-home_default/xmanche-camo-glass.jpg.pagespeed.ic.bdOHCYr6AM.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 1, 1, 1, NULL, NULL),
(426, 4, 12, 'Manche MIG R93 Carbon', 'Manche MIG R93 Carbon, 40cm de long, effet carbone disponible en plusieurs colors', 'manche-mig-r93-carbon', 'https://www.el-badia.com/8163-home_default/xmanche-mig-r93-carbon.jpg.pagespeed.ic.UkZuRaP2QM.jpg', 35, 35, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 58, 1, 1, NULL, NULL),
(427, 4, 12, 'Manche OCEAN HOOKAH FUSION X TWISTED', 'Manche OCEAN HOOKAH FUSION X TWISTED, 37cm, poignée en acier inoxydable V2A et embout en verre borosilicate', 'manche-ocean-hookah-fusion-x-twisted', 'https://www.el-badia.com/8022-home_default/xmanche-ocean-hookah-fusion-x-twisted.jpg.pagespeed.ic.B2fIWI6qUA.jpg', 29, 29, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 25, 1, 1, NULL, NULL),
(428, 4, 12, 'Manche WOOKAH Standard', 'Le manche WOOKAH en bois noble est renforcé par un tube en acier inoxidable.', 'manche-wookah-standard', 'https://www.el-badia.com/2578-home_default/xmanche-wookah-standard.jpg.pagespeed.ic.j_C4Zm3sie.jpg', 25, 25, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 39, 1, 1, NULL, NULL),
(468, 7, 20, 'Cartouche HOOKY 3ml X3', 'Lot de 3 cartouches HOOKY 3ml avec bougie intégrée et coton pré-imbibé, utilisation facile et instantanée&nbsp;', 'cartouche-hooky-3ml-x3', 'https://www.el-badia.com/10299-home_default/xcartouche-hooky-3ml-x3.jpg.pagespeed.ic._GYca1ukGB.png', 9, 9, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(469, 7, 20, 'HOOKY SLIM', 'Chicha électronique SLIM de la marque française HOOKY, utilisation intuitive et performances optimum', 'hooky-slim', 'https://www.el-badia.com/7820-home_default/xhooky-slim.jpg.pagespeed.ic.UBsfAbyU4b.png', 60, 60, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(470, 7, 20, 'Cartouches E-HOSE STARBUZZ', 'Lot de 4 cartouches pour E-HOSE STARBUZZ 0 nicotine', 'cartouches-e-hose-starbuzz', 'https://www.el-badia.com/1279-home_default/xcartouches-pour-e-hose-starbuzz.jpg.pagespeed.ic.LgwPPrFRHp.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(471, 7, 20, 'HOOKY SLIM BLACK', 'Chicha électronique SLIM BLACK EDITION de la marque française HOOKY', 'hooky-slim-black', 'https://www.el-badia.com/7823-home_default/xhooky-slim-black.jpg.pagespeed.ic.fdF7j3yo16.png', 60, 60, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(472, 7, 20, 'E-chicha Jetable WPUFF 0% nicotine', 'WPUFF 0% nicotine : e-chicha jetable de type POD, disponible en plusieurs parfums,&nbsp;sans nicotine', 'e-chicha-jetable-wpuff-0-nicotine', 'https://www.el-badia.com/11573-home_default/xe-chicha-jetable-wpuff-0-nicotine.jpg.pagespeed.ic.k5uvPIuhP9.png', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(473, 7, 20, 'Hooky Slim Gold 24K Carbon', 'Chicha électronique SLIM de la marque française HOOKY, en version GOLD 24K CARBON', 'hooky-slim-gold-24k-carbon', 'https://www.el-badia.com/7826-home_default/xhooky-slim-gold-24k-carbon.jpg.pagespeed.ic.5X-EzB3nNZ.png', 100, 100, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(474, 7, 20, 'E-Liquide STARBUZZ 15ml', 'E-Liquide STARBUZZ en flacon de 15ml pour chicha électronique 0% nicotine', 'e-liquide-starbuzz-15ml', 'https://www.el-badia.com/2422-home_default/xe-liquide-starbuzz-15ml.jpg.pagespeed.ic.wbxcPEnm6E.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(475, 7, 20, 'E-chicha Jetable WPUFF 0.9% nicotine', 'WPUFF 0,9% nicotine : e-chicha jetable de type POD, disponible en plusieurs parfums, avec 0,9% de sel de nicotine', 'e-chicha-jetable-wpuff-0-9-nicotine', 'https://www.el-badia.com/11589-home_default/xe-chicha-jetable-wpuff-09-nicotine.jpg.pagespeed.ic.k5uvPIuhP9.png', 7, 7, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(476, 7, 20, 'Capuchon Pour Cartouche HOOKY', 'Capuchon pour cartouche HOOKY', 'capuchon-pour-cartouche-hooky', 'https://www.el-badia.com/10292-home_default/xcapuchon-pour-cartouche-hooky.jpg.pagespeed.ic.ebR37aNc51.png', 5, 5, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(477, 7, 20, 'HOOKY CLASSIC', 'HOOKY CLASSIC : Moderne, ergonomique et efficace.', 'hooky-classic', 'https://www.el-badia.com/7817-home_default/xhooky-classic.jpg.pagespeed.ic.uhpoKXaIeN.png', 80, 80, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(478, 7, 20, 'HOOKY ROYAL', 'HOOKY ROYALE: Le haut de gamme de la chicha électronique.', 'hooky-royal', 'https://www.el-badia.com/7814-home_default/xhooky-royal.jpg.pagespeed.ic.ldgh_Uvges.png', 120, 120, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(479, 7, 20, 'E-liquide Hooky 250ml', 'E-Liquide HOOKY&nbsp;pour chicha électronique en 250ml&nbsp;0% nicotine', 'e-liquide-hooky-250ml', 'https://www.el-badia.com/4000-home_default/xe-liquide-hooky-250ml.jpg.pagespeed.ic.nacZi5w9Hr.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(480, 7, 20, 'MINI E-CHICHA STARBUZZ', 'Mini E-Hose&nbsp;Starbuzz : la dernière innovation en chicha électronique en format de poche !', 'mini-e-chicha-starbuzz', 'https://www.el-badia.com/2183-home_default/xmini-e-chicha-starbuzz.jpg.pagespeed.ic.c4_P1UhiXl.jpg', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL);
INSERT INTO `product` (`id`, `category_id`, `sous_category_id`, `nom`, `content`, `slug`, `image`, `price`, `price_ht`, `promotion`, `nouveaute`, `color_id`, `taille`, `vase`, `tuyau`, `fixation`, `autre`, `publie`, `is_best`, `marque_id`, `gramme`, `en_stock`, `quantite`, `intro`) VALUES
(481, 7, 20, 'Bougie HOOKY HEAD', 'Boogie pour HOOKY&nbsp;Head', 'bougie-hooky-head', 'https://www.el-badia.com/4008-home_default/xbougie-hooky-head.jpg.pagespeed.ic.gzo1EXoZCK.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(482, 7, 20, 'Cartouches E-HOSE SQUARE', 'Lot de 4 cartouches pour E-HOSE MINI &amp;&nbsp;E-HOSE STARBUZZ 0 nicotine', 'cartouches-e-hose-square', 'https://www.el-badia.com/1567-home_default/xcartouches-e-hose-square.jpg.pagespeed.ic._PME2jKsKx.jpg', 12, 12, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(483, 7, 20, 'Bougie HOOKY V2', 'Bougie de remplacement pour chicha électronique HOOKY&nbsp;', 'bougie-hooky-v2', 'https://www.el-badia.com/7830-home_default/xbougie-slim.jpg.pagespeed.ic.vRzgHqrYWr.png', 5, 5, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(484, 7, 20, 'E-Liquide STARBUZZ 30ml', 'E-Liquide STARBUZZ pour chicha électronique&nbsp;0% nicotine', 'e-liquide-starbuzz-30ml', 'https://www.el-badia.com/1498-home_default/xe-liquide-starbuzz-30ml.jpg.pagespeed.ic.wbxcPEnm6E.jpg', 18, 18, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(485, 7, 20, 'Embout HOOKY', 'Embout pour HOOKY CLASSIC/ROYAL', 'embout-hooky', 'https://www.el-badia.com/2606-home_default/xembout-hooky.jpg.pagespeed.ic.SJqIhQoIr6.jpg', 3, 3, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(486, 7, 20, 'Reservoir HOOKY HEAD', 'Réservoir pour HOOKY Head', 'reservoir-hooky-head', 'https://www.el-badia.com/4011-home_default/xreservoir-hooky-head.jpg.pagespeed.ic.XjWq6n75Bo.jpg', 30, 30, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(487, 7, 20, 'Tête HOOKY', 'Tête HOOKY&nbsp;', 'tete-hooky', 'https://www.el-badia.com/7829-home_default/xtete-slim.jpg.pagespeed.ic.53NeC0s_pq.png', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(488, 7, 20, 'E-liquide HOOKY 10ml', 'E-Liquide HOOKY&nbsp;pour chicha électronique en 10ml&nbsp;0% nicotine', 'e-liquide-hooky-10ml', 'https://www.el-badia.com/2787-home_default/xe-liquide-hooky-10ml.jpg.pagespeed.ic.7n2dZEOlYo.jpg', 5, 5, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(489, 7, 20, 'Chargeur HOOKY', 'Chargeur pour HOOKY CLASSIC/ROYAL', 'chargeur-hooky', 'https://www.el-badia.com/2608-home_default/xchargeur-hooky.jpg.pagespeed.ic.9bbRaxGnuH.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(490, 7, 20, 'E-liquide HOOKY 30ml', 'E-Liquide HOOKY&nbsp;pour chicha électronique en 30ml&nbsp;0% nicotine', 'e-liquide-hooky-30ml', 'https://www.el-badia.com/3669-home_default/xe-liquide-hooky-30ml.jpg.pagespeed.ic.7n2dZEOlYo.jpg', 9, 9, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(491, 7, 20, 'Bougie HOOKY V1', 'Boogie pour HOOKY CLASSIC/ROYAL (ancienne génération)', 'bougie-hooky-v1', 'https://www.el-badia.com/2607-home_default/xbougie-hooky.jpg.pagespeed.ic.SnT4WsNowu.jpg', 5, 5, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(492, 7, 20, 'Joint de remplacement E-Hose', 'Joint de remplacement pour E-Hose SQUARE', 'joint-de-remplacement-e-hose', 'https://www.el-badia.com/3702-home_default/xjoint-de-remplacement-e-hose.jpg.pagespeed.ic.47IS0IEaKl.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(493, 7, 20, 'E-HOSE STARBUZZ : chicha électronique', 'E-HOSE STARBUZZ : la dernière innovation en chicha électronique', 'e-hose-starbuzz-chicha-electronique', 'https://www.el-badia.com/1272-home_default/xe-hose-starbuzz.jpg.pagespeed.ic.zKFH4uwjUJ.jpg', 129, 129, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(494, 7, 20, 'Foyer électronique Starbuzz', 'Le foyer électronique par STARBUZZ à utiliser avec tous les liquides de e-chicha ou e-cigarette', 'foyer-electronique-starbuzz', 'https://www.el-badia.com/3053-home_default/xfoyer-electronique-starbuzz.jpg.pagespeed.ic.6EANFm12h6.png', 139, 139, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(495, 7, 20, 'Étui HOOKY Classic', 'Étui pour HOOKY Classic', 'etui-hooky-classic', 'https://www.el-badia.com/10567-home_default/xetui-hooky-classic.jpg.pagespeed.ic.ImSltG6qsf.png', 24, 24, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(496, 7, 20, 'Bougie foyer électronique STARBUZZ', 'Bougie pour foyer électronique STARBUZZ', 'bougie-foyer-electronique-starbuzz', 'https://www.el-badia.com/5320-home_default/xbougie-foyer-elect-starbuzz.jpg.pagespeed.ic.wmHsJoZW9U.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(497, 7, 20, 'Réservoir foyer électronique STARBUZZ', 'Réservoir pour foyer électronique STARBUZZ', 'reservoir-foyer-electronique-starbuzz', 'https://www.el-badia.com/5319-home_default/xreservoir-foyer-elect-starbuzz.jpg.pagespeed.ic.Mi2kLmV8me.jpg', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 19, 1, 1, NULL, NULL),
(498, 7, 20, 'Etui Hooky Slim', 'Etui pour chicha électronique HOOKY SLIM', 'etui-hooky-slim', 'https://www.el-badia.com/7831-home_default/xetui-hooky-slim.jpg.pagespeed.ic.kaJnM7BHeg.png', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(499, 7, 20, 'Tete Hooky Slim Gold 24k', 'Tête de la marque HOOKY pour le modèle SLIM.', 'tete-hooky-slim-gold-24k', 'https://www.el-badia.com/6304-home_default/xtete-hooky-slim-gold-24k.jpg.pagespeed.ic.tSguqBn2Ou.png', 20, 20, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(500, 7, 20, 'Etui HOOKY ROYAL', 'Étui pour HOOKY&nbsp;Royal', 'etui-hooky-royal', 'https://www.el-badia.com/10572-home_default/xetui-hooky-royal.jpg.pagespeed.ic.fpgsL3t6pH.png', 30, 30, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 76, 1, 1, NULL, NULL),
(501, 2, 27, 'ICE FRUTZ 120g', 'Le ICE FRUTZ 120g est une pâte composée de glycérine végétale gélifiée et sutilise comme le tabac à chicha, mais ne contient ni tabac, ni nicotine.&nbsp;', 'ice-frutz-120g', 'https://www.el-badia.com/7281-home_default/xice-frutz-120g.jpg.pagespeed.ic.Xr3PxqI4qs.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(502, 2, 27, 'SHIAZO 100gr', 'SHIAZO : Pierres minérales aromatisées pour chicha 0% tabac, 0% nicotine et 100% vapeur, boite de 100g goût', 'shiazo-100gr', 'https://www.el-badia.com/7241-home_default/xshiazo-100gr.jpg.pagespeed.ic.Bztj9MD42M.jpg', 5, 5, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(503, 2, 27, 'CLOUD ONE 200g', 'CLOUD ONE 200G : goût pour chicha à base de fibre de cellulose, glycérine et arômes, 0 nicotine 0 tabac', 'cloud-one-200g', 'https://www.el-badia.com/7926-home_default/xcloud-one-200g.jpg.pagespeed.ic.T84a7Ll4Wt.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(504, 2, 27, 'Glycérine Adalya Mix', 'Glycérine ADALYA MIX 170ml pour tabac ou pierres à chicha', 'glycerine-adalya-mix', 'https://www.el-badia.com/6347-home_default/xglycerine-adalya-mix.jpg.pagespeed.ic.axV8-g_VvB.jpg', 9, 9, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 112, 1, 1, NULL, NULL),
(505, 2, 27, 'TRUE CLOUDZ Crème Pour Chicha', 'Crème pour chicha TRUE CLOUDZ SANS TABAC ET SANS NICOTINE, boite de 75g', 'true-cloudz-creme-pour-chicha', 'https://www.el-badia.com/6959-home_default/xtruecloudz-creme-pour-chicha.jpg.pagespeed.ic.toKPAhtoMV.jpg', 9, 9, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(506, 2, 27, 'UNIVERSAL VAPOR CREAM', 'UNIVERSAL VAPOR CREAM 120g, goût pour chicha sous forme de gel, sans tabac, sans nicotine et beaucoup darômes !', 'universal-vapor-cream', 'https://www.el-badia.com/7838-home_default/xuniversal-vapor-cream.jpg.pagespeed.ic.PLoOJv2fr_.jpg', 10, 10, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(507, 2, 27, 'Pierres MIG VULCANOS 150g', 'MIG VULCANOS&nbsp;: Pierres minérales aromatisées pour chicha 0% tabac, 0% nicotine et 100% vapeur, boite de 150g goût', 'pierres-mig-vulcanos-150g', 'https://www.el-badia.com/7723-home_default/xpierres-mig-vulcanos-150g.jpg.pagespeed.ic.ZaNhiBrEdQ.png', 19, 19, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, 58, 1, 1, NULL, 'PIERRES MIG VULCANOS'),
(508, 2, 27, 'Goût pour chicha Cloud One 5+1', '', 'gout-pour-chicha-cloud-one-5-1', 'https://www.el-badia.com/8823-home_default/xcloud-one-51.jpg.pagespeed.ic.bkam51Fbwk.jpg', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(509, 2, 27, 'ICE FRUTZ 50g', 'ICE FRUTZ 50g, pâte composée de glycérine végétale gélifiée et sutilise comme le tabac à chicha, mais ne contient ni tabac, ni nicotine.&nbsp;', 'ice-frutz-50g', 'https://www.el-badia.com/6962-home_default/xice-frutz-50g.jpg.pagespeed.ic.FBaBfwCqxR.jpg', 3, 3, 0, 0, NULL, 0, '', '', '', NULL, 1, 0, NULL, 1, 1, NULL, NULL),
(510, 2, 27, 'Pierres DSCHINNI Stones 500g', 'Découvrez les goûts des tabacs DSCHINNI avec les pierres minérales DSCHINNI STONES aromatisées mais sans nicotine ni tabac, et quiproduisent une fumée de vapeur épaisse avec un goût intense.', 'pierres-dschinni-stones-500g', 'https://www.el-badia.com/7734-home_default/xpierres-dschinni-stones-500g.jpg.pagespeed.ic.VMqG0-bhil.jpg', 24, 24, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, 78, 1, 1, NULL, NULL),
(511, 2, 27, 'MIG Vulcanos 5+1', '', 'mig-vulcanos-5-1', 'https://www.el-badia.com/8821-home_default/mig-vulcanos-51.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(512, 2, 27, 'ICE FRUTZ 100g', 'Le ICE FRUTZ est une pâte composée de glycérine végétale gélifiée et sutilise comme le tabac à chicha, mais ne contient ni tabac, ni nicotine.&nbsp;', 'ice-frutz-100g', 'https://www.el-badia.com/6761-home_default/xice-frutz-100g.jpg.pagespeed.ic.Bsi3PjssJu.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(513, 2, 27, 'TRUE CLOUDZ 5+1', '', 'true-cloudz-5-1', 'https://www.el-badia.com/8820-home_default/xtrue-cloudz-51.jpg.pagespeed.ic.H0uoll-SZA.jpg', 49, 49, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(514, 2, 27, 'NEXIT 200g', 'NEXIT&nbsp;200G : goût pour chicha à base de fibre de cellulose, glycérine et arômes, 0 nicotine 0 tabac', 'nexit-200g', 'https://www.el-badia.com/8243-home_default/xnexit-200g.jpg.pagespeed.ic.iKaJfhaFES.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(515, 2, 27, 'ICE FRUTZ Xtra 100g', 'Le ICE FRUTZ XTRA est une pâte composée de glycérine végétale gélifiée et sutilise comme le tabac à chicha, mais ne contient ni tabac, ni nicotine.&nbsp;', 'ice-frutz-xtra-100g', 'https://www.el-badia.com/6960-home_default/xice-frutz-xtra-100g.jpg.pagespeed.ic.27bNKUlKgc.jpg', 6, 6, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(516, 2, 27, 'ICECOOL 300g', 'ICECOOL&nbsp;est une pâte composée de glycérine végétale gélifiée et sutilise comme le tabac à chicha, mais ne contient ni tabac, ni nicotine.&nbsp;', 'icecool-300g', 'https://www.el-badia.com/9412-home_default/xicecool-300g.jpg.pagespeed.ic.EiBhhq_o2f.jpg', 15, 15, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(517, 2, 27, 'Nexit 5+1', '', 'nexit-5-1', 'https://www.el-badia.com/8822-home_default/xnexit-51.jpg.pagespeed.ic.M5BxNCjw3S.jpg', 79, 79, 0, 0, NULL, 0, '', '', '', NULL, 0, 0, NULL, 1, 1, NULL, NULL),
(518, 7, 20, 'E-Liquide Peché', 'E-Liquide Peché\r\n\r\nNotre E-liquide evolution Peché possède un PG/VG de 50/50, très équilibré, le hit est modéré et la vapeur satisfaisante. Si savoureuse, ce eliquide goût pêche ne laissera pas indifférent. Un all day fruité que l\'on emmène partout avec nous. Nos eliquides sont 100% made in France au sein de la Liquideo Factory. Vous apprécierez la qualité de nos eliquides fabriqués en France depuis 7 ans en 2019.\r\n\r\nCe eliquide Peché Liquideo est né de l\'association d\'arômes de pêches que l\'on aura plaisir à goûter. Il existe également en format maxi 50 ml dosé à 0 mg. La fiole de 70 ml permet d\'y ajouter jusqu\'à deux boosters de nicotine : \r\n\r\n- Ajoutez un booster de nicotine 20 mg/ml pour obtenir une fiole de 60 ml de eliquide Cherry Boop dosé à 3 mg/ml environ. \r\n\r\n- Ajoutez deux boosters de nicotine 20 mg/ml pour obtenir une fiole de 70 ml de eliquide Cherry Boop dosé à 6 mg/ml environ.', 'e-liquide-peche', '62127ef7a129d454738355.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 20, 'Un e-liquide à la pêche bien fruité, à déguster sans modération tout au long de la journée.'),
(519, 7, 20, 'E-Liquide Mandarina', 'E-Liquide Mandarina\r\nNotre nouvel e-liquide de la gamme Évolution Fruité est disponible au format 10ml avec un taux de nicotine de 0, 3, 6 et 10mg et au format 50ml. \r\n\r\nCe jus très équilibré possède un taux de PG/VG de 50/50 ce qui va permettre dans un premier temps de révéler l’arôme du liquide et dans un second temps l’influence du débit de vapeur. Cela permet de profiter pleinement des arômes et de vapoter cet e-liquides sur n’importe quel type de matériel.', 'e-liquide-mandarina', '62128ae20bcf5762852918.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Ce nouvel e-liquide Mandarina fait partie de la collection Évolution fruité. Une mandarine bien juteuse et bien sucrée qui ne vous laissera pas indifférent.'),
(520, 7, 20, 'E-Liquide Framboyz', 'E-Liquide Framboyz\r\nNotre E-liquide Framboyz Evolution Fruité possède un taux de PG/VG de 60/40. Il est plutôt équilibré, et grâce à sa légère dominante de propylène glycol, le hit reste modéré et la vapeur satisfaisante tandis que les arômes sont bien préservés. Si vous aimez la framboise, ce liquide est fait pour vous. Des saveurs si reconnaissables et auxquelles on ne peut décidément pas résister. N\'oubliez pas de vaper au moins 5 fois le framboyz par jour ! Conseil de Liquideo pour se faire plaisir...', 'e-liquide-framboyz', '62128bbeda535636620795.jpg', 590, 450, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Dégustez notre e-liquide Framboyz de la collection Evolution Fruité : Ne manquera pas de dévoiler à chaque inhalation de vapeur de votre e-cig tous ses arômes sucrés de framboise. Un régal pour les papilles.'),
(521, 7, 20, 'E-Liquide Jolie Blonde', 'E-Liquide Jolie Blonde\r\n\r\nNotre E-liquide Evolution Classico  Jolie Blonde possède un taux de PG/VG de 70/30. Sa teneur riche en propylène glycol en fait un e-liquide au hit prononcé et dont la vapeur n\'est pas trop dense. Un e-liquide classique et efficace, idéal pour retrouver les sensations du classique blond. Son côté légèrement corsé donnera aux vapoteurs recherchant un e-liquide ayant du caractère une véritable satisfaction. À vaper sans modération et à tout instant de la journée pour de vrais moments de plaisir.', 'e-liquide-jolie-blonde', '62128c8668c46986461782.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 20, 'Dégustez notre e-liquide Jolie Blonde de la collection Evolution Classico, un classique blond sec et légèrement corsé. Il apportera toutes les saveurs d\'un classic blond authentique à vaper tous les jours.'),
(522, 7, 20, 'E-Liquide Blue Alien', 'E-Liquide Blue Alien\r\nNotre E-liquide Blue Alien Evolution Space possède un taux de PG/VG de 70/30. Sa teneur riche en propylène glycol en fait un e-liquide au hit prononcé et dont la vapeur n\'est pas trop dense. Laissez-vous porter par un mélange surprenant de curaçao, de framboise bien sucrée et de menthe tel un cocktail détonnant qui ennivre. Venu tout droit de Pandora, il laissera en vous comme une impression de voyage au coeur d\'un espace temps parallèle. Découvrez un nouvel univers de vape !', 'e-liquide-blue-alien', '62128d17c013b635497694.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Dégustez notre e-liquide Blue Alien de la collection Evolution Space : un cocktail savoureux mêlant curaçao, framboise et une pointe de menthe pour donner une touche de légèreté à votre moment de vape.'),
(523, 7, 20, 'E-Liquide Kiss Full', 'E-Liquide Kiss Full\r\nNotre E-liquide Evolution Fresh Kiss Full possède un taux de PG/VG de 70/30. Sa teneur riche en propylène glycol en fait un e-liquide au hit prononcé et dont la vapeur n\'est pas trop dense. La fraîcheur du e-liquide Kiss Full, élu comme l\'un des Best Sellers de la gamme Evolution, est frappante : une vraie claque mentholée qui a bâti sa popularité. Les vapoteurs l\'aiment depuis ses débuts et ne s\'en lassent pas. Un all day à part entière qui n\'a pas fini de vous faire frissonner de plaisir.', 'e-liquide-kiss-full', '62128db95e289205103115.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Dégustez notre e-liquide Kiss Full de la collection Evolution Fresh : Un arôme triple menthol pour atteindre le paroxysme de la fraicheur. Sans doute notre e-liquide le plus populaire de la gamme Evolution. Frissons extrêmes assurés !'),
(524, 7, 20, 'E-Liquide Pastek', 'E-Liquide Pastek\r\nNotre E-liquide Evolution Fruité Pastek possède un taux de PG/VG de 50/50. Ce jus est très équilibré, ce qui apporte un excellent compromis entre un hit bien présent et une vapeur dense. La pastèque offre une saveur sucrée en bouche : l\'arôme de pastèque est bien dosé, ni trop doux, ni trop acidulé, pour un bonheur à vapoter. On se retrouve en plein été, lorsque la saison des fruits a commencé. Laissez-vous tenter par ce e-liquide délicieux, un all-day de qualité.\r\n\r\nTous nos e-liquides sont soumis à des contrôles qualité qui permettent d\'assurer une vape en toute sécurité. Liquideo produit des eliquides français au sein de son laboratoire implanté en région parisienne. Nous contrôlons toute la chaîne de valeur, de la création à l\'embouteillage. Nous créons chaque jour des saveurs et des packagings uniques qui permettent de nous différencier sur le marché depuis plus de 7 ans. \r\n\r\nE-liquide Pastek goût pastèque disponible en 0, 3, 6, 10 et 15 mg/ml de nicotine.', 'e-liquide-pastek', '62128e2143685716349730.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Dégustez notre e-liquide Pastek de la collection Evolution Fruité : une saveur subtile et rafraichissante de pastèque très juteuse, comme on les aime. Un moment d\'évasion fruité et sucré à déguster à n\'importe quel moment de la journée.'),
(525, 7, 20, 'E-Liquide American Mix', 'E-Liquide American Mix\r\n\r\nNotre E-liquide American Mix Evolution Classico possède un taux de PG/VG de 70/30. Sa teneur riche en propylène glycol en fait un e-liquide au hit prononcé et dont la vapeur n\'est pas trop dense. L’arôme de classic blond type USA Mix, à la fois doux et intense en saveurs vous fera voyager à travers le grand continent. Fermez les yeux et imaginez les grandes plaines arides à perte de vue de l\'Amérique, sauvages et insaisissables. Vous reviendrez changé de votre instant de vape.', 'e-liquide-american-mix', '62128eb97d0bd172695478.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Dégustez notre e-liquide American Mix de la collection Evolution Classico : avec un goût de Classic blond type USA Mix de Force 2/5 doux et agréable en bouche. Le plaisir d\'une vape authentique..'),
(526, 7, 20, 'E-Liquide Bloody Frutti', 'E-Liquide Bloody Frutti\r\n\r\nNotre E-liquide Bloody Frutti Evolution Space possède un taux de PG/VG de 60/40.  Il est plutôt équilibré, et grâce à sa légère dominante de propylène glycol, le hit reste modéré et la vapeur satisfaisante tandis que les arômes sont bien préservés. Délectez-vous de ce délicieux mélange de fruits rouges, réhaussé d\'une pointe de menthol pour une note de fraîcheur en fin de bouche. Le cocktail alliant frais et fruité à la perfection. À vaper sans modération comme un all day original.', 'e-liquide-bloody-frutti', '62128f3530d7f438841599.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Dégustez notre e-liquide Bloody Frutti de la collection Evolution Space : Sa légère fraîcheur mentholée accompagnée de ses saveurs de fruits rouges exploseront tel un bouquet fleuri sur votre palais.'),
(527, 7, 20, 'E-Liquide Hollywood', 'E-Liquide Hollywood\r\n\r\nNotre E-liquide Hollywood Evolution Fresh possède un taux de PG/VG de 70/30. Sa teneur riche en propylène glycol en fait un e-liquide au hit prononcé et dont la vapeur n\'est pas trop dense.  Fraîchement délicieux, c\'est un véritable e-liquide façon chewing gum à la chlorophylle. Il réveille les papilles et rend votre vapotage doux et puissant à la fois. Voici le bon compromis pour les fans de e-liquides au menthol. À vaper sans modération.', 'e-liquide-hollywood', '62128fc163051445073234.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Dégustez notre e-liquide Hollywood de la collection Evolution Fresh : le goût particulièrement intense de la chlorophylle se fait ressentir dans ce e-liquide à l\'aspect de chewing gum. Idéal à vaper pour se rafraîchir les papilles.'),
(528, 7, 20, 'E-Liquide Rouge Red', 'E-Liquide Rouge Red\r\n\r\nNotre E-liquide Evolution Space Rouge Red possède un taux de PG/VG de 50/50. Ce jus est très équilibré, ce qui apporte un excellent compromis entre un hit bien présent et une vapeur dense. Sa saveur intense de fruits des bois anisés vous fera vaper toute la journée avec une certaine légèreté. Surprenant, il est vite un indispensable et l\'on emmène partout. Ses arômes uniques le rendent agréable comme un fruit frais et significatif grâce à sa pointe d\'anis. Il est repérable entre mille !', 'e-liquide-rouge-red', '62129061cede7679954749.jpg', 590, 490, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 8, 'Dégustez notre e-liquide Rouge Red de la collection Evolution Space : Rouge Red est un mélange divin de Framboise, Myrtille, Cassis et Anis. Une composition riche et persistante en bouche qui ne laissera personne indifférent.'),
(529, 8, NULL, 'Strawberry CBD', 'Fille prodige de la Santhica 27, je suis avec le  temps devenu un incontournable : la fleur de cbd Strawberry. Ma parenté me confère à la naissance des pistils roses qui rougissent avec l’adolescence. Ma taille impressionnante préserve les terpènes aromatiques, sous une belle robe verte aux filaments safranés. Dès mon ouverture vous serez conquis par ma saveur sucrée aux effluves de fruits rouges. Une délicate sensation en bouche qui vous transportera loin de la grisaille ambiante.\r\n\r\nJe finis de me développer sans lumière pendant trois jours, ce qui permet une croissance exceptionnelle de mes cannabinoïdes. Ils pourraient vous apporter un endormissement plus aisé et le soulagement de certaines douleurs.\r\n\r\nLA FERME CBD, PLUS BEL ÉCRIN POUR NOTRE FLEUR DE CBD STRAWBERRY \r\nLa Strawberry Diesel CBD provient des Alpes Suisses. Pays pionnier de l’agriculture chanvrière CBD, l’intégralité de la chaîne de culture y a été perfectionné année après année. Sélection génomique, germination, pousse, hygrométrie, séchage, manucure, emballage, chaque étape a atteint une maîtrise optimale afin de parvenir à une fleur de cbd inégalée.', 'strawberry-cbd', '621299d917516153068373.PNG', 990, 800, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Ma taille impressionnante préserve mes terpènes aromatiques, sous une belle robe verte aux filaments safranés. Dès mon ouverture vous serez conquis par ma saveur sucrée aux effluves de fruits rouges. Une délicate sensation en bouche qui vous transportera '),
(530, 8, NULL, 'Lemon Kush CBD', 'sativa. Ses feuilles sont vert clair, rendues plus légères par une épaisse couche de trichomes. Toute cette résine rend les têtes collantes et difficiles à briser sans broyeur. Cependant, lorsque les têtes sont cassées, elles dégagent un parfum de citron doux.\r\n\r\nNous vous recommandons d\'utiliser un vaporisateur d\'herbe avec contrôle de température, de marque reconnue, et disponibles sur notre site.', 'lemon-kush-cbd', '62129ab94352a239937472.PNG', 990, 800, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Cette variété de cannabis est une sélection de Chitral Kush, originaire des montagnes de l\'Hindu Kush, entre l\'Afghanistan et le Pakistan. Le goût et l\'odeur de la Lemon Kush sont uniques, avec de puissantes notes de citron et d\'herbes.'),
(531, 8, NULL, 'Amnesia CBD', 'AMNESIA, FLEURS DE CBD ?\r\n\r\nÀ première vue, l’amnésie est par définition une perte partielle ou totale de la mémoire. La fleur Amnesia CBD quant à elle, est plutôt une perte partielle ou totale des pensées négatives et une acquisition de nombreux bienfaits !\r\n\r\nGagnante de la Cannabis Cup 2004 et de la Sativa Cup 2012, cette fleur de CBD ne peut pas passer inaperçue chez les consommateurs du cannabis et du chanvre. Elle doit sa popularité mondiale aux Dutch Coffee Shops qui étaient les premiers à la commercialiser en Europe.\r\n\r\nL’odeur, le gout et les arômes et saveurs de la fleur Amnesia CBD presque sans THC vous laisseront rarement indifférent. Les nombreux bienfaits et la forte teneur en cannabidiol de cette variété de chanvre la font distinguer de l’intégralité de nos fleurs de CBD. En plus de ses effets positifs, le gout de mangue poivrée de l’Amnesia CBD Indoor est vraiment unique.', 'amnesia-cbd', '6212a0945de69249272537.PNG', 990, 800, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 10, 'Gagnante de la Cannabis Cup 2004 et de la Sativa Cup 2012, cette fleur de CBD ne peut pas passer inaperçue chez les consommateurs du cannabis et du chanvre. L’odeur, le gout et les arômes et saveurs de la fleur Amnesia CBD sans THC vous laisseront raremen'),
(532, 1, NULL, 'Chicha x3', 'tets', 'chicha-x3', '623db7b322c49917168343.JPG', 9600, 9600, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(533, 1, 3, 'Chicha TSAR Alexander Mini', 'La marque française TSAR a le sens du goût et du détail. L’ensemble des connecteurs possèdent une connectique 18.8 et un embout “grippé” pour un confort d’utilisation optimal. Grâce à sa bague pleine et son système de purge innovant, fumer la chicha n’a jamais été aussi fluide et agréable. Cette fluidité et ce confort sont également accentué par la présence d’un diffuseur amovible au niveau du plongeur.', 'chicha-tsar-alexander-mini', '624f0c2174ffb087307458.jpg', 9900, 8500, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `sous_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sous_category`
--

INSERT INTO `sous_category` (`id`, `category_id`, `nom`, `content`, `slug`) VALUES
(1, 1, 'Chicha classique', NULL, 'chicha-classique'),
(2, 1, 'Chicha en verre', NULL, 'chicha-en-verre'),
(3, 1, 'Chicha de luxe', NULL, 'chicha-de-luxe'),
(4, 1, 'Chicha Premier Prix', NULL, 'chicha-premier-prix'),
(5, 5, 'Foyers Aluminium', NULL, 'foyers-aluminium'),
(6, 5, 'Foyers Cheminée', NULL, 'foyers-cheminee'),
(7, 5, 'Foyers Kaloud', NULL, 'foyers-kaloud'),
(8, 5, 'Systèmes De Chauffe', NULL, 'systemes-de-chauffe'),
(9, 4, 'Manches En Métal', NULL, 'manches-en-metal'),
(10, 4, 'Accessoires Tuyaux', NULL, 'accessoires-tuyaux'),
(11, 4, 'Manches En Verre', NULL, 'manches-en-verre'),
(12, 4, 'Manches Hybrides', NULL, 'manches-hybrides'),
(13, 4, 'Silicones', NULL, 'silicones'),
(14, 3, 'Auto-Allumants', NULL, 'auto-allumants'),
(15, 3, 'Naturels', NULL, 'naturels'),
(16, 3, 'Pinces', NULL, 'pinces'),
(17, 3, 'Portes Charbons', NULL, 'portes-charbons'),
(18, 7, 'CIGARETTE ÉLECTRONIQUE', NULL, 'cigarette-electronique'),
(19, 7, 'CHICHA ÉLECTRONIQUE', NULL, 'chicha-electronique'),
(20, 7, 'E-LIQUIDES & CARTOUCHES', NULL, 'e-liquides-cartouches'),
(21, 6, 'Billes', NULL, 'billes'),
(22, 6, 'Embouts Hygiéniques', NULL, 'embouts-hygieniques'),
(23, 6, 'Joints', NULL, 'joints'),
(24, 6, 'Nettoyage', NULL, 'nettoyage'),
(25, 6, 'Plateaux', NULL, 'plateaux'),
(26, 6, 'Vases', NULL, 'vases'),
(27, 2, 'Goût chicha', 'De plus en plus populaire, cette technique de chicha sans tabac vous permet de retrouver tous vos arômes préférés. Parce que vous recherchez dans la chicha uniquement des saveurs agréables ou souhaitez plus simplement réduire votre consommation de tabac, la solution du goût à chicha en granulés ou en poudre s\'avère toute indiquée. Cette méthode astucieuse est en réalité très simple : le goût à chicha est composé de minéraux ou petites pierres qui, naturellement, sont très poreux. Ils absorbent donc très facilement du liquide, qui contient lui tous les arômes.\r\n\r\nLorsque qu\'il est chauffé par le charbon, le goût à chicha va libérer ce liquide, qui va s\'évaporer, créant donc non plus de la fumée, mais de la vapeur. Cette dernière s\'aspire ensuite normalement, et permet de retrouver les mêmes sensations qu\'avec du tabac à chicha classique. Avec des produits de qualité, comme le goût à chicha Starbuzz (très réputé), NarguiFive vous permet donc de conserver tous les arômes du narguilé, avec sa vapeur onctueuse et intense, sans avoir à utiliser de tabac.', 'gout-chicha');

-- --------------------------------------------------------

--
-- Structure de la table `transporteur`
--

CREATE TABLE `transporteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `sexe` smallint(6) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `roles`, `password`, `adresse`, `zipcode`, `ville`, `phone`, `sexe`, `updated_at`) VALUES
(1, 'Blanchard Banyingela', 'Blanchard', 'blancho@gmail.com', '[]', '$2y$13$VI1fpN4iixdudUTpdBXDBeV1yXN/15A.GCi2kxG2hCn...', '23', 92600, 'Asnières-sur-Seine', 626179337, 1, NULL),
(2, 'Banyingela', 'Blanchard', 'blanchard.banyingela@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$VI1fpN4iixdudUTpdBXDBeV1yXN/15A.GCi2kxG2hCnWxAR5bMxe2', '23', 92600, 'Asnières-sur-Seine', 626179337, 1, NULL),
(3, 'Malon', 'Hector', 'blanchard.bany@laposte.net', '[]', '$2y$13$VI1fpN4iixdudUTpdBXDBeV1yXN/15A.GCi2kxG2hCn...', '23 AV du Docteur Fleming', 1000, 'BROU', 626179337, 1, NULL),
(4, 'Banyingela', 'Blanchard', 'blancho@yopmail.com', '[]', '$2y$13$VI1fpN4iixdudUTpdBXDBeV1yXN/15A.GCi2kxG2hCn...', '23, Avenue Du Docteur Fleming', 92600, 'Asnières-sur-Seine', 626179337, 1, NULL),
(5, 'Malon', 'Hector', 'blanchard.banyingela@laposte.net', '[]', '$2y$13$FdFPsZjZ8kgKFKyRRzEIMe/f./vn8HacYYStFFN8a3AJ93Ckvd4uG', '23 AV du Docteur Fleming', 92600, 'Asnières Sur Seine', 626179337, 1, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C35F0816A76ED395` (`user_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `gout`
--
ALTER TABLE `gout`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image_product`
--
ALTER TABLE `image_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_465A53714584665A` (`product_id`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1BFCDF877` (`my_order_id`);

--
-- Index pour la table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_16DB4F89F347EFB` (`produit_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`),
  ADD KEY `IDX_D34A04AD527FEED1` (`sous_category_id`),
  ADD KEY `IDX_D34A04AD7ADA1FB5` (`color_id`),
  ADD KEY `IDX_D34A04AD4827B9B2` (`marque_id`);

--
-- Index pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B9983CE5A76ED395` (`user_id`);

--
-- Index pour la table `sous_category`
--
ALTER TABLE `sous_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E022D9412469DE2` (`category_id`);

--
-- Index pour la table `transporteur`
--
ALTER TABLE `transporteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gout`
--
ALTER TABLE `gout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `image_product`
--
ALTER TABLE `image_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- AUTO_INCREMENT pour la table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `sous_category`
--
ALTER TABLE `sous_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `transporteur`
--
ALTER TABLE `transporteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Contraintes pour la table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `FK_16DB4F89F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_D34A04AD4827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`),
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
