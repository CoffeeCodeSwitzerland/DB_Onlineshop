USE [INF2D_Alpha1_Shop];

DECLARE @bestellnummer BIGINT, @status NVARCHAR(50),@erstellt BIT,@inBearbeitung BIT, @verschickt BIT,@geliefert BIT, @problem BIT, @akutellerStatusAnzeigen BIT,@wahr BIT;
DECLARE @vorname NVARCHAR(50), @nachname NVARCHAR(50),@artikel NVARCHAR(50),@preis FLOAT;

SET @bestellnummer = 2;
--Bestellung des Kunden

SET @inBearbeitung = 0;
SET @erstellt = 0;
SET @geliefert = 0;
SET @problem = 0;
SET @verschickt = 1;
--Diese 4 Statusoptionen können gesetzt werden

SET @akutellerStatusAnzeigen = 1;
--Wenn diese Option aktiviert ist wird der aktuelle Status der Bestellung ausgegeben




--Systemvariablen ncith ändern!!
SET @status = '';
SET @vorname = '';
SET @nachname = '';
SET @artikel ='';
SET @preis = 0.0;
SET @wahr = 0;

IF EXISTS(SELECT KundeID FROM Bestellung WHERE BestellungID = @bestellnummer)
	BEGIN
		IF(@akutellerStatusAnzeigen = 1)
			BEGIN
				
				SET @vorname = (SELECT Vorname FROM Kunde WHERE KundeID = (SELECT KundeID FROm Bestellung WHERE BestellungID = @bestellnummer));
				SET @nachname = (SELECT Nachname FROM Kunde WHERE KundeID = (SELECT KundeID FROm Bestellung WHERE BestellungID = @bestellnummer));
				SET @preis = (SELECT Preis FROM Bestellung WHERE BestellungID = @bestellnummer);
				SET @artikel = (SELECT Name FROM Artikel WHERE ArtikelID = (SELECT ArtikelID FROM Bestellung WHERE BestellungID = @bestellnummer));
				SET @status = (SELECT Bezeichung FROM Auftragstatus WHERE AuftragstatusID = (SELECT StatusID FROM Bestellung WHERE BestellungID = @bestellnummer));
				PRINT N'Informationen zur Bestellung mit der Nummer -> '+ CAST(@bestellnummer AS VARCHAR)+ ' <- ' + CHAR(13)+ CHAR(13)+
					  'Name des Käufers: '+@vorname+ CHAR(13)+
					  'Nachname des Käufers: '+@nachname+ CHAR(13)+CHAR(13)+
					  'Preis: '+CAST(@preis AS VARCHAR)+' CHF'+CHAR(13)+
					  'Artikel: '+@artikel+CHAR(13)+
					  'Status: '+@status;
			END
		ELSE IF(@akutellerStatusAnzeigen = 0)
			BEGIN
				IF(@inBearbeitung = 1)
					BEGIN
						UPDATE Bestellung SET StatusID = (SELECT AuftragstatusID FROM Auftragstatus WHERE Bezeichung = 'In Bearbeitung') WHERE BestellungID = @bestellnummer;
						SET @wahr = 1;
					END
				ELSE IF(@problem = 1)
					BEGIN
						UPDATE Bestellung SET StatusID = (SELECT AuftragstatusID FROM Auftragstatus WHERE Bezeichung = 'Problem') WHERE BestellungID = @bestellnummer;
						SET @wahr = 1;
					END
				ELSE IF(@geliefert = 1)
					BEGIN
						UPDATE Bestellung SET StatusID = (SELECT AuftragstatusID FROM Auftragstatus WHERE Bezeichung = 'Geliefert') WHERE BestellungID = @bestellnummer;
						SET @wahr = 1;
					END
				ELSE IF(@erstellt = 1)
					BEGIN
						UPDATE Bestellung SET StatusID = (SELECT AuftragstatusID FROM Auftragstatus WHERE Bezeichung = 'Erstellt') WHERE BestellungID = @bestellnummer;
						SET @wahr = 1;
					END
				ELSE IF(@verschickt = 1)
					BEGIN
						UPDATE Bestellung SET StatusID = (SELECT AuftragstatusID FROM Auftragstatus WHERE Bezeichung = 'Verschickt') WHERE BestellungID = @bestellnummer;
						SET @wahr = 1;
					END
				IF(@wahr = 1)
					BEGIN
						SET @status = (SELECT Bezeichung FROM Auftragstatus WHERE AuftragstatusID = (SELECT StatusID FROM Bestellung WHERE BestellungID = @bestellnummer));
						PRINT N'Der Artikel mit der Bestellnummer -> '+ CAST(@bestellnummer AS VARCHAR)+ CHAR(13)+
						      'besitztz neu den Status: '+@status;
					END
				ELSE
					BEGIN
						PRINT N'Falsche EIngaben';
					END
				
			END
	END
ELSE
	BEGIN
		PRINT N'Es existiert keine Bestellung mit der Nummer -> '+CAST(@bestellnummer AS VARCHAR)+' <-';
	END