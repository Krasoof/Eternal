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

Ryzyka: wnętrze wieży może być za ciasne na fale (wtedy fale POD wieżą, boss w środku);
jeśli WP w środku wieży brak — finał w ARENA_BOSS_NECRO.ZEN przez infrastrukturę B_ENTER.
