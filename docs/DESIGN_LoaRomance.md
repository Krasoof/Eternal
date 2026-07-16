# „Pieśń dla Loy" — kontynuacja romansu z Loą (po podstawce Returninga)

Loa = pieśniarka z wątku Returninga (koncert u Coragona, prezenty: kwiat /
perła / wiersze, love-scene, EPICQUEST; sceną steruje baza). Podstawka daje
dwa questy romansu — MY zaczynamy PO nich. Zero ruszania bazowych dialogów:
wszystko nowe, warunkowane bazowymi flagami.

**Kotwice (bazowe symbole, zweryfikowane w AB_Scripts.vdf):**
`MIS_LOAROMANCE`, `MIS_LOASECRET`, `LOALOVER`, `LOALOVE`, `LOALOVERDAY`,
`CANSAYLOASTAY`, `CONCERTLOABONUS`, `ADW_LOA_SHIP`, `CAMLOALOVE`.
Warunek startu kontynuacji: `MIS_LOAROMANCE == LOG_SUCCESS && LOALOVER`
(dokładną semantykę flag potwierdzimy w grze przed implementacją sceny 1 —
wpis kontrolny przez Kamień/print).

**HAK LOREOWY (spina z Zakonem):** pieśń to „miękka magia" Adanosa —
harmonia, która KOI dusze. Bezimienny nosi Żar Dusz; przy Loi Żar cichnie...
a umarli, którzy za nim węszą, zaczynają węszyć wokół NIEJ. Romans wpada
w sam środek konfliktu gildii: to, co kochasz, staje się celem tego,
co ukradłeś Beliarowi.

## Sceny (każda osobno testowalna, wszystkie VOICED)

### L1. „Cisza" (rozdz. 3+)
Loa przestała śpiewać. Mówi, że od kiedy jesteś blisko, w nocy słyszy
„drugi głos", który podśpiewuje jej własne pieśni — spod ziemi.
WYBÓR: powiedzieć prawdę o Żarze (uczciwość → Względy+) / skłamać (MROK+).
PĘTLA: nocna warta przy niej → 2 fale umarłych ciągnących do jej domu.
DŹWIĘK: 4 linie Loy (gosia), 1 Bezi (mc_speech).

### L2. „Pieśń, która koi" (styk z mechaniką!)
Mistrz Zakonu potwierdza: głos Loy tłumi głód Beliara. Prośba: niech
zaśpiewa przy Kuźni podczas przekuwania wielkiego Żaru. OBRONA RYTUAŁU
z Loą w środku (eskorta VIP — pada ona = porażka questa, nie śmierć,
porwanie wątku do L4). Nagroda mechaniczna: buff „Pieśń Loy" — przy
noszeniu Żaru kara do obrony −50% przez X dni (odnawialny u niej).
DŹWIĘK: 2 linie Loy, 2 Mistrza, 1 Bezi.

### L3. „Zazdrość umarłych"
Upiorny „wielbiciel" (mini-boss, dark kit) zaczyna zostawiać Loi prezenty:
martwe kwiaty, perłę z grobu, WIERSZE pisane jej pismem — lustrzane
odbicie prezentów z podstawki (gracz to rozpozna = ukłon, nie tandeta).
Pościg nocą → walka na dachach/nabrzeżu. WYBÓR: zniszczyć upiora /
odkryć, KIM był za życia (barda zabitego za pieśń — oddać jego pieśń
Loi do repertuaru = uwolnienie duszy, Względy++).
DŹWIĘK: 3 szepty upiora (mc_speech pitch-down), 2 linie Loy.

### L4. Finał: „Głos spod ziemi"
Beliar sięga po Loę wprost: głos, który podśpiewywał, wzywa ją do wieży /
na statek (ADW_LOA_SHIP — kotwica bazowa, jeśli aktywna). Schodzisz po nią
do finału bojowego (reużycie ARENA_BOSS_NECRO albo piwnica wieży).
TRZY ZAKOŃCZENIA (wg wyborów L1/L3 + MROK):
- **Duet** — prawda w L1 + uwolniony bard w L3: Loa śpiewa W CIEMNOŚCI,
  osłabiając bossa przez całą walkę (mechanicznie: debuff bossa co fale);
  po wygranej zostaje w hubie, stały buff Pieśni.
- **Cisza** — skłamałeś: Loa przeżywa, ale odchodzi; zostaje tylko jej
  wstążka (item-pamiątka, mały bonus, gorzki wpis).
- **Requiem** (MROK wysoki): ratujesz ciało, głos zostaje pod ziemią —
  Loa żyje, lecz nigdy już nie śpiewa. Hub bez buffu, w dzienniku
  najcięższy wpis wątku.

## Dubbing
Loa = gosia (1.05); upiór-wielbiciel = mc_speech 1.4 + pitch/pogłos (FX pass);
Bezi = mc_speech (do podmiany na wykupiony głos). Manifest per scena w
docs/RoseRomance_OU.csv-stylu (osobny plik przy implementacji L1).
Beaty przez SFX-VDF (patent questa wieży), lip-sync przy przebiegu OU.

## Status pozostałych romansów
Adela („Róża Khorinis") → ZAMROŻONA w LAB (scena 1 zostaje jako proof
pipeline'u). Loa ma priorytet: istnieje w podstawce, gracze ją znają,
kontynuacja > nowa postać. Wnioski z projektu Adeli (Względy/MROK,
miniquesty ciszy) przeniesione tutaj.
