# „Roza Khorinis" — watek romantyczno-rycerski (voiced)

Status: **projekt / budowa fazami na galezi `feature/rose-order`.**
NIE ruszamy dev/prod dopoki cala rzecz nie jest zrobiona i przetestowana.

Rozbudowany, fabularny watek: rycerska milosc dworska w Khorinis, w pelni
udzwiekowiona (AI dubbing — Bezimienny + postacie). Bez systemu mechanik
(zadnych slubow/statow) — to CZYSTA FABULA z questami, dialogami i glosem.

---

## 1. Historia (szkielet)

Bezimienny poznaje mloda szlachcianke, ktora ma zostac wydana wbrew woli za
okrutnego rycerza. Rycerskimi czynami zdobywa jej wzgledy, staje z rywalem
w pojedynku honorowym i decyduje o jej losie.

### Postacie
- **Dama Adela** — mloda szlachcianka, dumna ale zlamana losem. Milosc watku.
- **Sir Roderyk** — pyszny, okrutny rycerz; narzeczony z ukladu, antagonista.
- **Lord Aldwin** — ojciec Adeli, szlachcic w tarapatach (dlugi/honor).
- **Elza** — powiernica/sluzka Adeli; podpowiedzi, plotki, drugie dno.

### Etapy (sceny) — kazda VOICED
1. **Spotkanie** — Bezimienny natrafia na Adele (modli sie w kaplicy / w
   ogrodzie dworu). Pierwsza wymiana. Wychodzi na jaw uklad z Roderykiem.
2. **Zaloty / dowody** — rycerskie czyny: przynies biala roze z niebezpiecznego
   miejsca, odzyskaj rodzinny klejnot, obron majatek/karawane Lorda Aldwina.
   Kazdy podnosi ukryte **Wzgledy** Adeli.
3. **Wstega Damy** — zdobyte wzgledy: Adela daje swoja wstege (drobny token,
   pamiatka) i prosi, byc jej rycerzem-obronca.
4. **Wyzwanie rywala** — Roderyk wyzywa Bezimiennego na pojedynek honorowy.
   Konfrontacja glosowa, walka.
5. **Kryzys** — Roderyk nie przyjmuje porazki: porywa Adele / rujnuje jej ojca /
   ujawnia spisek. Poscig i ratunek.
6. **Rozwiazanie** — finalna konfrontacja, potem WYBOR:
   - polaczyc sie z Adela (dobre zakonczenie — trwala pamiatka/flavor),
   - albo gorzki finał (Adela stracona, zostaje jej wstega — melancholia).

Rozbudowanie = 6 scen, ~4 postacie, kilka pobocznych czynnosci, wybory.

---

## 2. Dubbing (AI) — jak to dziala technicznie

Gothic gra glos z pliku .wav nazwanego jak **Output-Unit (OU)** z dialogu.
- Skladnia linii: `AI_Output(mowca, sluchacz, "OU_NAME"); // napis`
  - Bezimienny mowi: `AI_Output(other, self, "...")` (other=bohater)
  - NPC mowi: `AI_Output(self, other, "...")`
- Plik glosu: `_work\Data\Sound\Speech\<OU_NAME>.wav`
  - format: IMA ADPCM, 22 lub 44.1 kHz, 4-bit, mono (tak jak oryginal).
- Po dodaniu nowych OU trzeba **przegenerowac** liste jednostek: skasowac
  `_work\Data\scripts\_compiled\OUINFO.INF`,
  `_work\Data\scripts\content\CUTSCENE\OU.BIN` i `OU.CSL`, potem odbudowac
  narzedziem **Voice Output Helper** (z MDK) — „Output-Units update".

### Konwencja nazw OU (wazne dla porzadku)
`DIA_STEXT_ROSE_<POSTAC>_<SCENA>_<NN>`
np. `DIA_STEXT_ROSE_ADELA_MEET_00`, `DIA_STEXT_ROSE_HERO_MEET_01`.

### Podzial pracy
- **Ja (Claude):** pisze skrypty Daedalus (NPC, dialogi, questy, logika scen),
  nazwy OU + polskie napisy, oraz **manifest OU** (tabela: nazwa OU | mowca |
  kwestia) — to karmi generator glosu.
- **Ty / my razem:** generujemy glos AI z manifestu (Bezimienny = klon
  Jacka Mikolajczaka / glos ElevenLabs; Adela = glos zenski; Roderyk = twardy
  meski...), zapisujemy wav pod nazwa OU do `Sound\Speech\`, odbudowujemy OU.
- Manifest OU trzymamy w `docs/RoseRomance_OU.csv` (rosnie scena po scenie).

Glosy AI dla Gothica to sprawdzona droga — istnieje juz np. „Gothic 2
Awakening AI English Voiceover" (dowod, ze silnik to unosi).

---

## 3. Lokacja

Dwie drogi:
- **A (zalecana na start): uzyc ISTNIEJACEGO wnetrza** rycerskiego w Khorinis
  (zamek/paladyni w gornej dzielnicy, dwor szlachecki, kaplica). Zero
  pobierania, zero kompilacji ZEN, dziala od razu. Adela np. przy kaplicy /
  w dworze w gornym miescie.
- **B (opcjonalnie pozniej): wlasna lokacja ZEN** (dwor Lorda Aldwina) —
  wymaga MDK + Spacer, mesha 3ds, kompilacji i testow. Duzo pracy i ryzyka.
  Robimy TYLKO jesli watek dobrze pojdzie na istniejacym wnetrzu.

Linki (research):
- MDK (zawiera Spacer): https://github.com/GothicII/GOTHIC-MOD-Development-Kit
- Downloady G2 Gold (Resource Manager, MDK): https://www.moddb.com/games/gothic-ii-gold-edition/downloads
- Poradnik swiaty/ZEN: https://gothic-modding-community.github.io/gmc/zengin/worlds/
- Dubbing/OU (wiki, DE): https://wiki.worldofgothic.de/doku.php?id=diverses:untertitel_und_sprachausgabe
- Dowod AI VO: https://www.nexusmods.com/gothic2/mods/125

---

## 4. Kroki (powoli, po jednym)

- **K0** — backup + galaz `feature/rose-order` (ZROBIONE), plan + szablon (TU).
- **K1 — Szablon w akcji: Scena 1 (Spotkanie).** Jedna postac (Adela) w
  istniejacym wnetrzu, pelny dialog Sceny 1 z nazwami OU + napisami + wpis do
  dziennika. Cel: PROOF pipeline'u — wygenerowac glos dla ~6 linii i uslyszec
  je w grze. Gdy dziala jedna scena, mamy powtarzalny wzorzec.
- **K2 — Pipeline glosu dopiety:** ustalamy narzedzie TTS/klon glosu, robimy
  wav dla Sceny 1, odbudowa OU, test w grze.
- **K3+ — Kolejne sceny** (Zaloty → Wstega → Rywal → Kryzys → Finał),
  kazda: skrypt + manifest OU + glos + test. NPC-e i questy dokladane po kolei.
- **Kn — Opcjonalnie** wlasna lokacja ZEN (droga B), jesli zechcemy.

Kazda scena osobno testowalna. Nic nie idzie na prod, dopoki calosc nie gra.
