CREATE KEYSPACE elections
    WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE administre(
	Nom_A text PRIMARY KEY,
	Prenom_A text,
	Adresse text,
	NIN varint
);

CREATE TABLE candidat(
	Nom_P text PRIMARY KEY,
	Prenom_P text,
	Partie_politique
);

CREATE TABLE Vote (
Nom_A text,
Nom_P text,
PRIMARY KEY(Nom_A, Nom_P)
);

ALTER TABLE Candidat ADD nbr_vote int;

INSERT INTO Candidat (Nom_P , Prenom_P , Partie_politique , nbr_vote )
VALUES ('toto1' , 'tot' , 'A' , 42 );
INSERT INTO Candidat (Nom_P , Prenom_P , Partie_politique , nbr_vote )
VALUES ('titi' , 'tot3' , 'B' , 23 );
INSERT INTO Candidat (Nom_P , Prenom_P , Partie_politique , nbr_vote )
VALUES ('popo' , 'toty' , 'B' , 32 );
INSERT INTO Candidat (Nom_P , Prenom_P , Partie_politique , nbr_vote )
VALUES ('totu' , 'tot3' , 'C' , 26 );


#Question
#1) Quel parti politique a réuni le plus de voix ?

#resultat pour le parti A
SELECT SUM(nbr_vote), Partie_politique FROM candidat WHERE Partie_politique= 'A' ALLOW FILTERING;

#resultat pour le parti B
SELECT SUM(nbr_vote), Partie_politique FROM candidat WHERE Partie_politique= 'B' ALLOW FILTERING;

#resultat pour le parti C
SELECT SUM(nbr_vote), Partie_politique FROM candidat WHERE Partie_politique= 'C' ALLOW FILTERING;

#2)Quel candidat a gagné les elections ? 

SELECT max(nbr_vote), Partie_politique, Nom_P, Prenom_P FROM candidat;

#3) Le candidat ayant gagné les elections vient-il du parti politique ayant eu la majorité des voix ? 


  