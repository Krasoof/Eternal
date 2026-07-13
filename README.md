# EthernalBreeze

Nakładka (overlay) na moda **Gothic II: New Balance**, rozszerzająca rozgrywkę o
nowe systemy: craft, alchemię, wzmacnianie przedmiotów (Magic Infusion), aury,
efekty czasowe, dodatkowe zdolności NPC, losowość świata/lootu, zdejmowanie
capów statystyk, dodatkowy leveling i inne.

Sprawdz tutaj : https://sefaris.eu/new-balance

Mod działa jako wtyczka **Story Extension (StExt)** na silniku Union
(Ikarus/LeGo) i **wymaga zainstalowanego Gothic II: New Balance** jako bazy -
sam w sobie nie jest samodzielną grą ani samodzielnym modem.

- Wersja: **0.01**
- Lokalizacja: niemiecki (oryginał) + polski AI

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

## Ważne - paczka danych (.vdf) i silnik

Plik `Data/EthernalBreeze.vdf` (tekstury/modele/dźwięki, ok. 700 MB) **nie jest
częścią tego repozytorium** - jest za duży na Githuba. Zostanie przesłany
osobnym kanałem (Drive / Mega / Discord). Ukradzione

[> TODO: wkleić link do paczki `.vdf`, jak już wrzucisz ją gdzieś w chmurze.](https://drive.google.com/file/d/1hUg63ilISaY1N5s63bnAqbeU1BZPBM-p/view?usp=sharing)

Sinik SText : https://drive.google.com/file/d/1B94P-WNC5ADoR5vCVzhEMM0fEoBSym1j/view?usp=sharing

## Instalacja

1. Zainstaluj i uruchom przynajmniej raz **Gothic II: New Balance**.
2. Skopiuj `Data/EthernalBreeze.vdf` (dosłane osobno) do folderu `Data` w
   katalogu gry.
3. Skopiuj zawartość folderu `System/Autorun` do `System/Autorun` w katalogu gry
   (z podmianą/scaleniem).
5. Domyślnie używana jest zwykła wersja `StExt_EthernalBreeze.dll`. Wersję z
   `_Optional/Debug Build (dll)` podmień tylko, jeśli potrzebujesz logów debug
   z silnika.

## Narzędzia pomocnicze

`_Optional/LocalizationChecker/GothicLocalizationChecker.exe` - porównuje
stringi z `EthernalBreeze/Localization.d` z plikiem tłumaczenia i pokazuje,
czego brakuje (źródła: https://github.com/StonedWizzard/GothicLocalizationChecker).

## Co zmienione?

Tak naprawdę jest to zlepek modów EternalBreeze + Randomizer, poprawiony,
zbalansowany, pozbawiony błędów i zintegrowany z najnowszą wersją G2 NB. Ja
jestem autorem poprawek. Oprócz balansu (drabinki bonusów, wartości itemów,
stopnie, sumy bonusów) dobudowałem od zera kilka systemów rozgrywki —
głównie w silniku obrażeń i wokół nowej gildii Zakon Dusz.

### Silnik obrażeń broni (żywioły)

- **Perk żywiołowy** losuje się na broni przy generowaniu (podobnie do
  reszty lootu, szansa/moc rośnie z rangą - epicka/legendarna ma
  gwarantowany/wzmocniony perk). Perk to **czysty płaski bonus obrażeń**
  danego żywiołu do każdego trafienia - żadnych rzucanych czarów, żeby nie
  psuć immersji. Broń z perkiem świeci na kolor swojego żywiołu (VFX na
  ręce).
- Klawisz **H** ładuje żywioł broni (koszt many/wytrzymałości zależny od
  rodzaju magii) i daje jednorazowy boost do najbliższego trafienia,
  skalowany masterką żywiołu (poziom + moc), biegłością w typie broni i
  statami postaci. Broń bez perku daje przy próbie czytelny komunikat, że
  nie ma wbudowanego żywiołu.
- **Ataki bronią magiczną** kosztują drobną manę i dodatkowo wzmacniają
  perk żywiołowy przy okazji.
- Usunięto losowe "SpecialDamage" (dziwne żółte dodatkowe obrażenia z
  waniliowego lootu) - zastąpione w pełni przewidywalnym systemem
  perk+seal powyżej.

### Seale (gniazda w broni)

- Kamienie szlachetne wkładane w gniazda broni (gniazda tylko na broniach,
  nie na zbroi/biżuterii). Każdy seal to **osobny slot spellowy**, oddzielny
  od perku - rzuca istniejące zaklęcie ofensywne (z puli masterki danego
  żywiołu) co X trafień, zależnie od mocy seala.
- Seale **poziomują się** (exp za każdy proc, próg rośnie z poziomem, max
  10 lvl) i skalują moc wraz z levelem - nie ma jednego rodzaju seala na
  całą grę.
- Seal musi zgadzać się żywiołem z perkiem broni (silniejszy zawsze
  zastępuje słabszy przy nakładaniu). Proc kosztuje surowiec (mana/wt.)
  zależnie od żywiołu - niezapłacony proc zostaje odłożony na następne
  trafienie.
- Dwa **seale fizyczne** (bez many) dla buildów niemagicznych: Krwawienie
  i Przebicie Pancerza - kosztują wytrzymałość zamiast many, proc co cios.
- Tooltip itemu pokazuje żywioł i **wyliczone obrażenia**, ale celowo NIE
  nazwę rzucanego zaklęcia (na życzenie - psuło immersję).

### Profesje żywiołów

- Expienie żywiołu (piromancja, elektromancja itd.) jest zablokowane, jeśli
  gracz nie wybrał profesji tego żywiołu - zapobiega "expieniu wszystkiego
  po trochu".

### Zakon Dusz (Soul Knights) - dodatkowa gildia dark-souls

- Wstąpienie do gildii to **nieodwracalny** wybór dokładnie 2 żywiołów:
  te dwa dostają ×200% expa, wszystkie pozostałe żywioły spadają do 0%.
  Rekompensata: bonus do obrażeń żywiołowych za każdą wtopioną duszę bossa
  (+1%/duszę, cap 50%).
- **Polowanie per rozdział**: jeden konkretny, nazwany, tropiony cel na
  mapie na każdy z 6 rozdziałów (człowiek/nieumarły, nigdy potwór), spawnowany
  na żądanie przez dialog Mistrza Zakonu (działa też na starych save'ach -
  nie trzeba nowej gry). Zabicie odblokowuje arenę na dany rozdział.
- **Arena**: 10 konkretnych, nazwanych przeciwników w ustalonej kolejności,
  rosnąca trudność (tiery 1-4), po jednym na wezwanie.
- Każdy pokonany boss (polowanie i arena) drop'uje **duszę bossa** oraz
  gwarantowany losowy lup (złoto + magiczny przedmiot: broń/biżuteria/
  zbroja) skalowany levelem bohatera, rozdziałem i tierem przeciwnika.
- **Nagroda rozdziałowa (po polowaniu + 10/10 na arenie)**: unikatowy,
  ciężki, gotycki pancerz gildii - inny na każdy z 6 rozdziałów. Modele
  pochodzą z precompilowanych (gotowych .MDM) zasobów third-party, bo
  silnik w tej konfiguracji nie kompiluje luźnych .ASC/.TGA na starcie gry.

### Kucie w miejscu (Shiva)

- **Zaklinanie i przekuwanie** działają na TYM SAMYM przedmiocie (broń i
  zbroń) zamiast losować nowy - zaklęty/przekuty item zachowuje swoją
  tożsamość (nazwę, model), tylko dostaje magię / świeży roll statystyk.
  Przekucie (reroll) kosztuje 3000 złota; przedmioty z sealem lub perkiem
  odmawiają przekucia (nie da się "wyresetować" zainwestowanego seala).

### Drobne zmiany balansu

- Usunięto losowanie StPerHit/MpPerHit z lootu (uznane za zbyt silne).
- Sockety (gniazda seali) dostępne tylko na broniach.
