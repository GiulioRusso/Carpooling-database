USE BlaBlaCar;
 INSERT INTO Assicurazione VALUES ('1','In caso di incidente stradale avrai diritto a ricevere assistenza legale telefonica e ad una copertura delle spese legali legate all’incidente fino ad un massimo/limite di 10.000 Euro per:
Richieste di risarcimento per danni subiti,Controversie contro la propria RC Auto per la gestione di sinistri legati ad incidente stradale, Ricorso contro la sanzione amministrativa di ritiro o sospensione patente.','Copertura garantita in caso di impossibilità di utilizzare il veicolo per guasto meccanico, incidente, atti di vandalismo, incendio, furto o tentato furto, gomma forata, batteria scarica, esaurimento del carburante, malessere del conducente. Tutte le persone che viaggiano sul veicolo sono coperte.','La spedizione degli oggetti personali dimenticati dal passeggero a bordo dell auto del conducente sono coperti dall assicurazione.
Per saperne di più, scopri le condizioni generali e l appendice informativa privacy 
Se hai bisogno di assistenza o di fare un reclamo, puoi contattare AXA al numero 800 178459 o 06 42115434.');

INSERT INTO utente VALUES 
('AB1','Aldo','Bruno','ab@gmail.com','325368899','48.00','1'),
('GB2','Gianni','Barba','gb@live.it','31145457',30,'1'),
('AV11','Alibbabba','Val','av@hotmail.com','35222186',1,'1'),
('LM3','Lele','Mora','lm@live.it','32598874',20,'1'),
('VT4','Vins','Torre','vt@gmail.com','38946879',12,'1'),
('VA5','Vera','Alia','va@libero.it','32145629',80,'1'),
('RJ6','Rosalia','Jack','rj@live.it','33366554',89,'1'),
('Rb7','Remo','Barca','rm8@live.it','36698762',37,'1'),
('MR8','Maria','Ria','mria@live.it','32145645',102,'1'),
('GB9','Gianna','Ble','gble@gmil.com','36542698',250,'1'),
('SF10','Sefe','Fese','sfsfs@live.it','36984692',620,'1');

INSERT INTO Passeggero VALUES
(01,'AB1',1),
(02,'GB2',1),
(03,'LM3',1),
(04,'VT4',1),
(05,'AV11',1),
(06,'SF10',1);

INSERT INTO Conducente VALUES
(01,'Esperto',5,'SF10'),
(02,'Apprendista',2,'GB9'),
(03,'Principiante',1,'MR8'),
(04,'Principiante',1,'RB7'),
(05,'Intenditore',3,'RJ6'),
(06,'Ambasciatore',8,'VA5');

INSERT INTO Autovettura VALUES
(01,'2015-02-15',4,'AX145FG','Station-wagon','Volvo','blu',01,'SF10'),
(02,'2014-03-04',2,'PL354WE','Coupe','Citroen','Verde',02,'GB9'),
(03,'2017-03-03',4,'AS478WE','Coupe','Fiat','Rossa',04,'RB7'),
(04,'2009-10-06',3,'AA899WE','Berlina','BMW','Blu',05,'RJ6'),
(05,'2001-03-04',1,'TR985AA','Berlina','BMW','Rossa',06,'VA5'),
(06,'2008-01-06',6,'AF321NM','Suv','Jeep','Bianco',03,'MR8'),
(07,'2017-10-23',4,'DF579LM','Suv','Mercedes','Blu',01,'SF10');

INSERT INTO Pass VALUES
(01,'Settimanale','20','Per tutto il periodo di validità, di prenotare tutti i viaggi che vuoi senza pagare commissioni su ogni singolo posto prenotato.',05,'AV11'),
(02,'Mensile','50','Per tutto il periodo di validità, di prenotare tutti i viaggi che vuoi senza pagare commissioni su ogni singolo posto prenotato.',06,'SF10'),
(03,'Mensile','50','Per tutto il periodo di validità, di prenotare tutti i viaggi che vuoi senza pagare commissioni su ogni singolo posto prenotato.',03,'LM3');

INSERT INTO Passaggio VALUES
(01,'Roma','2019-08-20 10:30:00 ','SI',2,50,'Contanti','Immediato','Parma',01,'SF10'),
(02,'Bologna','2019-02-10 03:36:00 ','SI',4,70,'Online','Immediato','Napoli',02,'GB9'),
(03,'Cassino','2019-10-01 10:27:00 ','No',3,80,'Online','Successivo','Alife',03,'MR8'),
(04,'Frosinone','2019-09-14 02:30:00 ','No',6,17,'Online','Successivo','Formia',04,'RB7'),
(05,'Rimini','2019-09-06 09:14:00 ','No',4,29,'Contanti','Immediato','Riccione',05,'RJ6'),
(06,'Ancona','2019-05-13 02:00:00 ','Si',4,30,'Contanti','Immediato','Scafati',06,'VA5');

INSERT INTO Tratta VALUES
(01,'Autostrada A1','No',01,01),
(02,'Autostrada piu vari paesi','Si',02,02),
(03,'Solo autostrada','No',03,03),
(04,'Viene percorsa esclusivamente l autostrada','No',04,04),
(05,'Viaggi simili a quello turistico','Si',05,05),
(06,'Autostrada e tragitto che comprende vari paesini','Si',06,06);

INSERT INTO Preferenze VALUES
(01,'Neomelodica','blablabla','si','NO',01,01,'SF10'),
(02,'Rap','bla','no','no',02,02,'GB9'),
(03,'Jazz','blabla','si','no',03,03,'Mr8'),
(04,'Raggaeton','blablabla','si','si',04,04,'RB7'),
(05,'Pop','bla','si','si',05,05,'RJ6'),
(06,'Pop','bla','no','no',06,06,'VA5');

INSERT INTO passaggio_has_passeggero VALUES
(1,1,'AB1'),
(2,5,'AV11'),
(3,2,'GB2'),
(4,3,'LM3'),
(5,6,'SF10'),
(6,4,'VT4'),
(2,1,'AB1'),
(2,3,'LM3'),
(4,6,'SF10'),
(4,4,'VT4'),
(4,5,'AV11'),
(6,1,'AB1'),
(6,2,'GB2');

INSERT INTO feedback VALUES
(1,'Pessimo','Si','No','OK'),
(2,'Buono','NO','Si','Nope'),
(3,'Mediocre','Si','No','Lol'),
(4,'Eccellente','No','SI','XD'),
(5,'Ottimo','Si','Si','LOOL'),
(6,'Mediocre','Si','No','OK');

INSERT INTO Gestione_Feedback VALUES
(1,1,1,2),
(5,2,3,Null),
(2,3,4,5),
(3,2,null,6);