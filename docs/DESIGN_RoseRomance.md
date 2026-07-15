# „Róża Khorinis" — wątek romantyczny (DŁUGI, głęboki, voiced)

Status: **projekt rozszerzony (2026-07-15) — implementacja w `LAB/`, nic nie idzie
na System/prod dopóki całość nie gra.** Wersja pierwotna (6 scen) rozbudowana na
życzenie: wątek ma być DŁUGI i DEEP — rozciągnięty na rozdziały 2–5, z ukrytym
licznikiem, wyborami które wracają, i finałem zależnym od CAŁEJ drogi.

Głosy (Piper, do zatwierdzenia — próbki w docs/dubbing/): Adela = **gosia**,
Roderyk = **darkman** (0.95), Bezi = **mc_speech** (zastępczo; docelowo ElevenLabs
jeśli wykupisz — klon realnego aktora TYLKO za jego licencjonowanym głosem).

---

## 1. Historia — łuk na 4 rozdziały (10 scen + 3 miniquesty)

Ton: dworska miłość w brutalnym świecie. Zero cukru — każda scena ma koszt.
„Mało pierdolenia": dialogi krótkie, cisza gra, dramat w czynach.

### Postacie
- **Adela** — szlachcianka; duma + rezygnacja. NIE damsel: ma własny plan ucieczki,
  którego wątek gracza może nie poznać, jeśli Względy niskie.
- **Sir Roderyk** — narzeczony z układu. NIE karykatura: honorowy wobec równych,
  okrutny wobec słabszych. W finale może stanąć PO TWOJEJ stronie (jedna ścieżka).
- **Lord Aldwin** — ojciec; długi u Vatrasa? Nie — u ludzi Dextera (brud pod dywanem).
- **Elza** — służka; jedyne źródło prawdy o planie Adeli. Kupowana zaufaniem, nie złotem.

### Ukryty licznik: WZGLĘDY (0–100) + flaga MROK
- Względy rosną za czyny (nie za gadanie): miniquesty, obrona, pamięć o szczegółach
  (dialogi sprawdzają, czy wybrałeś wcześniej właściwe opcje — Adela ZAUWAŻA).
- MROK: jeśli rozwiązujesz sceny przemocą/groźbą tam, gdzie był inny sposób —
  flaga rośnie. Wysoki MROK zamyka najlepszy finał (Adela widzi, kim się stajesz).
  Sprzężenie z Zakonem Dusz: noszenie >3 dusz bossów przy spotkaniach = +MROK.

### Akt I (rozdz. 2) — „Spotkanie" (sceny 1–3)
1. **Kaplica** — Adela modli się nocą (ta sama kaplica, z której Zakon się wyprowadza
   do wieży — świat się zazębia). Krótka wymiana; wychodzi układ z Roderykiem.
2. **Biała róża** — miniquest: róża rośnie tylko przy wieży umarłych (nasza wieża!).
   Walka po drodze. Wybór: zerwać różę (piękny gest) / przynieść jej NASIONO
   („zasadź własną" — mniejszy efekt teraz, duży w finale — Adela pamięta).
3. **Kolacja u Aldwina** — jedyna gadana scena. Poznajesz Roderyka przy stole.
   Wybory językowe: pokora / duma / groźba (groźba = +MROK, Roderyk zapamięta).

### Akt II (rozdz. 3) — „Względy i dług" (sceny 4–6)
4. **Karawana Aldwina** — obrona karawany przed „bandytami" (ludzie Dextera
   z listem — dowód długu). Wybór: oddać list Aldwinowi / zatrzymać (lewar).
5. **Turniej o wstęgę** — Roderyk organizuje turniej (arena!). Walka 3 rund
   fair (bez mikstur — skrypt to sprawdza, Souls-style). Wygrana = wstęga Adeli
   publicznie; przegrana = wątek TRWA, ale inną ścieżką (Adela docenia blizny).
6. **Elza w nocy** — Elza zdradza plan Adeli: ucieczka na statku za 2 tygodnie.
   Wybór: wesprzeć plan / wyperswadować / POWIEDZIEĆ ADELI że wiesz (zaufanie!).

### Akt III (rozdz. 4) — „Kryzys" (sceny 7–8)
7. **Zerwanie układu** — Aldwin (z listem albo bez) próbuje zerwać zaręczyny.
   Roderyk odpowiada: dług przejęty od Dextera — Aldwin ALBO ślub, ALBO ruina.
   Tu decyduje MROK: możesz spłacić dług (ogromne złoto), zabić wierzycieli
   (+MROK, konsekwencje), albo znaleźć trzecią drogę (dowód, że dług sfałszowany
   — questowy research, najtrudniejsze, najlepsze).
8. **Porwanie/ucieczka** — zależnie od sceny 6: Adela ucieka (i Roderyk ją ściga)
   ALBO Roderyk wymusza ślub natychmiast. Pościg nocą, walka na klifie.

### Akt IV (rozdz. 5) — „Finał" (sceny 9–10)
9. **Pojedynek honorowy** — z Roderykiem, na jego warunkach (bez zbroi? bez
   mikstur? — on wybiera, bo Ty wybierałeś wcześniej). WYJĄTEK: przy niskim MROKU
   i dowodzie fałszerstwa Roderyk NIE walczy — łamie miecz i odchodzi (najrzadszy,
   najlepszy anty-finał: wróg z honorem).
10. **Rozwiązanie** — trzy zakończenia:
    - **Dom** (Względy wysokie, MROK niski): Adela zostaje z Tobą; jeśli dałeś
      NASIONO w sc. 2 — przed wieżą Zakonu rośnie róża (trwały vob, codzienny
      drobny buff „Pamięć Róży" +morale/regen przy wieży).
    - **Statek** (Względy średnie / wsparłeś ucieczkę): Adela odpływa wolna.
      Zostaje list + wstęga (item-pamiątka, slot amulet, drobny bonus).
    - **Popiół** (MROK wysoki): Adela patrzy na to, kim jesteś — i wybiera
      Roderyka. Nie dlatego, że go kocha. Bo się Ciebie boi. (Gorzko, zero walki.)

### Miniquesty poboczne (podbijają Względy, opcjonalne)
- **Klejnot matki** — odzyskaj z wraku na dnie zatoki (nurkowanie, timer oddechu).
- **Lekcja szermierki** — Adela chce umieć się bronić: nauczka w 3 sesjach
  (mini-gra parowania! synergia z parry core — uczysz JĄ, gra uczy Ciebie).
- **List do nikogo** — dostarcz list Adeli na grób jej matki w burzę. Bez walki.
  Sama droga. (Cisza jako scena — najtańsza i najmocniejsza.)

---

## 2. Dubbing (AI) — pipeline

Gothic gra głos z pliku .wav nazwanego jak **Output-Unit (OU)** z dialogu.
- Składnia: `AI_Output(mowca, sluchacz, "OU_NAME"); // napis`
  (Bezi mówi: other→self; NPC: self→other)
- Plik: `_work\Data\Sound\Speech\<OU_NAME>.wav` — IMA ADPCM, 22/44.1 kHz, mono.
- Po dodaniu OU: skasować `OUINFO.INF`, `OU.BIN`, `OU.CSL` i odbudować
  (Voice Output Helper z MDK — „Output-Units update").
- Konwencja nazw: `DIA_STEXT_ROSE_<POSTAC>_<SCENA>_<NN>`.
- Manifest: `docs/RoseRomance_OU.csv` (nazwa OU | głos pipera | length_scale | kwestia).
- Generacja: `tools/piper/gen.sh <glos> <out.wav> <scale> "tekst"` (setup: setup.sh).

## 3. Lokacje
- Start: ISTNIEJĄCE wnętrza (kaplica przy Bigfarm — ta zakonna; górne miasto; arena).
- Wieża umarłych spina wątki: róża rośnie przy niej, finał „Dom" zostawia tam ślad.

## 4. Kroki
- K1: Scena 1 (kaplica) w LAB — Adela NPC + dialog + OU manifest + głos gosia. PROOF.
- K2: odsłuch w grze (odbudowa OU), poprawka głosu/tempa.
- K3+: sceny po kolei, każda osobno testowalna. Względy/MROK od sceny 2.
- Prod dopiero po przejściu CAŁOŚCI na teście.
