USE [INF2D_Alpha1_Shop];

CREATE TABLE Preis(
    PreisID bigint identity(1,1) NOT NULL,
    ArtikelID int NOT NULL,
    Preis nvarchar(50) NOT NULL,
	CONSTRAINT PK_Preis PRIMARY KEY(PreisID),
	CONSTRAINT fk_artikel FOREIGN KEY(ArtikelID)REFERENCES Artikel(ArtikelID) on update cascade,
)