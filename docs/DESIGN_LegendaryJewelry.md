# Bonusy legendarne — Biżuteria (Amulety / Pierścienie / Pasy)

Uzupełnienie katalogu xls (tam tylko bronie + tarcze). SAMA KONCEPCJA — nic nie jest zakodowane.
Sloty wg ItemClassData.json: Amulet, Ring, Belt — każdy z archetypem Warrior / Mage / Archer.

## Zasady projektowe (wnioski z playtestów)

1. **Wszystko w %** — żadnych płaskich liczb. Płaskie wartości one-shotują wczesną grę i są zerem
   przy bossach 100k+ HP (lekcja z flat reflectu — wywalony).
2. **Regeneracja zasobów tylko jako ZWROT kosztu z limitem** — nigdy netto-dodatnia
   (lekcja ze StPerHit = nieskończona stamina; nowy podatek many 7% / staminy 6% ma zostać odczuwalny).
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
| Obrączka Cienia | Po sparowanym/zablokowanym ciosie Twój następny atak +50% obrażeń (okno 3 s) | W/A | [MECHANIKA] |
| Pierścień Pijawki | 2% zadanych obrażeń wraca jako mana | M | [ŁATWE] StealManaPerc |
| Węzeł Czasu | 10% szans na ogłuszenie przy trafieniu (bossowie Zakonu odporni/50% szansy) | W | [ŁATWE] StExt_StunTarget |
| Pierścień Palacza | Trafienia podpalają: DoT 10% obrażeń ciosu przez 5 s | M/A | [ŁATWE] AddDotDamage permille |
| Sygnet Hazardzisty | Obrażenia losowo od 50% do 200% co cios | wszyscy | [ŁATWE] |
| Pierścień Uczonego | Pieczęcie liczone, jakby ich poziom był o 5 wyższy (cap 60 bez zmian) | M | [ŁATWE] w ItemAbilitiesController |

## Pasy

| Nazwa | Efekt | Archetyp | Trudność |
|---|---|---|---|
| Pas Tytana | −15% otrzymywanych obrażeń fizycznych, dopóki stamina > 50% | W | [MECHANIKA] warunek w BeforeDefence |
| Pas Trzeźwości | Koszt staminy za cios obniżony o 1/3 (6% → 4% max staminy) | W | [ŁATWE] hook w koszcie melee |
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
2. Fala 2 — **[MECHANIKA]**: Oko Beliara, Tchnienie Innosa, Obrączka Cienia, Tytana, Kamiennej Skóry, Strażnika.
3. Spięcie z systemem legendarnym broni z xls (wspólny roller: status legendarny → los z puli slotu).
