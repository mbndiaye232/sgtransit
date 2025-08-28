-- Script MySQL 8 nettoyé à partir du script WinDev
-- Corrections principales:
-- - Espaces avant DEFAULT (ex: TINYINT DEFAULT 0)
-- - Remplacement de VARCHAR(65000) par TEXT
-- - Correction de l'ID primaire mal nommée dans `LiaisonLVIProduits`
-- - Suppression des DEFAULT 0 sur colonnes UNIQUE (ex: `LiaisonLVIProduits`.`idlvi`, `Enlevement`.`IDDetentions`)
-- - Changement de certains champs date/heure en types DATE/TIMESTAMP

-- Création de la table Agents
CREATE TABLE `Agents` (
    `IDAgents` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NomAgent` VARCHAR(100),
    `Sexe` VARCHAR(50),
    `Datenaiss` DATE,
    `Lieunaiss` VARCHAR(75),
    `adresse` VARCHAR(75),
    `Tel` VARCHAR(25),
    `Cel` VARCHAR(25),
    `Email` VARCHAR(100),
    `FonctionAgent` VARCHAR(75),
    `Observations` VARCHAR(250),
    `photo` LONGBLOB,
    `cheminphoto` VARCHAR(255),
    `Login` VARCHAR(150) UNIQUE,
    `ValidationDossiers` TINYINT DEFAULT 0,
    `Niveauhabilitation` NUMERIC(24,6) DEFAULT 0,
    `PayeParCaisse` TINYINT DEFAULT 0,
    `ValidationPieceCaisse` TINYINT DEFAULT 0,
    `ValiderNoteDetail` TINYINT DEFAULT 0,
    `MajTEC` TINYINT DEFAULT 0
);
CREATE INDEX `WDIDX_Agents_NomAgent` ON `Agents` (`NomAgent`);

-- Création de la table Articles
CREATE TABLE `Articles` (
    `IDArticles` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDNotesDeDetails` BIGINT DEFAULT 0,
    `NumeroArticle` INTEGER DEFAULT 0,
    `Origine` VARCHAR(5) DEFAULT '0',
    `IDRegimeDeclaration` BIGINT DEFAULT 0,
    `FOB` NUMERIC(24,6) DEFAULT 0,
    `FRET` NUMERIC(24,6) DEFAULT 0,
    `ASSURANCES` NUMERIC(24,6) DEFAULT 0,
    `BRUT` REAL DEFAULT 0,
    `NET` REAL DEFAULT 0,
    `QC` REAL DEFAULT 0,
    `QM` DOUBLE DEFAULT 0,
    `CommissionFournisseur` NUMERIC(24,6) DEFAULT 0,
    `IDDEVISEFOB` BIGINT DEFAULT 0,
    `IDDEVISEFRET` BIGINT DEFAULT 0,
    `IDDEVISEASS` BIGINT DEFAULT 0,
    `CAF` NUMERIC(24,6) DEFAULT 0,
    `CodeRegimeDeclaration` VARCHAR(10) DEFAULT '0,00',
    `MontantTaxes` NUMERIC(24,6) DEFAULT 0,
    `NTS` VARCHAR(15),
    `FOBCFA` NUMERIC(24,6) DEFAULT 0,
    `FRETCFA` NUMERIC(24,6) DEFAULT 0,
    `ASSURANCESCFA` NUMERIC(24,6) DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0,
    `DPI` VARCHAR(50),
    `NBCOLIS` INTEGER DEFAULT 0,
    `TitreExo` VARCHAR(150)
);
CREATE INDEX `WDIDX_Articles_IDNotesDeDetails` ON `Articles` (`IDNotesDeDetails`);
CREATE INDEX `WDIDX_Articles_NumeroArticle` ON `Articles` (`NumeroArticle`);
CREATE INDEX `WDIDX_Articles_Origine` ON `Articles` (`Origine`);
CREATE INDEX `WDIDX_Articles_IDRegimeDeclaration` ON `Articles` (`IDRegimeDeclaration`);
CREATE INDEX `WDIDX_Articles_IDDEVISEFOB` ON `Articles` (`IDDEVISEFOB`);
CREATE INDEX `WDIDX_Articles_IDDEVISEFRET` ON `Articles` (`IDDEVISEFRET`);
CREATE INDEX `WDIDX_Articles_IDDEVISEASS` ON `Articles` (`IDDEVISEASS`);
CREATE INDEX `WDIDX_Articles_CodeRegimeDeclaration` ON `Articles` (`CodeRegimeDeclaration`);
CREATE INDEX `WDIDX_Articles_NTS` ON `Articles` (`NTS`);
CREATE INDEX `WDIDX_Articles_IdAgent` ON `Articles` (`IdAgent`);
CREATE INDEX `WDIDX_Articles_DPI` ON `Articles` (`DPI`);
CREATE INDEX `WDIDX_Articles_TitreExo` ON `Articles` (`TitreExo`);

-- Création de la table BillOfLanding
CREATE TABLE `BillOfLanding` (
    `idbl` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Expéditeur` VARCHAR(250) DEFAULT '0',
    `Notify` VARCHAR(150) DEFAULT '0',
    `IDAgents` BIGINT DEFAULT 0,
    `Consignee` VARCHAR(150),
    `PreAcheminePar` VARCHAR(150),
    `LieuDeReception` VARCHAR(150),
    `LieuDePaiementFret` VARCHAR(150),
    `NbreBLOriginaux` INTEGER DEFAULT 0,
    `AdresseDeLivraisonFinale` VARCHAR(250),
    `IDDossiers` BIGINT DEFAULT 0,
    `Observations` VARCHAR(250),
    `DureeFranchise` INTEGER DEFAULT 10,
    `nbreconteneurs` INTEGER DEFAULT 0,
    `NumeroTitreTransport` VARCHAR(150),
    `Typetitretransport` VARCHAR(50),
    `Fournisseur` VARCHAR(150)
);
CREATE INDEX `WDIDX_BillOfLanding_Expéditeur` ON `BillOfLanding` (`Expéditeur`);
CREATE INDEX `WDIDX_BillOfLanding_Notify` ON `BillOfLanding` (`Notify`);
CREATE INDEX `WDIDX_BillOfLanding_IDAgents` ON `BillOfLanding` (`IDAgents`);
CREATE INDEX `WDIDX_BillOfLanding_IDDossiers` ON `BillOfLanding` (`IDDossiers`);
CREATE INDEX `WDIDX_BillOfLanding_NumeroTitreTransport` ON `BillOfLanding` (`NumeroTitreTransport`);
CREATE INDEX `WDIDX_BillOfLanding_Typetitretransport` ON `BillOfLanding` (`Typetitretransport`);
CREATE INDEX `WDIDX_BillOfLanding_Fournisseur` ON `BillOfLanding` (`Fournisseur`);

-- Création de la table BillOfLandingMaya
CREATE TABLE `BillOfLandingMaya` (
    `idbl` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Expéditeur` VARCHAR(250) DEFAULT '0',
    `Notify` VARCHAR(150) DEFAULT '0',
    `IDAgents` BIGINT DEFAULT 0,
    `Consignee` VARCHAR(150),
    `PreAcheminePar` VARCHAR(150),
    `LieuDeReception` VARCHAR(150),
    `LieuDePaiementFret` VARCHAR(150),
    `NbreBLOriginaux` INTEGER DEFAULT 0,
    `AdresseDeLivraisonFinale` VARCHAR(250),
    `IDDossiers` BIGINT DEFAULT 0,
    `Observations` VARCHAR(250),
    `DureeFranchise` INTEGER DEFAULT 10,
    `nbreconteneurs` INTEGER DEFAULT 0,
    `NumeroTitreTransport` VARCHAR(150),
    `Typetitretransport` VARCHAR(50),
    `Fournisseur` VARCHAR(150),
    `nbrecolis` VARCHAR(150),
    `Poids` VARCHAR(150),
    `NumDeclaration` VARCHAR(150),
    `conteneurs` VARCHAR(250),
    `Compagnie` VARCHAR(150),
    `Moyendetransport` VARCHAR(250),
    `villedepart` VARCHAR(150),
    `villearrivee` VARCHAR(150),
    `Volumem3` VARCHAR(150)
);
CREATE INDEX `WDIDX_BillOfLandingMaya_Expéditeur` ON `BillOfLandingMaya` (`Expéditeur`);
CREATE INDEX `WDIDX_BillOfLandingMaya_Notify` ON `BillOfLandingMaya` (`Notify`);
CREATE INDEX `WDIDX_BillOfLandingMaya_IDAgents` ON `BillOfLandingMaya` (`IDAgents`);
CREATE INDEX `WDIDX_BillOfLandingMaya_IDDossiers` ON `BillOfLandingMaya` (`IDDossiers`);
CREATE INDEX `WDIDX_BillOfLandingMaya_NumeroTitreTransport` ON `BillOfLandingMaya` (`NumeroTitreTransport`);
CREATE INDEX `WDIDX_BillOfLandingMaya_Typetitretransport` ON `BillOfLandingMaya` (`Typetitretransport`);
CREATE INDEX `WDIDX_BillOfLandingMaya_Fournisseur` ON `BillOfLandingMaya` (`Fournisseur`);
CREATE INDEX `WDIDX_BillOfLandingMaya_NumDeclaration` ON `BillOfLandingMaya` (`NumDeclaration`);

-- Création de la table Booking
CREATE TABLE `Booking` (
    `IDBooking` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `ObjetBooking` VARCHAR(150),
    `DateBooking` DATE,
    `IDDossiers` BIGINT DEFAULT 0,
    `InstructionsParticulieres` VARCHAR(250),
    `Numerobooking` VARCHAR(50) UNIQUE,
    `DepotSouhaite` VARCHAR(250),
    `AdresseDepot` VARCHAR(150),
    `ContactTCD1` VARCHAR(150),
    `PhoneTCD2` VARCHAR(150),
    `Observations` VARCHAR(250),
    `TerminalChargement` VARCHAR(350),
    `IdAgent` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_Booking_ObjetBooking` ON `Booking` (`ObjetBooking`);
CREATE INDEX `WDIDX_Booking_DateBooking` ON `Booking` (`DateBooking`);
CREATE INDEX `WDIDX_Booking_IDDossiers` ON `Booking` (`IDDossiers`);
CREATE INDEX `WDIDX_Booking_DepotSouhaite` ON `Booking` (`DepotSouhaite`);
CREATE INDEX `WDIDX_Booking_AdresseDepot` ON `Booking` (`AdresseDepot`);
CREATE INDEX `WDIDX_Booking_ContactTCD1` ON `Booking` (`ContactTCD1`);
CREATE INDEX `WDIDX_Booking_PhoneTCD2` ON `Booking` (`PhoneTCD2`);
CREATE INDEX `WDIDX_Booking_TerminalChargement` ON `Booking` (`TerminalChargement`);
CREATE INDEX `WDIDX_Booking_IdAgent` ON `Booking` (`IdAgent`);

-- Création de la table BordereauxDeLivraisons
CREATE TABLE `BordereauxDeLivraisons` (
    `IDBordereauxDeLivraisons` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `CodeBordereauDeLivraison` VARCHAR(50) UNIQUE,
    `DateBordereauLivraison` DATE,
    `IDDossiers` BIGINT DEFAULT 0,
    `Enlevement` DATE,
    `numerocamion` VARCHAR(50),
    `datedebutmagasinage` DATE,
    `datefinmagasinage` DATE,
    `RTransmisClient` TINYINT DEFAULT 0,
    `AdresseDeLivraison` VARCHAR(150),
    `Destinataire` VARCHAR(200),
    `Expéditeur` VARCHAR(250),
    `MS` VARCHAR(250),
    `NUMBL` VARCHAR(50),
    `PROVENANCE` VARCHAR(250),
    `NumeroDeclaration` VARCHAR(50),
    `CodeDossier` VARCHAR(50),
    `NumeroOT` VARCHAR(150),
    `LibelleMoyenTransport` VARCHAR(250),
    `DateArrivéeNav` DATE,
    `CodeOrdreTransport` VARCHAR(50)
);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_IDDossiers` ON `BordereauxDeLivraisons` (`IDDossiers`);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_numerocamion` ON `BordereauxDeLivraisons` (`numerocamion`);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_AdresseDeLivraison` ON `BordereauxDeLivraisons` (`AdresseDeLivraison`);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_Destinataire` ON `BordereauxDeLivraisons` (`Destinataire`);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_Expéditeur` ON `BordereauxDeLivraisons` (`Expéditeur`);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_NumeroDeclaration` ON `BordereauxDeLivraisons` (`NumeroDeclaration`);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_CodeDossier` ON `BordereauxDeLivraisons` (`CodeDossier`);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_NumeroOT` ON `BordereauxDeLivraisons` (`NumeroOT`);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_LibelleMoyenTransport` ON `BordereauxDeLivraisons` (`LibelleMoyenTransport`);
CREATE INDEX `WDIDX_BordereauxDeLivraisons_CodeOrdreTransport` ON `BordereauxDeLivraisons` (`CodeOrdreTransport`);

-- Création de la table ChargementCamion
CREATE TABLE `ChargementCamion` (
    `IDChargementCamion` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `MarquesEtNumeros` VARCHAR(150),
    `nbreconteneurs` INTEGER DEFAULT 0,
    `ModeEmballage` VARCHAR(250),
    `NatureMarchandise` VARCHAR(250),
    `PoidsBrutKg` REAL DEFAULT 0,
    `Volumem3` REAL DEFAULT 0,
    `UnitePoids` VARCHAR(50),
    `UniteVolume` VARCHAR(50),
    `idblltalvibooking` BIGINT DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_ChargementCamion_MarquesEtNumeros` ON `ChargementCamion` (`MarquesEtNumeros`);
CREATE INDEX `WDIDX_ChargementCamion_NatureMarchandise` ON `ChargementCamion` (`NatureMarchandise`);
CREATE INDEX `WDIDX_ChargementCamion_idblltalvibooking` ON `ChargementCamion` (`idblltalvibooking`);
CREATE INDEX `WDIDX_ChargementCamion_IdAgent` ON `ChargementCamion` (`IdAgent`);

-- Création de la table CLIENTS
CREATE TABLE `CLIENTS` (
    `IDCLIENTS` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NomRS` VARCHAR(100),
    `adresseClient` VARCHAR(75),
    `TelClient` VARCHAR(25),
    `IdAgent` BIGINT DEFAULT 0,
    `CelClient` VARCHAR(25),
    `EmailClient` VARCHAR(250),
    `Observations` VARCHAR(250),
    `cheminfiche` VARCHAR(255),
    `IDStatuts` BIGINT DEFAULT 0,
    `Saisile` DATE,
    `Modifiele` DATE,
    `idagentmodification` BIGINT DEFAULT 0,
    `NINEA` VARCHAR(50),
    `EncoursAutorise` NUMERIC(24,6) DEFAULT 0,
    `AssuranceCredit` NUMERIC(24,6) DEFAULT 0,
    `CheminLettreEXO` VARCHAR(255),
    `TauxRemise` REAL DEFAULT 0,
    `ExonereTVA` TINYINT DEFAULT 0,
    `PersonneContact` VARCHAR(150),
    `EmailPersonneContact` VARCHAR(150),
    `TelPersonneContact` VARCHAR(50),
    `TypeClient` VARCHAR(5),
    `CodeClient` VARCHAR(50),
    `faxClient` VARCHAR(50),
    `DelaiReglement` INTEGER DEFAULT 0,
    `DelaiReglementDouane` INTEGER DEFAULT 0,
    `NumExoneration` VARCHAR(50),
    `NumCompteSAARI` VARCHAR(50),
    `TauxCommissionDDouane` REAL DEFAULT 0,
    `TauxCommissionDebours` REAL DEFAULT 0,
    `sappliqueTousDebours` TINYINT DEFAULT 0,
    `FactureDouaneAvecCommissionEtTVA` TINYINT DEFAULT 0
);
CREATE INDEX `WDIDX_CLIENTS_NomRS` ON `CLIENTS` (`NomRS`);
CREATE INDEX `WDIDX_CLIENTS_adresseClient` ON `CLIENTS` (`adresseClient`);
CREATE INDEX `WDIDX_CLIENTS_TelClient` ON `CLIENTS` (`TelClient`);
CREATE INDEX `WDIDX_CLIENTS_IdAgent` ON `CLIENTS` (`IdAgent`);
CREATE INDEX `WDIDX_CLIENTS_EmailClient` ON `CLIENTS` (`EmailClient`);
CREATE INDEX `WDIDX_CLIENTS_IDStatuts` ON `CLIENTS` (`IDStatuts`);
CREATE INDEX `WDIDX_CLIENTS_idagentmodification` ON `CLIENTS` (`idagentmodification`);
CREATE INDEX `WDIDX_CLIENTS_NINEA` ON `CLIENTS` (`NINEA`);
CREATE INDEX `WDIDX_CLIENTS_TypeClient` ON `CLIENTS` (`TypeClient`);
CREATE INDEX `WDIDX_CLIENTS_CodeClient` ON `CLIENTS` (`CodeClient`);
CREATE INDEX `WDIDX_CLIENTS_DelaiReglement` ON `CLIENTS` (`DelaiReglement`);
CREATE INDEX `WDIDX_CLIENTS_NumExoneration` ON `CLIENTS` (`NumExoneration`);

-- Création de la table ComplementsTaxes
CREATE TABLE `ComplementsTaxes` (
    `IDComplementsTaxes` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDTaxes` BIGINT DEFAULT 0,
    `idtaxesComplements` BIGINT DEFAULT 0,
    `CodeTaxe` VARCHAR(10),
    `CodeTaxeComplement` VARCHAR(10)
);
CREATE INDEX `WDIDX_ComplementsTaxes_IDTaxes` ON `ComplementsTaxes` (`IDTaxes`);
CREATE INDEX `WDIDX_ComplementsTaxes_idtaxesComplements` ON `ComplementsTaxes` (`idtaxesComplements`);
CREATE INDEX `WDIDX_ComplementsTaxes_CodeTaxe` ON `ComplementsTaxes` (`CodeTaxe`);
CREATE INDEX `WDIDX_ComplementsTaxes_CodeTaxeComplement` ON `ComplementsTaxes` (`CodeTaxeComplement`);

-- Création de la table ComptesClients
CREATE TABLE `ComptesClients` (
    `IDComptesClients` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleCompteClients` VARCHAR(50),
    `Observations` VARCHAR(250),
    `IDCLIENTS` BIGINT DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0,
    `SoldeCompteClient` NUMERIC(24,6) DEFAULT 0,
    `TotalCredit` NUMERIC(24,6) DEFAULT 0,
    `TotalDebit` NUMERIC(24,6) DEFAULT 0
);
CREATE INDEX `WDIDX_ComptesClients_LibelleCompteClients` ON `ComptesClients` (`LibelleCompteClients`);
CREATE INDEX `WDIDX_ComptesClients_IDCLIENTS` ON `ComptesClients` (`IDCLIENTS`);
CREATE INDEX `WDIDX_ComptesClients_IdAgent` ON `ComptesClients` (`IdAgent`);

-- Création de la table ComptesMails
CREATE TABLE `ComptesMails` (
    `IDComptesMails` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `adressemail` VARCHAR(255) UNIQUE,
    `MotdePasse` VARCHAR(150),
    `ServeurPOP` VARCHAR(250),
    `PortServeurPOP` INTEGER DEFAULT 0,
    `ServeurSMTP` VARCHAR(250),
    `PortServeurSMTP` INTEGER DEFAULT 0,
    `ServeurIMAPENTRANT` VARCHAR(250),
    `ServeurIMAPSORTANT` VARCHAR(250),
    `PortServeurIMAPENTRANT` INTEGER DEFAULT 0,
    `PortServeurIMAPSORTANT` INTEGER DEFAULT 0,
    `LibelleMail` VARCHAR(250)
);

-- Création de la table ConteneurBL
CREATE TABLE `ConteneurBL` (
    `IDConteneurBL` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NumeroTC` VARCHAR(150),
    `TypeTC` VARCHAR(150),
    `TareTC` REAL DEFAULT 0,
    `DimensionTC` REAL DEFAULT 0,
    `UnitePoids` VARCHAR(50),
    `UniteVolumeMaeDimension` VARCHAR(50),
    `idblltalvibooking` BIGINT DEFAULT 0,
    `Contenu` LONGTEXT,
    `IDAgents` BIGINT DEFAULT 0,
    `Affecte` TINYINT DEFAULT 0,
    `Rendu` TINYINT DEFAULT 0,
    `DateRetourConteneur` DATE,
    `SEL` TINYINT DEFAULT 0,
    `NumeroPlomb` VARCHAR(150)
);
CREATE INDEX `WDIDX_ConteneurBL_NumeroTC` ON `ConteneurBL` (`NumeroTC`);
CREATE INDEX `WDIDX_ConteneurBL_TypeTC` ON `ConteneurBL` (`TypeTC`);
CREATE INDEX `WDIDX_ConteneurBL_idblltalvibooking` ON `ConteneurBL` (`idblltalvibooking`);
CREATE INDEX `WDIDX_ConteneurBL_IDAgents` ON `ConteneurBL` (`IDAgents`);

-- Création de la table ContenuConteneurOrdreTrBordereauLiv
CREATE TABLE `ContenuConteneurOrdreTrBordereauLiv` (
    `IDContenuConteneurOrdreTrBordereauLiv` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `CodeOrdreTransport` VARCHAR(50),
    `CodeBordereauDeLivraison` VARCHAR(50),
    `NumeroTC` VARCHAR(150),
    `TypeTC` VARCHAR(150),
    `ObjetTC` VARCHAR(50),
    `Quantite` REAL DEFAULT 0,
    `PoidsNet` REAL DEFAULT 0,
    `Unite` VARCHAR(50)
);
CREATE INDEX `WDIDX_ContenuConteneurOrdreTrBordereauLiv_CodeOrdreTransport` ON `ContenuConteneurOrdreTrBordereauLiv` (`CodeOrdreTransport`);
CREATE INDEX `WDIDX_ContenuConteneurOrdreTrBordereauLiv_CodeBordereauDeLi00001` ON `ContenuConteneurOrdreTrBordereauLiv` (`CodeBordereauDeLivraison`);
CREATE INDEX `WDIDX_ContenuConteneurOrdreTrBordereauLiv_NumeroTC` ON `ContenuConteneurOrdreTrBordereauLiv` (`NumeroTC`);
CREATE INDEX `WDIDX_ContenuConteneurOrdreTrBordereauLiv_TypeTC` ON `ContenuConteneurOrdreTrBordereauLiv` (`TypeTC`);

-- Création de la table ContenusConteneurs
CREATE TABLE `ContenusConteneurs` (
    `IDContenusConteneurs` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDConteneurBL` BIGINT DEFAULT 0,
    `ObjetConteneur` VARCHAR(150),
    `Quantite` REAL DEFAULT 0,
    `PoidsTotalNet` REAL DEFAULT 0,
    `Unite` VARCHAR(50),
    `IdAgent` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_ContenusConteneurs_IDConteneurBL` ON `ContenusConteneurs` (`IDConteneurBL`);
CREATE INDEX `WDIDX_ContenusConteneurs_ObjetConteneur` ON `ContenusConteneurs` (`ObjetConteneur`);
CREATE INDEX `WDIDX_ContenusConteneurs_IdAgent` ON `ContenusConteneurs` (`IdAgent`);

-- Création de la table Cotations
CREATE TABLE `Cotations` (
    `IDCotations` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IdagentSaisie` BIGINT DEFAULT 0,
    `DateCotation` DATE,
    `MontantHTCotation` NUMERIC(24,6) DEFAULT 0,
    `MontantTVACotation` NUMERIC(24,6) DEFAULT 0,
    `MontantTTCCotation` NUMERIC(24,6) DEFAULT 0,
    `Observations` VARCHAR(250),
    `Acceptee` TINYINT DEFAULT 0,
    `NumeroCotation` VARCHAR(50) UNIQUE,
    `NumeroTitreTransport` VARCHAR(150),
    `NumeroDeclaration` VARCHAR(50) UNIQUE,
    `Moyendetransport` VARCHAR(250),
    `PROVENANCE` VARCHAR(250),
    `LieuArrivee` VARCHAR(250),
    `LibelleProduit` VARCHAR(250),
    `NombreColis` VARCHAR(150),
    `Poids` VARCHAR(150),
    `Contenant` VARCHAR(250),
    `IDDossiers` BIGINT DEFAULT 0,
    `CheminDocumentPDF` VARCHAR(255)
);
CREATE INDEX `WDIDX_Cotations_IdagentSaisie` ON `Cotations` (`IdagentSaisie`);
CREATE INDEX `WDIDX_Cotations_DateCotation` ON `Cotations` (`DateCotation`);
CREATE INDEX `WDIDX_Cotations_NumeroTitreTransport` ON `Cotations` (`NumeroTitreTransport`);
CREATE INDEX `WDIDX_Cotations_IDDossiers` ON `Cotations` (`IDDossiers`);

-- Création de la table Couleurs
CREATE TABLE `Couleurs` (
    `IDCouleurs` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `ndjours` INTEGER DEFAULT 0,
    `Rouge` INTEGER DEFAULT 0,
    `Vert` INTEGER DEFAULT 0,
    `Bleu` INTEGER DEFAULT 0
);

-- Création de la table Declarations
CREATE TABLE `Declarations` (
    `IDDeclarations` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `DateDeclaration` TIMESTAMP,
    `IdAgent` BIGINT DEFAULT 0,
    `Observations` VARCHAR(250),
    `NumeroDeclaration` VARCHAR(50) UNIQUE,
    `DateBAE` DATE,
    `IDDossiers` BIGINT DEFAULT 0,
    `RegimeDeclaration` VARCHAR(10),
    `NumeroBureau` VARCHAR(50)
);
CREATE INDEX `WDIDX_Declarations_DateDeclaration` ON `Declarations` (`DateDeclaration`);
CREATE INDEX `WDIDX_Declarations_IdAgent` ON `Declarations` (`IdAgent`);
CREATE INDEX `WDIDX_Declarations_DateBAE` ON `Declarations` (`DateBAE`);
CREATE INDEX `WDIDX_Declarations_IDDossiers` ON `Declarations` (`IDDossiers`);
CREATE INDEX `WDIDX_Declarations_NumeroBureau` ON `Declarations` (`NumeroBureau`);

-- Création de la table DetailFactures
CREATE TABLE `DetailFactures` (
    `IDDetailFactures` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `CodeRubrique` VARCHAR(25),
    `NumFacture` VARCHAR(50),
    `libelleRubrique` VARCHAR(200),
    `Montant` NUMERIC(24,6) DEFAULT 0,
    `CodeTVA` INTEGER DEFAULT 0,
    `LibModele` VARCHAR(50),
    `NumCompteGen` VARCHAR(10)
);
CREATE INDEX `WDIDX_DetailFactures_CodeRubrique` ON `DetailFactures` (`CodeRubrique`);
CREATE INDEX `WDIDX_DetailFactures_NumFacture` ON `DetailFactures` (`NumFacture`);
CREATE INDEX `WDIDX_DetailFactures_libelleRubrique` ON `DetailFactures` (`libelleRubrique`);
CREATE INDEX `WDIDX_DetailFactures_CodeTVA` ON `DetailFactures` (`CodeTVA`);
CREATE INDEX `WDIDX_DetailFactures_LibModele` ON `DetailFactures` (`LibModele`);
CREATE INDEX `WDIDX_DetailFactures_NumCompteGen` ON `DetailFactures` (`NumCompteGen`);

-- Création de la table Detentions
CREATE TABLE `Detentions` (
    `IDDetentions` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Zone` VARCHAR(50),
    `DureeDetention` VARCHAR(50) DEFAULT '0'
);
CREATE INDEX `WDIDX_Detentions_Zone` ON `Detentions` (`Zone`);

-- Création de la table Devises
CREATE TABLE `Devises` (
    `IDDevises` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(100),
    `Symbole` VARCHAR(5),
    `TauxChangeDeviseCFA` NUMERIC(24,6) DEFAULT 0,
    `Maj` TIMESTAMP,
    `IdAgent` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_Devises_libelle` ON `Devises` (`libelle`);
CREATE INDEX `WDIDX_Devises_IdAgent` ON `Devises` (`IdAgent`);

-- Création de la table Documents
CREATE TABLE `Documents` (
    `IDDocuments` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleDocument` VARCHAR(250),
    `DescriptionDocument` TEXT,
    `CheminDocument` VARCHAR(255),
    `IdAgent` BIGINT DEFAULT 0,
    `NumeroDocument` VARCHAR(150),
    `IDTypesDocuments` BIGINT,
    `IDDossiers` BIGINT DEFAULT 0,
    `DatePublication` DATE,
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_Documents_IdAgent` ON `Documents` (`IdAgent`);
CREATE INDEX `WDIDX_Documents_NumeroDocument` ON `Documents` (`NumeroDocument`);
CREATE INDEX `WDIDX_Documents_IDTypesDocuments` ON `Documents` (`IDTypesDocuments`);
CREATE INDEX `WDIDX_Documents_IDDossiers` ON `Documents` (`IDDossiers`);

-- Création de la table DomaineActivite
CREATE TABLE `DomaineActivite` (
    `IDDomaineActivite` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleDomaineActivite` VARCHAR(150),
    `Code` VARCHAR(5) UNIQUE
);
CREATE INDEX `WDIDX_DomaineActivite_LibelleDomaineActivite` ON `DomaineActivite` (`LibelleDomaineActivite`);

-- Création de la table Dossiers
CREATE TABLE `Dossiers` (
    `IDDossiers` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `DateOuvertureDossiers` DATE,
    `IdEtapeDossiers` BIGINT DEFAULT 0,
    `SaisiLe` DATE,
    `IdAgentSaisi` BIGINT DEFAULT 0,
    `IdAgModiff` BIGINT DEFAULT 0,
    `DateModif` DATE,
    `IdAgentValidation` BIGINT DEFAULT 0,
    `DateValidataion` DATE,
    `IDCLIENTS` BIGINT DEFAULT 0,
    `Libelle` VARCHAR(250),
    `DescriptionDossiers` TEXT,
    `Facturable` TINYINT DEFAULT 0,
    `NatureDossier` VARCHAR(50) DEFAULT '0',
    `TypeDossier` VARCHAR(50),
    `ModeExpedition` VARCHAR(50),
    `CodeDossier` VARCHAR(50) UNIQUE,
    `Observations` VARCHAR(250),
    `Typedocument` VARCHAR(5),
    `NumeroOrbus` VARCHAR(50),
    `CodeClient` VARCHAR(50),
    `PersonneContact` VARCHAR(150),
    `TelPersonneContact` VARCHAR(50),
    `EmailPersonneContact` VARCHAR(150),
    `EtapeCotation` TINYINT DEFAULT 0,
    `idagentsfacturable` BIGINT DEFAULT 0,
    `Datefaturable` TIMESTAMP,
    `cheminfiche` VARCHAR(255),
    `CodeDossierCourt` VARCHAR(50),
    `NumeroDPI` VARCHAR(51),
    `GenereSur` VARCHAR(50),
    `DateTransmission` DATE
);
CREATE INDEX `WDIDX_Dossiers_DateOuvertureDossiers` ON `Dossiers` (`DateOuvertureDossiers`);
CREATE INDEX `WDIDX_Dossiers_IdEtapeDossiers` ON `Dossiers` (`IdEtapeDossiers`);
CREATE INDEX `WDIDX_Dossiers_SaisiLe` ON `Dossiers` (`SaisiLe`);
CREATE INDEX `WDIDX_Dossiers_IdAgentSaisi` ON `Dossiers` (`IdAgentSaisi`);
CREATE INDEX `WDIDX_Dossiers_IdAgModiff` ON `Dossiers` (`IdAgModiff`);
CREATE INDEX `WDIDX_Dossiers_IdAgentValidation` ON `Dossiers` (`IdAgentValidation`);
CREATE INDEX `WDIDX_Dossiers_IDCLIENTS` ON `Dossiers` (`IDCLIENTS`);
CREATE INDEX `WDIDX_Dossiers_Libelle` ON `Dossiers` (`Libelle`);
CREATE INDEX `WDIDX_Dossiers_TypeDossier` ON `Dossiers` (`TypeDossier`);
CREATE INDEX `WDIDX_Dossiers_NumeroOrbus` ON `Dossiers` (`NumeroOrbus`);
CREATE INDEX `WDIDX_Dossiers_CodeClient` ON `Dossiers` (`CodeClient`);
CREATE INDEX `WDIDX_Dossiers_PersonneContact` ON `Dossiers` (`PersonneContact`);
CREATE INDEX `WDIDX_Dossiers_TelPersonneContact` ON `Dossiers` (`TelPersonneContact`);
CREATE INDEX `WDIDX_Dossiers_Datefaturable` ON `Dossiers` (`Datefaturable`);
CREATE INDEX `WDIDX_Dossiers_CodeDossierCourt` ON `Dossiers` (`CodeDossierCourt`);
CREATE INDEX `WDIDX_Dossiers_GenereSur` ON `Dossiers` (`GenereSur`);
CREATE INDEX `WDIDX_Dossiers_DateTransmission` ON `Dossiers` (`DateTransmission`);

-- Création de la table ElementsPiecesCaisses
CREATE TABLE `ElementsPiecesCaisses` (
    `IDRubriquesPiecesCaisses` BIGINT DEFAULT 0,
    `IDElementsPiecesCaisses` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Montant` NUMERIC(24,6) DEFAULT 0,
    `IDPiecesCaisses` BIGINT DEFAULT 0,
    `CodeRubrique` VARCHAR(25),
    `libelleRubrique` VARCHAR(200)
);
CREATE INDEX `WDIDX_ElementsPiecesCaisses_IDRubriquesPiecesCaisses` ON `ElementsPiecesCaisses` (`IDRubriquesPiecesCaisses`);
CREATE INDEX `WDIDX_ElementsPiecesCaisses_IDPiecesCaisses` ON `ElementsPiecesCaisses` (`IDPiecesCaisses`);
CREATE INDEX `WDIDX_ElementsPiecesCaisses_CodeRubrique` ON `ElementsPiecesCaisses` (`CodeRubrique`);
CREATE INDEX `WDIDX_ElementsPiecesCaisses_libelleRubrique` ON `ElementsPiecesCaisses` (`libelleRubrique`);

-- Création de la table Enlevement
CREATE TABLE `Enlevement` (
    `IDBordereauxDeLivraisons` BIGINT DEFAULT 0,
    `IDEnlevement` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `DateEnlevent` TIMESTAMP,
    `DateRetourConteneur` TIMESTAMP,
    `numerocamion` VARCHAR(50),
    `Observations` VARCHAR(250),
    `IDDetentions` BIGINT UNIQUE,
    `EIR` VARCHAR(50)
);
CREATE INDEX `WDIDX_Enlevement_IDBordereauxDeLivraisons` ON `Enlevement` (`IDBordereauxDeLivraisons`);
CREATE INDEX `WDIDX_Enlevement_DateEnlevent` ON `Enlevement` (`DateEnlevent`);
CREATE INDEX `WDIDX_Enlevement_DateRetourConteneur` ON `Enlevement` (`DateRetourConteneur`);
CREATE INDEX `WDIDX_Enlevement_numerocamion` ON `Enlevement` (`numerocamion`);

-- Création de la table EtapesDossiers
CREATE TABLE `EtapesDossiers` (
    `IDEtapesDossiers` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `libelleEtapesDossiers` VARCHAR(100),
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_EtapesDossiers_libelleEtapesDossiers` ON `EtapesDossiers` (`libelleEtapesDossiers`);

-- Création de la table Factures
CREATE TABLE `Factures` (
    `IDFactures` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Datefacture` DATE,
    `DateEcheance` DATE,
    `MontantHTFacture` NUMERIC(24,6) DEFAULT 0,
    `MontantTVAFacture` NUMERIC(24,6) DEFAULT 0,
    `MontantTTCFacture` NUMERIC(24,6) DEFAULT 0,
    `MontantRegleFacture` NUMERIC(24,6) DEFAULT 0,
    `ReliquatFacture` NUMERIC(24,6) DEFAULT 0,
    `IDAgents` BIGINT DEFAULT 0,
    `IDDossiers` BIGINT DEFAULT 0,
    `NumeroFacture` VARCHAR(50) UNIQUE,
    `RefCotation` VARCHAR(255),
    `CheminDocumentPDF` VARCHAR(255),
    `Validee` TINYINT DEFAULT 0,
    `Envoyee` TINYINT DEFAULT 0,
    `DateHeureEnvoi` TIMESTAMP,
    `Aregler` TINYINT DEFAULT 0,
    `Observations` VARCHAR(252),
    `idagentvalidee` BIGINT DEFAULT 0,
    `datevalidee` DATE,
    `idagentenvoye` BIGINT DEFAULT 0,
    `dateenvoye` DATE
);
CREATE INDEX `WDIDX_Factures_Datefacture` ON `Factures` (`Datefacture`);
CREATE INDEX `WDIDX_Factures_DateEcheance` ON `Factures` (`DateEcheance`);
CREATE INDEX `WDIDX_Factures_IDAgents` ON `Factures` (`IDAgents`);
CREATE INDEX `WDIDX_Factures_IDDossiers` ON `Factures` (`IDDossiers`);

-- Création de la table FacturesFournisseursClients
CREATE TABLE `FacturesFournisseursClients` (
    `IDFacturesFournisseursClients` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Fournisseur` VARCHAR(150),
    `Datefacture` DATE,
    `IDDevises` BIGINT,
    `Montant` NUMERIC(24,6) DEFAULT 0,
    `IDDossiers` BIGINT DEFAULT 0,
    `IDIncoterm` BIGINT DEFAULT 0,
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_FacturesFournisseursClients_Datefacture` ON `FacturesFournisseursClients` (`Datefacture`);
CREATE INDEX `WDIDX_FacturesFournisseursClients_IDDevises` ON `FacturesFournisseursClients` (`IDDevises`);
CREATE INDEX `WDIDX_FacturesFournisseursClients_IDDossiers` ON `FacturesFournisseursClients` (`IDDossiers`);
CREATE INDEX `WDIDX_FacturesFournisseursClients_IDIncoterm` ON `FacturesFournisseursClients` (`IDIncoterm`);

-- Création de la table FacturesRecues
CREATE TABLE `FacturesRecues` (
    `IDFacturesRecues` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDDossiers` BIGINT DEFAULT 0,
    `IDTiers` BIGINT DEFAULT 0,
    `MontantTTC` NUMERIC(24,6) DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0,
    `IDRubriques` BIGINT DEFAULT 0,
    `CodeRubrique` VARCHAR(25),
    `libelleRubrique` VARCHAR(200),
    `DdateHeureSaisi` TIMESTAMP,
    `Observations` VARCHAR(250),
    `NomTiers` VARCHAR(250),
    `NumeroFacture` VARCHAR(150)
);
CREATE INDEX `WDIDX_FacturesRecues_IDDossiers` ON `FacturesRecues` (`IDDossiers`);
CREATE INDEX `WDIDX_FacturesRecues_IDTiers` ON `FacturesRecues` (`IDTiers`);
CREATE INDEX `WDIDX_FacturesRecues_IdAgent` ON `FacturesRecues` (`IdAgent`);
CREATE INDEX `WDIDX_FacturesRecues_IDRubriques` ON `FacturesRecues` (`IDRubriques`);
CREATE INDEX `WDIDX_FacturesRecues_CodeRubrique` ON `FacturesRecues` (`CodeRubrique`);
CREATE INDEX `WDIDX_FacturesRecues_libelleRubrique` ON `FacturesRecues` (`libelleRubrique`);
CREATE INDEX `WDIDX_FacturesRecues_NomTiers` ON `FacturesRecues` (`NomTiers`);
CREATE INDEX `WDIDX_FacturesRecues_NumeroFacture` ON `FacturesRecues` (`NumeroFacture`);

-- Création de la table FicheSynthetiqueDossier
CREATE TABLE `FicheSynthetiqueDossier` (
    `IDFicheSynthetiqueDossier` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `DateOuvertureDossiers` DATE,
    `CodeDossier` VARCHAR(50),
    `NatureDossier` VARCHAR(50),
    `CodeClient` VARCHAR(50),
    `NomClient` VARCHAR(250),
    `adresseClient` VARCHAR(175),
    `NumeroOT` VARCHAR(150),
    `DateOT` DATE,
    `DateHeureReceptionOT` TIMESTAMP,
    `DateArriveePrevue` DATE,
    `LibelleMoyensTransport` VARCHAR(250),
    `DateArriveeNavire` DATE,
    `PROVENANCE` VARCHAR(250),
    `NumeroTitreTransport` VARCHAR(150),
    `NomFournisseur` VARCHAR(150),
    `Observationss` VARCHAR(255),
    `IDDossiers` BIGINT DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0,
    `NatureMarchandise` VARCHAR(250),
    `CodeDossierCourt` VARCHAR(50),
    `PoidsTotal` REAL DEFAULT 0,
    `conteneurs` VARCHAR(255),
    `NBCOLIS` INTEGER DEFAULT 0
);
CREATE INDEX `WDIDX_FicheSynthetiqueDossier_CodeDossier` ON `FicheSynthetiqueDossier` (`CodeDossier`);
CREATE INDEX `WDIDX_FicheSynthetiqueDossier_CodeClient` ON `FicheSynthetiqueDossier` (`CodeClient`);
CREATE INDEX `WDIDX_FicheSynthetiqueDossier_NomClient` ON `FicheSynthetiqueDossier` (`NomClient`);
CREATE INDEX `WDIDX_FicheSynthetiqueDossier_NumeroOT` ON `FicheSynthetiqueDossier` (`NumeroOT`);
CREATE INDEX `WDIDX_FicheSynthetiqueDossier_LibelleMoyensTransport` ON `FicheSynthetiqueDossier` (`LibelleMoyensTransport`);
CREATE INDEX `WDIDX_FicheSynthetiqueDossier_IDDossiers` ON `FicheSynthetiqueDossier` (`IDDossiers`);
CREATE INDEX `WDIDX_FicheSynthetiqueDossier_IdAgent` ON `FicheSynthetiqueDossier` (`IdAgent`);
CREATE INDEX `WDIDX_FicheSynthetiqueDossier_NatureMarchandise` ON `FicheSynthetiqueDossier` (`NatureMarchandise`);
CREATE INDEX `WDIDX_FicheSynthetiqueDossier_CodeDossierCourt` ON `FicheSynthetiqueDossier` (`CodeDossierCourt`);

-- Création de la table Groupage
CREATE TABLE `Groupage` (
    `IDGroupage` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `UnitePoids` VARCHAR(50),
    `classdutarif` VARCHAR(10),
    `NumeroArticleMarchandise` VARCHAR(50),
    `PoidsTaxation` REAL DEFAULT 0,
    `TarifMontant` NUMERIC(24,6) DEFAULT 0,
    `Total` NUMERIC(24,6) DEFAULT 0,
    `NatureEtQuantiteDesMarchandises` VARCHAR(250),
    `idblltalvibooking` BIGINT DEFAULT 0,
    `nbreconteneurs` INTEGER DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_Groupage_idblltalvibooking` ON `Groupage` (`idblltalvibooking`);
CREATE INDEX `WDIDX_Groupage_IdAgent` ON `Groupage` (`IdAgent`);

-- Création de la table Groupes
CREATE TABLE `Groupes` (
    `IDGroupes` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleGroupe` VARCHAR(150),
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_Groupes_LibelleGroupe` ON `Groupes` (`LibelleGroupe`);

-- Création de la table Incoterm
CREATE TABLE `Incoterm` (
    `IDIncoterm` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `CodeIncoterm` VARCHAR(10),
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_Incoterm_CodeIncoterm` ON `Incoterm` (`CodeIncoterm`);

-- Création de la table JOURNAL
CREATE TABLE `JOURNAL` (
    `IDJOURNAL` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `CodeJournal` VARCHAR(50),
    `Datefacture` DATE,
    `NumPiece` INTEGER DEFAULT 0,
    `NumFacture` VARCHAR(50),
    `CodeDossier` VARCHAR(50),
    `NumCompteSAARI` VARCHAR(50),
    `NumCompteTiers` VARCHAR(50),
    `Libelle` VARCHAR(250),
    `DateEcheance` DATE,
    `Debit` NUMERIC(24,6) DEFAULT 0,
    `Credit` NUMERIC(24,6) DEFAULT 0,
    `DateDebut` DATE,
    `DateFin` DATE,
    `IDCLIENTS` BIGINT DEFAULT 0,
    `CodeDossierCourt` VARCHAR(50)
);
CREATE INDEX `WDIDX_JOURNAL_CodeJournal` ON `JOURNAL` (`CodeJournal`);
CREATE INDEX `WDIDX_JOURNAL_Datefacture` ON `JOURNAL` (`Datefacture`);
CREATE INDEX `WDIDX_JOURNAL_NumPiece` ON `JOURNAL` (`NumPiece`);
CREATE INDEX `WDIDX_JOURNAL_NumFacture` ON `JOURNAL` (`NumFacture`);
CREATE INDEX `WDIDX_JOURNAL_CodeDossier` ON `JOURNAL` (`CodeDossier`);
CREATE INDEX `WDIDX_JOURNAL_NumCompteSAARI` ON `JOURNAL` (`NumCompteSAARI`);
CREATE INDEX `WDIDX_JOURNAL_NumCompteTiers` ON `JOURNAL` (`NumCompteTiers`);
CREATE INDEX `WDIDX_JOURNAL_Libelle` ON `JOURNAL` (`Libelle`);
CREATE INDEX `WDIDX_JOURNAL_DateEcheance` ON `JOURNAL` (`DateEcheance`);
CREATE INDEX `WDIDX_JOURNAL_DateDebut` ON `JOURNAL` (`DateDebut`);
CREATE INDEX `WDIDX_JOURNAL_DateFin` ON `JOURNAL` (`DateFin`);
CREATE INDEX `WDIDX_JOURNAL_IDCLIENTS` ON `JOURNAL` (`IDCLIENTS`);
CREATE INDEX `WDIDX_JOURNAL_CodeDossierCourt` ON `JOURNAL` (`CodeDossierCourt`);

-- Création de la table LiaisonAgentsGroupes
CREATE TABLE `LiaisonAgentsGroupes` (
    `IDLiaisonAgentsGroupes` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IdAgent` BIGINT DEFAULT 0,
    `IDGroupes` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_LiaisonAgentsGroupes_IdAgent` ON `LiaisonAgentsGroupes` (`IdAgent`);
CREATE INDEX `WDIDX_LiaisonAgentsGroupes_IDGroupes` ON `LiaisonAgentsGroupes` (`IDGroupes`);

-- Création de la table LiaisonCotationsRubriques
CREATE TABLE `LiaisonCotationsRubriques` (
    `IDLiaisonCotationsRubriques` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDRubriques` BIGINT DEFAULT 0,
    `IDCotation` BIGINT DEFAULT 0,
    `MontantHTCotation` NUMERIC(24,6) DEFAULT 0,
    `CodeRubrique` VARCHAR(25),
    `libelleRubrique` VARCHAR(200),
    `Complement` VARCHAR(30),
    `NumCompteSAARI` VARCHAR(50)
);
CREATE INDEX `WDIDX_LiaisonCotationsRubriques_IDRubriques` ON `LiaisonCotationsRubriques` (`IDRubriques`);
CREATE INDEX `WDIDX_LiaisonCotationsRubriques_IDCotation` ON `LiaisonCotationsRubriques` (`IDCotation`);
CREATE INDEX `WDIDX_LiaisonCotationsRubriques_CodeRubrique` ON `LiaisonCotationsRubriques` (`CodeRubrique`);
CREATE INDEX `WDIDX_LiaisonCotationsRubriques_libelleRubrique` ON `LiaisonCotationsRubriques` (`libelleRubrique`);
CREATE INDEX `WDIDX_LiaisonCotationsRubriques_NumCompteSAARI` ON `LiaisonCotationsRubriques` (`NumCompteSAARI`);

-- Création de la table LiaisonDossiersDeclarants
CREATE TABLE `LiaisonDossiersDeclarants` (
    `IDLiaisonDossiersDeclarants` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDDossiers` BIGINT DEFAULT 0,
    `idDeclarants` BIGINT DEFAULT 0,
    `DateAffectation` DATE
);
CREATE INDEX `WDIDX_LiaisonDossiersDeclarants_IDDossiers` ON `LiaisonDossiersDeclarants` (`IDDossiers`);
CREATE INDEX `WDIDX_LiaisonDossiersDeclarants_idDeclarants` ON `LiaisonDossiersDeclarants` (`idDeclarants`);
CREATE INDEX `WDIDX_LiaisonDossiersDeclarants_DateAffectation` ON `LiaisonDossiersDeclarants` (`DateAffectation`);

-- Création de la table LiaisonFacturesRubriques
CREATE TABLE `LiaisonFacturesRubriques` (
    `IDLiaisonFacturesRubriques` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDFactures` BIGINT DEFAULT 0,
    `IDRubriques` BIGINT DEFAULT 0,
    `MontantHTFactures` NUMERIC(24,6) DEFAULT 0,
    `CodeRubrique` VARCHAR(25),
    `libelleRubrique` VARCHAR(200),
    `Complement` VARCHAR(30),
    `NumCompteSAAI` VARCHAR(50)
);
CREATE INDEX `WDIDX_LiaisonFacturesRubriques_IDFactures` ON `LiaisonFacturesRubriques` (`IDFactures`);
CREATE INDEX `WDIDX_LiaisonFacturesRubriques_IDRubriques` ON `LiaisonFacturesRubriques` (`IDRubriques`);
CREATE INDEX `WDIDX_LiaisonFacturesRubriques_CodeRubrique` ON `LiaisonFacturesRubriques` (`CodeRubrique`);
CREATE INDEX `WDIDX_LiaisonFacturesRubriques_libelleRubrique` ON `LiaisonFacturesRubriques` (`libelleRubrique`);
CREATE INDEX `WDIDX_LiaisonFacturesRubriques_NumCompteSAAI` ON `LiaisonFacturesRubriques` (`NumCompteSAAI`);

-- Création de la table LiaisonLTAProduits
CREATE TABLE `LiaisonLTAProduits` (
    `IDLiaisonLTAProduits` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `idProduit` BIGINT DEFAULT 0,
    `idlta` BIGINT DEFAULT 0,
    `Qtte` REAL DEFAULT 0,
    `unitequantite` VARCHAR(50),
    `VolumeMarchandises` REAL DEFAULT 0,
    `UniteVolume` VARCHAR(50),
    `Valeur` NUMERIC(24,6) DEFAULT 0,
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_LiaisonLTAProduits_idProduit` ON `LiaisonLTAProduits` (`idProduit`);
CREATE INDEX `WDIDX_LiaisonLTAProduits_idlta` ON `LiaisonLTAProduits` (`idlta`);

-- Création de la table LiaisonLVIProduits
CREATE TABLE `LiaisonLVIProduits` (
    `IDLiaisonLVIProduits` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `idlvi` BIGINT UNIQUE,
    `idProduit` BIGINT DEFAULT 0,
    `Qtte` REAL DEFAULT 0,
    `unitequantite` VARCHAR(50),
    `VolumeMarchandises` REAL DEFAULT 0,
    `UniteVolume` VARCHAR(50),
    `Valeur` NUMERIC(24,6) DEFAULT 0,
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_LiaisonLVIProduits_idProduit` ON `LiaisonLVIProduits` (`idProduit`);

-- Création de la table LiaisonOTDocumentsARemettre
CREATE TABLE `LiaisonOTDocumentsARemettre` (
    `IDARemettre` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDOrdreTransit` BIGINT DEFAULT 0,
    `idtypesDocumentot` BIGINT DEFAULT 0,
    `Observations` VARCHAR(250),
    `Recu` TINYINT DEFAULT 0,
    `DateReceptionDocument` TIMESTAMP,
    `Aremettre` TINYINT DEFAULT 0,
    `LibelleDocument` VARCHAR(250)
);
CREATE INDEX `WDIDX_LiaisonOTDocumentsARemettre_IDOrdreTransit` ON `LiaisonOTDocumentsARemettre` (`IDOrdreTransit`);
CREATE INDEX `WDIDX_LiaisonOTDocumentsARemettre_idtypesDocumentot` ON `LiaisonOTDocumentsARemettre` (`idtypesDocumentot`);
CREATE INDEX `WDIDX_LiaisonOTDocumentsARemettre_DateReceptionDocument` ON `LiaisonOTDocumentsARemettre` (`DateReceptionDocument`);
CREATE INDEX `WDIDX_LiaisonOTDocumentsARemettre_LibelleDocument` ON `LiaisonOTDocumentsARemettre` (`LibelleDocument`);

-- Création de la table LiaisonRegimeOT
CREATE TABLE `LiaisonRegimeOT` (
    `IDOrdresTransit` BIGINT DEFAULT 0,
    `IDLiaisonRegimeOT` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDRegimeOT` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_LiaisonRegimeOT_IDOrdresTransit` ON `LiaisonRegimeOT` (`IDOrdresTransit`);
CREATE INDEX `WDIDX_LiaisonRegimeOT_IDRegimeOT` ON `LiaisonRegimeOT` (`IDRegimeOT`);

-- Création de la table LiaisonRubriquesFacturesRecues
CREATE TABLE `LiaisonRubriquesFacturesRecues` (
    `IDLiaisonRubriquesFacturesRecues` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDRubriques` BIGINT DEFAULT 0,
    `IDFacturesRecues` BIGINT DEFAULT 0,
    `MontantRubrique` NUMERIC(24,6) DEFAULT 0
);
CREATE INDEX `WDIDX_LiaisonRubriquesFacturesRecues_IDRubriques` ON `LiaisonRubriquesFacturesRecues` (`IDRubriques`);
CREATE INDEX `WDIDX_LiaisonRubriquesFacturesRecues_IDFacturesRecues` ON `LiaisonRubriquesFacturesRecues` (`IDFacturesRecues`);

-- Création de la table LiaisonTiersDomainesActivites
CREATE TABLE `LiaisonTiersDomainesActivites` (
    `IDLiaisonTiersDomainesActivites` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDTiers` BIGINT DEFAULT 0,
    `IDDomaineActivite` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_LiaisonTiersDomainesActivites_IDTiers` ON `LiaisonTiersDomainesActivites` (`IDTiers`);
CREATE INDEX `WDIDX_LiaisonTiersDomainesActivites_IDDomaineActivite` ON `LiaisonTiersDomainesActivites` (`IDDomaineActivite`);

-- Création de la table Lieux
CREATE TABLE `Lieux` (
    `IDLieux` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NomLieu` VARCHAR(250),
    `Observations` VARCHAR(250),
    `TypeLieu` VARCHAR(150),
    `IDPays` BIGINT DEFAULT 0,
    `codePays3` VARCHAR(3)
);
CREATE INDEX `WDIDX_Lieux_NomLieu` ON `Lieux` (`NomLieu`);
CREATE INDEX `WDIDX_Lieux_IDPays` ON `Lieux` (`IDPays`);
CREATE INDEX `WDIDX_Lieux_codePays3` ON `Lieux` (`codePays3`);

-- Création de la table LiquidationsArticles
CREATE TABLE `LiquidationsArticles` (
    `IDTaux` BIGINT DEFAULT 0,
    `IDLiquidationsArticles` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDTaxes` BIGINT DEFAULT 0,
    `IDArticles` BIGINT DEFAULT 0,
    `CodeTaxe` VARCHAR(10),
    `MontantLiquide` NUMERIC(24,6) DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0,
    `LibelleTaxe` VARCHAR(150),
    `LibelleTaxeComplet` VARCHAR(250)
);
CREATE INDEX `WDIDX_LiquidationsArticles_IDTaux` ON `LiquidationsArticles` (`IDTaux`);
CREATE INDEX `WDIDX_LiquidationsArticles_IDTaxes` ON `LiquidationsArticles` (`IDTaxes`);
CREATE INDEX `WDIDX_LiquidationsArticles_IDArticles` ON `LiquidationsArticles` (`IDArticles`);
CREATE INDEX `WDIDX_LiquidationsArticles_CodeTaxe` ON `LiquidationsArticles` (`CodeTaxe`);
CREATE INDEX `WDIDX_LiquidationsArticles_IdAgent` ON `LiquidationsArticles` (`IdAgent`);
CREATE INDEX `WDIDX_LiquidationsArticles_LibelleTaxe` ON `LiquidationsArticles` (`LibelleTaxe`);
CREATE INDEX `WDIDX_LiquidationsArticles_LibelleTaxeComplet` ON `LiquidationsArticles` (`LibelleTaxeComplet`);

-- Création de la table Livraisons
CREATE TABLE `Livraisons` (
    `IDLivraisons` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `DateLivraison` DATE,
    `IDTiers` BIGINT DEFAULT 0,
    `Livre` TINYINT DEFAULT 0,
    `ObservationsLivraison` VARCHAR(250),
    `IDDossiers` BIGINT DEFAULT 0,
    `NumPregate` VARCHAR(50),
    `CodeLivraison` VARCHAR(50)
);
CREATE INDEX `WDIDX_Livraisons_DateLivraison` ON `Livraisons` (`DateLivraison`);
CREATE INDEX `WDIDX_Livraisons_IDTiers` ON `Livraisons` (`IDTiers`);
CREATE INDEX `WDIDX_Livraisons_Livre` ON `Livraisons` (`Livre`);
CREATE INDEX `WDIDX_Livraisons_IDDossiers` ON `Livraisons` (`IDDossiers`);
CREATE INDEX `WDIDX_Livraisons_NumPregate` ON `Livraisons` (`NumPregate`);
CREATE INDEX `WDIDX_Livraisons_CodeLivraison` ON `Livraisons` (`CodeLivraison`);

-- Création de la table MiseEnLivraison
CREATE TABLE `MiseEnLivraison` (
    `IDMiseEnLivraison` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDDossiers` BIGINT DEFAULT 0,
    `DateMiseEnLivraison` DATE,
    `DateRemiseContremaitre` DATE,
    `Idcontremaitre` BIGINT DEFAULT 0,
    `observationsML` VARCHAR(250),
    `Pregate` VARCHAR(50)
);
CREATE INDEX `WDIDX_MiseEnLivraison_IDDossiers` ON `MiseEnLivraison` (`IDDossiers`);
CREATE INDEX `WDIDX_MiseEnLivraison_DateMiseEnLivraison` ON `MiseEnLivraison` (`DateMiseEnLivraison`);
CREATE INDEX `WDIDX_MiseEnLivraison_DateRemiseContremaitre` ON `MiseEnLivraison` (`DateRemiseContremaitre`);
CREATE INDEX `WDIDX_MiseEnLivraison_Idcontremaitre` ON `MiseEnLivraison` (`Idcontremaitre`);
CREATE INDEX `WDIDX_MiseEnLivraison_Pregate` ON `MiseEnLivraison` (`Pregate`);

-- Création de la table ModesReglements
CREATE TABLE `ModesReglements` (
    `IDModesReglements` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(100)
);
CREATE INDEX `WDIDX_ModesReglements_libelle` ON `ModesReglements` (`libelle`);

-- Création de la table MouvementsComptesClients
CREATE TABLE `MouvementsComptesClients` (
    `IDComptesClients` BIGINT DEFAULT 0,
    `IDMouvementsComptesClients` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(100),
    `DateMouvement` DATE,
    `MontantMouvement` NUMERIC(24,6) DEFAULT 0,
    `Sens` VARCHAR(50),
    `Observations` VARCHAR(250),
    `IdAgent` BIGINT DEFAULT 0,
    `Etat` VARCHAR(2),
    `IdModeReglement` BIGINT DEFAULT 0,
    `IDCLEFET` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_MouvementsComptesClients_IDComptesClients` ON `MouvementsComptesClients` (`IDComptesClients`);
CREATE INDEX `WDIDX_MouvementsComptesClients_libelle` ON `MouvementsComptesClients` (`libelle`);
CREATE INDEX `WDIDX_MouvementsComptesClients_DateMouvement` ON `MouvementsComptesClients` (`DateMouvement`);
CREATE INDEX `WDIDX_MouvementsComptesClients_IdAgent` ON `MouvementsComptesClients` (`IdAgent`);
CREATE INDEX `WDIDX_MouvementsComptesClients_Etat` ON `MouvementsComptesClients` (`Etat`);
CREATE INDEX `WDIDX_MouvementsComptesClients_IdModeReglement` ON `MouvementsComptesClients` (`IdModeReglement`);
CREATE INDEX `WDIDX_MouvementsComptesClients_IDCLEFET` ON `MouvementsComptesClients` (`IDCLEFET`);

-- Création de la table MoyensTransport
CREATE TABLE `MoyensTransport` (
    `IDMoyensTransport` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleMoyensTransport` VARCHAR(250),
    `idtypeMoyensTransport` BIGINT DEFAULT 0,
    `Observations` VARCHAR(250),
    `IDTiers` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_MoyensTransport_LibelleMoyensTransport` ON `MoyensTransport` (`LibelleMoyensTransport`);
CREATE INDEX `WDIDX_MoyensTransport_idtypeMoyensTransport` ON `MoyensTransport` (`idtypeMoyensTransport`);
CREATE INDEX `WDIDX_MoyensTransport_IDTiers` ON `MoyensTransport` (`IDTiers`);

-- Création de la table NotesDeDetails
CREATE TABLE `NotesDeDetails` (
    `IDNotesDeDetails` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `MontantCAFTotalCFA` NUMERIC(24,6) DEFAULT 0,
    `IDDossiers` BIGINT DEFAULT 0,
    `ORBUS` VARCHAR(50),
    `NINEA` VARCHAR(50),
    `REPERTOIRE` VARCHAR(50) UNIQUE,
    `IDDeclarations` BIGINT DEFAULT 0,
    `MontantFOBTotalCFA` NUMERIC(24,6) DEFAULT 0,
    `MontantFretTotalCFA` NUMERIC(24,6) DEFAULT 0,
    `MontantAssuranceTotalCFA` NUMERIC(24,6) DEFAULT 0,
    `CodeRegimeDeclaration` VARCHAR(5),
    `CodeProvenance` VARCHAR(5),
    `MontantLiquidation` NUMERIC(24,6) DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0,
    `MontantFOBTotalDevise` NUMERIC(24,6) DEFAULT 0,
    `MontantFretTotalDevise` NUMERIC(24,6) DEFAULT 0,
    `MontantAssurancesTotalDevise` NUMERIC(24,6) DEFAULT 0,
    `Valide` TINYINT DEFAULT 0,
    `DPI` VARCHAR(255),
    `PoidsBrutTotal` DOUBLE DEFAULT 0,
    `PoidsNetTotal` DOUBLE DEFAULT 0
);
CREATE INDEX `WDIDX_NotesDeDetails_IDDossiers` ON `NotesDeDetails` (`IDDossiers`);
CREATE INDEX `WDIDX_NotesDeDetails_ORBUS` ON `NotesDeDetails` (`ORBUS`);
CREATE INDEX `WDIDX_NotesDeDetails_NINEA` ON `NotesDeDetails` (`NINEA`);
CREATE INDEX `WDIDX_NotesDeDetails_IDDeclarations` ON `NotesDeDetails` (`IDDeclarations`);
CREATE INDEX `WDIDX_NotesDeDetails_CodeRegimeDeclaration` ON `NotesDeDetails` (`CodeRegimeDeclaration`);
CREATE INDEX `WDIDX_NotesDeDetails_CodeProvenance` ON `NotesDeDetails` (`CodeProvenance`);
CREATE INDEX `WDIDX_NotesDeDetails_IdAgent` ON `NotesDeDetails` (`IdAgent`);

-- Création de la table Operations
CREATE TABLE `Operations` (
    `IDOperations` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(100),
    `Observations` VARCHAR(250),
    `IDTiers` BIGINT DEFAULT 0,
    `IDDossiers1` BIGINT DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0,
    `DateOperation` TIMESTAMP,
    `idtypeOperation` BIGINT DEFAULT 0,
    `IdAgentRealise` BIGINT DEFAULT 0,
    `DureeOperation` NUMERIC(19,0),
    `AvanceRetard` NUMERIC(19,0)
);
CREATE INDEX `WDIDX_Operations_libelle` ON `Operations` (`libelle`);
CREATE INDEX `WDIDX_Operations_IDTiers` ON `Operations` (`IDTiers`);
CREATE INDEX `WDIDX_Operations_IDDossiers1` ON `Operations` (`IDDossiers1`);
CREATE INDEX `WDIDX_Operations_IdAgent` ON `Operations` (`IdAgent`);
CREATE INDEX `WDIDX_Operations_DateOperation` ON `Operations` (`DateOperation`);
CREATE INDEX `WDIDX_Operations_idtypeOperation` ON `Operations` (`idtypeOperation`);
CREATE INDEX `WDIDX_Operations_IdAgentRealise` ON `Operations` (`IdAgentRealise`);

-- Création de la table OrdresDeTransport
CREATE TABLE `OrdresDeTransport` (
    `IDOrdresDeTransport` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDDossiers` BIGINT DEFAULT 0,
    `TransporteuretAdresse` VARCHAR(250) DEFAULT '0',
    `DateTransmissionAuTransporteur` DATE,
    `Contremaitre` VARCHAR(250),
    `IdAgent` BIGINT DEFAULT 0,
    `Numeserie` VARCHAR(50) UNIQUE,
    `CodeOrdreTransport` VARCHAR(50),
    `DateOrdreTransport` DATE,
    `Contenu` VARCHAR(255),
    `Introduction` VARCHAR(250),
    `Pregate` VARCHAR(50),
    `BL` VARCHAR(50),
    `NumDeclaration` VARCHAR(150),
    `DateDeclaration` DATE,
    `AdresseDeLivraison` VARCHAR(150),
    `CodeOrdreTransit` VARCHAR(50),
    `CodeDossier` VARCHAR(50),
    `forùulepolitesse` VARCHAR(250),
    `sectionlivraison` VARCHAR(250),
    `sectioncontremaitre` VARCHAR(250)
);
CREATE INDEX `WDIDX_OrdresDeTransport_IDDossiers` ON `OrdresDeTransport` (`IDDossiers`);
CREATE INDEX `WDIDX_OrdresDeTransport_TransporteuretAdresse` ON `OrdresDeTransport` (`TransporteuretAdresse`);
CREATE INDEX `WDIDX_OrdresDeTransport_Contremaitre` ON `OrdresDeTransport` (`Contremaitre`);
CREATE INDEX `WDIDX_OrdresDeTransport_IdAgent` ON `OrdresDeTransport` (`IdAgent`);
CREATE INDEX `WDIDX_OrdresDeTransport_CodeOrdreTransport` ON `OrdresDeTransport` (`CodeOrdreTransport`);
CREATE INDEX `WDIDX_OrdresDeTransport_DateOrdreTransport` ON `OrdresDeTransport` (`DateOrdreTransport`);
CREATE INDEX `WDIDX_OrdresDeTransport_Pregate` ON `OrdresDeTransport` (`Pregate`);
CREATE INDEX `WDIDX_OrdresDeTransport_BL` ON `OrdresDeTransport` (`BL`);
CREATE INDEX `WDIDX_OrdresDeTransport_NumDeclaration` ON `OrdresDeTransport` (`NumDeclaration`);
CREATE INDEX `WDIDX_OrdresDeTransport_DateDeclaration` ON `OrdresDeTransport` (`DateDeclaration`);
CREATE INDEX `WDIDX_OrdresDeTransport_AdresseDeLivraison` ON `OrdresDeTransport` (`AdresseDeLivraison`);
CREATE INDEX `WDIDX_OrdresDeTransport_CodeOrdreTransit` ON `OrdresDeTransport` (`CodeOrdreTransit`);
CREATE INDEX `WDIDX_OrdresDeTransport_CodeDossier` ON `OrdresDeTransport` (`CodeDossier`);

-- Création de la table OrdresTransit
CREATE TABLE `OrdresTransit` (
    `IDOrdresTransit` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NumeroOT` VARCHAR(150),
    `DateOT` DATE,
    `DateReceptionOT` TIMESTAMP,
    `IdAgent` BIGINT DEFAULT 0,
    `IDDossiers` BIGINT UNIQUE DEFAULT 0,
    `NumeroSerie` VARCHAR(150),
    `Idincoterms` BIGINT DEFAULT 0,
    `BSCExiste` TINYINT DEFAULT 0,
    `AssuranceExiste` TINYINT DEFAULT 0,
    `Observations` VARCHAR(250),
    `DateExpedition` DATE,
    `AdresseDeLivraison` VARCHAR(150),
    `PROVENANCE` VARCHAR(250) DEFAULT '0',
    `NatureProduits` VARCHAR(250),
    `Nbredecolis` VARCHAR(250) DEFAULT '0,00',
    `PoidsNet` VARCHAR(200) DEFAULT '0,00',
    `ValeurMarchandise` VARCHAR(250)
);
CREATE INDEX `WDIDX_OrdresTransit_NumeroOT` ON `OrdresTransit` (`NumeroOT`);
CREATE INDEX `WDIDX_OrdresTransit_IdAgent` ON `OrdresTransit` (`IdAgent`);
CREATE INDEX `WDIDX_OrdresTransit_NumeroSerie` ON `OrdresTransit` (`NumeroSerie`);
CREATE INDEX `WDIDX_OrdresTransit_Idincoterms` ON `OrdresTransit` (`Idincoterms`);

-- Création de la table Pays
CREATE TABLE `Pays` (
    `IDPays` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NomPays` VARCHAR(150),
    `codePays3` VARCHAR(3) UNIQUE,
    `CodePays2` VARCHAR(2) UNIQUE,
    `CodeNumerique` INTEGER UNIQUE DEFAULT 0,
    `NomPaysEng` VARCHAR(150)
);
CREATE INDEX `WDIDX_Pays_NomPays` ON `Pays` (`NomPays`);
CREATE INDEX `WDIDX_Pays_NomPaysEng` ON `Pays` (`NomPaysEng`);

-- Création de la table PiecesCaisses
CREATE TABLE `PiecesCaisses` (
    `IDPiecesCaisses` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NumeroPieceCaisse` VARCHAR(50) UNIQUE,
    `IDDossiers` BIGINT DEFAULT 0,
    `MontantTotal` NUMERIC(24,6) DEFAULT 0,
    `Observations` VARCHAR(250),
    `idagentdemandeur` BIGINT DEFAULT 0,
    `DateheurePieceCaisse` TIMESTAMP,
    `idagentvalide` BIGINT DEFAULT 0,
    `DateHeureValidation` TIMESTAMP,
    `Valide` TINYINT DEFAULT 0,
    `Paye` TINYINT DEFAULT 0,
    `DateHeureSaisiePaye` TIMESTAMP,
    `Motif` VARCHAR(150),
    `valide2` TINYINT DEFAULT 0,
    `idagentvalide2` BIGINT DEFAULT 0,
    `IDAgentpaye` BIGINT DEFAULT 0,
    `observationsPC` VARCHAR(250)
);
CREATE INDEX `WDIDX_PiecesCaisses_IDDossiers` ON `PiecesCaisses` (`IDDossiers`);
CREATE INDEX `WDIDX_PiecesCaisses_idagentdemandeur` ON `PiecesCaisses` (`idagentdemandeur`);
CREATE INDEX `WDIDX_PiecesCaisses_Valide` ON `PiecesCaisses` (`Valide`);
CREATE INDEX `WDIDX_PiecesCaisses_Paye` ON `PiecesCaisses` (`Paye`);
CREATE INDEX `WDIDX_PiecesCaisses_valide2` ON `PiecesCaisses` (`valide2`);
CREATE INDEX `WDIDX_PiecesCaisses_idagentvalide2` ON `PiecesCaisses` (`idagentvalide2`);
CREATE INDEX `WDIDX_PiecesCaisses_IDAgentpaye` ON `PiecesCaisses` (`IDAgentpaye`);

-- Création de la table Produits
CREATE TABLE `Produits` (
    `IDProduits` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Libelle` VARCHAR(250),
    `NTS` VARCHAR(15) UNIQUE,
    `IDAgents` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_Produits_Libelle` ON `Produits` (`Libelle`);
CREATE INDEX `WDIDX_Produits_IDAgents` ON `Produits` (`IDAgents`);

-- Création de la table RegimeDeclaration
CREATE TABLE `RegimeDeclaration` (
    `IDRegimeDeclaration` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleRegimeDeclaration` VARCHAR(250),
    `Observations` VARCHAR(250),
    `CodeRegimeDeclaration` VARCHAR(50) UNIQUE
);
CREATE INDEX `WDIDX_RegimeDeclaration_LibelleRegimeDeclaration` ON `RegimeDeclaration` (`LibelleRegimeDeclaration`);

-- Création de la table RegimeOT
CREATE TABLE `RegimeOT` (
    `IDRegimeOT` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleRegimeOT` VARCHAR(250),
    `Observations` VARCHAR(250),
    `CodeRegimeOT` VARCHAR(50) UNIQUE
);
CREATE INDEX `WDIDX_RegimeOT_LibelleRegimeOT` ON `RegimeOT` (`LibelleRegimeOT`);

-- Création de la table Reglements
CREATE TABLE `Reglements` (
    `IDReglements` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDFactures` BIGINT DEFAULT 0,
    `Datereglement` DATE,
    `MontantReglement` NUMERIC(24,6) DEFAULT 0,
    `IdModeReglement` BIGINT DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0,
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_Reglements_IDFactures` ON `Reglements` (`IDFactures`);
CREATE INDEX `WDIDX_Reglements_Datereglement` ON `Reglements` (`Datereglement`);
CREATE INDEX `WDIDX_Reglements_IdModeReglement` ON `Reglements` (`IdModeReglement`);
CREATE INDEX `WDIDX_Reglements_IdAgent` ON `Reglements` (`IdAgent`);

-- Création de la table Relances
CREATE TABLE `Relances` (
    `IDRelances` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NumeroRelance` INTEGER DEFAULT 0,
    `ContenuRelance` VARCHAR(5000),
    `IDCLIENTS` BIGINT DEFAULT 0,
    `DateRelance` DATE,
    `Envoyee` TINYINT DEFAULT 0,
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_Relances_IDCLIENTS` ON `Relances` (`IDCLIENTS`);

-- Création de la table Rubriques
CREATE TABLE `Rubriques` (
    `IDRubriques` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `CodeRubrique` VARCHAR(25) UNIQUE,
    `libelleRubrique` VARCHAR(200),
    `AFacturer` TINYINT DEFAULT 0,
    `NumeroCompte` VARCHAR(10),
    `Observations` VARCHAR(30)
);
CREATE INDEX `WDIDX_Rubriques_libelleRubrique` ON `Rubriques` (`libelleRubrique`);

-- Création de la table RubriquesDesCommissions
CREATE TABLE `RubriquesDesCommissions` (
    `IDRubriquesDesCommissions` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `IDCLIENTS` BIGINT DEFAULT 0,
    `IDRubriques` BIGINT DEFAULT 0,
    `CodeRubrique` VARCHAR(25)
);
CREATE INDEX `WDIDX_RubriquesDesCommissions_IDCLIENTS` ON `RubriquesDesCommissions` (`IDCLIENTS`);
CREATE INDEX `WDIDX_RubriquesDesCommissions_IDRubriques` ON `RubriquesDesCommissions` (`IDRubriques`);
CREATE INDEX `WDIDX_RubriquesDesCommissions_CodeRubrique` ON `RubriquesDesCommissions` (`CodeRubrique`);

-- Création de la table SauvegardesBDDocs
CREATE TABLE `SauvegardesBDDocs` (
    `IDSauvegardesBDDocs` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `CheminDossier` VARCHAR(255),
    `DateSauvegarde` DATE
);

-- Création de la table Statuts
CREATE TABLE `Statuts` (
    `IDStatuts` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(100)
);
CREATE INDEX `WDIDX_Statuts_libelle` ON `Statuts` (`libelle`);

-- Création de la table structur
CREATE TABLE `structur` (
    `IDSociete` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NomSociete` VARCHAR(100),
    `adrSociete` VARCHAR(100),
    `telSociete` VARCHAR(15),
    `celSociete` VARCHAR(15),
    `Emailstructur` VARCHAR(75),
    `logoSociete` LONGBLOB,
    `cheminlogo` VARCHAR(255),
    `SigleNomCourt` VARCHAR(150),
    `FormeJuridique` VARCHAR(150),
    `Capital` VARCHAR(100),
    `ActivitesPrincipales` VARCHAR(150),
    `CNumeroCompteBancaire` VARCHAR(150),
    `NINEASociete` VARCHAR(50) UNIQUE,
    `RegistreCommerce` VARCHAR(50),
    `NumeroOrbus` VARCHAR(50) UNIQUE,
    `cachetfacture` LONGBLOB,
    `cachetlivraison` LONGBLOB,
    `autrecachet` LONGBLOB
);
CREATE INDEX `WDIDX_structur_NomSociete` ON `structur` (`NomSociete`);

-- Création de la table Tarifs
CREATE TABLE `Tarifs` (
    `IDTaux` BIGINT DEFAULT 0,
    `IDTarifs` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NTS` VARCHAR(15),
    `CodeTaux` VARCHAR(10),
    `CodeTaxe` VARCHAR(10),
    `IdAgent` BIGINT DEFAULT 0,
    `IDTaxes` BIGINT DEFAULT 0,
    `IDProduits` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_Tarifs_IDTaux` ON `Tarifs` (`IDTaux`);
CREATE INDEX `WDIDX_Tarifs_NTS` ON `Tarifs` (`NTS`);
CREATE INDEX `WDIDX_Tarifs_CodeTaux` ON `Tarifs` (`CodeTaux`);
CREATE INDEX `WDIDX_Tarifs_CodeTaxe` ON `Tarifs` (`CodeTaxe`);
CREATE INDEX `WDIDX_Tarifs_IdAgent` ON `Tarifs` (`IdAgent`);
CREATE INDEX `WDIDX_Tarifs_IDTaxes` ON `Tarifs` (`IDTaxes`);
CREATE INDEX `WDIDX_Tarifs_IDProduits` ON `Tarifs` (`IDProduits`);

-- Création de la table Taux
CREATE TABLE `Taux` (
    `IDTaux` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `CodeTaux` VARCHAR(10) UNIQUE,
    `Taux` DOUBLE DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0
);
CREATE INDEX `WDIDX_Taux_IdAgent` ON `Taux` (`IdAgent`);

-- Création de la table Taxes
CREATE TABLE `Taxes` (
    `IDTaxes` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleTaxe` VARCHAR(150) UNIQUE,
    `CodeTaxe` VARCHAR(10) UNIQUE,
    `LibelleTaxeComplet` VARCHAR(250),
    `IdAgent` BIGINT DEFAULT 0,
    `Niveau` INTEGER DEFAULT 0,
    `Base` VARCHAR(5)
);
CREATE INDEX `WDIDX_Taxes_LibelleTaxeComplet` ON `Taxes` (`LibelleTaxeComplet`);
CREATE INDEX `WDIDX_Taxes_IdAgent` ON `Taxes` (`IdAgent`);

-- Création de la table TECTAXESTAUX
CREATE TABLE `TECTAXESTAUX` (
    `IDTECTAXESTAUX` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NTS` VARCHAR(15),
    `LibelleProduit` VARCHAR(250),
    `IDTaxes` BIGINT DEFAULT 0,
    `Taux` DOUBLE DEFAULT 0,
    `CodeTaxe` VARCHAR(10),
    `LibelleTaxe` VARCHAR(150),
    `LibelleTaxeComplet` VARCHAR(250),
    `IDTauxTaxes` BIGINT DEFAULT 0,
    `CodeTauxTaxes` VARCHAR(10)
);
CREATE INDEX `WDIDX_TECTAXESTAUX_NTS` ON `TECTAXESTAUX` (`NTS`);
CREATE INDEX `WDIDX_TECTAXESTAUX_LibelleProduit` ON `TECTAXESTAUX` (`LibelleProduit`);
CREATE INDEX `WDIDX_TECTAXESTAUX_IDTaxes` ON `TECTAXESTAUX` (`IDTaxes`);
CREATE INDEX `WDIDX_TECTAXESTAUX_CodeTaxe` ON `TECTAXESTAUX` (`CodeTaxe`);
CREATE INDEX `WDIDX_TECTAXESTAUX_LibelleTaxe` ON `TECTAXESTAUX` (`LibelleTaxe`);
CREATE INDEX `WDIDX_TECTAXESTAUX_LibelleTaxeComplet` ON `TECTAXESTAUX` (`LibelleTaxeComplet`);
CREATE INDEX `WDIDX_TECTAXESTAUX_IDTauxTaxes` ON `TECTAXESTAUX` (`IDTauxTaxes`);
CREATE INDEX `WDIDX_TECTAXESTAUX_CodeTauxTaxes` ON `TECTAXESTAUX` (`CodeTauxTaxes`);

-- Création de la table Tiers
CREATE TABLE `Tiers` (
    `IDTiers` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `libtier` VARCHAR(75),
    `Observations` VARCHAR(250),
    `adresseTiers` VARCHAR(75),
    `TelTiers` VARCHAR(25),
    `CelTiers` VARCHAR(25),
    `EmailTiers` VARCHAR(250),
    `NINEATiers` VARCHAR(50),
    `SaisiLe` DATE,
    `IdAgentSaisi` BIGINT DEFAULT 0,
    `IDStatuts` BIGINT DEFAULT 0,
    `Modifiele` DATE,
    `idagentmodification` BIGINT,
    `SiteWeb` VARCHAR(50)
);
CREATE INDEX `WDIDX_Tiers_libtier` ON `Tiers` (`libtier`);
CREATE INDEX `WDIDX_Tiers_NINEATiers` ON `Tiers` (`NINEATiers`);
CREATE INDEX `WDIDX_Tiers_IdAgentSaisi` ON `Tiers` (`IdAgentSaisi`);
CREATE INDEX `WDIDX_Tiers_IDStatuts` ON `Tiers` (`IDStatuts`);
CREATE INDEX `WDIDX_Tiers_idagentmodification` ON `Tiers` (`idagentmodification`);

-- Création de la table Transports
CREATE TABLE `Transports` (
    `IDTransports` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `DateDepart` DATE,
    `IdLieuDepart` BIGINT DEFAULT 0,
    `idLieuArrive` BIGINT DEFAULT 0,
    `IdAgent` BIGINT DEFAULT 0,
    `IDMoyensTransport` BIGINT DEFAULT 0,
    `NumeroTitreTransport` VARCHAR(150),
    `libelleTransport` VARCHAR(100),
    `Observations` VARCHAR(250),
    `DateArriveePrevue` DATE,
    `idbl` BIGINT DEFAULT 0,
    `HeureArriveePrevue` TIME,
    `NumeroEscale` VARCHAR(50)
);
CREATE INDEX `WDIDX_Transports_DateDepart` ON `Transports` (`DateDepart`);
CREATE INDEX `WDIDX_Transports_IdLieuDepart` ON `Transports` (`IdLieuDepart`);
CREATE INDEX `WDIDX_Transports_idLieuArrive` ON `Transports` (`idLieuArrive`);
CREATE INDEX `WDIDX_Transports_IdAgent` ON `Transports` (`IdAgent`);
CREATE INDEX `WDIDX_Transports_IDMoyensTransport` ON `Transports` (`IDMoyensTransport`);
CREATE INDEX `WDIDX_Transports_libelleTransport` ON `Transports` (`libelleTransport`);
CREATE INDEX `WDIDX_Transports_idbl` ON `Transports` (`idbl`);
CREATE INDEX `WDIDX_Transports_NumeroEscale` ON `Transports` (`NumeroEscale`);

-- Création de la table TVATRESOR
CREATE TABLE `TVATRESOR` (
    `IDTVATRESOR` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(100),
    `Taux` DOUBLE DEFAULT 0
);
CREATE INDEX `WDIDX_TVATRESOR_libelle` ON `TVATRESOR` (`libelle`);

-- Création de la table TypeOperations
CREATE TABLE `TypeOperations` (
    `IDTypeOperations` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleTypeOperation` VARCHAR(150),
    `DureeMax` NUMERIC(19,0)
);
CREATE INDEX `WDIDX_TypeOperations_LibelleTypeOperation` ON `TypeOperations` (`LibelleTypeOperation`);

-- Création de la table TypesDocuments
CREATE TABLE `TypesDocuments` (
    `IDTypesDocuments` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleTypeDocument` VARCHAR(150)
);
CREATE INDEX `WDIDX_TypesDocuments_LibelleTypeDocument` ON `TypesDocuments` (`LibelleTypeDocument`);

-- Création de la table TypesDocumentsOT
CREATE TABLE `TypesDocumentsOT` (
    `IDTypesDocumentsOT` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleTypeDocumentsOT` VARCHAR(150),
    `Observations` VARCHAR(250)
);
CREATE INDEX `WDIDX_TypesDocumentsOT_LibelleTypeDocumentsOT` ON `TypesDocumentsOT` (`LibelleTypeDocumentsOT`);

-- Création de la table TypesMoyensTransport
CREATE TABLE `TypesMoyensTransport` (
    `IDTypesMoyensTransport` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleTypeMoyenTransport` VARCHAR(250)
);
CREATE INDEX `WDIDX_TypesMoyensTransport_LibelleTypeMoyenTransport` ON `TypesMoyensTransport` (`LibelleTypeMoyenTransport`);

-- Création de la table TypeTC
CREATE TABLE `TypeTC` (
    `IDTypeTC` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibTypeTC` VARCHAR(50)
);
CREATE INDEX `WDIDX_TypeTC_LibTypeTC` ON `TypeTC` (`LibTypeTC`);

-- Création de la table TypeTiers
CREATE TABLE `TypeTiers` (
    `IDTypeTiers` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT
);

-- Création de la table unites
CREATE TABLE `unites` (
    `IDunites` INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleUnite` VARCHAR(100)
);
CREATE INDEX `WDIDX_unites_LibelleUnite` ON `unites` (`LibelleUnite`);

-- Création de la table UnitesVolume
CREATE TABLE `UnitesVolume` (
    `IDUnitesVolume` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LibelleUnite!volume` VARCHAR(50)
);
CREATE INDEX `WDIDX_UnitesVolume_LibelleUnite!volume` ON `UnitesVolume` (`LibelleUnite!volume`);

-- Contraintes d'intégrité
ALTER TABLE `Transports` ADD FOREIGN KEY (`IDMoyensTransport`) REFERENCES `MoyensTransport` (`IDMoyensTransport`);
ALTER TABLE `Transports` ADD FOREIGN KEY (`IdLieuDepart`) REFERENCES `Lieux` (`IDLieux`);
ALTER TABLE `Transports` ADD FOREIGN KEY (`idLieuArrive`) REFERENCES `Lieux` (`IDLieux`);
ALTER TABLE `LiaisonCotationsRubriques` ADD FOREIGN KEY (`IDRubriques`) REFERENCES `Rubriques` (`IDRubriques`);
ALTER TABLE `Documents` ADD FOREIGN KEY (`IDTypesDocuments`) REFERENCES `TypesDocuments` (`IDTypesDocuments`);
ALTER TABLE `Documents` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `Dossiers` ADD FOREIGN KEY (`IDCLIENTS`) REFERENCES `CLIENTS` (`IDCLIENTS`);
ALTER TABLE `Operations` ADD FOREIGN KEY (`IDDossiers1`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `ComptesClients` ADD FOREIGN KEY (`IDCLIENTS`) REFERENCES `CLIENTS` (`IDCLIENTS`);
ALTER TABLE `MouvementsComptesClients` ADD FOREIGN KEY (`IDComptesClients`) REFERENCES `ComptesClients` (`IDComptesClients`);
ALTER TABLE `LiaisonCotationsRubriques` ADD FOREIGN KEY (`IDCotation`) REFERENCES `Cotations` (`IDCotations`);
ALTER TABLE `Lieux` ADD FOREIGN KEY (`IDPays`) REFERENCES `Pays` (`IDPays`);
ALTER TABLE `LiaisonFacturesRubriques` ADD FOREIGN KEY (`IDFactures`) REFERENCES `Factures` (`IDFactures`);
ALTER TABLE `LiaisonFacturesRubriques` ADD FOREIGN KEY (`IDRubriques`) REFERENCES `Rubriques` (`IDRubriques`);
ALTER TABLE `Reglements` ADD FOREIGN KEY (`IdModeReglement`) REFERENCES `ModesReglements` (`IDModesReglements`);
ALTER TABLE `Reglements` ADD FOREIGN KEY (`IDFactures`) REFERENCES `Factures` (`IDFactures`);
ALTER TABLE `Dossiers` ADD FOREIGN KEY (`IdEtapeDossiers`) REFERENCES `EtapesDossiers` (`IDEtapesDossiers`);
ALTER TABLE `CLIENTS` ADD FOREIGN KEY (`IDStatuts`) REFERENCES `Statuts` (`IDStatuts`);
ALTER TABLE `LiaisonTiersDomainesActivites` ADD FOREIGN KEY (`IDDomaineActivite`) REFERENCES `DomaineActivite` (`IDDomaineActivite`);
ALTER TABLE `Factures` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `Dossiers` ADD FOREIGN KEY (`IdAgentSaisi`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `Dossiers` ADD FOREIGN KEY (`IdAgModiff`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `Dossiers` ADD FOREIGN KEY (`IdAgentValidation`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `OrdresTransit` ADD FOREIGN KEY (`IdAgent`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `CLIENTS` ADD FOREIGN KEY (`IdAgent`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `Documents` ADD FOREIGN KEY (`IdAgent`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `Factures` ADD FOREIGN KEY (`IDAgents`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `Reglements` ADD FOREIGN KEY (`IdAgent`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `BillOfLanding` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `Transports` ADD FOREIGN KEY (`IdAgent`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `LiaisonRegimeOT` ADD FOREIGN KEY (`IDRegimeOT`) REFERENCES `RegimeOT` (`IDRegimeOT`);
ALTER TABLE `OrdresTransit` ADD FOREIGN KEY (`Idincoterms`) REFERENCES `Incoterm` (`IDIncoterm`);
ALTER TABLE `FacturesRecues` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `OrdresTransit` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `LiaisonRubriquesFacturesRecues` ADD FOREIGN KEY (`IDRubriques`) REFERENCES `Rubriques` (`IDRubriques`);
ALTER TABLE `Relances` ADD FOREIGN KEY (`IDCLIENTS`) REFERENCES `CLIENTS` (`IDCLIENTS`);
ALTER TABLE `Operations` ADD FOREIGN KEY (`idtypeOperation`) REFERENCES `TypeOperations` (`IDTypeOperations`);
ALTER TABLE `NotesDeDetails` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `LiaisonRubriquesFacturesRecues` ADD FOREIGN KEY (`IDFacturesRecues`) REFERENCES `FacturesRecues` (`IDFacturesRecues`);
ALTER TABLE `NotesDeDetails` ADD FOREIGN KEY (`IDDeclarations`) REFERENCES `Declarations` (`IDDeclarations`);
ALTER TABLE `OrdresDeTransport` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `Enlevement` ADD FOREIGN KEY (`IDDetentions`) REFERENCES `Detentions` (`IDDetentions`);
ALTER TABLE `BordereauxDeLivraisons` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `ElementsPiecesCaisses` ADD FOREIGN KEY (`IDRubriquesPiecesCaisses`) REFERENCES `Rubriques` (`IDRubriques`);
ALTER TABLE `ElementsPiecesCaisses` ADD FOREIGN KEY (`IDPiecesCaisses`) REFERENCES `PiecesCaisses` (`IDPiecesCaisses`);
ALTER TABLE `PiecesCaisses` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `ConteneurBL` ADD FOREIGN KEY (`idblltalvibooking`) REFERENCES `BillOfLanding` (`idbl`);
ALTER TABLE `ContenusConteneurs` ADD FOREIGN KEY (`IDConteneurBL`) REFERENCES `ConteneurBL` (`IDConteneurBL`);
ALTER TABLE `LiaisonLTAProduits` ADD FOREIGN KEY (`idProduit`) REFERENCES `Produits` (`IDProduits`);
ALTER TABLE `LiaisonLVIProduits` ADD FOREIGN KEY (`idProduit`) REFERENCES `Produits` (`IDProduits`);
ALTER TABLE `FacturesFournisseursClients` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `FacturesFournisseursClients` ADD FOREIGN KEY (`IDIncoterm`) REFERENCES `Incoterm` (`IDIncoterm`);
ALTER TABLE `LiquidationsArticles` ADD FOREIGN KEY (`IDArticles`) REFERENCES `Articles` (`IDArticles`);
ALTER TABLE `Tarifs` ADD FOREIGN KEY (`IDTaux`) REFERENCES `Taux` (`IDTaux`);
ALTER TABLE `Tarifs` ADD FOREIGN KEY (`IDTaxes`) REFERENCES `Taxes` (`IDTaxes`);
ALTER TABLE `Articles` ADD FOREIGN KEY (`IDDEVISEFOB`) REFERENCES `Devises` (`IDDevises`);
ALTER TABLE `Articles` ADD FOREIGN KEY (`IDDEVISEFRET`) REFERENCES `Devises` (`IDDevises`);
ALTER TABLE `Articles` ADD FOREIGN KEY (`IDDEVISEASS`) REFERENCES `Devises` (`IDDevises`);
ALTER TABLE `Tarifs` ADD FOREIGN KEY (`IDProduits`) REFERENCES `Produits` (`IDProduits`);
ALTER TABLE `LiquidationsArticles` ADD FOREIGN KEY (`IDTaux`) REFERENCES `Taux` (`IDTaux`);
ALTER TABLE `LiaisonDossiersDeclarants` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `LiaisonDossiersDeclarants` ADD FOREIGN KEY (`idDeclarants`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `LiaisonAgentsGroupes` ADD FOREIGN KEY (`IdAgent`) REFERENCES `Agents` (`IDAgents`);
ALTER TABLE `LiaisonAgentsGroupes` ADD FOREIGN KEY (`IDGroupes`) REFERENCES `Groupes` (`IDGroupes`);
ALTER TABLE `MoyensTransport` ADD FOREIGN KEY (`idtypeMoyensTransport`) REFERENCES `TypesMoyensTransport` (`IDTypesMoyensTransport`);
ALTER TABLE `LiaisonRegimeOT` ADD FOREIGN KEY (`IDOrdresTransit`) REFERENCES `OrdresTransit` (`IDOrdresTransit`);
ALTER TABLE `LiaisonTiersDomainesActivites` ADD FOREIGN KEY (`IDTiers`) REFERENCES `Tiers` (`IDTiers`);
ALTER TABLE `LiaisonOTDocumentsARemettre` ADD FOREIGN KEY (`idtypesDocumentot`) REFERENCES `TypesDocumentsOT` (`IDTypesDocumentsOT`);
ALTER TABLE `LiaisonOTDocumentsARemettre` ADD FOREIGN KEY (`IDOrdreTransit`) REFERENCES `OrdresTransit` (`IDOrdresTransit`);
ALTER TABLE `MiseEnLivraison` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `Livraisons` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `Groupage` ADD FOREIGN KEY (`idblltalvibooking`) REFERENCES `BillOfLanding` (`idbl`);
ALTER TABLE `ChargementCamion` ADD FOREIGN KEY (`idblltalvibooking`) REFERENCES `BillOfLanding` (`idbl`);
ALTER TABLE `Booking` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `ComplementsTaxes` ADD FOREIGN KEY (`IDTaxes`) REFERENCES `Taxes` (`IDTaxes`);
ALTER TABLE `BillOfLanding` ADD FOREIGN KEY (`IDDossiers`) REFERENCES `Dossiers` (`IDDossiers`);
ALTER TABLE `RubriquesDesCommissions` ADD FOREIGN KEY (`IDCLIENTS`) REFERENCES `CLIENTS` (`IDCLIENTS`);
ALTER TABLE `RubriquesDesCommissions` ADD FOREIGN KEY (`IDRubriques`) REFERENCES `Rubriques` (`IDRubriques`); 