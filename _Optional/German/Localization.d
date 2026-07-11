META
{
    Mod = EthernalBreeze.vdf;
};
// DO NOT edit or change meta-block above!
// DO NOT place any symbols, coments or even empty line/space before this code.

/* 
	How to localize mods content:
	First of all make sure that encoding and codepage is valid for your language! 
	For example for russian it's 'Windows-1251' for other languages I don't know, just be ready to experiment
	
	So, after you set and done with encoding do next
	Copy all text from archive EthernalBreeze.vdf -> Localization.d
	And paste below
	Do translation and save.
	
	This file must be placed in GothicII/System/Autorun folder
*/
const string txt_spells[max_spell] = 
{
    "Heiliges Licht", "Heilende Berührung", "Heiliger Pfeil", "Reinigung durch Feuer", "Finsternis vertreiben", "Licht Innos'", "Dämonen bannen", "Teleport", "Atem des Lebens", "Teleport zum Kloster", "Teleport zur Onars Hof", "Teleportation", "Zum Pass ins Minental", "Teleportation",
    "Zur Burg der Erzbarone", "Teleportation", "Zur Taverne von Orlan", "Wunden heilen", "Licht", "Feuerpfeil", "Eispfeil", "Heilung", "Skelett beschwören", "Feuerball", "Blitz", "Wolf beschwören", "Faust des Windes", "Schlaf",
    "Reinigendes Licht", "Blitzschlag", "Großer Feuerball", "Skelettkrieger beschwören", "Furcht", "Eisblock", "Kugelblitz", "Steingolem beschwören", "Untote vernichten", "Feuersturm", "Feuerorkan", "Eiswelle", "Dämon beschwören", "Schub der Vitalität",
    "Feuerregen", "Uriziels Todeswelle", "Schwarzer Nebel", "Armee der Finsternis", "Verkleinerung", "In Zombie verwandeln", "In Hornisse verwandeln", "In Fleischwanze verwandeln", "In Golem verwandeln", "In Wolf verwandeln", "In Echsenwesen verwandeln", "In Glorh verwandeln", "In Warg verwandeln", "In Feuerwaran verwandeln",
    "In Schnapper verwandeln", "In Schattenläufer verwandeln", "In Drachen-Schnapper verwandeln", "Vergessen", "Blick Innos'", "Pfeil der Finsternis", "Todeskugel", "Energie-Wirbel", "Ork-Teleport", "Beliars Klaue", "Teleport ins Bruderschaftslager", "Reinigender Wind", "Unbeugsamer Wille", "Wächter-Beschützer",
    "Sturm", "Orkan", "Faust des Wassers", "Eisspeer", "Pyrokar-Rune", "Geysir", "Mora Ulartu", "Pfad des Kriegers", "Stimme des Wächters", "Welle des Zorns", "Feuergolem beschwören", "Schwarm", "Mit Wurzeln fesseln", "Geist verschlingen",
    "Steinwächter beschwören", "Speer der Finsternis", "Seele zerreißen", "Schrei der Toten", "Zombie beschwören", "Eisgolem beschwören", "Tor der Hüter", "Legionsdämon beschwören", "Wächter-Hüter", "Feuerschutz", "Hypnose", "Geisterpfeil", "Grauenhafter Gestank", "Krait beschwören",
    "Schneerudel beschwören", "Magischer Aufbruch", "Sumpfgolem beschwören", "Zorn der Schöpfer", "Waldwächter beschwören", "Zorn Innos'", "Energie-Wirbel", "Tar Shat", "Druidenrune", "Feuereruption", "Eiseruption", "Besessenheit", "Erdbeben", "Feuerkäfig",
    "Erschöpfung", "Schockwelle", "Feuerexplosion", "Erhebung", "Hand des Chaos", "Giftiger Biss", "Gewittersphäre", "Elektrische Welle", "Feuerwelle", "Roter Sturm", "Eisexplosion", "Schneesturm", "Heulen des Abgrunds", "Magische Sphäre",
    "Steinexplosion", "Speer der Verderbnis", "Feuereruption", "RESERVIERT", "Pfeil der Dunkelheit", "Magischer Strudel", "Kreuz der Elemente", "Sprung", "Dämon beschwören", "Mordlust", "Schwacher Fluch der Finsternis", "Schleier der Finsternis", "Gedankenkontrolle", "Dunkler Schlaf",
    "Blutdurst", "Fortgeschrittener Fluch der Finsternis", "Verstärkter Fluch der Finsternis", "Kugel der Finsternis", "Speer der Finsternis", "Große Kugel der Finsternis", "Welle der Finsternis", "Dunkle Agonie", "Teswalla beschwören", "Diener beschwören", "Rune des Lebensraubs", "Rune des Schutzes", "Rune der Seuche", "Rune der Dienerheilung",
    "Rune der Absorption", "Rune des Herrschers", "Rune der Dunkelheitsverstärkung", "Rune des Elementarschutzes", "Rune der magischen Explosion", "Skelettbogenschütze beschwören", "Skelettspeerkämpfer beschwören", "Dschinn beschwören", "Skelettgoblin beschwören", "Aura der harten Knochen", "Skelettdiener beschwören", "Skelett-Schattenläufer beschwören", "Magischer Pfeil", "Aura der Knochenmeisterschaft",
    "Aura der schnellen Knochen", "Aura der zähen Finsternis", "Aura der verzauberten Waffen", "Heilung beschworener Kreaturen", "Blutige Fessel", "Strom der Finsternis", "Blutstrom", "Tentakel der Finsternis", "Nachtsicht", "Blutentzug", "Familiargeist beschwören", "Blutwesen beschwören", "Feuerstrom", "Feuerwand",
    "Feuerstrudel", "Feuerwaffe", "Feuerkollaps", "Ansturm", "Pyrokinese", "Frostfessel", "Elektrokinese", "Erwürgen", "Töten", "Unterdrückung", "Pfeil des magischen Feuers",
	/*End of game defaults*/
	"Schatten-Golem beschwören", "Knochenhund beschwören", "Magischer Pfeil", "Skelettmagier beschwören", "Heiliges Irrlicht beschwören", "Luftgolem beschwören",
	/*buffs*/
	"Segen – Schutz", "Segen – Lebenskraft", "Segen – Attribute", "Segen – Regeneration", "Segen – Schaden",
	"Segen – Geschwindigkeit", "Segen – Ausweichen", "Segen – Energieschild", "Massenheilung",
	/*debuffs*/
	"Fluch – Verwundbarkeit", "Fluch – Schwächung", "Fluch – Lebenssiphon", "Fluch – Verlangsamung", "Fluch – Lebensblockade",
	"Fluch – Eiserne Jungfrau", "Fluch – Erhöhter Schaden", "Fluch – Schadensminderung",
	"Geist beschwören", "Knochengolem beschwören", "Schattenläufer beschwören", "Feuergeist beschwören", "Troll beschwören", "Crawler beschwören", "Schnapper beschwören",
	/*Timed effects*/
	"Feuer-Aegis", "Eis-Aegis", "Blitz-Aegis", "Dunkelheits-Aegis", "Luft-Aegis", "Erd-Aegis", "Gift-Aegis", "Äthergolem beschwören"
};

const string StExt_Str_DiffLevel[5] =
{
	" ??? ",
	"Normal",
	"Albtraum",
	"Höllisch",
	"Benutzerdefiniert"
};

const string StExt_Str_Prehistory[StExt_PreHistoryMode_Max] =
{
	" ??? ",
	"Niemand",
	"Wache vom Alten Lager",
	"Söldner",
	"Templer",
	"Feuermagier",
	"Wassermagier",
	"Guru",
	"Nekromant",
	"Erzbaron",
	"Schürfer"
};

const string StExt_Str_Learned = "Gelernt: ";
const string StExt_Str_Random = "Zufall";
const string StExt_Str_UnknownConfig = "Unbekannte Voreinstellungen erkannt!";
const string StExt_Str_LoadedConfig = "Voreingestellte Einstellungen geladen - ";
const string StExt_Str_UserConfigsNotFound = "Benutzerdefinierte Voreinstellungen nicht gefunden!";

const string StExt_Str_CorruptionName[StExt_Corruption_Max] =
{
	"Nicht entweiht",
	"Entweihter Magier",
	"Entweihter Krieger",
	"Entweihter Schütze"
};

const string StExt_Str_CorruptionDesc[StExt_Corruption_Max] =
{
	"Die Entweihung der Seele ermöglicht es, einzigartige Eigenschaften von Körper und Geist zu erlangen – um den Preis eines schweren Opfers...",
	"Ein entweihter Magier ist nicht länger nur ein Zauberwirker, sondern die Verkörperung der Magie selbst. Er hat das Fleisch verworfen und sich ganz dem Studium der Essenz der Magie und dem Ergründen des Unbekannten verschrieben. Indem er die Gesundheit seines Körpers und sein eigenes Wesen opferte, erlangte er im Gegenzug ein unglaubliches magisches Potenzial. Seine Zauber sind die Fortsetzung seines Willens, und statt Blut fließt reine Energie durch seine Adern. Nur alter, guter Stahl vermag diese Inkarnation der Magie aufzuhalten, indem er das Fleisch mühelos zerreißt...",
	"Der entweihte Krieger verkörpert den Begriff der ›lebenden Felswand‹. Nachdem er seinen geistigen Anteil verworfen und ihn vollständig in die Entwicklung seines Körpers gelenkt hat, wurde er nahezu unverwundbar. Das gesamte geistige Wesen eines solchen Kriegers hat im Physischen Gestalt angenommen – in Form eines gewaltigen Vorrats an Lebensenergie. Doch im Gegenzug ist ihm der Pfad der Magie nahezu vollständig verschlossen.",
	"Der entweihte Schütze ist ein Spezialist des Fernkampfs, der – ähnlich wie der entweihte Krieger – seine gesamte Seele in die Entwicklung seines Körpers investiert hat. Statt seine Energie jedoch in schiere Lebensreserven zu verwandeln, wählte er einen anderen Weg: Geschwindigkeit und Reaktion. Dank seiner übermenschlichen Gewandtheit kann er vielen Angriffen entgehen, und seine unmenschliche Treffsicherheit erlaubt es ihm, Feinde aus der Distanz zu töten, noch bevor sie ihre eigene Verdammnis begreifen. Diese Metamorphosen blieben jedoch nicht ohne Preis – geistige wie auch körperliche Reserven wurden zugunsten von Schnelligkeit und Angriffstempo merklich geschwächt."
};

//		*** Talents strings ***
const string StExt_Str_Talents_Header = "--- * Schulen der Magie und Kriegskunst * ---";
const string StExt_Str_Talents_Progress = "Aktuelle Stufe: ";
const string StExt_Str_Talents_Exp = "Erfahrung: ";
const string StExt_Str_Talents_Lp = "Lernpunkte: ";

const string StExt_Str_MasteryNames[StExt_MasteryIndex_Max] = 
{
	"Pyromantie", "Hydromantie", "Elektromantie", "Aeromantie",
	"Geomantie", "Magie des Lichts", "Magie der Finsternis", "Magie des Todes", "Magie des Lebens",
	"Golembau", "Dämonologie", "Nekromantie", "Geistermagie",
	"Kriegskunst", "Kunst der Verteidigung", "Kunst des Fernkampfs"
};

const string StExt_Str_MasteryLevels[StExt_TalentLevel_Max] = 
{ "Ungelehrt", "Schüler", "Adept", "Experte", "Meister", "Magister", "Großmeister" };

const string StExt_Str_MasteryDescription[StExt_MasteryIndex_Max] = 
{
	"Pyromantie – Die Kunst, die Macht des Feuers zu beherrschen",
	"Hydromantie – Die Kunst, Wasser und Eis zu beherrschen",
	"Elektromantie – Die Kunst, die Macht des Blitzes zu lenken",
	"Aeromantie – Die Kunst, die Elemente der Luft zu beherrschen",
	"Geomantie – Die Kunst, die Macht der Erde zu formen",
	"Magie des Lichts – Die Kunst der lichten Magie und der Segnungen",
	"Magie der Finsternis – Die Kunst dunkler Magie und der Flüche",
	"Magie des Todes – Die Kunst, die Essenz des Todes zu beherrschen",
	"Magie des Lebens – Die Kunst des Heilens, der Tierbeschwörung und der Verwandlung",
	"Golembau – Die Kunst, Golems zu erschaffen und zu verbessern",
	"Dämonologie – Die Kunst der Dämonenbeschwörung",
	"Nekromantie – Die Kunst, tote Diener zu erschaffen",
	"Geistermagie – Die Kunst des magischen Kampfes und der Verteidigung",
	"Kriegskunst – Die Kunst im Umgang mit Nahkampfwaffen",
	"Kunst der Verteidigung – Die Kunst des Kampfes mit und ohne Rüstung",
	"Kunst des Fernkampfs – Die Kunst im Umgang mit Fernkampfwaffen"
};


/* *** Status menu ui strings *** 	*/
const string StExt_StatsMenu_TabName[5] = { "Statistik", "Attribute", "Fähigkeiten", "Berufe", "Boni" };
const string StExt_PcStats_SectionDesc[7] = { "Fähigkeiten", "Verteidigung", "Angriff", "Auren", "Beschwörung", "Sonstiges", "Attribute" };
const string StExt_PcStats_Desc[StExt_PcStats_Index_Max] =
{
	"Lebenspunkte:",
	"Mana:",
	"Ausdauer:",
	"Lebensregeneration:",
	"Manaregeneration:",
	"Ausdauerregeneration:",
	"Stärke:",
	"Geschicklichkeit:",
	"Intelligenz:",
	"Magische Macht:",
	"Einhand-Fertigkeit:",
	"Zweihand-Fertigkeit:",
	"Bogen-Fertigkeit:",
	"Armbrust-Fertigkeit:",
	"Lebenspunkte (%):",
	"Mana (%):",
	"Ausdauer (%):",
	"Stärke (%):",
	"Geschicklichkeit (%):",
	"Intelligenz (%):",
	"Lebensregeneration (%):",
	"Manaregeneration (%):",
	"Ausdauerregeneration (%):",
	"Energieschild:",
	"Energieschild (%):",
	"Energieschild-Regeneration (pro Sek.):",
	"Energieschild-Regeneration (% pro Sek.):",
	"Ausweichchance:",
	"Schneidenschutz:",
	"Wuchtschutz:",
	"Feuerschutz:",
	"Magieschutz:",
	"Rückstoßschutz:",
	"Stichschutz:",
	"Schneidenschutz (%):",
	"Wuchtschutz (%):",
	"Feuerschutz (%):",
	"Magieschutz (%):",
	"Rückstoßschutz (%):",
	"Stichschutz (%):",
	"Widerstand gegen Schneidschaden (%):",
	"Widerstand gegen Wuchtschaden (%):",
	"Widerstand gegen Feuerschaden (%):",
	"Widerstand gegen magischen Schaden (%):",
	"Widerstand gegen Rückstoßschaden (%):",
	"Widerstand gegen Stichschaden (%):",
	"Giftwiderstand (%):",
	"Widerstand gegen Flächenschaden (%):",
	"Maximale Ausweichchance (%):",
	"Max. Widerstand gegen Schneidschaden (%):",
	"Max. Widerstand gegen Wuchtschaden (%):",
	"Max. Widerstand gegen Feuerschaden (%):",
	"Max. Widerstand gegen magischen Schaden (%):",
	"Max. Widerstand gegen Rückstoßschaden (%):",
	"Max. Widerstand gegen Stichschaden (%):",
	"Max. Giftwiderstand (%):",
	"Max. Widerstand gegen Flächenschaden (%):",
	"Chance, Schaden zu ignorieren (%):",
	"Chance, einen Teil des Schadens zu reflektieren (%):",
	"Chance, einen Zauber zu reflektieren (%):",
	"Chance, einen Zauber zu absorbieren (%):",
	"Chance, ein Projektil abzuwehren (%):",
	"Immunität gegen Gift:",
	"Immunität gegen Flüche:",
	"Immunität gegen Schwäche:",
	"Stellt einen Teil der Lebenspunkte (% ) des erlittenen Schadens wieder her:",
	"Stellt einen Teil des Manas (% ) des erlittenen Schadens wieder her:",
	"Stellt einen Teil des Energieschilds (% ) des erlittenen Schadens wieder her:",
	"Stellt einen Teil der Ausdauer (% ) des erlittenen Schadens wieder her:",
	"Zusätzlicher Schaden:",
	"Zusätzlicher Nahkampfschaden:",
	"Zusätzlicher Fernkampfschaden:",
	"Zusätzlicher Magieschaden:",
	"Zusätzlicher Schaden (%):",
	"Zusätzlicher Nahkampfschaden (%):",
	"Zusätzlicher Fernkampfschaden (%):",
	"Zusätzlicher Magieschaden (%):",
	"Zusätzlicher Schaden durch Waffenfertigkeiten:",
	"Zusätzlicher Schaden durch Waffenfertigkeiten (%):",
	"Zusätzlicher Wuchtschaden:",
	"Zusätzlicher Schneidschaden:",
	"Zusätzlicher Feuerschaden:",
	"Zusätzlicher Rückstoßschaden:",
	"Zusätzlicher magischer Schaden:",
	"Zusätzlicher Stichschaden:",
	"Zusätzlicher Giftschaden:",
	"Zusätzlicher Schaden über Zeit – Schneidend:",
	"Zusätzlicher Schaden über Zeit – Wucht:",
	"Zusätzlicher Schaden über Zeit – Feuer:",
	"Zusätzlicher Schaden über Zeit – Rückstoß:",
	"Zusätzlicher Schaden über Zeit – Magie:",
	"Zusätzlicher Schaden über Zeit – Stich:",
	"Zusätzlicher Schaden über Zeit – Gift:",
	"Zusätzliche Schadensdauer:",
	"Zusätzlicher Schaden mit Einhandwaffen:",
	"Zusätzlicher Schaden mit Zweihandwaffen:",
	"Zusätzlicher Schaden mit Bogen:",
	"Zusätzlicher Schaden mit Armbrust:",
	"Zusätzlicher Schaden mit Dualwaffen:",
	"Zusätzlicher Schaden mit Einhandwaffen (%):",
	"Zusätzlicher Schaden mit Zweihandwaffen (%):",
	"Zusätzlicher Schaden mit Bogen (%):",
	"Zusätzlicher Schaden mit Armbrust (%):",
	"Zusätzlicher Schaden mit Dualwaffen (%):",
	"Zusätzlicher Wuchtschaden (%):",
	"Zusätzlicher Schneidschaden (%):",
	"Zusätzlicher Feuerschaden (%):",
	"Zusätzlicher Rückstoßschaden (%):",
	"Zusätzlicher Stichschaden (%):",
	"Zusätzlicher Giftschaden (%):",
	"Zusätzlicher magischer Schaden (%):",
	"Zusätzlicher Flächenschaden:",
	"Zusätzlicher Flächenschaden (%):",
	"Zusätzlicher magischer Flächenschaden:",
	"Zusätzlicher magischer Flächenschaden (%):",
	"Zusätzlicher Flächenschaden durch Waffen:",
	"Zusätzlicher Flächenschaden durch Waffen (%):",
	"Zusätzlicher Schaden gegen Menschen:",
	"Zusätzlicher Schaden gegen Orks:",
	"Zusätzlicher Schaden gegen das Böse:",
	"Zusätzlicher Schaden gegen Untote:",
	"Zusätzlicher Schaden gegen Tiere:",
	"Zusätzlicher Schaden gegen Golems:",
	"Zusätzlicher Schaden gegen Menschen (%):",
	"Zusätzlicher Schaden gegen Orks (%):",
	"Zusätzlicher Schaden gegen das Böse (%):",
	"Zusätzlicher Schaden gegen Untote (%):",
	"Zusätzlicher Schaden gegen Tiere (%):",
	"Zusätzlicher Schaden gegen Golems (%):",
	"Kritische Zauberschaden-Chance (%):",
	"Multiplikator für kritischen Zauberschaden (%):",
	"Reduzierte Zauberkosten (%):",
	"Chance auf doppelten Waffenschaden (%):",
	"Chance auf erneutes Wirken eines Zaubers (%):",
	"Betäubungschance (%):",
	"Einfrierchance (%):",
	"Lebensrückgewinnung pro Treffer:",
	"Manarückgewinnung pro Treffer:",
	"Ausdauerrückgewinnung pro Treffer:",
	"Energieschild-Rückgewinnung pro Treffer:",
	"Lebensentzug pro Treffer:",
	"Manaentzug pro Treffer:",
	"Energieschild-Entzug pro Treffer:",
	"Lebensentzug pro Treffer (%):",
	"Manaentzug pro Treffer (%):",
	"Energieschild-Entzug pro Treffer (%):",
	"Macht der Feuermagie:",
	"Macht der Eismagie:",
	"Macht der Erdmagie:",
	"Macht der Luftmagie:",
	"Macht der Blitzmagie:",
	"Macht der dunklen Magie:",
	"Macht der Lichtmagie:",
	"Macht der Lebensmagie:",
	"Macht der Todesmagie:",
	"Macht der Dämonologie:",
	"Macht des Golembaus:",
	"Macht der Nekromantie:",
	"Anzahl der Auren:",
	"Auramacht:",
	"Auramacht (%):",
	"Aurenreichweite:",
	"Aurenreichweite (%):",
	"Zusätzliche Auslösechance von Auren:",
	"Reduzierte Ressourcenreservierung durch Auren (%):",
	"Reduzierte Manarezervierung durch Auren (%):",
	"Reduzierte Ausdauerreservierung durch Auren (%):",
	"Reduzierte Lebensreservierung durch Auren (%):",
	"Reservierte Lebenspunkte (%):",
	"Reserviertes Mana (%):",
	"Reservierte Ausdauer (%):",
	"Reservierter Energieschild (%):",
	"Chance, einen getöteten Gegner in ein Skelett zu verwandeln (%):",
	"Zusätzliche beschworene Kreaturen:",
	"Macht beschworener Kreaturen (%):",
	"Zusätzliche Attribute beschworener Kreaturen (%):",
	"Zusätzliche Verteidigung beschworener Kreaturen (%):",
	"Zusätzlicher Schaden beschworener Kreaturen (%):",
	"Zusätzliche Lebenspunkte beschworener Kreaturen (%):",
	"Lebensregeneration beschworener Kreaturen:",
	"Energieschild-Regeneration beschworener Kreaturen:",
	"Zusätzliche Lebenspunkte beschworener Kreaturen:",
	"Zusätzlicher Energieschild beschworener Kreaturen:",
	"Zusätzliche Stärke beschworener Kreaturen:",
	"Zusätzliche Geschicklichkeit beschworener Kreaturen:",
	"Zusätzliche Ausweichchance beschworener Kreaturen (%):",
	"Zusätzliche Verteidigung beschworener Kreaturen:",
	"Zusätzlicher Schneidschutz beschworener Kreaturen:",
	"Zusätzlicher Wuchtschutz beschworener Kreaturen:",
	"Zusätzlicher Feuerschutz beschworener Kreaturen:",
	"Zusätzlicher Magieschutz beschworener Kreaturen:",
	"Zusätzlicher Rückstoßschutz beschworener Kreaturen:",
	"Zusätzlicher Stichschutz beschworener Kreaturen:",
	"Zusätzlicher Widerstand gegen Schneidschaden beschworener Kreaturen (%):",
	"Zusätzlicher Widerstand gegen Wuchtschaden beschworener Kreaturen (%):",
	"Zusätzlicher Widerstand gegen Feuerschaden beschworener Kreaturen (%):",
	"Zusätzlicher Widerstand gegen magischen Schaden beschworener Kreaturen (%):",
	"Zusätzlicher Widerstand gegen Rückstoßschaden beschworener Kreaturen (%):",
	"Zusätzlicher Widerstand gegen Stichschaden beschworener Kreaturen (%):",
	"Zusätzlicher Giftwiderstand beschworener Kreaturen (%):",
	"Zusätzlicher Schaden beschworener Kreaturen:",
	"Zusätzlicher Wuchtschaden beschworener Kreaturen:",
	"Zusätzlicher Schneidschaden beschworener Kreaturen:",
	"Zusätzlicher Feuerschaden beschworener Kreaturen:",
	"Zusätzlicher Rückstoßschaden beschworener Kreaturen:",
	"Zusätzlicher Stichschaden beschworener Kreaturen:",
	"Zusätzlicher Giftschaden beschworener Kreaturen:",
	"Zusätzlicher magischer Schaden beschworener Kreaturen:",
	"Macht beschworener Untoter (%):",
	"Zusätzliche Attribute beschworener Untoter (%):",
	"Zusätzliche Verteidigung beschworener Untoter (%):",
	"Zusätzlicher Schaden beschworener Untoter (%):",
	"Macht beschworener Tiere (%):",
	"Zusätzliche Attribute beschworener Tiere (%):",
	"Zusätzliche Verteidigung beschworener Tiere (%):",
	"Zusätzlicher Schaden beschworener Tiere (%):",
	"Macht beschworener Golems (%):",
	"Zusätzliche Attribute beschworener Golems (%):",
	"Zusätzliche Verteidigung beschworener Golems (%):",
	"Zusätzlicher Schaden beschworener Golems (%):",
	"Macht beschworener Dämonen (%):",
	"Zusätzliche Attribute beschworener Dämonen (%):",
	"Zusätzliche Verteidigung beschworener Dämonen (%):",
	"Zusätzlicher Schaden beschworener Dämonen (%):",
	"Zusätzliche Lebenspunkte beschworener Tiere (%):",
	"Zusätzliche Lebenspunkte beschworener Untoter (%):",
	"Zusätzliche Lebenspunkte beschworener Golems (%):",
	"Zusätzliche Lebenspunkte beschworener Dämonen (%):",
	"Macht beschworener Totems (%):",
	"Zusätzliche Attribute beschworener Totems (%):",
	"Zusätzliche Verteidigung beschworener Totems (%):",
	"Zusätzlicher Schaden beschworener Totems (%):",
	"Zusätzliche Lebenspunkte beschworener Totems (%):",
	"Heilung beschworener Totems (pro Sek.):",
	"Heilung beschworener Kreaturen (pro Sek.):",
	"Heilung beschworener Golems (pro Sek.):",
	"Heilung beschworener Untoter (pro Sek.):",
	"Heilung beschworener Dämonen (pro Sek.):",
	"Heilung beschworener Tiere (pro Sek.):",
	"Glück:",
	"Zusätzliches Glück (Truhen):",
	"Zusätzliches Glück (Gegner):",
	"Zusätzliches Glück (Gold):",
	"Zusätzliche Diebstahlchance (%):",
	"Chance, sich nach einem Treffer zu verbergen:",
	"Zusätzliche Effekt­dauer (%):",
	"Zusätzliche Aktionsgeschwindigkeit:",
	"Ausdauerentzug bei Schaden:",
	"Ausdauerentzug bei Schaden (%):",
	"Macht der Geistermagie:",
	"Schutz vor Sturz / Gift:",
	"Schutz vor Sturz / Gift (%):",
	"Reduzierte Energieschild-Reservierung durch Auren (%):",
	"Zurückgeworfener Wuchtschaden:",
	"Zurückgeworfener Schneidschaden:",
	"Zurückgeworfener Stichschaden:",
	"Zurückgeworfener Feuerschaden:",
	"Zurückgeworfener Rückstoßschaden:",
	"Zurückgeworfener magischer Schaden:",
	"Zurückgeworfener Giftschaden:",
	"Zurückgeworfener Wuchtschaden (%):",
	"Zurückgeworfener Schneidschaden (%):",
	"Zurückgeworfener Stichschaden (%):",
	"Zurückgeworfener Feuerschaden (%):",
	"Zurückgeworfener Rückstoßschaden (%):",
	"Zurückgeworfener magischer Schaden (%):",
	"Zurückgeworfener Giftschaden (%):",
	"Zurückgeworfener Wuchtschaden (DoT):",
	"Zurückgeworfener Schneidschaden (DoT):",
	"Zurückgeworfener Stichschaden (DoT):",
	"Zurückgeworfener Feuerschaden (DoT):",
	"Zurückgeworfener Rückstoßschaden (DoT):",
	"Zurückgeworfener magischer Schaden (DoT):",
	"Zurückgeworfener Giftschaden (DoT):",
	"Verringerung des erlittenen Schadens:",
	"Verringerung des erlittenen Schadens (%):",
	"Treffsicherheit:",
	"Treffsicherheit (%):",
	"Treffsicherheit der Diener:",
	"Treffsicherheit der Diener (%):",
	"Stärke von Segnungen:",
	"Stärke von Flüchen:",
	"Widerstand gegen reflektierten Schaden (%):",
	"Maximaler Widerstand gegen Schaden über Zeit (%):",
	"Maximaler Widerstand gegen reflektierten Schaden (%):",
	"Zusätzlicher Schaden über Zeit beschworener Kreaturen:",
	"Zusätzlicher Wuchtschaden über Zeit beschworener Kreaturen:",
	"Zusätzlicher Schneidschaden über Zeit beschworener Kreaturen:",
	"Zusätzlicher Feuerschaden über Zeit beschworener Kreaturen:",
	"Zusätzlicher Rückstoßschaden über Zeit beschworener Kreaturen:",
	"Zusätzlicher magischer Schaden über Zeit beschworener Kreaturen:",
	"Zusätzlicher Stichschaden über Zeit beschworener Kreaturen:",
	"Zusätzlicher Giftschaden über Zeit beschworener Kreaturen:",
	"Widerstand beschworener Kreaturen gegen Flächenschaden (%):",
	"Widerstand beschworener Kreaturen gegen Schaden über Zeit (%):",
	"Widerstand beschworener Kreaturen gegen reflektierten Schaden (%):",
	"Zurückgeworfener Wuchtschaden beschworener Kreaturen:",
	"Zurückgeworfener Schneidschaden beschworener Kreaturen:",
	"Zurückgeworfener Stichschaden beschworener Kreaturen:",
	"Zurückgeworfener Feuerschaden beschworener Kreaturen:",
	"Zurückgeworfener Rückstoßschaden beschworener Kreaturen:",
	"Zurückgeworfener magischer Schaden beschworener Kreaturen:",
	"Zurückgeworfener Giftschaden beschworener Kreaturen:",
	"Zurückgeworfener Wuchtschaden (DoT) beschworener Kreaturen:",
	"Zurückgeworfener Schneidschaden (DoT) beschworener Kreaturen:",
	"Zurückgeworfener Stichschaden (DoT) beschworener Kreaturen:",
	"Zurückgeworfener Feuerschaden (DoT) beschworener Kreaturen:",
	"Zurückgeworfener Rückstoßschaden (DoT) beschworener Kreaturen:",
	"Zurückgeworfener magischer Schaden (DoT) beschworener Kreaturen:",
	"Zurückgeworfener Giftschaden (DoT) beschworener Kreaturen:",
	"Test"
};

// Npc ablities names 
const string StExt_Str_Npc_Ability_Name[StExt_Npc_Ability_Index_Max] =
{
	"???",
	"Heiliger Pfeil",
	"Eispfeil",
	"Schwacher Blitz",
	"Todespfeil",
	"Geisterpfeil",
	"Feuerpfeil",
	"Dunkelpfeil",
	"Feuerball",
	"Schwacher Fluch der Finsternis",
	"Mittlerer Fluch der Finsternis",
	"Eisspeer",
	"Energiesphäre",
	"Teleport",
	"Schießt einen Pfeil",
	"Schießt einen Bolzen",
	"Schießt einen Explosivbolzen",
	"Schießt einen Wuchtbolzen",
	"Schießt einen scharfen Bolzen",
	"Schießt einen panzerbrechenden Bolzen",
	"Schießt einen heiligen Bolzen",
	"Schießt einen magischen Bolzen",
	"Schießt einen Explosivpfeil",
	"Schießt einen magischen Pfeil",
	"Schießt einen Feuerpfeil",
	"Schießt einen heiligen Pfeil",
	"Schießt einen Giftpfeil",
	"Wirft einen Stein",
	"Wirft einen Dolch",
	"Wirft eine Axt",
	"Wirft eine Keule",
	"Wirft einen spitzen Stock",
	"Wirft eine Ogerkeule",
	"Wirft ein Schlachtermesser",
	"Wirft einen schweren Knüppel",
	"Wirft einen Steinknüppel",
	"Wirft einen Hammer",
	"Feuerblitz",
	"Blitzschlag",
	"Eisblock",
	"Kugelblitz",
	"Todeskugel",
	"Speer des Bösen",
	"Wasserfaust",
	"Wurzelfessel",
	"Schwarm",
	"Fauliger Gestank",
	"Pfeil der Erschöpfung",
	"Wasserkugel",
	"Giftpfeil",
	"Steinpfeil",
	"Eisblitz",
	"Eissturm",
	"Gewittersphäre",
	"Grüner Schlag",
	"Feuerspeer",
	"Todesschlag",
	"Dunkelkugel",
	"Großer Feuerball",
	"Feuersturm",
	"Speer der Finsternis",
	"Große Dunkelkugel",
	"Tornado",
	"Tentakel der Finsternis",
	"Eiswelle",
	"Todeswelle",
	"Schwarzer Nebel",
	"Zerstörungswelle",
	"Sturm",
	"Giftwolke",
	"Geysir",
	"Energiewirbel",
	"Schrei der Toten",
	"Feuerschutz",
	"Meteor",
	"Erschütterung",
	"Explosion",
	"Blutsturm",
	"Blitzwelle",
	"Eisregen",
	"Heulen der Leere",
	"Magischer Wirbel",
	"Feuerregen",
	"Starker Fluch der Finsternis",
	"Dunkelwelle",
	"Feuerwelle",
	"Dornenstoß",
	"Feuerstoß",
	"Eisstoß",
	"Geladener Sprung",
	"Schwingen des Todes",
	"Schattenlauf",
	"Erschütternder Sprung",
	"Giftdurchbruch",
	"Leichte Heilung für Verbündete",
	"Mittlere Heilung für Verbündete",
	"Starke Heilung für Verbündete",
	"Schutz vor Schneiden für Verbündete",
	"Schutz vor Wucht für Verbündete",
	"Schutz vor Feuer für Verbündete",
	"Schutz vor Rückstoß für Verbündete",
	"Schutz vor Magie für Verbündete",
	"Schutz vor Stich für Verbündete",
	"Zusätzliches Ausweichen für Verbündete",
	"Zusätzlicher Nahkampfschaden für Verbündete",
	"Zusätzlicher Fernkampfschaden für Verbündete",
	"Zusätzlicher magischer Schaden für Verbündete",
	"Zusätzlicher Energieschild für Verbündete",
	"Erhöht Stärke von Verbündeten",
	"Erhöht Geschicklichkeit von Verbündeten",
	"Erhöht Lebensenergie von Verbündeten",
	"Erhöht Lebensregeneration von Verbündeten",
	"Erhöht Energieschild-Regeneration von Verbündeten",
	"Leichte Heilung",
	"Mittlere Heilung",
	"Starke Heilung",
	"Schutz vor Schneiden",
	"Schutz vor Wucht",
	"Schutz vor Feuer",
	"Schutz vor Rückstoß",
	"Schutz vor Magie",
	"Schutz vor Stich",
	"Zusätzliches Ausweichen",
	"Zusätzlicher Nahkampfschaden",
	"Zusätzlicher Fernkampfschaden",
	"Zusätzlicher magischer Schaden",
	"Zusätzlicher Energieschild",
	"Erhöht Stärke",
	"Erhöht Geschicklichkeit",
	"Erhöht Lebensenergie",
	"Erhöht Lebensregeneration",
	"Erhöht Energieschild-Regeneration",
	"Erhöht Geschwindigkeit",
	"Erhöht Geschwindigkeit von Verbündeten",
	"Schutz vor Gift für Verbündete",
	"Schutz vor Gift",
	"Passive Lebensregeneration",
	"Passive Energieschild-Regeneration",
	"Reflektiert Nahkampfschaden",
	"Zauberreflexion",
	"Berserker",
	"Lebensentzug",
	"Manaentzug",
	"Energieschildentzug",
	"Zusätzlicher Wuchtschaden",
	"Zusätzlicher Schneidschaden",
	"Zusätzlicher Stichschaden",
	"Zusätzlicher Feuerschaden",
	"Zusätzlicher Giftschaden",
	"Zusätzlicher magischer Schaden",
	"Zusätzlicher Rückstoßschaden",
	"Wuchtschaden",
	"Schneidschaden",
	"Stichschaden",
	"Feuerschaden",
	"Giftdamage",
	"Fluchschaden",
	"Erstickungsschaden",
	"Betäubung",
	"Einfrieren",
	"Feuerwelle bei Treffer",
	"Eiswelle bei Treffer",
	"Giftwelle bei Treffer",
	"Dunkelwelle bei Treffer",
	"Pfeile abwehren",
	"Zauber absorbieren",
	"Schaden ignorieren",
	"Widerstand gegen Flächenschaden",
	"Reflektiert Feuerschaden (Nahkampf)",
	"Reflektiert magischen Schaden (Nahkampf)",
	"Reflektiert Giftschaden (Nahkampf)",
	"Reflektiert Stichschaden (Nahkampf)",
	"Reflektiert Wuchtschaden (Nahkampf)",
	"Reflektiert Schneidschaden (Nahkampf)",
	"Reflektiert Rückstoßschaden (Nahkampf)",
	"Entzieht Ausdauer",
	"Blitzwelle bei Treffer",
	"Wurzelwelle bei Treffer",
	"Erschütterung bei Treffer",
	"Blutregen bei Treffer",
	"Stellt Lebensenergie wieder her",
	"Stellt Energieschild wieder her",
	"Todeswelle beim Tod",
	"Eiswelle beim Tod",
	"Feuerwelle beim Tod",
	"Giftwelle beim Tod",
	"Blitzwelle beim Tod",
	"Beschwört Armee der Finsternis beim Tod",
	"Beschwört einen Dämon beim Tod",
	"Beschwört Minecrawler beim Tod",
	"Beschwört Wölfe beim Tod",
	"Feuerregen beim Tod",
	"Eisregen beim Tod",
	"Blutregen beim Tod",
	"Dunkelwelle beim Tod",
	"Verflucher",
	"Vergifter",
	"Widerstand gegen Schneidschaden",
	"Widerstand gegen Wuchtschaden",
	"Widerstand gegen Stichschaden",
	"Widerstand gegen Magie",
	"Widerstand gegen Feuer",
	"Widerstand gegen Rückstoß",
	"Widerstand gegen Gift",
	"Flächenschaden",
	"Kettenschaden",
	"Wütend",
	"Stark",
	"Geschickt",
	"Standhaft",
	"Zäh",
	"Schnell",
	"Energieschild",
	"Ausweichend",
	"Stählerne Haut",
	"Reflektiert Feuerschaden (Fernkampf)",
	"Reflektiert magischen Schaden (Fernkampf)",
	"Reflektiert Giftschaden (Fernkampf)",
	"Reflektiert Stichschaden (Fernkampf)",
	"Reflektiert Wuchtschaden (Fernkampf)",
	"Reflektiert Schneidschaden (Fernkampf)",
	"Reflektiert Rückstoßschaden (Fernkampf)",
	"Reflektiert Schaden im Fernkampf",
	"Reflektiert Feuerschaden (Magie)",
	"Reflektiert magischen Schaden (Magie)",
	"Reflektiert Giftschaden (Magie)",
	"Reflektiert Stichschaden (Magie)",
	"Reflektiert Wuchtschaden (Magie)",
	"Reflektiert Schneidschaden (Magie)",
	"Reflektiert Rückstoßschaden (Magie)",
	"Reflektiert Magieschaden (Magie)",
	"Blutvergießer",
	"Beschwört Golems beim Tod",
	"Beschwört Tiere beim Tod",
	"Beschwört Goblins beim Tod",
	"Beschwört Parasiten beim Tod",
	"Passive Lebensregeneration für Verbündete",
	"Passive Energieschild-Regeneration für Verbündete",
	"Flammenhülle",
	"Eishülle",
	"Blitzhülle",
	"Schattenhülle",
	"Todeshülle",
	"Gifthülle",
	"Windhülle",
	"Bluthülle",
	"Erdhülle",
	"Klingenhülle",
	"Beschwört Skelett-Goblin",
	"Beschwört Feuergolem",
	"Beschwört Eisgolem",
	"Beschwört Golem",
	"Beschwört Skelett",
	"Beschwört Wölfe",
	"Beschwört Aasfresser",
	"Beschwört Ratten",
	"Beschwört Wildschweine",
	"Beschwört Goblins",
	"Beschwört Tiere",
	"Beschwört Dämon",
	"Beschwört Armee der Finsternis",
	"Beschwört Steinwächter",
	"Beschwört Zombie",
	"Beschwört Sumpfgolem",
	"Beschwört Waldgolem",
	"Beschwört Glorche",
	"Beschwört Blutfliegen",
	"Beschwört Minecrawler",
	"Beschwört Molerats",
	"Beschwört Skelettbogenschützen",
	"Beschwört Skelettmagier",
	"Beschwört Mantis",
	"Beschwört Ghule",
	"Beschwört Raubtiere",
	"Beschwört Spinnen",
	"Beschwört Warane",
	"Zieht das Ziel zu sich"
};

// Infusion->Affix
const string StExt_MagicInfusionAffix_Name[StExt_MagicInfusionAffix_Max] = 
{
	"Bestie",
	"Schurke",
	"Hund",
	"Toter Mann",
	"Kakerlake",
	"Goliath",
	"Ichthyander",
	"Bastard",
	"Genie",
	"Ghul",
	"Der Blinde",
	"Streuner",
	"Dämon",
	"Golem",
	"Bastard",
	"Kadaver",
	"Der Gehängte",
	"Dämon",
	"Fuchs",
	"Bettler",
	"Der Beschwörer",
	"Skorpion",
	"Seehund",
	"Ertrunkener",
	"Geist",
	"Wind",
	"Monster",
	"Eiter",
	"Schmied",
	"Freak",
	"Der Bestrafer",
	"Schuft",
	"Hirte",
	"Champion",
	"Elf",
	"Kannibale",
	"Gehirnfresser",
	"Der Kannibale",
	"Konstrukt",
	"Katze",
	"Der Herr",
	"Fledermaus",
	"Mörder",
	"Ohr",
	"Parasit",
	"Wurm",
	"Käfer",
	"Wurm",
	"Der Tote",
	"Held",
	"Bastard",
	"Echse",
	"Gemüse",
	"Dieb",
	"Wissenschaftler",
	"Biber",
	"Blase",
	"Krüppel",
	"Schakal",
	"Goldsucher",
	"Priester",
	"Schurke",
	"Ghul",
	"Eiche",
	"Paranoiker",
	"Henkersknecht",
	"Herr",
	"Der Wanderer",
	"Nekromant",
	"Weiser",
	"Dummkopf",
	"Mutant",
	"Esel",
	"Wächter",
	"Müll",
	"Jäger",
	"Der Zauberer",
	"Trommel",
	"Hammer",
	"Flugzeug",
	"Milbe",
	"Der Schurke",
	"Betrüger",
	"Bulle",
	"Klinge",
	"Schwert",
	"Feldwebel",
	"General",
	"Speichel",
	"Fehlgeburt",
	"Boss",
	"Schurke",
	"Biss",
	"Stummel",
	"Behinderte Person",
	"Auge",
	"Gespenst",
	"Alchemist",
	"Hexe",
	"Schädling",
	"Erlöser",
	"Mist",
	"Pilz",
	"Schnecke",
	"Der Bastard",
	"Vampir",
	"Truhe",
	"Maulwurf",
	"Magier",
	"Dick",
	"Krone",
	"Impuls",
	"Ruhig",
	"Abszess",
	"Atheist",
	"Panzerschiff",
	"Hase",
	"Eber",
	"Spion",
	"Gott",
	"Händler",
	"Greis",
	"Termite",
	"Krieger",
	"Bogatyr",
	"Guru",
	"Meister",
	"Orden",
	"Elch",
	"Troll",
	"Kämpfer",
	"Kompott",
	"Spross",
	"Kind",
	"Stiefel",
	"Faust",
	"König",
	"Prinz",
	"Graf",
	"Zlotar",
	"Baron",
	"Bergmann",
	"Stinker",
	"Dorn",
	"Mütze",
	"Monarch",
	"Anführer",
	"Zwerg",
	"Riese",
	"Der Unheilsbringer",
	"Perfektionist",
	"Narbe",
	"Hieb",
	"Idiot",
	"Experiment",
	"Sarg",
	"Pferd",
	"Tanz",
	"Thunfisch",
	"Daunen",
	"Laune",
	"Droschke",
	"Zwiebel",
	"Schwert",
	"Axt",
	"Dolch",
	"Armbrust",
	"Schütze",
	"Späher",
	"Rausch",
	"Krebs",
	"Don",
	"Pony",
	"Bote",
	"Buckel",
	"Schädel",
	"Kreuz",
	"Bambus",
	"Hainbuche",
	"Thrombus",
	"Horn",
	"Schwelle",
	"Horkrux",
	"Überraschung",
	"Fahne",
	"Dachboden",
	"Chaos",
	"Kiste",
	"Stinktier",
	"Karausche",
	"Ball",
	"Quadrat",
	"Raute",
	"Richter",
	"Taufpate",
	"Vermittler",
	"Schaf",
	"Gericht",
	"Zander",
	"Esel"
};

// Infusion->Preffix
const string StExt_MagicInfusionPreffix_Name[StExt_MagicInfusionPreffix_Max] = 
{
	"Ungewöhnlich",
	"Riesig",
	"Gesund",
	"Böse",
	"Brutal",
	"Beharrlich",
	"Steinern",
	"Rasend",
	"Schnell",
	"Zäh",
	"Unsterblich",
	"Mächtig",
	"Höllisch",
	"Stark",
	"Geschickt",
	"Fröhlich",
	"Gierig",
	"Episch",
	"Unberührbar",
	"Geizig",
	"Fremdling",
	"Unsichtbar",
	"Riesig",
	"Zerstörerisch",
	"Unheilvoll",
	"Erschreckend",
	"Stabil",
	"Flüsternd",
	"Brillant",
	"Leuchtend",
	"Monumental",
	"Kadaverartig",
	"Herbeirufend",
	"Brennend",
	"Stark",
	"Gerippt",
	"Unerwartet",
	"Astral",
	"Segen",
	"Verfluchend",
	"Besessen",
	"Übelriechend",
	"Gefährlich",
	"Reich",
	"Hinterhältig",
	"Verhasst",
	"Unverschämt",
	"Gefroren",
	"Wahnsinnig",
	"Stählern",
	"Eisern",
	"Wild",
	"Widerlich",
	"Dornig",
	"Aggressiv",
	"Dick",
	"Knochig",
	"Gemein",
	"Rostig",
	"Tropfend",
	"Mist",
	"Blutig",
	"Durchdringend",
	"Schlagkräftig",
	"Verzaubert",
	"Hexerisch",
	"Leuchtend",
	"Hell",
	"Dunkel",
	"Gesegnet",
	"Golden",
	"Magisch",
	"Zügellos",
	"Göttlich",
	"Dämonisch",
	"Klebrig",
	"Spontan",
	"Krumm",
	"Dornig",
	"Parasitär",
	"Regenbogenfarben",
	"Pünktlich",
	"Haarig",
	"Glatze",
	"Giftig",
	"Prompt",
	"Geisterhaft",
	"Schnell",
	"Sauer",
	"Süß",
	"Bitter",
	"Flüssig",
	"Fest",
	"Weich",
	"Fromm",
	"Entweiht",
	"Tief",
	"Moralisch",
	"Stumpf",
	"Würzig",
	"Der Schneider",
	"Sorgfältig",
	"Mies",
	"Groß",
	"Erfolglos",
	"Luftig",
	"Bleiern",
	"Heiß",
	"Kalt",
	"Kühl",
	"Heiß",
	"Launisch",
	"Bärtig",
	"Teuer",
	"Billig",
	"Zuverlässig",
	"Elite",
	"Greisenhaft",
	"Gebildet",
	"Schlau",
	"Intellektuell",
	"Eitrig",
	"Atemberaubend",
	"Paralysierend",
	"Verflucht",
	"Stoßend",
	"Kristallen",
	"Kristallen",
	"Knackig",
	"Fettig",
	"Dünn",
	"Dicht",
	"Wertlos",
	"Krummrückig",
	"Schaf",
	"Ware",
	"Einbalsamiert",
	"Sprudelnd",
	"Jammernd",
	"Schreiend",
	"Brüllend",
	"Schlafend",
	"Verrückt",
	"Verbrannt",
	"Verdorben",
	"Hexenhaft",
	"Sklave",
	"Geheimnisvoll",
	"Ausgegraben",
	"Das Jenseits",
	"Nass",
	"Trocken",
	"Taub",
	"Blind",
	"Bucht",
	"Grau",
	"Schlecht",
	"Berauschend",
	"Vereinigend",
	"Verschwitzt",
	"Unterirdisch",
	"Himmlisch",
	"Flauschig",
	"Der Abtrünnige",
	"Erschlagen",
	"Wütend",
	"Geistlich",
	"Stickig",
	"Rosa",
	"Grün",
	"Rot",
	"Blau",
	"Gelb",
	"Gebissen",
	"Verräterisch",
	"Diebisch",
	"Nautisch",
	"Zerrissen",
	"Tobend",
	"Stinkend",
	"Schmutzig",
	"Gespannt",
	"Bösartig",
	"Dauerhaft",
	"Betrunken",
	"Trinker",
	"Geschwollen",
	"Beflügelt",
	"Verkrustet",
	"Drahtig",
	"Dystrophisch",
	"Krank",
	"Provokativ",
	"Wild",
	"Mies",
	"Ungewaschen",
	"Dumm",
	"Schrecklich",
	"Rennend",
	"Schräg"
};

// Infusion->Suffix
const string StExt_MagicInfusionSuffix_Name[StExt_MagicInfusionSuffix_Max] = 
{
	"Chaos",
	"Leben",
	"Geschicklichkeit",
	"Stärke",
	"Schutzzauber",
	"Angriffe",
	"Feuer",
	"Laven",
	"Kälte",
	"Eis",
	"Norden",
	"Magie",
	"Dunkelheit",
	"Gift",
	"Blut",
	"Schmerzen",
	"Winde",
	"Stein",
	"Wälder",
	"Tina",
	"Leiden",
	"Nekromantie",
	"Hitze",
	"Vergiftungen",
	"Schaden",
	"Hiebe",
	"Unbekannt",
	"Miasma",
	"Untergrabung",
	"Shipov",
	"Ritual",
	"Jenseits",
	"Weltuntergang",
	"Himmel",
	"Verwelken",
	"Mutlosigkeit",
	"Heilungen",
	"Schamanismus",
	"Verwesung",
	"Ausbrüche",
	"Dornen",
	"Flüche",
	"Gräber",
	"Apokalypse",
	"Das Firmament",
	"Verluste",
	"Hoffnungslosigkeit",
	"Schmutz",
	"Troll",
	"Tricks",
	"Die Ältesten",
	"Stabilität",
	"Entwicklungen",
	"Brennen",
	"Salamander",
	"Vereisung",
	"Frost",
	"Rune",
	"Nichtexistenz",
	"Gräuel",
	"Schlachten",
	"Otpora",
	"Hurrikan",
	"Blutvergießen",
	"Natur",
	"Erstickungen",
	"Tode",
	"Entropie",
	"Wüsten",
	"Krankheiten",
	"Blutverlust",
	"Mystiker",
	"Reflexionen",
	"Vampirismus",
	"Lecks",
	"Führung",
	"Vereinigung",
	"Weisheit",
	"Inspirationen",
	"Äther",
	"Verleumdung",
	"Länder",
	"Schlamm",
	"Taube",
	"Metalla",
	"Versklavungen",
	"Versprechen",
	"Uma",
	"Gewalt",
	"Erbschaften",
	"Gut",
	"Schlechtes Wetter",
	"Granita",
	"Wachstum",
	"Kummer",
	"Profite",
	"Unglücke",
	"Wahnsinn",
	"Der Abgrund",
	"Topi",
	"Cadavra",
	"Gräuel",
	"Pfützen",
	"Tarana",
	"Adanosa",
	"Beliara",
	"Innosa",
	"Stonosa",
	"Fliegenpilze",
	"Paar",
	"Bestrafungen",
	"Tlena",
	"Gefangenschaft",
	"Schäume",
	"Kummer",
	"Nächte",
	"Zecke",
	"Schwefel",
	"Kristall",
	"Sensen",
	"Fliegen",
	"Kamm",
	"Wille",
	"Zellen",
	"Felsbrocken",
	"Stolz",
	"Harpyien",
	"Golem",
	"Leiche",
	"Pogosta",
	"Kräuter",
	"Kustov",
	"Stürme",
	"Bolotnika",
	"Hinrichtungen",
	"Folter",
	"Versagen",
	"Tanz",
	"Das Ende",
	"Auszeichnungen",
	"Kriege",
	"Gleichgewicht",
	"Bulle",
	"Schlechtes Wetter",
	"Dämon",
	"Drache",
	"Ziege",
	"Urizel",
	"Mora",
	"Kackvogel",
	"Ladung",
	"Freiheit",
	"Fliegenpilz",
	"Schild",
	"Katharsis",
	"Kometen",
	"Hinterlist",
	"Gans",
	"Grada",
	"Reflexe",
	"Beweglichkeit",
	"List",
	"Gräueltaten",
	"Goblin",
	"Scavenger",
	"Zusammenbruch",
	"Schläge",
	"Genies",
	"Lurkera",
	"Schwerter",
	"Schnecken",
	"Kohlen",
	"Bienenstöcke",
	"Quarz",
	"Harze",
	"Klang",
	"Siege",
	"Behörden",
	"Segen",
	"Schleim",
	"Unendlichkeit",
	"Unsinn",
	"Gefühllosigkeit",
	"Fröste",
	"Ausdauer",
	"Hass",
	"Albtraum",
	"Moskito",
	"Bartera",
	"Sand",
	"Ambrosia",
	"Amphibien",
	"Kakerlake",
	"Spinne",
	"Winde",
	"Insekt",
	"Ameise",
	"Nebel",
	"Ratten",
	"Bienen",
	"Felder",
	"Das Universum",
	"Seuchen",
	"Wesen",
	"Wunder",
	"Donner",
	"Asche",
	"Flosse",
	"Dunkelheit",
	"Grausamkeiten",
	"Stille",
	"Niedertracht",
	"Leiden",
	"Wasser",
	"Stahl",
	"Geist",
	"Angst",
	"Spinnweben",
	"Leidenschaften",
	"Zeit",
	"Krähe",
	"Käfer"
};

// 				*** Mastery perks names ***
// Fire
const string StExt_Str_MasteryPerk_Name_0[StExt_MasteryPerk_Max] = 
{
	"Herold der Asche",
	"Brandstifter",
	"Verwandtschaft mit dem Feuer",
	"Lavadecke",
	"Feuriger Geist",
	"Atem der Flamme",
	"Brennen",
	"Atem des Feuers",
	"Pyromant",
	"Brennendes Herz",
	"Gabe des Agni",
	"Feuerlegion",
	"Basaltschnitzer",
	"Feuergänger",
	"Magma-Schlag",
	"Feuerfresser"
};
const string StExt_Str_MasteryPerk_Desc_0[StExt_MasteryPerk_Max] = 
{
	"+3 Feuerschaden für jede Waffe oder Magie für jeden Level in dieser Schule",
	"+1 Brennschaden für jede Waffe oder Magie für jeden Level in dieser Schule",
	"+0,3% Feuerresistenz für jeden Level in dieser Schule",
	"+1 Feuerschutz für jeden Level in dieser Schule",
	"-10% Manakosten für Zauber mit Feuerelement",
	"+1% anhaltender Feuerschaden für jeden Level in dieser Schule",
	"+50% Dauer von Feuerschaden",
	"+25% auf jeglichen Feuerschaden",
	"+150 Feuerschaden für jede Waffe oder Magie",
	"+50 Brennschaden für jede Waffe oder Magie",
	"Gewährt eine Chance von 10% beim Angriff einen Feuerball zu wirken",
	"Diener erhalten die Fähigkeit 'Feuerpfeil' zu wirken",
	"Feuergolems sind 0,5% mächtiger für jeden Level in dieser Schule",
	"+5% Feuerresistenz und +10% maximale Feuerresistenz",
	"Fügt 50% des Waffenschadens als Feuerschaden hinzu",
	"Stellt Lebenspunkte in Höhe von 20% des erlittenen Feuerschadens wieder her"
};
// Ice
const string StExt_Str_MasteryPerk_Name_1[StExt_MasteryPerk_Max] = 
{
	"Herold des Eises",
	"Vereisung",
	"Umarmung des Winters",
	"Frostiger Geist",
	"Verbund mit der Kälte",
	"Eisdecke",
	"Atem des Winters",
	"Hydromant",
	"Gabe des Adanos",
	"Schneearmee",
	"Eisskulptur",
	"Gefrorenes Herz",
	"Eisscholle",
	"Eiskruste",
	"Wasserdecke",
	"Frost"
};
const string StExt_Str_MasteryPerk_Desc_1[StExt_MasteryPerk_Max] = 
{
	"+3 Magieschaden zu jeder Art von Eisschaden für jeden Level in dieser Schule",
	"+1 fortlaufender Magieschaden aus Eisschaden für jeden Level in dieser Schule",
	"+0,1% Chance den Feind beim Angriff einzufrieren für jeden Level in dieser Schule",
	"-10% Manakosten für Zauber mit Eiskomponente",
	"+0,3% Magieresistenz für jeden Level in dieser Schule",
	"+1 zur Magieabwehr für jeden Level in dieser Schule",
	"+1% fortlaufender Magieschaden aus Eisschaden für jeden Level in dieser Schule",
	"+25% Schaden für Zauber mit Eiskomponente",
	"Gewährt eine 10% Chance beim Angriff Eisspeer zu wirken",
	"Diener erhalten die Fähigkeit 'Frostblitz' zu wirken",
	"Eisgolems sind 0,5% mächtiger für jeden Level in dieser Schule",
	"+150 Magieschaden zu jeder Art von Waffe oder Magie",
	"+5% Magieresistenz und +10% maximale Magieresistenz",
	"Fügt 50% des Waffenschadens als Magieschaden hinzu",
	"10% des erlittenen Schadens werden als Mana wiederhergestellt",
	"10% Chance Nahkampfangreifer einzufrieren"
};
// Electric
const string StExt_Str_MasteryPerk_Name_2[StExt_MasteryPerk_Max] =
{
	"Herold der Funken",
	"Schock",
	"Elektroschock-Waffe",
	"Elektrischer Geist",
	"Störung",
	"Geladener Schild",
	"Transformator",
	"Elektromant",
	"Amperas Geschenk",
	"Elektrische Legion",
	"Leiter",
	"Geladener Schlag",
	"Funke",
	"Induktor",
	"Kondensator",
	"Störung"
};
const string StExt_Str_MasteryPerk_Desc_2[StExt_MasteryPerk_Max] =
{
	"+3 Magieschaden für jede Art von Elektrizitätsschaden für jeden Level in dieser Schule",
	"+1 kontinuierlicher Magieschaden aus Elektrizitätsschaden für jeden Level in dieser Schule",
	"+0,1% Chance den Gegner beim Angriff zu betäuben für jeden Level in dieser Schule",
	"-10% Manakosten für Zauber mit elektrischem Bestandteil",
	"5% des verursachten Schadens werden als Energieschild gestohlen",
	"+10 Energieschild für jeden Level in dieser Schule",
	"+1% kontinuierlicher Magieschaden aus Elektrizitätsschaden für jeden Level in dieser Schule",
	"+25% Schaden für Zauber mit elektrischem Bestandteil",
	"Gewährt eine 10% Chance einen Blizschlag beim Angriff zu wirken",
	"Diener erhalten die Fähigkeit 'Kleiner Blitz' zu wirken",
	"1-3 Elektrizitätsschaden verkettet, +1 für je 25 Level in dieser Schule",
	"+300 Magieschaden beim Angriff zuzüglich +1 Magieschaden für jeden Level in dieser Schule",
	"+10% Geschwindigkeit für alle Aktionen",
	"Der angreifende Gegner erleidet 1-5 Schaden für jeden Level in dieser Schule",
	"10% des erlittenen Schadens werden als Energieschild wiederhergestellt",
	"Fügt 25% des Waffenschadens als Kettenblitzschaden zu"
};
// Air
const string StExt_Str_MasteryPerk_Name_3[StExt_MasteryPerk_Max] =
{
	"Herold des Sturms",
	"Erstickung",
	"Luftgeist",
	"Luftstrom",
	"Hypoxie",
	"Leichtsinn",
	"Das Auge des Sturms",
	"Hurrikan",
	"Aeromant",
	"Gabe des Himmels",
	"Luftlegion",
	"Hurrikanskulptor",
	"Windböe",
	"Luftschild",
	"Sanfter Wind",
	"Vakuum"
};
const string StExt_Str_MasteryPerk_Desc_3[StExt_MasteryPerk_Max] =
{
	"+3 Rückstoß-Schaden für jede Waffe oder Magie für jeden Level in dieser Schule",
	"+1 Erstickungsschaden für jede Waffe oder Magie für jeden Level in dieser Schule",
	"-10% Manakosten für Zauber mit einer Luftkomponente",
	"+150 Rückstoß-Schaden für jede Waffe oder Magie",
	"+1% zu kontinuierlichem Erstickungsschaden für jeden Level in dieser Schule",
	"+0,1% Chance einen Treffer auszuweichen für jeden Level in dieser Schule",
	"+1% zur Dauer der Erstickung für jeden Level in dieser Schule",
	"+25% Flächenschaden",
	"+25% Schaden für Zauber mit einer Luftkomponente",
	"10% Chance beim Angriff Tornado zu wirken",
	"Diener erhalten die Fähigkeit 'Tornado' zu wirken",
	"Luftgolems sind 0,5% stärker für jeden Level in dieser Schule",
	"Fügt 50% des Waffenschadens als Rückstoß-Schaden hinzu",
	"+0,2% Chance ein Projektil abzuwehren für jeden Level in dieser Schule",
	"1% Lebens- und Manaregeneration während des Sprints",
	"+50 Erstickungsschaden für jede Waffe und Magie"
};
// Earth
const string StExt_Str_MasteryPerk_Name_4[StExt_MasteryPerk_Max] =
{
	"Tapferkeit",
	"Steinhaut",
	"Geist der Erde",
	"Erschütterung",
	"Steinbildhauer",
	"Zerquetschen",
	"Steinfäuste",
	"Geomant",
	"Die Gabe des Stonos",
	"Steinlegion",
	"Die Kraft der Erde",
	"Der Wendepunkt",
	"Schild der Erde",
	"Granitrüstung",
	"Beschwerungsmittel",
	"Rückstoß"
};
const string StExt_Str_MasteryPerk_Desc_4[StExt_MasteryPerk_Max] =
{
	"+2 Rückstoß-Schutz für jeden Level in dieser Schule",
	"+0,1% Resistenz gegen Zerquetschungs-, Hieb- und Stichschaden für jeden Level in dieser Schule",
	"-10% Manakosten für Zauber mit Steinkomponente",
	"+0,1% Chance den Gegner zu betäuben für jeden Level in dieser Schule",
	"Stein- und Sumpfgolems sind 0,5 % stärker für jeden Level in dieser Schule",
	"+1 Zerquetschungsschaden für jede Waffe oder Magie für jeden Level in dieser Schule",
	"+3 Klingen-Schaden für jede Waffe oder Magie für jeden Level in dieser Schule",
	"+25% Schaden für Zauber mit Steinkomponente",
	"Gewährt eine 10% Chance beim Angriff 'Steinfäuste' zu wirken",
	"Diener erhalten die Fähigkeit 'Steinfäuste' zu wirken",
	"+150 Zerquetschungsschaden für jede Waffe oder Magie",
	"+50 Zerquetschungsschaden für jede Waffe oder Magie",
	"+1 Schutz gegen Zerquetschungs- und Hiebschaden für jeden Level in dieser Schule",
	"Der angreifende Gegner erleidet 3 Nahkampf-Klingenschaden für jeden Level in dieser Schule",
	"Fügt 50% des Waffenschadens als Klingenschaden hinzu",
	"10% Chance den angreifenden Gegner zu betäuben"
};
// Light
const string StExt_Str_MasteryPerk_Name_5[StExt_MasteryPerk_Max] =
{
	"Rechtschaffenheit",
	"Fromm",
	"Heiliger Geist",
	"Heiligkeit",
	"Schild des Glaubens",
	"Segen",
	"Starker Glaube",
	"Die Gabe von Innos",
	"Rechtschaffene Armee",
	"Dogmatismus",
	"Patronat",
	"Sturheit",
	"Amulett",
	"Inspiration",
	"Unerschütterlichkeit",
	"Führung"
};
const string StExt_Str_MasteryPerk_Desc_5[StExt_MasteryPerk_Max] =
{
	"Angreifende Untote und das Böse erleiden 20% des reflektierten Schadens als Feuerschaden",
	"+25% Schaden gegen Untote und das Böse",
	"-10% Manakosten für Zauber mit heiligem Bestandteil",
	"+25% Schaden für Zauber mit heiligem Bestandteil",
	"+10 zum Energieschild für jede Stufe der Lichtmagie",
	"+0,3% Lebens- und Energieschildregeneration pro Sekunde",
	"10% des erlittenen Schadens durch Untote wird als Energieschild und Leben wiederhergestellt",
	"Gewährt eine 10% Chance beim Angriff 'Heiliger Pfeil' zu wirken",
	"Diener erhalten die Fähigkeit 'Heiliger Pfeil' zu wirken",
	"+50 'Heilige Magie'-Schaden zuzüglich +3 'Heilige Magie'-Schaden für jeden Level in dieser Schule",
	"Der angreifende Gegner erleidet 5 Feuerschaden für jeden Level in dieser Schule",
	"+5% Resistenz gegen jede Schadensart",
	"Beim Angriff besteht eine 10% Chance, dass du und deine Verbündeten +3 Verteidigung gegen alles für jeden Level in dieser Schule erhalten",
	"Beim Angriff besteht eine 10% Chance, dass du und deine Verbündeten +10 Leben für jeden Level in dieser Schule erhalten,",
	"Beim Angriff besteht eine 10% Chance, dass du und deine Verbündeten +3 Regeneration für jeden Level in dieser Schule erhalten,",
	"Beim Angriff besteht eine 10% Chance, dass du und deine Verbündeten +3 Schaden für jeden Level in dieser Schule erhalten"
};
// Dark
const string StExt_Str_MasteryPerk_Name_6[StExt_MasteryPerk_Max] =
{
	"Qual",
	"Gemeinheit",
	"Dunkler Geist",
	"Fürst der Dunkelheit",
	"Unterdrückung",
	"Verfluchter",
	"Schleier der Dunkelheit",
	"Versklaver",
	"Dunkle Bildhauer",
	"Dämonische Gabe",
	"Dunkle Legion",
	"and Beliars",
	"Lebenssiphon",
	"Niedergang",
	"Verwundbarkeit",
	"Schmutz"
};
const string StExt_Str_MasteryPerk_Desc_6[StExt_MasteryPerk_Max] =
{
	"+3 Schaden durch Dunkle Magie für jeden Level in dieser Schule",
	"+1 anhaltender Dunkelschaden für jeden Level in dieser Schule",
	"-10% Manakosten für Zauber mit einer Dunkelheitskomponente",
	"+25% Schaden für Zauber mit einer Dunkelheitskomponente",
	"+50% zur Dauer von kontinuierlichem Schaden durch Dunkle Magie",
	"+1% zur Dauer von Dunkelheitszaubern für jeden Level in dieser Schule",
	"10% Chance, nahe Feinde mit einem zufälligen Fluch zu belegen",
	"+0,3% Chance den Verstand des Ziels beim Angriff zu versklaven für jeden Level in dieser Schule",
	"Schatten-Golems sind um 0,5% mächtiger für jeden Level in dieser Schule",
	"Gewährt eine 10% Chance beim Angriff 'Dunkle Kugel' zu wirken",
	"Diener erhalten die Fähigkeit 'Dunkler Pfeil' zu wirken",
	"Beim Angriff überträgt der Angreifer 0,5% seiner Gesundheit auf dich",
	"Beim Angriff besteht eine 10% Chance einen Fluch zu wirken, der 1 Lebenspunkt pro 5 Level in dieser Schule vom Feind stiehlt",
	"Beim Angriff besteht eine 10% Chance einen Fluch zu wirken, der die Werte des Ziels um 0,5% für jeden Level in dieser Schule schwächt",
	"Beim Angriff besteht eine 10% Chance einen Fluch zu wirken, der die Verteidigung des Ziels um 3 für jeden Level in dieser Schule schwächt",
	"Fügt 50% des Waffenschadens als anhaltenden Schaden durch Dunkle Magie hinzu"
};
// Death
const string StExt_Str_MasteryPerk_Name_7[StExt_MasteryPerk_Max] =
{
	"Bote des Untergangs",
	"Verwelkung",
	"Geist des Friedhofs",
	"Hand des Toten",
	"Begräbnisglocke",
	"Ruf des Grabes",
	"Gabe des Todes",
	"Legionen des Todes",
	"Wille des Lichs",
	"Todesfresser",
	"Massensterben",
	"Sensenmann",
	"Todesmagier",
	"Knochen-Schild",
	"Chor der Toten",
	"Opfermesser"
};
const string StExt_Str_MasteryPerk_Desc_7[StExt_MasteryPerk_Max] =
{
	"+3 Todesmagie-Schaden für jeden Level in dieser Schule",
	"+1 anhaltender Todesmagie-Schaden für jeden Level in dieser Schule",
	"-10% Manakosten für Zauber mit Todeskomponente",
	"+150 Magieschaden für jede Waffe oder Magie",
	"Für jeden Level in dieser Schule wird 0,1% des verursachten Schadens als Leben gestohlen",
	"+25% Schaden gegen Tiere, Menschen und Orks mit jeder Art von Waffe",
	"Gewährt eine 10% Chance, beim Angriff 'Todesball' zu wirken",
	"Diener erhalten die Fähigkeit 'Todesblitz' zu wirken",
	"Angriffe auf lebende Gegner verursachen 5 Todesmagie-Schaden für jeden Level in dieser Schule",
	"20% des erlittenen Schadens durch Todeszauber wird als Leben wiederhergestellt",
	"Alle Todeszauber verursachen zusätzlichen Flächenschaden",
	"Todeszauber verursachen zusätzlich +1% Magieschaden gegen lebende Gegner für jeden Level in dieser Schule",
	"Todeszauber sind 25% mächtiger",
	"+1 auf Magieschutz für jeden Level in dieser Schule",
	"Fügt 50% des Schadens von Todeszaubern als anhaltenden Magieschaden hinzu",
	"Fügt 50% des Waffenschadens als zusätzlichen Magieschaden gegen Lebewesen hinzu"
};
// Life
const string StExt_Str_MasteryPerk_Name_8[StExt_MasteryPerk_Max] =
{
	"Erholung",
	"Tierliebhaber",
	"Herr der Schwärme",
	"Tierarzt",
	"Anführer des Rudels",
	"Hüter des Baus",
	"Fürsorglicher Besitzer",
	"Trainer",
	"Frische",
	"Werwolf",
	"Bärenkraft",
	"Löwenherz",
	"Bisonsfell",
	"Wolfsbiss",
	"Bienenstich",
	"Schlangenzahn"
};
const string StExt_Str_MasteryPerk_Desc_8[StExt_MasteryPerk_Max] =
{
	"Heilzauber gewähren zusätzlich 0,1% Lebensregeneration pro Sekunde für jeden Level in dieser Schule",
	"Beschworene Tiere sind 1% stärker für jeden Level in dieser Schule",
	"Beschworene Tiere verursachen +5 Giftschaden für jeden Level in dieser Schule",
	"Beschworene Tiere haben 50% mehr Lebenspunkte",
	"Beschworene Tiere erhalten 25% mehr Stärke",
	"Beschworene Tiere erhalten 25% mehr Verteidigung",
	"Beschworene Tiere regenerieren 0,1% Leben für jeden Level in dieser Schule",
	"Beschworene Tiere erhalten zusätzlich +0,1% Chance Angriffen auszuweichen für jeden Level in dieser Schule",
	"Leben- und Ausdauerregeneration +1% pro Sekunde",
	"Tierverwandlungen sind 1% stärker für jeden Level in dieser Schule",
	"Tierverwandlungen erhalten 50% mehr Lebenspunkte",
	"Tierverwandlungen erhalten 25% mehr Stärke",
	"Tierverwandlungen erhalten 25% mehr Verteidigung",
	"Tierverwandlungen verursachen +5 Hiebschaden für jeden Level in dieser Schule",
	"Tierverwandlungen verursachen +5 Stichschaden für jeden Level in dieser Schule",
	"Tierverwandlungen verursachen +5 Giftschaden für jeden Level in dieser Schule"
};
// Golem
const string StExt_Str_MasteryPerk_Name_9[StExt_MasteryPerk_Max] =
{
	"Bildhauer",
	"Ewigkeit der Berge",
	"Zenit des Handwerks",
	"Feuersteinspitze",
	"Granitgrenze",
	"Selbstreparatur",
	"Runenstein",
	"Quecksilbermine",
	"Schwefelminen",
	"Kristallschlucht",
	"Hoher Grat",
	"Gusseiserne Faust",
	"Hammerschlag",
	"Benommen",
	"Akkumulation",
	"Erschütterung"
};
const string StExt_Str_MasteryPerk_Desc_9[StExt_MasteryPerk_Max] =
{
	"Golems sind 1% stärker für jeden Level in dieser Schule",
	"Golems erhalten 50% mehr Lebenspunkte",
	"Golems erhalten 25% mehr Stärke",
	"Golems erleiden 25% mehr Schaden",
	"Golems erhalten 25% mehr Verteidigung",
	"Golems regenerieren +1% Lebenspunkte pro Sekunde",
	"Golems erhalten einen Energieschild in Höhe von 25% ihrer maximalen Lebenspunkte",
	"Golems sind 0,3% schneller für jeden Level in dieser Schule",
	"Golems erhalten zusätzlich +3 Feuerschaden für jeden Level in dieser Schule",
	"Golems erhalten zusätzlich +3 Magieschaden für jeden Level in dieser Schule",
	"Golems erhalten zusätzlich +3 Rückstoß-Schaden für jeden Level in dieser Schule",
	"Golems erhalten zusätzlich +3 Klingen-Schaden für jeden Level in dieser Schule",
	"Golems verursachen +3 Schlag-Schaden für jeden Level in dieser Schule",
	"Golems haben eine Chance von 0,3% den Feind zu betäuben für jeden Level in dieser Schule",
	"Golems stellen Lebenspunkte in Höhe von 20% des erlittenen Schadens wieder her",
	"Golems erhalten die Fähigkeit 'Erschütterung'"
};
// Demon
const string StExt_Str_MasteryPerk_Name_10[StExt_MasteryPerk_Max] =
{
	"Demonologist",
	"Höllische Gesundheit",
	"Dämonisches Erbe",
	"Die Macht Eligors",
	"Teuflischer Schutz",
	"Höllenbande",
	"Ethereal Essence",
	"Eligors Flamme",
	"Scharfe Klauen",
	"Verzauberte Fänge",
	"Seelendiebstahl",
	"Unheiliges Ritual",
	"Niedertracht",
	"Die Hand Nergals",
	"Die Hand Eligors",
	"Materialization"
};
const string StExt_Str_MasteryPerk_Desc_10[StExt_MasteryPerk_Max] =
{
	"Dämonen sind 1% stärker für jeden Level in dieser Schule",
	"Dämonen erhalten 50% mehr Lebenspunkte",
	"Dämonen erhalten 25% mehr Stärke",
	"Dämonen verursachen 25% mehr Schaden",
	"Dämonen erhalten 25% mehr Verteidigung",
	"Dämonen regenerieren +0,5% Lebenspunkte pro Sekunde",
	"Dämonen erhalten einen Energieschild in Höhe von 25% ihrer maximalen Lebenspunkte",
	"Dämonen verursachen +3 Feuerschaden für jeden Level in dieser Schule",
	"Dämonen verursachen +3 Hiebschaden für jeden Level in dieser Schule",
	"Dämonen verursachen +3 Magieschaden für jeden Level in dieser Schule",
	"Dämonen stehlen 5% des verursachten Schadens als Leben",
	"Dämonen können einen Fluch wirken, der die Werte des Ziels um 0,5% für jeden Level in dieser Schule schwächt",
	"Dämonen können einen Fluch wirken, der die Verteidigung des Ziels um 0,5% für jeden Level in dieser Schule schwächt",
	"Dämonen erhalten die Fähigkeit 'Dunkle Kugel' zu wirken",
	"Dämonen erhalten die Fähigkeit 'Feuerball' zu wirken",
	"Dämonen erhalten die Fähigkeit 'Teleportation' zu wirken"
};
// Necro
const string StExt_Str_MasteryPerk_Name_11[StExt_MasteryPerk_Max] =
{
	"Nekromant",
	"Einbalsamierung",
	"Tanz des Todes",
	"Die Wut der Toten",
	"Knochenstärkung",
	"Verbindung mit dem Kirchhof",
	"Runenfleisch",
	"Fleischfaust",
	"Tödlicher Hieb",
	"Knochenspeer",
	"Verzaubertes Fleisch",
	"Leichengift",
	"Vampirismus",
	"Knochenschild",
	"Tote Geschicklichkeit",
	"Finger des Todes"
};
const string StExt_Str_MasteryPerk_Desc_11[StExt_MasteryPerk_Max] =
{
	"Beschworene Untote sind 1% stärker für jeden Level in dieser Schule",
	"Beschworene Untote erhalten 50% mehr Lebenspunkte",
	"Beschworene Untote erhalten 25% mehr Stärke & Geschick",  //25% vom Basis-Wert!
	"Beschworene Untote verursachen 25% mehr Schaden",
	"Beschworene Untote erhalten 25% mehr Verteidigung",
	"Beschworene Untote regenerieren +0,5% Lebenspunkte pro Sekunde",
	"Beschworene Untote erhalten einen Energieschild in Höhe von 25% ihrer maximalen Lebenspunkte",
	"Beschworene Untote verursachen +3 Klingenschaden für jeden Level in dieser Schule",
	"Beschworene Untote verursachen +3 Hiebschaden für jeden Level in dieser Schule",
	"Beschworene Untote verursachen +3 Stichschaden für jeden Level in dieser Schule",
	"Beschworene Untote verursachen +3 Magieschaden für jeden Level in dieser Schule",
	"Beschworene Untote verursachen +3 Giftschaden für jeden Level in dieser Schule",
	"Beschworene Untote stehlen 5% des verursachten Schadens als Leben",
	"Beschworene Untote reflektieren 5% des erlittenen Schadens",
	"Beschworene Untote sind 0,3% schneller für jeden Level in dieser Schule",
	"Beschworene Untote erhalten die Fähigkeit 'Todesball' zu wirken"
};
// Shaman
const string StExt_Str_MasteryPerk_Name_12[StExt_MasteryPerk_Max] = 
{
	"Energiebarriere",
	"Geistiges Fleisch",
	"Astraltrance",
	"Runenverbindung",
	"Weitsicht",
	"Versorgung",
	"Der Verzauberer",
	"Der Elementalist",
	"Hexenwaffe",
	"Das Werkzeug des Zauberers",
	"Ersparnis",
	"Tiefe Meditation",
	"Ätherischer Vampirismus",
	"Schamane",
	"Ahnzorn",
	"Geistige Verbindung"
};
const string StExt_Str_MasteryPerk_Desc_12[StExt_MasteryPerk_Max] = 
{
	"+500 zu maximalem Energieschild",
	"+5 zu maximalem Energieschild für jeden Level in dieser Schule",
	"+0,1% Energieschild-Regeneration für jeden Level in dieser Schule",
	"Die Höhe des magischen Schutzes von Roben wird als zusätzliches Energieschild hinzugefügt",
	"10% des erlittenen Schadens werden als Energieschild wiederhergestellt",
	"10% des erlittenen Schadens werden als Mana wiederhergestellt",
	"+1% Schaden für magische Waffen für jeden Level in dieser Schule",
	"+1% auf elementaren und magischen Waffenschaden für jeden Level in dieser Schule",
	"+25% Schaden mit magischen Klingen",
	"+25% Schaden mit magischen Stäben",
	"-10% Manakosten für alle Zauber",
	"+1% Mana-Regeneration",
	"+0,1% Energieschild- und Mana-Diebstahl für jeden Level in dieser Schule",
	"+1% Totemkraft für jeden Level in dieser Schule",
	"+10 zusätzlicher Feuerschaden für Totems für jeden Level in dieser Schule",
	"Totems erhalten die Fähigkeit, 'Massenheilung' zu wirken"
};
// MartialArts
const string StExt_Str_MasteryPerk_Name_13[StExt_MasteryPerk_Max] = 
{
	"Zweihandkämpfer",
	"Einhandkämpfer",
	"Doppelklingen-Kämpfer",
	"Rammstoß",
	"Der Hammerkämpfer",
	"Henkersknecht",
	"Speerkämpfer",
	"Verrückter Wirbelwind",
	"Zweihandkämpfer",
	"Einhandkämpfer",
	"Kämpfer mit Doppelwaffe",
	"Söldner",
	"Der Wächter",
	"Attentäter",
	"Meisterkämpfer",
	"Gladiator"
};
const string StExt_Str_MasteryPerk_Desc_13[StExt_MasteryPerk_Max] = 
{
	"+1% Schaden mit Zweihandwaffen pro Stufe der Kriegskunst",
	"+1% Schaden mit Einhandwaffen pro Stufe der Kriegskunst",
	"+1% Schaden mit Dualwaffen pro Stufe der Kriegskunst",
	"+0,1% Chance, den Gegner bei einem Angriff zu betäuben, pro Stufe der Kriegskunst",
	"+5 Wuchtschaden im Nahkampf pro Stufe der Kriegskunst",
	"+5 Schneidschaden im Nahkampf pro Stufe der Kriegskunst",
	"+5 Stichschaden im Nahkampf pro Stufe der Kriegskunst",
	"Nahkampfschaden der Waffe trifft zusätzlich nahegelegene Ziele in der Umgebung",
	"+25% Schaden mit Zweihandwaffen",
	"+25% Schaden mit Einhandwaffen",
	"+25% Schaden mit Dualwaffen",
	"+3 Wuchtschaden im Nahkampf pro Stufe der Kriegskunst",
	"+3 Schneidschaden im Nahkampf pro Stufe der Kriegskunst",
	"+3 Stichschaden im Nahkampf pro Stufe der Kriegskunst",
	"Jede Nahkampf-Waffenfertigkeit über 100% erhöht den Schaden um 1%",
	"+0,5% Nahkampfschaden pro Stufe der Kriegskunst"
};
/// Agile
const string StExt_Str_MasteryPerk_Name_14[StExt_MasteryPerk_Max] =
{
	"Schutz vor Klingenangriffen",
	"Schutz vor Hiebschaden",
	"Feuerschutz",
	"Schutz vor Rückstoß",
	"Magieschutz",
	"Schutz vor Stichschaden",
	"Panzerung",
	"Schildträger",
	"Beweglichkeit",
	"Gegenangriff",
	"Standhaftigkeit",
	"Vorbereitung",
	"Runenhärtung",
	"Unzugänglichkeit",
	"Belagert",
	"Anmut"
};
const string StExt_Str_MasteryPerk_Desc_14[StExt_MasteryPerk_Max] =
{
	"+1 auf Klingen-Resistenz für jeden Level in dieser Schule",
	"+1 auf Hieb-Resistenz für jeden Level in dieser Schule",
	"+1 auf Feuer-Resistenz für jeden Level in dieser Schule",
	"+1 auf Rückstoß-Resistenz für jeden Level in dieser Schule",
	"+1 auf Magie-Resistenz für jeden Level in dieser Schule",
	"+1 auf Stich-Resistenz für jeden Level in dieser Schule",
	"Rüstungen sind 25% effektiver",
	"Beim Tragen von Schilden erhöht sich die Verteidigung um 0,5% für jeden Level in dieser Schule",
	"+0,1% Chance, einem Angriff auszuweichen für jeden Level in dieser Schule",
	"Der Angreifer erhält 5% des reflektierten Schadens",
	"+10% zum Maximum aller Resistenzen und +0,1% zu allen Resistenzen für jeden Level in dieser Schule",
	"20% des erlittenen Schadens werden als Leben wiederhergestellt",
	"+0,1% Chance einen Zauber zu absorbieren für jeden Level in dieser Schule",
	"+10% Chance allen Schaden beim Tragen eines Schildes zu blocken",
	"+0,5% Chance den Angreifer beim Tragen eines Schildes zu betäuben für jeden Level in dieser Schule",
	"+0,1% Chance ein Projektil abzuwehren"
};
// Archery
const string StExt_Str_MasteryPerk_Name_15[StExt_MasteryPerk_Max] =
{
	"Schütze",
	"Bogenliebhaber",
	"Armbrustliebhaber",
	"Klingengeschoss",
	"Meisterschütze",
	"Durchdringender Schuss",
	"Vergifteter Pfeil",
	"Salve",
	"Abpraller",
	"Präziser Schuss",
	"Fertigkeit",
	"Jäger",
	"Killer",
	"Orkenschlächter",
	"Das Böse vernichten",
	"Golemjäger"
};
const string StExt_Str_MasteryPerk_Desc_15[StExt_MasteryPerk_Max] =
{
	"+0,5% Fernkampfschaden für jeden Level in dieser Schule",
	"+1% Bogenschaden für jeden Level in dieser Schule",
	"+1% Armbrustschaden für jeden Level in dieser Schule",
	"+3 Fernkampf-Klingenschaden für jeden Level in dieser Schule",
	"Jede Stufe Fernkampf-Waffentalent über 100% erhöht den Schaden um 1%",
	"+3 Fernkampf-Stichschaden für jeden Level in dieser Schule",
	"+3 Fernkampf-Giftschaden für jeden Level in dieser Schule",
	"+10% Chance auf doppelten Fernkampfschaden",
	"Pfeilschaden wird auch auf Gegner nahe dem Ziel angewendet",
	"+0,3% Chance einen Gegner beim Fernkampfangriff zu betäuben für jeden Level in dieser Schule",
	"+10% Geschwindigkeit für alle Aktionen",
	"+1% Schaden gegen Tiere im Fernkampf für jeden Level in dieser Schule",
	"+1% Schaden gegen Menschen im Fernkampf für jeden Level in dieser Schule",
	"+1% Schaden gegen Orks im Fernkampf für jeden Level in dieser Schule",
	"+1% Fernkampfschaden gegen Untote und das Böse für jeden Level in dieser Schule",
	"+1% Schaden gegen Golems im Fernkampf für jeden Level in dieser Schule"
};

// generic perks
const string StExt_Str_Perk_Name[StExt_Perk_Max] = 
{
	"Student",
	"Ritualmeister",
	"Dicke Haut",
	"Erbe der Ahnen",
	"Athlet",
	"Regeneration",
	"Vielseitigkeit",
	"Großzügigkeit",
	"Eiserner Wille",
	"Gesättigte Aura",
	"Weitblick",
	"Kampfmagier",
	"Geizhals",
	"Glückspilz",
	"Anfänger im Kampf",
	"Anfänger im Fernkampf",
	"Anfänger der Magie",
	"Geist über Materie",
	"Taschendieb",
	"Attribut des Hexers",
	"Magischer Fokus",
	"Schwertkämpfer",
	"Scharfrichter",
	"Fechtmeister",
	"Speerkämpfer",
	"Hellebardier",
	"Beidhändigkeit",
	"Bogenschütze",
	"Armbrustschütze",
	"Gewandtheit",
	"Doppelschuss",
	"Erzmagier",
	"Erfahrener Haudegen",
	"Berührung der Verderbnis",
	"Essenzzehrer",
	"Abhärtung",
	"Altmeister der Magie",
	"Paladin",
	"Spiegelnde Widerstandskraft",
	"Unerschütterliche Standhaftigkeit",
	"Magische Ladung",
	"Schmerzzehrer"
};
const string StExt_Str_Perk_Desc[StExt_Perk_Max] = 
{
	"+1 auf die maximale Anzahl erlernbarer Magieschulen oder Kampfkünste",
	"+1 auf das Maximum beschworener Kreaturen sowie zusätzlich +1 je 500 Intelligenz",
	"+0,5 % Regeneration der Lebensenergie pro Sekunde",
	"+0,5 % Regeneration der magischen Energie pro Sekunde",
	"+0,5 % Regeneration der Ausdauer pro Sekunde",
	"+0,5 % Regeneration des Energieschildes pro Sekunde",
	"+1 auf die maximale Anzahl aktiver Auren sowie zusätzlich +1 je 35 Heldenstufen",
	"Auren wirken ebenfalls auf beschworene Kreaturen und Verbündete",
	"+5 Auramacht pro Heldenstufe",
	"Reduziert die Ressourcenbindung von Auren um 25 %",
	"+5 Reichweite der Aura pro Heldenstufe",
	"+10 % Chance auf kritischen Zauberschaden. Kritischer Zauberschaden verursacht 25 % mehr Schaden.",
	"+25 % mehr gefundenes Gold",
	"+5 % auf Glück",
	"+100 Schaden im Nahkampf sowie zusätzlich +5 pro Stufe",
	"+100 Schaden im Fernkampf sowie zusätzlich +5 pro Stufe",
	"+100 magischer Schaden sowie zusätzlich +5 pro Stufe",
	"Schaden wird zuerst von der Manaenergie statt von der Lebensenergie abgezogen",
	"+10 % Chance auf erfolgreiches Stehlen",
	"Beschworene Kreaturen sind um 0,1 % stärker pro Punkt Schaden der geführten magischen Waffe",
	"+0,1 % magischer Schaden pro Punkt Schaden der geführten magischen Waffe",
	"+25 % zusätzlicher Schaden mit Schwertern",
	"+25 % zusätzlicher Schaden mit Äxten",
	"+25 % zusätzlicher Schaden mit Rapiere und leichten Schwertern",
	"+25 % zusätzlicher Schaden mit Speeren",
	"+25 % zusätzlicher Schaden mit Hellebarden",
	"+25 % zusätzlicher Schaden mit Dual Waffen",
	"+25 % zusätzlicher Schaden mit Bögen",
	"+25 % zusätzlicher Schaden mit Armbrüsten",
	"+10 % auf die Geschwindigkeit aller Handlungen",
	"10 % Chance, mit Bogen oder Armbrust einen Doppelschuss auszulösen (bei Treffer)",
	"Zauber verbrauchen doppelt so viel Mana. Der Zauberschaden steigt abhängig vom aktuellen Mana.",
	"Waffenschläge verbrauchen zusätzliche Ausdauer. Der Waffenschaden steigt abhängig von der aktuellen Ausdauer.",
	"Der Held kann Erfahrung durch verursachten Schaden sammeln. -25 % erhaltene Erfahrung.",
	"Boni für das Töten von Monstern werden auch nach Erhalt des Hauptbonus weiter angerechnet.",
	"+10 % weniger erlittener Schaden sowie zusätzlich +0,1 % pro Heldenstufe",
	"Der Zauberschadensbonus durch das Tragen einer Robe ist immer aktiv – unabhängig von der Rüstung.",
	"Die gesamte Rüstungsverteidigung wird zusätzlich als Energieschild angerechnet.",
	"+50 % Widerstand gegen reflektierten Schaden",
	"+50 % Widerstand gegen Schaden über Zeit",
	"Bis zu 5 % des Manas werden verbraucht, um zusätzlichen magischen Waffenschaden zu verursachen",
	"Schaden wird zuerst von der Ausdauer statt von der Lebensenergie abgezogen"
};

// corruption perks
const string StExt_Corruption_Perk_Name_Mage[StExt_CorruptionPerk_Max] =
{
	"Opferritual",
	"Innere Reserven",
	"Unterschlupf",
	"Einfallsreichtum",
	"Der Zauberer",
	"Essenzinfusion",
	"Der Unheilige Wächter",
	"Träumer",
	"Weitsicht",
	"Weitsicht",
	"Echo der Magie",
	"Seelendieb",
	"Denkender",
	"Inspiration durch Schmerz",
	"Das Gelübde des Fanatikers",
	"Mystischer Akkumulator",
	"Mönch",
	"Adept",
	"Willenskraft",
	"Instabile Diener"
};
const string StExt_Corruption_Perk_Name_Warrior[StExt_CorruptionPerk_Max] =
{
	"Opferritual",
	"Innere Reserven",
	"Goliath",
	"Athlet",
	"Adrenalin",
	"Unbesiegbarkeit",
	"Blutlos",
	"Ewige Jugend",
	"Der Weg des Kriegers",
	"Barbarei",
	"Disziplin",
	"Vorbereitung",
	"Gesunder Körper",
	"Kannibale",
	"Diamanthaut",
	"Kampfwut",
	"Armeeausbildung",
	"Der Schlächter",
	"Parade",
	"Gleichgewicht"
};
const string StExt_Corruption_Perk_Name_Ranger[StExt_CorruptionPerk_Max] =
{
	"Opferritual",
	"Geistertanz",
	"Einfallsreichtum",
	"Mächtiger Durchschuss",
	"Ballistik",
	"Feldmedizin",
	"Athlet",
	"Leichtfuß",
	"Blutrausch",
	"Leise Schritte",
	"Teilschuss",
	"Urmacht",
	"Dornenumhang",
	"Anmut",
	"Tödliche Gifte",
	"Hexenpfeil",
	"Hinterhalt",
	"Wille der Klingen",
	"Sicherer Schlag",
	"Gleichgewicht"
};

const string StExt_Corruption_Perk_Desc_Mage[StExt_CorruptionPerk_Max] =
{
	"Das Töten von Menschen steigert das Leben des Verfluchten",
	"Wenn die Manamenge niedrig ist, wird sie auf Kosten der Lebenskraft wieder aufgefüllt,",
	"30% deiner maximalen Lebenskraft werden als Energieschild hinzugefügt",
	"+1% Chance auf kritischen Treffer mit Zaubern pro Level der Entweihung",
	"+2% Magieschaden pro Level der Entweihung",
	"+2% auf die Stärke beschworener Kreaturen pro Level der Entweihung",
	"+0,5% Chance, einen Zauber zu reflektieren, pro Level der Entweihung",
	"+1% Manaregeneration pro Sekunde",
	"Reduziert die Manareservierung von Auren um 25%",
	"20% des erlittenen Schadens werden als Energieschild wiederhergestellt",
	"+1% Zauberwiederholung pro Level der Entweihung",
	"10% des Schadens werden als Energieschild gestohlen",
	"+10% maximales Mana",
	"+50% Magieschaden bei niedriger Gesundheit",
	"Anstelle von Gesundheit wird der Energieschild regeneriert",
	"Fügt 50% deines maximalen Manas zu deinem Energieschild hinzu",
	"+1% Schaden mit magischen Waffen pro Level der Entweihung",
	"+10% Zauberkostenreduktion",
	"+3% Wirkungsdauer pro Level der Entweihung",
	"Wenn Diener sterben, explodieren sie und verursachen Feuerschaden in Höhe von 30% ihrer maximalen Gesundheit"
};
const string StExt_Corruption_Perk_Desc_Warrior[StExt_CorruptionPerk_Max] =
{
	"Das Töten von Menschen steigert das Mana des Verfluchten",
	"Wenn die Lebenskraft niedrig ist, wird sie mit Mana wieder aufgefüllt,",
	"+50 zur maximalen Lebenskraft pro Level der Entweihung",
	"+0,1% Ausdauerregeneration pro Level der Entweihung",
	"+5% Gesundheitsregeneration bei niedriger Lebenskraft",
	"+2 auf Verteidigung gegen alles pro Level der Entweihung",
	"20% des erlittenen Schadens werden als Gesundheit wiederhergestellt",
	"+2% Lebenskraftregeneration pro Sekunde",
	"+2% Nahkampfschaden pro Level der Entweihung",
	"+1% Chance auf doppelten Schaden pro Level der Entweihung",
	"+1 zu maximal aktiven Auren",
	"Reduzierte Ressourcenreserve durch Auren um 25%",
	"+10% maximales Leben",
	"Das Töten eines Feindes stellt die Gesundheit vollständig wieder her",
	"+10% Resistenz gegen allen Schaden",
	"+0,5% Chance, den Feind zu betäuben, pro Level der Entweihung",
	"+1% Armbrustschaden pro Level der Entweihung",
	"+1% Schaden mit Zweihandwaffen pro Level der Entweihung",
	"+1% Schaden mit Einhandwaffen pro Level der Entweihung",
	"30% der Stärke werden als zusätzliche Beweglichkeit hinzugefügt"
};
const string StExt_Corruption_Perk_Desc_Ranger[StExt_CorruptionPerk_Max] =
{
	"Das Töten von Menschen steigert Leben und Geschick des Verfluchten",
	"+1% Chance pro Level der Entweihung 3 Sekunden Unsichtbarkeit zu erhalten",
	"+0,5% Chance auszuweichen pro Level der Entweihung",
	"+10 Stichschaden pro Level der Entweihung",
	"+2% Fernkampfschaden pro Level der Entweihung",
	"+1% Lebensregeneration pro Sekunde",
	"+0,1% Ausdauerregeneration pro Level der Entweihung",
	"+1% auf die Geschwindigkeit aller Aktionen pro Level der Entweihung",
	"10% des erlittenen Schadens werden als Lebenskraft und Ausdauer gestohlen",
	"Du verursachst doppelten Schaden an Feinden, die dich nicht sehen können",
	"+1% Chance auf einen erneuten Schuss pro Level der Entweihung",
	"+1% Elementar-, Magie- und Giftschaden pro Level der Entweihung",
	"Reflektiert 10% des erlittenen Schadens als Stichschaden",
	"Während des Sprints +50% Chance, Angriffen auszuweichen",
	"+5 Giftschaden im Fernkampf pro Level der Entweihung",
	"+5 kontinuierlicher Magieschaden im Fernkampf pro Level der Entweihung",
	"+1% Schaden mit Schwertern und leichten Schwertern pro Level der Entweihung",
	"+1% Schaden mit Waffen im Doppelgriff pro Level der Entweihung",
	"+1% Schaden mit Speeren pro Level der Entweihung",
	"30% deiner Beweglichkeit werden als zusätzliche Stärke hinzugefügt"
};

const string StExt_Str_Yes = "Ja";
const string StExt_Str_No = "Nein";
const string StExt_Str_Learned_Yes = "Gelernt";
const string StExt_Str_Learned_No = "Nicht ausgebildet";
const string StExt_Str_Seconds = " Sek.";
const string StExt_Str_Pts = " Einheiten";
const string StExt_Str_EvilBossApears = "Das Böse ist in diese Welt gekommen...";

//		*** Difficulty configs strings ***
const string StExt_Str_Config_Diff_Header = "--- * Schwierigkeits­einstellungen * ---";
const string StExt_Str_Config_Diff_EnableStatic = "Statische Erhöhung der Schwierigkeit aktivieren";
const string StExt_Str_Config_Diff_Static_Power = "Statische Erhöhung der NPC-Kraft";
const string StExt_Str_Config_Diff_Static_Hp = "Statische Erhöhung des NPC-Lebens";
const string StExt_Str_Config_Diff_Static_Prot = "Statische Erhöhung der NPC-Verteidigung";

const string StExt_Str_Config_Diff_EnableDaily = "Tägliche Erhöhung der Schwierigkeit aktivieren";
const string StExt_Str_Config_Diff_Daily_Power = "Tägliche Erhöhung der NPC-Kraft";
const string StExt_Str_Config_Diff_Daily_Hp = "Tägliches Wachstum des NPC-Lebens";
const string StExt_Str_Config_Diff_Daily_Prot = "Tägliche Erhöhung der NPC-Verteidigung";

const string StExt_Str_Config_Diff_EnableKapitel = "Schwierigkeitserhöhung nach Kapiteln aktivieren";
const string StExt_Str_Config_Diff_Kapitel_Power = "NPC-Kraftwachstum pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Hp = "NPC-Lebenswachstum pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Prot = "Erhöhung der NPC-Verteidigung pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Speed = "Erhöhung der zusätzlichen Geschwindigkeit der NPCs pro Kapitel";

const string StExt_Str_Config_Diff_EnableLevel = "Schwierigkeitserhöhung nach Heldenlevel aktivieren";
const string StExt_Str_Config_Diff_Level_Power = "NPC-Kraftwachstum nach Heldenlevel";
const string StExt_Str_Config_Diff_Level_Hp = "NPC-Lebenswachstum nach Heldenlevel";
const string StExt_Str_Config_Diff_Level_Prot = "NPC-Verteidigungswachstum nach Heldenlevel";
const string StExt_Str_Config_Diff_Level_Speed = "Zusätzliche NPC-Geschwindigkeitserhöhung (%) nach Heldenlevel";
const string StExt_Str_Config_Diff_Level_DuplicationChance = "Zusätzliche Erhöhung der Chance auf NPC-Duplizierung nach Heldenlevel";
const string StExt_Str_Config_Diff_Level_CorruptionChance = "Zusätzliche Erhöhung der Chance auf Verderbnis der magischen Sättigung von NPCs nach Heldenlevel";
const string StExt_Str_Config_Diff_Level_MagicInfusionChance = "Zusätzliche Erhöhung der Chance auf magische Infusion von NPCs nach Heldenlevel";
const string StExt_Str_Config_Diff_Level_MagicInfusionPower = "Zusätzliche Erhöhung der Stärke der magischen Sättigung von NPCs nach Heldenlevel";

const string StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Chance = "Zusätzliche Erhöhung der Chance auf NPC-Duplizierung pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Count = "Zusätzliche Erhöhung der Anzahl der duplizierten NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Chance = "Zusätzliche Erhöhung der Chance auf magische Infusion von NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Power = "Zusätzliche Erhöhung der Stärke der magischen Sättigung von NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance = "Zusätzliche Erhöhung der Chance auf Verderbnis der magischen Sättigung von NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_TierRange = "Verschiebung des Rangs der magischen Sättigung eines NPCs durch das Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance = "Zusätzliche Erhöhung der Chance, dass NPCs pro Kapitel eine magische Nahkampfwaffe haben";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance = "Zusätzliche Erhöhung der Chance, dass NPCs pro Kapitel eine magische Fernkampfwaffe haben";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomShield_Chance = "Zusätzliche Erhöhung der Chance auf das Erscheinen eines Schildes bei NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomHelm_Chance = "Zusätzliche Erhöhung der Chance auf das Erscheinen eines Helms bei NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomScroll_Chance = "Zusätzliche Erhöhung der Chance auf das Erscheinen einer Kriegsschriftrolle bei NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_Npc_HealingScroll_Chance = "Zusätzliche Erhöhung der Chance auf das Erscheinen einer Heilungsschriftrolle bei NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_DailyHpMod = "Zusätzlicher Bonus auf das tägliche Lebenswachstum von NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_DailyPowerMod = "Zusätzlicher Bonus auf das tägliche Kraftwachstum von NPCs pro Kapitel";
const string StExt_Str_Config_Diff_Kapitel_DailyProtMod = "Zusätzlicher Bonus auf das tägliche Verteidigungswachstum von NPCs pro Kapitel";

const string StExt_Str_Config_Diff_EnableRot = "Spawn aus 'Straße der Prüfungen' aktivieren";

// *** Npc configs strings ***
const string StExt_Str_Config_Npc_Header = "--- * NPC-Einstellungen * ---";
const string StExt_Str_Config_Npc_EnableStatsRandomization = "NPC-Status-Variationen aktivieren";
const string StExt_Str_Config_Npc_StatsRandomization_Hp = "Variation der NPC-Lebenspunkte";
const string StExt_Str_Config_Npc_StatsRandomization_Stats = "Variation der NPC-Attribute";
const string StExt_Str_Config_Npc_StatsRandomization_Protection = "Variation der NPC-Verteidigung";
const string StExt_Str_Config_Npc_StatsRandomization_Damage = "Variation des NPC-Schadens";

const string StExt_Str_Config_Npc_EnableLevelBonus = "Levelbonus für NPCs aktivieren";
const string StExt_Str_Config_Npc_LevelBonus_Hp = "Zusätzliche NPC-Lebenspunkte pro Level";
const string StExt_Str_Config_Npc_LevelBonus_Stats = "Zusätzliche NPC-Attribute pro Level";
const string StExt_Str_Config_Npc_LevelBonus_Protection = "Zusätzliche NPC-Verteidigung pro Level";
const string StExt_Str_Config_Npc_LevelBonus_Damage = "Zusätzlicher NPC-Schaden pro Level";

const string StExt_Str_Config_Npc_EnableDuplication = "NPC-Duplizierung aktivieren";
const string StExt_Str_Config_Npc_Duplication_Chance = "Basis-Chance auf NPC-Duplizierung";
const string StExt_Str_Config_Npc_Duplication_CountMin = "Mindestanzahl duplizierter NPCs";
const string StExt_Str_Config_Npc_Duplication_CountMax = "Maximalanzahl duplizierter NPCs";
const string StExt_Str_Config_Npc_Duplication_AllowBosses = "Boss-Duplizierung erlauben";
const string StExt_Str_Config_Npc_Duplication_AllowHumans = "Duplizierung von Menschen erlauben";
const string StExt_Str_Config_Npc_Duplication_AllowHumansBandits = "Duplizierung menschlicher Banditen erlauben";
const string StExt_Str_Config_Npc_Duplication_LevelThreshold = "Mindest-Heldenlevel für Duplizierung";

const string StExt_Str_Config_Npc_EnableMagicInfusion = "Magische Infusion von NPCs aktivieren";
const string StExt_Str_Config_Npc_MagicInfusion_Chance = "Basis-Chance auf magische Infusion von NPCs";
const string StExt_Str_Config_Npc_MagicInfusion_LevelThreshold = "Mindest-Heldenlevel für magische Infusion";
const string StExt_Str_Config_Npc_MagicInfusion_PowerMod = "Modifikator für die Stärke der magischen Infusion";
const string StExt_Str_Config_Npc_MagicInfusion_AllowHumans = "Magische Infusion für Menschen erlauben";
const string StExt_Str_Config_Npc_MagicInfusion_AllowBosses = "Magische Infusion für Bosse erlauben";
const string StExt_Str_Config_Npc_MagicInfusion_CorruptionChance = "Chance auf Verderbnis von NPC-Affixen";

const string StExt_Str_Config_Npc_EnableRandomEquipment = "Zufällige NPC-Ausrüstung aktivieren";
const string StExt_Str_Config_Npc_RandomMeleeWeapon_Chance = "Basis-Chance, dass NPCs eine magische Nahkampfwaffe haben";
const string StExt_Str_Config_Npc_RandomRangeWeapon_Chance = "Basis-Chance, dass NPCs eine magische Fernkampfwaffe haben";
const string StExt_Str_Config_Npc_RandomScroll_Chance = "Basis-Chance, dass NPCs eine Kriegsschriftrolle erhalten";
const string StExt_Str_Config_Npc_HealingScroll_Chance = "Basis-Chance, dass NPCs eine Heilungsschriftrolle erhalten";
const string StExt_Str_Config_Npc_RandomShield_Chance = "Basis-Chance, dass NPCs einen Schild haben";
const string StExt_Str_Config_Npc_RandomHelm_Chance = "Basis-Chance, dass NPCs einen Helm haben";

const string StExt_Str_Config_Npc_MagicInfusedAlwaysHasRandomEquipment = "Magisch infundierte NPCs erhalten immer magische Waffen";

const string StExt_Str_Config_Npc_LuckyFlagChance = "Chance auf das Erscheinen glücklicher NPCs";
const string StExt_Str_Config_Npc_RichFlagChance = "Chance auf das Erscheinen reicher NPCs";

const string StExt_Str_Config_Npc_GlobalHpMult = "Endmodifikator der NPC-Lebenskraft";
const string StExt_Str_Config_Npc_GlobalStatMult = "Endmodifikator der NPC-Attribute";
const string StExt_Str_Config_Npc_GlobalProtMult = "Endmodifikator der NPC-Verteidigung";
const string StExt_Str_Config_Npc_GlobalDamMult = "Endmodifikator des NPC-Schadens";
const string StExt_Str_Config_Npc_GlobalEsMult = "Endmodifikator des NPC-Energieschilds";

const string StExt_Str_Config_NpcSum_CanBeDuplicated = "Beschworene NPCs können dupliziert werden";
const string StExt_Str_Config_NpcSum_CanBeInfused = "Beschworene NPCs können magisch infundiert werden";
const string StExt_Str_Config_NpcSum_GlobalHpMult = "Endmodifikator der Lebenskraft beschworener NPCs";
const string StExt_Str_Config_NpcSum_GlobalStatMult = "Endmodifikator der Attribute beschworener NPCs";
const string StExt_Str_Config_NpcSum_GlobalProtMult = "Endmodifikator der Verteidigung beschworener NPCs";
const string StExt_Str_Config_NpcSum_GlobalDamMult = "Endmodifikator des Schadens beschworener NPCs";
const string StExt_Str_Config_NpcSum_GlobalEsMult = "Endmodifikator des Energieschilds beschworener NPCs";

const string StExt_Str_Config_Sum_GlobalHpMult = "Endmodifikator der Lebenskraft beschworener Kreaturen";
const string StExt_Str_Config_Sum_GlobalStatMult = "Endmodifikator der Attribute beschworener Kreaturen";
const string StExt_Str_Config_Sum_GlobalProtMult = "Endmodifikator der Verteidigung beschworener Kreaturen";
const string StExt_Str_Config_Sum_GlobalDamMult = "Endmodifikator des Schadens beschworener Kreaturen";

// *** Luck configs strings ***
const string StExt_Str_Config_Luck_Header = "--- * Glücks Einstellungen * ---";
const string StExt_Str_Config_Luck_Difficulty = "Basis Glücksschwierigkeitsmodifikator";
const string StExt_Str_Config_Luck_Power = "Basis Gegenstandsleistungsmodifikator";
const string StExt_Str_Config_Luck_Quantity = "Basis Gegenstandsquantitätsmodifikator";
const string StExt_Str_Config_Luck_Money = "Basis Goldmengenmodifikator";

const string StExt_Str_Config_Luck_EnableRandomLoot_Bodies = "Glück bei besiegten NPCs aktivieren";
const string StExt_Str_Config_Luck_EnableRandomLoot_Chests = "Glück in Truhen aktivieren";
const string StExt_Str_Config_Luck_RandomLoot_EnableUnHumanDrop = "Glück bei nicht-menschlichen NPCs aktivieren";

const string StExt_Str_Config_Luck_RandomLootPowerMod_Food = "Glücksleistungsmodifikator für Nahrung";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Alchemy = "Glücksleistungsmodifikator für Alchemie";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Magic = "Glücksleistungsmodifikator für Magie";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Misk = "Glücksleistungsmodifikator für verschiedene Gegenstände";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Armor = "Glücksleistungsmodifikator für Rüstungen";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Weapon = "Glücksleistungsmodifikator für Waffen";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Jewelry = "Glücksleistungsmodifikator für Schmuck";

const string StExt_Str_Config_Luck_RandomLootQuantityMod_Food = "Glücksquantitätsmodifikator für Nahrung";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Alchemy = "Glücksquantitätsmodifikator für Alchemie";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Magic = "Glücksquantitätsmodifikator für Magie";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Munition = "Glücksquantitätsmodifikator für Pfeile und Bolzen";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Misk = "Glücksquantitätsmodifikator für verschiedene Gegenstände";

// *** World randomization configs strings ***
const string StExt_Str_Config_WorldRandomization_Header = "--- * Einstellungen zur Welt-Randomisierung * ---";
const string StExt_Str_Config_EnableWorldRandomization_Items = "Zufälliges Erscheinen von Gegenständen in der Welt aktivieren";
const string StExt_Str_Config_EnableWorldRandomization_Npc = "Zufälliges Erscheinen von NPCs in der Welt aktivieren";
const string StExt_Str_Config_WorldRandomization_MinCooldown = "Minimale Abklingzeit der Welt-Randomisierung";
const string StExt_Str_Config_WorldRandomization_MaxCooldown = "Maximale Abklingzeit der Welt-Randomisierung";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnChance = "Wahrscheinlichkeit für zufälliges Erscheinen von NPCs in der Welt";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPowerMod = "Leistungsmodifikator für zufällige NPCs";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPower_LevelMod = "Modifikator für die Stärke zufälliger Gegner, abhängig vom Heldenlevel";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPower_KapitelMod = "Modifikator für die Stärke zufälliger NPCs aus dem Kapitel";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPower_DayMod = "Modifikator für die Stärke zufälliger NPCs pro Tag";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnCountMod = "Anzahlmodifikator für zufällige NPCs";
const string StExt_Str_Config_WorldRandomization_Item_SpawnChance = "Wahrscheinlichkeit für zufälliges Erscheinen von Gegenständen in der Welt";
const string StExt_Str_Config_WorldRandomization_Item_SpawnPowerMod = "Leistungsmodifikator für zufällige Gegenstände";
const string StExt_Str_Config_WorldRandomization_Item_SpawnCountMod = "Anzahlmodifikator für zufällige Gegenstände";

const string StExt_Str_Config_WorldRandomization_TradersExtraItemsAddRate = "Zufallsgegenstands-Zugaberate für Händler";
const string StExt_Str_Config_WorldRandomization_EmptyChestsUpdateRate = "Häufigkeit der Aktualisierung leerer Truhen";
const string StExt_Str_Config_WorldRandomization_EmptyChestsUpdateCount = "Anzahl der zu aktualisierenden leeren Truhen";
const string StExt_Str_Config_WorldRandomization_Npc_EnableSpawnSound = "Tonbenachrichtigung aktivieren, wenn ein NPC durch den Randomizer erscheint";
const string StExt_Str_Config_WorldRandomization_LockChest = "Den Inhalt aller Truhen aktualisieren";
const string StExt_Str_Config_WorldRandomization_PutInAnyChest = "Truhen bei der Zufallsauswahl schließen";

// *** Other configs strings ***
const string StExt_Str_Config_Misk_Header = "--- * Weitere Einstellungen * ---";
const string StExt_Str_Config_EnableSkeletonSkin = "Untoten-Skin aktivieren";
const string StExt_Str_Config_EnableSkeletonSkin_OnlyAtNight = "Untoten-Skin nur nachts aktiv";
const string StExt_Str_Config_EnableFemaleLook = "Weiblichen Skin aktivieren";
const string StExt_Str_Config_EnableFemaleLook_AlwaysWig = "Weiblicher Skin - Perücke";
const string StExt_Str_Config_EnableFemaleLook_HideHelm = "Helm durch Perücke ersetzten";
const string StExt_Str_Config_EnableFemaleLook_DemonLook = "Weiblicher Skin - Dämonen-Look";

const string StExt_Str_Config_GainExpMod = "Erfahrungsgewinn Modifikator";
const string StExt_Str_Config_ExpMod = "Allgemeiner Modifikator für erhaltene Erfahrung (Einstellung aus dem Original)";
const string StExt_Str_Config_SncExp = "Absoluter SNC-Entwicklungsmodifikator";
const string StExt_Str_Config_PartyExp = "Erfahrung im Bündnis mit Verbündeten";
const string StExt_Str_Config_NpcExp = "Erfahrung von NPCs";
const string StExt_Str_Config_BelliarRageExp = "Modifikator für Erfahrung von Feinden (Beliars Zorn)";

const string StExt_Str_Config_BelliarRage_Active = "Beliars Zorn - Mod aktiv";
const string StExt_Str_Config_BelliarRage_SpawnMonsters = "Beliars Zorn - Zufälliges Erscheinen von Monstern beim Helden";
const string StExt_Str_Config_BelliarRage_StaminaReduce = "Beliars Zorn - Erhöhte Ausdauerkosten";
const string StExt_Str_Config_BelliarRage_AddDamageReduce = "Beliars Zorn - Reduktion allen zusätzlichen Schadens";
const string StExt_Str_Config_BelliarRage_RegenEnemies = "Beliars Zorn - Lebensregeneration bei Gegnern";
const string StExt_Str_Config_BelliarRage_SoundEnable = "Beliars Zorn - Ton aktivieren";

const string StExt_Str_Config_ExtraLp = "Zusätzliche Lernpunkte pro Stufe";
const string StExt_Str_Config_ExtraHpPerLevel = "Zusätzliche Lebenspunkte pro Stufe";
const string StExt_Str_Config_ExtraMpPerLevel = "Zusätzliche Mana pro Stufe";
const string StExt_Str_Config_ExtraEsPerLevel = "Zusätzlicher Energieschild pro Stufe";
const string StExt_Str_Config_ExtraStrPerLevel = "Zusätzliche Stärke pro Stufe";
const string StExt_Str_Config_ExtraAgiPerLevel = "Zusätzliche Beweglichkeit pro Stufe";
const string StExt_Str_Config_ExtraIntPerLevel = "Zusätzliche Intelligenz pro Stufe";
const string StExt_Str_Config_ExtraLuckPerLevel = "Zusätzliches Glück pro Stufe";

const string StExt_Str_Config_MasteriesExpMult = "Erfahrungsmodifikator für Meisterschaften";
const string StExt_Str_Config_CorruptionExpMult = "Erfahrungsmodifikator für Verderbnis";
const string StExt_Str_Config_ArtifactsExpMult = "Erfahrungsmodifikator für Artefakte";
const string StExt_Str_Config_EducationMoneyCostMult = "Goldkosten-Modifikator für Ausbildung";
const string StExt_Str_Config_EducationRequirementsMult = "Anforderungsmodifikator für Ausbildung";
const string StExt_Str_Config_NoChapterForMagicCircle = "Kapitelanforderungen für Magiekreis-Training deaktivieren";
const string StExt_Str_Config_ShowNpcLevel = "NPC-Stufe anzeigen";
const string StExt_Str_Config_DisplayLuckMessage = "Glücksmeldungen anzeigen";
const string StExt_Str_Config_DisplayMasteryLevelUp = "Meldungen zum Lernfortschritt anzeigen";
const string StExt_Str_Configs_Education = "[Spezialfähigkeiten erlernen]";

const string StExt_Str_Config_Ui_Header = "Interface-Einstellungen";
const string StExt_Str_Config_MenuScaleX = "Menübreite (Mod)";
const string StExt_Str_Config_MenuScaleY = "Menühöhe (Mod)";
const string StExt_Str_Config_DisplayBuffEffects = "Buff-/Debuff-Effekte anzeigen";
const string StExt_Str_Config_DisplayEsEffects = "Energieschild-Effekt anzeigen";
const string StExt_Str_Config_MenuTextWrapIndex = "Index für Zeilenumbruch im Menü";
const string StExt_Str_GeneralPerks_Header = "Allgemeine Fähigkeiten";

/* *** Aura strings *** */
const string StExt_Str_AuraName[StExt_AuraIndex_Max] =
{
	"Konzentrator",
	"Herz des Bisons",
	"Die Weisheit Adanos'",
	"Geheimes Wissen",
	"Die Kraft des Bären",
	"Beweglichkeit des Pumas",
	"Der Bau der Eule",
	"Regeneration des Wolfs",
	"Die List des Raben",
	"Ausdauer des Hundes",
	"Traum des Träumers",
	"Geschwindigkeit des Geparden",
	"Astralfluss",
	"Beweglichkeit der Schlange",
	"Blutegel",
	"Illithid",
	"Seelendieb",
	"Eiserne Haut",
	"Luftschild",
	"Zauberfresser",
	"Glück",
	"Reichtum",
	"Dieb",
	"Hexe",
	"Friedhof",
	"Walddickicht",
	"Jüngstes Gericht",
	"Bastion",
	"Dorn",
	"Spiegelschild",
	"Der Beschwörer",
	"Oberherr",
	"Der Zermalmer",
	"Der Inquisitor",
	"Berührung des Nordens",
	"Gebet",
	"Diener des Todes",
	"Giftmischer",
	"Ansturm",
	"Verdammnis",
	"Der Zermalmer",
	"Holzfäller",
	"Der Pfähler",
	"Kriegertrance",
	"Pfeil der Verwandlung",
	"Trance des Zauberers",
	"Ätherische Haut",
	"Stärkung",
	"Schleier des Todes",
	"Unheilvoller Mantel",
	"Eismantel",
	"Sturmmantel",
	"Giftmantel",
	"Mantel der Dornen",
	"Feuermantel",
	"Steinmantel",
	"Mantel der Bereitschaft",
	"Wütende Flamme",
	"Eisbolide",
	"Schleichende Dunkelheit",
	"Atem des Ewigen",
	"Hand des Sturms",
	"Wind des Wandels",
	"Blick des Basilisken",
	"Stolperstein",
	"Schattenhelfer",
	"Verlängerung",
	"Herr des Astrals",
	"Herr der Toten",
	"Herr der Golems",
	"Dämonenfürst",
	"Herr des Todes",
	"Meister des Lebens",
	"Herr des Lichts",
	"Herr der Dunkelheit",
	"Herr des Blitzes",
	"Herr der Lüfte",
	"Herr der Erde",
	"Herr des Eises",
	"Herr des Feuers",
	"Inspiration des Kriegers",
	"Inspiration des Söldners",
	"Inspiration des Jägers",
	"Inspiration des Schützen",
	"Lebende Waffe",
	"Inspiration des Assassinen",
	"Vergeltung der Keule",
	"Vergeltung der Klinge",
	"Vergeltung des Bogens",
	"Vergeltung des Feuers",
	"Vergeltung des Windes",
	"Vergeltung der Magie",
	"Vergeltung des Giftes"
};

const string StExt_Str_AuraDesc[StExt_AuraIndex_Max] = 
{
	"+100 zur Aurastärke",
	"+5 Leben pro Aurastärke",
	"+2 Mana pro Aurastärke",
	"+1 Intelligenz pro Aurastärke",
	"+1 Stärke pro Aurastärke",
	"+1 Geschick pro Aurastärke",
	"+5 Energieschild pro Aurastärke",
	"+0,01% Lebensregeneration pro Aurastärke",
	"+0,01% Energieschildregeneration pro Aurastärke",
	"+0,02% Ausdauerregeneration pro Aurastärke",
	"+0,01% Manaregeneration pro Aurastärke",
	"+0,05% Aktionsgeschwindigkeit pro Aurastärke",
	"+0,1% Magische Macht pro Aurastärke",
	"+0,05% auf Ausweichen pro Aurastärke",
	"+0,01% Lebensraub pro Aurastärke",
	"+0,01% Manaraub pro Aurastärke",
	"+0,01% Schildraub pro Aurastärke",
	"+0,5 physische Verteidigung pro Aurastärke",
	"+0,05% Chance einen Pfeil abzuwehren pro Aurastärke",
	"+0,05% Zauberabsorption pro Aurastärke",
	"+0,05% Glück pro Aurastärke",
	"+0,1% Bonus auf gefundenes Gold pro Aurastärke",
	"+0,1% Diebstahlchance pro Aurastärke",
	"+0,01% Chance tote Feinde in Skelette zu verwandeln pro Aurastärke",
	"Ruft Zombie-Wächter (Anzahl: Aurastärke & Macht der Nekromantie)",
	"Ruft Wächterwölfe (Anzahl: Aurastärke & Macht der Naturmagie)",
	"Ruft Dämonenwächter (Anzahl: Aurastärke & Macht der Dämonologie)",
	"Ruft Wächtergolems (Anzahl: Aurastärke & Macht der Golemologie)",
	"+0,1% Chance Schaden zu reflektieren pro Aurastärke",
	"+0,1% Chance Magie zu reflektieren pro Aurastärke",
	"+0,1% zur Gesamtstärke beschworener Kreaturen pro Aurastärke",
	"+1 Slot für Beschwörungen pro 100 Aurastärke",
	"+0,1% Chance den Feind zu betäuben pro Aurastärke",
	"Pro Aurastärke: +0,1% Chance auf Brennen und +1 Brennschaden",
	"Pro Aurastärke: +0,1% Chance auf Einfrieren und +1 Magieschaden",
	"Mantel: +1 Feuerschaden gegen Böses und Untote pro Aurastärke",
	"+1 Magieschaden gegen lebende Ziele pro Aurastärke",
	"Pro Aurastärke: +0,1% Chance auf Vergiften und +1 DoT-Giftschaden",
	"Pro Aurastärke: +0,1% Chance auf Betäuben und +2 Magieschaden",
	"Pro Aurastärke: +0,1% Chance auf +1 Magie-DoT-Schaden",
	"Pro Aurastärke: +0,1% Chance auf +1 Hiebschaden",
	"Pro Aurastärke: +0,1% Chance auf +1 Klingenschaden",
	"Pro Aurastärke: +0,1% Chance auf +1 Stichschaden",
	"+0,1% Nahkampfschaden pro Aurastärke",
	"+0,1% Fernkampfschaden pro Aurastärke",
	"+0,1% Zauberschaden pro Aurastärke",
	"+0,5 Feuer- und Magieschutz pro Aurastärke",
	"+1 Rückstoß-Schutz pro Aurastärke",
	"Wenn getroffen: +10% Chance auf Todesnebel",
	"Wenn getroffen: +10% Chance auf Dunkle Welle",
	"Wenn getroffen: +10% Chance auf Kältewelle, kann einfrieren",
	"Wenn getroffen: +10% Chance auf Elektrische Welle, kann betäuben",
	"Wenn getroffen: +10% Chance auf Giftwelle, kann vergiften",
	"Wenn getroffen: +10% Chance auf Wurzelwelle, kann fesseln",
	"Wenn getroffen: +10% Chance auf Feuerwelle",
	"Wenn getroffen: +10% Chance auf Erdbeben, kann betäuben",
	"Wenn getroffen: +10% Chance auf 3 Sekunden Unverwundbarkeit",
	"Schießt jede Sekunde einen Feuerball auf den Feind",
	"Schießt jede Sekunde einen Eisspeer auf den Feind",
	"Schießt jede Sekunde eine Dunkelheitskugel auf den Feind",
	"Schießt jede Sekunde eine Todeskugel auf den Feind",
	"Schießt jede Sekunde einen Blitz auf den Feind",
	"Schießt jede Sekunde eine Luftfaust auf den Feind",
	"Schießt jede Sekunde einen Giftpfeil auf den Feind",
	"Schießt jede Sekunde einen Steinpfeil auf den Feind",
	"Ruft Schattenkopien von dir (Macht der Dunklen Magie)",
	"+0,1% zur Wirkungsdauer von Effekten pro Aurastärke",
	"+1 auf Macht der Kunst der Magie pro Aurastärke",
	"+1 auf Macht der Nekromantie pro Aurastärke",
	"+1 auf Macht der Golemologie pro Aurastärke",
	"+1 auf Macht der Dämonologie pro Aurastärke",
	"+1 auf Macht der Todesmagie pro Aurastärke",
	"+1 auf Macht der Naturmagie pro Aurastärke",
	"+1 auf Macht der Lichtmagie pro Aurastärke",
	"+1 auf Macht der Dunklen Magie pro Aurastärke",
	"+1 auf Macht der Elektromagie pro Aurastärke",
	"+1 auf Macht der Luftmagie pro Aurastärke",
	"+1 auf Macht der Erdmagie pro Aurastärke",
	"+1 auf Macht der Wassermagie pro Aurastärke",
	"+1 auf Macht der Feuermagie pro Aurastärke",
	"+3 Schaden mit Einhandwaffen pro Aurastärke",
	"+3 Schaden mit Zweihandwaffen pro Aurastärke",
	"+3 Schaden mit Bögen pro Aurastärke",
	"+3 Schaden mit Armbrüsten pro Aurastärke",
	"Wirft die aktuelle Nahkampfwaffe auf nahe Feinde",
	"+3 Schaden mit beidhändig geführten Waffen pro Aurastärke",
	"Angreifer erleidet +5 Klingenschaden pro Aurastärke",
	"Angreifer erleidet +5 Hiebschaden pro Aurastärke",
	"Angreifer erleidet +5 Stichschaden pro Aurastärke",
	"Angreifer erleidet +5 Feuerschaden pro Aurastärke",
	"Angreifer erleidet +5 Rückstoß-Schaden pro Aurastärke",
	"Angreifer erleidet +5 Magieschaden pro Aurastärke",
	"Angreifer erleidet +5 Giftschaden pro Aurastärke"
};

const string StExt_Str_AuraRequirements[StExt_AuraIndex_Max] = 
{
	"Erfordert: 300 Ausdauer",
	"Erfordert: 200 Ausdauer",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 200 Intelligenz",
	"Erfordert: 200 Ausdauer | 100 Stärke",
	"Erfordert: 200 Ausdauer | 100 Geschicklichkeit",
	"Erfordert: 200 Intelligenz",
	"Erfordert: 200 Ausdauer",
	"Erfordert: 200 Intelligenz",
	"Erfordert: 150 Ausdauer",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 250 Ausdauer | 75 Geschicklichkeit",
	"Erfordert: 250 Intelligenz",
	"Erfordert: 200 Ausdauer | 100 Geschicklichkeit",
	"Erfordert: 500 Leben",
	"Erfordert: 500 Mana",
	"Erfordert: 500 Energieschild",
	"Erfordert: 500 Leben",
	"Erfordert: 300 Leben",
	"Erfordert: 300 Mana",
	"Erfordert: ",
	"Erfordert: ",
	"Erfordert: 50 Geschicklichkeit",
	"Erfordert: 250 Intelligenz | 600 Mana",
	"Erfordert: 300 Intelligenz",
	"Erfordert: 300 Intelligenz",
	"Erfordert: 500 Intelligenz",
	"Erfordert: 400 Intelligenz",
	"Erfordert: 300 Ausdauer",
	"Erfordert: 300 Intelligenz | 500 Mana",
	"Erfordert: 200 Intelligenz",
	"Erfordert: 350 Intelligenz | 500 Mana",
	"Erfordert: 150 Stärke | 300 Ausdauer",
	"Erfordert: 200 Mana",
	"Erfordert: 200 Mana",
	"Erfordert: 350 Mana",
	"Erfordert: 250 Ausdauer",
	"Erfordert: 200 Ausdauer",
	"Erfordert: 250 Mana",
	"Erfordert: 250 Mana",
	"Erfordert: 300 Ausdauer",
	"Erfordert: 300 Ausdauer",
	"Erfordert: 300 Ausdauer",
	"Erfordert: 300 Ausdauer",
	"Erfordert: 300 Ausdauer",
	"Erfordert: 300 Mana",
	"Erfordert: 300 Mana",
	"Erfordert: 300 Ausdauer | 500 Leben",
	"Erfordert: 400 Intelligenz | 600 Mana",
	"Erfordert: 400 Intelligenz | 600 Mana",
	"Erfordert: 400 Intelligenz | 600 Mana",
	"Erfordert: 400 Intelligenz | 600 Mana",
	"Erfordert: 400 Intelligenz | 600 Mana",
	"Erfordert: 400 Intelligenz | 600 Mana",
	"Erfordert: 400 Intelligenz | 600 Mana",
	"Erfordert: 400 Intelligenz | 600 Mana",
	"Erfordert: 500 Ausdauer | 1000 Leben",
	"Erfordert: 100 Intelligenz | 200 Mana",
	"Erfordert: 100 Intelligenz | 200 Mana",
	"Erfordert: 100 Intelligenz | 200 Mana",
	"Erfordert: 100 Intelligenz | 200 Mana",
	"Erfordert: 100 Intelligenz | 200 Mana",
	"Erfordert: 100 Intelligenz | 200 Mana",
	"Erfordert: 100 Intelligenz | 200 Mana",
	"Erfordert: 100 Intelligenz | 200 Mana",
	"Erfordert: 500 Leben",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Intelligenz",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 300 Ausdauer",
	"Erfordert: 100 Ausdauer",	
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Ausdauer",
	"Erfordert: 100 Ausdauer"
};

const string StExt_Str_AuraReservation[StExt_AuraIndex_Max] =
{
	"Reserviert: 10% Ausdauer",
	"Reserviert: 15% Ausdauer",
	"Reserviert: 25% Ausdauer",
	"Reserviert: 20% Mana",
	"Reserviert: 15% Ausdauer",
	"Reserviert: 15% Ausdauer",
	"Reserviert: 30% Mana",
	"Reserviert: 25% Ausdauer",
	"Reserviert: 25% Mana",
	"Reserviert: 10% Ausdauer",
	"Reserviert: 15% Mana",
	"Reserviert: 35% Ausdauer",
	"Reserviert: 40% Mana",
	"Reserviert: 35% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Mana",
	"Reserviert: 15% Energieschild",
	"Reserviert: 25% Ausdauer",
	"Reserviert: 35% Ausdauer",
	"Reserviert: 35% Mana",
	"Reserviert: 15% Ausdauer",
	"Reserviert: 15% Ausdauer",
	"Reserviert: 5% Ausdauer",
	"Reserviert: 35% Mana",
	"Reserviert: 35% Mana",
	"Reserviert: 35% Mana",
	"Reserviert: 40% Mana",
	"Reserviert: 40% Mana",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Mana",
	"Reserviert: 25% Mana",
	"Reserviert: 60% Mana",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 25% Mana",
	"Reserviert: 30% Mana",
	"Reserviert: 30% Mana",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 25% Ausdauer",
	"Reserviert: 25% Ausdauer",
	"Reserviert: 25% Mana",
	"Reserviert: 25% Mana",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 25% Mana",
	"Reserviert: 25% Mana",
	"Reserviert: 25% Mana",
	"Reserviert: 25% Mana",
	"Reserviert: 25% Mana",
	"Reserviert: 25% Mana",
	"Reserviert: 25% Mana",
	"Reserviert: 25% Mana",
	"Reserviert: 30% Ausdauer",
	"Reserviert: 50% Mana",
	"Reserviert: 50% Mana",
	"Reserviert: 50% Mana",
	"Reserviert: 50% Mana",
	"Reserviert: 50% Mana",
	"Reserviert: 50% Mana",
	"Reserviert: 50% Mana",
	"Reserviert: 50% Mana",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 15% Ausdauer",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Mana",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 35% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer",
	"Reserviert: 20% Ausdauer"
};

const string StExt_Str_NotEnoughtLpMessagePart = "Lernpunkte!";
const string StExt_Str_Auras_NoSlot = "Das Limit der aktiven Auren wurde erreicht!";
const string StExt_Str_Auras_NoMana = "Aura-Anforderungen überschreiten die menschliche Grenze!";
const string StExt_Str_Auras_NoStats = "Aura-Anforderungen nicht erfüllt!";
const string StExt_Str_Auras_CantEquip = "Aura kann nicht aktiviert werden!";
const string StExt_Str_print_Aura = "Aura: ";
const string StExt_Str_DisplayManaReq = "Benötigtes Mana: ";
const string StExt_Str_DisplayStrReq = "Benötigte Stärke: ";
const string StExt_Str_DisplayAgiReq = "Benötigtes Geschick: ";
const string StExt_Str_DisplayHpReq = "Benötigte Lebenspunkte: ";
const string StExt_Str_DisplayStamReq = "Benötigte Ausdauer: ";
const string StExt_Str_DisplayBowReq = "Benötigtes Bogentalent: ";
const string StExt_Str_DisplayCBowReq = "Benötigtes Armbrusttalent: ";
const string StExt_Str_DisplayShieldReq = "Benötigtes Schildtalent: ";
const string StExt_Str_DisplayShieldProtWeap = "Waffenschutz: ";
const string StExt_Str_DisplayShieldProtPoint = "Pfeilschutz: ";
const string StExt_Str_PotionEffect_Header = "Trankeffekte:";

const string StExt_Str_CorruptionScrollName = "Schriftrolle des geheimnisvollen Rituals";
const string StExt_Str_CorruptionScrollTxt1 = "Hier wird ein sehr finsteres Ritual zur Erlangung besonderer Kräfte beschrieben...";
const string StExt_Str_CorruptionScrollTxt2 = "Vielleicht ist es besser, diese Schriftrolle in Ruhe zu lassen?";
const string StExt_Str_CorruptionScrollTxt3 = "Wirkt nur auf geschwächte Ziele (bis Stufe 15)";

/* *** Book strings *** */
const string itwr_StExt_book_ice1_name = "Grimoire der Wassermagie - Lehrling";
const string itwr_StExt_book_ice2_name = "Grimoire der Wassermagie - Adept";
const string itwr_StExt_book_ice3_name = "Grimoire der Wassermagie - Experte";
const string itwr_StExt_book_ice5_name = "Grimoire der Wassermagie - Meister";
const string itwr_StExt_book_ice4_name = "Grimoire der Wassermagie - Großmeister";

const string itwr_StExt_book_electro1_name = "Grimoire der Elektromagie - Lehrling";
const string itwr_StExt_book_electro2_name = "Grimoire der Elektromagie - Adept";
const string itwr_StExt_book_electro3_name = "Grimoire der Elektromagie - Experte";
const string itwr_StExt_book_electro4_name = "Grimoire der Elektromagie - Meister";
const string itwr_StExt_book_electro5_name = "Grimoire der Elektromagie - Großmeister";

const string itwr_StExt_book_dark1_name = "Grimoire der Dunklen Magie - Lehrling";
const string itwr_StExt_book_dark2_name = "Grimoire der Dunklen Magie - Adept";
const string itwr_StExt_book_dark3_name = "Grimoire der Dunklen Magie - Experte";
const string itwr_StExt_book_dark4_name = "Grimoire der Dunklen Magie - Meister";
const string itwr_StExt_book_dark5_name = "Grimoire der Dunklen Magie - Großmeister";

const string itwr_StExt_book_fire1_name = "Grimoire der Feuermagie - Lehrling";
const string itwr_StExt_book_fire2_name = "Grimoire der Feuermagie - Adept";
const string itwr_StExt_book_fire3_name = "Grimoire der Feuermagie - Experte";
const string itwr_StExt_book_fire4_name = "Grimoire der Feuermagie - Meister";
const string itwr_StExt_book_fire5_name = "Grimoire der Feuermagie - Großmeister";

const string itwr_StExt_book_air1_name = "Grimoire der Luftmagie - Lehrling";
const string itwr_StExt_book_air2_name = "Grimoire der Luftmagie - Adept";
const string itwr_StExt_book_air3_name = "Grimoire der Luftmagie - Experte";
const string itwr_StExt_book_air4_name = "Grimoire der Luftmagie - Meister";
const string itwr_StExt_book_air5_name = "Grimoire der Luftmagie - Großmeister";

const string itwr_StExt_book_earth1_name = "Grimoire der Erdmagie - Lehrling";
const string itwr_StExt_book_earth2_name = "Grimoire der Erdmagie - Adept";
const string itwr_StExt_book_earth3_name = "Grimoire der Erdmagie - Experte";
const string itwr_StExt_book_earth4_name = "Grimoire der Erdmagie - Meister";
const string itwr_StExt_book_earth5_name = "Grimoire der Erdmagie - Großmeister";

const string itwr_StExt_book_light1_name = "Grimoire der Lichtmagie - Lehrling";
const string itwr_StExt_book_light2_name = "Grimoire der Lichtmagie - Adept";
const string itwr_StExt_book_light3_name = "Grimoire der Lichtmagie - Experte";
const string itwr_StExt_book_light4_name = "Grimoire der Lichtmagie - Meister";
const string itwr_StExt_book_light5_name = "Grimoire der Lichtmagie - Großmeister";

const string itwr_StExt_book_golems1_name = "Grimoire des Golemologie - Lehrling";
const string itwr_StExt_book_golems2_name = "Grimoire des Golemologie - Adept";
const string itwr_StExt_book_golems3_name = "Grimoire des Golemologie - Experte";
const string itwr_StExt_book_golems4_name = "Grimoire des Golemologie - Meister";
const string itwr_StExt_book_golems5_name = "Grimoire des Golemologie - Großmeister";

const string itwr_StExt_book_necromancy1_name = "Grimoire der Nekromantie - Lehrling";
const string itwr_StExt_book_necromancy2_name = "Grimoire der Nekromantie - Adept";
const string itwr_StExt_book_necromancy3_name = "Grimoire der Nekromantie - Experte";
const string itwr_StExt_book_necromancy4_name = "Grimoire der Nekromantie - Meister";
const string itwr_StExt_book_necromancy5_name = "Grimoire der Nekromantie - Großmeister";

const string itwr_StExt_book_healing1_name = "Grimoire der Naturmagie - Lehrling";
const string itwr_StExt_book_healing2_name = "Grimoire der Naturmagie - Adept";
const string itwr_StExt_book_healing3_name = "Grimoire der Naturmagie - Experte";
const string itwr_StExt_book_healing4_name = "Grimoire der Naturmagie - Meister";
const string itwr_StExt_book_healing5_name = "Grimoire der Naturmagie - Großmeister";

const string itwr_StExt_book_demonolog1_name = "Grimoire der Dämonologie - Lehrling";
const string itwr_StExt_book_demonolog2_name = "Grimoire der Dämonologie - Adept";
const string itwr_StExt_book_demonolog3_name = "Grimoire der Dämonologie - Experte";
const string itwr_StExt_book_demonolog4_name = "Grimoire der Dämonologie - Meister";
const string itwr_StExt_book_demonolog5_name = "Grimoire der Dämonologie - Großmeister";

const string itwr_StExt_book_death1_name = "Grimoire der Todesmagie - Lehrling";
const string itwr_StExt_book_death2_name = "Grimoire der Todesmagie - Adept";
const string itwr_StExt_book_death3_name = "Grimoire der Todesmagie - Experte";
const string itwr_StExt_book_death4_name = "Grimoire der Todesmagie - Meister";
const string itwr_StExt_book_death5_name = "Grimoire der Todesmagie - Großmeister";

const string itwr_StExt_book_shaman1_name = "Kunst der Magie - Lehrling";
const string itwr_StExt_book_shaman2_name = "Kunst der Magie - Adept";
const string itwr_StExt_book_shaman3_name = "Kunst der Magie - Experte";
const string itwr_StExt_book_shaman4_name = "Kunst der Magie - Meister";
const string itwr_StExt_book_shaman5_name = "Kunst der Magie - Großmeister";

const string itwr_StExt_book_matrialarts1_name = "Kunst des Krieges - Lehrling";
const string itwr_StExt_book_matrialarts2_name = "Kunst des Krieges - Adept";
const string itwr_StExt_book_matrialarts3_name = "Kunst des Krieges - Experte";
const string itwr_StExt_book_matrialarts4_name = "Kunst des Krieges - Meister";
const string itwr_StExt_book_matrialarts5_name = "Kunst des Krieges - Großmeister";

const string itwr_StExt_book_agile1_name = "Kunst der Verteidigung - Lehrling";
const string itwr_StExt_book_agile2_name = "Kunst der Verteidigung - Adept";
const string itwr_StExt_book_agile3_name = "Kunst der Verteidigung - Experte";
const string itwr_StExt_book_agile4_name = "Kunst der Verteidigung - Meister";
const string itwr_StExt_book_agile5_name = "Kunst der Verteidigung - Großmeister";

const string itwr_StExt_book_archery1_name = "Kunst des Bogenschießens - Lehrling";
const string itwr_StExt_book_archery2_name = "Kunst des Bogenschießens - Adept";
const string itwr_StExt_book_archery3_name = "Kunst des Bogenschießens - Experte";
const string itwr_StExt_book_archery4_name = "Kunst des Bogenschießens - Meister";
const string itwr_StExt_book_archery5_name = "Kunst des Bogenschießens - Großmeister";

const string StExt_Str_ImpossibleToReadMasteryBook = "Unmöglich zu lesen - Anforderungen nicht erfüllt!";

/* *** Food strings *** */
const string StExt_Str_BoozeDesc = "Seltene und edle Übersee-Spirituosen...";
const string StExt_Str_BoozeCiderName = "Apfelwein";
const string StExt_Str_BoozeMeadName = "Met";
const string StExt_Str_BoozeVodkaName = "Wodka";
const string StExt_Str_BoozeWhiskeyName = "Whisky";
const string StExt_Str_BoozeCognacName = "Cognac";
const string StExt_Str_BoozeBrendyName = "Brandy";
const string StExt_Str_BoozeAbsinthName = "Absinth";
const string StExt_Str_BoozeTequilaName = "Tequila";
const string StExt_Str_BoozeScotchName = "Scotch";
const string StExt_Str_BoozeGrappaName = "Grappa";
const string StExt_Str_FruitsDesc = "Seltene Übersee-Frucht. Gut für die Gesundheit...";
const string StExt_Str_PineAppleName = "Ananas";
const string StExt_Str_PearName = "Birne";
const string StExt_Str_CocountName = "Kokosnuss";
const string StExt_Str_BananaName = "Banane";

const string StExt_Str_BluntName = "Joint";
const string StExt_Str_BluntDesc1 = "Gefüllt mit dem feinsten Sumpfkraut!";
const string StExt_Str_BluntDesc2 = "Reduziert Müdigkeit. Erhöht Durst und Hunger.";
const string StExt_Str_BluntDesc3 = "Lässt dich seltsam fühlen...";

const string StExt_Str_StonedWax_Name = "Eine Flasche magische Tinte";
const string StExt_Str_StonedWax_Desc = "Klicken, um magische Schriftrollen zu erstellen";

const string StExt_Str_Grimmoire_Name = "Altes Grimoire";
const string StExt_Str_Dagger_Name = "Namenloser Dolch";
const string StExt_Str_Grimmoire_Txt = "Unbezahlbares magisches Grimoire...";
const string StExt_Str_Dagger_Txt = "Unbezahlbarer magischer Dolch...";
const string StExt_Str_Artifact_Txt = "Ein einzigartiges Artefakt, das sich mit seinem Besitzer entwickelt";

const string StExt_StonePlateDia_Mana = "Antike Tafel des Alten Priesters";
const string StExt_StonePlateDia_ManaMax = "Antike Tafel des Erzpriesters";
const string StExt_StonePlateDia_Hp = "Antike Tafel des Alten Heilers";
const string StExt_StonePlateDia_HpMax = "Antike Tafel des Obersten Heilers";
const string StExt_StonePlateDia_Str = "Antike Tafel des Alten Kriegers";
const string StExt_StonePlateDia_StrMax = "Antike Tafel eines Mächtigen Kriegers";
const string StExt_StonePlateDia_Agi = "Antike Tafel des Alten Jägers";
const string StExt_StonePlateDia_AgiMax = "Antike Tafel des Mächtigen Jägers";	
const string StExt_StonePlateDia_1h = "Antike Tafel des Alten Schwertkämpfers";
const string StExt_StonePlateDia_1hMax = "Antike Tafel des Mächtigen Schwertkämpfers";
const string StExt_StonePlateDia_2h = "Antike Tafel des Alten Speerkämpfers";
const string StExt_StonePlateDia_2hMax = "Antike Tafel des Mächtigen Speerkämpfers";
const string StExt_StonePlateDia_Bow = "Antike Tafel des Alten Bogenschützen";
const string StExt_StonePlateDia_BowMax = "Antike Tafel des Mächtigen Bogenschützen";
const string StExt_StonePlateDia_CrsBow = "Antike Tafel des Alten Armbrustschützen";
const string StExt_StonePlateDia_CrsBowMax = "Antike Tafel des Mächtigen Armbrustschützen";

const string Stext_Itam_Luckycharm_Name = "Glücks-Amulett";
const string Stext_Itam_Luckycharm_Txt = "Glück-Bonus:";
const string Stext_Str_Buyrobe = "Kaufe eine Anfänger-Magierrobe (1500 Gold)";
const string Itar_Stext_Mage_Novise_Name = "Roben des Magier-Lehrlings";
const string Itar_Stext_Mage_Novise_Txt1 = "Hiebschutz: 15";
const string Itar_Stext_Mage_Novise_Txt2 = "Schutz vor Schlag: 10";
const string Itar_Stext_Mage_Novise_Txt3 = "Schutz vor Stich: 5";
const string Itar_Stext_Mage_Novise_Txt4 = "Schutz vor Magie: 15 | vor Feuer: 10";

const string Itrw_Stext_Str_Starting_Crossbow = "Abgenutze Armbrust";
const string Itrw_Stext_Str_Starting_Bow = "Einfacher rostiger Bogen";
const string Itmw_Stext_Str_Starting_1h_Sword = "Einfacher rostiger Schwert";
const string Itmw_Stext_Str_Starting_2h_Sword = "Einfacher rostiger Zweihandschwert";
const string Itmw_StExt_Str_StartingStaff_Name = "Einfacher magischer Stab";

const string StExt_PlantCloverName = "Klee";
const string StExt_PlantCloverDesc1 = "Extrem seltene Pflanze!";
const string StExt_PlantCloverDesc2 = "Gibt einen dauerhaften Bonus auf Glück.";

const string StExt_Enchanted_Name_Value = "Verzaubert | Preis:";

const string StExt_Str_SummonZombieProtector_Name = "Zombie Beschützer";
const string StExt_Str_SummonDemonProtector_Name = "Dämonen Beschützer";
const string StExt_Str_SummonGolemProtector_Name = "Golem Beschützer";
const string StExt_Str_SummonDarkGolem_Name = "Schatten Golem";
const string StExt_Str_SummonWolfProtector_Name = "Wolf Beschützer";
const string StExt_Str_SummonBoneHound_Name = "Knochenhund";
const string StExt_Str_SummonBoneMage_Name = "Skelett-Magier";
const string StExt_Str_SummonShadow_Name = "Schatten";
const string StExt_Str_SummonAirGolem_Name = "Luft-Golem";
const string StExt_Str_SummonElectricGolem_Name = "Runen-Äther-Golem";
const string StExt_Str_SummonHollyWisp_Name = "Heiliges Irrlicht";

/* *** Spell strings *** */
const string StExt_Str_ShamansCantSummon = "Schamanen können keine Beschwörungsmagie verwenden!";
const string StExt_Str_MaxSummonCount = "Die maximale Anzahl beschworener Kreaturen wurde erreicht...";
const string StExt_Str_Info = "Information";
const string StExt_Str_Info_MaxSummonCount = "Maximale Anzahl beschworener Kreaturen...";

const string stext_name_spl_summondemon_khub = "Hubaxis beschwören";
const string name_spl_summon_deathhound = "Knochenhund beschwören";
const string name_spl_summon_darkgolem = "Schatten-Golem beschwören";
const string name_spl_stext_magicbolt = "Magischer Pfeil";
const string name_spl_stext_magicbolt_txt1 = "Der einfachste Grundzauber, der jedem zur Verfügung steht";
const string name_spl_stext_sumhollywisp = "Heiliges Irrlicht beschwören";
const string name_spl_summon_skeleton_mage = "Skelett-Magier beschwören";
const string name_spl_summon_airgolem = "Luft-Golem beschwören";

const string StExt_Str_ScrollmakingRune = "Rune erstellen";
const string StExt_Str_TalisanRunen_DkPet = "Rune zur Beschwörung eines Dieners erstellen";
const string StExt_Str_TalisanRunen_Crait = "Krait-Beschwörungsrune erstellen";
const string StExt_Str_TalisanRunen_DrSnapper = "Tesvalla-Beschwörungsrune erstellen";
const string StExt_Str_TalisanRunen_sumskelmage = "Rune zur Beschwörung eines Skelett-Magiers erstellen";
const string StExt_Str_TalisanRunen_hollywisp = "Rune zur Beschwörung des Heiligen Feuers erstellen";
const string StExt_Str_TalisanRunen_airgolem = "Rune zur Beschwörung des Luft-Golems erstellen";
const string StExt_Str_TalisanRunen_rapidicebolt = "Eisblitz-Rune erstellen";
const string StExt_Str_TalisanRunen_rapidfirebolt = "Schnellfeuerblitz-Rune erstellen";
const string StExt_Str_TalisanRunen_elevate = "Erhebungs-Rune erstellen";

const string StExt_EsText = "Energieschild";
const string StExt_RankName_Uncommon = "Ungewöhnlich";
const string StExt_RankName_Magic = "Magisch";
const string StExt_RankName_Rare = "Selten";
const string StExt_RankName_Uniq = "Einzigartig";
const string StExt_RankName_Legend = "Legendär";

/* *** Ui strings *** */
const string StExt_Ui_MoveNotification = "Verwende die Pfeiltasten auf deiner Tastatur, um das aktuelle Steuerelement zu bewegen.";
const string StExt_Ui_ValueEditNotification = "Verwende die Pfeiltasten auf deiner Tastatur, um den aktuellen Wert zu ändern.";

const string StExt_Str_DisplayModInitialized = "Mod 'EthernalBreeze' gestartet!";
const string StExt_Str_NewVersionNotify = "Neue Version der Mod 'EthernalBreeze' erkannt";
const string StExt_Str_DisplayModDailyGrowDiffNotify = "Die Zeit läuft... Mit jedem Tag wird das Böse stärker!";
const string StExt_Str_Print_Luckinfo = "Das Glück ist dir hold...";
const string StExt_Str_Print_Luckinfobonus = "+0,1% auf Glück!";
const string StExt_Str_Print_Luckinfobonus5 = "+0,5% auf Glück!";

const string StExt_Str_CorruptionNotify = "Verderbt! Der dunkle Gott lacht dich aus...";
const string StExt_Str_CantBecomeCorruptedNotify = "Der Fluch hatte keine Wirkung!";
const string StExt_Str_CantBecomeCorruptedNotify2 = "Die Schriftrolle ist zu Staub zerfallen!";
const string StExt_Str_NeedFeather = "Feder benötigt!";
const string StExt_Str_NotTimeNotify = "Es ist noch nicht an der Zeit...";

/* *** Dialog strings *** */
const string StExt_Str_ModMenu_Configs = "[Mod-Einstellungen...]";
const string StExt_Str_ModMenu_Education = "[Ausbildung...]";
const string StExt_Str_ModMenu_DebugEnabled = "Ausgabe von Debug-Informationen aktivieren";
const string StExt_Str_ModMenu_PresetsSection = "Wähle ein Einstellungs-Preset (aktuelle Einstellungen werden geändert!)";
const string StExt_Str_ModMenu_AuraUi = "Einstellungen zur Anzeige von Auren auf dem Bildschirm";
const string StExt_Str_ModMenu_AlchUi = "Einstellungen zur Anzeige von temporären Effekten auf dem Bildschirm";
const string StExt_Str_ModMenu_ArtifactUi = "Einstellungen zur Anzeige von Artefaktstatistiken auf dem Bildschirm";
const string StExt_Str_ModMenu_EsUi = "Einstellungen zur Anzeige des Energieschilds auf dem Bildschirm";
const string StExt_Str_ModMenu_MsgTray = "Einstellungen zur Anzeige von Nachrichten (Mod) auf dem Bildschirm";
const string StExt_Str_ModMenu_Aura_DisplayOnScreen = "Auren auf dem Bildschirm anzeigen";
const string StExt_Str_ModMenu_Alch_DisplayOnScreen = "Temporäre Effekte auf dem Bildschirm anzeigen";
const string StExt_Str_ModMenu_Artifact_DisplayOnScreen = "Artefaktstatistiken auf dem Bildschirm anzeigen";
const string StExt_Str_ModMenu_EsBar_DefaultPos = "Energieschild standardmäßig anzeigen";
const string StExt_Str_ModMenu_Configs_Reset = "Aktuelle Einstellungen zurücksetzen";
const string StExt_Str_ModMenu_Learning_GenericPerks = "Allgemeine Fähigkeiten";
const string StExt_Str_CorruptionMenu = "Schriftrolle der Verderbnis verwenden...";

const string StExt_Str_ModMenu_CurrentDiffPreset = "Aktuelle Schwierigkeitsstufe: ";
const string StExt_Str_ModMenu_CurrentItemsPreset = "Aktuelle Voreinstellung des Gegenstandegenerators: ";

/* *** Npc dialog strings *** */
const string Stext_Str_Dia_Xardas_SelectDiff = "Wähle den Mod-Schwierigkeitsgrad...";
const string Stext_Str_Dia_Xardas_SelectPreHistory = "Wähle die Vorgeschichte...";

const string StExt_Str_StonedTrader_Name = "SHIVA - Zauberer-Trödler";
const string StExt_Str_StonedTrader_Trade = "Handeln...";
const string StExt_Str_Andriel_Name = "Andriel";
const string StExt_Str_Andriel_Dagger_Name = "Andriels Dolch";
const string StExt_Str_Duriel_Name = "Duriel";
const string StExt_Str_Mephisto_Name = "Mephisto";
const string StExt_Str_Diablo_Name = "Diablo";
const string StExt_Str_Baal_Name = "Baal";

const string StExt_Str_Small_Icegolem = "Kleiner Eisgolem";
const string StExt_Str_Weak_Icegolem = "Schwacher Eisgolem";
const string StExt_Str_Small_Swampgolem = "Kleiner Sumpfgolem";
const string StExt_Str_Small_Firegolem = "Kleiner Feuergolem";
const string StExt_Str_Weak_Firegolem = "Schwacher Feuergolem";
const string StExt_Str_Small_Stonegolem = "Kleiner Steingolem";
const string StExt_Str_Weak_Stonegolem = "Swacher Steingolem";

const string StExt_Str_Bosslletter_Desc = "Kann nur an verlassenen Orten verwendet werden...";
const string StExt_Str_Andrielletter_Name = "Andriel-Beschwörungsrolle";
const string StExt_Str_Andrielletter_Desc = "Beschwört Andriel, den ersten Dämon Shivas...";
const string StExt_Str_Durielletter_Name = "Duriel-Beschwörungsrolle";
const string StExt_Str_Durielletter_Desc = "Beschwört Duriel, den zweiten Dämon Shivas...";
const string StExt_Str_Mephistoletter_Name = "Mephisto-Beschwörungsrolle";
const string StExt_Str_Mephistoetter_Desc = "Beschwört Mephisto, den dritten Dämon Shivas...";
const string StExt_Str_Diabloletter_Name = "Diablo-Beschwörungsrolle";
const string StExt_Str_Diabloletter_Desc = "Beschwört Diablo, den vierten Dämon Shivas...";
const string StExt_Str_Baalletter_Name = "Baal-Beschwörungsrolle";
const string StExt_Str_Baalletter_Desc = "Beschwört Baal, den fünften Dämon Shivas...";

const string StExt_Str_Shivaletter_Name = "Notiz des Trödlers";
const string StExt_Str_Shivaletter_Desc = "Diese Notiz wurde mir von Shiva, dem Zauberer-Trödler, gegeben...";
const string StExt_Str_Shivaletter_Info = " Grüße, Wanderer. \n Mein Name ist Shiva und ich bin ein Meister der Artefakterschaffung, aber darum geht es jetzt nicht. Tatsache ist, dass ich vor Kurzem, bei Experimenten mit Geistern aus anderen Welten, versagt habe und meine Stimme verlor. Fünf schreckliche Wesen aus anderen Welten verfluchten mich mit Stummheit, und nur indem ich sie endgültig vernichte, werde ich meine Stimme zurückerlangen. \n Diese Wesen sind unglaublich gefährliche Gegner, und ich kann sie nicht alleine besiegen, also bitte ich dich, Wanderer, mir bei meinem Problem zu helfen. Als Gegenleistung für deine Hilfe erhältst du einzigartige Artefakte von mir, wie sie in ganz Myrtana nicht zu finden sind. \n Sprich mich an, wenn du bereit bist, dich dem Bösen zu stellen - ich werde dir die erste Beschwörungsrolle geben...";
const string StExt_Topic_Shivaletter = "Stummes Heldenstück";
const string StExt_Str_Shivaletter_Logentry_0 = "Ein Zauberer-Trödler und nebenbei Meisterhandwerker bat mich in seinem Brief, fünf Dämonen aus anderen Welten zu besiegen. Ich muss von ihm eine Schriftrolle bekommen, um den ersten Dämon zu beschwören.";
const string StExt_Str_Shivaletter_Logentry_1 = "Ich habe eine seltsame Schriftrolle von Shiva erhalten. Vermutlich sollte ich in eine verlassene Gegend gehen und den ersten Dämon beschwören, sobald ich bereit bin...";
const string StExt_Str_Shivaletter_Logentry_2 = "Ich habe Andriel besiegt. Ich sollte mit Shiva über meine Belohnung sprechen.";
const string StExt_Str_Shivaletter_Logentry_3 = "Shiva hat mir die nächste Beschwörungsrolle gegeben. Das Pentagramm trägt den Namen 'Duriel'. Vermutlich ist das mein nächstes Ziel...";
const string StExt_Str_Shivaletter_Logentry_4 = "Duriel ist besiegt. Shiva wird sich sicher freuen.";
const string StExt_Str_Shivaletter_Logentry_5 = "Wie erwartet gab mir Shiva eine Schriftrolle, um einen weiteren Dämon zu beschwören - diesmal Mephisto. Das erinnert mich alles an etwas...";
const string StExt_Str_Shivaletter_Logentry_6 = "Ich habe Mephisto besiegt. Diese Nachricht wird Shiva freuen.";
const string StExt_Str_Shivaletter_Logentry_7 = "Mein nächstes Ziel ist Diablo.";
const string StExt_Str_Shivaletter_Logentry_8 = "Diablo fiel durch meine Hand. Sollte ich den Zauberer erfreuen?";
const string StExt_Str_Shivaletter_Logentry_9 = "Der letzte verbliebene Dämon ist Baal. Wir sollten keine Zeit verschwenden und ihn so bald wie möglich vernichten.";
const string StExt_Str_Shivaletter_Logentry_10 = "Endlich! Baal ist zerstört. Ich frage mich, was der Zauberer mir als Belohnung geben wird?";
const string StExt_Str_Shivaletter_Logentry_11 = "Ausgezeichnet. Ich habe Shiva vom Fluch befreit und ihm geholfen, seine Stimme zurückzugewinnen.";

const string StExt_Str_StonedTrader_Hi = "Wie geht's, Kumpel?";
const string StExt_Str_StonedTrader_AndrielReady = "Wie kann ich dir helfen?";
const string StExt_Str_StonedTrader_AndrielDone = "Ich habe mich um Andriel gekümmert!";
const string StExt_Str_StonedTrader_DurielDone = "Duriel ist erledigt!";
const string StExt_Str_StonedTrader_MephistoDone = "Mephisto ist besiegt!";
const string StExt_Str_StonedTrader_DiabloDone = "Ich habe Diablo zerstört!";
const string StExt_Str_StonedTrader_BaalDone = "Baal...";

const string StExt_Str_TalisanRunen_sumdeathhound = "Erstelle eine Rune zur Beschwörung des Knochenhundes";
const string StExt_Str_TalisanRunen_sumdarkgol = "Erstelle eine Rune zur Beschwörung des Schatten-Golems";

const string StExt_Str_XardasRunen_Demon = "Dämonologen-Rune";
const string StExt_Str_XardasRunen_Death6 = "6. Magiekreis (Tod)";
const string StExt_Str_XardasRunen_Death5 = "5. Magiekreis (Tod)";
const string StExt_Str_XardasRunen_Death4 = "4. Magiekreis (Tod)";
const string StExt_Str_XardasRunen_Death3 = "3. Magiekreis (Tod)";
const string StExt_Str_XardasRunen_Death2 = "2. Magiekreis (Tod)";
const string StExt_Str_XardasRunen_Death1 = "1. Magiekreis (Tod)";
const string StExt_Str_XardasRunen_Necro6 = "6. Magiekreis (Nekromantie)";
const string StExt_Str_XardasRunen_Necro5 = "5. Magiekreis (Nekromantie)";
const string StExt_Str_XardasRunen_Necro4 = "4. Magiekreis (Nekromantie)";
const string StExt_Str_XardasRunen_Necro3 = "3. Magiekreis (Nekromantie)";
const string StExt_Str_XardasRunen_Necro2 = "2. Magiekreis (Nekromantie)";
const string StExt_Str_XardasRunen_Necro1 = "1. Magiekreis (Nekromantie)";
const string StExt_Str_XardasRunen_Dark6 = "6. Magiekreis (Dunkelheit)";
const string StExt_Str_XardasRunen_Dark5 = "5. Magiekreis (Dunkelheit)";
const string StExt_Str_XardasRunen_Dark4 = "4. Magiekreis (Dunkelheit)";
const string StExt_Str_XardasRunen_Dark3 = "3. Magiekreis (Dunkelheit)";
const string StExt_Str_XardasRunen_Dark2 = "2. Magiekreis (Dunkelheit)";
const string StExt_Str_XardasRunen_Dark1 = "1. Magiekreis (Dunkelheit)";

const string StExt_Str_Scrollmaking_RequirePaper = "Folgende Ressourcen werden benötigt: ";
const string StExt_Str_ScrollmakingDone = "Schriftrolle erstellt!";
const string StExt_Str_ScrollmakingFire = "Feuermagie-Schriftrollen erstellen";
const string StExt_Str_Scrollmakingice = "Eismagie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingAir = "Luftmagie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingElectric = "Blitzmagie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingEarth = "Erdmagie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingLight = "Heilige Magie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingDeath = "Todesmagie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingLife = "Naturmagie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingDark = "Dunkelmagie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingGolems = "Golemherstellung-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingDemonology = "Dämonologie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingNecro = "Nekromantie-Schriftrollen erstellen";
const string StExt_Str_ScrollmakingBlinkTxt = "Blink";

const string StExt_Str_Grimoir_NewLevel = "Das Grimoire kann verbessert werden";
const string StExt_Str_Dagger_NewLevel = "Der Dolch kann verbessert werden";

const string StExt_Craftsman_Str_LearnCraft = "Kannst du mir dein Handwerk beibringen?";
const string StExt_Craftsman_Str_RequiredGoldStart = "Um das Handwerk zu erlernen, benötigst du ";
const string StExt_Craftsman_Str_RequiredGoldEnd = " Goldmünzen!";

const string StExt_Craftsman_Str_BosperCraftLearned = "Bosper erklärt sich bereit, dir sein Handwerk beizubringen!";
const string StExt_Craftsman_Str_HaradCraftLearned = "Harad erklärt sich bereit, dir sein Handwerk beizubringen!";
const string StExt_Craftsman_Str_ConstantionoCraftLearned = "Constantino erklärt sich bereit, dir sein Handwerk beizubringen!";

const string StExt_Craftsman_CanStudy_Constantino_SellElixirs = "Ich habe magische Elixiere gebracht";
const string StExt_Craftsman_CanStudy_Constantino_SellPlants = "Ich habe seltene Kräuter gebracht";


// ******************************************************************************
// 					New strings
// ******************************************************************************

const string StExt_Ui_ValueEditNotification_Step = "Wertänderungsschritt: x";
const string StExt_Str_ValueEdit_Yes = "Zurück... (Neuen Wert übernehmen)";
const string StExt_Str_ValueEdit_No = "Alten Wert wiederherstellen";
const string StExt_Str_ValueEdit_Max = "Wert setzen: [Maximum]";
const string StExt_Str_ValueEdit_Min = "Wert setzen: [Minimum]";
const string StExt_Str_ValueEdit_Zero = "Wert setzen: [Null]";

const string StExt_Str_NpcFlag_LootProcessed = "Ausgeraubt";
const string StExt_Str_NpcFlag_IsDead = "Tot";
const string StExt_Str_NpcFlag_Duplicated = "Duplikat";
const string StExt_Str_NpcFlag_Summoned = "Beschworen";
const string StExt_Str_NpcFlag_Corrupted = "Verderbt";
const string StExt_Str_NpcFlag_Lucky = "Glücklich";
const string StExt_Str_NpcFlag_Rich = "Reich";
const string StExt_Str_NpcFlag_Original = "Original";

const string StExt_Str_Config_ShowNpcExtraInfo = "NPC-Eigenschaften anzeigen";

const string StExt_Str_NpcStats_Str = "Str: ";
const string StExt_Str_NpcStats_Agi = "Ges: ";
const string StExt_Str_NpcStats_Prot = "Schutz: ";
const string StExt_Str_NpcStats_Resist = "Resistenzen: ";
const string StExt_Str_NpcStats_Dodge = "Ausweichen: ";

const string StExt_Str_NpcStats_ProtEdge = "K*";
const string StExt_Str_NpcStats_ProtBlunt = "H*";
const string StExt_Str_NpcStats_ProtFire = "F*";
const string StExt_Str_NpcStats_ProtFly = "W*";
const string StExt_Str_NpcStats_ProtMagic = "M*";
const string StExt_Str_NpcStats_ProtPoint = "S*";
const string StExt_Str_NpcStats_ProtPois = "Gift*";
const string StExt_Str_NpcStats_ProtAoe = "AoE*";

const string StExt_Str_Level = "Level: ";
const string StExt_Str_Exp = "Erfahrung: ";
const string StExt_Str_Lp = "LP: ";
const string StExt_Str_Auras = "Auren: ";
const string StExt_Str_ActiveAuras = "Aktive Auren: ";
const string StExt_Str_Masteries = "Schulen: ";
const string StExt_Str_NeedGold = "Benötigtes Gold: ";
const string StExt_Str_NeedLp = "Benötigte Lernpunkte: ";
const string StExt_Str_NeedSkillPoints = "Erforderliche Entwicklungspunkte: ";
const string StExt_Str_Required = "Benötigt: ";
const string StExt_Str_Pcs = " Stk.";
const string StExt_Str_Done = "Erledigt";

const string StExt_Str_Required_Hp = " Leben";
const string StExt_Str_Required_Mp = " Mana";
const string StExt_Str_Required_Intellect = " Intelligenz";
const string StExt_Str_Required_Str = " Stärke";
const string StExt_Str_Required_Agi = " Geschicklichkeit";
const string StExt_Str_Required_Stam = " Ausdauer";
const string StExt_Str_Required_Gold = " Gold";
const string StExt_Str_Required_Lp = " LP";

const string StExt_Str_NpcFlag_ScrollUser = "Verwendet Schriftrollen";
const string StExt_Str_NpcFlag_Summoner = "Beschwörer";
const string StExt_Str_NpcFlag_Priest = "Gesegnet";
const string StExt_Str_NpcFlag_Curser = "Verfluchend";

// New strings
const string StExt_Str_PrehistoryDesc[StExt_PreHistoryMode_Max] =
{
	"(Nichts)",
	"(+500 Erfahrung)",
	"(+2 Stärke, +1 Geschicklichkeit, +10 Leben)",
	"(+1 Stärke, +2 Geschicklichkeit, +10 Leben)",
	"(+2 Stärke, +3 Mana, +10 Leben)",
	"(+1 Intelligenz, +1% Magische Macht)",
	"(+2 Intelligenz, +7 Mana)",
	"(+15 Mana)",
	"(+1% Magische Macht, +5 Mana)",
	"(+15 Leben, +250 Goldmünzen)",
	"(+10 Ausdauer, +10 Leben)"
};

// Items constants
const string StExt_Str_ItemRank[StExt_ItemRankMax] =
{
	"Normal",
	"Ungewöhnlich",
	"Selten",
	"Einzigartig",
	"Episch",
	"Legendär"
};


const string StExt_Str_Item_Type[9] = 
{
    "???",
	"Rüstung",
	"Waffe",
	"Schmuck",
	"Verbrauchsgegenstand",
	"Munition",
	"Inventar",
	"Handwerk",
	"Sonstiges"
};

const string StExt_Str_Item_Class[27] = 
{
    "???",
	"Rüstung",
	"Helm",
	"Torso",
	"Hose",
	"Handschuhe",
	"Stiefel",
	"Schulterplatten",
	"Schild",
	"Nahkampfwaffe",
	"Fernkampfwaffe",
	"Magie",
	"Amulett",
	"Ring",
	"Ohrringe",
	"Armschienen",
	"Gürtel",
	"Kragen",
	"Trophäe",
	"Trank",
	"Schriftrolle",
	"Nahrung",
	"Talisman",
	"Edelstein",
	"Rune",
	"Seele",
	"Sonstiges"
};

const string StExt_Str_Item_SubClass[39] = 
{
    "???",
	"Kleidung",
	"Leichte Rüstung",
	"Mittlere Rüstung",
	"Schwere Rüstung",
	"Kapuze",
	"Diadem",
	"Leichter Helm",
	"Mittlerer Helm",
	"Schwerer Helm",
	"Leichter Schild",
	"Schwerer Schild",
	"Einhandschwert",
	"Einhandaxt",
	"Einhandsstreitkolben",
	"Dolch",
	"Rapier",
	"Leichtes Schwert",
	"Zauberklinge",
	"Zweihandschwert",
	"Zweihandaxt",
	"Zweihandstreitkolben",
	"Stab",
	"Speer",
	"Hellebarde",
	"Zwillingswaffe (Links)",
	"Zwillingswaffe (Rechts)",
	"Schlagring",
	"Wurfdolch",
	"Wurfaxt",
	"Wurfstreitkolben",
	"Wurfspeer",
	"Leichter Bogen",
	"Schwerer Bogen",
	"Leichte Armbrust",
	"Schwere Armbrust",
	"Schriftrolle",
	"Rune",
	"Zauberstab"
};

//*****************************DELETE****************************************
const string StExt_Str_ItemType[28] =
{
    /*ItemType_Helm*/            "Helm",
	/*ItemType_Armor*/           "Rüstung",
	/*ItemType_Pants*/           "Hose",
	/*ItemType_Boots*/           "Stiefel",
	/*ItemType_Gloves*/          "Handschuhe",
	/*ItemType_Belt*/            "Gürtel",
	/*ItemType_Amulet*/          "Amulett",
	/*ItemType_Ring*/            "Ring",
	/*ItemType_Shield*/          "Schild",
	/*ItemType_Sword1h*/         "Einhandschwert",
	/*ItemType_Sword2h*/         "Zweihandschwert",
	/*ItemType_Axe1h*/           "Einhandaxt",
	/*ItemType_Axe2h*/           "Zweihandaxt",
	/*ItemType_Mace1h*/          "Einhandsstreitkolben",
	/*ItemType_Mace2h*/          "Zweihandstreitkolben",
	/*ItemType_MagicSword*/      "Magische Waffe",
	/*ItemType_Staff*/           "Stab",
	/*ItemType_Rapier*/          "Rapier",
	/*ItemType_DexSword*/        "Leichtes Schwert",
	/*ItemType_Halleberd*/       "Hellebarde",
	/*ItemType_Spear*/           "Speer",
	/*ItemType_DualL*/           "Zwillingswaffe, Links",
	/*ItemType_DualR*/           "Zwillingswaffe, Rechts",
	/*ItemType_Bow*/             "Bogen",
	/*ItemType_CrossBow*/        "Armbrust",
	/*ItemType_MagicStaff*/      "Verzauberter Stab",
	/*ItemType_Potion*/          "Trank",
	/*ItemType_Scroll*/          "Schriftrolle"
};

const string StExt_Str_ItemFlag[16] =
{
    /*ItemFlag_Undefined*/        "Unbestimmt",
	/*ItemFlag_Socketed*/         "Mit Sockeln",
	/*ItemFlag_Corrupted*/        "Verderbt",
	/*ItemFlag_Crafted*/          "Geschmiedet",
	/*ItemFlag_Armor*/            "Rüstung",
	/*ItemFlag_Weapon*/           "Waffe",
	/*ItemFlag_Jewelry*/          "Schmuck",
	/*ItemFlag_Talisman*/         "Talisman",
	/*ItemFlag_Consumable*/       "Verbrauchbar",
	/*ItemFlag_Melee*/            "Nahkampf",
	/*ItemFlag_Range*/            "Fernkampf",
	/*ItemFlag_Staff*/            "Stab",
	/*ItemFlag_LeftHand*/         "Linke Hand",
	/*ItemFlag_RightHand*/        "Rechte Hand",
	/*ItemFlag_BothHands*/        "Beide Hände",
	/*ItemFlag_MagicWeapon*/      "Magisch"
};

const string StExt_Str_ItemFlag_Socketed   = "Mit Sockeln";
const string StExt_Str_ItemFlag_Corrupted  = "Verderbt";
const string StExt_Str_ItemFlag_Crafted    = "Geschmiedet";
const string StExt_Str_ItemFlag_Undefined  = "Nicht identifiziert";
//*****************************DELETE****************************************


const string StExt_Str_Item_Cond               = "Voraussetzungen: ";
const string StExt_Str_Item_Cond_Str           = "Stärke";
const string StExt_Str_Item_Cond_Agi           = "Geschicklichkeit";
const string StExt_Str_Item_Cond_Hp            = "Lebenspunkte";
const string StExt_Str_Item_Cond_Mp            = "Mana";
const string StExt_Str_Item_Cond_St             = "Ausdauer";
const string StExt_Str_Item_Cond_Shield        = "Schildkampf";
const string StExt_Str_Item_Cond_Bow           = "Bogenkampf";
const string StExt_Str_Item_Cond_CBow          = "Armbrustkampf";
const string StExt_Str_Item_Cond_OneHanded     = "Einhändig";
const string StExt_Str_Item_Cond_TwoHanded     = "Zweihändig";
const string StExt_Str_Item_Cond_Int           = "Intelligenz";
const string StExt_Str_Item_Cond_Level         = "Stufe";
const string StExt_Str_Item_Cond_BeliarKarma   = "Karma (Beliar)";
const string StExt_Str_Item_Cond_InnosKarma    = "Karma (Innos)";
const string StExt_Str_Item_Cond_AdanosKarma   = "Karma (Adanos)";

const string StExt_Str_Item_Damage              = "Schaden: ";
const string StExt_Str_Item_DamageType[dam_index_max] =
{
	"Wahr",
	"Zerschmetternd",
	"Schneidend",
	"Feuer",
	"Rückstoß",
	"Magie",
	"Stich",
	"Gift"
};
const string StExt_Str_Item_Protection = "Schutz: ";
const string StExt_Str_Item_Range = "Waffenlänge: ";
const string StExt_Str_OrcWeapon = "Orkwaffe";
const string StExt_Str_OneHandWeapon = "Einhändig";
const string StExt_Str_TwoHandWeapon = "Zweihändig";

const string StExt_Str_ItemLevel = "Gegenstandsstufe: ";
const string StExt_Str_ItemQuality = "Qualität: ";
const string StExt_Str_ItemSockets = "Sockel: ";
const string StExt_Str_Undefined = "Nicht identifiziert!";

const string itar_StExt_Str_helmet_crone_name = "Eiskrone";
const string itam_stext_silvernecklace_name = "Silberamulett";
const string itam_stext_goldnecklace_name = "Goldenes Amulett";
const string itam_stext_darknecklace_name = "Amulett der Schatten";
const string itri_stext_silverring_name = "Silberring";
const string itri_stext_goldring_name = "Goldring";

const string StExt_Str_ModMenu_ItemsInfoUi = "Einstellungen zur Anzeige zusätzlicher Informationen über Gegenstände";

const string StExt_Str_Config_Luck_ChanceForEnchantedDrop = "Chance, dass der gefundene Gegenstand verzaubert ist";
const string StExt_Str_Config_Luck_RelativeDropChance_Food = "Relative Chance auf Nahrungsfund";
const string StExt_Str_Config_Luck_RelativeDropChance_Alchemy = "Relative Chance auf Alchemiefund";
const string StExt_Str_Config_Luck_RelativeDropChance_Magic = "Relative Chance auf Magiefund";
const string StExt_Str_Config_Luck_RelativeDropChance_Misk = "Relative Chance auf sonstige Funde";
const string StExt_Str_Config_Luck_RelativeDropChance_Munition = "Relative Chance auf Pfeilfund";
const string StExt_Str_Config_Luck_RelativeDropChance_Armors = "Relative Chance auf Rüstungsfund";
const string StExt_Str_Config_Luck_RelativeDropChance_Jewelry = "Relative Chance auf Schmuckfund";
const string StExt_Str_Config_Luck_RelativeDropChance_MagicWeapons = "Relative Chance auf Fund einer magischen Waffe";
const string StExt_Str_Config_Luck_RelativeDropChance_MeeleWeapons = "Relative Chance auf Fund einer Nahkampfwaffe";
const string StExt_Str_Config_Luck_RelativeDropChance_RangeWeapons = "Relative Chance auf Fund einer Fernkampfwaffe";

const string StExt_Str_Config_FoodBonusResetDay = "Tage bis Bonus durch Nahrung zurückgesetzt wird";

const string itse_stext_poitionfish_name = "Verdammter Barsch-Trankmacher";
const string itse_stext_magicfish_name = "Geflickter Okkultisten-Wels";
const string itse_stext_miscfish_name = "Zugenähter Karauschenkarpfen-Zlotar";
const string itse_stext_rndfish_desc = "In diesem Fisch ist etwas eingenäht...";

const string stext_str_halvor_openfish = "(Alle Spezialfische öffnen)";
const string stext_str_halvor_openfish_nofish = "Hier sind keine Fische!";

const string itmi_stext_lootchest_name = "Stahl-Schmuckkiste";
const string itmi_stext_lootchest_dsec = "An einer der Wände ist der Name 'Shiva' eingraviert...";

const string itmi_stext_lootchest_Helm_dsec = "Sieht aus, als enthielte dies einen Helm";
const string itmi_stext_lootchest_Armor_dsec = "Sieht aus, als enthielte dies eine Rüstung";
const string itmi_stext_lootchest_Pants_dsec = "Sieht aus, als enthielte dies eine Hose";
const string itmi_stext_lootchest_Boots_dsec = "Sieht aus, als enthielte dies Stiefel";
const string itmi_stext_lootchest_Gloves_dsec = "Sieht aus, als enthielte dies Handschuhe";
const string itmi_stext_lootchest_Belt_dsec = "Sieht aus, als enthielte dies einen Gürtel";
const string itmi_stext_lootchest_Amulet_dsec = "Sieht aus, als enthielte dies ein Amulett";
const string itmi_stext_lootchest_Ring_dsec = "Sieht aus, als wäre hier ein Ring";
const string itmi_stext_lootchest_Shield_dsec = "Sieht aus, als wäre hier ein Schild";
const string itmi_stext_lootchest_Sword1h_dsec = "Sieht aus, als enthielte dies ein Einhandschwert";
const string itmi_stext_lootchest_Sword2h_dsec = "Sieht aus, als enthielte dies ein Zweihandschwert";
const string itmi_stext_lootchest_Axe1h_dsec = "Sieht aus, als enthielte dies eine Einhandaxt";
const string itmi_stext_lootchest_Axe2h_dsec = "Sieht aus, als enthielte dies eine Zweihandaxt";
const string itmi_stext_lootchest_Mace1h_dsec = "Sieht aus, als enthielte dies einen Einhandstreitkolben";
const string itmi_stext_lootchest_Mace2h_dsec = "Sieht aus, als enthielte dies einen Zweihandstreitkolben";
const string itmi_stext_lootchest_MagicSword_dsec = "Sieht aus, als enthielte dies ein magisches Schwert";
const string itmi_stext_lootchest_Staff_dsec = "Sieht aus, als enthielte dies einen Stab";
const string itmi_stext_lootchest_Rapier_dsec = "Sieht aus, als enthielte dies ein Schwert";
const string itmi_stext_lootchest_DexSword_dsec = "Sieht aus, als enthielte dies ein leichtes Schwert";
const string itmi_stext_lootchest_Halleberd_dsec = "Sieht aus, als enthielte dies eine Hellebarde";
const string itmi_stext_lootchest_Spear_dsec = "Sieht aus, als enthielte dies einen Speer";
const string itmi_stext_lootchest_Dual_dsec = "Sieht aus, als enthielte dies Doppelwaffen";
const string itmi_stext_lootchest_Bow_dsec = "Sieht aus, als enthielte dies Bögen";
const string itmi_stext_lootchest_CrossBow_dsec = "Sieht aus, als enthielte dies eine Armbrust";
const string itmi_stext_lootchest_MagicStaff_dsec = "Sieht aus, als enthielte dies einen magischen Stab";
const string itmi_stext_lootchest_Torso_dsec = "Sieht aus, als wäre hier ein Beutetruhen-Torso";

const string itpo_stext_potion_01_name = "Tinktur";
const string itpo_stext_potion_02_name = "Essenz";
const string itpo_stext_potion_03_name = "Extrakt";
const string itpo_stext_potion_04_name = "Elixier";
const string itpo_stext_potion_desc = "Ein Trank mit ungewöhnlichen Effekten...";

const string StExt_BonusStats_Desc[5] =
{
	"-= Boni von Gegenständen =-",
	"-= Boni vom Artefakt =-",
	"-= Trank-Boni =-",
	"-= Boni von temporären Effekten =-",
	"-= Boni von Auren =-"
};

const string StExt_Str_Menu_Dagger = "[Dolch untersuchen]";
const string StExt_Str_Menu_Grimoir = "[Grimoire untersuchen]";
const string StExt_Str_AtrifactNotEnoughtLp = "Nicht genug Artefakt-Entwicklungspunkte. Benötigt: ";
const string StExt_Str_Config_ArtifactsUpgradeCostMult = "Artefakt-Aufrüstungskosten";
const string StExt_Str_Config_ArtifactExp = " XP";
const string StExt_Str_Config_Artifact_ShowExpMessage = "Erhaltene Artefakt-Erfahrung auf dem Bildschirm anzeigen";
const string StExt_Str_AtrifactEquip = "Artefakt ausrüsten";
const string StExt_Str_AtrifactUnEquip = "Artefakt ablegen";
const string itmi_stext_orestuck_desc = "Eine wichtige Komponente für fortgeschrittenes Handwerk";

const string itmw_stext_halleberde_bronze_name = "Bronzene Hellebarde";
const string itmw_stext_spear_bronze_name = "Bronzener Speer";
const string itmw_stext_bronze_axe_name = "Bronzenaxt";
const string itmw_stext_bronze_waraxe_name = "Bronzene Kriegsaxt";
const string itmw_stext_bronze_warhammer_name = "Bronzener Kriegshammer";
const string itmw_stext_bronze_mace_name = "Bronzener Streitkolben";
const string itmw_stext_bronze_shortsword_name = "Bronzenes Kurzschwert";
const string itmw_stext_bronze_broadsword_name = "Bronzenes Breitschwert";
const string itmw_stext_bronze_longsword_name = "Bronzenes Langschwert";
const string itmw_stext_axe1_name = "Axt";
const string itmw_stext_axe2_name = "Axt";
const string itmw_stext_1h_bastard_meryl_name = "Schwert";
const string itmw_stext_1h_bastard_sword_name = "Schwert";
const string itmw_stext_1h_cutlass_name = "Dolch";
const string itmw_stext_1h_bastard_sword1_name = "Einhändiges Bastardschwert";
const string itmw_stext_1h_bastard_sword2_name = "Einhändiges Bastardschwert";
const string itmw_stext_1h_sword_heavy_name = "Schweres Einhandschwert";
const string itmw_stext_1h_sword_long_name = "Langes Einhandschwert";
const string itmw_stext_1h_warsickle_name = "Kriegssense";
const string itmw_stext_2h_axe_name = "Zweihändige Axt";
const string itmw_stext_spear_1_name = "Speer";
const string itmw_stext_spear_2_name = "Speer";
const string itmw_stext_2h_scimitar_name = "Zweihändiger Krummsäbel";
const string itmw_stext_spear_3_name = "Speer";
const string itmw_stext_2h_sword_name = "Zweihändiges Schwert";
const string itmw_stext_axe3_name = "Axt";
const string itmw_stext_axe4_name = "Axt";
const string itmw_stext_1h_crawlerschreck_name = "Schrecken der Krabbler";
const string itmw_stext_1H_Sword_Bastard_Smith_01_name = "Schwert";
const string itmw_stext_1H_Sword_Bastard_Smith_02_name = "Schwert";
const string itmw_stext_1h_Sword_Broad_Rep_02_name = "Breitschwert";
const string itmw_stext_1H_Sword_Broad_Smith_01_name = "Breitschwert";
const string itmw_stext_1h_Sword_Broad_Smith_02_name = "Breitschwert";
const string itmw_stext_1H_Sword_Long_Mission_name = "Langschwert";
const string itmw_stext_1H_Sword_Long_Smith_01_name = "Schwert";
const string itmw_stext_1H_Sword_Long_Smith_02_name = "Schwert";
const string itmw_stext_1H_Sword_Rep_01_name = "Schwert";
const string itmw_stext_1H_Sword_Rep_02_name = "Schwert";
const string itmw_stext_1H_Sword_Smith_01_name = "Schwert";
const string itmw_stext_1H_Sword_Smith_02_name = "Schwert";
const string itmw_stext_2H_Sword_Heavy_Smith_01_name = "Schwert";
const string itmw_stext_2H_Sword_Heavy_Smith_02_name = "Schwert";
const string itmw_stext_2H_Sword_Light_Smith_01_name = "Schwert";
const string itmw_stext_2H_Sword_Light_Smith_02_name = "Schwert";
const string itmw_stext_2H_Sword_Smith_02_name = "Schwert";
const string itmw_stext_2H_Sword_Smith_01_name = "Schwert";
const string itmw_stext_rapier_name = "Rapier";
const string itmw_stext_2H_Glaubensbringer_name = "Herold des Glaubens";
const string itar_StExt_greathelm_name = "Großhelm";
const string itar_StExt_ancienthelm_name = "Antiker Helm";
const string itar_stext_hat_beliar_name = "Beliars Kapuze";
const string itar_stext_hat_mage_grey_name = "Magierhut";
const string itar_stext_kapalin_1_name = "Kapalin";
const string itar_stext_kapalin_2_name = "Kapalin";
const string itar_stext_kapalin_3_name = "Kapalin";
const string itar_stext_kapalin_4_name = "Kapalin";
const string itmw_stext_iron_axe_name = "Eisenaxt";
const string itmw_stext_iron_broadsword_name = "Eisernes Breitschwert";
const string itmw_stext_iron_claymore_name = "Eiserner Claymore";
const string itmw_stext_iron_club_name = "Eiserne Keule";
const string itmw_stext_iron_dagger_name = "Eisendolch";
const string itmw_stext_iron_heavyclaymore_name = "Schwerer eiserner Claymore";
const string itmw_stext_iron_longsword_name = "Eisernes Langschwert";
const string itmw_stext_iron_mace_name = "Eiserner Streitkolben";
const string itmw_stext_iron_mastersword_name = "Eisenschwert des Meisters";
const string itmw_stext_iron_shortsword_name = "Eisernes Kurzschwert";
const string itmw_stext_iron_waraxe_name = "Eiserne Kriegsaxt";
const string itmw_stext_iron_warhammer_name = "Eiserner Kriegshammer";
const string itmw_stext_2h_SleeperEye_name = "Zweihändiges Schwert Auge des Schläfers";
const string itmw_stext_2H_Sword_Blaise_name = "Zweihandschwert Blaise";
const string itmw_stext_new_stl_broadsword_name = "Stählernes Breitschwert";
const string itmw_stext_new_stl_claymore_name = "Stählerner Claymore";
const string itmw_stext_new_stl_dagger_name = "Stahldolch";
const string itmw_stext_new_stl_greatsword_name = "Stählernes Großschwert";
const string itmw_stext_new_stl_handaxe_name = "Stählerne Handaxt";
const string itmw_stext_new_stl_mastersword_name = "Stahlschwert des Meisters";
const string itmw_stext_new_stl_waraxe_name = "Stählerne Kriegsaxt";
const string itmw_stext_new_stl_wingsword_name = "Stählernes Flügelschwert";
const string itmw_stext_Novizenhueter_name = "Schwert des Wächters";
const string itar_stext_shield_NTARCZA33_name = "Buckler";
const string itmw_stext_palasz_name = "Breitschwert";
const string itmw_stext_palasz2_name = "Breitschwert";
const string itmw_stext_PALKA2_name = "Knüppel";
const string itmw_stext_Saber_01_name = "Säbel";
const string itmw_stext_Saber_02_name = "Säbel";
const string itmw_stext_Saber_03_name = "Säbel";
const string itmw_stext_Saber_04_01_name = "Säbel";
const string itmw_stext_Saber_04_02_01_name = "Säbel";
const string itmw_stext_Saber_04_02_02_name = "Säbel";
const string itmw_stext_Saber_05_name = "Säbel";
const string itar_stext_collar_name = "Verfluchtes Halsband";
const string itar_stext_collar_desc1 = "Es riecht förmlich nach dunkler Magie...";
const string itar_stext_collar_desc2 = "Vielleicht sollten wir es nicht anrühren?";
const string itmw_stext_steel_axe_name = "Stahlaxt";
const string itmw_stext_steel_broadsword_name = "Stählernes Breitschwert";
const string itmw_stext_steel_claymore_name = "Stählerner Claymore";
const string itmw_stext_steel_club_name = "Stählerne Keule";
const string itmw_stext_holy_hammer_name = "Heiliger Hammer";
const string itmw_stext_steel_dagger_name = "Stahldolch";
const string itmw_stext_steel_heavyclaymore_name = "Schwerer stählerne Claymore";
const string itmw_stext_steel_longsword_name = "Stählernes Langschwert";
const string itmw_stext_steel_mace_name = "Stählerner Streitkolben";
const string itmw_stext_steel_mastersword_name = "Stahlschwert des Meisters";
const string itmw_stext_steel_shortsword_name = "Stählernes Kurzschwert";
const string itmw_stext_steel_waraxe_name = "Stählerne Kriegsaxt";
const string itmw_stext_steel_warhammer_name = "Stählerner Kriegshammer";
const string itar_StExt_hut_name = "Hut";
const string itar_stext_wreath_name = "Kranz";
const string itar_stext_plaguehood_name = "Pestmaske";
const string itar_stext_hood_name = "Kapuze";

const string itar_stext_gloves_name = "Armschienen";
const string itar_stext_boots_name = "Beinschienen";
const string itar_stext_pants_name = "Hose";
const string itar_stext_torso_name = "Brustpanzer";

const string StExt_Str_ExtraItemsDisplayMode = "Anzeigemodus für zusätzliche Rüstungsgegenstände";
const string StExt_Str_ExtraItemsDisplayModes[4] =
{
	"Zusätzliche Rüstungselemente mit Originalrüstung verbergen",
	"Zusätzliche Rüstungselemente nicht anzeigen",
	"Originalrüstung verbergen und nur zusätzliche Rüstungselemente anzeigen",
	"Zusätzliche Rüstungselemente immer anzeigen"
};

const string StExt_Str_Config_ArtifactReset = "(Neuverteilung der Entwicklungspunkte. ";
const string StExt_Str_Config_Npc_SummonsCanHaveOwnSummons = "Beschworene Kreaturen können eigene Beschwörungen haben";
const string StExt_Str_Config_Npc_CantUseSpellAbilities = "NPCs können keine Angriffszauber verwenden";
const string StExt_Str_Config_Npc_CantUseBuffAbilities = "NPCs können keine Segnungen verwenden";
const string StExt_Str_Config_Npc_CantUseSummonAbilities = "NPCs können keine Beschwörungen verwenden";

const string StExt_Str_ExtraDamage = "Zusätzlicher Schaden";
const string StExt_Str_ExtraDamageFlag_Dot = "Periodisch";
const string StExt_Str_ExtraDamageFlag_Reflect = "Reflektiert";

const string StExt_Str_Config_DisableEnchantedItemsEffects = "Visuelle Effekte auf generierten Gegenständen deaktivieren (Spielneustart erforderlich)";

const string StExt_Str_ExtraDamageType_String = "Schadensart";
const string StExt_Str_ExtraDamageType[21] = 
{
	"Nahkampf",
	"Fernkampf",
	"Zauber",
	"Fähigkeit",
	"Feuer",
	"Eis",
	"Blitz",
	"Luft",
	"Erde",
	"Licht",
	"Finsternis",
	"Tod",
	"Leben",
	"Gift",
	"Wahr",
	"Blut",
	"Untot",
	"Golem",
	"Dämon",
	"Faust",
	"Falle"
};

const string StExt_Str_ExtraDamageFlags_String = "Effekttyp";
const string StExt_Str_ExtraDamageFlags[28] =
{
    "Aura", 						// StExt_DamageFlag_Aura
	"DoT", 							// StExt_DamageFlag_Dot
	"Flächenschaden", 				// StExt_DamageFlag_Aoe
	"Heilung", 						// StExt_DamageFlag_Heal
	"Beschwörung", 					// StExt_DamageFlag_Summon
	"Unterstützung", 				// StExt_DamageFlag_Support
	"Öffnen", 						// StExt_DamageFlag_Unlock
	"Teleport", 					// StExt_DamageFlag_Blink
	"Stärkung", 					// StExt_DamageFlag_Buff
	"Schwächung", 					// StExt_DamageFlag_Debuff
	"Zeitlich begrenzter Effekt", 	// StExt_DamageFlag_Timed
	"Verwandlung", 					// StExt_DamageFlag_Transform
	"Golem", 						// StExt_DamageFlag_Golem
	"Dämon", 						// StExt_DamageFlag_Demon
	"Untoter", 						// StExt_DamageFlag_Undead
	"Reflexion", 					// StExt_DamageFlag_Reflect
	"Mensch", 						// StExt_DamageFlag_Human
	"Trank", 						// StExt_DamageFlag_Potion
	"Ork", 							// StExt_DamageFlag_Orc
	"Tier", 						// StExt_DamageFlag_Animal
	"Ziel", 						// StExt_DamageFlag_Target
	"Totem", 						// StExt_DamageFlag_Totem
	"Einzelziel", 					// StExt_DamageFlag_Single
	"Einfrieren", 					// StExt_DamageFlag_Freeze
	"Betäuben", 					// StExt_DamageFlag_Stun
	"Wurzeln", 						// StExt_DamageFlag_Roots
	"Kettenangriff",				// StExt_DamageFlag_Chain
	"Strom"							// StExt_DamageFlag_Stream
};

const string itrw_stext_stext_bow_l_name = "Einfacher Bogen";
const string itrw_stext_stext_bow_m_name = "Bogen";
const string itrw_stext_stext_bow_h_name = "Kampfbogen";

const string StExt_Str_DoCastAuras = "Automatisches Wirken von Auren";
const string StExt_Str_Corruption_BonusHeader = "Verderbnis Boni: ";
const string StExt_Str_Corruption_BonusStat[StExt_CorruptionBonus_Max] =
{
	"Leben (gesamt | auf nächster Stufe): ",
	"Mana (gesamt | auf nächster Stufe): ",
	"Intelligenz (gesamt | auf nächster Stufe): ",
	"Stärke (gesamt | auf nächster Stufe): ",
	"Geschicklichkeit (gesamt | auf nächster Stufe): ",
	"Ausweichen (gesamt | auf nächster Stufe): "
};

const string StExt_Str_Scrolmaking_No = "Anforderungen nicht erfüllt!";

const string StExt_Str_SummonGhost_Name = "Beschworener Geist";
const string StExt_Str_SummonBoneGolem_Name = "Beschworener Knochengolem";
const string StExt_Str_SummonShadowbeast_Name = "Beschworenes Schattenbiest";
const string StExt_Str_SummonShadowbeast_Fire_Name = "Beschworener Feuergeist";
const string StExt_Str_Summon_Troll_Name = "Beschworener Troll";
const string StExt_Str_SummonCrawler_Name = "Beschworener Crawler";
const string StExt_Str_SummonOster_Name = "Beschworener Snapper";

const string StExt_Str_TalisanRunen_Crait = "Rune zur Beschwörung von Krait herstellen";
const string StExt_Str_TalisanRunen_SummonGhost = "Rune zur Beschwörung eines Geistes herstellen";
const string StExt_Str_TalisanRunen_SummonBoneGolem = "Rune zur Beschwörung des Knochengolems herstellen";
const string StExt_Str_TalisanRunen_SummonShadowbeast = "Rune zur Beschwörung von Mrakoris herstellen";
const string StExt_Str_TalisanRunen_SummonShadowbeast_Fire = "Rune zur Beschwörung des Feuergeistes herstellen";
const string StExt_Str_TalisanRunen_Summon_Troll = "Rune zur Beschwörung eines Trolls herstellen";
const string StExt_Str_TalisanRunen_SummonCrawler = "Rune zur Beschwörung eines Crawlers herstellen";
const string StExt_Str_TalisanRunen_SummonOster = "Rune zur Beschwörung von Snapper herstellen";

const string StExt_Str_TalisanRunen_Summon_Electricgolem = "Rune zur Beschwörung des Äthergolems herstellen";
const string StExt_Str_TalisanRunen_PoisionCape = "Rune 'Gift-Aegis' herstellen";
const string StExt_Str_TalisanRunen_EarthCape = "Rune 'Erdkappe' herstellen";
const string StExt_Str_TalisanRunen_AirCape = "Rune 'Luft-Aegis' herstellen";
const string StExt_Str_TalisanRunen_DarkCape = "Rune 'Aegis der Dunkelheit' herstellen";
const string StExt_Str_TalisanRunen_LightingCape = "Rune 'Blitz-Aegis' herstellen";
const string StExt_Str_TalisanRunen_IceCape = "Rune 'Eis-Aegis' herstellen";
const string StExt_Str_TalisanRunen_FireCape = "Rune 'Feuer-Aegis' herstellen";

const string StExt_Str_TalisanRunen_Buff_Protection = "Segensrune herstellen - Schutz";
const string StExt_Str_TalisanRunen_Buff_Hp = "Segensrune herstellen - Vitalität";
const string StExt_Str_TalisanRunen_Buff_Stats = "Segensrune herstellen - Attribute";
const string StExt_Str_TalisanRunen_Buff_Regen = "Segensrune herstellen - Regeneration";
const string StExt_Str_TalisanRunen_Buff_Damage = "Segensrune herstellen - Schaden";
const string StExt_Str_TalisanRunen_Buff_Speed = "Segensrune herstellen - Geschwindigkeit";
const string StExt_Str_TalisanRunen_Buff_Dodge = "Segensrune herstellen - Ausweichen";
const string StExt_Str_TalisanRunen_Buff_Es = "Segensrune herstellen - Energieschild";
const string StExt_Str_TalisanRunen_Buff_MassRestore = "Massenheilungsrune herstellen";

const string StExt_Str_TalisanRunen_Debuff_Protection = "Fluchrune herstellen - Verwundbarkeit";
const string StExt_Str_TalisanRunen_Debuff_Stats = "Fluchrune herstellen - Schwächung";
const string StExt_Str_TalisanRunen_Debuff_Siphon = "Fluchrune herstellen - Lebensentzug";
const string StExt_Str_TalisanRunen_Debuff_Speed = "Fluchrune herstellen - Verlangsamung";
const string StExt_Str_TalisanRunen_Debuff_Lifetap = "Fluchrune herstellen - Lebensraub";
const string StExt_Str_TalisanRunen_Debuff_ReflectDamage = "Fluchrune herstellen - Eiserne Jungfrau";
const string StExt_Str_TalisanRunen_Debuff_ExtraDamage = "Fluchrune herstellen - Mehr Schaden";
const string StExt_Str_TalisanRunen_Debuff_Weaken = "Fluchrune herstellen - Schadensreduktion";

const string StExt_Str_Dia_SellBanditHead = "Banditenkopf.";
const string StExt_Str_StonedTrader_SellEnchanted = "Verzauberte Gegenstände verkaufen...";
const string StExt_Str_StonedTrader_SellEnchanted_Weap = "Waffe";
const string StExt_Str_StonedTrader_SellEnchanted_Armor = "Rüstung";
const string StExt_Str_StonedTrader_SellEnchanted_Jewelry = "Schmuck";
const string StExt_Str_StonedTrader_IdentifyItems = "Gegenstände identifizieren.";
const string StExt_Str_StonedTrader_IdentifyItems_ItmPrice = "Preis pro Gegenstand: ";
const string StExt_Str_StonedTrader_IdentifyItems_ItmPriceTotal = "Gesamt: ";
const string StExt_Str_IdentifiedItems = "Identifizierte Gegenstände: ";
const string StExt_Str_CorruptedPerkNotEnoughtLp = "Nicht genügend Schadenspunkte.";
const string StExt_Str_CorruptedPerk_DamagePoints = "Schadenspunkte: ";
const string StExt_Str_CorruptedPerk_DamageExp = "Zugefügter Schaden: ";
const string StExt_Str_Menu_CorruptedTouch = "[Weiterentwicklung 'Verderbte Berührung']";
const string StExt_Str_Config_CorruptionTouchExp = "Erfahrungsmultiplikator für den Perk 'Berührung der Verderbnis'";
const string StExt_Str_CorruptionTouchExp = "Erfahrung erhalten: ";
const string StExt_Str_Wasili_JunkTrade = "Allen möglichen Kram verkaufen";
const string StExt_Str_Saghita_PotionSell = "Tränke verkaufen";

const string StExt_Str_SummonsCountGlobalStat = "Slots für Beschwörungen:";

const string StExt_Str_Professions_Header = " -= Schriftrollen =- ";

const string StExt_Str_Profession_Name[StExt_ProfessionIndex_Max] = 
{
	"Schriftrollen herstellen",
	"Trankbrauen",
	"Verzauberung"
};

const string StExt_Str_Profession_Skill_Scrollmaking_Name[StExt_ScrollmakingSkillIndex_Max] = 
{
	"Einfache Schriftrollen",
	"Fortgeschrittene Schriftrollen",
	"Meisterliche Schriftrollen",
	"Effizienter Schreiber",
	"Schriftrollen der Feuermagie",
	"Schriftrollen der Wassermagie",
	"Schriftrollen der Elektromagie",
	"Schriftrollen der Luftmagie",
	"Schriftrollen der Erdmagie",
	"Schriftrollen der Lichtmagie",
	"Schriftrollen der Dunklen Magie",
	"Schriftrollen der Todesmagie",
	"Schriftrollen der Naturmagie",
	"Schriftrollen der Golemologie",
	"Schriftrollen der Dämonologie",
	"Schriftrollen der Nekromantie"
};

const string StExt_Str_Profession_Skill_Alchemy_Name[StExt_AlchemySkillIndex_Max] = 
{
	"-= ??? =-",
	"-= ??? =-",
	"-= ??? =-"
};

const string StExt_Str_Profession_Skill_Enchantment_Name[StExt_EnchantmentSkillIndex_Max] = 
{
	"-= ??? =-",
	"-= ??? =-",
	"-= ??? =-"
};

const string StExt_Str_Menu_CorruptedTouch_Luck = "Glück entwickeln";
const string StExt_Str_Menu_CorruptedTouch_Aura = "Aura entwickeln";
const string StExt_Str_Menu_CorruptedTouch_Stats = "Werte entwickeln";
const string StExt_Str_Menu_CorruptedTouch_Protection = "Verteidigung entwickeln";
const string StExt_Str_Menu_CorruptedTouch_Damage = "Schaden entwickeln";
const string StExt_Str_Menu_CorruptedTouch_Masteries = "Meisterschaften entwickeln";
const string StExt_Str_Menu_CorruptedTouch_Summons = "Beschwörungen entwickeln";

const string StExt_Str_Config_Diff_EnableRot_NightEncounters = "Aktiviere Nachtraider aus 'Straße der Prüfungen'";
const string StExt_Str_Config_Diff_EnableRot_Avengers = "Aktiviere Kopfgeldjäger aus 'Straße der Prüfungen'";
const string StExt_Str_Config_Diff_EnableRot_Bandits = "Aktiviere Banditen aus 'Straße der Prüfungen'";

const string StExt_Str_Config_ShowNpcFlags = "NPC-Flags anzeigen";
const string StExt_Str_Config_ShowNpcRank = "NPC-Rang anzeigen";
const string StExt_Str_Config_ShowNpcAbilities = "NPC-Fähigkeiten anzeigen";

const string StExt_Str_DamageBlocked = "Schaden geblockt!";
const string StExt_Str_DamageBlocked_Dodge = "Ausgewichen";
const string StExt_Str_DamageBlocked_Ignored = "Ignoriert";
const string StExt_Str_DamageBlocked_ArrowDeclined = "Projektil abgewehrt";
const string StExt_Str_DamageBlocked_SpellAbsorbed = "Zauber wurde absorbiert.";
const string StExt_Str_DamageBlocked_SpellReflected = "Zauber wurde abgewehrt.";

const string StExt_Str_Config_HideHelm = "Helm ausblenden";

const string StExt_Str_ForgetPerks = "Erlernte Talente verlernen";

const string StExt_Str_Bosper_MisslesSell = "(Magische Pfeile, Granaten usw. verkaufen)";
const string StExt_Str_Jora_MiskSell = "(Haushaltsgeräte verkaufen)";
const string StExt_Str_Harad_CoalSell = "(Schmiedewerkzeuge und Verbrauchsmaterialien verkaufen)";
const string StExt_Str_Kardif_FoodSell = "(Fleisch und andere Lebensmittel verkaufen)";
const string StExt_Str_Kardif_BoozeSell = "(Alkohol verkaufen)";

const string StExt_Str_AcceptHelp = "<Lesen bestätigen und Hinweise ausblenden>";
const string StExt_Str_HelpStrings[8] = 
{
	"Willkommen in der Mod EthernalBreeze",
	"[Haupttaste] des Mods ist standardmäßig [T] (sofern in den Einstellungen nicht geändert)",
	"Beim Drücken der [Haupttaste] öffnet sich das Mod-Menü bzw. der Dialog zur Anpassung des Mods.",
	"Beim Drücken von [Shift] + [Haupttaste] wird ein zusätzliches Menü mit den Charakterwerten geöffnet.",
	"Die Taste zum Aktivieren/Deaktivieren automatischer Auren ist standardmäßig [O] (sofern in den Einstellungen nicht geändert).",
	"Beim Drücken von [Shift] + [O] öffnet sich das grafische Konfigurationsmenü des Mods.",
	"",
	"Um dieses Fenster auszublenden, öffne das Mod-Menü und bestätige, dass du diese Nachricht gelesen hast."
};

const string StExt_Str_Config_Npc_InfusionHpMult = "Vitalitätsmodifikator für magische NPCs";
const string StExt_Str_Config_Npc_InfusionStatMult = "Attributsmodifikator für magische NPCs";
const string StExt_Str_Config_Npc_InfusionProtMult = "Verteidigungsmodifikator für magische NPCs";
const string StExt_Str_Config_Npc_InfusionDamMult = "Schadensmodifikator für magische NPCs";
const string StExt_Str_Config_Npc_InfusionEsMult = "Energieschild-Modifikator für magische NPCs";

const string StExt_Str_NewVersionMigrateNotify = "'EthernalBreeze'-Mod-Update";
const string StExt_Str_Absent = "Abwesend";

const string StExt_Str_ModMenu_ItemGeneratorPresetsSection = "Einstellungen für den Item-Generator laden...";
const string StExt_Str_ModMenu_DefaultItemGeneratorPreset = "Standard-Einstellungen für den Item-Generator";

const string StExt_Str_UserConfigsFuncNotFound = "Preset-Funktion nicht gefunden!";
const string StExt_Str_ModMenu_ExportCurrentConfigs = "Aktuelle Einstellungen exportieren... (wird verfügbar, wenn du das Spiel neu startest)";
const string StExt_Str_ExportCurrentConfigs_Failed = "Export der aktuellen Einstellungen fehlgeschlagen!";

const string StExt_Str_StonedTrader_OpenChests = "(Alle benannten Truhen öffnen)";
const string StExt_Str_StonedTrader_OpenChests_Open = "Geöffnete Truhen: ";
const string StExt_Str_StonedTrader_OpenChests_Nothing = "Keine Truhen vorhanden!";

const string StExt_Str_Dragomir_CBowSell = "(Verkaufe Armbrüste für 25 % ihres Wertes)";
const string StExt_Str_Matteo_JewSell = "(Verkaufe Schmuck für 25 % seines Wertes)";

const string StExt_Str_GiveRhit_Rhit = "Rhetorik + ";
const string StExt_Str_GiveRhit_Total = " (Gesamt: ";

const string StExt_Str_ChoiceSidWeap_Bow = "(Bogen)";
const string StExt_Str_ChoiceSidWeap_Magic = "(Magie)";

const string itar_stext_godarmor_name = "Rüstung des Auserwählten";

const string StExt_Str_AverageWeapDamageInfo_Meele = "Erwarteter Nahkampfschaden: ";
const string StExt_Str_AverageWeapDamageInfo_Range = "Erwarteter Fernkampfschaden: ";
const string StExt_Str_AverageWeapDamageInfo_Magic = "Erwarteter Runenschaden: ";

const string StExt_Str_Config_DamageReductionExpRate = "Erfahrungsgewinnrate für Schulen bei reduziertem Schaden";
const string StExt_Str_RodBeatenLogEntry_Fix = "Ich habe Rod besiegt. Jetzt muss ich meine Stärke nicht mehr beweisen, indem ich sein Schwert hebe.";

const string StExt_Str_Config_Npc_MagicInfusion_HumansExtraChance = "Zusätzliche Chance auf magische Infusion bei Menschen";
const string StExt_Str_Config_Npc_MagicInfusion_BossesExtraChance = "Zusätzliche Chance auf magische Infusion bei Bossen";

const string StExt_Str_CorruptionLevelUpMsg = "Die Verderbnis schreitet voran...";

const string StExt_Str_Config_MasteryExpMult_Fire = "Erfahrungsgewinn-Multiplikator für Feuermagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Ice = "Erfahrungsgewinn-Multiplikator für Wassermagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Electric = "Erfahrungsgewinn-Multiplikator für Elektromagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Air = "Erfahrungsgewinn-Multiplikator für Luftmagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Earth = "Erfahrungsgewinn-Multiplikator für Erdmagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Light = "Erfahrungsgewinn-Multiplikator für Lichtmagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Dark = "Erfahrungsgewinn-Multiplikator für Dunkelmagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Death = "Erfahrungsgewinn-Multiplikator für Todesmagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Life = "Erfahrungsgewinn-Multiplikator für Naturmagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Golem = "Erfahrungsgewinn-Multiplikator für Golemologie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Demon = "Erfahrungsgewinn-Multiplikator für Dämonologie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Necro = "Erfahrungsgewinn-Multiplikator für Nekromantie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Shaman = "Erfahrungsgewinn-Multiplikator für 'Kunst der Magie'-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_MartialArts = "Erfahrungsgewinn-Multiplikator für 'Kunst des Krieges'-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Agile = "Erfahrungsgewinn-Multiplikator für 'Kunst der Verteidigung'-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Archery = "Erfahrungsgewinn-Multiplikator für 'Kunst der Schützen'-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Blood = "Erfahrungsgewinn-Multiplikator für Blutmagie-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_FistFight = "Erfahrungsgewinn-Multiplikator für Faustkampf-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Aura = "Erfahrungsgewinn-Multiplikator für Aura-Meisterschaft";
const string StExt_Str_Config_MasteryExpMult_Traps = "Erfahrungsgewinn-Multiplikator für Fallenmeisterschaft";
const string StExt_Str_Config_MasteryExpMult_Poision = "Erfahrungsgewinn-Multiplikator für Giftmeisterschaft";

const string StExt_Str_Config_EnableWorldRandomization_ByTimeEvents = "Weltzufallsgenerierung nach Zeitereignissen aktivieren";


//------------------------------------------------------------------------
//							 Build 7.0.0
//------------------------------------------------------------------------

const string StExt_Str_itpo_damageup_01_Desc = "Erhöht den Nahkampfschaden um 10%";
const string StExt_Str_itpo_damageup_02_Desc = "Erhöht den Nahkampfschaden um 20%";
const string StExt_Str_itpo_damageup_03_Desc = "Erhöht den Nahkampfschaden um 30%";
const string StExt_Str_itpo_damageup_Time_Desc = "Wirkdauer: 10 Minuten";

const string StExt_Str_ItemSpecialDamage = "Besonderer Schaden: ";
const string StExt_Str_ItemSpecialProtection = "Besonderer Schutz: ";

const string StExt_Str_Config_MenuPauseOnShow = "Spiel pausieren beim Öffnen des Mod-Menüs";
const string StExt_Str_Config_MenuScrollMult = "Scroll-Geschwindigkeit im Mod-Menü";

const string StExt_Str_ExtraStaminaBonus_Toatal = " (Gesamt: ";

const string StExt_Str_ItPo_Concentration_Proto = "Konzentrationstrank";
const string StExt_Str_ItPo_Concentration_01 = "Schwacher Konzentrationstrank";
const string StExt_Str_ItPo_Concentration_02 = "Konzentrationstrank";
const string StExt_Str_ItPo_Concentration_03 = "Starker Konzentrationstrank";

const string StExt_Str_ItPo_Concentration_Desc =
"Erhöht vorübergehend Wahrnehmung und Reaktionsgeschwindigkeit.";
const string StExt_Str_ItPo_Concentration_Power = "Effektstärke (%):";

const string StExt_Str_ModMenu_ConsumePerm = "[Alle Bonus-Tränke/Nahrung verwenden …]";
const string StExt_Str_Dia_ConsumePerm = "Verwende '";

const string StExt_Str_On = "An";
const string StExt_Str_Off = "Aus";

const string StExt_Str_Config_Category_Name[7] =
{
	"Schwierigkeit",
	"NSCs",
	"Glück",
	"Randomisierung",
	"Erfahrung",
	"Interface",
	"Sonstiges"
};

const string StExt_ConfigsMenu_TabName[2] = 
{
	"Einstellungen",
	"Informationen"
};

const string StExt_Str_Menu_CraftButtonText = "Herstellen";
const string StExt_Str_Menu_CraftType_TabText_All = "Alles";
const string StExt_Str_Menu_CraftType_TabsText[StExt_ReceiptType_Max] = 
{
	"Sonstiges",
	"Rüstungen",
	"Nahkampfwaffen",
	"Fernkampfwaffen",
	"Schmuck",
	"Magie"
};

const string StExt_Str_Config_Alch_DisplayOnScreen ="Alchemie-Boni auf dem Bildschirm anzeigen";
const string StExt_Str_Config_Alch_PosX ="Position der Alchemie-Boni (Horizontal)";
const string StExt_Str_Config_Alch_PosY ="Position der Alchemie-Boni (Vertikal)";
const string StExt_Str_Config_Artifact_DisplayOnScreen ="Artefakt-Informationen auf dem Bildschirm anzeigen";
const string StExt_Str_Config_Artifact_PosX ="Position der Artefakt-Informationen (Horizontal)";
const string StExt_Str_Config_Artifact_PosY ="Position der Artefakt-Informationen (Vertikal)";
const string StExt_Str_Config_Aura_DisplayOnScreen ="Aktive Auren auf dem Bildschirm anzeigen";
const string StExt_Str_Config_Aura_PosX ="Position der aktiven Auren (Horizontal)";
const string StExt_Str_Config_Aura_PosY ="Position der aktiven Auren (Vertikal)";
const string StExt_Str_Config_EsBar_DefaultPos ="Energieschild in Standardposition anzeigen";
const string StExt_Str_Config_EsBar_PosX ="Position des Energieschilds (Horizontal)";
const string StExt_Str_Config_EsBar_PosY ="Position des Energieschilds (Vertikal)";
const string StExt_Str_Config_ItemMenu_PosX ="Position der Gegenstandsinformationen (Horizontal)";
const string StExt_Str_Config_ItemMenu_PosY ="Position der Gegenstandsinformationen (Vertikal)";
const string StExt_Str_Config_MsgTray_PosX ="Position des Nachrichtenlogs (Horizontal)";
const string StExt_Str_Config_MsgTray_PosY ="Position des Nachrichtenlogs (Vertikal)";
const string StExt_Str_Config_EnableFemaleSkin ="Weibliches Skin aktivieren";
const string StExt_Str_Config_EnableFemaleSkin_AlwaysWig ="Weibliches Skin aktivieren – mit Perücke";
const string StExt_Str_Config_EnableFemaleSkin_DemonLook ="Weibliches Skin aktivieren – dämonisches Aussehen";

const string StExt_Str_Karma_Innos = "Karma Innos: ";
const string StExt_Str_Karma_Beliar = "Karma Beliar: ";
const string StExt_Str_Karma_Adanos = "Karma Adanos: ";

const string StExt_Str_ItemPreffixName[299] = 
{
	"Dornig",
	"Strahlend",
	"Flammend",
	"Stabil",
	"Verstärkt",
	"Skandalös",
	"Monumental",
	"Unterirdisch",
	"Jagd-",
	"Erwählt",
	"Entfesselt",
	"Vernichtend",
	"Gerippt",
	"Azurblau",
	"Aufgequollen",
	"Untauglich",
	"Abscheulich",
	"Unerhört",
	"Nächtlich",
	"Faulig",
	"Niedergestreckt",
	"Glänzend",
	"Wurmstichig",
	"Unsichtbar",
	"Senil",
	"Verdorben",
	"Leichen-",
	"Belebend",
	"Glühend",
	"Gespannt",
	"Lockend",
	"Reinigend",
	"Unheimlich",
	"Verkohlt",
	"Fremd",
	"Flüsternd",
	"Zitternd",
	"Unheilvoll",
	"Alchemistisch",
	"Reich",
	"Stürmisch",
	"Wild",
	"Ewig",
	"Schuldig",
	"Beunruhigt",
	"Gips-",
	"Sündig",
	"Weitsichtig",
	"Dilettantisch",
	"Dolomit-",
	"Betörend",
	"Vergoren",
	"Eingedickt",
	"Üppig",
	"Edel",
	"Verängstigt",
	"Prüfend",
	"Austrocknend",
	"Brodelnd",
	"Klinisch",
	"Labor-",
	"Masochistisch",
	"Trüb",
	"Üppig",
	"Ängstlich",
	"Gefährlich",
	"Entleerend",
	"Erfahren",
	"Schwächend",
	"Umsichtig",
	"Vorsichtig",
	"Gekocht",
	"Benommen",
	"Überrumpelt",
	"Panisch",
	"Schäumend",
	"Nahrhaft",
	"Vorbereitet",
	"Zur Hand",
	"Vorbedeutend",
	"Verbrecherisch",
	"Verwesend",
	"Rudimentär",
	"Selbstquälerisch",
	"Karg",
	"Stumpfsinnig",
	"Geizig",
	"Eiskalt",
	"Schmachtend",
	"Chemisch",
	"Sprudelnd",
	"Großzügig",
	"Experimentell",
	"Ungezähmt",
	"Gefärbt",
	"Schmutzig",
	"Rein",
	"Gewaschen",
	"Poliert",
	"Zerbeult",
	"Roh",
	"Rostig",
	"Zerbrochen",
	"Heimtückisch",
	"Widerlich",
	"Weinerlich",
	"Abgeschabt",
	"Aufgedreht",
	"Verworren",
	"Arglistig",
	"Dämonisch",
	"Göttlich",
	"Schändlich",
	"Erschlagen",
	"Auferstanden",
	"Gekreuzigt",
	"Zum Leben erwacht",
	"Verloren",
	"Bärtig",
	"Kahl",
	"Langweilig",
	"Interessant",
	"Unerbittlich",
	"Verbeult",
	"Schleimig",
	"Klebrig",
	"Glitschig",
	"Taub",
	"Schweigsam",
	"Elastisch",
	"Weich",
	"Hart",
	"Rotznasig",
	"Scheußlich",
	"Schwer",
	"Tot",
	"Neblig",
	"Ungeheuerlich",
	"Blutig",
	"Gehärtet",
	"Heiß",
	"Giftig",
	"Versengt",
	"Steinern",
	"Golden",
	"Silbern",
	"Bronzen",
	"Eisern",
	"Kupfern",
	"Marmor-",
	"Verwittert",
	"Rituell",
	"Verzaubert",
	"Verflucht",
	"Geisterhaft",
	"Magisch",
	"Zauberhaft",
	"Uralt",
	"Mythisch",
	"Heilig",
	"Gesegnet",
	"Stinkend",
	"Tödlich",
	"Eisig",
	"Versengend",
	"Zerstört",
	"Verwüstet",
	"Unfruchtbar",
	"Fruchtbar",
	"Gequält",
	"Ausgezehrt",
	"Mächtig",
	"Unverwundbar",
	"Uneinnehmbar",
	"Wachsam",
    "Vergessen",
	"Verschwindend",
	"Kunstvoll",
	"Entstellt",
	"Besudelt",
	"Leuchtend",
	"Feindselig",
	"Groß",
	"Bezaubernd",
	"Gebrochen",
	"Furchtbar",
	"Vergammelt",
	"Entfesselt",
	"Drohlich",
	"Geachtet",
	"Erwählt",
	"Verbittert",
	"Verkommen",
	"Verloren",
	"Irrend",
	"Vergessen",
	"Verriegelt",
	"Verschlossen",
	"Eingekerkert",
	"Blendend",
	"Donnernd",
	"Stürmisch",
	"Geerdet",
	"Gescheitert",
	"Versunken",
	"Erhoben",
	"Zerbrochen",
	"Riesig",
	"Übernatürlich",
	"Geheimnisvoll",
	"Verstrickt",
	"Rätselhaft",
	"Geheim",
	"Fesselnd",
	"Jenseitig",
	"Belebend",
	"Düster",
	"Dämmerig",
	"Magnetisch",
	"Psychisch",
	"Telepathisch",
	"Unheimlich",
	"Hypnotisch",
	"Medial",
	"Unbekannt",
	"Unsichtbar",
	"Unfassbar",
	"Unerkannt",
	"Unergründlich",
	"Formlos",
	"Endlos",
	"Unermesslich",
	"Grenzenlos",
	"Unerreichbar",
	"Unvergesslich",
	"Unglaublich",
	"Fantastisch",
	"Gewaltig",
	"Kolossal",
	"Gigantisch",
	"Titanisch",
	"Unermesslich",
	"Gewaltig",
	"Episch",
	"Legendär",
	"Heldenhaft",
	"Tapfer",
	"Ruhmreich",
	"Erhaben",
	"Edel",
	"Stolz",
	"Weise",
	"Klug",
	"Geistesgewandt",
	"Genial",
	"Scharfsinnig",
	"Kühn",
	"Wagemutig",
	"Kaltblütig",
	"Entschlossen",
	"Unerschütterlich",
	"Furchtlos",
	"Unermüdlich",
	"Unermüdlich",
	"Unersättlich",
	"Durstig",
	"Brennend",
	"Unaufhaltsam",
	"Unerbittlich",
	"Unbezwingbar",
	"Unnachgiebig",
	"Unversöhnlich",
	"Unbesiegbar",
	"Unbezwingbar",
	"Unüberwindlich",
	"Unvollendet",
	"Unwirklich",
	"Undurchdringlich",
	"Unpassierbar",
	"Unerreichbar",
	"Unantastbar",
	"Unerschütterlich",
	"Unveränderlich",
	"Unvermeidlich",
	"Unzuverlässig",
	"Falsch",
	"Unbeständig",
	"Unheilbar",
	"Defekt",
	"Unbeneidenswert",
	"Unerbittlich",
	"Unumkehrbar",
	"Ungebrochen",
	"Unerschütterlich",
	"Unstillbar",
	"Unbeschreiblich",
	"Unerklärlich",
	"Unerklärbar",
	"Unaussprechlich"
};

const string StExt_Str_ItemAffixName[407] = 
{
	"Bestie",
	"Aas",
	"Strudel",
	"Köter",
	"Toter",
	"Kakerlake",
	"Goliath",
	"Ichthyaner",
	"Bastard",
	"Genie",
	"Wurdalak",
	"Blinder",
	"Landstreicher",
	"Rabe",
	"Dämon",
	"Golem",
	"Verfall",
	"Kadav(er)",
	"Gehenkter",
	"Teufel",
	"Fuchs",
	"Bettler",
	"Suchender",
	"Beschwörer",
	"Skorpion",
	"Robbe",
	"Ertrunkener",
	"Kette",
	"Geist",
	"Wind",
	"Monster",
	"Eiter",
	"Skelett",
	"Gespenst",
	"Schmied",
	"Missgeburt",
	"Henker",
	"Schurke",
	"Hirte",
	"Champion",
	"Elf",
	"Gehirnfresser",
	"Kannibale",
	"Menschenfresser",
	"Konstrukt",
	"Frucht",
	"Amulett",
	"Koloss",
	"Dieb",
	"Mörder",
	"Schlächter",
	"Held",
	"Katze",
	"Erzengel",
	"Gebieter",
	"Fledermaus",
	"Strudel",
	"Alchemist",
	"Jäger",
	"Wirt",
	"Käfer",
	"Wurm",
	"Parasit",
	"Magier",
	"Gelehrter",
	"Auge",
	"Ungeheuer",
	"Scharfrichter",
	"Lamm",
	"Jünger",
	"Kröte",
	"Drache",
	"Herrscher",
	"König",
	"Regent",
	"Heide",
	"Taugenichts",
	"Säufer",
	"Sektierer",
	"Mechanismus",
	"Papagei",
	"Schmierlappen",
	"Gelübde",
	"Mahl",
	"Vampir",
	"Bock",
	"Frühstück",
	"Siechtum",
	"Flügel",
	"Schutz",
	"Asche",
	"Kriecher",
	"Spinne",
	"Wolf",
	"Koffer",
	"Elixier",
	"Gift",
	"Rest",
	"Stück",
    "Bastschuh",
	"Schild",
	"Schwert",
	"Bogen",
	"Axt",
	"Stab",
	"Stilett",
	"Schöpfer",
	"Wurzelknolle",
	"Flaum",
	"Irrer",
	"Sklave",
	"Blatt",
	"Baumstumpf",
	"Getränk",
	"Löwe",
	"Taube",
	"Geschwür",
	"Schnitt",
	"Riss",
	"Hieb",
	"Hammer",
	"Pony",
	"Schädling",
	"Pferd",
	"Stinker",
	"Zahn",
	"Hauer",
	"Maurer",
	"Ramme",
	"Widder",
	"Eber",
	"Höfisch",
	"Meister",
	"Geselle",
	"Lehrling",
	"Schmähredner",
	"Krebs",
	"Messer",
	"Koch",
	"Abgrund",
	"Friedhof",
	"Teppich",
	"Vorhang",
	"Händler",
	"Greis",
	"Alter",
	"Metzger",
	"Wächter",
	"Paladin",
	"Guru",
	"Lord",
	"Infanterist",
	"Bogenschütze",
	"Strahl",
	"Quadrat",
	"Kugel",
	"Feuer",
	"Träger",
	"Lastenträger",
	"Diener",
	"Viehhirt",
	"Häretiker",
	"Abtrünniger",
	"Suppe",
	"Biber",
	"Strom",
	"Apotheker",
	"Rohrreiniger",
	"Steinmetz",
	"Hof",
	"Kappe",
	"Schneesturm",
	"Stiel",
	"Faust",
	"Schnitter",
	"Barbar",
	"Kammerherr",
	"Rattenfänger",
	"Spiegel",
	"Glas",
	"Robe",
	"Laterne",
	"Mist",
	"Stein",
	"Eiche",
	"Esche",
	"Eis",
	"Entladung",
	"Dolch",
	"Marmor",
	"Säbel",
	"Sichel",
	"Rasiermesser",
	"Skalpell",
	"Licht",
	"Finsternis",
	"Wirbelsturm",
	"Umwallung",
	"Schießpulver",
    "Wolke",
	"Regen",
	"Sturm",
	"Gewitter",
	"Blitz",
	"Donner",
	"Nebel",
	"Dunkel",
	"Aufblitzen",
	"Morgenröte",
	"Sonnenuntergang",
	"Morgengrauen",
	"Sumpfbewohner",
	"Waldläufer",
	"Pilz",
	"Wurzel",
	"Zweig",
	"Frucht",
	"Wasser",
	"Fluss",
	"Teich",
	"See",
	"Ozean",
	"Lagune",
	"Ufer",
	"Hafen",
	"Flut",
	"Ebbe",
	"Welle",
	"Schaum",
	"Riff",
	"Koralle",
	"Wal",
	"Hai",
	"Fisch",
	"Krake",
	"Tintenfisch",
	"Seemann",
	"Kapitän",
	"Admiral",
	"Pirat",
	"Freibeuter",
	"Korsar",
	"Brigg",
	"Fregatte",
	"Schiff",
	"Schoner",
	"Yacht",
	"Floß",
	"Boot",
	"Kanu",
	"Baumrindenboot",
	"Kutter",
	"Motor",
	"Ruder",
	"Anker",
	"Segel",
	"Steuerrad",
	"Mast",
	"Strudel",
	"Galeere",
	"Kutsche",
	"Mannschaft",
	"Wagen",
	"Karren",
	"Schlitten",
	"Rad",
	"Achse",
	"Pedal",
	"Treibstoff",
	"Stern",
	"Planet",
	"Meteor",
	"Asteroid",
	"Komet",
	"Trabanten",
	"Kosmos",
	"Galaxie",
	"Universum",
	"Welt",
	"Zivilisation",
	"Zeitalter",
	"Ära",
	"Jahrhundert",
	"Jahr",
	"Monat",
	"Woche",
	"Tag",
	"Stunde",
	"Minute",
	"Sekunde",
	"Augenblick",
	"Funke",
	"Zündfunke",
	"Flamme",
	"Kohle",
	"Asche",
	"Handvoll",
	"Prise",
	"Splitter",
    "Tropfen",
	"Eisen",
	"Silber",
	"Gold",
	"Platin",
	"Zinn",
	"Kupfer",
	"Aluminium",
	"Titan",
	"Quecksilber",
	"Feuerstein",
	"Phosphor",
	"Magnesium",
	"Kohlenstoff",
	"Sauerstoff",
	"Stickstoff",
	"Wasserstoff",
	"Helium",
	"Argon",
	"Neon",
	"Xenon",
	"Radon",
	"Polonium",
	"Thorium",
	"Uran",
	"Plutonium",
	"Viper",
	"Schlange",
	"Kobra",
	"Anakonda",
	"Natter",
	"Eidechse",
	"Krokodil",
	"Alligator",
	"Schildkröte",
	"Ameise",
	"Biene",
	"Wespe",
	"Hummel",
	"Mücke",
	"Fliege",
	"Heuschrecke",
	"Schmetterling",
	"Heuschrecke",
	"Raupe",
	"Blattlaus",
	"Blutegel",
	"Qualle",
	"Garnele",
	"Hummer",
	"Languste",
	"Auster",
	"Miesmuschel",
	"Kamm",
	"Seegurke",
	"Delfin",
	"Schwertwal",
	"Walross",
	"Elefant",
	"Giraffe",
	"Nashorn",
	"Nilpferd",
	"Zebra",
	"Gazelle",
	"Antilope",
	"Büffel",
	"Fuchs",
	"Bär",
	"Dachs",
	"Otter",
	"Nerz",
	"Murmeltier",
	"Waschbär",
	"Hirsch",
	"Elch",
	"Reh",
	"Norden",
	"Süden",
	"Westen",
	"Osten",
	"Kompass",
	"Magnet",
	"Nadel",
	"Faden",
	"Stoff",
	"Leinen",
	"Seide",
	"Baumwolle",
	"Wolle",
	"Pelz",
	"Leder",
	"Wildleder",
	"Samt",
	"Atlas",
	"Brokat",
	"Jeans",
	"Serge",
	"Knopf",
	"Verschluss",
	"Schnur",
	"Haarnadel",
	"Haken",
	"Fingerhut",
	"Lasche",
	"Stiefel",
	"Schuh",
	"Stiefelette",
	"Kackvogel"
};

const string StExt_Str_ItemSuffixName[363] = 
{
	"Salamander",
	"Böen",
	"Götter",
	"Älteste",
	"Formationen",
	"Unterwelt",
	"Erlösung",
	"Würmer",
	"Eidechsen",
	"Wonnen",
	"Überfluss",
	"Verbannung",
	"Siegel",
	"Wolken",
	"Skandal",
	"Kämpfer",
	"Strudel",
	"Troll",
	"Teufelei",
	"Erfrierung",
	"Verwesung",
	"Tod",
	"Fund",
	"Klagen",
	"Schändung",
	"Leiden",
	"Tödlichkeit",
	"Entwicklung",
	"Eifer",
	"Raserei",
	"Blutverlust",
	"Verzauberung",
	"Ordnung",
	"Zuflucht",
	"Ungeheuer",
	"Verwundung",
	"Entropie",
	"List",
	"Weissagung",
	"Widerstand",
	"Effizienz",
	"Vernichtung",
	"Widerstandskraft",
	"Schlacht",
	"Untergang",
	"Mystik",
	"Geist",
	"Runen",
	"Ausbildung",
	"Fanatismus",
	"Umzäunung",
	"Galle",
	"Barmherzigkeit",
	"Albatros",
	"Beluga",
	"Unaufhörlichkeit",
	"Schlächter",
	"Sumpfmoos",
	"Flöhe",
	"Gürteltier",
	"Sturmvogel",
	"Zauberer",
	"Absaugung",
	"Taube",
	"Genüge",
	"Igel",
	"Härte",
	"Absperrung",
	"Beschwörer",
	"Versiegelung",
	"Abschluss",
	"Erlöschen",
	"Heilung",
	"Isolation",
	"Karpfen",
	"Hexer",
	"Kristall",
	"Blutvergießen",
	"Aderlass",
	"Nekromant",
	"Talisman",
	"Überfluss",
	"Linderung",
	"Begrenzung",
	"Entleerung",
	"Befreiung",
	"Trockenlegung",
	"Wespen",
	"Ableitung",
	"Abscheidung",
	"Versetzung",
	"Geweihten",
	"Jünger",
	"Beständigkeit",
	"Hindernis",
	"Prisma",
	"Zufügung",
	"Gegengewicht",
	"Flammender Runen",
	"Regenbogen",
	"Abrechnung",
	"Massaker",
	"Selbstbeherrschung",
	"Stinktier",
	"Diener",
	"Milderung",
	"Berührung",
	"Beruhigung",
	"Stabilisierung",
	"Härte",
	"Befeuchtung",
	"Beharrlichkeit",
	"Sturheit",
	"Demut",
	"Erschöpfung",
	"Schüler",
	"Zauberer",
	"Großzügigkeit",
	"Hummel",
	"Hass",
    "Ksardas",
	"Vatras",
	"Pyrokar",
	"Myr",
	"Myrtana",
	"Erstickung",
	"Verlust",
	"Ende",
	"Mada",
	"Andre",
	"Constantino",
	"Harad",
	"Matteo",
	"Bosper",
	"Torbena",
	"Ignaz",
	"Zurisa",
	"Wahnsinn",
	"Krankheit",
	"Schmerz",
	"Gräuel",
	"Agonie",
	"Luft",
	"Knechtschaft",
	"Gehirn",
	"Schädel",
	"Knochen",
	"Herz",
	"Neubeginn",
	"Schweigen",
	"Stille",
	"Dunkelheit",
	"Leere",
	"Finsternis",
	"Licht",
	"Schatten",
	"Abgründe",
	"Nacht",
	"Sterne",
	"Mond",
	"Sonne",
	"Asche",
	"Staub",
	"Reif",
	"Frost",
	"Eis",
	"Schnee",
	"Kälte",
	"Sturm",
	"Wirbel",
	"Wind",
	"Böe",
	"Donner",
	"Blitze",
	"Unwetter",
	"Golem",
	"Elementar",
	"Titan",
	"Gigant",
	"Drache",
	"Wolf",
	"Tiger",
	"Löwe",
	"Panther",
	"Bär",
	"Wolfsmensch",
	"Phönix",
	"Gargoyle",
	"Banshee",
	"Vampir",
	"Lich",
	"Skelett",
	"Geist",
	"Dämon",
	"Engel",
	"Erzengel",
	"Gott",
	"Lord",
	"Kaiser",
	"König",
	"Fürst",
	"Despot",
	"Gebieter",
	"Herr",
	"Magier",
	"Paladin",
	"Kreuzträger",
	"Tempelwächter",
	"Kämpfer",
	"Ritter",
	"Samurai",
	"Ninja",
	"Assassine",
	"Spion",
	"Meister",
	"Lehrer",
	"Adept",
	"Novize",
	"Geweihter",
	"Gladiator",
	"Krieger",
	"Beschützer",
	"Schild",
	"Schwert",
	"Axt",
	"Speer",
	"Hammer",
	"Armbrust",
	"Bogen",
	"Dolch",
	"Klinge",
	"Streitaxt",
	"Streitkolben",
	"Stab",
	"Zepter",
	"Buch",
	"Manuskript",
	"Foliant",
	"Schriftrolle",
	"Zauber",
    "Tränke",
	"Elixiere",
	"Zutaten",
	"Kräuter",
	"Pilze",
	"Wurzeln",
	"Blüten",
	"Samen",
	"Haie",
	"Wälder",
	"Wüsten",
	"Oasen",
	"Vulkane",
	"Flüsse",
	"Seen",
	"Meere",
	"Ozeane",
	"Sümpfe",
	"Moraste",
	"Lagunen",
	"Atlantis",
	"Walhall",
	"Eden",
	"Paradies",
	"Hallen",
	"Burg",
	"Palast",
	"Festung",
	"Zitadelle",
	"Bastion",
	"Türme",
	"Felsen",
	"Berge",
	"Gipfel",
	"Klippen",
	"Abgründe",
	"Abstürze",
	"Verzweiflung",
	"Sturz",
	"Schicksalsschlag",
	"Schicksal",
	"Karma",
	"Vergeltung",
	"Sühne",
	"Trauer",
	"Tränen",
	"Sehnsucht",
	"Mitleid",
	"Zorn",
	"Raserei",
	"Hass",
	"Rache",
	"Vergeltung",
	"Entsetzen",
	"Furcht",
	"Zittern",
	"Unruhe",
	"Erwartung",
	"Hoffnung",
	"Träume",
	"Begehren",
	"Wille",
	"Kraft",
	"Macht",
	"Erhabenheit",
	"Edelmut",
	"Ehre",
	"Ruhm",
	"Tugend",
	"Mut",
	"Tapferkeit",
	"Kühnheit",
	"Entschlossenheit",
	"Ausdauer",
	"Geduld",
	"Standhaftigkeit",
	"Unbeugsamkeit",
	"Konzentration",
	"Weisheit",
	"Wissen",
	"Erkenntnis",
	"Erleuchtung",
	"Intuition",
	"Einsicht",
	"Klarheit",
	"Reinheit",
	"Keuschheit",
	"Unschuld",
	"Geheimnis",
	"Magie",
	"Wunder",
	"Göttlichkeit",
	"Gerechtigkeit",
	"Rechtsprechung",
	"Gesetz",
	"Harmonie",
	"Gleichgewicht",
	"Wahrheit",
	"Güte",
	"Böse",
	"Finsternis",
	"Chaos",
	"Zerstörung",
	"Schöpfung",
	"Sein",
	"Wesen",
	"Elemente",
	"Natur",
	"Universum",
	"Kosmos",
	"Galaxien",
	"Fäulnis",
	"Anomalien",
	"Kataklysmus",
	"Apokalypse",
	"Armageddon",
	"Jüngster Tag",
	"Weltende",
	"Wiedergeburt",
	"Renaissance",
	"Erwachen",
	"Auferstehung",
	"Erleuchtung"
};

const string StExt_Str_ItemSpecialName[2] = 
{
	"", ""
};

const string StExt_Str_TimedEffect_Name[StExt_TimedEffect_Index_Max] = 
{
	"Schaden über Zeit",
	"Lebensregeneration",
	"Manaregeneration",
	"Regeneration des Energieschilds",
	"Ausdauerregeneration",
	"Bonus auf Lebensenergie",
	"Bonus auf Mana",
	"Bonus auf Energieschild",
	"Bonus auf Ausdauer",
	"Bonus auf Stärke",
	"Bonus auf Geschicklichkeit",
	"Bonus auf Geschwindigkeit",
	"Schutz gegen alles",
	"Schutz gegen Wucht",
	"Schutz gegen Schneiden",
	"Schutz gegen Feuer",
	"Schutz gegen Pfeile",
	"Schutz gegen Magie",
	"Schutz gegen Stich",
	"Schutz gegen Sturz",
	"Widerstand gegen alles",
	"Widerstand gegen Flächenwirkung",
	"Widerstand gegen Wucht",
	"Widerstand gegen Schneiden",
	"Widerstand gegen Feuer",
	"Widerstand gegen Pfeile",
	"Widerstand gegen Magie",
	"Widerstand gegen Stich",
	"Widerstand gegen Sturz",
	"Bonus auf Ausweichen",
	"Bonus auf Trefferchance",
	"Schadensbonus (Wucht)",
	"Schadensbonus (Schneiden)",
	"Schadensbonus (Feuer)",
	"Schadensbonus (Rückstoß)",
	"Schadensbonus (Magie)",
	"Schadensbonus (Stich)",
	"Schadensbonus (Gift)",
	"Schadensbonus (Nahkampf)",
	"Schadensbonus (Fernkampf)",
	"Schadensbonus (Zauber)",
	"Dauer von Schadenseffekten",
	"Schadensbonus (Wucht | DoT)",
	"Schadensbonus (Schneiden | DoT)",
	"Schadensbonus (Feuer | DoT)",
	"Schadensbonus (Rückstoß | DoT)",
	"Schadensbonus (Magie | DoT)",
	"Schadensbonus (Stich | DoT)",
	"Schadensbonus (Gift | DoT)",
	"Bonus auf Intelligenz",
	"Schadensbonus",
	"Schadensbonus (DoT)",
	"Schadensreflexion",
	"Schadensreflexion (Wucht)",
	"Schadensreflexion (Schnitt)",
	"Schadensreflexion (Feuer)",
	"Schadensreflexion (Rückstoß)",
	"Schadensreflexion (Magie)",
	"Schadensreflexion (Stich)",
	"Schadensreflexion (Gift)",
	"Widerstand gegen Schaden über Zeit",
	"Widerstand gegen reflektierten Schaden",
	"Erhebungseffekt",
	"Flammenmantel",
	"Frostmantel",
	"Blitzmantel",
	"Schattenmantel",
	"Luftmantel",
	"Erdmantel",
	"Giftmantel",
	"Allgemeine Regeneration",
	"Allgemeiner Schadensbonus",
	"Bonus auf Stärke und Geschicklichkeit",
	"Fluch – Verringerte Verteidigung",
	"Fluch – Verringerte Attribute",
	"Fluch – Lebensentzug",
	"Fluch – Verlangsamung",
	"Fluch – Lebensblockade",
	"Fluch – Eiserne Jungfrau",
	"Fluch – Altersschwäche",
	"Fluch – Schwächung"
};


// ---------------------------------------------------------------------------------
//										WIP
// ---------------------------------------------------------------------------------

const string StExt_Str_ReceiptInfo_Name[2] =
{
"",
""
};

const string StExt_Str_ReceiptInfo_Description[2] =
{
"",
""
};




