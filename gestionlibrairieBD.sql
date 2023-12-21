-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 21 déc. 2023 à 01:45
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionlibrairie`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id_admin` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `Tel` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id_admin`, `nom`, `Tel`, `email`, `password`) VALUES
(1, 'Mika', 'mbachristian58@gmail.com', '672094167', 'mikamba2001**'),
(2, 'Sophia', 'mba.com', '687', '123'),
(3, 'Ulrich', 'lol.com', '45', '457'),
(4, 'Andrea', 'lolo.com', '4563', '12047');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `Tel` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `addresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `date_commandes` date NOT NULL,
  `prix` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  `etat` enum('valide','refuse','','','') NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id` int(11) NOT NULL,
  `date_depart` date NOT NULL,
  `date_fin` date NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gestionlibraire`
--

CREATE TABLE `gestionlibraire` (
  `date` date NOT NULL,
  `action` varchar(30) NOT NULL,
  `id_libraire` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gestionlivre`
--

CREATE TABLE `gestionlivre` (
  `date` date NOT NULL,
  `action` varchar(30) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gestionrayon`
--

CREATE TABLE `gestionrayon` (
  `date` date NOT NULL,
  `action` varchar(30) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_rayon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `libraire`
--

CREATE TABLE `libraire` (
  `id_libraire` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `Tel` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `salaire` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id_livre` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prix` int(11) NOT NULL,
  `hauteur` varchar(50) NOT NULL,
  `date_sortie` date NOT NULL,
  `id_rayon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notificationlibraireclient`
--

CREATE TABLE `notificationlibraireclient` (
  `id` int(11) NOT NULL,
  `date_envoie` date NOT NULL,
  `message` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `id_libraire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE `participation` (
  `date` date NOT NULL,
  `id_evenement` int(11) NOT NULL,
  `id_personne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Tel` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pseudoexpert`
--

CREATE TABLE `pseudoexpert` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `Tel` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `Nbr_Livre_lu` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `proffession` varchar(10) NOT NULL,
  `Livre_preffere` varchar(20) NOT NULL,
  `id_evenement` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rayon`
--

CREATE TABLE `rayon` (
  `id` int(11) NOT NULL,
  `capacite` int(11) NOT NULL,
  `categorie` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reactions`
--

CREATE TABLE `reactions` (
  `id_reaction` int(11) NOT NULL,
  `date_reaction` date NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `validation`
--

CREATE TABLE `validation` (
  `date` int(11) NOT NULL,
  `motif` varchar(20) NOT NULL,
  `id_libraire` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_livre` (`id_livre`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gestionlibraire`
--
ALTER TABLE `gestionlibraire`
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_libraire` (`id_libraire`);

--
-- Index pour la table `gestionlivre`
--
ALTER TABLE `gestionlivre`
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_livre` (`id_livre`);

--
-- Index pour la table `gestionrayon`
--
ALTER TABLE `gestionrayon`
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_rayon` (`id_rayon`);

--
-- Index pour la table `libraire`
--
ALTER TABLE `libraire`
  ADD PRIMARY KEY (`id_libraire`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id_livre`),
  ADD KEY `id_rayon` (`id_rayon`);

--
-- Index pour la table `notificationlibraireclient`
--
ALTER TABLE `notificationlibraireclient`
  ADD KEY `id_libraire` (`id_libraire`);

--
-- Index pour la table `participation`
--
ALTER TABLE `participation`
  ADD KEY `id_evenement` (`id_evenement`),
  ADD KEY `id_personne` (`id_personne`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pseudoexpert`
--
ALTER TABLE `pseudoexpert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_evenement` (`id_evenement`);

--
-- Index pour la table `rayon`
--
ALTER TABLE `rayon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id_reaction`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `validation`
--
ALTER TABLE `validation`
  ADD PRIMARY KEY (`date`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_libraire` (`id_libraire`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `libraire`
--
ALTER TABLE `libraire`
  MODIFY `id_libraire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id_livre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pseudoexpert`
--
ALTER TABLE `pseudoexpert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rayon`
--
ALTER TABLE `rayon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id_reaction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `validation`
--
ALTER TABLE `validation`
  MODIFY `date` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id_livre`);

--
-- Contraintes pour la table `gestionlibraire`
--
ALTER TABLE `gestionlibraire`
  ADD CONSTRAINT `gestionlibraire_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`),
  ADD CONSTRAINT `gestionlibraire_ibfk_2` FOREIGN KEY (`id_libraire`) REFERENCES `libraire` (`id_libraire`);

--
-- Contraintes pour la table `gestionlivre`
--
ALTER TABLE `gestionlivre`
  ADD CONSTRAINT `gestionlivre_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`),
  ADD CONSTRAINT `gestionlivre_ibfk_2` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id_livre`);

--
-- Contraintes pour la table `gestionrayon`
--
ALTER TABLE `gestionrayon`
  ADD CONSTRAINT `gestionrayon_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`),
  ADD CONSTRAINT `gestionrayon_ibfk_2` FOREIGN KEY (`id_rayon`) REFERENCES `rayon` (`id`);

--
-- Contraintes pour la table `libraire`
--
ALTER TABLE `libraire`
  ADD CONSTRAINT `libraire_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`id_rayon`) REFERENCES `rayon` (`id`);

--
-- Contraintes pour la table `notificationlibraireclient`
--
ALTER TABLE `notificationlibraireclient`
  ADD CONSTRAINT `notificationlibraireclient_ibfk_1` FOREIGN KEY (`id_libraire`) REFERENCES `libraire` (`id_libraire`);

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id`),
  ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id`);

--
-- Contraintes pour la table `pseudoexpert`
--
ALTER TABLE `pseudoexpert`
  ADD CONSTRAINT `pseudoexpert_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`),
  ADD CONSTRAINT `pseudoexpert_ibfk_2` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id`);

--
-- Contraintes pour la table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `validation`
--
ALTER TABLE `validation`
  ADD CONSTRAINT `validation_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`),
  ADD CONSTRAINT `validation_ibfk_2` FOREIGN KEY (`id_libraire`) REFERENCES `libraire` (`id_libraire`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
