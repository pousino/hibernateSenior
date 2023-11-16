-------------------------------------------------------

--
-- Structure de la table categorie
--

CREATE TABLE categorie (
  id_categorie integer NOT NULL,
  nom varchar(50) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Structure de la table client
--

CREATE TABLE client (
  id_client integer NOT NULL,
  nom varchar(150) NOT NULL,
  prenom varchar(150) NOT NULL,
  adresse varchar(250) DEFAULT NULL,
  date_naissance date DEFAULT NULL,
  civilite char(1) DEFAULT NULL,
  numero char(5) NOT NULL,
  id_ville integer DEFAULT NULL
) ;

--
-- Contenu de la table client
--

INSERT INTO client (id_client, nom, prenom, adresse, date_naissance, civilite, numero, id_ville) VALUES
(4, 'DUPOND', 'Paul', '11 rue de la liberté', '2000-01-14', NULL, '1234', 1),
(5, 'LA FONTAINE', 'Pierre', '1 avenue de Paris', '1990-12-10', NULL, '1235', 2),
(7, 'Dessard', 'Chris', '4 rue de Londres', NULL, 'M', '1237', 3),
(8, 'Farou', 'Joelle', '4 rue de Londres', NULL, 'F', '1238', 3),
(10, 'DESSARD', 'Laura', '5 rue de la liberté', NULL, 'F', '12310', 18),
(17, 'LEGRAND', 'Louis', '', NULL, NULL, '12317', NULL),
(18, 'ZADI', 'Joachim', NULL, NULL, 'M', '12318', NULL),
(19, 'HAGHIGHI', 'David', NULL, NULL, 'M', '12319', NULL),
(20, 'DEBLANGY', 'Claude', NULL, NULL, 'M', '12320', NULL),
(21, 'T.', 'Merlin', NULL, NULL, 'M', '12321', NULL),
(22, 'SANDRO', 'Rossi', NULL, NULL, 'M', '12322', NULL),
(23, 'KELMOH', 'Landry', NULL, NULL, 'M', '12323', NULL),
(24, 'ELALAMA', 'Mohamed', NULL, NULL, 'M', '12324', NULL),
(25, 'ATTAL', 'David', NULL, NULL, 'M', '12325', NULL),
(26, 'MATSIMA', 'Constant', NULL, NULL, 'M', '12326', NULL),
(27, 'OMARI', 'Youssef', NULL, NULL, 'M', '12327', NULL),
(28, 'RENAUD', 'Claude', NULL, NULL, 'M', '12328', NULL),
(29, 'EZZAT', 'Tarek', NULL, NULL, 'M', '12329', 2),
(30, 'ZOME', 'Christophe', '151 avenue de la république', '1992-07-16', 'M', '12330', 2),
(31, 'RODRIGUES JR.', 'Sidnei', '', NULL, 'M', '12331', 1),
(32, 'FEUZEU', 'Thierry', '', NULL, 'M', '12332', NULL),
(33, 'GRECEANU', 'Vincent', '', NULL, 'M', '12333', NULL),
(34, 'BOUKEBECHE', 'Madani', NULL, NULL, 'M', '12334', 1);

-- --------------------------------------------------------

--
-- Structure de la table commande
--

CREATE TABLE commande (
  id_commande integer NOT NULL,
  date_commande date NOT NULL,
  numero char(5) NOT NULL,
  id_client integer NOT NULL
) ;

--
-- Contenu de la table commande
--

INSERT INTO commande (id_commande, date_commande, numero, id_client) VALUES
(1, '2018-09-01', '00001', 7),
(2, '2018-09-11', '00002', 7),
(5, '2018-12-28', '00003', 18),
(6, '2018-12-31', '00004', 18),
(7, '2018-12-25', '00005', 4),
(8, '2018-11-11', '00006', 10);

-- --------------------------------------------------------

--
-- Structure de la table commande_produit
--

CREATE TABLE commande_produit (
  id_produit integer NOT NULL,
  id_commande integer NOT NULL,
  quantite integer NOT NULL,
  prix_unitaire decimal(15,0) DEFAULT NULL,
  taux_remise integer NOT NULL DEFAULT '0'
) ;

--
-- Contenu de la table commande_produit
--

INSERT INTO commande_produit (id_produit, id_commande, quantite, prix_unitaire, taux_remise) VALUES
(1, 6, 1, '999', 0),
(3, 1, 1, '899', 0),
(3, 2, 2, '899', 10),
(4, 5, 2, '750', 0),
(5, 7, 2, '799', 0),
(9, 1, 2, '1299', 0),
(9, 8, 4, '45', 5),
(10, 5, 3, '255', 0),
(10, 7, 2, '255', 0),
(11, 6, 11, '299', 0),
(13, 1, 1, '429', 0),
(13, 5, 1, '429', 0),
(15, 7, 5, '499', 0),
(17, 2, 10, '29', 20),
(17, 5, 5, '29', 0),
(17, 7, 3, '29', 0);

-- --------------------------------------------------------

--
-- Structure de la table facture
--

CREATE TABLE facture (
  id_facture integer NOT NULL,
  date_facture date DEFAULT NULL,
  numero varchar(10) NOT NULL,
  id_commande integer NOT NULL,
  id_paiement integer DEFAULT NULL
) ;

--
-- Contenu de la table facture
--

INSERT INTO facture (id_facture, date_facture, numero, id_commande, id_paiement) VALUES
(2, '2018-10-01', '12345', 1, 1),
(3, '2018-10-04', '12346', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table fournisseur
--

CREATE TABLE fournisseur (
  id_fournisseur integer NOT NULL,
  nom varchar(150) NOT NULL,
  id_ville integer DEFAULT NULL
) ;

--
-- Contenu de la table fournisseur
--

INSERT INTO fournisseur (id_fournisseur, nom, id_ville) VALUES
(1, 'MSI', 22),
(2, 'HP', 3),
(3, 'Dell', 2),
(4, 'Sony', 19),
(5, 'Apple', 3),
(6, 'Samsung', 1);

-- --------------------------------------------------------

--
-- Structure de la table livraison
--

CREATE TABLE livraison (
  id_livraison integer NOT NULL,
  mode varchar(10) NOT NULL,
  date_livraison date DEFAULT NULL,
  id_facture integer NOT NULL
) ;

-- --------------------------------------------------------

--
-- Structure de la table paiement
--

CREATE TABLE paiement (
  id_paiement integer NOT NULL,
  type_paiement varchar(50) NOT NULL,
  date_paiement date DEFAULT NULL,
  id_facture integer NOT NULL
) ;

--
-- Contenu de la table paiement
--

INSERT INTO paiement (id_paiement, type_paiement, date_paiement, id_facture) VALUES
(1, 'CB', '2018-10-01', 2),
(2, 'CHEQUE', '2018-10-03', 3);

-- --------------------------------------------------------

--
-- Structure de la table paiement_bancaire_joined
--

CREATE TABLE paiement_bancaire_joined (
  type_paiement char(2) NOT NULL,
  idPaiement integer NOT NULL,
  iban varchar(255) DEFAULT NULL,
  montant float NOT NULL
) ;

--
-- Contenu de la table paiement_bancaire_joined
--

INSERT INTO paiement_bancaire_joined (type_paiement, idPaiement, iban, montant) VALUES
('PB', 1, '123456789', 1000),
('CB', 2, '123456789', 500),
('CH', 3, '123456789', 120);

-- --------------------------------------------------------

--
-- Structure de la table pays
--

CREATE TABLE pays (
  code_pays char(2) NOT NULL,
  nom varchar(150) NOT NULL
) ;

--
-- Contenu de la table pays
--

INSERT INTO pays (code_pays, nom) VALUES
('es', 'Espagne'),
('FR', 'France'),
('UK', 'Royaume uni');

-- --------------------------------------------------------

--
-- Structure de la table produit
--

CREATE TABLE produit (
  id_produit integer NOT NULL,
  libelle varchar(150) NOT NULL,
  prix_unitaire decimal(15,3) NOT NULL,
  reference char(8) NOT NULL
) ;

--
-- Contenu de la table produit
--

INSERT INTO produit (id_produit, libelle, prix_unitaire, reference) VALUES
(1, 'PC Gamer', '999.000', 'MSIG111'),
(2, 'PC Gamer Killer', '1499.000', 'MSIGK12'),
(3, 'MSI Start', '899.000', 'MSIS01'),
(4, 'HP Pavillon', '750.000', 'HP1566'),
(5, 'HP Pavilion x360', '799.000', '11107712'),
(8, 'PC Gamer HP OMEN 17', '1099.000', 'an122nf'),
(9, 'PC Gamer HP OMEN 17', '1299.000', 'an106nf'),
(10, 'Imprimante lazer', '255.000', 'HPLZ123'),
(11, 'HP Jetencre Photosmart', '299.000', 'HPPS221'),
(12, 'Souris fast', '39.000', 'HP 721'),
(13, 'HP Ecran 21"', '429.000', 'HPS21'),
(14, 'Souris sans fil 5 boutons', '67.000', 'MSIM1251'),
(15, 'Ecran ultra rapide', '499.000', 'MSISUS'),
(16, 'HP Ecran extra plat 25"', '535.000', 'HPSUF'),
(17, 'Souris 3 boutons', '29.000', 'HPMB111'),
(19, 'Cartouche Encre HP JET Boir', '45.000', 'HPPS221N');

-- --------------------------------------------------------

--
-- Structure de la table produit_categorie
--

CREATE TABLE produit_categorie (
  id_categorie integer NOT NULL,
  id_produit integer NOT NULL
) ;

-- --------------------------------------------------------

--
-- Structure de la table user
--

CREATE TABLE "user" (
  id_user integer NOT NULL,
  login varchar(255) DEFAULT NULL,
  nom varchar(255) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  prenom varchar(255) DEFAULT NULL,
  email varchar(255) NOT NULL,
  profil bit(1) NOT NULL
) ;

--
-- Contenu de la table user
--

INSERT INTO "user" (id_user, login, nom, password, prenom, email, profil) VALUES
(1, 'dp', 'Dupond', 'abc', 'Paul', 'dp@gmail.com', b'1'),
(2, 'nouveau login', 'Un user', 'azerty', 'david', 'pl@yahoo.fr', b'1'),
(3, 'legrand', 'Le Grand', 'unMotdePass', 'Pierre', 'legrand@free.fr', b'0'),
(4, 'diaz', 'Diaz', 'dzl', 'Laura', 'ldz@laposte.net', b'1'),
(5, 'chris', 'Dessard', 'lemdp', 'Chris', 'dessard@gmail.com', b'0'),
(6, 'pif', 'Le Petit', 'fip', 'alexandra', 'pp@laposte.net', b'0'),
(7, 'utilis', 'utilisateur', 'abc', 'Un nouvel', 'utilis@gmail.com', b'0'),
(9, 'zj', 'Zadi', 'jo', 'Jose', 'jozadi@gmail.com', b'1'),
(10, 'Lenouveau', 'LE NOUVEAU', 'mdp', 'Patrick', 'lenouveau@gmail.com', b'0'),
(12, 'zj', 'Zadi', 'jo', 'Joe', 'joezadi@gmail.com', b'1'),
(13, 'zj', 'Zadi', 'Paul', 'Jose', 'jozadi8@gmail.com', b'1'),
(14, 'Paula', 'Dupont', 'Pauld', 'Paula', 'paulad@gmail.com', b'1'),
(16, 'Paula', 'Dupont', 'Pauld', 'Pauline', 'pauline@gmail.com', b'1'),
(18, 'newUser', 'Ducros', 'ducro', 'Pierre', 'pierre@gmail.com', b'1'),
(39, 'jdasilva', 'Dasilva', '123', 'Jr', 'jd2.gmail.com', b'0');

-- --------------------------------------------------------

--
-- Structure de la table ville
--

CREATE TABLE ville (
  id_ville integer NOT NULL,
  nom varchar(150) NOT NULL,
  code_postal varchar(10) NOT NULL,
  code_pays char(2) DEFAULT NULL
) ;

--
-- Contenu de la table ville
--

INSERT INTO ville (id_ville, nom, code_postal, code_pays) VALUES
(1, 'Malakoff', '92240', 'FR'),
(2, 'Lyon', '69003', 'FR'),
(3, 'Paris', '75008', 'FR'),
(11, 'Manchester', 'M11BA', 'UK'),
(18, 'Paris', '75014', 'FR'),
(19, 'Paris', '75001', 'FR'),
(20, 'Montrouge', '92120', 'FR'),
(21, 'Lyon', '69009', 'FR'),
(22, 'Londres', 'SW1X', 'UK'),
(23, 'Liverpool', 'L1OAA', 'UK');

--
-- Index pour les tables exportées
--

--
-- Index pour la table categorie
--
ALTER TABLE categorie
  ADD PRIMARY KEY (id_categorie);

--
-- Index pour la table client
--
ALTER TABLE client
  ADD PRIMARY KEY (id_client),
  ADD UNIQUE (numero);
CREATE INDEX IF NOT EXISTS idx_client_ville ON client (id_ville);
--
-- Index pour la table commande
--
ALTER TABLE commande
  ADD PRIMARY KEY (id_commande);
CREATE INDEX IF NOT EXISTS idx_commande_client ON commande (id_client);

--
-- Index pour la table commande_produit
--
ALTER TABLE commande_produit
  ADD PRIMARY KEY (id_produit,id_commande);
 
CREATE INDEX IF NOT EXISTS idx_commande_produit_produit ON commande_produit (id_produit);
CREATE INDEX IF NOT EXISTS idx_commande_produit_commande ON commande_produit (id_commande);


--
-- Index pour la table facture
--
ALTER TABLE facture
  ADD PRIMARY KEY (id_facture);
  
CREATE INDEX IF NOT EXISTS idx_facture_paiement ON facture (id_paiement);
CREATE INDEX IF NOT EXISTS idx_facture_commande ON facture (id_commande);

--
-- Index pour la table fournisseur
--
ALTER TABLE fournisseur
  ADD PRIMARY KEY (id_fournisseur);
CREATE INDEX IF NOT EXISTS idx_fournisseur_ville ON fournisseur (id_ville);


--
-- Index pour la table livraison
--
ALTER TABLE livraison
  ADD PRIMARY KEY (id_livraison);
CREATE INDEX IF NOT EXISTS idx_livraison_facture ON livraison (id_facture);
--
-- Index pour la table paiement
--
ALTER TABLE paiement
  ADD PRIMARY KEY (id_paiement);
CREATE INDEX IF NOT EXISTS idx_paiement_facture ON paiement (id_facture);

--
-- Index pour la table paiement_bancaire_joined
--
ALTER TABLE paiement_bancaire_joined
  ADD PRIMARY KEY (idPaiement);

--
-- Index pour la table pays
--
ALTER TABLE pays
  ADD PRIMARY KEY (code_pays);

--
-- Index pour la table produit
--
ALTER TABLE produit
  ADD PRIMARY KEY (id_produit),
  ADD UNIQUE (reference);

--
-- Index pour la table produit_categorie
--
ALTER TABLE produit_categorie
  ADD PRIMARY KEY (id_categorie,id_produit);
CREATE INDEX IF NOT EXISTS idx_produit_categorie_categorie ON produit_categorie (id_categorie);
CREATE INDEX IF NOT EXISTS idx_produit_categorie_produit ON produit_categorie (id_produit);

--
-- Index pour la table user
--
ALTER TABLE "user"
  ADD PRIMARY KEY (id_user),
  ADD UNIQUE (email);

--
-- Index pour la table ville
--
ALTER TABLE ville
  ADD PRIMARY KEY (id_ville);
CREATE INDEX IF NOT EXISTS idx_ville_pays ON ville (code_pays);


--
-- Contraintes pour la table client
--
ALTER TABLE client
  ADD CONSTRAINT FK_VILLE FOREIGN KEY (id_ville) REFERENCES ville (id_ville);

--
-- Contraintes pour la table commande
--
ALTER TABLE commande
  ADD CONSTRAINT commande_ibfk_1 FOREIGN KEY (id_client) REFERENCES client (id_client);

--
-- Contraintes pour la table commande_produit
--
ALTER TABLE commande_produit
  ADD CONSTRAINT commande_produit_ibfk_1 FOREIGN KEY (id_produit) REFERENCES produit (id_produit),
  ADD CONSTRAINT commande_produit_ibfk_2 FOREIGN KEY (id_commande) REFERENCES commande (id_commande);

--
-- Contraintes pour la table facture
--
ALTER TABLE facture
  ADD CONSTRAINT facture_ibfk_1 FOREIGN KEY (id_commande) REFERENCES commande (id_commande),
  ADD CONSTRAINT facture_ibfk_2 FOREIGN KEY (id_paiement) REFERENCES paiement (id_paiement);

--
-- Contraintes pour la table fournisseur
--
ALTER TABLE fournisseur
  ADD CONSTRAINT fournisseur_ibfk_1 FOREIGN KEY (id_ville) REFERENCES ville (id_ville);

--
-- Contraintes pour la table livraison
--
ALTER TABLE livraison
  ADD CONSTRAINT livraison_ibfk_1 FOREIGN KEY (id_facture) REFERENCES facture (id_facture);

--
-- Contraintes pour la table paiement
--
ALTER TABLE paiement
  ADD CONSTRAINT paiement_ibfk_1 FOREIGN KEY (id_facture) REFERENCES facture (id_facture);

--
-- Contraintes pour la table produit_categorie
--
ALTER TABLE produit_categorie
  ADD CONSTRAINT produit_categorie_ibfk_1 FOREIGN KEY (id_categorie) REFERENCES categorie (id_categorie),
  ADD CONSTRAINT produit_categorie_ibfk_2 FOREIGN KEY (id_produit) REFERENCES produit (id_produit);

--
-- Contraintes pour la table ville
--
ALTER TABLE ville
  ADD CONSTRAINT FK_PAYS FOREIGN KEY (code_pays) REFERENCES pays (code_pays);

-- Sequence for primary_key
CREATE SEQUENCE IF NOT EXISTS  seq_categorie START WITH 1 NO CYCLE OWNED BY categorie.id_categorie;
CREATE SEQUENCE IF NOT EXISTS  seq_client START WITH 35 NO CYCLE OWNED BY client.id_client;
CREATE SEQUENCE IF NOT EXISTS  seq_commande START WITH 9 NO CYCLE OWNED BY commande.id_commande;
CREATE SEQUENCE IF NOT EXISTS  seq_facture START WITH 4 NO CYCLE OWNED BY facture.id_facture;
CREATE SEQUENCE IF NOT EXISTS  seq_fournisseur START WITH 7 NO CYCLE OWNED BY fournisseur.id_fournisseur;
CREATE SEQUENCE IF NOT EXISTS  seq_livraison START WITH 1 NO CYCLE OWNED BY livraison.id_livraison;
CREATE SEQUENCE IF NOT EXISTS  seq_paiement START WITH 3 NO CYCLE OWNED BY paiement.id_paiement;
CREATE SEQUENCE IF NOT EXISTS  seq_paiement_bancaire_joined START WITH 4 NO CYCLE OWNED BY paiement_bancaire_joined.idPaiement;
CREATE SEQUENCE IF NOT EXISTS  seq_pays START WITH 4 NO CYCLE OWNED BY pays.code_pays;
CREATE SEQUENCE IF NOT EXISTS  seq_produit START WITH 20 NO CYCLE OWNED BY produit.id_produit;
CREATE SEQUENCE IF NOT EXISTS  seq_produit_categorie START WITH 20 NO CYCLE OWNED BY produit_categorie.id_categorie;
CREATE SEQUENCE IF NOT EXISTS  seq_user START WITH 40 NO CYCLE OWNED BY "user".id_user;
CREATE SEQUENCE IF NOT EXISTS  seq_ville START WITH 24 NO CYCLE OWNED BY ville.id_ville;

