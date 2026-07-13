# Projekt: Pętla Souls dla Zakonu Dusz

Status: **ZAWĘŻONE**. Zakon Dusz to JEDNA profesja w dużym modzie
(nakładka na Gothic II: New Balance) - nie robimy z tego osobnego Dark
Souls. Zrobione i wystarczy: **F1 Żar Dusz** + **F4 Lore**. Reszta
(F2/F3/F5/F6) **odłożona** - może kiedyś, ale nie priorytet.

Zawartość mieści się w **5 rozdziałach** NB (5 polowań: Heretyk, Kat Morn,
Grabarz Ossius, Pokutnik Vael, Upadły Mistrz jako finał; 5 nagród
pancerzy). Arena 10 bossów zostaje.

Mamy już spellblade (perk + seale + H), gildię Zakon Dusz (polowania, arena,
nagrody rozdziałowe), dusze bossów jako walutę i nieodwracalną profesję.
Czego brakuje, żeby "czuć" Dark Souls:

| Filar souls | Mamy? | Faza |
|---|---|---|
| Ryzyko/nagroda za niesione dusze ("nie zgub dusz") | NIE | **F1 Żar Dusz** |
| Ogniska: odpoczynek, leczenie, kotwica, bank | NIE | F2 Ogniska Zakonu |
| Ograniczony zasób leczenia (estus) | NIE | F3 Czara Dusz |
| Fabuła przez itemy i NPC (upadły zakon) | częściowo | F4 Lore |
| Eskalacja przy powtórce (NG+ lite) | NIE | F5 Poziom Udręki |
| Nieodwracalny wybór końcowy | NIE | F6 Ostateczny wybór |

## F1 — Żar Dusz (Embers / Hollowing)  ← W TOKU

Rdzeń pętli souls: dusze bossów, których **jeszcze nie wtopiłeś** (nosisz przy
sobie), to "żar". Żar Cię wzmacnia, ale czyni kruchym:

- niesione dusze (`npc_hasitems(hero, bosssoul)`), cap 20 = "żar"
- **+dmg zadawany**: +1.5% / żar (cap +30%)
- **+dmg otrzymywany**: +2.5% / żar (cap +50%)  ← ryzyko > nagroda
- tylko członkowie Zakonu (inni nie czują klątwy dusz)

Decyzja gracza staje się prawdziwa: **wtopić** dusze u Mistrza (bezpieczne,
trwałe +% żywioła, kasuje ryzyko) czy **hoardować** żar dla chwilowej mocy
i grać jak glass-cannon. To dokładnie souls-owe "wracaj po swoje dusze".
Bankowanie już istnieje (dialog wtapiania) — F1 dokłada tylko warstwę ryzyka.

## F2 — Ogniska Zakonu (bonfires)

Klęczące kapliczki na stałych waypointach (pierwsze = Mistrz przy kaplicy).
Interakcja "odpocznij": pełne HP/many/wytrzymałości, doładowanie Czary (F3),
opcjonalne wtopienie żaru, ustawienie kotwicy (flavor). Rozstawienie:
kaplica + lokacje polowań. Bez nadpisywania śmierci silnika (Gothic = reload)
— ognisko to punkt-hub, nie respawn po śmierci.

## F3 — Czara Dusz (estus)

Przedmiot z ładunkami (N), on_use leczy w czasie, ładunki tylko przy ognisku.
Zamienia spam mikstur na souls-owy, napięty zasób leczenia dla Zakonu.
Ładunki i moc rosną od wtopionych dusz. Tech: item on_state + prop rozszerzenia.

## F4 — Fabuła upadłego Zakonu

Warstwa lore bez nowych assetów:
- opisy na pancerzach rozdziałowych i duszach (szept poległego)
- monologi Mistrza odsłaniające, że Zakon niegdyś upadł przed "Pierwszą Duszą"
- każdy tropiony cel = dawny czempion Zakonu, który spopielał (hollow)
- rozdz. 6 "Upadły Mistrz" = poprzedni mistrz gildii

## F5 — Poziom Udręki (NG+ lite)

Po ukończeniu rozdz. 6: dobrowolny tier udręki (wrogowie biją mocniej, lepszy
loot/dusze). Souls-owe "kolejne przejście" bez prawdziwego NG+.

## F6 — Ostateczny wybór

Nieodwracalny finał: rozniecić płomień Zakonu (trwały bonus obronny) albo
zagarnąć wszystkie dusze dla siebie (trwały bonus ofensywny + mroczna aura).
Wzorzec: nieodwracalne wstąpienie (już mamy szkielet).

## Kolejność

F1 → F4 (tanie, buduje klimat) → F2 → F3 → F5 → F6. Każda faza osobno
testowalna i wdrażana na test, potem prod ręcznie.
