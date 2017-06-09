# DB_Onlineshop
SQL-Database for school project
Developed in order of gibb school in Bern, Switzerland.    
Contact: Michael Abplanalp

## Product description
This database is a project at school where we're learning to create a database   
for a client. It's like a contest, because two groups have the same database project.

## Developer Team
- Tim d'Amato							(issues) {unknown}
- Tobias Rüedi							(issues) rueedi.tobias@gmail.com
- [Frithjof Hoppe](https://github.com/frithjofhoppe)								(issues) frithjof.hoppe@icloud.com
- [Javier Martinez Alvarez](https://github.com/javi36)								(issues) jmartinezalvarez0@gmail.com
- [Philippe Krüttli](https://github.com/kruettlip) 								(issues) philippe.kruettli@gmx.ch

## SELECT | INSERT | UPDATE
- **IV:**   Previous purchases should be viewable (needed for warranty).    
            `TABLES: _Bestellung, Artikel, Kunde_ `    
- **V:**    Clients can rate articles they've already bought.    
            `TABLES: _Bewertung, Artikel, Kunde_ `       
- **VI:**   Prices can be updated easily per category (dicounts).    
            `TABLES: _Unterkategorie (attribute: AktionID)_ `        
- **VII:**  Each order has a state (ordered, in process, delivered).    
            `TABLES: _Bestellung, Artikel, Kunde_ `         
- **VIII:** The shop owner can query the sales sorted and ordered by:    
   * *MAX (Category, Subcategory, Article)*    
   * *MIN (Category, Subcategory, Article)*    
   * *AVG (Category, Subcategory, Article)*    
   * *Categories (Subcategory, Article)*    
   * *Clientgroup (Category, Subcategory, Article)*    
            `TABLES: *Bestellung, Artikel, Kunde*`        

## Releases
12.06.2017			V0.1	Delivery at school (full ERD and ERM)    
