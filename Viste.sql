-- UtenteVisitatore
-- Vista dei dati dei conducenti con il loro livello di esperienza
CREATE VIEW DatiConducenti(IdConducente,nome,cognome,email,LivelloEsperienza) AS
SELECT c.idConducente,u.nome,u.cognome,u.email,c.LivelloEsperienza
FROM Conducente c JOIN  Utente u ON u.CF=c.codUtente;

-- Vista dei passaggi disponibili con i dati dei conducenti
CREATE VIEW VisualizzazionePassaggio(nome,cognome,LivelloEsperienza,LuogoPartenza,LuogoArrivo,Ritorno,PrezzoRichiesto) AS
SELECT u.nome,u.cognome,c.LivelloEsperienza,p.LuogoPartenza,p.LuogoArrivo,p.Ritorno,P.PrezzoRichiesto
FROM Conducente c,Passaggio p,Utente u 
WHERE u.CF=c.codUtente AND p.codConducente=c.IdConducente;

-- UtentePasseggero

-- Vista dei dati del Passaggio e delle Preferenze del giorno corrente
CREATE VIEW PassaggiOdierniDisponibili (LuogoPartenza,LuogoArrivo,DataOra,NumPosti,Prezzo,Musica,Loquacita,Fumo,AnimaliDomestici) AS
SELECT p.LuogoPartenza,p.LuogoArrivo,p.DataOra,p.NumPosti,p.PrezzoRichiesto,pr.Musica,pr.Loquacita,pr.Fumo,pr.AnimaliDomestici
FROM Passaggio p, Preferenze pr
WHERE p.IdPassaggio=pr.codPassaggio
AND p.dataOra=current_date();

-- Vista dei dati del conducente e del passaggio che prevedono tappe Intermedie
CREATE VIEW PassaggiConTappeIntermedie(nome,cognome,luogoPartenza,LuogoArrivo,NumPosti,Prezzorichiesto,TappeIntermedie,DescrizionePercorso) AS
 SELECT U.nome,U.cognome,P.luogoPartenza,P.LuogoArrivo,P.NumPosti,p.Prezzorichiesto,t.TappeIntermedie,t.DescrizionePercorso
 FROM utente u,Passaggio p,Tratta t
 WHERE u.CF=p.CodUtente AND p.IdPassaggio=t.codPassaggio
 AND t.tappeIntermedie='Si';

-- Vista dei vantaggi offerti dal Pass con il suo Prezzo
CREATE VIEW VantaggiPass(durata,prezzo,vantaggi) AS
SELECT durata,Prezzo,Vantaggi
FROM pass
GROUP BY  DURATA;

-- UtenteConducente
-- Vista delle auto che ogni conducente(ordinato in maniera alfabetica) ha registrato 
CREATE VIEW AutoConducenti(nome,cognome,dataImmatricolazione,numeroPosti,targa,tipo,colore,marca) AS 
SELECT u.nome,u.cognome,a.dataImmatricolazione,a.numeroPosti,a.targa,a.tipo,a.colore,a.marca
FROM Utente u,Autovettura a
WHERE u.CF=a.codUtente
ORDER BY U.COGNOME,U.nome;