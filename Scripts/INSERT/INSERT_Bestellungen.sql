USE [INF2D_Alpha1_Shop];

DECLARE @vorname nvarchar(50), @nachname nvarchar(50),@artikelbezeichnnung nvarchar(50),@preis float,@rabatt float,@aktion float,@artikelid bigint,@kundeid bigint,@artikelpreis float,@erfasseDruchArtikelID bit,@wahl bit,@bestellnummer bigint,@kurabatt float,@karabatt nvarchar(15),@kundengruppe nvarchar(50);

/*
--------------------------------------------------------------
Benutzerangaben für den Bestellvorgang
--------------------------------------------------------------
*/

SET @vorname = 'Frithjof';       
--Vorname des Kunden

SET @nachname = 'Hoppe';		
--Nachname des Kunden

SET @erfasseDruchArtikelID = 1; 
--Auswahl ob der Artikel anhan der ID oder des Namens gefunden werden soll

SET @artikelbezeichnnung = '';	
--Wenn @erfasseDruchArtikelID = 0 muss hier der Name des geünschten Artikels eingetragen werden

SET @artikelid = 1;				
--Wenn @erfasseDruchArtikelID = 1 muss hier die ID des gewünschten Artikels eingetragen werden 


/*Systsem Vairablen nicht verändern!!*/
SET @artikelpreis = 0.0;
SET @preis = 0.0;
SET @rabatt = 0.0;
SET @aktion = 0.0;
SET @kundeid = '';
SET @wahl = 0;
SET @bestellnummer = 0;
SET @karabatt = 0.0;
SET @kurabatt = 0.0;
SET @kundengruppe = '';

IF EXISTS(SELECT KundeID FROM Kunde WHERE Vorname = @vorname AND Nachname = @nachname)
	BEGIN
		SET @kundeid = (SELECT KundeID FROM Kunde WHERE Vorname = @vorname AND Nachname = @nachname);
		SET @kundengruppe = (SELECT Name FROM Kundengruppe WHERE KundengruppeID = (SELECT KundengruppeID FROM Kunde WHERE KundeID = @kundeid));
		--SET @kurabatt = (SELECT Name FROM Kundengruppe WHERE KundengruppeID = (SELECT KundengruppeID FROM Kunde WHERE KundeID = @kundeid));
 		SET @rabatt = (SELECT RabattFaktor FROM Kundengruppe WHERE KundengruppeID = (SELECT KundengruppeID from Kunde WHERE Vorname = @vorname AND Nachname = @nachname));

		IF (@erfasseDruchArtikelID = 0)
			BEGIN
				IF EXISTS(SELECT ArtikelID FROM Artikel WHERE Name = @artikelbezeichnnung)
					BEGIN
						SET @artikelid = (SELECT ArtikelID FROM Artikel WHERE Name = @artikelbezeichnnung);
						SET @artikelpreis = (SELECT Preis FROM Preis WHERE ArtikelID = (SELECT ArtikelID FROM Artikel WHERE Name = @artikelbezeichnnung));
						SET @aktion = (SELECT Faktor FROM Aktion where AktionID = (SELECT AktionID FROM Unterkategorie WHERE UnterkategorieID = (SELECT UnterkategorieID FROM Artikel WHERE Name = @artikelbezeichnnung)));
						SET @karabatt =(SELECT Name FROM Aktion where AktionID = (SELECT AktionID FROM Unterkategorie WHERE UnterkategorieID = (SELECT UnterkategorieID FROM Artikel WHERE Name = @artikelbezeichnnung)));
						SET @wahl = 1;
					END
				ELSE
					BEGIN
						PRINT N'Der Artikel exisitert nicht';
					END
			END

		IF(@erfasseDruchArtikelID = 1)
		BEGIN
			IF EXISTS(SELECT Name FROM Artikel WHERE ArtikelID = @artikelid)
				BEGIN
					SET @artikelbezeichnnung = (SELECT Name FROM Artikel WHERE ArtikelID = @artikelid);
					SET @artikelpreis = (SELECT Preis FROM Preis WHERE ArtikelID = @artikelid);
					SET @aktion = (SELECT Faktor FROM Aktion where AktionID = (SELECT AktionID FROM Unterkategorie WHERE UnterkategorieID = (SELECT UnterkategorieID FROM Artikel WHERE ArtikelID = @artikelid)));
					SET @karabatt =(SELECT Name FROM Aktion where AktionID = (SELECT AktionID FROM Unterkategorie WHERE UnterkategorieID = (SELECT UnterkategorieID FROM Artikel WHERE Name = @artikelbezeichnnung)));
					SET @wahl = 1;
				END
			ELSE
				BEGIN
						PRINT N'Der Artikel exisitert nicht';
				END
		END

		IF (@wahl = 1)
			BEGIN
				DECLARE @zwischen float;
				SET @zwischen = (1-((1-@rabatt) + (1-@aktion)))
				SET @preis = @artikelpreis * @zwischen;

				INSERT INTO Bestellung (ArtikelID,KundeID,Preis,StatusID) VALUES (@artikelid,@kundeid,@preis,(SELECT AuftragstatusID FROM Auftragstatus WHERE Bezeichung ='In Bearbeitung'));

				SET @bestellnummer = (SELECT MAX(BestellungID) FROM Bestellung WHERE KundeID = @kundeid);

				PRINT N' ' + CHAR(13)+ 'Die Bestellung mit der Nummer -> ' + CAST(@bestellnummer AS VARCHAR) + ' <- wurde aufgegeben' + CHAR(13) +
				'Vorname: '+@vorname + CHAR(13) + 
				'Nachname: '+@nachname + CHAR(13)+  
				'Kundengruppe: '+@kundengruppe  + CHAR(13)+ CHAR(13)+

				'Artikel: ' + @artikelbezeichnnung + CHAR(13) +
				'Reduktion ArtikelKategorie: '+@karabatt +CHAR(13)+
				'Reduktion Kundengruppe: '+CAST((100-(@rabatt * 100)) AS VARCHAR) +'%'+ CHAR(13)+  
				'Resultierender Preis: ' + CAST(@preis AS VARCHAR) + ' CHF' + CHAR(13);
			END
		ELSE
			BEGIN
				PRINT N'Ungültuge Daten wurde eingegeben';
			END
	END
ELSE
	BEGIN
		PRINT N'Der Benutzer exisitert nicht';
	END
