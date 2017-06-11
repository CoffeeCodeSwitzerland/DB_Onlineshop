/*-----------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------Sollte stimmen...---------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------*/

/* Kategorie mit grösstem Umsatz ausgeben */
SELECT k.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
	GROUP BY u.KategorieID;

/* Unterkategorie mit grösstem Umsatz ausgeben */
SELECT u.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	GROUP BY a.UnterkategorieID;

/* Artikel mit grösstem Umsatz ausgeben */
SELECT a.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	GROUP BY b.ArtikelID;
	


	

	
/* Kategorie mit kleinstem Umsatz ausgeben */
SELECT k.Name, MIN(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID;

/* Unterkategorie mit kleinstem Umsatz ausgeben */
SELECT u.Name, MIN(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
		GROUP BY a.UnterkategorieID;

/* Artikel mit kleinstem Umsatz ausgeben */
SELECT a.Name, MIN(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID;
	

	


	
/* Durchschnittsumsatz pro Kategorie */
SELECT k.Name, AVG(b.Preis) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS z ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID
			ORDER BY AVG(b.Preis) DESC;
		
/* Durchschnittsumsatz pro Unterkategorie */
SELECT u.Name, AVG(b.Preis) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS z ON u.UnterkategorieID = a.UnterkategorieID
		GROUP BY a.UnterkategorieID
			ORDER BY AVG(b.Preis) DESC;

/* Durchschnittsumsatz pro Artikel */
SELECT a.Name, AVG(b.Preis) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID
			ORDER BY AVG(b.Preis) DESC;
	



	
	
/* Gesamtumsatz pro Unterkategorie einer Kategorie */
SELECT u.Name, SUM(b.Preis) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY a.UnterkategorieID
			ORDER BY SUM(b.Preis) DESC
				WHERE k.Name = "";

/* Gesamtumsatz pro Artikel einer Kategorie */		
SELECT u.Name, SUM(b.Preis) FROM Bestellung AS b
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = a.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY b.ArtikelID
			ORDER BY SUM(b.Preis) DESC
				WHERE k.Name = "";	
	



	
	
/* Beliebteste Kategorie einer Kundengruppe */
SELECT k.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID
			WHERE kg.Name = "";

/* Beliebteste Unterkategorie einer Kundengruppe */
SELECT u.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
		GROUP BY a.UnterkategorieID;
			WHERE kg.Name = "";

/* Beliebtester Artikel einer Kundengruppe */
SELECT a.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID;
			WHERE kg.Name = "";
	



	
	
/* Bester Kunde */
SELECT ku.Vorname, ku.Nachname, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
		GROUP BY b.KundeID;

/* Beste Kundengruppe */
SELECT kg.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Kunde AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
		GROUP BY ku.KundengruppeID;



	
/* Beliebteste Kategorie eines Kunden */
SELECT a.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
	JOIN Kategorie AS k ON k.KategorieID = u.KategorieID
		GROUP BY u.KategorieID;
			WHERE ku.Vorname = "" AND ku.Nachname = "";		

/* Beliebteste Unterkategorie eines Kunden */
SELECT a.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
	JOIN Unterkategorie AS u ON u.UnterkategorieID = u.UnterkategorieID
		GROUP BY a.UnterkategorieID;
			WHERE ku.Vorname = "" AND ku.Nachname = "";			

/* Beliebtester Artikel eines Kunden */	
SELECT a.Name, MAX(SUM(b.Preis)) FROM Bestellung AS b
	JOIN Kunden AS ku ON ku.KundeID = b.KundeID
	JOIN Kundengruppe AS kg ON kg.KundengruppeID = ku.KundengruppeID
	JOIN Artikel AS a ON a.ArtikelID = b.ArtikelID
		GROUP BY b.ArtikelID;
			WHERE ku.Vorname = "" AND ku.Nachname = "";		


/*-----------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------*/											