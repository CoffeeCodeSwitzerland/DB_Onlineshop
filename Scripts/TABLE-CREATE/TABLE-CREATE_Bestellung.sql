USE [INF2D_Alpha1_Shop]


CREATE TABLE Bestellung(
	BestellungID int IDENTITY(1,1) NOT NULL,
	ArtikelID int  NOT NULL,
	KundeID int NOT NULL,
	CONSTRAINT PK_BestellungID PRIMARY KEY (BestellungID),
	CONSTRAINT FK_KundeID FOREIGN KEY(KundeID)
	REFERENCES Kunde(ID) on delete set null on update cascade,
	CONSTRAINT FK_ArtikelID FOREIGN KEY(ArtikelID)
	REFERENCES Artikel(ID) on delete set null on update cascade
	)