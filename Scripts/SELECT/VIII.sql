/*-----------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------Sollte stimmen...---------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------*/

/* Kategorie mit grösstem Umsatz ausgeben */
SELECT k.Name AS 'Kategorie mit grösstem Umsatz', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
	GROUP BY u.KategorieID;

/* Unterkategorie mit grösstem Umsatz ausgeben */
SELECT u.Name AS 'Unterkategorie mit grösstem Umsatz', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	GROUP BY a.UnterkategorieID;

/* Artikel mit grösstem Umsatz ausgeben */
SELECT a.Name AS 'Artikel mit grösstem Umsatz', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	GROUP BY b.ArtikelID;
	


	

	
/* Kategorie mit kleinstem Umsatz ausgeben */
SELECT k.Name AS 'Kategorie mit kleinstem Umsatz', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID;

/* Unterkategorie mit kleinstem Umsatz ausgeben */
SELECT u.Name AS 'Unterkategorie mit kleinstem Umsatz', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
		GROUP BY a.UnterkategorieID;

/* Artikel mit kleinstem Umsatz ausgeben */
SELECT a.Name AS 'Artikel mit kleinstem Umsatz', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID;
	

	


	
/* Durchschnittsumsatz pro Kategorie */
SELECT k.Name AS 'Kategorie', AVG(b.Preis) AS 'Durchschnittsumsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS z ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID
			ORDER BY AVG(b.Preis) DESC;
		
/* Durchschnittsumsatz pro Unterkategorie */
SELECT u.Name AS 'Unterkategorie', AVG(b.Preis) AS 'Durchschnittsumsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS z ON u.UnterkategorieID = a.UnterkategorieID
		GROUP BY a.UnterkategorieID
			ORDER BY AVG(b.Preis) DESC;

/* Durchschnittsumsatz pro Artikel */
SELECT a.Name AS 'Artikel', AVG(b.Preis) AS 'Durchschnittsumsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID
			ORDER BY AVG(b.Preis) DESC;
	



	
	
/* Gesamtumsatz pro Unterkategorie einer Kategorie */
SELECT u.Name AS 'Unterkategorie', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY a.UnterkategorieID
			ORDER BY SUM(b.Preis) DESC
				WHERE k.Name = "";

/* Gesamtumsatz pro Artikel einer Kategorie */		
SELECT a.Name AS 'Artikel', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY b.ArtikelID
			ORDER BY SUM(b.Preis) DESC
				WHERE k.Name = "";	
	



	
	
/* Beliebteste Kategorie einer Kundengruppe */
SELECT k.Name AS 'Kategorie', MAX(SUM(b.Preis)) AS 'Umsatz in Kundengruppe' FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID
			WHERE kg.Name = "";

/* Beliebteste Unterkategorie einer Kundengruppe */
SELECT u.Name AS 'Unterkategorie', MAX(SUM(b.Preis)) AS 'Umsatz in Kundengruppe' FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
		GROUP BY a.UnterkategorieID;
			WHERE kg.Name = "";

/* Beliebtester Artikel einer Kundengruppe */
SELECT a.Name AS 'Artikel', MAX(SUM(b.Preis)) AS 'Umsatz in Kundengruppe' FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID;
			WHERE kg.Name = "";
	



	
	
/* Bester Kunde */
SELECT ku.Vorname AS 'Vorname', ku.Nachname AS 'Nachname', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
		GROUP BY b.KundeID;

/* Beste Kundengruppe */
SELECT kg.Name AS 'Kundengruppe', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
		GROUP BY ku.KundengruppeID;



	
/* Beliebteste Kategorie eines Kunden */
SELECT ku.Vorname AS 'Vorname', ku.Nachname AS 'Nachname', k.Name AS 'Kategorie', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID;
			WHERE ku.Vorname = "" AND ku.Nachname = "";		

/* Beliebteste Unterkategorie eines Kunden */
SELECT ku.Vorname AS 'Vorname', ku.Nachname AS 'Nachname', u.Name AS 'Unterkategorie', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
		GROUP BY a.UnterkategorieID;
			WHERE ku.Vorname = "" AND ku.Nachname = "";			

/* Beliebtester Artikel eines Kunden */	
SELECT ku.Vorname AS 'Vorname', ku.Nachname AS 'Nachname', a.Name AS 'Artikel', MAX(SUM(b.Preis)) AS 'Umsatz' FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID;
			WHERE ku.Vorname = "" AND ku.Nachname = "";		


/*-----------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------*/											