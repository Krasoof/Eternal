# Dokumentacja techniczna Returninga (dla nas, na potem)

Notatki o mechanikach bazy, które możemy reużyć/podpiąć. Zasada projektu:
pracuj z natywnym DLL/mechaniką, nie nakładką. Wszystko zweryfikowane grepem
po AB_Scripts.vdf (skompilowany GOTHIC.DAT trzyma symbole jako plaintext).

## Wojownik Adanosa — system umiejętności (DIA_ADANOSWARRIORSKILL_*)

Klasa wojownika Adanosa ma rozbudowane drzewko umiejek uczonych u nauczyciela
(RX_ADANOSWARRIORTEACHER_*). Rodziny:
- **LIGHTNINGSTRIKE** (+ INSTANT, + TIME, + PROC): przywołanie BŁYSKAWICY
  spadającej na cel. Flaga nauki: `RX_AW_SKILLS_LIGHTNINGSTRIKELEARNED`.
  Wykonanie: `RX_FORM_ADANOSWARRIOR_LIGHTNINGSTRIKE` — **implementacja w
  zamkniętym DLL Returninga (UNION), źródła brak.** Animacja + FX odpalane
  wewnątrz DLL. Nie da się przeczytać ani wprost wywołać z sensownymi
  parametrami żywiołu.
- **ENCHANT{FIRE,COLD,ELECTRO}** (+ warianty DAMAGE/FREEZE/SLOW/BURST/FAST/
  INSIDE/PROC/MOREDEF): czasowe naenchantowanie broni żywiołem — nasz system
  pieczęci/perków robi to samo, więc mamy własny odpowiednik.
- Reszta: ADANOSLUCK, CLEANRUNE, ENERGYHIT, HEALSURGE, WRATH, MANA*, SHIELDS,
  RANGEUP, COMMONCOOLDOWN (globalny CD umiejek).

WNIOSEK: samej błyskawicy z DLL nie „ukradniemy" 1:1 (zamknięta), ALE jej
CZĘŚĆ WIZUALNA to spadający-z-nieba FX, a takie FX baza ma dla KAŻDEGO
żywiołu (niżej). Więc odtwarzamy efekt natywnymi FX + własnym triggerem.

## FX „uderzenie z nieba / obszarowe" per żywioł (zweryfikowane, base)

| Żywioł | FX bazowy | Uwaga |
|---|---|---|
| Elektro | SPELLFX_LIGHTNINGFLASH_HEAVENSRAGE | dosł. „gniew niebios" — błyskawica z góry |
| Ogień | SPELLFX_FIRERAIN / SPELLFX_FIREMETEOR | deszcz ognia / meteor |
| Lód | SPELLFX_ICERAIN | grad/sople z góry |
| Powietrze | SPELLFX_MASTEROFDISASTER / THUNDERSTORM | tornado/burza |
| Ziemia | SPELLFX_QUAKE / SPELLFX_GEYSER | wstrząs / gejzer |
| Śmierć/Mrok | SPELLFX_BREATHOFDEATH | fala śmierci |

Odtwarzanie: `rx_playeffect(FX, target)` na pozycji celu (już tak robimy przy
erupcji żywiołu). Elektro może zostać dosłownie „błyskawicą" jak chce user.

## Animacja „przywołania" (gest gracza)

DLL-owa błyskawica gra własną animację (niedostępna). Dla naszej wersji:
`ai_playani(hero, ...)` z animacją castu. Kandydaci (base): `T_MAGRUN_2_*`,
`T_HEASHOOT_2_STAND`, `T_INVESTBLAST`. UWAGA: gracz z bronią ma overlay
wojownika — animacje magów mogą nie zagrać czysto; do przetestowania w grze,
awaryjnie gest bronią (atak/whirl) albo bez dedykowanej animacji (sam FX).

## Wzorzec „umiejętność DLL" w Returningu

RX_FORM_* = formy/akcje w DLL Returninga. RX_AW_SKILLS_*LEARNED = flagi
nauki (parser vars, czytelne ze skryptu — możemy warunkować NA NICH). Umiejki
mają wspólny cooldown (COMMONCOOLDOWN). Nauczyciele: RX_*TEACHER_TEACH*.

## Nasze podpięcie (patrz DESIGN_ElementStrike.md)

Nie ruszamy klasy Adanosa. Budujemy WŁASNĄ umiejętność „Uderzenie Żywiołu":
element z pieczęci/przysięgi Zakonu → FX z tabeli wyżej spada na cel +
obrażenia żywiołu. Elektro = błyskawica. Trigger: klawisz (jak H) albo
ewolucja naładowanego ciosu.
