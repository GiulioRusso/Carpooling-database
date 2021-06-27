USE BlaBlaCar;
-- Utente visitatore

-- 1  Si visualizzino tutti i conducenti
SELECT * 
FROM Conducente;

-- 2 Si visualizzino tutti i passaggi
SELECT *
FROM Passaggio;

-- 3 Si visualizzino i pass
SELECT *
FROM Pass;

-- 3 Si visualizzino le assicurazioni
SELECT *
FROM Assicurazione;

-- 4 Si visualizzio il numero di passaggio offerti da ogni conducente
SELECT P.codConducente, U.nome, U.cognome, idPassaggio, COUNT(P.idPassaggio) AS NumPassaggi
FROM Passaggio P, Utente U
WHERE P.codUtente=U.CF
GROUP BY P.codConducente;

-- 5 Si visualizzino per conducente tutti i passaggi offerti
SELECT P.codConducente, U.nome, U.cognome, idPassaggio
FROM Passaggio P, Utente U
WHERE P.codUtente=U.CF
GROUP BY P.codConducente;

-- 6 Si visualizzino i CF dell'utente X 
SELECT U.nome, U.cognome, U.CF
FROM Utente U
WHERE U.nome='Nome_X' AND U.cognome='Cognome_X';

-- 7 Si visualizzino i conducenti che hanno il nome che inizia per 'X' e il cognome che inizia per 'Y'
SELECT U.nome, U.cognome
FROM Utente U, Conducente C
WHERE U.CF=C.codUtente AND U.nome LIKE 'X%' AND U.cognome LIKE 'Y%';


-- Utente Passeggero

-- 1 Si visualizzi la tratta per il passaggio X-Y il cui conducente è Z W
SELECT T.DescrizionePercorso, U.nome, U.cognome, P.LuogoPartenza, P.LuogoArrivo
FROM Tratta T, Passaggio P, Utente U
WHERE T.codPassaggio=P.idPassaggio AND T.codConducente=P.codConducente 
AND U.nome='Z' AND U.cognome= 'W' AND P.LuogoPartenza='X' AND P.LuogoArrivo='Y';

-- 2 Si visualizzino nome e cognome dei conducenti che offrono la possibilità di fumare e i relativi passaggi con luogo di partenza e arrivo
SELECT P.idPassaggio, U.nome, U.cognome, P.LuogoPartenza, P.LuogoArrivo
FROM Preferenze R, Passaggio P, Utente U
WHERE R.codPassaggio=P.idPassaggio AND P.codUtente=U.CF
AND R.Fumo='Si';

-- 3 Selezionare i conducenti che hanno inserito la preferenza loquacita 'BlaBlaBla'
SELECT  U.nome, U.cognome
FROM Preferenze p, Utente u
WHERE U.cf=P.codUtente
AND p.Loquacita='BlaBlaBla';

-- 4 Si visualizzi nome e cognome dei passeggeri che hanno il pass mensile
SELECT P.idPasseggero, U.nome, U.cognome
FROM Pass S, Passeggero P, Utente U
WHERE S.codPasseggero=P.idPasseggero AND P.codUtente=U.CF
AND S.Durata='Mensile';

-- 5 Si visualizzino i conducenti con feedback mediocre
SELECT codConducente, U.nome, U.cognome
FROM Gestione_Feedback G, Feedback F, Utente U, Conducente C
WHERE F.Giudizio='Mediocre' AND G.FeedbackAlCond=F.idFeedback 
AND G.codConducente=C.idConducente AND C.codUtente=U.CF;

-- 6 Si visualizzino i passeggeri con feedback mediocre
SELECT codPasseggero, U.nome, U.cognome
FROM Gestione_Feedback G, Feedback F, Utente U, Passeggero P
WHERE F.Giudizio='Eccellente' AND G.FeedbackAlPass=F.idFeedback 
AND G.codPasseggero=P.idPasseggero AND P.codUtente=U.CF;

-- Utente Conducente

-- Visuliazzare conducenti che non hanno auto blu
SELECT C.idConducente, U.nome, U.cognome
FROM Utente U, Conducente C, Autovettura A
WHERE U.CF=C.codUtente AND C.idConducente=A.codConducente 
AND C.idConducente NOT IN (
			SELECT A1.codConducente
			FROM Autovettura A1
			WHERE A1.Colore='Blu');


-- Visualizzare conducenti con auto con 2 posti
SELECT C.idConducente, U.nome, U.cognome
FROM Utente U, Conducente C, Autovettura A
WHERE U.CF=C.codUtente AND C.idConducente=A.codConducente 
AND A.NumeroPosti=2;


-- Visualizzare conducenti con bmw
SELECT C.idConducente, U.nome, U.cognome
FROM Utente U, Conducente C, Autovettura A
WHERE U.CF=C.codUtente AND C.idConducente=A.codConducente 
AND A.Marca='BMW';

-- Visualizzare conducenti che fanno anche il ritorno
SELECT C.idConducente, U.nome, U.cognome
FROM Passaggio P, Conducente C, Utente U
WHERE P.codConducente=C.idConducente AND C.codUtente=U.CF 
AND P.Ritorno='Si';

-- Visualizzare i proprietari di auto coupe che permettono di trasportare animali domestici 
SELECT C.idConducente, U.nome, U.cognome
FROM Autovettura A, Conducente C, Utente U, Passaggio P, Preferenze R
WHERE U.CF=C.codUtente AND C.idConducente=A.codConducente 
AND C.idConducente=P.codConducente AND P.idPassaggio=R.codPassaggio
AND A.Tipo='coupe' AND R.AnimaliDomestici='Si';

-- Visualizzare i conducenti col massimo numero di posti disponibili
SELECT  U.nome, U.cognome
FROM Utente U, Passaggio P
WHERE  U.CF=P.codUtente
AND P.NumPosti=(
		SELECT MAX(NumPosti)
		FROM Passaggio 
		);