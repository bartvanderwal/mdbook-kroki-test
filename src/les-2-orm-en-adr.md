# Les 2 - ORM (EF core)

In de workshop zijn kort 'volumes' behandeld in Docker, die nodig zijn voor persistent opslag. Althans als je data langer moet bestaan dat de container, wat op productie het geval is, als je een database gebruikt.

Neem de Docker documentatie []`Volumes'(https://docs.docker.com/engine/storage/volumes/) (negeer de oude constructie 'mounts' e.d. dit is alleen voor oudere containers die dit gebruikten).

Lees het artikel [DevOps for databases](https://stackify.com/devops-for-databases/) van Christian Melendez. Als oefening kun je evt. de Contonso voorbeeld code downloaden, de dotnet ef tools installeren zoals het artikel aangeeft en de besproken oefening meedoen.

> “Database refactorings […] involve three different changes that have to be done together
>
> - Changing the database schema
> - Migrating the data in the database
> - Changing the database access code”

*Quote 1*: Bron: Martin Fowler, 2016, geraadpleegd 21-2-2022 op <https://www.martinfowler.com/articles/evodb.html>

Van de 3 wijzigingen uit quote 1 mist in simpele applicaties vaak het echte migreren van bestaande data. Dit vereist ook vaak het nadenken over hoe deze data te migreren en het handmatig schrijven/uitbreiden van de migratie code (de `Up()` en `Down()` methode in EF core.

<a href="plaatjes/klasse-diagram-orm-cdmm-voorbeeld.jpg"><img src="plaatjes/klasse-diagram-orm-cdmm-voorbeeld.jpg" alt="Klassendiagram CDMM checkbox self assessment" width="400"></a><br/>

<a href="plaatjes/klasse-diagram-orm-cdmm-voorbeeld.jpg"><img src="plaatjes/klasse-diagram-orm-cdmm-voorbeeld.jpg" alt="Klassendiagram CDMM checkbox self assessment" width="400"></a><br/>

*Figuur 2*: ORM oefening. Het in de les besproken mogelijke klassendiagram voor de database in weekopdracht.

## ERM model

TODO: Kroki ERM model

### User stories

- Als docent wil ik dat studenten een self assessment aan de hand van het Continuous Delivery Maturity Model (CDMM) kunnen maken en deze beargumenteren, zodat zij kunnen zien waar zij staan qua DevOps volwassenheid, en zich in DevOps best practices moeten verdiepen
- Als student wil ik makkelijk een CDMM beoordeling kunnen invullen en hierbij achtergrond informatie krijgen over de verschillende CDMM checkpoints zodat ik informatie over bijbehorende en een punt minder snel verkeerd interpreteer
- Als student wil ik iteratief een assessment willen invullen op verschillende data, zodat ik vooruitgang zie.
- Als student wil ik een ingevuld CDMM assessment kunnen exporteren, zodat ik deze , bv. als PDF kan inleveren als bewijslast voor school en als markdown/documentation as code op kan nemen als documentatie in mijn huiswerkopdrachten of beroepsproduct (DevOps BP)

<kroki type="erd">
  [Student]
  *Naam
  +Student nummer

[CDMMSelfAssessment]
Datum
Student
CDMMCheckPoint

[CDMMEvaluation]
CDMMCheckpoint
IsChecked
Argumentatie

[CDMMCheckPoint]
CDMMCategorie
CDMMNiveau
Code
Titel
Beschrijving

[CDMMCategorie]
Id
Beschrijving

[CDMMNiveau]
Id
Beschrijving

Student 1--* CDMMSelfAssessment
CDMMSelfAssessment 1--* CDMMEvaluation
CDMMEvaluation 1--1 CDMMCheckpoint
CDMMCheckpoint 1--5 CDMMCategorie
CDMMCheckpoint 1--5 CDMMNiveau

</kroki>

## Web applicatie server

In de weekopdracht van deze week moet je de vorige week gemaakte applicatie uitbreiden naar een WEB API en ook hosten met een webapplicatieserver. Een veelgebruikte is `nginx` (spreek uit: 'Engine X'). Hiervoor maak je ook kennis met ADR's: Architecture Decision Records.

> "What are alternatives to nginx when you want a webapplication server for a .NET application that you also want to containerize?"


<img src=./plaatjes/alternatives-to-nginx-according-to-chat.png width="300" align="right" alt="Nginx alternatives according to Chat GPT">

TODO: ORM ook introduceren hier of verwijzen. Dit is goede video om in de les samen te kijken ter relativering/van ORM's:

- Gormin, Christin (2011) *Hibernate should be to programmers what cake mixes are to bakers: beneath their dignity.* Vimeo. Ook nu even gecheckt op https://vimeo.com/28885655

Ook 'Continuous Delivery' Dave Farley haalt de video van Gormin aan in zijn boek 'Modern Software Engineering (tip!). Martin Fowler's artikel 'ORM hate' is een meer genuanceerde kijk op deze kwestie. Dat je geen SQL kennis zou hoeven te te hebben bij gebruik ORM is een drogreden, vanwege de ca. 10% gevallen die overblijft (en idd soms slechte performance). Hoewel de hoeveelheid SQL achtige annotaties in Gormin's wel wat hooggekozen is. Maar voor de resterende 10% moet je namelijk inzicht hebben in performance gevolgen. Voor SQL Server bv. van impact van bepaalde join volgorde en handmatige optimalisaties via keys toevoegen of verwijderen met hierachter technische concepten als 'table scan' vs 'index scan', etc. (zie bv. Anvesh 2023). En daarbij vergeleken is SQL syntax a walk in the park. Maar het 'single point of truth' of 'single point of definition' dat een goed ORM framework met ook 'migrations' mogelijkheden je kan geven. Al kom je als student niet snel in aanraking met een situatie waarbij je productie data hebt, die ook gemigreerd moet naast DB schema en applicatiecode, zoals Fowler in zijn artikel/blog 'Evolutionary database design' de big 3 aangeeft.

## Leerdoelen

Check met onderstaande leerdoelen  of je de behandelde stof begrepen hebt en toetsvragen kunt beantwoorden.

- Je kent de relatie van BDD met TDD, DDD en Agile/DevOps
  - met o.a. relevante begrippen als *Ubiquitous Language*, *test-first*, *red-green-refactor*, *AAA pattern*, *given-when-then* en *collaborative development*
- Je kent de BDD three amigo's, en de 3 stappen van het iteratieve BDD proces
- Je kent 2 andere namen van BDD, en kunt deze uitleggen
- Je kent de term 'self testing code' en het onderscheid tussen `.feature` files, *glue code* en applicatie code en de talen/standaarden die hier achterin zitten
- Je kunt de verhouding uitleggen tussen BDD test scenario's, test cases en suites met user stories en acceptatiecriteria uit Scrum
- Je kent de test pyramide, het belang van de verschillende soorten testen hierin en de link met BDD
- Je kunt op basis van een tutorial een project met werkende en relevante BDD tests opstellen m.b.v. Cucumber of Specflow

## Bronnen

- Anvesh (1-8-2023). *Table Scan vs Index Scan vs Index Seek.* medium.com Geraadpleegd 18-4-2024 op <https://medium.com/silenttech/table-scan-vs-index-scan-vs-index-seek-f5cbb4e93478>
- <https://martinfowler.com/bliki/OrmHate.html>
- <https://martinfowler.com/articles/evodb.html>
