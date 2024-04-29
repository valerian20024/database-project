-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : sam. 27 avr. 2024 à 01:37
-- Version du serveur : 8.0.36
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `group08`
--

-- --------------------------------------------------------

--
-- Structure de la table `EPISODE`
--

CREATE TABLE IF NOT EXISTS `EPISODE` (
  `SERIES_NAME` varchar(255) NOT NULL,
  `EPISODE_NUMBER` int NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `AIRDATE` date NOT NULL,
  `WINNER_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA INFILE '/docker-entrypoint-initdb.d/EPISODE.csv' INTO TABLE `EPISODE` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `FEATURE`
--

CREATE TABLE IF NOT EXISTS `FEATURE` (
  `SERIES_NAME` varchar(255) NOT NULL,
  `CANDIDATE_ID` int NOT NULL,
  `CHAIR` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `POINTS`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/FEATURE.csv' INTO TABLE `FEATURE` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `INDIVIDUAL_TASK`
--

CREATE TABLE IF NOT EXISTS`INDIVIDUAL_TASK` (
  `SERIES_NAME` varchar(255) NOT NULL,
  `EPISODE_NUMBER` int NOT NULL,
  `TASK_NUMBER` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `POINTS`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/INDIVIDUAL_TASK.csv' INTO TABLE `INDIVIDUAL_TASK` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `JOB`
--

CREATE TABLE IF NOT EXISTS `JOB` (
  `CANDIDATE_ID` int NOT NULL,
  `JOB` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `POINTS`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/JOB.csv' INTO TABLE `JOB` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `MEMBERSHIP`
--

CREATE TABLE IF NOT EXISTS `MEMBERSHIP` (
  `TEAM_ID` int NOT NULL,
  `CANDIDATE_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `POINTS`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/MEMBERSHIP.csv' INTO TABLE `MEMBERSHIP` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `PERSON`
--

CREATE TABLE IF NOT EXISTS `PERSON` (
  `ID` int NOT NULL,
  `FIRSTNAME` varchar(255) NOT NULL,
  `LASTNAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `POINTS`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/PERSON.csv' INTO TABLE `PERSON` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `POINTS`
--

CREATE TABLE IF NOT EXISTS `POINTS` (
  `SERIES_NAME` varchar(255) NOT NULL,
  `EPISODE_NUMBER` int NOT NULL,
  `TASK_NUMBER` int NOT NULL,
  `CANDIDATE_ID` int NOT NULL,
  `POINTS` int NOT NULL,
  `WASDISQUALIFIED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `POINTS`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/POINTS.csv' INTO TABLE `POINTS` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `SERIES`
--

CREATE TABLE IF NOT EXISTS `SERIES` (
  `NAME` varchar(255) NOT NULL,
  `NETWORK` varchar(255) NOT NULL,
  `STARTDATE` date NOT NULL,
  `ENDDATE` date NOT NULL,
  `TASKMASTER_ID` int NOT NULL,
  `ASSISTANT_ID` int NOT NULL,
  `CHAMPION_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA INFILE '/docker-entrypoint-initdb.d/SERIES.csv' INTO TABLE `SERIES` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `TASK`
--

CREATE TABLE IF NOT EXISTS `TASK` (
  `SERIES_NAME` varchar(255) NOT NULL,
  `EPISODE_NUMBER` int NOT NULL,
  `TASK_NUMBER` int NOT NULL,
  `DESCRIPTION` varchar(1000) NOT NULL,
  `ISLIVETASK` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TASK`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/TASK.csv' INTO TABLE `TASK` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;


-- --------------------------------------------------------

--
-- Structure de la table `TASKMASTER`
--

CREATE TABLE IF NOT EXISTS `TASKMASTER` (
  `ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA INFILE '/docker-entrypoint-initdb.d/TASKMASTER.csv' INTO TABLE `TASKMASTER` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

--
-- Déchargement des données de la table `TASKMASTER`
--

/*INSERT INTO `TASKMASTER` (`ID`) VALUES
(1),
(8);*/

-- --------------------------------------------------------

--
-- Structure de la table `TEAM`
--

CREATE TABLE IF NOT EXISTS `TEAM` (
  `ID` int NOT NULL,
  `SERIES_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TEAM`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/TEAM.csv' INTO TABLE `TEAM` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `TEAMPOINTS`
--

CREATE TABLE IF NOT EXISTS `TEAMPOINTS` (
  `SERIES_NAME` varchar(255) NOT NULL,
  `EPISODE_NUMBER` int NOT NULL,
  `TASK_NUMBER` int NOT NULL,
  `TEAM_ID` int NOT NULL,
  `POINTS` int NOT NULL,
  `WASDISQUALIFIED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TEAMPOINTS`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/TEAMPOINTS.csv' INTO TABLE `TEAMPOINTS` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- --------------------------------------------------------

--
-- Structure de la table `TEAMTASK`
--

CREATE TABLE IF NOT EXISTS `TEAMTASK` (
  `SERIES_NAME` varchar(255) NOT NULL,
  `EPISODE_NUMBER` int NOT NULL,
  `TASK_NUMBER` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TEAMTASK`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/TEAMTASK.csv' INTO TABLE `TEAMTASK` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

/*INSERT INTO `TEAMTASK` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`) VALUES
('Series 1 (UK)', 4, 3),
('Series 1 (UK)', 5, 4),
('Series 1 (UK)', 6, 3),
('Series 1 (NZ)', 3, 3),
('Series 1 (NZ)', 4, 3),
('Series 1 (NZ)', 6, 3),
('Series 1 (NZ)', 9, 3),
('Series 1 (NZ)', 10, 3),
('Series 3 (UK)', 2, 3);*/

-- --------------------------------------------------------

--
-- Structure de la table `TIEBREAKER`
--

CREATE TABLE IF NOT EXISTS `TIEBREAKER` (
  `SERIES_NAME` varchar(255) NOT NULL,
  `EPISODE_NUMBER` int NOT NULL,
  `TASK_NUMBER` int NOT NULL,
  `WINNER_ID` int NOT NULL,
  `LOSER_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TIEBREAKER`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/TIEBREAKER.csv' INTO TABLE `TIEBREAKER` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

/*INSERT INTO `TIEBREAKER` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`, `WINNER_ID`, `LOSER_ID`) VALUES
('Series 1 (UK)', 1, 6, 3, 6),
('Series 1 (UK)', 3, 7, 4, 6);*/

-- --------------------------------------------------------

--
-- Structure de la table `TIEBREAKERRESULT`
--

CREATE TABLE IF NOT EXISTS `TIEBREAKERRESULT` (
  `SERIES_NAME` varchar(255) NOT NULL,
  `EPISODE_NUMBER` int NOT NULL,
  `TASK_NUMBER` int NOT NULL,
  `CANDIDATE_ID` int NOT NULL,
  `WON` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TIEBREAKERRESULT`
--

LOAD DATA INFILE '/docker-entrypoint-initdb.d/TIEBREAKERRESULT.csv' INTO TABLE `TIEBREAKERRESULT` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

/*INSERT INTO `TIEBREAKERRESULT` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`, `CANDIDATE_ID`, `WON`) VALUES
('Series 1 (UK)', 1, 6, 3, 1),
('Series 1 (UK)', 1, 6, 6, 0),
('Series 1 (UK)', 3, 7, 4, 1),
('Series 1 (UK)', 3, 7, 6, 0);*/

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `PERSON`
--
ALTER TABLE `PERSON`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `PERSON`
--
ALTER TABLE `PERSON`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
