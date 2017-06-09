USE [INF2D_Alpha1_Shop]

CREATE TABLE Kunde( KundeID bigint identity(1,1) NOT NULL CONSTRAINT PK_KundeID PRIMARY KEY, 
                    Vorname nvarchar(50) NOT NULL, 
                    Nachname nvarchar(50) NOT NULL, 
                    Adresse nvarchar(50) NOT NULL, 
                    PLZ smallint NOT NULL, 
                    Ort nvarchar(50) NOT NULL, 
                    KundengruppeID tinyint NOT NULL, 
                    Mail nvarchar(50) NOT NULL, 
                    Tel nvarchar(20) NOT NULL,
                    CONSTRAINT FK_KundengruppeID_Kunde FOREIGN KEY(KundengruppeID) 
                        REFERENCES Kundengruppe(KundengruppeID) 
                            ON DELETE SET NULL ON UPDATE CASCADE
                   )