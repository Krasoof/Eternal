# Nowe mechaniki — runda 2 (każda wprowadzona QUESTEM)

Zasada: mechanika nie spada z nieba — gracz ją ODBLOKOWUJE przez fabułę/walkę
(Souls: naucz się albo zgiń; Diablo: pętla farmy). Implementacja w `LAB/` —
nic nie dotyka System/ dopóki nie klepniesz. Wszystko na istniejących hookach.

## 1. Postura bossów (poise) + quest „Lekcja Rytmu" — [ZAIMPLEMENTOWANE W LAB]

**Mechanika:** bossowie Zakonu (99710–25) są ODPORNI na ogłuszenie — POZA oknem
3 s po Twojej perfekcyjnej paradzie. Wtedy cios wręcz ma 35% szans na stun.
Pętla walki: paruj → riposta → okno stuna → DPS. Domyka parry core.
**Quest-intro:** Mistrz Zakonu, opcja „Lekcja Rytmu" — przyzywa Upiora
Treningowego (nieskalowany, 15k HP); pokonasz go WYŁĄCZNIE parując (ma pasywkę:
obrażenia poza oknem po paradzie ×0.1). Po lekcji postura działa wszędzie.
*Hooki: StExt_Riposte_Window już istnieje; okno postury = drugi callback.*

## 2. Nasycenie żywiołem (status buildup) + quest „Pięć Pieczęci"

**Mechanika:** trafienia bronią z żywiołem ładują ukryty pasek wroga (aivar);
pełny = wybuch statusu (ogień→panika+DoT, lód→freeze 2 s, prąd→łańcuch,
śmierć→−10% maxHP). Bossowie ładują 3× wolniej. UWAGA (Twoja notka): trzeba
znaleźć FX wybuchu + pomysł na wizualizację paska (na start: print % nad
wrogiem co 25%, FX = istniejące spelle VFX z bazy).
**Quest-intro:** Mistrz daje listę 5 nasyconych elit (po jednej na żywioł,
losowane z żyjącego świata). Każdy zabity odblokowuje buildup TEGO żywiołu.
*Hooki: per-npc aivar + StExt_AddDotDamage/StunTarget/CastSpell.*

## 3. Żar Dusz (waluta elit) + quest „Kuźnia Dusz"

**Mechanika:** nasycone (infused) moby dropią „Żar Dusz". U Mistrza w wieży:
reroll bonusu legendarnego (5 Żaru) / podbicie tieru infuzji broni (10).
**Quest-intro:** po przejęciu wieży — obroń 2-minutowy rytuał rozpalenia
Kuźni (fale, wzorzec obrony rytuału z aktu 5). Kuźnia = mebel-vendor w hubie.
*Hooki: drop w OnKill po fladze infuzji; StExt_RerollItemInPlace JUŻ jest w silniku.*

## 4. Egzekucje (finishery) + próg w arenie

**Mechanika:** wróg <15% HP i ogłuszony → Twój następny cios ZABIJA (nie
dotyczy bossów Zakonu — u nich zamiast tego +50% dmg). Przy egzekucji +15%
szans na duszę. Synergia: postura → stun → egzekucja.
**Intro:** automatycznie po 10 zabójstwach na arenie — Mistrz komentuje
(1 linijka, dubbing), na ekranie odblokowanie.
*Hooki: Hero_BeforeOffence sprawdza hp+stun-stan celu.*

## 5. Krwawe Kontrakty (Diablo bounties) — tablica w wieży

**Mechanika:** tablica (mebel) w hubie: 3 losowe kontrakty dziennie
(zabij X nasyconych / typ potwora / w regionie). Nagroda: Żar + złoto,
bonus za komplet. Odświeżanie o świcie.
**Intro:** pojawia się z hubem (po queście wieży), bez osobnego questa.
*Hooki: wzorzec huntów Zakonu + licznik dzienny (Wld_GetDay).*

## 6. Nów (nightmare window) — risk/reward

**Mechanika:** co kilka nocy (nów księżyca) 22:00–6:00: wszystkie spawny
nocne dostają +1 tier infuzji, ale Żar dropi podwójnie. Komunikat wieczorem:
„Nów. Umarli są głodni." (dubbing darkman szeptem).
**Intro:** pierwszy Nów odpala się po Kuźni Dusz (żeby waluta miała sens).
*Hooki: MagicInfusion tier bump po Wld_GetDay%N + godzina.*

Kolejność: 1 (jest w LAB) → 3 (domyka hub) → 4 → 2 → 5 → 6.
