# EthernalBreeze

Nakładka na **Gothic II: New Balance / Returning**. Gothic ze szkieletem Soulsa
i lootem z Diablo: dużo ciężkiej walki, dramatyzm, mało pierdolenia.

Mod działa jako wtyczka **Story Extension (StExt)** na silniku **Union**
(Ikarus/LeGo) i **wymaga zainstalowanego Gothic II: New Balance** jako bazy —
sam w sobie nie jest samodzielną grą ani samodzielnym modem.

Baza: https://sefaris.eu/new-balance

---

## Co się zmieniło

### Walka
- **Perfekcyjna parada.** Parujesz w oknie ~25 klatek przed ciosem → zwrot
  wytrzymałości, 1,5 s okno riposty (+50% obrażeń, za darmo), anulowanie chipa
  od bossów. Każdy bonus „za parowanie" w modzie chodzi po tym jednym systemie —
  nie ma drugiego, równoległego.
- **Buildup żywiołowy (Souls).** Trafienia bronią żywiołową ładują pasek celu.
  Przy 30% jego max HP następuje erupcja: ogień = DoT, lód = zamrożenie,
  elektryka = wybuch, mrok/śmierć = 8% max HP, reszta = stagger. **Zero
  losowości** — to deterministyczny zegar, nie ruletka.
- **Premie per typ broni** — miecze, topory i sztylety skalują się osobno.
- **Liczby obrażeń** wyskakują nad przeciwnikiem.
- **Płynne przejścia animacji** — wyjście z walki nie szarpie.

### Loot i przedmioty
- Poziomy przedmiotów, rangi, jakość i losowane bonusy (Diablo).
- **Legendarne (ranga 5)** dostają automatycznie bonus z puli danego slotu — bez
  osobnych definicji itemów.
- **Perk żywiołowy na broni** — czysty, przewidywalny bonus do każdego trafienia,
  bez rzucanych czarów. Broń świeci kolorem swojego żywiołu. Wywalone waniliowe
  „SpecialDamage" (te losowe żółte liczby).
- **Seale** — gniazda w broni. Osobny slot zaklęcia, procujący co X trafień, sam
  się levelujący (max 10). Dwa seale fizyczne (Krwawienie, Przebicie Pancerza)
  dla buildów bez many.
- **Kucie i zaklinanie działa na TYM SAMYM przedmiocie** — item zachowuje nazwę
  i model, dostaje tylko świeży roll. Koniec z losowaniem nowego.

### Zakon Dusz — gildia dark-souls
- Wstąpienie to **nieodwracalny** wybór 2 żywiołów: te dwa ×200% expa, reszta
  na 0. Rekompensata: bonus do obrażeń za każdą wtopioną duszę bossa.
- **Polowanie**: jeden nazwany, tropiony cel na rozdział.
- **Arena**: 10 nazwanych bossów w ustalonej kolejności. HP rośnie o 10% z każdym
  kolejnym — dziesiąty jest ścianą, pierwszy nie.
- Każdy boss dropi duszę + gwarantowany lup. Komplet = unikatowy pancerz gildii,
  inny na każdy rozdział.

### Ekonomia, która ma sens
- **LP jest ceną, złoto jest formalnością.** Złoto farmisz w nieskończoność, więc
  nigdy nie może być prawdziwą bramką. Perk kosztuje 10k złota i **100 PN** —
  a nie 30k złota i 30 PN, jak było.
- **Capy statów rosną z rozdziałem.** Bonus, który w 5. rozdziale dobija do 1500,
  w 1. nie przekroczy 300. Item wylosowany raz zostaje ze swoimi wartościami —
  bramka kształtuje progresję, nie nerfi tego, co już masz.
- **Wszystko w procentach, nigdy płasko.** Płaskie liczby one-shotują na starcie
  i są śmieciem przy bossie ze 100k+ HP.
- **Regeneracja tylko zwraca ułamek kosztu, nigdy nie wychodzi na plus.** Każde
  rzucenie to podatek 7% many, każdy cios 8% wytrzymałości. Dlatego nie da się
  blokować w nieskończoność.
- **Zero efektów „po śmierci"** przeciwnika. Globalnie wyłączone.

### Profesje żywiołów
- Expienie żywiołu (piromancja, elektromancja itd.) jest zablokowane, jeśli gracz
  nie wybrał profesji tego żywiołu — koniec z „expieniem wszystkiego po trochu".

---

## Co jest teraz w produkcji

Wszystko powyżej jest wgrane i grywalne. Świeżo weszło:

- premie per typ broni (miecz / topór / sztylet)
- drabinka HP bossów areny (+10% na slot)
- capy statów bramkowane rozdziałem
- ekonomia perków oparta na LP
- liczby obrażeń nad wrogami
- płynne przejścia animacji
- poświata broni na ostrzu (wcześniej siadała na rękojeści)

---

## Instalacja

1. Zainstaluj i odpal przynajmniej raz **Gothic II: New Balance**.
2. Wrzuć `Data/EthernalBreeze.vdf` (paczka ~700 MB, dosyłana osobno — za duża na
   Githuba) do folderu `Data` w katalogu gry.
3. Skopiuj zawartość `System/Autorun` do `System/Autorun` w katalogu gry
   (z podmianą/scaleniem).

Paczka `.vdf`: https://drive.google.com/file/d/1hUg63ilISaY1N5s63bnAqbeU1BZPBM-p/view?usp=sharing
Silnik StExt: https://drive.google.com/file/d/1B94P-WNC5ADoR5vCVzhEMM0fEoBSym1j/view?usp=sharing

W `_Optional/` leży wersja DLL z logami debug (podmieniaj tylko, jeśli zbierasz
logi), alternatywne lokalizacje (EN/DE) i `LocalizationChecker`.

Lokalizacja: polski + niemiecki (oryginał).

---

## Podziękowania

- **StonedWizzard** — za **Story Extension (StExt)**, silnik wtyczki, na którym
  stoi cały ten mod. EthernalBreeze to nadbudowa nad jego pracą: bez StExt nie
  byłoby tu nic.
  Narzędzia: https://github.com/StonedWizzard/GothicLocalizationChecker
- **Zespół Union** — Union / Ikarus / LeGo.
- **Twórcy New Balance / Returning** — baza, na której to wszystko chodzi.
