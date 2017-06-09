USE [INF2D_Alpha1_Shop]

CREATE TABLE Kundengruppe(  KundengruppeID bigint identity(1,1) NOT NULL CONSTRAINT PK_KundengruppeID PRIMARY KEY, 
                            Name nvarchar(50) NOT NULL, 
                            RabattFaktor float NOT NULL
                         )