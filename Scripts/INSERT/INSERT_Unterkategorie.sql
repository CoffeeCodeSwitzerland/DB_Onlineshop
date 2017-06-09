USE [INF2D_Alpha1_Shop];

insert into Unterkategorie (KategorieID, Name, Status) values ((Select KatergorieID from Kategorie where name = "Audio") , "Heimkino", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values ((Select KatergorieID from Kategorie where name = "Audio"), "Radio", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values ((Select KatergorieID from Kategorie where name = ""), "3D", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values (2, "Scanner", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values (3, "Game", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values (3, "Spielkonsole", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values (4, "Druckserver", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values (4, "Modem", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values (4, "Firewall", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values (5, "Betriebssysteme", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values (5, "Büroanwendungen", "Verfügbar");
insert into Unterkategorie (KategorieID, Name, Status) values (5, "Sicherheit", "Verfügbar");