-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 17 déc. 2017 à 13:17
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hotel_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `room_id` int(50) UNSIGNED NOT NULL,
  `customer_id` int(50) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_room_id` (`room_id`) USING BTREE,
  KEY `idx_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bookings`
--

INSERT INTO `bookings` (`id`, `room_id`, `customer_id`, `start_date`, `end_date`) VALUES
(1, 1, 14, '2016-10-20', '2016-10-25'),
(2, 2, 15, '2017-05-10', '2017-05-12'),
(3, 3, 10, '2015-07-23', '2015-07-24'),
(4, 4, 3, '2017-04-12', '2017-04-16'),
(5, 5, 8, '2012-12-03', '2012-12-05');

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'France'),
(2, 'England'),
(3, 'Spain'),
(4, 'Germany'),
(5, 'Italy');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country_id` int(50) UNSIGNED NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_country_id` (`country_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `lastname`, `firstname`, `address`, `city`, `country_id`, `phone_number`, `Email`) VALUES
(3, 'Lothair', 'Duval', '19, rue Beauvau', 'Marseille', 1, '04.23.46.44.61', 'LothairDuval@jourrapide.com'),
(8, 'Michaud', 'Marphisa', '29, rue Sébastopol', 'Sainte-Marie', 1, '05.64.62.56.67', 'MarphisaMichaud@teleworm.us'),
(10, 'Barry', 'Jake', '32 Crown Street', 'London', 2, '070 0381 2243', 'JakeBarry@gmail.com'),
(14, 'Romani', 'Eligio', 'Via Belviglieri, 53', 'Roma', 5, '0366 5773542', 'EligioRomani@rhyta.com'),
(15, 'Naumann', 'Jessika', 'Bissingzeile 64', 'Hollnseth', 4, '04773 96 13 04', 'JessikaNaumann@teleworm.us');

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`id`, `Name`, `Email`, `phone_number`) VALUES
(1, 'Golden Hotel Paris', 'reservation@goldenhotel.fr', '01.47.70.62.36'),
(2, 'Central Park Hotel', 'cph@centralparklondon.co.uk', '+44 7221 9847'),
(3, 'hotel Santos Saray', 'reservassaray@h-santos.es', '+34 958 129 161'),
(4, 'Moxy Berlin Ostbahnhof', 'moxy@hotel.com', '+49 30 7262185');

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hotel_id` int(50) UNSIGNED NOT NULL,
  `number` int(50) NOT NULL,
  `number_of_beds` int(50) NOT NULL,
  `price_for_a_night` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hotel_id` (`hotel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`id`, `hotel_id`, `number`, `number_of_beds`, `price_for_a_night`) VALUES
(1, 1, 52, 2, '82,40€'),
(2, 1, 57, 3, '122,60€'),
(3, 2, 12, 3, '102,49€'),
(4, 3, 32, 1, '75,20€'),
(5, 4, 50, 1, '67,30€');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
