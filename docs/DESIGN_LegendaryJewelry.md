# Bonusy legendarne — Biżuteria (Amulety / Pierścienie / Pasy)

## ⚔️ RDZEŃ: Perfekcyjna Parada + Riposta — **WDROŻONE, DO TESTU**

Kierunek moda: Gothic × Souls × Diablo. NB nie miał skryptowej detekcji „perfect parry" —
zbudowana od zera na hookach silnika (DLL łapie `oCNpc::EV_Parade` → event `OnParade` do skryptów):

- **Perfekcyjna parada** = wciśnięcie parady w oknie ~0,4 s przed ciosem wroga (25 klatek,
  strojne). Trzymanie bloku NIE liczy się jako perfect — tylko timing.
- Nagrody za perfect (na ekranie: „PERFEKCYJNA PARADA!"):
  1. **Zwrot 4% max staminy** (odzyskujesz pół ciosu),
  2. **Okno riposty ~1,5 s** — następny cios wręcz zadaje **+50%** i **nie kosztuje staminy**
     (na ekranie: „RIPOSTA!"),
  3. **Neguje chip bossa Zakonu** (2% max HP przez blok) — pasywny blok dalej krwawi, perfect nie.
- Pliki: GlobalVars.d (okna), HeroActionsController.d (handler parady + callbacki),
  DamageController.d (detekcja + riposta). Napisy PL na sztywno (do przeniesienia do lokalizacji).
- **Co testować:** czy okno 0,4 s czuje się dobrze (za łatwe → zetnę do 15 klatek); czy riposta
  odpala się na właściwym ciosie; czy chip bossa znika tylko przy perfeccie.

Perki parowania z tabel poniżej (Obrączka Cienia, perfect-block z xls) wpinają się w TEN system —
modyfikują okno, nagrodę albo ripostę. Zero osobnych mechanik parowania.

Uzupełnienie katalogu xls (tam tylko bronie + tarcze). SAMA KONCEPCJA — nic nie jest zakodowane.
Sloty wg ItemClassData.json: Amulet, Ring, Belt — każdy z archetypem Warrior / Mage / Archer.

## Zasady projektowe (wnioski z playtestów)

1. **Wszystko w %** — żadnych płaskich liczb. Płaskie wartości one-shotują wczesną grę i są zerem
   przy bossach 100k+ HP (lekcja z flat reflectu — wywalony).
2. **Regeneracja zasobów tylko jako ZWROT kosztu z limitem** — nigdy netto-dodatnia
   (lekcja ze StPerHit = nieskończona stamina; podatek many 7% / cios 8% staminy z refundem max 1/3
   ma zostać odczuwalny).
3. **Zero efektów on-death** — ani u wrogów, ani prowokowanych u gracza.
4. **Jeden bonus legendarny na item**, losowany gdy item dostaje status legendarny (jak w xls dla broni).
5. **Tożsamość slotu:** Amulet = ofensywa/aury · Pierścień = proce/utility · Pas = defensywa/zasoby.
6. Archetyp descriptora (Warrior/Mage/Archer) waży pulę losowania — mag ma większą szansę na bonusy
   magiczne itd., ale nic nie jest twardo zablokowane.

Tag trudności: **[ŁATWE]** = istnieje gotowy PcStats index / hook · **[MECHANIKA]** = trzeba dopisać logikę.

## Amulety

| Nazwa | Efekt | Archetyp | Trudność |
|---|---|---|---|
| Serce Smoka | +10% zadawanych obrażeń, ale otrzymujesz +5% obrażeń (szklane działo) | W | [ŁATWE] |
| Pieśń Krwi | Lifesteal: 3% zadanych obrażeń wraca jako HP (procent → działa też na bossach) | W | [ŁATWE] StealLifePerc |
| Kolia Egzekutora | +25% obrażeń przeciw wrogom poniżej 25% HP | W/A | [ŁATWE] |
| Oko Beliara | 5% szans, że cios uderza drugi raz za 50% obrażeń (echo) | A | [MECHANIKA] |
| Gwiazda Adanosa | 10% szans na odbicie czaru we wroga | M | [ŁATWE] ReflectSpellChance |
| Amulet Głodu Many | Podatek many za czar obniżony o 1/3 (7% → ~4.7% max many) | M | [ŁATWE] hook w ProcessSpellConsumption |
| Totemiczny Zew | Aury działają 25% mocniej | M | [ŁATWE] PcStats_Auras mult |
| Tchnienie Innosa | Co 60 s następny cios/czar zadaje +100% obrażeń (naładowane uderzenie) | wszyscy | [MECHANIKA] timer + flaga |

## Pierścienie

| Nazwa | Efekt | Archetyp | Trudność |
|---|---|---|---|
| Pierścień Cierni | Odbija 15% otrzymanych obrażeń (TYLKO procent — zgodnie z nowym reflectem) | W | [ŁATWE] ReflectDamageAs*Perc |
| Sygnet Łowcy | +5% szansy na kryt i kryty zadają +15% więcej | A | [ŁATWE] |
| Obrączka Cienia | Riposta po perfekcyjnej paradzie zadaje +100% (zamiast +50%), a okno riposty rośnie do 3 s | W/A | [ŁATWE] — rdzeń parady już wdrożony |
| Pierścień Pijawki | 2% zadanych obrażeń wraca jako mana | M | [ŁATWE] StealManaPerc |
| Węzeł Czasu | 10% szans na ogłuszenie przy trafieniu (bossowie Zakonu odporni/50% szansy) | W | [ŁATWE] StExt_StunTarget |
| Pierścień Palacza | Trafienia podpalają: DoT 10% obrażeń ciosu przez 5 s | M/A | [ŁATWE] AddDotDamage permille |
| Sygnet Hazardzisty | Obrażenia losowo od 50% do 200% co cios | wszyscy | [ŁATWE] |
| Pierścień Uczonego | Pieczęcie liczone, jakby ich poziom był o 5 wyższy (cap 60 bez zmian) | M | [ŁATWE] w ItemAbilitiesController |

## Pasy

| Nazwa | Efekt | Archetyp | Trudność |
|---|---|---|---|
| Pas Tytana | −15% otrzymywanych obrażeń fizycznych, dopóki stamina > 50% | W | [MECHANIKA] warunek w BeforeDefence |
| Pas Trzeźwości | Koszt staminy za cios obniżony o 1/3 (8% → ~5.3% max staminy) | W | [ŁATWE] hook w koszcie melee |
| Pas Kamiennej Skóry | Co 30 s całkowicie pochłania jeden cios (jednorazowa tarcza) | W/M | [MECHANIKA] timer + flaga |
| Pas Berserkera | Poniżej 30% HP zadajesz +20% obrażeń (lustro bossowej Furii) | W | [ŁATWE] |
| Pas Węża | DoT-y na Tobie trwają o połowę krócej | A | [ŁATWE] CalcDotDuration |
| Pas Strażnika | Pierwszy cios każdego wroga w Ciebie zadaje −50% (anty-burst) | wszyscy | [MECHANIKA] per-npc flaga |
| Pas Pielgrzyma | Regeneracja HP/many/staminy poza walką +25% szybsza | wszyscy | [ŁATWE] |
| Pas Zasobny | Mikstury przywracają +30% więcej | wszyscy | [ŁATWE] AlchemyController |

## Kolejność wdrożenia (propozycja)

1. Fala 1 — same **[ŁATWE]** (istniejące PcStats/hooki): Pieśń Krwi, Kolia Egzekutora, Gwiazda Adanosa,
   Głód Many, Totemiczny Zew, Cierni, Łowcy, Pijawki, Węzeł Czasu, Palacza, Hazardzisty, Uczonego,
   Trzeźwości, Berserkera, Węża, Pielgrzyma, Zasobny, Serce Smoka.
2. Fala 2 — **[MECHANIKA]**: Oko Beliara, Tchnienie Innosa, Tytana, Kamiennej Skóry, Strażnika.
   (Obrączka Cienia przeszła do Fali 1 — rdzeń parady już działa.)
3. Spięcie z systemem legendarnym broni z xls (wspólny roller: status legendarny → los z puli slotu).

## 🧪 Nowe mechaniki — inicjatywa (Souls/Diablo), SAMA KONCEPCJA

Wszystko poniżej sprawdzone pod kątem wykonalności na istniejących hookach — silnik to uciągnie.
Nic nie jest zakodowane; do zatwierdzenia po testach parady.

1. **Nasycenie żywiołem (Souls status-buildup).** Trafienia bronią z żywiołem ładują ukryty pasek
   na wrogu (licznik w aivar); pełny pasek = eksplozja statusu: ogień → panika + mocny DoT,
   lód → zamrożenie 2 s, błyskawica → łańcuch na pobliskich, śmierć → −10% max HP.
   Bossowie ładują się 3× wolniej. *Wykonalne: per-npc aivar + DoT/stun już istnieją.*
2. **Postura bossów (poise).** Bossowie Zakonu są odporni na stun POZA krótkim oknem po
   perfekcyjnej paradzie — parada nie tylko neguje chip, ale otwiera moment na ogłuszenie.
   Zamienia walkę z bossem w rytm: paruj → riposta → okno stuna. *Wykonalne: flaga czasowa
   + istniejący StExt_StunTarget.*
3. **Żar Dusz (waluta elit).** Nasyceni (infused) wrogowie dropią „Żar" — u Mistrza Zakonu
   wymiana: reroll bonusu legendarnego itemu ALBO podbicie tieru infuzji własnej broni.
   Domyka pętlę Diablo: farmisz elity → kraftujesz legendy. *Wykonalne: drop w OnKill po
   fladze infuzji + dialog wymiany; StExt_RerollItemInPlace już istnieje w silniku.*
4. **Ostatni Bastion (Souls "estus").** Raz na walkę, gdy cios miałby Cię zabić, przeżywasz
   z 1 HP i dostajesz 3 s nietykalności (i-frames). Odnawia się po 5 min poza walką.
   *Wykonalne: BeforeDefence już edytuje HP; timer przez callback.*

Kolejność proponowana: 2 (postura — domyka pętlę parady) → 1 (nasycenie; UWAGA: wymaga
znalezienia animacji/FX eksplozji i pomysłu na wizualizację paska) → 3 (żar) → 4 (bastion).
Kapliczki wycięte na życzenie. Infuzja (nasycenie) NA BOSSACH ZOSTAJE — 600k HP to feature.

## ⚔️ Boss combat 2.0 — WDROŻONE, DO TESTU (feedback: „wór na obrażenia, stały timing")

1. **Zmienne tempo bossa** — po zadanym ciosie (25%) i po otrzymanym (10%) boss losuje
   nową szybkość animacji (−15%…+45%, `aivrx_npc_speed` — dźwignia frameworku NB używana
   przez buffy Speed). Timing parady nie do wyklepania na pamięć.
2. **Zestawy specjalnych ruchów** (patent PotD — ich DLL to tylko shim `RX_VampirePluginActive`,
   prawdziwe umiejki to system NpcAbility, który mamy w całości): każdy boss dostaje wg id
   żywioł — fala (ground-slam Fire/Ice/Electro/Dark/Quake) + blink-strike w tym żywiole +
   self-buff Speed; tier 3+: Whirlwind; tier 4: Berzerk. Zero boltów/spamu pociskami, zero heali.
3. **Drenaż staminy za przyjęte ciosy** — silnikowy koszt bloku jest PŁASKI (item na staminę =
   wieczny blok). Fix: każdy przyjęty cios wręcz drenuje 6% max staminy; żółwienie kończy się
   po ~16 ciosach. Perfekcyjna parada zamiast drenażu REFUNDUJE 4%.
4. **Mistrz Zakonu w zbroi** — ZAKON_CHAOS (topowa zbroja Strażnika) zamiast szaty maga.
