# Projekt: Umiejętności broni + Seale

Status: **projekt do zatwierdzenia** (jeszcze nie zaimplementowane w całości).

## 1. Dwa osobne systemy

| | Wbudowane umiejętności broni | Seale |
|---|---|---|
| Skąd | **Losują się na broni** przy generowaniu (loot), wg poziomu/rangi | **Nakłada gracz** (kamień w gnieździe) |
| Ile | 0–N na broni (rzadsze/mocniejsze na wyższej randze) | 0–N, limit = liczba gniazd broni |
| Pula | ~30 różnych (patrz §2) | 8 żywiołowych (patrz §4) |
| Baza tech. | System `ItemAbility` w DLL (trigger `OnOffence` + skalowanie masterką) | Externale `StExt_Set/GetItemSeal` (Properties[SpellId]+[SpellPower]) |
| Wyzwalanie | Pasywnie wg triggera (na trafienie, na zabójstwo…) | Pasywnie na trafienie, częstotliwość wg mocy seala |

Broń może mieć jedno, drugie, oba, albo nic. **Jeśli nic** → przy oględzinach/założeniu leci info „Ta broń nie ma wbudowanej umiejętności" (+ „można nałożyć seal, jeśli ma gniazdo").

## 2. Katalog umiejętności broni (~30)

**Żywiołowe – burst zaklęcia na trafienie (8):** Ogień, Lód, Elektryczność, Powietrze, Ziemia, Światło, Mrok, Śmierć.

**Zasoby na trafienie (4):** Kradzież Życia, Kradzież Many, Kradzież Wytrzymałości, Regeneracja na Trafienie.

**Kontrola tłumu (4):** Ogłuszenie, Zamrożenie, Odrzucenie, Spętanie.

**Obrażenia w czasie / DoT (3):** Krwawienie, Trucizna, Podpalenie.

**Modyfikatory obrażeń (6):** Szansa na Kryt, Podwójne Obrażenia, Przebicie Pancerza, Egzekucja (bonus vs niskie HP), Pogromca (bonus vs nieumarli/demony), Łowca (bonus vs zwierzęta/orki).

**Na zabójstwo (3):** Leczenie na Kill, Eksplozja na Kill, Bonus Exp/Złota na Kill.

**AoE (2):** Rozcięcie (cleave), Łańcuch (chain).

Razem: **30.** Każda ma: trigger (najczęściej `OnOffence`/`OnKill`), efekt, i skalowanie (patrz §5).

## 3. Losowanie na broni („respienie")

- W `ItemClassData.json` włączyć `AbilitiesAllowed` na klasach broni + ustawić `AbilitiesRollChance`, `AbilitiesCountMax`, bonusy per rank/level (im wyższa ranga, tym większa szansa i liczba skilli).
- Zdefiniować **pulę** dostępnych umiejętności (dane) — z podziałem na tiery (część tylko na wysokich rangach).
- Generator DLL (`ItemAbility` + `AddAbility`) przydziela je przy dropie. Zapis na itemie → przetrwa save.

## 4. Seale (8 żywiołów)

Kamienie szlachetne (wizual oparty o istniejący prototyp, np. `itmi_moonstone`), po jednym na żywioł: Ogień, Lód, Elektryczność, Powietrze, Ziemia, Światło, Mrok, Śmierć.
- **Źródło:** loot (tabela + szansa w configu), z poziomem/tierem (słabszy/mocniejszy seal).
- **Nakładanie:** `on_use` przy założonej broni → gejt gniazda (`SocketsMax > SocketsUsed`) → `StExt_SetItemSeal(bron, spellId, moc)` + `FillSockets(1)` + konsumpcja kamienia.
- **Proc na trafienie:** częstotliwość zależy od mocy seala — mocny = co cios, słabszy = co 3–4 ciosy (licznik trafień w skrypcie; albo % szansy rosnący z mocą).

## 5. Wzór obrażeń (wspólny dla skilli i seali)

```
moc = baza
    + obrażenia broni
    + poziom masterki żywiołu × k        (np. piromancja 150)
    + moc masterki żywiołu               (FireMasteryPower itd.)
    + biegłość w broni                   (1hMastery / 2hMastery / BowMastery / CBowMastery — wg typu broni)  ← NOWE, prośba użytkownika
    + staty:  broń magiczna → int + MagicPower
              łuk/kusza/sztylet → zręczność
              reszta melee → siła
```

## 6. Feedback dla gracza

- Broń bez skilla i bez seala → info „brak wbudowanej umiejętności".
- Seal / wbudowany skill → widoczny w opisie itemu (nazwa + efekt).
- (Opcjonalnie) krótki komunikat/efekt przy pierwszym procu w walce.

## 7. Kolejność wdrożenia (fazy)

1. **Seale 8 żywiołów** — strona skryptowa (itemy-kamienie, loot, nakładanie, proc na trafienie). Używa gotowych externali z DLL. Najmniejszy, testowalny krok.
2. **Biegłość broni + pełne skalowanie** — dołożyć do wzoru (§5) w istniejącej umiejętności H i w sealach.
3. **Wbudowane umiejętności broni (~30)** — przez system `ItemAbility` w DLL: włączyć losowanie, zdefiniować pulę, podpiąć efekty i feedback „brak umiejętności". Największy kawał (C++ + dane + skrypt).

Prototyp na klawiszu **H** (obecny) traktujemy jako poprzednika seali — docelowo seale są pasywne, a H może zostać jako osobna „aktywna" umiejętność albo zniknąć.
