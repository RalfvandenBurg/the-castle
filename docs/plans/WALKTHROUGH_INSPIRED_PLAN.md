# Walkthrough-inspired game plan

## Doel

Het project begint met een speelbare 3×3-sectie van negen kamers en heeft 100 kamers als langetermijndoel. De walkthrough van het origineel beschrijft ook 100 schermen, georganiseerd op een 10×10-kaart. De walkthrough is een referentie voor verkennen, teruglopen, objecten verplaatsen, sleutels vinden en routes openen. We nemen geen bestaande kamers, sprites, namen of exacte puzzeloplossingen over.

Referentie: [The Castle walkthrough (YouTube)](https://www.youtube.com/watch?v=ZoaRf6OIHfo)

## Ontwerpregels

- Iedere kamer heeft een leesbaar doel, herkenbare uitgangen en een eigen functie in de route.
- De speler begint zonder kaart. Een vindbare kaart in één van de kamers ontgrendelt de kaartinterface.
- Vóór het vinden van de kaart navigeert de speler op geheugen en herkenningspunten; uitgangen en kamerovergangen blijven wel duidelijk.
- Na het vinden toont de kaart de 3×3-indeling en informatie over kamers en verbindingen die de speler heeft ontdekt.
- Een voorwerp of sleutel leert een spelregel of verandert een route; het is niet alleen een willekeurige deurcheck.
- Nieuwe regels worden eerst veilig geïntroduceerd en later gecombineerd.
- De speler kan teruglopen; geopende deuren en relevante voortgang blijven bewaard.
- Een val of fout herstelt de speler voorspelbaar bij de kamerstart of checkpoint.
- De 2.5D-diepte is visueel; gameplay en botsingen blijven in het afgesproken X/Y-vlak.

## Wat de documentatie over het origineel beschrijft

- De MSX Solutions-walkthrough noemt 100 schermen en behandelt voorwerpen, vijanden en de route naar de prinses. Het adviseert de walkthrough samen met de kaart te gebruiken.
- De walkthrough laat de speler eerst een sleutel vinden en een deur openen; kort daarna wordt de kaart opgepakt. Daarna markeert de kaart bezochte kamers.
- De Wikipedia-beschrijving noemt een 10×10-kaart, gekleurde sleutels voor overeenkomende deuren en sleutels die uit de inventaris verdwijnen wanneer ze worden gebruikt.
- Kamers vragen soms om blokken of andere objecten op de juiste plek te schuiven. De walkthrough beschrijft ook liften/verplaatsbare platforms en gevaren zoals spikes en bewegende vijanden.
- Een andere spelevaluatie beschrijft teruglopen als een terugkerend gevolg van het nog niet hebben van de juiste sleutel. Dat ondersteunt lussen en alternatieve routes in onze eigen 3×3.

Dit zijn bronbeschrijvingen van het origineel, geen opdracht om die specifieke kamers, objecten, personages of kaartmarkeringen over te nemen. Voor onze versie nemen we de onderliggende ontwerpprincipes over: verkennen, routes onthouden, leesbare sleutel-deurregels en fysieke puzzels. Onze kaart verschijnt pas nadat de speler hem gevonden heeft; we laten geen einddoel of puzzeloplossingen zien.

## Eerste speelbare sectie: 3×3 kamers

De 3×3 is een compacte proefsectie binnen het beoogde kasteel van 100 kamers. De coördinaten hieronder zijn alleen een nieuw voorstel; ze reconstrueren geen originele kaart.

| Rij / kolom | Kamer | Rol en uitdaging | Beloning of verbinding |
| --- | --- | --- | --- |
| 1,1 | Poortkamer | Lopen, springen en een krat naar een lage richel duwen | Toegang tot de westelijke hal |
| 1,2 | Wachthal | Krat onder een hoger platform plaatsen; veilige valzone | Bronzen zegel; route noordwaarts |
| 1,3 | Sleutelgalerij | Sleutel achter een korte platformomweg; daarna teruglopen | Sleutel voor de oostelijke deur |
| 2,1 | Oude trap | Hoogteverschillen en een eenvoudige val leren lezen | Verbinding tussen beneden- en bovenroute |
| 2,2 | Kaartkamer | Rustige verkenningskamer; de kaart ligt zichtbaar maar vraagt een kleine omweg | Vindbare kaart ontgrendelt de kaartinterface |
| 2,3 | Binnenhof | Origineel, voorspelbaar gevaar met duidelijke waarschuwing | Checkpoint en toegang tot de oostvleugel |
| 3,1 | Opslagkelder | Duwobject en schakelaar combineren | Alternatieve terugweg naar de poortkamer |
| 3,2 | Archief | Gewichtsschakelaar combineren met sleutel- of objectregel | Tweede zegel en korte route terug |
| 3,3 | Klokkentoren | Platformsprongen combineren met een eerder geleerde regel | Afsluiting van de eerste sectie; deur naar latere uitbreiding |

### Verbindingen en kaartgedrag

De negen kamers vormen een orthogonaal 3×3-raster. Niet iedere aangrenzende kamer is vanaf het begin bereikbaar: een afgesloten deur of eenrichtingsval maakt de route interessant. Minimaal één lus verbindt de Opslagkelder terug met de Poortkamer, zodat teruglopen functioneel is.

- Voor de kaart: geen kaartscherm of raster-HUD; onthoud waar je bent geweest aan de hand van unieke visuele herkenningspunten.
- De kaart wordt in de Kaartkamer als fysiek voorwerp gevonden en blijft daarna beschikbaar. Dit houdt het principe van een vindbare kaart uit de referentie aan, maar gebruikt een nieuwe locatie en route.
- Bij het vinden wordt de kaart bruikbaar, maar onbekende kamers/verbindingen onthullen zich pas wanneer de speler ze ontdekt.
- Een kaartmarkering toont huidige kamer, bezochte kamers, bekende deuren en bekende blokkades. Ze geeft geen puzzeloplossingen.
- De kaartprogressie moet ook schaalbaar zijn naar het latere doel van 100 kamers.

## Werkfasen

### Fase 1 — Besturing en herstel afronden

- Beweging links/rechts, springen, vaste dieptelijn en blok duwen afstellen.
- Valgrens, respawn en cameragedrag handmatig controleren.
- Acceptatie: de speler kan beide kanten op, landt betrouwbaar en verdwijnt niet buiten beeld.

### Fase 2 — Kamerstructuur

- Eén herbruikbare kamer-scene en data voor kamer-ID, rasterpositie, verbindingen, spawn en exits maken.
- Overgang tussen twee originele testkamers bouwen.
- Acceptatie: de speler kan heen en terug zonder verlies van controle of onverwachte reset.

### Fase 3 — Eerste puzzelketen en teruglopen

- Duwbaar krat, oppakbare sleutel, bijpassend slot en eenvoudige inventarisindicator toevoegen.
- Voorstel om te testen: gekleurde sleutel opent alleen het bijpassende slot en wordt daarna verbruikt.
- Een gesloten route openen en een lus naar een eerdere kamer maken.
- Acceptatie: sleutelstatus en deuropening blijven behouden na kamerwissels.

### Fase 4 — Kaart als vindbaar voorwerp

- Start de speler zonder kaartinterface.
- Maak de kaart een zichtbare, optioneel te onderzoeken pickup in de Kaartkamer.
- Ontgrendel na pickup een schaalbare kaartinterface met huidige kamer, bezochte kamers en ontdekte verbindingen.
- Acceptatie: zonder pickup is er geen kaart; na pickup verschijnt alleen informatie die in het spel ontdekt is.

### Fase 5 — Gevaar en checkpoints

- Eén origineel gevaar met zichtbare waarschuwing en vaste, leerbare timing toevoegen.
- Checkpoint en kamerreset onderscheiden en documenteren.
- Acceptatie: een fout is herstelbaar en wist geen voortgang die behouden hoort te blijven.

### Fase 6 — Complete 3×3-proefsectie

- Alle negen kamers als eenvoudige grijze blokkendoos bouwen.
- Raster, kaartontdekking, sluiproutes en sleutelafhankelijkheden integreren.
- Speeltest uitvoeren: navigeer eerst zonder kaart naar de kaartkamer en voltooi daarna de sectie met kaart.
- Acceptatie: de route is zonder walkthrough oplosbaar en de kaart helpt oriënteren zonder antwoorden weg te geven.

### Fase 7 — Uitbreiden richting 100 kamers

- Kamers en verbindingen volledig data-gedreven houden; de 3×3 is één deelgebied, niet de finale schaal.
- Nieuwe delen toevoegen met herkenbare thema's en terugkerende maar gevarieerde spelregels.
- Kaart, save-data en room transitions controleren op groei naar 100 unieke kamers.

### Fase 8 — Presentatie

- Blokkendoos vervangen door eigen kasteelstijl, animaties en geluid.
- Leesbaarheid van voorgrond, achtergrond en botsbare objecten controleren.
- Pauzeren, instellingen en desktop-export voorbereiden.

## Technische aanpak

- Houd spelerbeweging en herstel in `scripts/player.gd`.
- Verplaats kamerdefinities naar data zodra meer dan twee kamers bestaan; gebruik stabiele ID's en rasterposities.
- Gebruik Godot physics-bodies en collision shapes voor blokken, deuren en gevaren.
- Bewaar voortgang in een kleine `GameState`-autoloader: sleutel-ID's, geopende deuren, checkpoint, bezochte kamers en of de kaart gevonden is.
- Laat de kaartweergave alleen ontdekte kamers en bekende verbindingen tonen; houd onbekende cellen verborgen of oningevuld.
- Sla geen gekopieerde originele kamerindeling op; maak de 3×3- en latere kamers zelf.

## Buiten scope voor de eerste 3×3-versie

- Alle 100 kamers in één keer bouwen of exact namaken.
- Originele sprites, geluiden, namen, verhaaltekst of puzzellayouts overnemen.
- Een grote vijand-AI, uitgebreide inventaris of save-slotsysteem bouwen voordat de 3×3-route werkt.

## Open ontwerpbeslissingen

- Behouden we het origineel-achtige gedrag waarbij een sleutel wordt verbruikt, of willen we sleutels permanent laten werken?
- Bewaren we blokposities bij het wisselen van kamer?
- Toont de kaart alleen bezochte kamers, of ook lege contouren van naburige onbekende kamers?
- Welke thema- en verhaalrichting maakt dit project herkenbaar als eigen werk?

## Bronnotities

- De user-provided walkthrough is gekoppeld hierboven. Omdat de videostream hier niet kon worden uitgelezen, zijn de negen kamers en hun volgorde een nieuw voorstel, geen claims over de exacte inhoud van de video.
- [MSX Solutions: The Castle walkthrough (PDF)](https://msxsolutions.msxblue.com/walks/castle.pdf) — primaire bron voor de walkthrough; noemt 100 schermen, de kaart, items, vijanden en voorbeeldoplossingen.
- [The Castle (video game), Wikipedia](https://en.wikipedia.org/wiki/The_Castle_(video_game)) — overzicht van de 100 kamers, 10×10-kaart, objectpuzzels en verbruikte sleutels.
- [Generation MSX: The Castle](https://generation-msx.nl/software/ascii-corporation/the-castle/752) — catalogusvermelding met spelbeschrijving en publicatiereferenties.
- [The Castle (SG-1000, 1986), Sega Does](https://segadoes.com/2014/10/05/the-castle/) — secundaire gameplaybeschrijving van kaartgebruik, teruglopen, sleutels en langzaam leren omgaan met sprong en vijanden.
