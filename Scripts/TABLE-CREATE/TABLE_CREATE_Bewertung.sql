CREATE TABLE Bewertung(
		BewertungID bigint identity(1,1) NOT NULL,
		ArtikelID bigint not null,
		KundeID bigint not null,
		Kommentar nvarchar(50) Not NUll,
		CONSTRAINT PK_Bewertung Primary KEY (BewertungID),
		constraint fk_artikel foreign Key (ArtikelID) References Artikel (ArtikelID) on update cascade,
		constraint fk_kunde foreign Key(KundeID) References Kunde (KundeID) on update cascade,
		 
		)