# „Głosy Wieży" — werbunek postaci do huba + romans DS-style

Fundament: docs/LORE_Ghotic.md, Zasady, szablon QUESTS_Zakon_Szablony.md.
Wzorzec: Firelink Shrine — znajdujesz w świecie złamane, ciekawe dusze,
przyprowadzasz do wieży, każda daje USŁUGĘ i ma WŁASNY, tragiczny wątek,
który rozwija się i ULEPSZA usługę (albo kończy się źle). Ton Dark Souls:
kryptyczny, melancholijny, niedopowiedziany, zero prowadzenia za rączkę.

## Zasada rekrutacji (wspólny szkielet)
Każdy rekrut: 1) znajdujesz go w świecie w złym stanie (hak lore), 2) mały
quest przyprowadzenia (walka + wybór), 3) siada w hubie (wieża) i daje usługę
tier 1, 4) łańcuch 2-3 questów pobocznych podnosi tier usługi ORAZ odkrywa
jego historię, 5) wybór w finale wątku: odkupienie (usługa max + pomoc w
walce) albo upadek (hollow — zostaje, ale pusty, usługa zamrożona). Flaga
`StExt_Hub_<Npc>` = tier 0-3. Wszyscy reagują na Żar/dusze (kanon).

## Pięciu rekrutów (łuk ch1-5)

### R1 (ch1) — BEZIMIENNY KOWAL  [głos: Harry — wojownik/ochrypły]
Kowal, który oddał swoje IMIĘ za ogień, co nie gaśnie — i zapomniał, kim był.
Kuje bez pamięci; „młot pamięta to, co człowiek zapomniał". Usługa: przekuwanie
broni / pieczęcie. Wątek: 3 okruchy jego imienia rozsiane po świecie (każdy =
walka + wspomnienie). Zbierzesz 3 → odzyskuje imię (usługa max, kuje legendy).
Zignorujesz → hollow, kuje byle jak. WYBÓR w finale: oddać mu okruchy (wraca
człowiekiem) / zatrzymać (są z duszy — moc dla ciebie, on zostaje pusty).

### R2 (ch2) — PŁACZKA  [głos: Sarah — kobiecy, matczyny, złamany]
Kobieta grzebiąca niepochowanych. Usługa: BANK DUSZ — deponujesz u niej Żar,
by nie nosić kruchości (rozwiązanie mechaniczne dla Żaru). Wątek: szuka
JEDNEGO grobu — swojego dziecka, którego duszę ktoś ukradł (może Zakon?
niewygodna prawda). Pomagasz szukać przez 3 questy. Finał: znajdujesz duszę
dziecka jako Żar w jednym z bossów. WYBÓR: oddać jej (traci się potężny Żar,
ona odchodzi w pokoju, hub traci bank) / przekuć (moc, ona przeklina wieżę).

### R3 (ch3) — ŚLEPY KANTOR  [głos: Bill — mądry, głęboki]
Ślepiec, który „widzi" dusze uwięzione w przedmiotach. Usługa: ODCZYT — ujawnia
ukryte moce legendarne / lore itemów; tier max: pieśń-buff w hubie. Wątek:
traci też słuch (ostatni zmysł); wyścig z czasem. Questy: przynosisz mu
„głosy" (nagrania dusz? runy dźwięku) by przedłużyć słuch. Finał: WYBÓR — dać
mu duszę śpiewaka (słyszy znów, ale cudzym słuchem — traci siebie) / pozwolić
ogłuchnąć w ciszy (godność, usługa zamrożona, najmocniejszy wpis lore).

### R4 (ch4) — DEZERTER  [głos: Adam — twardy, dominujący, ale pęknięty]
Rycerz upadłego zakonu, który uciekł z beznadziejnej bitwy i gnije we wstydzie.
Usługa: TRENER — tańsze nauki Rycerza Dusz + nowa postawa bojowa. Wątek:
konfrontacja z tchórzostwem przez 3 próby (odtwarza bitwę, w której uciekł).
Finał: WYBÓR — pchnąć go do odkupienia (walczy u twojego boku w finale
Zakonu, ginie z honorem) / zostawić (zostaje w hubie, pije, trener tier 1).

### R5 (ch5) — HANDLARZ Z ZAŚWIATÓW  [głos: Callum — ochrypły oszust]
Handlarz rzeczami, które umarli zostawili. Usługa: SKLEP (bronie/zbroje z puli;
kupione dostają losowy status + bonusy — spełnia obietnicę huba). Wątek: sam
jest martwy i o tym NIE WIE (klasyczny DS twist). Odkrywasz to przez 3 questy
(jego towar to jego własne rzeczy z grobu). Finał: WYBÓR — powiedzieć mu prawdę
(znika, sklep przejmuje ktoś inny — może uratowany nowicjusz z Q2 Zakonu) /
milczeć (handluje wiecznie, ale co noc znika i wraca — upiorny sklep 24/7).

## ROMANS DS-style — „POPIELICA" (Ysolde)  [głos: Lily — aksamitny, tragiczny]
Zablokowany, jeśli gracz jest kochankiem Loy (warunek: `!LOALOVER &&
!MIS_LOAROMANCE`). Kobieta związana z Zakonem długiem duszy: każdą duszę,
którą przekuwasz, ONA też czuje — jest przywiązana do CIEBIE przez ten dług.
Cichy, powolny, niedopowiedziany romans przez rozdziały (DS: Anri/Strażniczka
Ognia — nie cukier, tylko obecność i strata).
- L1 (ch2): poznajesz ją w wieży; nie mówi wprost, kim jest. Reaguje na twój Żar.
- L2 (ch3): odkrywasz dług — jej dusza jest ZASTAWEM za moc Zakonu; im więcej
  przekuwasz, tym bliżej jej końca. WYBÓR: przekuwać dalej (moc, ona gaśnie) /
  wstrzymać się (słabszy ty, ona żyje dłużej).
- L3 (ch4): próba zerwania długu — quest do starego kontraktu (walka).
- L4 (ch5) FINAŁ, trzy zakończenia:
  * **Uwolnienie** — łamiesz dług, oddając własną moc (tracisz część Żaru
    na stałe): ona wolna, zostaje w hubie, drobny stały buff „Obecność".
  * **Więź** — nie łamiesz: zostaje z tobą związana, silniejszy jesteś,
    ale w dzienniku wiesz, że ona liczy dni (gorzko-słodko).
  * **Popiół** (MROK wysoki / przekuwałeś bez opamiętania): gaśnie. Zostaje
    jej wstążka z popiołu (item-pamiątka). Najcięższy wpis.

## Dubbing (ElevenLabs — klucz miesięczny, budżet ~10 min → oszczędnie)
Głosy: Kowal=Harry, Płaczka=Sarah, Kantor=Bill, Dezerter=Adam, Handlarz=Callum,
Popielica=Lily, Mistrz Zakonu=Bill (spójnie z questami). Generujemy TYLKO
sygnaturowe linie (spotkanie, twist, finał) — reszta napisy/Piper. Pipeline:
tools/eleven_gen.ps1 → WAV 22050 → SFX-VDF (patent wieży). OU przy polish.

## Wdrażanie (w LAB, Zasada #11)
Kolejność: R1 Kowal (pełny, teraz) → Popielica L1 → R2 Płaczka → reszta.
Każdy = osobny plik Npc_Hub<Name>.d + wpis w LAB EthernalBreeze.src (kolejność!).

## STATUS (2026-07-16)
- **R1 Bezimienny Kowal — ZROBIONE w LAB** (Npc_HubSmith.d): NPC, spawn w
  ruinach wiezy (SHORE_MONSTER_02_01, od rozdz.1 dla czlonka Zakonu),
  spotkanie + werbunek + usluga przekucia broni (StExt_RerollItemInPlace,
  koszt maleje z okruchami imienia), hak questow-fragmentow. DS-dialog PL.
  Glos: **ElevenLabs Harry**, 5 linii (~29 s) w docs/dubbing/eleven/,
  SFX w QuestSounds_Hub.d. Zmienne: StExt_Hub_Smith (0-2), StExt_SmithFragments.
  DO ZROBIENIA: 3 questy-fragmenty imienia (podnosza tier + odslaniaja historie).
- Reszta rekrutow + Popielica: zaprojektowane wyzej, do implementacji po
  akceptacji R1.

## Promocja LAB -> zywy System (gdy user zaakceptuje)
1. Npc_HubSmith.d, QuestSounds_Hub.d -> System/Autorun/EthernalBreeze/ + wpisy
   w zywym EthernalBreeze.src (kolejnosc: QuestSounds po ParticleFX, NPC po
   Npc_RoseRomance/na koncu bloku Npc_).
2. GlobalVars.d, ModController.d - przeniesc DIFF (nie cala kopie).
3. WAV-y z docs/dubbing/eleven/ -> Data/STEXT_Assets.vdf pod _WORK\DATA\SOUND\SFX
   (dopisac do stagingu + tools/build_assets_vdf.ps1).
