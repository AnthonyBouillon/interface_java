-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.2.14-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.5.0.5293
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour fil_rouge_test
CREATE DATABASE IF NOT EXISTS `fil_rouge_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fil_rouge_test`;

-- Listage de la structure de la table fil_rouge_test. client
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(150) DEFAULT NULL,
  `prenom_client` varchar(150) DEFAULT NULL,
  `telephone_client` varchar(15) DEFAULT NULL,
  `email_client` varchar(150) DEFAULT NULL,
  `adresse_client` varchar(50) DEFAULT NULL,
  `adresse_facturation_client` varchar(150) DEFAULT NULL,
  `adresse_livraison_client` varchar(150) DEFAULT NULL,
  `statut_client` varchar(50) DEFAULT NULL,
  `coeff_client` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_commercial` int(11) NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `id_commercial` (`id_commercial`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_commercial`) REFERENCES `commercial` (`id_commercial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.client : ~3 rows (environ)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`id_client`, `nom_client`, `prenom_client`, `telephone_client`, `email_client`, `adresse_client`, `adresse_facturation_client`, `adresse_livraison_client`, `statut_client`, `coeff_client`, `date`, `id_commercial`) VALUES
	(1, 'ROBERT', 'camille', '03-44-79-65-80', 'robert@outlook.fr', '41 rue Jobin 13003 Marseille', '41 rue Jobin 13003 Marseille', '41 rue Jobin 13003 Marseille', NULL, 5, NULL, 1),
	(2, 'SIMON', 'chloé', '06-75-35-87-12', 'simon@outlook.fr', '19 rue des Augustins 33000 Bordeaux', '19 rue des Augustins 33000 Bordeaux', '19 rue des Augustins 33000 Bordeaux', NULL, 10, NULL, 1),
	(3, 'FOURNIER', 'hugo', '03-44-01-01-14', 'fournier@outlook.fr', 'Marseille 13003 Marseille', 'Marseille 13003 Marseille', 'Marseille 13003 Marseille', NULL, 5, NULL, 2);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Listage de la structure de la table fil_rouge_test. commande
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` date DEFAULT NULL,
  `date_facturation` date DEFAULT NULL,
  `adresse_livraison` date DEFAULT NULL,
  `adresse_facturation` date DEFAULT NULL,
  `remise` int(11) DEFAULT NULL,
  `reglement` tinyint(1) DEFAULT NULL,
  `etat_commande` varchar(150) DEFAULT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.commande : ~3 rows (environ)
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` (`id_commande`, `date_commande`, `date_facturation`, `adresse_livraison`, `adresse_facturation`, `remise`, `reglement`, `etat_commande`, `id_client`) VALUES
	(1, '2015-10-28', '2015-10-28', NULL, NULL, 5, 0, 'En cours de livraison', 1),
	(2, '2011-11-28', '2015-11-28', NULL, NULL, 5, 0, 'En cours de livraison', 2),
	(3, '2005-12-22', '2015-11-22', NULL, NULL, 5, 1, 'Livré', 3);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;

-- Listage de la structure de la table fil_rouge_test. commande_produit
CREATE TABLE IF NOT EXISTS `commande_produit` (
  `id_produit` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `prix_total` decimal(4,2) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produit`,`id_commande`),
  KEY `id_commande` (`id_commande`),
  CONSTRAINT `commande_produit_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  CONSTRAINT `commande_produit_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.commande_produit : ~2 rows (environ)
/*!40000 ALTER TABLE `commande_produit` DISABLE KEYS */;
INSERT INTO `commande_produit` (`id_produit`, `id_commande`, `prix_total`, `quantite`) VALUES
	(118, 2, 20.00, 2),
	(118, 3, 50.00, 6);
/*!40000 ALTER TABLE `commande_produit` ENABLE KEYS */;

-- Listage de la structure de la table fil_rouge_test. commercial
CREATE TABLE IF NOT EXISTS `commercial` (
  `id_commercial` int(11) NOT NULL AUTO_INCREMENT,
  `nom_commercial` varchar(150) DEFAULT NULL,
  `prenom_commercial` varchar(150) DEFAULT NULL,
  `telephone_commercial` varchar(15) DEFAULT NULL,
  `adresse_commercial` varchar(150) DEFAULT NULL,
  `email_commercial` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_commercial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.commercial : ~3 rows (environ)
/*!40000 ALTER TABLE `commercial` DISABLE KEYS */;
INSERT INTO `commercial` (`id_commercial`, `nom_commercial`, `prenom_commercial`, `telephone_commercial`, `adresse_commercial`, `email_commercial`) VALUES
	(1, 'MARTIN', 'léo', '01-58-79-65-80', 'Compiègne, 117 rue de Paris, 60200', 'martin@outlook.fr'),
	(2, 'PETIT', 'jules', '06-75-10-08-16', 'Amiens, 11 rue du général leclerc, 80000', 'petit@outlook.fr'),
	(3, 'BARBIER', 'eden', '09-92-18-27-98', 'Ribécourt, 144 rue d\'Aristide Briand, 60170', 'barbier@outlook.fr');
/*!40000 ALTER TABLE `commercial` ENABLE KEYS */;

-- Listage de la structure de la table fil_rouge_test. fournisseur
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fournisseur` varchar(150) DEFAULT NULL,
  `prenom_fournisseur` varchar(150) DEFAULT NULL,
  `telephone_fournisseur` varchar(15) DEFAULT NULL,
  `email_fournisseur` varchar(150) DEFAULT NULL,
  `adresse_fournisseur` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.fournisseur : ~3 rows (environ)
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` (`id_fournisseur`, `nom_fournisseur`, `prenom_fournisseur`, `telephone_fournisseur`, `email_fournisseur`, `adresse_fournisseur`) VALUES
	(1, 'LAFORET', 'thibaut', '03-44-96-12-36', 'laforet@outlook.fr', '78 Place du paradis'),
	(2, 'STARK', 'john', '06-48-75-51-49', 'stark@outlook.fr', '28 avenue du prix'),
	(5, 'Bouillin', 'Saly', NULL, NULL, NULL);
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;

-- Listage de la structure de la table fil_rouge_test. livraison
CREATE TABLE IF NOT EXISTS `livraison` (
  `id_livraison` int(11) NOT NULL AUTO_INCREMENT,
  `date_livraison` datetime DEFAULT NULL,
  `id_commande` int(11) NOT NULL,
  PRIMARY KEY (`id_livraison`),
  KEY `id_commande` (`id_commande`),
  CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.livraison : ~3 rows (environ)
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
INSERT INTO `livraison` (`id_livraison`, `date_livraison`, `id_commande`) VALUES
	(1, '2015-10-28 00:00:00', 1),
	(2, '2016-08-09 00:00:00', 2),
	(3, '2018-07-12 00:00:00', 3);
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;

-- Listage de la structure de la table fil_rouge_test. livraison_produit
CREATE TABLE IF NOT EXISTS `livraison_produit` (
  `id_livraison` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_livraison`,`id_produit`),
  KEY `id_produit` (`id_produit`),
  CONSTRAINT `livraison_produit_ibfk_1` FOREIGN KEY (`id_livraison`) REFERENCES `livraison` (`id_livraison`),
  CONSTRAINT `livraison_produit_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.livraison_produit : ~2 rows (environ)
/*!40000 ALTER TABLE `livraison_produit` DISABLE KEYS */;
INSERT INTO `livraison_produit` (`id_livraison`, `id_produit`, `quantite`) VALUES
	(1, 1, 5),
	(3, 2, 5);
/*!40000 ALTER TABLE `livraison_produit` ENABLE KEYS */;

-- Listage de la structure de la table fil_rouge_test. produit
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `description_court_produit` varchar(255) DEFAULT NULL,
  `description_long_produit` text DEFAULT NULL,
  `prix_ht_produit` decimal(9,2) DEFAULT NULL,
  `photo_produit` varchar(255) DEFAULT NULL,
  `quantite_produit` int(11) DEFAULT NULL,
  `tva` decimal(9,2) DEFAULT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `id_sous_rubrique` int(11) NOT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `id_fournisseur` (`id_fournisseur`),
  KEY `id_sous_rubrique` (`id_sous_rubrique`),
  CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`),
  CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`id_sous_rubrique`) REFERENCES `sous_rubrique` (`id_sous_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.produit : ~5 rows (environ)
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` (`id_produit`, `description_court_produit`, `description_long_produit`, `prix_ht_produit`, `photo_produit`, `quantite_produit`, `tva`, `id_fournisseur`, `id_sous_rubrique`) VALUES
	(1, 'Le sorceleur tome 1', 'His cognitis Gallus ut serpens adpetitus telo vel saxo iamque spes extremas opperiens et succurrens saluti suae quavis ratione colligi omnes iussit armatos et cum starent attoniti, districta dentium acie stridens adeste inquit viri fortes mihi periclitanti vobiscum.', 42.00, '<img src="https://fakeimg.pl/250x100/">', 5, 22.50, 1, 1),
	(2, 'Kaamelott intégral', 'ci pellexit vultu ', 80.00, 'C:\\Users\\80010-37-15\\Desktop\\Fil Rouge\\Interface graphique (JAVA)\\Gestion_fil_rouge\\20181121090549035.pdf', 8, 22.50, 1, 1),
	(116, 'Caméra sans fil', 'Détecteur de mouvement', 119.00, 'C:\\Users\\80010-37-15\\Desktop\\Fil Rouge\\Interface graphique (JAVA)\\Gestion_fil_rouge\\8063_l.jpg', 5, 22.50, 1, 1),
	(118, 'Caméra sans fil', 'Détecteur de mouvement', 119.00, 'C:\\Users\\80010-37-15\\Desktop\\Fil Rouge\\Interface graphique (JAVA)\\Gestion_fil_rouge\\234419.jpg', 5, 22.50, 1, 1),
	(125, 'Description courte', 'Description longue', 42.50, 'C:\\Users\\80010-37-15\\Desktop\\Fil Rouge\\Interface graphique (JAVA)\\Gestion_fil_rouge\\20181127092750260.pdf', 4, 26.00, 1, 1);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;

-- Listage de la structure de la table fil_rouge_test. rubrique
CREATE TABLE IF NOT EXISTS `rubrique` (
  `id_rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `nom_rubrique` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.rubrique : ~0 rows (environ)
/*!40000 ALTER TABLE `rubrique` DISABLE KEYS */;
INSERT INTO `rubrique` (`id_rubrique`, `nom_rubrique`) VALUES
	(1, 'Tout venant');
/*!40000 ALTER TABLE `rubrique` ENABLE KEYS */;

-- Listage de la structure de la table fil_rouge_test. sous_rubrique
CREATE TABLE IF NOT EXISTS `sous_rubrique` (
  `id_sous_rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `nom_sous_rubrique` varchar(255) DEFAULT NULL,
  `id_rubrique` int(11) NOT NULL,
  PRIMARY KEY (`id_sous_rubrique`),
  KEY `id_rubrique` (`id_rubrique`),
  CONSTRAINT `sous_rubrique_ibfk_1` FOREIGN KEY (`id_rubrique`) REFERENCES `rubrique` (`id_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Listage des données de la table fil_rouge_test.sous_rubrique : ~3 rows (environ)
/*!40000 ALTER TABLE `sous_rubrique` DISABLE KEYS */;
INSERT INTO `sous_rubrique` (`id_sous_rubrique`, `nom_sous_rubrique`, `id_rubrique`) VALUES
	(1, 'Livre', 1),
	(2, 'Vidéo', 1),
	(3, 'Hight tech', 1);
/*!40000 ALTER TABLE `sous_rubrique` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
