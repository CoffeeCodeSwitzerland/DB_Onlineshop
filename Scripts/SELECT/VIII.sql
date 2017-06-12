USE [INF2D_Alpha1_Shop];

DELETE FROM Kategorie;
DELETE FROM Aktion; 
DELETE FROM Unterkategorie;
DELETE FROM Artikel;
DELETE FROM Preis;
DELETE FROM Bild;
DELETE FROM Galerie;
DELETE FROM Kundengruppe;
DELETE FROM Kunde;
DELETE FROM Bewertung;
DELETE FROM Bestellung;


insert into Kategorie (Name) values ('Audio');
insert into Kategorie (Name) values ('Drucker+Scanner'); 
insert into Kategorie (Name) values ('Netzwerk'); 
insert into Kategorie (Name) values ('Software');


INSERT INTO Aktion(Name, Faktor) VALUES('keine', 1.0);
INSERT INTO Aktion(Name, Faktor) VALUES('20%', 0.8);
INSERT INTO Aktion(Name, Faktor) VALUES('40%', 0.6);
INSERT INTO Aktion(Name, Faktor) VALUES('50%', 0.5); 

insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Audio') , 'Heimkino', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = '20%'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Audio'), 'Radio', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = '40%'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Software'), '3D', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = 'keine'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Software'), 'Scanner', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = 'keine'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Software'), 'Game', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = '50%'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Netzwerk') , 'Spielkonsole', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = '20%'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Software') , 'Druckserver', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = 'keine'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Software') , 'Modem', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = 'keine'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Netzwerk') , 'Firewall', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = 'keine'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Netzwerk') , 'Betriebssysteme', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = '20%'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Audio') , 'Büroanwendungen', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = '40%'));
insert into Unterkategorie (KategorieID, Name, Status, AktionID) values ((SELECT TOP 1 KategorieID from Kategorie where name = 'Audio') , 'Sicherheit', 'Verfügbar', (SELECT TOP 1 AktionID FROM Aktion WHERE Name = '50%'));

INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Heimkino' ),'Optical Switch','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Radio' ),'DAB Radio','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = '3D' ),'Duplicator i3 Plus','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Scanner' ),'ScnapSnap500i','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Game' ),'MarioKartDeluxe','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Spielkonsole' ),'Nintendo Switch','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Spielkonsole' ),'Playstation4','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Spielkonsole' ),'Microsoft XBox','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Druckserver' ),'TPLink USB2.0D Printserver','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Druckserver' ),'Silex USB Device Server','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Modem' ),'Netgear Aircard Mobilfunk','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Modem' ),'Huawei E550 Mobilfunk','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Firewall' ),'Zyxel USG20W-VPN','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Firewall' ),'Zyxel ZyWALL 110','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Betriebssysteme' ),'Microsoft Windows 10 Pro (DE, 64-bit)','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Betriebssysteme' ),'Microsoft Windows 7 Professional SP1 (DE, 64-bit)','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Büroanwendungen' ),'Banana Buchhaltung 8.0 2016 (DE, Windows)','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Büroanwendungen' ),'Adobe Acrobat Standard DC (DE, Windows)','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Sicherheit' ),'Kaspersky Internet Security 2017 (DE, FR, IT, Android, Windows, Mac OS X)','');
INSERT INTO Artikel (UnterkategorieID,Name,Beschreibung) values ((SELECT TOP 1 UnterkategorieID from Unterkategorie where Name = 'Sicherheit' ),'bitdefender Total Multi-device 2017 ESD (DE, FR, IT, EN, Android, Windows, Mac OS X)','');

Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 62), '118.20');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 63), '12.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 64), '55.55');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 65), '50.00');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 66), '588.00');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 67), '29.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 68), '59.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 69), '99.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 70), '199.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 71), '119.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 72), '0.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 73), '249.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 62), '999.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 63), '19.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 64), '99.95');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 65), '20.');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 66), '118.20');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 67), '118.20');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 68), '118.20');
Insert Into Preis(ArtikelID, Preis)values((SELECT TOP 1 ArtikelID FROM Artikel WHERE UnterkategorieID = 69), '118.20');


Insert into Bild(Pfad)values('../Bild/Bild1.png');
Insert into Bild(Pfad)values('../Bild/Bild2.png');
Insert into Bild(Pfad)values('../Bild/Bild3.png');
Insert into Bild(Pfad)values('../Bild/Bild4.png');
Insert into Bild(Pfad)values('../Bild/Bild5.png');

INSERT INTO Galerie(ArtikelID, BildID) values((SELECT TOP 1 ArtikelID FROM Artikel WHERE Name = 'DAB Radio'), (SELECT TOP 1 BildID FROM Bild WHERE Pfad = '../Bild/Bild1.png'));
INSERT INTO Galerie(ArtikelID, BildID) values((SELECT TOP 1 ArtikelID FROM Artikel WHERE Name = 'Zyxel USG20W-VPN'), (SELECT TOP 1 BildID FROM Bild WHERE Pfad = '../Bild/Bild2.png'));
INSERT INTO Galerie(ArtikelID, BildID) values((SELECT TOP 1 ArtikelID FROM Artikel WHERE Name = 'Huawei E550 Mobilfunk'), (SELECT TOP 1 BildID FROM Bild WHERE Pfad = '../Bild/Bild3.png'));
INSERT INTO Galerie(ArtikelID, BildID) values((SELECT TOP 1 ArtikelID FROM Artikel WHERE Name = 'Playstation4'), (SELECT TOP 1 BildID FROM Bild WHERE Pfad = '../Bild/Bild4.png'));
INSERT INTO Galerie(ArtikelID, BildID) values((SELECT TOP 1 ArtikelID FROM Artikel WHERE Name = 'TPLink USB2.0D Printserver'), (SELECT TOP 1 BildID FROM Bild WHERE Pfad = '../Bild/Bild5.png'));

INSERT INTO Kundengruppe(Name, Rabattfaktor)
    VALUES  ('Privatkunde', 1.0),
            ('Geschäftskunde', 0.9),
            ('Retailer', 0.7),
            ('Student', 0.8),
            ('Senior', 0.8),
			('Mitarbeiter', 0.6);

INSERT INTO Kunde(Anrede, Vorname, Nachname, Adresse, PLZ, Ort, KundengruppeID, Mail, Tel)
    VALUES  ('Herr', 'Stefan', 'Meier', 'Tulpenweg 1a', 3292, 'Busswil', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Mitarbeiter'),'stefan.meier@hotmail.com','032 384 19 10'),
            ('Herr', 'Martin', 'Müller', 'Mauerweg 15', 3015, 'Worb', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Geschäftskunde'),'m.mueller@gmx.net','030 764 46 71'),
            ('Herr', 'Tobias', 'Reuther', 'Grossstrasse 29', 4567, 'Hofstetten', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Privatkunde'),'tob.ias@gmail.com','045 456 15 34'),
            ('Herr', 'Lino', 'Dreyer', 'Tulpenweg 23', 4568, 'Schlatt', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Retailer'),'dreyer-lino@hotmail.de','045 479 46 10'),
            ('Herr', 'Frederik', 'Von Grafenried', 'Blumengasse 6', 5716, 'Ganterschwil', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Geschäftskunde'),'fredvongraf@thun.ch','057 123 22 11'),
            ('Herr', 'Vethan', 'Nathalingam', 'Erli 7', 6431, 'Herisau', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Geschäftskunde'),'vethan.nathalingam@outlook.com','064 646 46 46'),
            ('Herr', 'Josef', 'Steinmeier', 'Rossiweg 3', 6661, 'Gossau', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Privatkunde'),'josef.steinmeier02@gmx.de','066 795 17 34'),
            ('Herr', 'Timon', 'Bunthaus', 'Mariastrasse 71c', 8165, 'Quarten', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Geschäftskunde'),'timon12345@gmail.com','081 798 54 34'),
            ('Herr', 'Bashkim', 'Idrizi', 'Dreiecksweg 5b', 8160, 'Mels', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Senior'),'prince-idrizi@gmail.com','081 177 68 12'),
            ('Herr', 'Nikola', 'Milicic', 'Langstrasse 2', 8340, 'Stugl', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Mitarbeiter'),'milicicn@outlook.com','083 103 45 31'),
            ('Herr', 'Carlos', 'Sanchez', 'Hauptstrasse 4e', 8978, 'Tamins', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Privatkunde'),'carlossanchez@espana.es','089 789 45 13'),
            ('Frau', 'Stefanie', 'Treu', 'Bachstrasse 1', 3046, 'Köniz', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Privatkunde'),'steffi.treu@gmx.ch','030 332 15 35'),
            ('Frau', 'Martina', 'Klein', 'Maiweg 12', 3107, 'Biel', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Privatkunde'),'martinaklein@schulebiel.ch','031 884 45 64'),
            ('Frau', 'Nina', 'Gross', 'Sterbeweg 34', 4125, 'Basel', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Senior'),'gross-nina','041 146 54 78'),
            ('Frau', 'Sara', 'Gut', 'Jutzi 8', 5421, 'Zürich', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Retailer'),'saraNotLaraGut@gmx.ch','054 796 16 45'),
            ('Frau', 'Rekha', 'Riedwyl', 'Eichenweg 1', 3005, 'Bern', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Privatkunde'),'rekha.riedwyl@bit.admin.ch','030 465 14 68'),
            ('Frau', 'Brunhilde', 'Lang', 'Lorrainestrasse 28b', 3005, 'Bern', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Geschäftskunde'),'brunhilde.lang@topomedics.com','030 384 19 20'),
            ('Frau', 'Olivia', 'Neu', 'Neuenegg 12', 3146, 'Zollikofen', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Privatkunde'),'newolive@gmail.com','031 013 51 68'),
            ('Frau', 'Franziska', 'Sinzig', 'Rechenweg 92', 3150, 'Oberzollikofen', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Student'),'sinzigfranziska@rechenweg.ch','031 768 84 98'),
            ('Frau', 'Giorgia', 'Di Caro', 'Blumenweg 7', 3250, 'Lyss', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Student'),'giorgia@dicaro.it','032 765 43 21'),
			('Frau', 'Sophia', 'Salzmann', 'Pferdegasse 11', 3250, 'Lyss', (SELECT TOP 1 KundengruppeID FROM Kundengruppe WHERE Name='Student'),'sopha.salzmann@gmail.com','032 123 45 67');


INSERT INTO Bewertung(ArtikelID, KundeID, Kommentar) VALUES((SELECT TOP 1 ArtikelID FROM Artikel WHERE Name='Microsoft XBox'),(SELECT TOP 1 KundeID FROM Kunde WHERE Vorname='Lino' AND Nachname='Dreyer'),'')
INSERT INTO Bewertung(ArtikelID, KundeID, Kommentar) VALUES((SELECT TOP 1 ArtikelID FROM Artikel WHERE Name='Playstation4'),(SELECT TOP 1 KundeID FROM Kunde WHERE Vorname='Tobias' AND Nachname='Reuther'),'')
INSERT INTO Bewertung(ArtikelID, KundeID, Kommentar) VALUES((SELECT TOP 1 ArtikelID FROM Artikel WHERE Name='Nintendo Switch'),(SELECT TOP 1 KundeID FROM Kunde WHERE Vorname='Giorgia' AND Nachname='Di Caro'),'')
INSERT INTO Bewertung(ArtikelID, KundeID, Kommentar) VALUES((SELECT TOP 1 ArtikelID FROM Artikel WHERE Name='DAB Radio'),(SELECT TOP 1 KundeID FROM Kunde WHERE Vorname='Sophia' AND Nachname='Salzmann'),'')



DECLARE @vorname nvarchar(50), @nachname nvarchar(50),@artikelbezeichnnung nvarchar(50),@preis float,@rabatt float,@aktion float,@artikelid bigint,@kundeid bigint,@artikelpreis float,@erfasseDruchArtikelID bit,@wahl bit,@bestellnummer bigint,@kurabatt float,@karabatt nvarchar(15),@kundengruppe nvarchar(50);

/*
--------------------------------------------------------------
Benutzerangaben für den Bestellvorgang
--------------------------------------------------------------
*/

SET @vorname = 'Giorgia';       
--Vorname des Kunden

SET @nachname = 'Di Caro';		
--Nachname des Kunden

SET @erfasseDruchArtikelID = 0; 
--Auswahl ob der Artikel anhan der ID oder des Namens gefunden werden soll

SET @artikelbezeichnnung = 'DAB Radio';	
--Wenn @erfasseDruchArtikelID = 0 muss hier der Name des geünschten Artikels eingetragen werden

SET @artikelid = 0;				
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

IF EXISTS(SELECT TOP 1 KundeID FROM Kunde WHERE Vorname = @vorname AND Nachname = @nachname)
	BEGIN
		SET @kundeid = (SELECT TOP 1 KundeID FROM Kunde WHERE Vorname = @vorname AND Nachname = @nachname);
		SET @kundengruppe = (SELECT TOP 1 Name FROM Kundengruppe WHERE KundengruppeID = (SELECT TOP 1 KundengruppeID FROM Kunde WHERE KundeID = @kundeid));
		--SET @kurabatt = (SELECT TOP 1 Name FROM Kundengruppe WHERE KundengruppeID = (SELECT TOP 1 KundengruppeID FROM Kunde WHERE KundeID = @kundeid));
 		SET @rabatt = (SELECT TOP 1 RabattFaktor FROM Kundengruppe WHERE KundengruppeID = (SELECT TOP 1 KundengruppeID from Kunde WHERE Vorname = @vorname AND Nachname = @nachname));

		IF (@erfasseDruchArtikelID = 0)
			BEGIN
				IF EXISTS(SELECT TOP 1 ArtikelID FROM Artikel WHERE Name = @artikelbezeichnnung)
					BEGIN
						SET @artikelid = (SELECT TOP 1 ArtikelID FROM Artikel WHERE Name = @artikelbezeichnnung);
						SET @artikelpreis = (SELECT TOP 1 Preis FROM Preis WHERE ArtikelID = (SELECT TOP 1 ArtikelID FROM Artikel WHERE Name = @artikelbezeichnnung));
						SET @aktion = (SELECT TOP 1 Faktor FROM Aktion where AktionID = (SELECT TOP 1 AktionID FROM Unterkategorie WHERE UnterkategorieID = (SELECT TOP 1 UnterkategorieID FROM Artikel WHERE Name = @artikelbezeichnnung)));
						SET @karabatt =(SELECT TOP 1 Name FROM Aktion where AktionID = (SELECT TOP 1 AktionID FROM Unterkategorie WHERE UnterkategorieID = (SELECT TOP 1 UnterkategorieID FROM Artikel WHERE Name = @artikelbezeichnnung)));
						SET @wahl = 1;
					END
				ELSE
					BEGIN
						PRINT N'Der Artikel exisitert nicht';
					END
			END

		IF(@erfasseDruchArtikelID = 1)
		BEGIN
			IF EXISTS(SELECT TOP 1 Name FROM Artikel WHERE ArtikelID = @artikelid)
				BEGIN
					SET @artikelbezeichnnung = (SELECT TOP 1 Name FROM Artikel WHERE ArtikelID = @artikelid);
					SET @artikelpreis = (SELECT TOP 1 Preis FROM Preis WHERE ArtikelID = @artikelid);
					SET @aktion = (SELECT TOP 1 Faktor FROM Aktion where AktionID = (SELECT TOP 1 AktionID FROM Unterkategorie WHERE UnterkategorieID = (SELECT TOP 1 UnterkategorieID FROM Artikel WHERE ArtikelID = @artikelid)));
					SET @karabatt =(SELECT TOP 1 Name FROM Aktion where AktionID = (SELECT TOP 1 AktionID FROM Unterkategorie WHERE UnterkategorieID = (SELECT TOP 1 UnterkategorieID FROM Artikel WHERE Name = @artikelbezeichnnung)));
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

				INSERT INTO Bestellung (ArtikelID,KundeID,Preis,Status) VALUES (@artikelid,@kundeid,@preis,'In Bearbeitung');

				SET @bestellnummer = (SELECT TOP 1 MAX(BestellungID) FROM Bestellung WHERE KundeID = @kundeid);

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



/*-----------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------Sollte stimmen...---------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------*/


/* Kategorie mit grösstem Umsatz ausgeben */
SELECT TOP 1 k.Name AS 'Kategorie mit grösstem Umsatz', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
	GROUP BY u.KategorieID, k.Name
		ORDER BY SUM(b.Preis) DESC;

/* Unterkategorie mit grösstem Umsatz ausgeben */
SELECT TOP 1 u.Name AS 'Unterkategorie mit grösstem Umsatz', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	GROUP BY a.UnterkategorieID, u.Name
		ORDER BY SUM(b.Preis) DESC;

/* Artikel mit grösstem Umsatz ausgeben */
SELECT TOP 1 a.Name AS 'Artikel mit grösstem Umsatz', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	GROUP BY b.ArtikelID, a.Name
		ORDER BY SUM(b.Preis) DESC;
	


	

	
/* Kategorie mit kleinstem Umsatz ausgeben */
SELECT TOP 1 k.Name AS 'Kategorie mit kleinstem Umsatz', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID, k.Name
			ORDER BY SUM(b.Preis) ASC;

/* Unterkategorie mit kleinstem Umsatz ausgeben */
SELECT TOP 1 u.Name AS 'Unterkategorie mit kleinstem Umsatz', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
		GROUP BY a.UnterkategorieID, u.Name
			ORDER BY SUM(b.Preis) ASC;

/* Artikel mit kleinstem Umsatz ausgeben */
SELECT TOP 1 a.Name AS 'Artikel mit kleinstem Umsatz', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID, a.Name
			ORDER BY SUM(b.Preis) ASC;
	

	


	
/* Durchschnittsumsatz pro Kategorie */
SELECT TOP 1 k.Name AS 'Kategorie', AVG(b.Preis) AS 'Durchschnittsumsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID, k.Name
			ORDER BY AVG(b.Preis) DESC;
		
/* Durchschnittsumsatz pro Unterkategorie */
SELECT TOP 1 u.Name AS 'Unterkategorie', AVG(b.Preis) AS 'Durchschnittsumsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
		GROUP BY a.UnterkategorieID, u.Name
			ORDER BY AVG(b.Preis) DESC;

/* Durchschnittsumsatz pro Artikel */
SELECT TOP 1 a.Name AS 'Artikel', AVG(b.Preis) AS 'Durchschnittsumsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID, a.Name
			ORDER BY AVG(b.Preis) DESC;
	



	
	
/* Gesamtumsatz pro Unterkategorie einer Kategorie */
SELECT TOP 1 u.Name AS 'Unterkategorie', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		WHERE k.Name = 'Software'
			GROUP BY a.UnterkategorieID, u.Name
				ORDER BY SUM(b.Preis) DESC;

/* Gesamtumsatz pro Artikel einer Kategorie */		
SELECT TOP 1 a.Name AS 'Artikel', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		WHERE k.Name = 'Audio'
			GROUP BY b.ArtikelID, a.Name
				ORDER BY SUM(b.Preis) DESC;	
	



	
	
/* Beliebteste Kategorie einer Kundengruppe */
SELECT TOP 1 k.Name AS 'Kategorie', SUM(b.Preis) AS 'Umsatz in Kundengruppe' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		WHERE kg.Name = ''
			GROUP BY u.KategorieID, k.Name
				ORDER BY SUM(b.Preis) DESC;

/* Beliebteste Unterkategorie einer Kundengruppe */
SELECT TOP 1 u.Name AS 'Unterkategorie', SUM(b.Preis) AS 'Umsatz in Kundengruppe' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
		WHERE kg.Name = ''
			GROUP BY a.UnterkategorieID, u.Name
				ORDER BY SUM(b.Preis) DESC;

/* Beliebtester Artikel einer Kundengruppe */
SELECT TOP 1 a.Name AS 'Artikel', SUM(b.Preis) AS 'Umsatz in Kundengruppe' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		WHERE kg.Name = ''
			GROUP BY b.ArtikelID, a.Name
				ORDER BY SUM(b.Preis) DESC;
	



	
	
/* Bester Kunde */
SELECT TOP 1 ku.Vorname AS 'Vorname', ku.Nachname AS 'Nachname', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
		GROUP BY b.KundeID, ku.Vorname, ku.Nachname
			ORDER BY SUM(b.Preis) DESC;

/* Beste Kundengruppe */
SELECT TOP 1 kg.Name AS 'Kundengruppe', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
		GROUP BY ku.KundengruppeID, kg.Name
			ORDER BY SUM(b.Preis) DESC;



	
/* Beliebteste Kategorie eines Kunden */
SELECT TOP 1 ku.Vorname AS 'Vorname', ku.Nachname AS 'Nachname', k.Name AS 'Kategorie', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		WHERE ku.Vorname = '' AND ku.Nachname = ''
			GROUP BY u.KategorieID, ku.Vorname, ku.Nachname, k.Name
				ORDER BY SUM(b.Preis) DESC;		

/* Beliebteste Unterkategorie eines Kunden */
SELECT TOP 1 ku.Vorname AS 'Vorname', ku.Nachname AS 'Nachname', u.Name AS 'Unterkategorie', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
		WHERE ku.Vorname = '' AND ku.Nachname = ''
			GROUP BY a.UnterkategorieID, ku.Vorname, ku.Nachname, u.Name
			ORDER BY SUM(b.Preis) DESC;			

/* Beliebtester Artikel eines Kunden */	
SELECT TOP 1 ku.Vorname AS 'Vorname', ku.Nachname AS 'Nachname', a.Name AS 'Artikel', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		WHERE ku.Vorname = '' AND ku.Nachname = ''
			GROUP BY b.ArtikelID, ku.Vorname, ku.Nachname, a.Name
				ORDER BY SUM(b.Preis) DESC;


/*-----------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------*/	