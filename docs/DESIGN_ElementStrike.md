# „Uderzenie Żywiołu" — wielożywiołowe uderzenie z nieba

Inspiracja: błyskawica wojownika Adanosa z Returninga (spada na cel). Bazowa
umiejka jest w zamkniętym DLL — NIE kradniemy jej, tylko odtwarzamy EFEKT
natywnymi FX bazy i podpinamy pod nią KAŻDY żywioł (patrz TECH_Returning.md).
Elektro zostaje dosłowną błyskawicą (życzenie usera).

## Rdzeń
Gracz z bronią o żywiole (pieczęć/perk) LUB zaprzysiężonym żywiołem Zakonu
odpala uderzenie: gest przywołania → z nieba na cel spada efekt żywiołu →
obrażenia żywiołowe (obszarowo w małym promieniu). Żywioł = element broni;
jak brak — element z zaprzysiężonej pary Zakonu (pierwszej).

## Mapowanie (z TECH_Returning.md)
- Elektro → SPELLFX_LIGHTNINGFLASH_HEAVENSRAGE (błyskawica — zostaje)
- Ogień → SPELLFX_FIREMETEOR (meteor)
- Lód → SPELLFX_ICERAIN
- Powietrze → SPELLFX_MASTEROFDISASTER (tornado)
- Ziemia → SPELLFX_QUAKE
- Światło → SPELLFX_LIGHTNINGFLASH_HEAVENSRAGE (jasny) / do dobrania
- Mrok/Śmierć → SPELLFX_BREATHOFDEATH

## Mechanika (spójna z Zasadami — %, zero on-death, koszt zasobu)
- **Koszt**: % max many (spellblade) — jak reszta ekonomii; brak many = brak
  uderzenia (komunikat). Wspólny cooldown (kilka sek), żeby nie spamić.
- **Obrażenia**: % max HP celu + skala od mistrzostwa żywiołu + mocy broni;
  bossom Zakonu (99710-99740) x1/3 (odporność, jak przy erupcji). Obszar:
  mały promień wokół celu (StExt_ForEachNpcInRadius — mamy).
- **Efekt statusu**: reużyć erupcję żywiołu (ogień=DoT, lód=freeze, elektro=
  burst, itd.) — spójność wizualna i mechaniczna z buildupem.
- **Deterministycznie**: zero RNG w rdzeniu (kanon). Może ładować „naboje"
  co N trafień żywiołem (jak buildup) i odpalać po naładowaniu.

## Trigger (do wyboru — pytanie do usera)
A) Nowy klawisz (config, jak StExt_Config_WeaponSkillKey).
B) Ewolucja naładowanego ciosu (H): naładuj → następny cios woła uderzenie.
C) Automatycznie po pełnym buildupie żywiołu na celu (zamiast/obok erupcji).

## Animacja
`ai_playani(hero, "<cast>")` przed FX — kandydaci w TECH_Returning.md; do
strojenia w grze (overlay wojownika). Awaryjnie: sam FX bez dedykowanej ani.

## Implementacja (po klepnięciu)
Najpierw w LAB/ (Zasada #11). Nowy plik SkillController lub rozszerzenie
ItemAbilitiesController: funkcja StExt_ElementStrike(element, target) — anim +
rx_playeffect(mapFX) + AoE dmg + status. Trigger wg wyboru A/B/C. Bez DLL na
start (czysto skryptowe FX+dmg); DLL tylko jeśli trzeba nowego klawisza.

## Otwarte pytania do usera
1. Trigger: A/B/C?
2. Uderzenie ma być pojedyncze na cel, czy krótki „deszcz" (kilka FX w AoE)?
3. Dostępne dla każdego (kto ma broń żywiołową), czy nauka u Mistrza Zakonu
   za dusze (drzewko Rycerza)?
