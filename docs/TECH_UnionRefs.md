# Referencyjne repozytoria Union/Gothic (studium techniczne)

Sklonowane lokalnie do `_refs/` (gitignore — cudze repo, nie commitujemy).
Autorzy: **UnresolvedExternal** (czołowy dev Union) + **RPDPR** (UCS).
Wszystko to wtyczki **Union C++** (hooki silnika ZenGin) — dokładnie nasza warstwa
(`_EngineSrc/StExt_EthernalBreeze`). Wzorce stąd bijemy 1:1 do naszego DLL.

## 1. Union_AlterDamage — KOMPLETNA reimplementacja potoku obrażeń (złoto)
`_refs/Union_AlterDamage/src/Union_AlterDamage/Workspace/Damage/`
- **Hooki**: `oCNpc::OnDamage_Hit` (G2A `0x00731410` — DOKŁADNIE ten sam adres co
  nasz `Hook_oCNpc_OnDamage`), + `oCNpc::Archive/Unarchive` (stan per-NPC w save),
  + `zCWorld::VobRemovedFromWorld` (sprzątanie).
- **Patent override'u (czystszy niż nasz writeback!)**: zapamiętaj
  `oldHitpoints` → wywołaj oryginał → **przywróć HP** → policz WŁASNE obrażenia i
  zaaplikuj. Zamiast skalować `desc.aryDamage` po ratio (nasza obecna sztuczka),
  oni w pełni przejmują liczenie. Rozważyć migrację naszego DamageController na ten
  model — rozwiązałby to, z czym walczyliśmy (RealDamage w Before-handlerach).
- **TDamageInfo** (pełny model, `TDamageInfo.h`): `rawDamage[]`, `effectiveDamage[]`,
  `totalDamage`, `realDamage`, `scalingAttr`, `primaryDamage`, `IsCrit`,
  `strVisualFX`, `dots[]` (lista DOT-ów), kolejka fight-soundów.
- **CDamageDealer** (etapy, `CDamageDealer.h`): `IsOneHanded/IsTwoHanded/IsMelee(weapon)`,
  `GetBestScalingAttribute(weapon)`, `GetComboHit`, `SetRawDamageByWeapon`,
  `SetEffectiveDamage → SetTotalDamage → SetRealDamage`, `ApplyDamage`, `AddDots`,
  `UpdateDescriptor`. To gotowy wzorzec, jak POPRAWNIE wykrywać typ broni w C++
  (my właśnie przenieśliśmy premie per-typ do DLL — tu jest kanoniczna metoda).
- **CDotDamage** — silnik DOT (trucizna/ogień/krwawienie) z tickami. Idealne pod
  nasze krwawienie/eruptcje żywiołów zamiast doraźnych hacków.
- **CPopupDamageLabel** — pływające liczby obrażeń nad NPC (moglibyśmy zastąpić
  nasze `printscreencolor` eruptcji ładnym floaterem nad celem).
- Repo to zbiór MiniPlugins: `Union_ScriptClass` (klasy OOP w Daedalusie!),
  `Union_ScriptGui`, `Union_Gui`, `Union_Exp`, `Union_QuickLoot`, `Union_MarkItems`,
  `Union_SpellFix`, `Union_TimedOverlays`, `Union_SavesBackuper`, `Union_MiscUtils`.

## 2. Plugins_2022 — kolekcja wtyczek gameplay/combat
`_refs/Plugins_2022/src/`
- **zSarDamageFormula** — alternatywna FORMUŁA obrażeń (referencja pod nasz balans;
  pokazuje wzorzec multi-engine `ZENDEF(g1,g1a,g2,g2a)` — nam wystarcza G2A).
- **zFairCritSequence** — uczciwe sekwencje trafień krytycznych.
- **zExtendedAniUsage / zAniCrutches / zSmoothAniTransitions** — animacje (pod nasze
  „ciężkie combaty" / animację błyskawicy Adanosa).
- **zFlexMobItem / zStackMobItems** — elastyczne mob-itemy.
- **zPreciseLook**, **zBetterTransform**, **zCallScriptEventTag** (event-tagi z ani →
  skrypt), **zOrcHunter**, **zDropUnconsciousSmarter**.

## 3. Gothic-Patches — .patch (poprawki silnika) — combat najważniejsze
`_refs/Gothic-Patches/src/Patches-Improvements/` i `Patches-Special/`
- **Combat/animacje**: `zComboExtraHitFix`, `zFreezeInterruptedCombo`,
  `zSideAttackHitFix`, `zSetWeaponModeFix`, `zStartFlyDamageFix`, `zRemoveWeaponFix`,
  `zDontEquipBestWeapon`, `zSetItemOnEquip`, `zSpellCollisionFix`,
  `zSpellPropagationFix`, `zStandOnSpellCast`, `zDeadSlideFix`, `zDeadDoAIState`.
- **Special (opt-in, wprost dla nas)**: **`zInOutDamage`** (mod. obrażeń
  wchodzących/wychodzących — nasze Before-Offence/Defence!), **`zRequiredAttributeDamage`**
  (skalowanie dmg wymaganym atrybutem — pasuje do premii per-typ broni),
  **`zMaxUsedRings`** (limit noszonych pierścieni — nasz system biżuterii!),
  `zNewTalentLimit`, `zLowHpIsNotThreat`, `zProjectileDistance`, `zUnlockMotionFactor`.

## 4. Unlocked-Combat-System (UCS) — combat unlock OD STRONY DAEDALUSA
`_refs/Unlocked-Combat-System/` (UCS_gXX.dll + skrypty, GPLv3)
- Otwiera etapy liczenia obrażeń dla SKRYPTÓW (przeciwnie niż my — my liczymy w DLL).
- **FX Engine v2.0**: silnik efektów okresowych (trucizna/ogień/debuffy) z automatem
  stanów — alternatywa dla naszych TimedEffects.
- **20+ externali runtime**: hot-swap PFX, zmiana interwału ticków, przepisanie FX.
- **`UCS_GetDamageSender` / `UCS_GetDamageReceiver`** — pewne wskaźniki atakującego/celu
  (rozwiązuje problem identycznych NPC — wilki itp.).
- Save-safe (czyszczenie pamięci, brak AV na wygasłych wskaźnikach).

## Co to nam daje (priorytety)
1. **Wzorzec override'u OnDamage z AlterDamage** — potencjalnie zastępuje nasz
   kruchy writeback (skalowanie desc.aryDamage). „Zapamiętaj HP → oryginał →
   przywróć → policz swoje" jest czystsze i to samo miejsce hooka (0x00731410).
2. **CDamageDealer** = kanoniczne wykrywanie 1h/2h/melee + skalowanie atrybutem —
   walidacja/ulepszenie naszej świeżej premii per-typ broni w DLL.
3. **CDotDamage / UCS FX Engine** — porządny silnik DOT pod krwawienie i eruptcje
   żywiołów (zamiast hacków w AfterOffence).
4. **CPopupDamageLabel** — pływające liczby nad celem zamiast `printscreencolor`.
5. **Union_ScriptClass** — realne klasy/OOP w Daedalusie (czystsze questy/huby).
6. **Patche**: `zMaxUsedRings` (limit pierścieni), `zInOutDamage`,
   `zRequiredAttributeDamage`, `zComboExtraHitFix`, `zFreezeInterruptedCombo`.

## Uwaga o zgodności
Wszystko celuje w Union/ZenGin G2A — nasz stack. Adresy hooków się pokrywają
(potwierdzone OnDamage_Hit). Można podpatrywać wzorce i ewentualnie wciągać wybrane
patche, ALE: to cudzy kod (GPLv3 dla UCS!) — inspiracja/wzorzec TAK, kopiowanie do
publicznego repo NIE (jak repacki assetów — trzymamy w `_refs/`, gitignore).
