# „Cienie Drakii" — kontynuacja romansu z Loą (po podstawce Returninga)

## Kim jest Loa (KANON Returninga — zweryfikowane w sieci + symbolach bazy)

Tancerka na strzelnicy najemników przy farmie Onara. Dumna i nieufna —
w podstawce trzeba jej udowodnić, że nie jesteś „kolejnym chłopem, co chce
jednego": quest **„Widmowe marzenia"** (piękne wiersze + naszyjnik z czarnych
pereł + błękitna malwa → wyznanie na LATARNI o północy → noc razem), potem
**„Zapomniane wspomnienia Loy"**: piknik w lesie za farmą Onara (jedzenie od
Coragona za 1000 zł, 2 wina od Goraxa za 2000), przy którym wyznaje, że
pochodzi z **DRAKII** i zostawiła tam NIEDOKOŃCZONE SPRAWY. Po tym przenosi
się na południową plażę Jharkendaru (przy wraku „Jednookiej Elzy").
W Returningu wątek Drakii jest ZAMROŻONY (kraina niedostępna) — kanoniczna
dziura, którą wypełniamy.

**Kotwice (bazowe symbole, zweryfikowane):** `MIS_LOAROMANCE`,
`MIS_LOASECRET`, `LOALOVER`, `LOALOVE`, `LOALOVERDAY`, `CANSAYLOASTAY`,
`CAMLOALOVE`, `ADW_LOA_SHIP` (plaża Jharkendaru), `DIA_LOA_GODRAKIA`
(=GO DRAKIA — zamrożony hak podstawki!), `DIA_LOA_COMELH` (=Come LightHouse),
`DIA_LOA_GIVE_FLOWER/PEARL/STIHI`, `CONCERTLOA*`, `LOAPARTY` (piknik).
Start kontynuacji: po OBU questach podstawki (semantyka flag do potwierdzenia
w grze przed sceną 1). ZASADA: żadnego wyjazdu do Drakii (kraina nie istnieje
w grze) — **Drakia przychodzi do niej**.

## HAK LOREOWY
Niedokończone sprawy nie czekają. Loa uciekła z Drakii — a to, przed czym
uciekła, w końcu ją znalazło. Taniec to jej język (drakijski, obrzędowy —
dobudowa w duchu kanonu): tym tańcem kiedyś komuś coś obiecano.

## Sceny (wszystkie VOICED, osobno testowalne)

### L1. „Czarna malwa" (rozdz. 3+, Jharkendar — plaża przy Elzie)
Przy jej obozie ktoś zostawił BŁĘKITNĄ MALWĘ — spaloną na czarno (lustro
prezentu z podstawki: gracz rozpozna). Loa: „To nie zalotnik. To wezwanie."
PĘTLA: nocna warta → zasadzka 2 łowców z Drakii (ludzie, dobre bronie,
mówią o niej „własność"). WYBÓR: przesłuchać jeńca (dowiadujesz się o
Kontrakcie) / pozwolić Loi go zabić (ona zabija PIERWSZY raz przy tobie —
MROK+ dla NIEJ, wraca w finale). DŹWIĘK: 4 linie Loy (gosia), 2 łowcy.

### L2. „Taniec, który obiecał" (wyznanie)
Przy ognisku Loa tańczy — pierwszy raz OD ucieczki — i opowiada: w Drakii
zatańczyła komuś taniec zaręczynowy. Nie z miłości; sprzedał ją ojciec.
Uciekła po zaręczynach — wg prawa Drakii narzeczony ma PRAWO ją zabrać.
To on wysyła łowców. WYBÓR: „Zostań i walcz" / „Ucieknijmy razem"
(ona odmawia ucieczki — test gracza; wybór wraca w finale jako jej wyrzut
albo duma). DŹWIĘK: 5 linii Loy — najdłuższy monolog wątku, 1 Bezi.

### L3. „Posłaniec" (mini-boss)
Przybywa Posłaniec narzeczonego (mini-boss, dobry rig walki, tempo-shift):
formalnie, z prawem Drakii na piśmie, żąda wydania Loy. Opcja dyplomacji
POZORNA (odmowa = walka i tak — ale grzeczna odmowa vs plucie w twarz
ustawia MROK). Po walce: przy ciele glejt — narzeczony płynie osobiście.
„Jednooka Elza" przestaje być dekoracją: jego statek przybije TĄ plażą.
DŹWIĘK: 3 linie Posłańca (darkman 0.95), 2 Loy.

### L4. Finał: „Prawo Drakii"
Świt, mgła, statek u brzegu. Narzeczony (boss z pełnym kitem: broń, tempo,
fale załogi) + zasada honoru: Loa MUSI patrzeć. Trzy zakończenia:
- **Taniec wolnych** (L1 bez mordu jeńca + L2 „zostań i walcz"): Loa
  walczy U TWOJEGO BOKU przez cały finał (towarzysz bojowy!); po walce
  tańczy taniec zaręczynowy — tym razem z wyboru, dla ciebie. Zostaje
  (CANSAYLOASTAY - kotwica huba/farmy), stały drobny buff „Taniec Loy".
- **Krew za krew** (jeniec zabity / MROK): wygrywasz, ale Loa widzi w
  tobie drugą Drakię. Odpływa TYM statkiem — sama, wolna, bez ciebie.
  Zostaje czarna malwa (item-pamiątka, gorzki wpis).
- **Prawo silniejszego** (przegrana walka — nie game over!): budzisz się
  na plaży, statku nie ma. Dziennik: najcięższy wpis. Ślad questowy:
  handlarz w porcie słyszał, dokąd płynie... (hak pod przyszłość, gdy
  Returning kiedyś otworzy Drakię — kompatybilność w przód).

## Dźwięk
Loa = gosia (1.0-1.1); łowcy/Posłaniec = darkman 0.95; narzeczony = darkman
1.2 (ciężki); Bezi = mc_speech (do podmiany po wykupie głosu). Manifest per
scena przy implementacji (wzór: RoseRomance_OU.csv). Beaty przez SFX-VDF.

## Zgodność
Tylko bazowe symbole + nasze; bazowych dialogów Loy NIE ruszamy; spawny na
istniejących WP plaży Jharkendaru (do spisania Kamieniem na miejscu).
Adela („Róża Khorinis") pozostaje zamrożona w LAB.
