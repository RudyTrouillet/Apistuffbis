-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bagnoles
CREATE DATABASE IF NOT EXISTS `bagnoles` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bagnoles`;

-- Dumping structure for table bagnoles.attributes
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_attribute` varchar(255) DEFAULT NULL,
  `value_attribute` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bagnoles.attributes: ~11 rows (approximately)
INSERT INTO `attributes` (`id`, `key_attribute`, `value_attribute`) VALUES
	(1, 'ENERGY', 'DIESEL'),
	(2, 'COLOR', 'BLACK'),
	(3, 'BOITE', 'AUTO'),
	(4, 'CATEGORY', 'SUV'),
	(5, 'ENERGY', 'OIL'),
	(6, 'COLOR', 'GREEN'),
	(7, 'BOITE', 'MANUAL'),
	(8, 'CATEGORY', 'SLEEPER'),
	(9, 'COLOR', 'RED'),
	(10, 'COLOR', 'PURPLE'),
	(11, 'CATEGORY', 'BREAK');

-- Dumping structure for table bagnoles.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bagnoles.brands: ~3 rows (approximately)
INSERT INTO `brands` (`id`, `name`, `slug`, `logo`) VALUES
	(1, 'Peugeot', 'peugeot', NULL),
	(2, 'Citroen', 'citroen', NULL),
	(3, 'Fiat', 'fiat', NULL);

-- Dumping structure for table bagnoles.cars
CREATE TABLE IF NOT EXISTS `cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `attribute_color_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`),
  KEY `attribute_color_id` (`attribute_color_id`),
  CONSTRAINT `FK_cars_attributes` FOREIGN KEY (`attribute_color_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `FK_cars_models` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bagnoles.cars: ~4 rows (approximately)
INSERT INTO `cars` (`id`, `name`, `slug`, `description`, `model_id`, `attribute_color_id`) VALUES
	(1, '306-1', '306_1', 'C\'est une 306 de model 1 et de couleur 2', 1, 2),
	(2, '306-2', '306_2', 'C\'est une 306 de model 4 et de couleur 9', 4, 9),
	(3, 'C4-1', 'C4_1', 'C\'est une C4 de modele 7 et de couleur 6', 7, 6),
	(21, 'super tutureeee', 'super-tutureeee', 'elle va vite elle', 6, 3);

-- Dumping structure for table bagnoles.models
CREATE TABLE IF NOT EXISTS `models` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phase` tinyint DEFAULT NULL,
  `finition` varchar(255) DEFAULT NULL,
  `hp` int DEFAULT NULL,
  `cv` tinyint DEFAULT NULL,
  `door` tinyint DEFAULT NULL,
  `attribute_energy_id` int DEFAULT NULL,
  `attribute_boite_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `attribute_energy_id` (`attribute_energy_id`),
  KEY `attribute_boite_id` (`attribute_boite_id`),
  CONSTRAINT `FK_models_attributes` FOREIGN KEY (`attribute_energy_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `FK_models_attributes_2` FOREIGN KEY (`attribute_boite_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `FK_models_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bagnoles.models: ~9 rows (approximately)
INSERT INTO `models` (`id`, `brand_id`, `name`, `phase`, `finition`, `hp`, `cv`, `door`, `attribute_energy_id`, `attribute_boite_id`) VALUES
	(1, 1, '306', 1, 'Husky', 90, 6, 3, 1, 3),
	(2, 1, '306', 1, 'Clodo', 45, 2, 5, 5, 7),
	(3, 1, '306', 1, 'Bof', 90, 6, 5, 1, 7),
	(4, 1, '306', 1, 'Moyen', 105, 6, 5, 5, 7),
	(5, 1, '306', 1, 'Sympa', 80, 5, 5, 1, 3),
	(6, 1, '306', 1, 'Husky', 90, 6, 5, 5, 3),
	(7, 2, 'C4', 1, 'Loeb', 150, 8, 3, 5, 3),
	(8, 2, 'C4', 1, 'Classe', 100, 7, 5, 1, 3),
	(9, 2, 'C4', 1, 'PasTropVite', 30, 2, 5, 5, 3);

-- Dumping structure for table bagnoles.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL DEFAULT '0',
  `api_key` varchar(41) NOT NULL DEFAULT '0',
  `role` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bagnoles.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `nom`, `api_key`, `role`) VALUES
	(1, 'Admin1', '0b8b3cab2b80fd3fff45bacd7da771be4a47bac3', 1),
	(3, 'Visiteur', 'f1ff365aa8251c79bc0379b87e8923e1965ae3d5', 2),
	(4, 'OnlyByBrand', '71bf65881f733f240fcdccc1978adffce87fa347', 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
