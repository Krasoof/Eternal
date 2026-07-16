# Audyt martwych mechanik (2026-07-16)

Skan pod kątem mechanik, które są okablowane, ale NIE działają. Główny wektor
śmierci: edycja `StExt_DamageInfo.RealDamage` w handlerach *Before* była
wyrzucana przez DLL (oryginalny `oCNpc::OnDamage` czyta deskryptor, a
`UpdateDamageInfo` po nim nadpisuje RealDamage z powrotem z deskryptora).

## A. Martwe przez RealDamage-w-Before (NAPRAWIONE fixem DLL)

Fix (Damage.cpp, po OnDamageBegin): dla ciosów z udziałem bohatera skaluję
surowe kanały deskryptora o współczynnik RealDamage (obie strony, obie
kierunki; pełna mitygacja zeruje cios). Gate: hero atakuje LUB obrywa.

| # | Mechanika | Miejsce | Było | Teraz |
|---|---|---|---|---|
| 1 | Premia klasowa broni (miecze/topory/lekkie) | Hero_BeforeOffence | martwe | ŻYWE |
| 2 | Żar Dusz — bonus ofensywny | Hero_BeforeOffence | martwe | ŻYWE |
| 3 | Żar Dusz — kruchość (obrona) | Hero_BeforeDefence | martwe | ŻYWE |
| 4 | Pancerz Dusz (perk Rycerza, -8% wręcz) | Hero_BeforeDefence | martwe | ŻYWE |
| 5 | Żelazna Wola (legend. zbroja, -10% wręcz) | Hero_BeforeDefence | martwe | ŻYWE |
| 6 | Tarcza Ducha (legend. zbroja, -15% magia) | Hero_BeforeDefence | martwe | ŻYWE |
| 7 | Żelazna Skóra (legend. biżuteria, -10% wręcz) | Hero_BeforeDefence | martwe | ŻYWE |

Uwaga: mitygacje obronne są PRZYBLIŻONE (skala surowego dmg vs odejmowana
ochrona) — kierunek poprawny, wartość ±kilka % od nominału. Akceptowalne.
Chip bossa (2% HP) NIE był martwy — edytuje HP wprost, nie RealDamage.

## B. Martwe/nieszkodliwe (do wiedzy, bez akcji)

- `IsExtraDamageProhibitedFunc` (DLL) — związany do złej funkcji
  (`StExt_UpdateUiStatus`), ALE **nigdzie nie wołany** → martwe wiązanie,
  zero efektu. Feature "extra damage prohibited" nie istnieje. Zostawiamy.
- Stara aura żywiołu legendarnej zbroi/biżuterii — CELOWO wyłączona
  (zastąpiona katalogiem legend), instancje/property zostają dla save'ów.
- Erupcja żywiołu v1 (na pieczęci) — zastąpiona v2 (składowe obrażeń);
  v1 usunięta, nie martwa.

## C. Sprawdzone, ŻYWE (fałszywe podejrzenia)

- Aegis (StExt_TriggerAegisOnDefence / ApplyAegisSlot) — wołane z
  Hero_AfterDefence, działa.
- Release naładowanego ciosu (H) — StExt_TriggerWeaponSkillOnHit wołany
  z Hero_AfterOffence (796), działa.
- Poświata broni — naprawiona osobno (kotwica ZS_RIGHTHAND usunięta).
- Wszystkie bonusy przez `StExt_ExtraDamageInfo.Damage` (mastery, lifesteal,
  Furia, proce) — żywe (to sprawdzona ścieżka, nie dotyczył jej bug).

## Wniosek metodyczny (do Zasad/pamięci)

REGUŁA: w handlerach *Before* NIE modyfikuj `StExt_DamageInfo.RealDamage`
zakładając, że zadziała bez fixu DLL. Od teraz DLL robi zapis zwrotny dla
ciosów bohatera — więc RealDamage w Before DZIAŁA dla hero-involved. Dla
NPC-vs-NPC dalej używaj `StExt_ExtraDamageInfo.Damage` albo edycji HP wprost.
