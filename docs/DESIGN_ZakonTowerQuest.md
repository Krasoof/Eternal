# Runda następna: „Wieża Umarłych" — przeniesienie Zakonu Dusz (quest fabularny)

Cel klimatu (słowa zamawiającego): **dużo ciężkiej walki, dramatyzm, mało pierdolenia.**
Souls-owy quest bojowy z minimalnym dialogiem, z udźwiękowieniem.

## Lokacja

Stara wieża z zombie-bossem obok zatopionej wieży nekromanty (znana z Returninga — NB stoi
na Returningu, więc lokacja JEST w naszym świecie).

- **Przypięcie miejsca:** w grze jest już **Kamień Zwiadowcy** (`insert itmi_stext_scoutstone`,
  użycie = wypisuje najbliższy waypoint). Stań przy wieży (wejście, szczyt, komnata bossa)
  i podaj 3–4 nazwy WP — na nich zbuduję spawny i etapy.
- **Odkrycie zapasowe:** w AB_Worlds.vdf są GOTOWE, skompilowane światy areny:
  `ARENA_BOSS_NECRO.ZEN`, `ARENALOC.ZEN` — a bazowe skrypty Returninga mają całą
  infrastrukturę wejścia (`B_ENTER_ARENALOC*`). Czyli mamy jednak opcję osobnego świata
  bez Spacera — jeśli wieża w NW nie zagra, finał robimy w ARENA_BOSS_NECRO.

## Fabuła (szkielet, 5 aktów, ~10 zdań dialogu ŁĄCZNIE)

**Akt 0 — Iskra.** Po odblokowaniu areny (albo od rozdz. 3) Mistrz przy kaplicy, 1 linijka:
„Żar przyciągnął umarłych. Kaplica pada. Idziemy po nowy dom — przez trupy." Marsz.

**Akt 1 — Marsz (droga do wieży).** 2 zasadzki na trasie (fale nieumarłych ciągnących
do wieży). Zero dialogu — sama walka i ambient.

**Akt 2 — Brama.** Pod wieżą obóz oblężników-szkieletów + mini-boss **Herold Utopionego**
(kit: Darkwave + DarkBlink, tempo-shift). Po walce Mistrz, 1 linijka: „Wieża pamięta
swojego pana. Obudzimy go — i zabijemy."

**Akt 3 — Piętra.** Wnętrze wieży: 3 fale (zombie-rycerze dawnego garnizonu), każda
wyżej. Bez checkpointu — jak padniesz, od bramy (Souls). Na szczycie ołtarz.

**Akt 4 — Pan Wieży.** Boss: **Umarły Kasztelan** (zombie-boss lokacji; statystyki jak
boss Zakonu tier 4 + infuzja dozwolona). Arena = komnata szczytowa. Pełny zestaw:
fale, blink, tempo-shift, chip, Furia. Muzyka bojowa własna (patrz Dźwięk).

**Akt 5 — Rytuał.** Mistrz odprawia oczyszczenie — **obrona rytuału**: 2 minuty fal
wchodzących z dołu wieży (event obronny, timer na ekranie). Po przetrwaniu — wieża
czysta, 1 linijka Mistrza: „Dom." (dosłownie jedno słowo — dramatyzm przez ciszę).

## Nagrody / skutki świata

- **Wieża = nowa siedziba Zakonu**: Mistrz, kapliczka dusz i wejście na arenę przenoszą się
  tam (stare WP kaplicy → nowe WP wieży; runa powrotu teleportuje do wieży).
- Boss dropi **Ostrze Kasztelana** — pierwszy przedmiot z nowym statusem LEGENDARNY
  (pilot systemu bonusów legendarnych z xls/biżuterii — spięcie dwóch rund).
- Skrzynia + łóżko (respawn point gracza) w wieży — hub jak w Diablo.

## Dźwięk (udźwiękowienie — jest czym grać)

1. **Muzyka**: na teście stoi `BASSMUSICCONTROLLER.DLL` — potrafi podmieniać muzykę per
   strefa/walka. Plan: mroczny ambient wieży + osobny utwór na Kasztelana (dwa pliki OGG,
   podłączane bez DLL-owania z naszej strony).
2. **Ambient SFX**: gotowe w AB_Sounds.vdf (jęki zombie, wiatr, krypty) — VOB-y dźwiękowe
   przy spawnach fal.
3. **Głosy (mało, ale mocno)**: ~6 linijek Mistrza + 2 ryki bossa. Pipeline już opisany w
   `TEMPLATE_VoicedDialog.d` (WAV → OU). Nagrania: TTS PL (do podmiany później) albo Twoje.
   Ryki bossa = przetworzone sample z AB_Sounds (zero nagrywania).

## Kolejność robót (po przejściu testów obecnej rundy)

1. Ty: Kamień Zwiadowcy → 3–4 waypointy wieży (+ ocena: da się walczyć w środku? ciasno?).
2. Ja: spawny + akty 1–3 (fale, mini-boss) — czysty skrypt, wzorce już są (huntery rozdziałowe).
3. Ja: Kasztelan (kopia setupu bossa Zakonu + unikat legendarny) + akt 5 (obrona na callbackach).
4. Przenosiny siedziby (WP swap: Mistrz/kapliczka/runa) — jedna stała w kodzie.
5. Dźwięk na końcu (muzyka, SFX, głosy) — nie blokuje testów walki.

## Korekta po zwiadzie: wieża jest MAŁA (potwierdzone, screen w drodze)

Układ walk przeniesiony na zewnątrz — wieża zostaje sercem fabuły, nie areną:
- Akty 1–3 (zasadzki, obóz Herolda, fale garnizonu) — **pod wieżą i wokół niej**.
- Akt 4 (Kasztelan): jeśli screen pokaże, że komnata pomieści bossa z blinkami — w środku;
  jak nie — **ARENA_BOSS_NECRO.ZEN** przez `B_ENTER_*` (klimatycznie pasuje 1:1: arena
  nekromancka dla zombie-lorda; wieża robi za wejście/portal).
- Akt 5 (obrona rytuału) — u stóp wieży, fale schodzą się z terenu (więcej miejsca = lepszy
  event obronny niż ciasna klatka schodowa).
- Hub po queście: parter wieży (łóżko + skrzynia zmieszczą się zawsze) + Mistrz przed wejściem.

## Dubbing AI — KLEPNIĘTE. Scenariusz nagrań (8 linijek, gotowe pod TTS PL)

Mistrz Zakonu (głos: niski, zmęczony, zero patosu):
1. M1 (akt 0): „Żar przyciągnął umarłych. Kaplica pada. Idziemy po nowy dom — przez trupy."
2. M2 (akt 2, po Heroldzie): „Wieża pamięta swojego pana. Obudzimy go — i zabijemy."
3. M3 (akt 4, przed bossem): „Nie patrz mu w oczy. Patrz na ręce."
4. M4 (akt 5, start rytuału): „Osłaniaj mnie. Cokolwiek się stanie — nie przerywaj."
5. M5 (akt 5, środek fali, krzyk): „Trzymaj linię!"
6. M6 (finał): „Dom."
Kasztelan (przetworzony pitch-down, pogłos):
7. B1 (przebudzenie): „Kto... budzi... pana... tej... ziemi..."
8. B2 (Furia, <30% HP): „ZOSTANIECIE... ZE MNĄ..."

Pipeline: TTS PL (np. ElevenLabs) → WAV 44.1k mono → nazwy wg OU dialogów
(`TEMPLATE_VoicedDialog.d`) → _Work/Data/Sound/Speech. Ryki/efekty Kasztelana można też
złożyć z sampli AB_Sounds bez TTS. Muzyka: 2 utwory (ambient wieży + walka z Kasztelanem)
przez BASSMUSICCONTROLLER.

Czekam na: screen wieży + 3–4 waypointy z Kamienia Zwiadowcy (brama / wnętrze / szczyt).
