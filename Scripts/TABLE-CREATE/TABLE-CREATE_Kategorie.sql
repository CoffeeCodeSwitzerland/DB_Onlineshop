USE [INF2D_Alpha1_Shop];

CREATE TABLE Kategorie
(
    KategorieID     integer Identity (1,1) not null
    Name    nvarchar(50) not null,
    constraint PK_Kategorie Primary KEY,
)