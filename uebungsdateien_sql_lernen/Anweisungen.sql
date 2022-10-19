/*
   Anweisungen aus dem Kurs 'SQL lernen'
*/

-- Mit DB Browser arbeiten
SELECT * FROM Personen;
SELECT Vorname FROM Personen;

-- Daten abfragen
SELECT 'Hallo Welt!';
SELECT Vorname FROM Personen;
SELECT 'Vorname' FROM Personen;
SELECT Nachname FROM Personen;
SELECT Nachname, Vorname FROM Personen;
SELECT * FROM Personen;
SELECT Vorname, Nachname, Firma FROM Personen;
SELECT Firma, Vorname, Quizpunkte FROM Personen;

-- Abfragen präzisieren
SELECT * FROM Personen WHERE Staat='CA';
SELECT * FROM Personen WHERE Staat='FL';
SELECT * FROM Personen WHERE Staat='WA';
SELECT * FROM Personen WHERE Staat='NY';
SELECT * FROM Personen WHERE Shirt_oder_Hut='NY';
SELECT * FROM Personen WHERE Shirt_oder_Hut='Hut';
SELECT Vorname, Nachname FROM Personen WHERE Shirt_oder_Hut='Shirt';
SELECT Vorname, Nachname, Shirt_oder_Hut FROM Personen WHERE Shirt_oder_Hut='Shirt';
SELECT Vorname, Nachname, Shirt_oder_Hut WHERE Shirt_oder_Hut='Shirt' FROM Personen; -- Hinweis: Diese Anweisung ist ungültig.

-- Mehrere Bedingungen formulieren
SELECT Vorname, Nachname FROM Personen WHERE Staat='CA' AND Shirt_oder_Hut='Shirt';
SELECT Vorname, Nachname, Team FROM Personen WHERE Staat='CA' AND Shirt_oder_Hut='Shirt' AND Team='blau';
SELECT Vorname, Nachname, Team FROM Personen WHERE Staat='CA' AND Shirt_oder_Hut='Shirt' AND Team IS 'blau';
SELECT Vorname, Nachname, Team FROM Personen WHERE Staat='CA' AND Shirt_oder_Hut='Shirt' AND Team IS NOT 'blau';
SELECT Vorname, Nachname, Team FROM Personen WHERE Staat='CA' AND Shirt_oder_Hut='Shirt' AND Team != 'blau';
SELECT Vorname, Nachname FROM Personen WHERE Staat='CA' OR Staat='CO' AND Shirt_oder_Hut='Shirt';
SELECT Vorname, Nachname, Shirt_oder_Hut, Staat FROM Personen WHERE (Staat='CA' OR Staat='CO') AND Shirt_oder_Hut='Shirt';

-- Bedingungen einschränken
SELECT Vorname, Nachname, Staat FROM Personen WHERE Staat LIKE 'C%';
SELECT Vorname, Nachname, Staat FROM Personen WHERE Staat LIKE 'N%';
SELECT Vorname, Nachname, Staat FROM Personen WHERE Staat LIKE '%N';
SELECT Vorname, Nachname, Staat FROM Personen WHERE Vorname LIKE 'A%';
SELECT Vorname, Nachname, Staat FROM Personen WHERE Vorname LIKE 'J%';
SELECT Vorname, Nachname, Staat FROM Personen WHERE Vorname LIKE '%J%';
SELECT Vorname, Nachname, Staat, Firma FROM Personen WHERE Firma LIKE '%LLC';
SELECT Vorname, Nachname, Staat, Firma FROM Personen WHERE Firma LIKE '%LLC' LIMIT 5;
SELECT Vorname, Nachname, Staat, Firma FROM Personen WHERE Firma LIKE '%LLC' LIMIT 10;
SELECT Vorname, Nachname, Staat, Firma FROM Personen WHERE Firma LIKE '%LLC' LIMIT 10 OFFSET 5;

-- Ergebnisse sortieren
SELECT Vorname, Nachname FROM Personen;
SELECT Vorname, Nachname FROM Personen ORDER BY Vorname;
SELECT Vorname, Nachname FROM Personen ORDER BY Vorname ASC;
SELECT Vorname, Nachname FROM Personen ORDER BY Vorname DESC;
SELECT Staat, Nachname, Vorname FROM Personen ORDER BY Staat ASC, Nachname ASC;
SELECT Staat, Nachname, Vorname FROM Personen ORDER BY Staat ASC, Nachname DESC;

-- Ergebnisdaten auswerten
SELECT Vorname FROM Personen;
SELECT Vorname, LENGTH(Vorname) FROM Personen;
SELECT DISTINCT(Vorname) FROM Personen;
SELECT DISTINCT(Vorname) FROM Personen ORDER BY Vorname;
SELECT DISTINCT(Shirt_oder_Hut) FROM Personen;
SELECT COUNT(*) FROM Personen WHERE Staat='CA';

-- Eine Verbindung zwischen zwei Tabellen herstellen
SELECT Vorname, Staat FROM Personen;
SELECT Vorname, Staat FROM Personen JOIN Bundesstaaten;
SELECT Vorname, Staat FROM Personen JOIN Bundesstaaten ON Personen.Staat=Bundesstaaten.Kurzform;
SELECT Personen.Vorname, Personen.Staat, Bundesstaaten.Unterregion FROM Personen JOIN Bundesstaaten ON Personen.Staat=Bundesstaaten.Kurzform;
SELECT * FROM Personen JOIN Bundesstaaten ON Personen.Staat=Bundesstaaten.Kurzform;
SELECT * FROM Personen JOIN Bundesstaaten ON Personen.Staat=Bundesstaaten.Kurzform WHERE Personen.Vorname LIKE 'j%' AND Bundesstaaten.Region='South';

-- Verschiedene JOIN-Typen kennenlernen – die Praxis
SELECT Personen.Vorname, Personen.Nachname, Personen.Staat, Bundesstaaten.Staat_Name FROM Personen JOIN Bundesstaaten ON Personen.Staat=Bundesstaaten.Kurzform;
SELECT Personen.Vorname, Personen.Nachname, Personen.Staat, Bundesstaaten.Staat_Name FROM Bundesstaaten LEFT JOIN Personen ON Personen.Staat=Bundesstaaten.Kurzform;
SELECT DISTINCT(Personen.Staat), Bundesstaaten.Kurzform FROM Bundesstaaten LEFT JOIN Personen ON Personen.Staat=Bundesstaaten.Kurzform ORDER BY Personen.Staat;

-- Abfrageergebnisse gruppieren
SELECT Vorname, COUNT(Vorname) FROM Personen;
SELECT Vorname, COUNT(Vorname) FROM Personen GROUP BY Vorname;
SELECT Vorname, COUNT(Nachname)FROM Personen GROUP BY Nachname;
SELECT Nachname, COUNT(Nachname) FROM Personen GROUP BY Nachname;
SELECT Staat, COUNT(Staat) FROM Personen GROUP BY Staat;
SELECT Staat, Quizpunkte, COUNT(Quizpunkte) FROM Personen GROUP BY Quizpunkte;
SELECT Staat, Quizpunkte, COUNT(Quizpunkte) FROM Personen GROUP BY Staat, Quizpunkte;

-- Mit mathematischen und logischen Operatoren rechnen
SELECT 4+2;
SELECT 1/3;
SELECT 1/3.0;
SELECT 3>2;
SELECT 2>3;
SELECT 5!=3;
SELECT Vorname, Quizpunkte FROM Personen WHERE Quizpunkte > 70;
SELECT Vorname, Quizpunkte FROM Personen WHERE Quizpunkte >= 70;

-- Mit Funktionen rechnen
SELECT MAX(Quizpunkte), MIN(Quizpunkte) FROM Personen;
SELECT SUM(Quizpunkte) FROM Personen;
SELECT Team, COUNT(*), SUM(Quizpunkte), (SUM(Quizpunkte)/COUNT(*)) AS Durchschnitt FROM Personen GROUP BY Team;

-- Zwei SELECT-Anweisungen verschachteln
SELECCT Vorname, Nachname, Quizpunkte FROM Personen WHERE Quizpunkte=max(quizpunkte); -- Hinweis: Diese Anweisung ist ungültig.
SELECT Vorname, Nachname, Quizpunkte FROM Personen WHERE Quizpunkte=(SELECT max(quizpunkte) FROM Personen);
SELECT * FROM Personen WHERE Staat=(SELECT Kurzform FROM Bundesstaaten WHERE Staat_Name='Minnesota');

-- Groß-/Kleinschreibung im Abfrageergebnis ändern
SELECT Vorname, Nachname FROM Personen;
SELECT LOWER(Vorname), UPPER(Nachname) FROM Personen;

-- Text im Abfrageergebnis ändern
SELECT Unterregion FROM Bundesstaaten; 
SELECT SUBSTR(Unterregion, 1, 5) FROM Bundesstaaten; 
SELECT SUBSTR(Unterregion, 2, 10) FROM Bundesstaaten;
SELECT SUBSTR(Firma, -3) FROM Personen;
SELECT SUBSTR(Firma, -3), REPLACE(Firma, 'LLC', 'GmbH') FROM Personen;

-- Datenformat im Abfrageergebnis ändern
SELECT Quizpunkte FROM Personen ORDER BY Quizpunkte;
SELECT Quizpunkte FROM Personen ORDER BY CAST(Quizpunkte AS char);
SELECT MAX(Quizpunkte) FROM Personen
SELECT MAX(CAST(Quizpunkte AS CHAR)) FROM Personen;
SELECT MAX(CAST(Quizpunkte AS INT)) FROM Personen;

-- Aliasnamen für Ergebnisfelder definieren
SELECT Vorname, Nachname, Shirt_oder_Hut FROM Personen;
SELECT Vorname, Nachname, UPPER(Shirt_oder_Hut) FROM Personen;
SELECT Vorname, Nachname, UPPER(Shirt_oder_Hut) AS Gewinn FROM Personen;

-- Datensätze hinzufügen
INSERT INTO Personen (Vorname) VALUES ('Bob');
SELECT * FROM Personen;
INSERT INTO Personen (Vorname, Nachname, Staat, Stadt, Shirt_oder_Hut) VALUES ('Mary', 'Hamilton', 'OR', 'Portland', 'Hut');
SELECT * FROM Personen;
INSERT INTO Personen (Vorname, Nachname) VALUES ('George', 'White'), ('Jenn', 'Smith'), ('Carol', 'Anderson');
SELECT * FROM Personen;

-- Datensätze bearbeiten
SELECT * FROM Personen;
UPDATE Personen SET Vorname='Martha' WHERE Vorname='George' AND Nachname='White';
SELECT * FROM Personen;
SELECT * FROM Personen WHERE Firma='Fisher LLC';
UPDATE Personen SET Firma='MegaCorp Inc' WHERE Firma='Fisher LLC';
SELECT * FROM Personen WHERE Firma='Fisher LLC';
SELECT * FROM Personen WHERE Firma='MegaCorp Inc';

-- Datensätze löschen
SELECT * FROM Personen;
SELECT * FROM Personen WHERE Vorname='Martha' AND Nachname='White';
DELETE FROM Personen WHERE Vorname='Martha' AND Nachname='White' AND Stadt IS NULL;
SELECT * FROM Personen;
DELETE FROM Personen WHERE ID IS NULL;
SELECT * FROM Personen;
