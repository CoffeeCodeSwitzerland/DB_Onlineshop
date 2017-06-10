USE [INF2D_Alpha1_Shop];

CREATE TABLE Kategorie( 
                        KategorieID bigint Identity (1,1) not null constraint PK_Kategorie Primary KEY,
                        Name nvarchar(50) not null
                      )

CREATE TABLE Aktion (
						AktionID bigint identity(1,1) not null,
						Name nvarchar(50) not null,
						Faktor float default 1,
						Constraint AktionPK  Primary Key (AktionID)
					)



CREATE TABLE Unterkategorie(
                            UnterkategorieID bigint Identity (1,1) not null constraint PK_Unterkategorie Primary KEY, 
	                        KategorieID bigint default null,
                            Name nvarchar(50) not null,
							AktionID bigint default 1,
                            Constraint KategorieFK Foreign Key (KategorieID)
                                References Kategorie (KategorieID)
                                    on Update cascade ON DELETE SET NULL,
							Constraint AktionFK Foreign Key(AktionID) References Aktion(AktionID) ON Delete set default On Update Cascade
                            )


CREATE TABLE Artikel(	
                        ArtikelID BIGINT IDENTITY(1,12) NOT NULL CONSTRAINT pk_artikel PRIMARY KEY,
                        UnterkategorieID BIGINT Default NULL,
                        Name NVARCHAR(50) NOT NULL,
                        Beschreibung NVARCHAR(100) NOT NULL,
                        CONSTRAINT fk_artikel FOREIGN KEY(UnterkategorieID)
                            REFERENCES Unterkategorie(UnterkategorieID)
                                ON UPDATE CASCADE ON DELETE SET NULL
                    ) 

CREATE TABLE Preis( 
                    PreisID bigint identity(1,1) NOT NULL CONSTRAINT PK_Preis PRIMARY KEY,
                    ArtikelID bigint NOT NULL,
                    Preis float NOT NULL,
	                CONSTRAINT fk_artikel_preis FOREIGN KEY(ArtikelID)
                        REFERENCES Artikel(ArtikelID) 
                            on update cascade on delete cascade,
                  )   

CREATE TABLE Bild(  
                    BildID bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_BildID PRIMARY KEY,
	                Pfad nvarchar(100) NOT NULL
	             )


CREATE TABLE Galerie(   
                        GalerieID BIGINT identity(1,1) NOT NULL CONSTRAINT pk_Galerie PRIMARY KEY,
                        ArtikelID BIGINT NOT NULL,
                        BildID BIGINT NOT NULL,
                        CONSTRAINT fk_artikel_galerie FOREIGN KEY(ArtikelID)
                            REFERENCES Artikel(ArtikelID)
                                ON UPDATE CASCADE ON DELETE CASCADE,
                        CONSTRAINT fk_bild FOREIGN KEY(BildID)
                            REFERENCES Bild(BildID)
                                ON DELETE CASCADE ON UPDATE CASCADE
                    )                                                                           

CREATE TABLE Kundengruppe(  
                            KundengruppeID bigint identity(1,1) NOT NULL CONSTRAINT PK_KundengruppeID PRIMARY KEY, 
                            Name nvarchar(50) NOT NULL, 
                            RabattFaktor float NOT NULL
                         )

CREATE TABLE Kunde( 
                    KundeID bigint identity(1,1) NOT NULL CONSTRAINT PK_KundeID PRIMARY KEY,
                    Anrede char(4) NOT NULL,
                    Vorname nvarchar(50) NOT NULL, 
                    Nachname nvarchar(50) NOT NULL, 
                    Adresse nvarchar(50) NOT NULL, 
                    PLZ smallint NOT NULL, 
                    Ort nvarchar(50) NOT NULL, 
                    KundengruppeID bigint default NULL, 
                    Mail nvarchar(50) NOT NULL, 
                    Tel nvarchar(20) NOT NULL,
                    CONSTRAINT FK_KundengruppeID_Kunde FOREIGN KEY(KundengruppeID) 
                        REFERENCES Kundengruppe(KundengruppeID) 
                            ON DELETE SET NULL ON UPDATE CASCADE
                   )

CREATE TABLE Bewertung( 
                        BewertungID bigint identity(1,1) NOT NULL  CONSTRAINT PK_Bewertung Primary KEY,
		                ArtikelID bigint default null,
		                KundeID bigint default null,
		                Kommentar nvarchar(50) Not NUll,
		                constraint fk_artikel_bewertung foreign Key (ArtikelID)
                            References Artikel (ArtikelID)
                                on update cascade on delete set null,
		                constraint fk_kunde foreign Key(KundeID) 
                            References Kunde (KundeID) 
                                on update cascade on delete set null,
		              )

CREATE TABLE Bestellung(
                        BestellungID bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_BestellungID PRIMARY KEY,
	                    ArtikelID bigint  default NULL,
	                    KundeID bigint default NULL,
						Status nvarchar(50) default Null,
						Preis float default null,
	                    CONSTRAINT FK_KundeID FOREIGN KEY(KundeID)
	                        REFERENCES Kunde(KundeID) 
                                on delete set null on update cascade,
	                    CONSTRAINT FK_ArtikelID FOREIGN KEY(ArtikelID)
	                        REFERENCES Artikel(ArtikelID)
								on update cascade
						);
                  