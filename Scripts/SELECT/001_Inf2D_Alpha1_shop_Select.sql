USE [INF2D_Alpha1_Shop]

--Select V
Select k.Vorname, k.Nachname, a.Name as Artikel_Name, a.Beschreibung as Artikel_Beschreibung,  b.Kommentar from Bewertung as b
inner join Artikel as a on a.ArtikelID = b.ArtikelID
inner join Kunde as k on k.KundeID = b.KundeID;