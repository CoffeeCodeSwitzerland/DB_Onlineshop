USE [INF2D_Alpha1_Shop];

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
SELECT k.Name AS 'Kategorie', AVG(b.Preis) AS 'Durchschnittsumsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID, k.Name
			ORDER BY AVG(b.Preis) DESC;
		
/* Durchschnittsumsatz pro Unterkategorie */
SELECT u.Name AS 'Unterkategorie', AVG(b.Preis) AS 'Durchschnittsumsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
		GROUP BY a.UnterkategorieID, u.Name
			ORDER BY AVG(b.Preis) DESC;

/* Durchschnittsumsatz pro Artikel */
SELECT a.Name AS 'Artikel', AVG(b.Preis) AS 'Durchschnittsumsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID, a.Name
			ORDER BY AVG(b.Preis) DESC;
	



	
	
/* Gesamtumsatz pro Unterkategorie einer Kategorie */
SELECT u.Name AS 'Unterkategorie', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		WHERE k.Name = 'Software'
			GROUP BY a.UnterkategorieID, u.Name
				ORDER BY SUM(b.Preis) DESC;

/* Gesamtumsatz pro Artikel einer Kategorie */		
SELECT a.Name AS 'Artikel', SUM(b.Preis) AS 'Umsatz' FROM Bestellung AS b
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
