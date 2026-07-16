# SZABLON QUESTÓW ZAKONU DUSZ + rozpiska questów

Fundament: docs/LORE_Gothic.md. Każdy quest MUSI przejść checklistę na dole.

## Szablon (obowiązkowa struktura każdego questa)

1. **HAK LOREOWY** — jedno zdanie: które prawo kosmologii ten quest dotyka
   (np. „Beliar upomina się o skradzione dusze").
2. **STAWKA OSOBISTA** — kto konkretnie cierpi/traci, jeśli gracz odpuści.
   Nigdy „bo Mistrz kazał".
3. **PĘTLA GRY** — z czego składa się rozgrywka (walka / obrona / pościg /
   wybór). Minimum 60% walki (kanon projektu: dużo ciężkiej walki).
4. **WYBÓR Z KONSEKWENCJĄ** — przynajmniej jeden, zapisywany w zmiennej,
   wraca w późniejszym queście lub finale.
5. **DZIENNIK** — prawdziwy topic (log_createtopic/b_logentry), wpis na każdy
   etap. Zero ai_printbonus jako „dziennika".
6. **DŹWIĘK** — manifest linii (mówca | głos pipera | tempo | kwestia).
   Maks 8 linii na quest („mało pierdolenia"). Beaty przez snd_play (SFX-VDF),
   docelowo OU przy przebiegu dubbingowym.
7. **KOMPATYBILNOŚĆ** — wyłącznie symbole bazowe Returninga + nasze.
   Weryfikacja każdego: grep AB_Scripts.vdf. Spawny przez wld_insertnpc na
   ISTNIEJĄCYCH WP; NPC z ai_ondead wg konwencji.

### Checklista „zero tandety"
- [ ] Czy quest ma zdanie, które gracz zapamięta? (jak „Dom.")
- [ ] Czy da się go streścić bez słowa „przynieś"?
- [ ] Czy porażka/rezygnacja COŚ zmienia w świecie?
- [ ] Czy walka ma modyfikator (teren/fale/rytuał/timer), nie samo HP?
- [ ] Czy dziennik czyta się jak opowieść, nie TODO?

---

## Questy (kolejność wdrażania)

### Q1. „Wieża Umarłych" — ZROBIONE akty 1-3 (Npc_ZakonTower.d)
HAK: Żar przyciąga umarłych — Beliar ciągnie za skradzione dusze.
Pozostało: akt 5 (obrona rytuału — fale na timerze), przenosiny huba,
finał u Pana Wieży (ARENA_BOSS_NECRO). Dźwięk: M1-M6, B1-B2 nagrane.

### Q2. „Cena Żaru"
HAK: dusza nigdy nie jest darmowa. STAWKA: nowicjusz Zakonu, który nosił
za dużo Żaru — umarli rozerwali mu obóz; znajdujesz go umierającego.
PĘTLA: podążanie śladem (krew/trupy) → 2 zasadzki → wybór: dobić i wziąć
jego dusze (MROK+, +3 dusze) / bronić go do świtu (obrona, fale, nagroda:
nauka Rycerza za darmo). KONSEKWENCJA: przeżył → stoi w hubie jako drugi
handlarz; dobity → jego upiór wraca w Q5. DŹWIĘK: 4 linie nowicjusza
(mc_speech, słabnący), 1 Mistrza.

### Q3. „Sąd Adanosa"
HAK: Zakon działa na granicy równowagi — Adanos wysyła znak. STAWKA: mag
wody (bazowy NPC z Jharkendaru — symbol do weryfikacji) żąda wydania dusz,
inaczej klątwa na Zakon (realny debuff gildii do czasu rozwiązania!).
PĘTLA: proces-próba: trzy zadania-próby (walka z żywiołowcem wody / obrona
tezy w dialogu z wyborami / oddanie CZĘŚCI Żaru). WYBÓR: oddać dusze
(tracisz Żar, zdejmujesz klątwę, +łaska) / odmówić (klątwa zostaje, ale
Mistrz uczy ukrytej nauki). DŹWIĘK: 5 linii maga (darkman wolny), 2 Mistrza.

### Q4. „Pięć Pieczęci" (intro mechaniki nasycenia — DESIGN_NewMechanics2 #2)
HAK: żywioły to języki, którymi mówią bogowie; pieczęć = słowo wykradzione.
PĘTLA: 5 nasyconych elit w świecie (po jednej na żywioł), każda w innym
regionie, każda z modyfikatorem walki. Każdy kill odblokowuje buildup
żywiołu. DŹWIĘK: 2 linie Mistrza (intro/finał).

### Q5. „Kuźnia Dusz" (hub, waluta Żar — DESIGN_NewMechanics2 #3)
HAK: przekuwanie dusz = rzemiosło na prawie Adanosa. PĘTLA: obrona
2-minutowego rytuału rozpalenia (fale, timer). Po nim: Kuźnia w wieży =
reroll legend za Żar + HANDLARZ (bronie/zbroje z puli; kupione dostają
losowy status i bonusy — obiecane przy hubie). Jeśli w Q2 uratowałeś
nowicjusza — handlarzem jest ON (ciągłość!). DŹWIĘK: M4/M5 (nagrane) + 2.

### Q6. „Upiór Nowicjusza" (tylko jeśli w Q2 dobiłeś)
HAK: dusza zatrzymana siłą wraca po swoje. Nocami w hubie gaśnie ogień;
upiór nowicjusza poluje na CIEBIE (pojawia się przy odpoczynku!). PĘTLA:
3 nawiedzenia → walka finałowa → wybór: zniszczyć (dusza przepada) /
uwolnić do Kuźni (oddajesz 3 dusze, zdejmujesz nawiedzenia, wpis w lore).
DŹWIĘK: 3 szepty upiora (mc_speech, pitch-down, pogłos).

### Q7. Romans Loy — osobny dokument: docs/DESIGN_LoaRomance.md
(kontynuacja bazowego wątku Returninga po 2 questach podstawki; styk
z Zakonem przez pieśń-magię Adanosa).

---

Wdrażanie: Q1-finał → Q5 (hub+handlarz, domyka obietnicę) → Q2 → Q3 → Q4 →
Q6 → Loa równolegle scenami. Każdy quest = osobny plik Npc_Zakon*.d
(pamiętać o EthernalBreeze.src i kolejności parsowania!).
