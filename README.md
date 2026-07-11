# EthernalBreeze

Nakładka (overlay) na moda **Gothic II: New Balance**, rozszerzająca rozgrywkę o
nowe systemy: craft, alchemię, wzmacnianie przedmiotów (Magic Infusion), aury,
efekty czasowe, dodatkowe zdolności NPC, losowość świata/lootu, zdejmowanie
capów statystyk, dodatkowy leveling i inne.

Mod działa jako wtyczka **Story Extension (StExt)** na silniku Union
(Ikarus/LeGo) i **wymaga zainstalowanego Gothic II: New Balance** jako bazy -
sam w sobie nie jest samodzielną grą ani samodzielnym modem.

- Wersja: **3.08**
- Lokalizacja: niemiecki (oryginał) + angielski (tłumaczenie AI, może zawierać błędy)

## Zawartość repo

```
Data/                       paczka danych gry (.vdf) - NIE jest w tym repo, patrz niżej
System/Autorun/
  EthernalBreeze/            skrypty główne moda (kontrolery, itemy, dialogi, dane)
  EthernalBreezeConfigs/     configi eksportowane / configi użytkownika
  EthernalBreezeExtensions/  tweaki użytkownika, dodatkowa lokalizacja
  StExt_EthernalBreeze.dll   biblioteka wtyczki
_Optional/
  English/, German/          alternatywne pliki lokalizacji do podmiany
  Debug Build (dll)/          wersja .dll z logami debug (silnik)
  LocalizationChecker/        narzędzie do porównywania stringów lokalizacji
  EthernalBreeze.pdf          instrukcja / opis moda
  EB.ico                      ikonka moda
```

## Ważne - paczka danych (.vdf)

Plik `Data/EthernalBreeze.vdf` (tekstury/modele/dźwięki, ok. 700 MB) **nie jest
częścią tego repozytorium** - jest za duży na Githuba. Zostanie przesłany
osobnym kanałem (Drive / Mega / Discord).

> TODO: wkleić link do paczki `.vdf`, jak już wrzucisz ją gdzieś w chmurze.

## Instalacja

1. Zainstaluj i uruchom przynajmniej raz **Gothic II: New Balance**.
2. Skopiuj `Data/EthernalBreeze.vdf` (dosłane osobno) do folderu `Data` w
   katalogu gry.
3. Skopiuj zawartość folderu `System/Autorun` do `System/Autorun` w katalogu gry
   (z podmianą/scaleniem).
4. Opcjonalnie: podmień plik lokalizacji z `_Optional/English` lub
   `_Optional/German` w `System/Autorun/EthernalBreezeExtensions`, jeśli
   chcesz innego języka niż domyślny (patrz `readme.txt` w tych folderach -
   **nie** podmieniaj oryginalnego `EthernalBreeze/Localization.d`, bo gra się
   nie uruchomi).
5. Domyślnie używana jest zwykła wersja `StExt_EthernalBreeze.dll`. Wersję z
   `_Optional/Debug Build (dll)` podmień tylko, jeśli potrzebujesz logów debug
   z silnika.

## Narzędzia pomocnicze

`_Optional/LocalizationChecker/GothicLocalizationChecker.exe` - porównuje
stringi z `EthernalBreeze/Localization.d` z plikiem tłumaczenia i pokazuje,
czego brakuje (źródła: https://github.com/StonedWizzard/GothicLocalizationChecker).
