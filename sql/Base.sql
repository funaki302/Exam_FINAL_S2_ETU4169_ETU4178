CREATE DATABASE IF NOT EXISTS partage_objets;
USE partage_objets;


CREATE TABLE po_membre (
    id_membre INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    date_naissance DATE NOT NULL,
    genre ENUM('M','F') NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    ville VARCHAR(100),
    mdp VARCHAR(255) NOT NULL, 
    image_profil VARCHAR(255)
);

CREATE TABLE po_categorie_objet (
    id_categorie INT AUTO_INCREMENT PRIMARY KEY,
    nom_categorie VARCHAR(100) NOT NULL
);

CREATE TABLE po_objet (
    id_objet INT AUTO_INCREMENT PRIMARY KEY,
    nom_objet VARCHAR(100) NOT NULL,
    id_categorie INT NOT NULL,
    id_membre INT NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES po_categorie_objet(id_categorie) ON DELETE CASCADE,
    FOREIGN KEY (id_membre) REFERENCES po_membre(id_membre) ON DELETE CASCADE
);

CREATE TABLE po_images_objet (
    id_image INT AUTO_INCREMENT PRIMARY KEY,
    id_objet INT NOT NULL,
    nom_image VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_objet) REFERENCES po_objet(id_objet) ON DELETE CASCADE
);

CREATE TABLE po_emprunt (
    id_emprunt INT AUTO_INCREMENT PRIMARY KEY,
    id_objet INT NOT NULL,
    id_membre INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour DATE,
    FOREIGN KEY (id_objet) REFERENCES po_objet(id_objet) ON DELETE CASCADE,
    FOREIGN KEY (id_membre) REFERENCES po_membre(id_membre) ON DELETE CASCADE
);

-- Insertion des membres
INSERT INTO po_membre (nom, date_naissance, genre, email, ville, mdp, image_profil) VALUES
('Alice Dupont', '1990-05-15', 'F', 'alice.dupont@example.com', 'Paris', 'hashed_password1', 'alice.jpg'),
('Bob Martin', '1985-08-22', 'M', 'bob.martin@example.com', 'Lyon', 'hashed_password2', 'bob.jpg'),
('Claire Lefevre', '1992-03-10', 'F', 'claire.lefevre@example.com', 'Marseille', 'hashed_password3', 'claire.jpg'),
('David Roux', '1988-11-30', 'M', 'david.roux@example.com', 'Toulouse', 'hashed_password4', 'david.jpg');

-- Insertion des catégories
INSERT INTO po_categorie_objet (nom_categorie) VALUES
('Esthétique'),
('Bricolage'),
('Mécanique'),
('Cuisine');

-- Insertion des objets (10 par membre, répartis sur les catégories)
-- Membre 1: Alice
INSERT INTO po_objet (nom_objet, id_categorie, id_membre) VALUES
('Sèche-cheveux', 1, 1),
('Miroir maquillage', 1, 1),
('Perceuse', 2, 1),
('Marteau', 2, 1),
('Clé à molette', 3, 1),
('Tournevis', 3, 1),
('Mixeur', 4, 1),
('Poêle', 4, 1),
('Pinceau maquillage', 1, 1),
('Niveau à bulle', 2, 1);

-- Membre 2: Bob
INSERT INTO po_objet (nom_objet, id_categorie, id_membre) VALUES
('Fer à lisser', 1, 2),
('Tondeuse cheveux', 1, 2),
('Scie circulaire', 2, 2),
('Boîte à outils', 2, 2),
('Clé dynamométrique', 3, 2),
('Pompe à vélo', 3, 2),
('Robot cuiseur', 4, 2),
('Couteau de chef', 4, 2),
('Curling', 1, 2),
('Échelle', 2, 2);

-- Membre 3: Claire
INSERT INTO po_objet (nom_objet, id_categorie, id_membre) VALUES
('Lisseur céramique', 1, 3),
('Palette maquillage', 1, 3),
('Ponceuse', 2, 3),
('Visseuse', 2, 3),
('Cric', 3, 3),
('Clé à chocs', 3, 3),
('Blender', 4, 3),
('Moule à gâteau', 4, 3),
('Sèche-ongles', 1, 3),
('Meuleuse', 2, 3);

-- Membre 4: David
INSERT INTO po_objet (nom_objet, id_categorie, id_membre) VALUES
('Épilateur', 1, 4),
('Kit manucure', 1, 4),
('Scie sauteuse', 2, 4),
('Perforateur', 2, 4),
('Compresseur', 3, 4),
('Clé Allen', 3, 4),
('Cocotte-minute', 4, 4),
('Hachoir', 4, 4),
('Fer à boucler', 1, 4),
('Niveau laser', 2, 4);

-- Insertion des images pour quelques objets (exemple)
INSERT INTO po_images_objet (id_objet, nom_image) VALUES
(1, 'seche-cheveux.jpg'),
(3, 'perceuse.jpg'),
(7, 'mixeur.jpg'),
(11, 'fer-a-lisser.jpg'),
(13, 'scie-circulaire.jpg'),
(17, 'robot-cuiseur.jpg'),
(21, 'lisseur-ceramique.jpg'),
(23, 'ponceuse.jpg'),
(27, 'blender.jpg'),
(31, 'epilateur.jpg');

-- Insertion des emprunts
INSERT INTO po_emprunt (id_objet, id_membre, date_emprunt, date_retour) VALUES
(1, 2, '2025-06-01', '2025-06-10'), -- Bob emprunte le sèche-cheveux d'Alice
(3, 3, '2025-06-05', NULL), -- Claire emprunte la perceuse d'Alice
(7, 4, '2025-06-10', '2025-06-15'), -- David emprunte le mixeur d'Alice
(11, 1, '2025-06-12', NULL), -- Alice emprunte le fer à lisser de Bob
(13, 4, '2025-06-15', '2025-06-20'), -- David emprunte la scie circulaire de Bob
(17, 3, '2025-06-18', NULL), -- Claire emprunte le robot cuiseur de Bob
(21, 2, '2025-06-20', '2025-06-25'), -- Bob emprunte le lisseur céramique de Claire
(23, 1, '2025-06-22', NULL), -- Alice emprunte la ponceuse de Claire
(27, 4, '2025-06-25', '2025-07-01'), -- David emprunte le blender de Claire
(31, 3, '2025-06-28', NULL); -- Claire emprunte l'épilateur de David