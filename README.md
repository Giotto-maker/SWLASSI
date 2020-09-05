# README
<h1> Cos'è smARTWandering </h1>

smARTWandering è un progetto che ha lo scopo di suggerire degli itinerari di visita all'interno della città di Roma a tutti gli uteni, sulla base delle loro preferenze

In più diamo la possibilità agli utenti di ricevere informazioni aggiuntive sulle loro opere preferite, conoscerne i dettagli  e farne delle recensioni, sulla base delle quali faremo suggerimenti migliori 

<h1> Requisiti </h1>

Questa applicazione gira su Rails 5 e necessita di Ruby almeno alla versione 2.4.
Usiamo SQLite3 come database.
Per la lista completa della dipendenze si rimanda al Gemfile

Per eseguire il codice è sufficiente installare le gemme richieste con il comando

<h4> bundle install </h4>

ed in seguito avviare un'istanza del server rails

<h4> rails server </h4>

Nel caso in cui non si avesse Rails installato sulla propria macchina visitare prima https://gorails.com/setup/ubuntu/20.04

<h1> Testing </h1>

Lanciare i test di accettazione (si consiglia di avere installato Firefox, dato che i nostri test avviano in automatico un bot su quel browser) con il comando

<h4> bundle exec cucumber ./features/* </h4>
  
 Per quelli di unità ed integrazione:
  
 <h4> bundle exec rspec </h4>
