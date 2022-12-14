CREATE DATABASE lionelshop;

USE lionelshop

CREATE USER 'lionel26'@'localhost' IDENTIFIED BY 'admin';

SELECT User, Host FROM mysql.user;

CREATE TABLE `clients` (
  `id_Client` int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(75) NOT NULL,
  `adresse` int(11) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `commandes` (
  `id_Commande` int PRIMARY KEY AUTO_INCREMENT,
  `id_Client` int(9) NOT NULL,
  `date` varchar(10) NOT NULL,
  FOREIGN KEY (`id_Client`) REFERENCES clients(`id_Client`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `marque` (
  `id_marque` int PRIMARY KEY AUTO_INCREMENT,
  `marque` varchar(25) NOT NULL,
  `logo` varchar(10) NOT NULL
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `chaussures` (
  `id_Chaussures` int PRIMARY KEY AUTO_INCREMENT,
  `id_marque` int(9) NOT NULL,
  `pointure` int(2) NOT NULL,
  `couleur` varchar(20) NOT NULL,
  `prix` float NOT NULL,
  `nom_chaussure` varchar(25) NOT NULL,
  `images` varchar(200) NOT NULL,  
  FOREIGN KEY (`id_marque`) REFERENCES marque(`id_marque`),
  KEY `pointure`(`pointure`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `pointure` (
  `id_pointure` int PRIMARY KEY AUTO_INCREMENT,
   `pointure` int(2) NOT NULL,
   FOREIGN KEY (`pointure`) REFERENCES chaussures(`pointure`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `liste_commandes` (
  `id_Commande` int PRIMARY KEY  AUTO_INCREMENT,
  `id_Chaussures` int(9) NOT NULL,
  `quantité` int(3) NOT NULL,
  FOREIGN KEY (`id_Chaussures`) REFERENCES chaussures(`id_Chaussures`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


INSERT INTO `marque` (`id_marque`, `marque`, `logo`) VALUES
(NULL, 'Adidas', 'LogoAdidas'),
(NULL, 'Nike', 'LogoNike'),
(NULL, 'Puma', 'LogoPuma'),
(NULL, 'Asics', 'LogoAsics');


INSERT INTO `chaussures` (`id_Chaussures`, `id_marque`, `pointure`, `couleur`, `prix`, `nom_chaussure`, `images`) VALUES
(NULL, 2, 39, 'Rose', 85000, 'Nike', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/b39ed3f1-f3c8-47f9-8831-0782665a6715/chaussure-de-running-sur-route-air-zoom-pegasus-39-pour-JNVFbf.png'),
(NULL, 1, 40, 'Bleu', 30000, 'Adidas', 'https://assets.adidas.com/images/w_600,f_auto,q_auto/6328d03ec0df489bb273ae2f00399dac_9366/Chaussure_Busenitz_Bleu_GY6902_01_standard.jpg'),
(NULL, 3, 41, 'Noir', 45000, 'Asics', 'https://images.asics.com/is/image/asics/1012B206_003_SB_FR_GLB?$productlist$'),

(NULL, 2, 45, 'Rouge', 90000, 'Nike', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/93536e83-3116-4e49-81b5-fa66060473d8/chaussure-de-course-sur-route-zoomx-vaporfly-next-2-pour-tdbRhZ.png'),
(NULL, 1, 30, 'Marron', 80000, 'Adidas', 'https://assets.adidas.com/images/w_600,f_auto,q_auto/a3dc953804b34aad87b1aead00f5a507_9366/Chaussure_Gazelle_Marron_H06395_01_standard.jpg'),
(NULL, 3, 40, 'Vert', 50000, 'Asics', 'https://images.asics.com/is/image/asics/1013A116_300_SB_FR_GLB?$productlist$'),

(NULL, 2, 20, 'Gris', 55000, 'Nike', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7f8ee038-906a-47a9-8296-be17b4bdda94/chaussure-air-jordan-1-retro-high-og.png'),
(NULL, 1, 28, 'Jaune', 60000, 'Adidas', 'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/63c90d0ad1614edb8770ae2b003fb7ea_9366/chaussure-adizero-rc-4.jpg'),
(NULL, 3, 41, 'Blanc', 75000, 'Puma', 'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/376639/01/sv01/fnd/EEA/fmt/png/Chaussures-de-Basketball-Fusion-Nitro');


INSERT INTO `pointure` (`id_pointure`, `pointure`) VALUES
(NULL, 39),
(NULL, 40),
(NULL, 20),
(NULL, 45),
(NULL, 30),
(NULL, 28),
(NULL, 41);

//Liste les marques contenues dans la table marques
SELECT * FROM marques;

//Supprime la chaussure de marque Nike
DELETE FROM chaussures WHERE id_Chaussures = 2;  

//Mise à jour du prix de la chaussure de marque Nike
UPDATE chaussures SET prix = '85000' WHERE id_Chaussures = 2;