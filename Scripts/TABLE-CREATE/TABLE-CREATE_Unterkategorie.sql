USE [INF2D_Alpha1_Shop];

CREATE TABLE Unterkategorie
(
    UnterkategorieID    integer Identity (1,1) not null
	KategorieID int not null,
    Name    nvarchar(50)	not null,
	Status nvarchar(50) not NUll,
	Constraint KategorieID Foreign Key (KategorienFK)
	References 	KategorienID (ID) on Update cascade	not null,
	constraint PK_Unterkategorie Primary KEY,
)	
