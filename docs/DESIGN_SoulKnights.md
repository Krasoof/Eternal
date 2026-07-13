# Projekt: Gildia „Rycerze Dusz" (Soul Knights)

Status: **przegląd + plan do zatwierdzenia** — nic nie zaimplementowane.

Gildia dodatkowa w stylu dark souls: questy, przyzywani bossowie, dusze
jako waluta rozwoju, profesja skupiona na dwóch żywiołach.

## Wymagania (od projektodawcy)

- 10 bossów przyzywanych per rozdział (wzorem łańcucha u Shivy) + 1 boss
  LUDZKI do znalezienia na mapie na start questline'u.
- Powiązanie z systemem profesji (istniejący szkielet ElementProfession):
  profesja pozwala wybrać **2 żywioły z 200% expa, pozostałe żywioły 0**
  + dodatkowe bonusy gildii.
- Gildia odblokowuje ładowanie dusz bossów w itemy (istniejące wtapianie).
- Nagroda per rozdział (po 10 bossach + quest znajdź-i-zabij):
  broń/zbroja pod wybrany build (STR / DEX / MANA).
- Całkowicie nowe modele pancerzy dla gildii.

## Audyt istniejących klocków

| Potrzeba | Istnieje | Gdzie |
|---|---|---|
| Questline przyzywanych bossów | TAK (wzorzec) | `Npc_Shiva.d` — Andriel→Baal: flagi `*_isdead`, nagrody, log |
| Dusze bossów + wtapianie | TAK | `itmi_stext_bosssoul`, drop `rx_isboss`, dialog SoulInfuse |
| Brama expa żywiołów | TAK | `ElementProfessionController` + `StExt_GetMasteryExpMult` |
| NPC + spawn + nauczyciel | TAK (wzorzec) | FireMaster/DarkMaster + `wld_insertnpc` + flagi `*Appear` |
| Licznik per rozdział | TAK | global `kapitel` + zapis flag (`rx_saveparservars`) |
| Generacja nagród pod build | TAK | `StExt_GenerateRandomItem` (klasy DexSword/Sword2H/MagicWeapon/...) + rank-aware perk roll (legendarny = gwarantowany żywioł) |
| Boss ludzki na mapie | CZĘŚCIOWO | spawn OK; **do zbadania: ustawienie `rx_isboss` na własnym NPC** (drop duszy + zaliczenie questa) |
| Nowe modele pancerzy | CZĘŚCIOWO | Droga A: nieużywane meshe z `AB_Meshes.vdf`/`Meshes.vdf` (VdfTool); Droga B: Blender/rig po stronie człowieka + pipeline-doc |

Jedyna realna niewiadoma techniczna: `rx_isboss` na custom NPC (F0).

## Plan faz

- **F0 Research**: shortlist 3–5 setów pancerzy z VDF (VdfTool, listing
  ASC); ustalić mechanizm `rx_isboss` (NB engine var? aivar?) dla
  własnych NPC; wybór waypointów: siedziba gildii + kryjówka bossa
  ludzkiego.
- **F1 Profesja „Rycerz Dusz"**: nowy tryb w ElementProfessionController
  (`SoulKnight`: dokładnie 2 wybrane żywioły ×200%, pozostałe żywioły 0);
  dialog wstąpienia z wyborem 2 żywiołów; wtapianie dusz dostępne tylko
  dla członków (przeniesienie opcji od Shivy lub gate); bonusy gildii
  (propozycje: +1% obrażeń żywiołowych za każdą wtopioną duszę, cap 50;
  podgląd rang/HP bossów; zniżka u Shivy).
- **F2 Start questline**: NPC Mistrz Dusz (spawn, dialogi, temat logu);
  quest: znajdź i zabij bossa-człowieka na mapie (poszlaki w dialogu).
- **F3 Przyzwania**: pula 10 bossów (tier skalowany `kapitel`), licznik
  zabitych w rozdziale, dialog przyzwań (jeden naraz), dusza z każdego.
- **F4 Nagrody per rozdział**: po 10 + quest → wybór STR/DEX/MANA →
  legendarna broń pod build + unikatowy pancerz gildii (mesh z F0,
  perk+aura).
- **F5**: balans, lokalizacja PL, test na `ghotic_test`, prod.

## Decyzje do klepnięcia przed startem

1. Nazwa PL gildii (propozycja: „Rycerze Dusz").
2. Zestaw bonusów profesji.
3. Wybór 2 żywiołów: nieodwracalny czy reset za wysoką opłatą?
4. Lokalizacje: siedziba gildii, kryjówka bossa ludzkiego.
5. Czy 10 bossów to jedna wspólna pula co rozdział, czy rosnąca
   trudność/nowe twarze per rozdział?
