USE [INF2D_Alpha1_Shop];

DECLARE @default INT;
SET @default = (SELECT AktionID FROM Aktion WHERE Name = '0%');

insert into Unterkategorie (KategorieID, Name, AktionID) values ((Select KategorieID from Kategorie where name = 'Audio') , 'Heimkino', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values ((Select KategorieID from Kategorie where name = 'Audio'), 'Radio', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (2, '3D', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (2, 'Scanner', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (3, 'Game', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (3, 'Spielkonsole', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (4, 'Druckserver', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (4, 'Modem', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (4, 'Firewall', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (5, 'Betriebssysteme', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (5, 'Büroanwendungen', @default);
insert into Unterkategorie (KategorieID, Name, AktionID) values (5, 'Sicherheit', @default);

