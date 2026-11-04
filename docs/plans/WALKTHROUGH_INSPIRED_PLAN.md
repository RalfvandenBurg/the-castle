# Walkthrough-inspired game plan

## Doel

Een originele 2.5D puzzel-platformgame maken waarin de speler een kasteel kamer voor kamer verkent. De walkthrough van het originele *The Castle* dient als referentie voor de cadans van verkennen, objecten verplaatsen, sleutels vinden en routes openen. We nemen geen bestaande kamers, sprites, namen of exacte puzzeloplossingen over.

Referentie: [The Castle walkthrough (YouTube)](https://www.youtube.com/watch?v=ZoaRf6OIHfo)

## Wat we uit de referentie halen

De video is in deze werkomgeving niet rechtstreeks beschikbaar voor beeld-voor-beeld analyse. Daarom beschrijft dit plan de brede spelstructuur die bij het project past, niet een exacte reconstructie of timestamp-voor-timestamp samenvatting. De originele game wordt beschreven als een groot netwerk van kamers met platformuitdagingen, verplaatsbare objecten, sleutels, deuren, gevaren en een kaart. De walkthrough-referentie helpt vooral om de voortgang en onderlinge afhankelijkheden van kamers te bespreken.

Ontwerpregels:

- Elke kamer heeft een leesbaar hoofddoel en een herkenbare uitgang.
- Een voorwerp of sleutel moet de speler iets laten begrijpen, niet alleen een deurcheck passeren.
- Nieuwe regels worden eerst veilig geïntroduceerd en later gecombineerd.
- De speler kan teruglopen; belangrijke routes en reeds geopende deuren blijven begrijpelijk.
- Een val of fout herstelt de speler voorspelbaar bij de kamerstart of checkpoint.
- De 2.5D-diepte is visueel; gameplay en botsingen blijven in het afgesproken X/Y-vlak.

## Voorgestelde eerste speelbare hoofdstuk

Dit is een nieuwe, compacte route van zes kamers. Het is een eerste hoofdstuk om systemen te bewijzen, geen poging om het originele kasteel na te bouwen.

| Kamer | Rol | Nieuwe uitdaging | Uitkomst |
| --- | --- | --- | --- |
| 1. Poortkamer | Beweging leren | Lopen, springen en een krat op een lage richel duwen | Deur naar de hal gaat open |
| 2. Wachthal | Objectfysica leren | Krat onder een hoger platform plaatsen; veilige valzone | Eerste bronzen zegel |
| 3. Sleutelgalerij | Sleutel en slot leren | Sleutel zichtbaar achter een omweg; terug naar de gesloten deur | Route naar de binnenhof |
| 4. Binnenhof | Gevaar leren | Bewegende val of patrouille met duidelijke timing en herstel | Checkpoint bij een schuilnis |
| 5. Archief | Regels combineren | Een verplaatsbaar object activeert een gewichtsschakelaar terwijl speler een sleutel meeneemt | Tweede zegel en korte terugroute |
| 6. Klokkentoren | Hoofdstukslot | Platformsprongen plus een eerder geleerde objectregel | Uitgang naar volgende kasteelvleugel |

### Kamerverbindingen

`Poortkamer ↔ Wachthal ↔ Sleutelgalerij ↔ Binnenhof ↔ Archief ↔ Klokkentoren`

Na het vinden van de sleutel in Kamer 3 opent ook een zijdeur tussen de Wachthal en de Binnenhof. Die lus maakt teruglopen nuttig en test of kamerovergangen en geopende deuren correct bewaard blijven.

## Werkfasen

### Fase 1 — Besturing en herstel afronden

- Beweging links/rechts, springen, vaste dieptelijn en blok duwen afstellen.
- Valgrens, respawn en cameragedrag handmatig controleren.
- Acceptatie: de speler kan beide kanten op, landt betrouwbaar en verdwijnt niet buiten beeld.

### Fase 2 — Kamerstructuur

- Eén herbruikbare kamer-scene en data voor kamer-ID, verbindingen, spawn en exits maken.
- Overgang tussen twee zelfgemaakte testkamers bouwen.
- Acceptatie: de speler kan heen en terug zonder verlies van controle of onverwachte reset.

### Fase 3 — Eerste puzzelketen

- Duwbaar krat, oppakbare sleutel, bijpassend slot en eenvoudige HUD-indicator toevoegen.
- Een korte terugroute toevoegen nadat het slot geopend is.
- Acceptatie: de speler kan de route zonder verborgen bediening voltooien; sleutelstatus en deuropening blijven behouden.

### Fase 4 — Gevaar en checkpoints

- Eén origineel gevaar met zichtbare waarschuwing en vaste, leerbare timing toevoegen.
- Checkpoint en kamerreset onderscheiden en documenteren.
- Acceptatie: een fout is herstelbaar en wist geen voortgang die behouden hoort te blijven.

### Fase 5 — Zes-kamer hoofdstuk

- De zes kamers hierboven als eenvoudige grijze blokkendoos bouwen.
- Kamerkaart tonen met huidige kamer, ontdekte verbindingen en afgesloten routes.
- Speeltest uitvoeren en onduidelijke puzzels of doodlopende routes aanpassen.

### Fase 6 — Presentatie

- Blokkendoos vervangen door eigen kasteelstijl, animaties en geluid.
- Leesbaarheid van voorgrond, achtergrond en botsbare objecten controleren.
- Pauzeren, instellingen en desktop-export voorbereiden.

## Technische aanpak

- Houd spelerbeweging en herstel in `scripts/player.gd`.
- Houd kamerprototyping voorlopig in `scripts/room.gd`; verplaats kamerdefinities naar data zodra meer dan twee kamers bestaan.
- Gebruik Godot physics-bodies en collision shapes voor blokken, deuren en gevaren.
- Bewaar voortgang in een kleine `GameState`-autoloader: sleutel-ID's, geopende deuren, checkpoint en bezochte kamers.
- Gebruik unieke, originele kamer-ID's en objectnamen; sla geen gekopieerde originele kamerindeling op.

## Buiten scope voor de eerste hoofdstukversie

- Alle honderd originele kamers of een exacte kaart reconstrueren.
- Originele sprites, geluiden, namen, verhaaltekst of puzzel-layouts overnemen.
- Een grote vijand-AI, uitgebreide inventaris of save-slot-systeem bouwen voordat de basisroute werkt.

## Beslispunten na de eerste speeltest

- Wordt een sleutel verbruikt bij het openen van een deur, of blijft die permanent geldig?
- Bewaren we blokposities bij het wisselen van kamer?
- Is de kaart automatisch of ontdekt de speler kamers via borden/ankers?
- Welke thema- en verhaalrichting maakt dit project herkenbaar als eigen werk?

## Bronnotities

- De user-provided walkthrough is gekoppeld hierboven. Omdat de videostream hier niet kon worden uitgelezen, zijn de concrete zes kamers een nieuw voorstel gebaseerd op algemene mechanieken, geen claims over de exacte inhoud van de video.
- [MSX Resource Center: The Castle walkthrough](https://www.msx.org/news/websites/en/castle-walkthrough) beschrijft de walkthrough als een gids voor de grote kamer- en doolhofstructuur en verwijst door naar MSX Solutions.
- [The Castle (video game), Wikipedia](https://en.wikipedia.org/wiki/The_Castle_(video_game)) vat het spel samen als een puzzel-platformgame met een kasteel van kamers.
