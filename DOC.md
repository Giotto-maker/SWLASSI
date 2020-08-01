smARTwanderig – DOCUMENTAZIONE

Link a repository GitHub:
	https://github.com/Giotto-maker/SWLASSI

Descrizione suddivisione attività tra componenti del gruppo di lavoro:
La struttura stessa dell’applicazione realizzata ha suggerito la seguente suddivisione del carico di lavoro complessivo:
Uno dei componenti si è occupato della gestione degli utenti. Si è quindi dedicato a realizzare il meccanismo di registrazione, autenticazione (login, login con Facebook, login con Google), modifica profilo e modifica di password. Il lavoro è stato eseguito tramite l’utilizzo delle gemme devise ed omniauth. 
…..

User Sories

Mockup

Schema DB (modello ER)
	Le entità presenti all’interno della nostra applicazione sono User e Artwork.
L’entità User è di base caratterizzata dai campi nome, cognome, categoria (necessaria per suggerimenti personalizzati di opere), username, email (chiave primaria), password e campo admin (booleano necessario per poter distinguere gli utenti in amministratori e non). A questi campi si aggiungono poi tutti quelli necessari per l’implementazione di funzionalità come remember me, reset password, session, utilizzo di omiauth. 
	
Name	Surname	Category	Username	Email	Password	Admin
						
						
						

	Per quanto riguarda la risorsa Artwork, questa è cosi strutturata: 
Voto	Valutazioni	Periodo	Nome	Indirizzo	F1	F2	F3	F4	F5	Autore	Dimensioni	Categoria	Lati	Long
														

Struttura controllo degli accessi

Piano dei test
