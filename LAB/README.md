# LAB — robocza kopia System+Data (eksperymenty)

Zasada: nowe mechaniki i questy powstają TUTAJ (kopia `System/` + `Data/`),
nic nie dotyka żywego `System/` (test/prod) dopóki właściciel nie klepnie.
`LAB/Data/` jest w .gitignore (za duże); `LAB/System/` jest wersjonowane.

## Co już siedzi w LAB (ponad żywy System):

1. **Postura bossów (poise)** — bossowie Zakonu stun-immune POZA oknem ~3 s po
   perfekcyjnej paradzie; w oknie każdy cios wręcz rzuca stun (40%+35 bonus).
   Pliki: DamageUtils.d (guard w StExt_StunTarget), DamageController.d (okno
   po paradzie + proc), GlobalVars.d, HeroActionsController.d (callback).
   Quest-intro „Lekcja Rytmu" — do dopisania (patrz docs/DESIGN_NewMechanics2.md).

2. **Róża Khorinis — Scena 1 (Spotkanie)** — Adela (vlk_99750) w kaplicy przy
   Bigfarm od rozdz. 2 (spawn w ModController), pełny dialog voiced (OU nazwane,
   wav-y w docs/dubbing/rose/). Zmienne: StExt_Rose_Scene/Favor/Dark.
   Pełny łuk: docs/DESIGN_RoseRomance.md. Manifest głosów: docs/RoseRomance_OU.csv.

## Jak testować LAB:
skopiuj `LAB/System/Autorun/EthernalBreeze/` na test ZAMIAST żywego
(zrób kopię żywego wcześniej!), głosy z docs/dubbing/rose/ →
`_Work/Data/Sound/Speech/` + odbudowa OU (DESIGN_RoseRomance.md sekcja 2).

## Promocja LAB → System:
po klepnięciu zmiany przenosimy plik po pliku do `System/` (diff, nie kopia
całości — w międzyczasie żywy System mógł się zmienić).
